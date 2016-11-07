<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
        <label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}] [{if $paymentmethod->fAddPaymentSum != 0}]([{$paymentmethod->fAddPaymentSum}] [{$currency->sign}])[{/if}]</b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        <script src="[{$oViewConf->fcpoGetModuleJsPath('jquery-1.10.1.min.js')}]"></script>
        <script src="[{$oViewConf->fcpoGetModuleJsPath()}]lightview/lightview.js"></script>
        <input type="hidden" name="fcpo_mode_[{$sPaymentID}]" value="[{$paymentmethod->fcpoGetOperationMode()}]">
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="FCPO_PAYOLUTION_ACCOUNTHOLDER"}]</label>
            <div class="col-lg-9">
                <input class="form-control js-oxValidate js-oxValidate_notEmpty"  type="text" size="20" maxlength="64" name="dynvalue[fcpo_payolution_debitnote_accountholder]" value="[{$dynvalue.fcpo_payolution_debitnote_accountholder}]" onkeyup="fcHandleDebitInputs();return false;" required="required">
            </div>
        </div> 
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="FCPO_BANK_IBAN"}]</label>
            <div class="col-lg-9">
                <input class="form-control js-oxValidate js-oxValidate_notEmpty" type="text" size="20" maxlength="64" name="dynvalue[fcpo_payolution_debitnote_iban]" value="[{$dynvalue.fcpo_payolution_debitnote_iban}]" onkeyup="fcHandleDebitInputs();return false;" required="required">
                <div id="fcpo_payolution_iban_invalid" class="fcpo_check_error">
                    <p class="oxValidateError" style="display: block;">
                        [{oxmultilang ident="FCPO_IBAN_INVALID"}]
                    </p>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="FCPO_BANK_BIC"}]</label>
            <div class="col-lg-9">
                <input class="form-control js-oxValidate js-oxValidate_notEmpty" autocomplete="off" type="text" size="20" maxlength="64" name="dynvalue[fcpo_payolution_debitnote_bic]" value="[{$dynvalue.fcpo_payolution_debitnote_bic}]" onkeyup="fcHandleDebitInputs();return false;" required="required">
                <div id="fcpo_payolution_bic_invalid" class="fcpo_check_error">
                    <p class="oxValidateError" style="display: block;">
                        [{oxmultilang ident="FCPO_BIC_INVALID"}]
                    </p>
                </div>
            </div>
        </div>
        
        <div class="alert alert-info col-lg-offset-3 desc">
            <input name="dynvalue[fcpo_payolution_debitnote_agreed]" value="agreed" type="checkbox">&nbsp;[{oxmultilang ident="FCPO_PAYOLUTION_AGREEMENT_PART_1"}] <a href='[{$oView->fcpoGetPayolutionAgreementLink()}]' class="lightview fcpoPayolutionAgreeRed" data-lightview-type="iframe" data-lightview-options="width: 800, height: 600, viewport: 'scale',background: { color: '#fff', opacity: 1 },skin: 'light'">[{oxmultilang ident="FCPO_PAYOLUTION_AGREE"}]</a> [{oxmultilang ident="FCPO_PAYOLUTION_AGREEMENT_PART_2"}]
        </div>
        <div class="alert alert-info col-lg-offset-3 desc">
            <input name="dynvalue[fcpo_payolution_debitnote_sepa_agreed]" value="agreed" type="checkbox">&nbsp;[{oxmultilang ident="FCPO_PAYOLUTION_SEPA_AGREEMENT_PART_1"}] <a href='[{$oView->fcpoGetPayolutionSepaAgreementLink()}]' class="fcpoPayolutionAgreeRed" onClick="javascript:open('', 'SEPA', 'height=800,width=600')">[{oxmultilang ident="FCPO_PAYOLUTION_SEPA_AGREE"}]</a>
        </div>
        
        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <div class="desc">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]
    </dd>
</dl>