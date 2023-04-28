Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43417D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682661982; x=1714197982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+kR+xnPfprntmDs8Dq5PwUCWMu0AyONXeNS99FwaCU=;
  b=dF2yq9UwKMq9rkq7FpZL64QQGuhYUMb0qVxeM2azuuyiTuXSfWkp1nmp
   OGDFTNPy5JLetcEdh0d/4QCQZqnbL/C9C8lct0czw6G3bZE0jib5vIoP2
   W7pX6VXcuz39vuirNSajGviFRJZLAxTuMpQsyrpOXOW4vQte2NPQ0LZdb
   FfgkwmMQLfYNzl8XZS3UjiQ8ez7ZEo72E/GEI6HEXutQmVA9Djmk7lO1N
   eJA/nLVEXJRx57XfQsaZmW+sv9tZDvCCM6jhnROW4jSAGW0fvvFBV1ZAG
   k8KZ6190ULX+UbRyxQm6KN48WxfGQ6mFBcttFcmqEaVAJ2TaIHablOIBr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349682694"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="349682694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 23:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644986058"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="644986058"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Apr 2023 23:06:21 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psHFM-0000Az-1S;
	Fri, 28 Apr 2023 06:06:20 +0000
Date: Fri, 28 Apr 2023 14:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
Message-ID: <202304281454.5Y9tc47p-lkp@intel.com>
References: <20230428002009.2948020-6-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-6-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-6-vadfed%40meta.com
patch subject: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230428/202304281454.5Y9tc47p-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/08659ac96f7a68ef1966cf8784cfcfbe8cc96370
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 08659ac96f7a68ef1966cf8784cfcfbe8cc96370
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dpll/ drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281454.5Y9tc47p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dpll/dpll_core.c:296:1: warning: no previous prototype for 'dpll_xa_ref_dpll_find' [-Wmissing-prototypes]
     296 | dpll_xa_ref_dpll_find(struct xarray *xa_refs, const struct dpll_device *dpll)
         | ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/dpll/dpll_netlink.c:969:13: warning: no previous prototype for 'dpll_netlink_fini' [-Wmissing-prototypes]
     969 | void __exit dpll_netlink_fini(void)
         |             ^~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/intel/ice/ice_dpll.c:486:1: warning: no previous prototype for 'ice_dpll_pin_state_update' [-Wmissing-prototypes]
     486 | ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_dpll.c:4:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:317:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     317 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:301:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     301 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:291:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     291 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:277:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     277 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:263:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     263 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:250:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     250 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:232:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     232 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:216:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     216 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/intel/ice/ice_dpll.c:18: warning: cannot understand function prototype: 'const enum dpll_lock_status ice_dpll_status[__DPLL_LOCK_STATUS_MAX] = '
   drivers/net/ethernet/intel/ice/ice_dpll.c:29: warning: cannot understand function prototype: 'enum ice_dpll_pin_type '
   drivers/net/ethernet/intel/ice/ice_dpll.c:39: warning: cannot understand function prototype: 'const char * const pin_type_name[] = '
   drivers/net/ethernet/intel/ice/ice_dpll.c:327: warning: Excess function parameter 'dpll_priv' description in 'ice_dpll_frequency_get'
   drivers/net/ethernet/intel/ice/ice_dpll.c:488: warning: Function parameter or member 'pf' not described in 'ice_dpll_pin_state_update'
   drivers/net/ethernet/intel/ice/ice_dpll.c:488: warning: Excess function parameter 'hw' description in 'ice_dpll_pin_state_update'
   drivers/net/ethernet/intel/ice/ice_dpll.c:613: warning: Function parameter or member 'priv' not described in 'ice_dpll_lock_status_get'
   drivers/net/ethernet/intel/ice/ice_dpll.c:613: warning: Function parameter or member 'extack' not described in 'ice_dpll_lock_status_get'
>> drivers/net/ethernet/intel/ice/ice_dpll.c:681: warning: expecting prototype for ice_dpll_mode_get(). Prototype was for ice_dpll_mode_supported() instead
>> drivers/net/ethernet/intel/ice/ice_dpll.c:1068: warning: expecting prototype for ice_dpll_source_direction(). Prototype was for ice_dpll_output_direction() instead
   drivers/net/ethernet/intel/ice/ice_dpll.c:1094: warning: Excess function parameter 'dpll' description in 'ice_dpll_rclk_state_on_pin_set'
   drivers/net/ethernet/intel/ice/ice_dpll.c:1467: warning: Function parameter or member 'init' not described in 'ice_dpll_update_state'
   drivers/net/ethernet/intel/ice/ice_dpll.c:1756: warning: Excess function parameter 'pin_type' description in 'ice_dpll_init_rclk_pin'


