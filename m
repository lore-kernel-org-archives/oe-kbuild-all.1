Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667317996
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138472; cv=none; b=MbtYzOCHXPTyRI20/TdmYGJI6aGkQSNOVXz1HsK4ZsFqYUfDTfViye/AEmA+/EhhiI1OQWU6CZ/cVh6Wic+FUx9Q29xR6+wJe1AnD9RNHotxiBMmazHcMAXoCx5JbKbhF8VQT6iZ+fHKsr9bCfgE3LPLbflWb1JcspQ9NmmVuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138472; c=relaxed/simple;
	bh=oBuObmaQDJrlwBhbtRebek9qDcEXgyU7ix0b7j1TlKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIVTA7pINQl4WuVJpdieKgQUAxP8fwGCx4E6IAPdxspvjofNXvPypHu7+Eqic/QdXNArZPxPTP6FbT+eOuBleggQe7rMaowE6qoF0OvBQElp42fudxSJUZbsoR+hFXzcZGXP/F+5g71MvlmN1EDbDO7SDYP9mR6SLTWZMdR8OlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JD3hT/lY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JD3hT/lY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753138469; x=1784674469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBuObmaQDJrlwBhbtRebek9qDcEXgyU7ix0b7j1TlKI=;
  b=JD3hT/lYXHBe2S+OOKPoAl1acOc8oVM8fkIyBn0ZItLM08KlzpVVB4mz
   2NC1KlMZlSwOPOxH3ze24wKz5DSuYLcqS9TzuzeDvkCI2DoO0EiiLAv6t
   hqjXm7XS/MFbPUNarKtlJ4LlAPjPTyv0SFHm8bSovnp46DXuk9pobr68r
   IrXz++QvQxL+0I/LTgYFBHfG9YZP+G/H/c1Wbs5GsKHI/bm5sYWTE0qmH
   aDi+vTsDWZp6UHVXlPFTE3czjQdUI/stjEcRAsmvRqiKVBFrf43Kd7uY1
   0RCExrIySB7ZwoLCJM6b++Lk9OnWkdGpNcTzPemBz/hkmJ8coP0+EAhdY
   Q==;
X-CSE-ConnectionGUID: tmHcZV+AQo+ZUn5Gv/slGA==
X-CSE-MsgGUID: fOQ8tuInT9e8yThW2j3dbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66443761"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="66443761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 15:54:28 -0700
X-CSE-ConnectionGUID: eQdyFL4kSyKD2uuDUvN1nA==
X-CSE-MsgGUID: srExtDg1TLWxU88riFxPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159015399"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2025 15:54:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udzOs-000HDd-0g;
	Mon, 21 Jul 2025 22:54:26 +0000
Date: Tue, 22 Jul 2025 06:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Grzegorz Nitka <grzegorz.nitka@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 iwl-next] ice: add recovery clock and clock 1588
 control for E825c
Message-ID: <202507220643.IMFmQNr5-lkp@intel.com>
References: <20250721204352.1853765-1-grzegorz.nitka@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721204352.1853765-1-grzegorz.nitka@intel.com>

Hi Grzegorz,

kernel test robot noticed the following build errors:

[auto build test ERROR on 10c6d502429ad0de7df1e23d372d0afa70f30400]

