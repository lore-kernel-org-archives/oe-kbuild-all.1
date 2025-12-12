Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13A1D5147
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 04:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512865; cv=none; b=tPE0xp649SrTbIOEFm1mJt/AvIselSQ5zi+ma1s7NzaOj4aIi2D5K8WRGZWqpZIMA081kI1/DxuZVnK94Ut1ugiVZNl7XJqDgD901gE3u16F0u+RCm8NjZ1Ej0gI5y9aTSsKBIARd3O2uyensprfYQdySn3HIbX404jCU7ETStk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512865; c=relaxed/simple;
	bh=rKo7R3M1HJhx0aSYzXeDO0NYFMCK1oaOuDJWy5A813s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIkPDTgP3WwkPJFW3Nvqvw2tsF2sH3BXs7Ro2JIB5MISDUm0I4avHv1D4u9Pd591nqAzr70hA5AhyOLD91XgHi43k/fvC+vF1E4HgMRFnODw1oumGGECOOXQw+moBKopkob2YE1yGu3O5O0MvtcdOOKPc5k5wyIH4/yuIiCj/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7Du+z4j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7Du+z4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765512864; x=1797048864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKo7R3M1HJhx0aSYzXeDO0NYFMCK1oaOuDJWy5A813s=;
  b=V7Du+z4jiwKiZLKQjQhA7uFPphm/k8OCtqOUeflU7aZ35oTujygiwhEq
   LxAhL94UcHsI7cBo+okzctBmfyE/O7PelLltoMLf5+YKr/L0C0a6Pj+rq
   R2ohVVxIDy1KjNRQHKHWT1UWbv2oocl8vZs4egG66os+7EKUwz7SVegjH
   Kv4LjuX4boytWDHhK77ZsvhP9VPo6gz9m8b/e0eCbveqNHnd8sXSpLY8o
   p0U8jcBSDd9/64ifbXr06sbD1LuRvwUfhZjtrr1w9pUGgIS30V5fS7IK4
   nYoW9mvN3rbU048XfMsWQsTOHlUfT3yWQ/9ISVa0tCgxNzHykizcdlOCf
   g==;
X-CSE-ConnectionGUID: 5zElxXqcQkSecoWmkCRU3Q==
X-CSE-MsgGUID: eSCDN/2NR1OuAizO7PsYuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71126935"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71126935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:14:23 -0800
X-CSE-ConnectionGUID: c4iZOTxzTW26IQ0+aPnxtg==
X-CSE-MsgGUID: zE/FR9ZTQQ2iEfy7Ab8rEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197456053"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 20:14:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTuXr-000000005Uf-0uj5;
	Fri, 12 Dec 2025 04:14:19 +0000
Date: Fri, 12 Dec 2025 12:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/bus/mhi/host/main.c:794:13: warning: parameter 'event_quota' set but
 not used
Message-ID: <202512121213.9rvljp1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   401d2e5564fad8fc4b2fa18984c5bfe568e36feb
commit: 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b [0/2] bus: mhi: Move host MHI code to "host" directory
config: x86_64-randconfig-014-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121213.9rvljp1K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121213.9rvljp1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121213.9rvljp1K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/bus/mhi/host/main.c:794:13: warning: parameter 'event_quota' set but not used [-Wunused-but-set-parameter]
     794 |                              u32 event_quota)
         |                                  ^
   2 warnings generated.


vim +/event_quota +794 drivers/bus/mhi/host/main.c