vim +/ice_dpll_pin_state_update +486 drivers/net/ethernet/intel/ice/ice_dpll.c

   470	
   471	/**
   472	 * ice_dpll_pin_state_update - update pin's state
   473	 * @hw: private board struct
   474	 * @pin: structure with pin attributes to be updated
   475	 * @pin_type: type of pin being updated
   476	 *
   477	 * Determine pin current state and frequency, then update struct
   478	 * holding the pin info. For source pin states are separated for each
   479	 * dpll, for rclk pins states are separated for each parent.
   480	 *
   481	 * Return:
   482	 * * 0 - OK
   483	 * * negative - error
   484	 */
   485	int
 > 486	ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
   487				  const enum ice_dpll_pin_type pin_type)
   488	{
   489		int ret;
   490	
   491		if (pin_type == ICE_DPLL_PIN_TYPE_SOURCE) {
   492			ret = ice_aq_get_input_pin_cfg(&pf->hw, pin->idx, NULL, NULL,
   493						       NULL, &pin->flags[0],
   494						       &pin->freq, NULL);
   495			if (!!(ICE_AQC_GET_CGU_IN_CFG_FLG2_INPUT_EN & pin->flags[0])) {
   496				if (pin->pin) {
   497					pin->state[pf->dplls.eec.dpll_idx] =
   498						pin->pin == pf->dplls.eec.active_source ?
   499						DPLL_PIN_STATE_CONNECTED :
   500						DPLL_PIN_STATE_SELECTABLE;
   501					pin->state[pf->dplls.pps.dpll_idx] =
   502						pin->pin == pf->dplls.pps.active_source ?
   503						DPLL_PIN_STATE_CONNECTED :
   504						DPLL_PIN_STATE_SELECTABLE;
   505				} else {
   506					pin->state[pf->dplls.eec.dpll_idx] =
   507						DPLL_PIN_STATE_SELECTABLE;
   508					pin->state[pf->dplls.pps.dpll_idx] =
   509						DPLL_PIN_STATE_SELECTABLE;
   510				}
   511			} else {
   512				pin->state[pf->dplls.eec.dpll_idx] =
   513					DPLL_PIN_STATE_DISCONNECTED;
   514				pin->state[pf->dplls.pps.dpll_idx] =
   515					DPLL_PIN_STATE_DISCONNECTED;
   516			}
   517		} else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
   518			ret = ice_aq_get_output_pin_cfg(&pf->hw, pin->idx,
   519							&pin->flags[0], NULL,
   520							&pin->freq, NULL);
   521			if (!!(ICE_AQC_SET_CGU_OUT_CFG_OUT_EN & pin->flags[0]))
   522				pin->state[0] = DPLL_PIN_STATE_CONNECTED;
   523			else
   524				pin->state[0] = DPLL_PIN_STATE_DISCONNECTED;
   525		} else if (pin_type == ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
   526			u8 parent, port_num = ICE_AQC_SET_PHY_REC_CLK_OUT_CURR_PORT;
   527	
   528			for (parent = 0; parent < pf->dplls.rclk.num_parents;
   529			     parent++) {
   530				ret = ice_aq_get_phy_rec_clk_out(&pf->hw, parent,
   531								 &port_num,
   532								 &pin->flags[parent],
   533								 &pin->freq);
   534				if (ret)
   535					return ret;
   536				if (!!(ICE_AQC_GET_PHY_REC_CLK_OUT_OUT_EN &
   537				       pin->flags[parent]))
   538					pin->state[parent] = DPLL_PIN_STATE_CONNECTED;
   539				else
   540					pin->state[parent] =
   541						DPLL_PIN_STATE_DISCONNECTED;
   542			}
   543		}
   544	
   545		return ret;
   546	}
   547	
   548	/**
   549	 * ice_find_dpll - find ice_dpll on a pf
   550	 * @pf: private board structure
   551	 * @dpll: kernel's dpll_device pointer to be searched
   552	 *
   553	 * Return:
   554	 * * pointer if ice_dpll with given device dpll pointer is found
   555	 * * NULL if not found
   556	 */
   557	static struct ice_dpll
   558	*ice_find_dpll(struct ice_pf *pf, const struct dpll_device *dpll)
   559	{
   560		if (!pf || !dpll)
   561			return NULL;
   562	
   563		return dpll == pf->dplls.eec.dpll ? &pf->dplls.eec :
   564		       dpll == pf->dplls.pps.dpll ? &pf->dplls.pps : NULL;
   565	}
   566	
   567	/**
   568	 * ice_dpll_hw_source_prio_set - set source priority value in hardware
   569	 * @pf: board private structure
   570	 * @dpll: ice dpll pointer
   571	 * @pin: ice pin pointer
   572	 * @prio: priority value being set on a dpll
   573	 *
   574	 * Internal wrapper for setting the priority in the hardware.
   575	 *
   576	 * Return:
   577	 * * 0 - success
   578	 * * negative - failure
   579	 */
   580	static int
   581	ice_dpll_hw_source_prio_set(struct ice_pf *pf, struct ice_dpll *dpll,
   582				    struct ice_dpll_pin *pin, const u32 prio)
   583	{
   584		int ret;
   585	
   586		ret = ice_aq_set_cgu_ref_prio(&pf->hw, dpll->dpll_idx, pin->idx,
   587					      (u8)prio);
   588		if (ret)
   589			dev_dbg(ice_pf_to_dev(pf),
   590				"err:%d %s failed to set pin prio:%u on pin:%u\n",
   591				ret, ice_aq_str(pf->hw.adminq.sq_last_status),
   592				prio, pin->idx);
   593		else
   594			dpll->input_prio[pin->idx] = prio;
   595	
   596		return ret;
   597	}
   598	
   599	/**
   600	 * ice_dpll_lock_status_get - get dpll lock status callback
   601	 * @dpll: registered dpll pointer
   602	 * @status: on success holds dpll's lock status
   603	 *
   604	 * Dpll subsystem callback, provides dpll's lock status.
   605	 *
   606	 * Return:
   607	 * * 0 - success
   608	 * * negative - failure
   609	 */
   610	static int ice_dpll_lock_status_get(const struct dpll_device *dpll, void *priv,
   611					    enum dpll_lock_status *status,
   612					    struct netlink_ext_ack *extack)
   613	{
   614		struct ice_pf *pf = priv;
   615		struct ice_dpll *d;
   616	
   617		if (!pf)
   618			return -EINVAL;
   619		if (ice_dpll_cb_lock(pf))
   620			return -EBUSY;
   621		d = ice_find_dpll(pf, dpll);
   622		if (!d)
   623			return -EFAULT;
   624		dev_dbg(ice_pf_to_dev(pf), "%s: dpll:%p, pf:%p\n", __func__, dpll, pf);
   625		*status = ice_dpll_status[d->dpll_state];
   626		ice_dpll_cb_unlock(pf);
   627	
   628		return 0;
   629	}
   630	
   631	/**
   632	 * ice_dpll_mode_get - get dpll's working mode
   633	 * @dpll: registered dpll pointer
   634	 * @priv: private data pointer passed on dpll registration
   635	 * @mode: on success holds current working mode of dpll
   636	 * @extack: error reporting
   637	 *
   638	 * Dpll subsystem callback. Provides working mode of dpll.
   639	 *
   640	 * Return:
   641	 * * 0 - success
   642	 * * negative - failure
   643	 */
   644	static int ice_dpll_mode_get(const struct dpll_device *dpll, void *priv,
   645				     enum dpll_mode *mode,
   646				     struct netlink_ext_ack *extack)
   647	{
   648		struct ice_pf *pf = priv;
   649		struct ice_dpll *d;
   650	
   651		if (!pf)
   652			return -EINVAL;
   653		if (ice_dpll_cb_lock(pf))
   654			return -EBUSY;
   655		d = ice_find_dpll(pf, dpll);
   656		ice_dpll_cb_unlock(pf);
   657		if (!d)
   658			return -EFAULT;
   659		*mode = DPLL_MODE_AUTOMATIC;
   660	
   661		return 0;
   662	}
   663	
   664	/**
   665	 * ice_dpll_mode_get - check if dpll's working mode is supported
   666	 * @dpll: registered dpll pointer
   667	 * @priv: private data pointer passed on dpll registration
   668	 * @mode: mode to be checked for support
   669	 * @extack: error reporting
   670	 *
   671	 * Dpll subsystem callback. Provides information if working mode is supported
   672	 * by dpll.
   673	 *
   674	 * Return:
   675	 * * true - mode is supported
   676	 * * false - mode is not supported
   677	 */
   678	static bool ice_dpll_mode_supported(const struct dpll_device *dpll, void *priv,
   679					    const enum dpll_mode mode,
   680					    struct netlink_ext_ack *extack)
 > 681	{
   682		struct ice_pf *pf = priv;
   683		struct ice_dpll *d;
   684	
   685		if (!pf)
   686			return false;
   687	
   688		if (ice_dpll_cb_lock(pf))
   689			return false;
   690		d = ice_find_dpll(pf, dpll);
   691		ice_dpll_cb_unlock(pf);
   692		if (!d)
   693			return false;
   694		if (mode == DPLL_MODE_AUTOMATIC)
   695			return true;
   696	
   697		return false;
   698	}
   699	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