url:    https://github.com/intel-lab-lkp/linux/commits/Grzegorz-Nitka/ice-add-recovery-clock-and-clock-1588-control-for-E825c/20250722-044717
base:   10c6d502429ad0de7df1e23d372d0afa70f30400
patch link:    https://lore.kernel.org/r/20250721204352.1853765-1-grzegorz.nitka%40intel.com
patch subject: [PATCH v6 iwl-next] ice: add recovery clock and clock 1588 control for E825c
config: arc-randconfig-001-20250722 (https://download.01.org/0day-ci/archive/20250722/202507220643.IMFmQNr5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220643.IMFmQNr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220643.IMFmQNr5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_dpll.c: In function 'ice_dpll_init_pins':
>> drivers/net/ethernet/intel/ice/ice_dpll.c:3791:5: error: label 'deinit_input' used but not defined
    3791 |     goto deinit_input;
         |     ^~~~


vim +/deinit_input +3791 drivers/net/ethernet/intel/ice/ice_dpll.c

  3709	
  3710	/**
  3711	 * ice_dpll_init_pins - init pins and register pins with a dplls
  3712	 * @pf: board private structure
  3713	 * @cgu: if cgu is present and controlled by this NIC
  3714	 *
  3715	 * Initialize directly connected pf's pins within pf's dplls in a Linux dpll
  3716	 * subsystem.
  3717	 *
  3718	 * Return:
  3719	 * * 0 - success
  3720	 * * negative - initialization failure reason
  3721	 */
  3722	static int ice_dpll_init_pins(struct ice_pf *pf, bool cgu)
  3723	{
  3724		const struct dpll_pin_ops *output_ops;
  3725		const struct dpll_pin_ops *input_ops;
  3726		int ret, count;
  3727	
  3728		switch (pf->hw.mac_type) {
  3729		case ICE_MAC_GENERIC_3K_E825:
  3730			input_ops = &ice_dpll_input_ops_e825c;
  3731			output_ops = NULL;
  3732			break;
  3733		default:
  3734			input_ops = &ice_dpll_input_ops;
  3735			output_ops = &ice_dpll_output_ops;
  3736			break;
  3737		}
  3738		ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.inputs, 0,
  3739						pf->dplls.num_inputs, input_ops,
  3740						pf->dplls.eec.dpll, pf->dplls.pps.dpll);
  3741		if (ret)
  3742			return ret;
  3743	
  3744		count = pf->dplls.num_inputs;
  3745	
  3746		if (cgu) {
  3747			ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.outputs,
  3748							count, pf->dplls.num_outputs,
  3749							output_ops, pf->dplls.eec.dpll,
  3750							pf->dplls.pps.dpll);
  3751			if (ret)
  3752				goto deinit_inputs;
  3753			count += pf->dplls.num_outputs;
  3754			if (!pf->dplls.generic) {
  3755				ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.sma,
  3756								count,
  3757								ICE_DPLL_PIN_SW_NUM,
  3758								&ice_dpll_pin_sma_ops,
  3759								pf->dplls.eec.dpll,
  3760								pf->dplls.pps.dpll);
  3761				if (ret)
  3762					goto deinit_outputs;
  3763				count += ICE_DPLL_PIN_SW_NUM;
  3764				ret = ice_dpll_init_direct_pins(pf, cgu, pf->dplls.ufl,
  3765								count,
  3766								ICE_DPLL_PIN_SW_NUM,
  3767								&ice_dpll_pin_ufl_ops,
  3768								pf->dplls.eec.dpll,
  3769								pf->dplls.pps.dpll);
  3770				if (ret)
  3771					goto deinit_sma;
  3772				count += ICE_DPLL_PIN_SW_NUM;
  3773			}
  3774			ret = ice_dpll_pin_ref_sync_register(pf->dplls.inputs,
  3775							     pf->dplls.num_inputs);
  3776			if (ret)
  3777				goto deinit_ufl;
  3778			ret = ice_dpll_pin_ref_sync_register(pf->dplls.sma,
  3779							     ICE_DPLL_PIN_SW_NUM);
  3780			if (ret)
  3781				goto deinit_ufl;
  3782		} else {
  3783			count += pf->dplls.num_outputs + 2 * ICE_DPLL_PIN_SW_NUM;
  3784		}
  3785		if (pf->hw.mac_type == ICE_MAC_GENERIC_3K_E825) {
  3786			if (ice_pf_src_tmr_owned(pf)) {
  3787				ret = ice_dpll_init_pin_1588(pf, &pf->dplls.pin_1588,
  3788							     count,
  3789							     &ice_dpll_pin_1588_ops);
  3790				if (ret)
> 3791					goto deinit_input;
  3792			}
  3793			count += ICE_DPLL_PIN_1588_NUM;
  3794		}
  3795	
  3796		ret = ice_dpll_init_rclk_pins(pf, &pf->dplls.rclk,
  3797					      count + pf->ptp.port.port_num,
  3798					      &ice_dpll_rclk_ops);
  3799		if (ret)
  3800			goto deinit_ufl;
  3801	
  3802		return 0;
  3803	
  3804	deinit_ufl:
  3805		ice_dpll_deinit_direct_pins(pf, cgu, pf->dplls.ufl, ICE_DPLL_PIN_SW_NUM,
  3806					    &ice_dpll_pin_ufl_ops, pf->dplls.pps.dpll,
  3807					    pf->dplls.eec.dpll);
  3808		if (pf->hw.mac_type == ICE_MAC_GENERIC_3K_E825 &&
  3809		    ice_pf_src_tmr_owned(pf))
  3810			ice_dpll_deinit_pin_1588(pf);
  3811	deinit_sma:
  3812		ice_dpll_deinit_direct_pins(pf, cgu, pf->dplls.sma, ICE_DPLL_PIN_SW_NUM,
  3813					    &ice_dpll_pin_sma_ops, pf->dplls.pps.dpll,
  3814					    pf->dplls.eec.dpll);
  3815	deinit_outputs:
  3816		ice_dpll_deinit_direct_pins(pf, cgu, pf->dplls.outputs,
  3817					    pf->dplls.num_outputs,
  3818					    output_ops, pf->dplls.pps.dpll,
  3819					    pf->dplls.eec.dpll);
  3820	deinit_inputs:
  3821		ice_dpll_deinit_direct_pins(pf, cgu, pf->dplls.inputs,
  3822					    pf->dplls.num_inputs,
  3823					    input_ops, pf->dplls.pps.dpll,
  3824					    pf->dplls.eec.dpll);
  3825		return ret;
  3826	}
  3827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