1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  791  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  792  int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  793  			     struct mhi_event *mhi_event,
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20 @794  			     u32 event_quota)
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  795  {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  796  	struct mhi_tre *dev_rp, *local_rp;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  797  	struct mhi_ring *ev_ring = &mhi_event->ring;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  798  	struct mhi_event_ctxt *er_ctxt =
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  799  		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  800  	struct mhi_chan *mhi_chan;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  801  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  802  	u32 chan;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  803  	int count = 0;
c1013a5ba4c9611 drivers/bus/mhi/core/main.c Paul Davey            2022-03-01  804  	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  805  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  806  	/*
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  807  	 * This is a quick check to avoid unnecessary event processing
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  808  	 * in case MHI is already in error state, but it's still possible
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  809  	 * to transition to error state while processing events
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  810  	 */
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  811  	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  812  		return -EIO;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  813  
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  814  	if (!is_valid_ring_ptr(ev_ring, ptr)) {
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  815  		dev_err(&mhi_cntrl->mhi_dev->dev,
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  816  			"Event ring rp points outside of the event ring\n");
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  817  		return -EIO;
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  818  	}
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  819  
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  820  	dev_rp = mhi_to_virtual(ev_ring, ptr);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  821  	local_rp = ev_ring->rp;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  822  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  823  	while (dev_rp != local_rp) {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  824  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  825  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  826  		switch (type) {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  827  		case MHI_PKT_TYPE_BW_REQ_EVENT:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  828  		{
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  829  			struct mhi_link_info *link_info;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  830  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  831  			link_info = &mhi_cntrl->mhi_link_info;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  832  			write_lock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  833  			link_info->target_link_speed =
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  834  				MHI_TRE_GET_EV_LINKSPEED(local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  835  			link_info->target_link_width =
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  836  				MHI_TRE_GET_EV_LINKWIDTH(local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  837  			write_unlock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  838  			dev_dbg(dev, "Received BW_REQ event\n");
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  839  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_BW_REQ);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  840  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  841  		}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  842  		case MHI_PKT_TYPE_STATE_CHANGE_EVENT:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  843  		{
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  844  			enum mhi_state new_state;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  845  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  846  			new_state = MHI_TRE_GET_EV_STATE(local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  847  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  848  			dev_dbg(dev, "State change event to state: %s\n",
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  849  				TO_MHI_STATE_STR(new_state));
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  850  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  851  			switch (new_state) {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  852  			case MHI_STATE_M0:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  853  				mhi_pm_m0_transition(mhi_cntrl);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  854  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  855  			case MHI_STATE_M1:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  856  				mhi_pm_m1_transition(mhi_cntrl);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  857  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  858  			case MHI_STATE_M3:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  859  				mhi_pm_m3_transition(mhi_cntrl);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  860  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  861  			case MHI_STATE_SYS_ERR:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  862  			{
683e77cadc839b3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  863  				enum mhi_pm_state pm_state;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  864  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  865  				dev_dbg(dev, "System error detected\n");
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  866  				write_lock_irq(&mhi_cntrl->pm_lock);
683e77cadc839b3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  867  				pm_state = mhi_tryset_pm_state(mhi_cntrl,
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  868  							MHI_PM_SYS_ERR_DETECT);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  869  				write_unlock_irq(&mhi_cntrl->pm_lock);
683e77cadc839b3 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  870  				if (pm_state == MHI_PM_SYS_ERR_DETECT)
bc7ccce5a5192cf drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  871  					mhi_pm_sys_err_handler(mhi_cntrl);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  872  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  873  			}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  874  			default:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  875  				dev_err(dev, "Invalid state: %s\n",
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  876  					TO_MHI_STATE_STR(new_state));
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  877  			}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  878  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  879  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  880  		}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  881  		case MHI_PKT_TYPE_CMD_COMPLETION_EVENT:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  882  			mhi_process_cmd_completion(mhi_cntrl, local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  883  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  884  		case MHI_PKT_TYPE_EE_EVENT:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  885  		{
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  886  			enum dev_st_transition st = DEV_ST_TRANSITION_MAX;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  887  			enum mhi_ee_type event = MHI_TRE_GET_EV_EXECENV(local_rp);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  888  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  889  			dev_dbg(dev, "Received EE event: %s\n",
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  890  				TO_MHI_EXEC_STR(event));
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  891  			switch (event) {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  892  			case MHI_EE_SBL:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  893  				st = DEV_ST_TRANSITION_SBL;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  894  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  895  			case MHI_EE_WFW:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  896  			case MHI_EE_AMSS:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  897  				st = DEV_ST_TRANSITION_MISSION_MODE;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  898  				break;
66ac7985b2af310 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  899  			case MHI_EE_FP:
66ac7985b2af310 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  900  				st = DEV_ST_TRANSITION_FP;
66ac7985b2af310 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  901  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  902  			case MHI_EE_RDDM:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  903  				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  904  				write_lock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  905  				mhi_cntrl->ee = event;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  906  				write_unlock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  907  				wake_up_all(&mhi_cntrl->state_event);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  908  				break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  909  			default:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  910  				dev_err(dev,
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  911  					"Unhandled EE event: 0x%x\n", type);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  912  			}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  913  			if (st != DEV_ST_TRANSITION_MAX)
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  914  				mhi_queue_state_transition(mhi_cntrl, st);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  915  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  916  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  917  		}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  918  		case MHI_PKT_TYPE_TX_EVENT:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  919  			chan = MHI_TRE_GET_EV_CHID(local_rp);
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  920  
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  921  			WARN_ON(chan >= mhi_cntrl->max_chan);
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  922  
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  923  			/*
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  924  			 * Only process the event ring elements whose channel
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  925  			 * ID is within the maximum supported range.
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  926  			 */
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  927  			if (chan < mhi_cntrl->max_chan) {
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  928  				mhi_chan = &mhi_cntrl->mhi_chan[chan];
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  929  				if (!mhi_chan->configured)
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  930  					break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  931  				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  932  				event_quota--;
020960685041fc0 drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  933  			}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  934  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  935  		default:
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  936  			dev_err(dev, "Unhandled event type: %d\n", type);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  937  			break;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  938  		}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  939  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  940  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  941  		local_rp = ev_ring->rp;
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  942  
c1013a5ba4c9611 drivers/bus/mhi/core/main.c Paul Davey            2022-03-01  943  		ptr = le64_to_cpu(er_ctxt->rp);
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  944  		if (!is_valid_ring_ptr(ev_ring, ptr)) {
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  945  			dev_err(&mhi_cntrl->mhi_dev->dev,
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  946  				"Event ring rp points outside of the event ring\n");
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  947  			return -EIO;
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  948  		}
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  949  
ec32332df7645e0 drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  950  		dev_rp = mhi_to_virtual(ev_ring, ptr);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  951  		count++;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  952  	}
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  953  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  954  	read_lock_bh(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  955  	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  956  		mhi_ring_er_db(mhi_event);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  957  	read_unlock_bh(&mhi_cntrl->pm_lock);
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  958  
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  959  	return count;
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  960  }
1d3173a3bae7039 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  961  

:::::: The code at line 794 was first introduced by commit
:::::: 1d3173a3bae7039b765a0956e3e4bf846dbaacb8 bus: mhi: core: Add support for processing events from client device

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
