Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2C5E0AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtRPl93e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702569453; x=1734105453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s16qpsszsGYeLnZkbrfY4ciBQfPvarL3KUk0LYd5qM=;
  b=KtRPl93ewxLuJPu9sruoWlKDLznzCvBRMOjxug38EOdL43AN8T4W+oKx
   EuFh+2DISsqeCKnrp0v4FqmH/a0ZLHtR3YgSSvyMQiOzrfz+QIGqPSHb+
   8P8NSSLCAtvo9F8PtaB4s2dZqDCW+yo9XQ0RMVmsH9niNO+fPFZnNrG0Z
   8173WjjL/W7+S0qwX//+2UMFj/dhDE0HlIbjtJyNXHySNyJF3xbgNHtxY
   KPkSpfe1mabbEA1mXvpNUboN2IQjq+B6F/f7AOVDBNtVIQVZBcmWMw1/R
   AH3Z4HZpNyxtrvICXzHlopIdLbs0KERaNcQjMGDie0pXr7F30na7KTcQG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397922510"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="397922510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840322836"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="840322836"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 07:57:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDo5O-000MFW-17;
	Thu, 14 Dec 2023 15:57:26 +0000
Date: Thu, 14 Dec 2023 23:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Can Guo <quic_cang@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Peter Wang <peter.wang@mediatek.com>
Subject: [mkp-scsi:for-next 108/145] drivers/ufs/host/ufshcd-pltfrm.c:289:
 warning: bad line:                                 both the controller and
 the device
Message-ID: <202312142334.ohsxHijP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Can,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   ed340d13aa1db6773667ed4bf907738df203fbda
commit: fa3dca8251c4fff88da9f64ba931942638ab0c00 [108/145] scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
config: i386-buildonly-randconfig-005-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142334.ohsxHijP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142334.ohsxHijP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142334.ohsxHijP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufshcd-pltfrm.c:289: warning: bad line:                                 both the controller and the device


vim +289 drivers/ufs/host/ufshcd-pltfrm.c

   286	
   287	/**
   288	 * ufshcd_negotiate_pwr_params - find power mode settings that are supported by
 > 289					both the controller and the device
   290	 * @host_params: pointer to host parameters
   291	 * @dev_max: pointer to device attributes
   292	 * @agreed_pwr: returned agreed attributes
   293	 *
   294	 * Return: 0 on success, non-zero value on failure.
   295	 */
   296	int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
   297					const struct ufs_pa_layer_attr *dev_max,
   298					struct ufs_pa_layer_attr *agreed_pwr)
   299	{
   300		int min_host_gear;
   301		int min_dev_gear;
   302		bool is_dev_sup_hs = false;
   303		bool is_host_max_hs = false;
   304	
   305		if (dev_max->pwr_rx == FAST_MODE)
   306			is_dev_sup_hs = true;
   307	
   308		if (host_params->desired_working_mode == UFS_HS_MODE) {
   309			is_host_max_hs = true;
   310			min_host_gear = min_t(u32, host_params->hs_rx_gear,
   311						host_params->hs_tx_gear);
   312		} else {
   313			min_host_gear = min_t(u32, host_params->pwm_rx_gear,
   314						host_params->pwm_tx_gear);
   315		}
   316	
   317		/*
   318		 * device doesn't support HS but host_params->desired_working_mode is HS,
   319		 * thus device and host_params don't agree
   320		 */
   321		if (!is_dev_sup_hs && is_host_max_hs) {
   322			pr_info("%s: device doesn't support HS\n",
   323				__func__);
   324			return -ENOTSUPP;
   325		} else if (is_dev_sup_hs && is_host_max_hs) {
   326			/*
   327			 * since device supports HS, it supports FAST_MODE.
   328			 * since host_params->desired_working_mode is also HS
   329			 * then final decision (FAST/FASTAUTO) is done according
   330			 * to pltfrm_params as it is the restricting factor
   331			 */
   332			agreed_pwr->pwr_rx = host_params->rx_pwr_hs;
   333			agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
   334		} else {
   335			/*
   336			 * here host_params->desired_working_mode is PWM.
   337			 * it doesn't matter whether device supports HS or PWM,
   338			 * in both cases host_params->desired_working_mode will
   339			 * determine the mode
   340			 */
   341			agreed_pwr->pwr_rx = host_params->rx_pwr_pwm;
   342			agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
   343		}
   344	
   345		/*
   346		 * we would like tx to work in the minimum number of lanes
   347		 * between device capability and vendor preferences.
   348		 * the same decision will be made for rx
   349		 */
   350		agreed_pwr->lane_tx = min_t(u32, dev_max->lane_tx,
   351					    host_params->tx_lanes);
   352		agreed_pwr->lane_rx = min_t(u32, dev_max->lane_rx,
   353					    host_params->rx_lanes);
   354	
   355		/* device maximum gear is the minimum between device rx and tx gears */
   356		min_dev_gear = min_t(u32, dev_max->gear_rx, dev_max->gear_tx);
   357	
   358		/*
   359		 * if both device capabilities and vendor pre-defined preferences are
   360		 * both HS or both PWM then set the minimum gear to be the chosen
   361		 * working gear.
   362		 * if one is PWM and one is HS then the one that is PWM get to decide
   363		 * what is the gear, as it is the one that also decided previously what
   364		 * pwr the device will be configured to.
   365		 */
   366		if ((is_dev_sup_hs && is_host_max_hs) ||
   367		    (!is_dev_sup_hs && !is_host_max_hs)) {
   368			agreed_pwr->gear_rx =
   369				min_t(u32, min_dev_gear, min_host_gear);
   370		} else if (!is_dev_sup_hs) {
   371			agreed_pwr->gear_rx = min_dev_gear;
   372		} else {
   373			agreed_pwr->gear_rx = min_host_gear;
   374		}
   375		agreed_pwr->gear_tx = agreed_pwr->gear_rx;
   376	
   377		agreed_pwr->hs_rate = host_params->hs_rate;
   378	
   379		return 0;
   380	}
   381	EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
