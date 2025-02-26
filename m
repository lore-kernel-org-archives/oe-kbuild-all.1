Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0915990C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563276; cv=none; b=PEToQN2QLUxNYKg5redz8WOTHmM1ZE8Xjay0+Fi5NxLZq+NPnfPGn4JXgxVGFELhcSE3E3By0LLlGp4MaNT2pfKLn/HQ2XUJTZEve23sawWTK53ekcl2GkchmnANpyfHA2cfJ7ZAHLl0LCG4KIULttEv7eyLEfFcYxCKMcaYRRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563276; c=relaxed/simple;
	bh=llujWGfiJAawyqzAGR8H03rTBFrH2tvy9hVK1HPi3xA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbHXKlyGVURRRwFk8XO/QMxKc+JXdPANzMCCneJmcz+a6gXhDd/QrcDCMCVj7TpB+Z0KXVJnyA/ZtF3WgVQr5MUEorHDE01EwraKrypo+DyQLFdUt+LTjW7TX3lQ1kNs9T39z4A3zeRwPmEuFkZpouNptddmHjRKfZaXNX+W4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngFWZ/h/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngFWZ/h/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563275; x=1772099275;
  h=date:from:cc:subject:message-id:mime-version;
  bh=llujWGfiJAawyqzAGR8H03rTBFrH2tvy9hVK1HPi3xA=;
  b=ngFWZ/h/mfaByzRBc8y7vM1sbjvDZ88A1L/DZm5FEU8eaTdamvzSJHWW
   IOjttbDzxCueu+4R5wk5YMnkrhU7IWCu/c5eE8+zgzOlpknUJmhjGHuUB
   uNpmJSygXpLFPuT1SwuIiqtcDXLG33tF0VYV46v1Y7XD4Erjax0yGojoy
   Emo/jwB09RCcGL2Bo2igDEKKmakl9st2PkGaql0Qz1mffPuSkgU5IUkMR
   VYy/mzYNBD6IeM348T2PlwDzea6CLSGCrwa70jbc/mjsziivRyI8hd98L
   o9wBIMz/m9j8AFv1I/ekgCvVi1NefpSrpys+gyS+BQIS2fJo7H23YPFgt
   A==;
X-CSE-ConnectionGUID: VwYDVfoeSp+rd/3NTGJkSA==
X-CSE-MsgGUID: glI6lBfYScGKyyEEa8DrHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52037190"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52037190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:47:54 -0800
X-CSE-ConnectionGUID: QCOuPaX6ReqE9BvFxYZ+UQ==
X-CSE-MsgGUID: n6KLkN1jTaSpLpo2KEtpwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121592487"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 01:47:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnE18-000BUD-2z
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 09:47:50 +0000
Date: Wed, 26 Feb 2025 17:46:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/net/ethernet/cadence/macb_ptp.c:470:6:
 warning: this statement may fall through
Message-ID: <202502261746.9pV00ORD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafal,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: ab91f0a9b5f4b9b5b341fdc0ed457121e69c20e1 [1/1] net: macb: Add hardware PTP support
config: arm64-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250226/202502261746.9pV00ORD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261746.9pV00ORD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261746.9pV00ORD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/cadence/macb_ptp.c: In function 'gem_set_hwtst':
>> drivers/net/ethernet/cadence/macb_ptp.c:470:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (gem_ptp_set_one_step_sync(bp, 1) != 0)
         ^
   drivers/net/ethernet/cadence/macb_ptp.c:472:2: note: here
     case HWTSTAMP_TX_ON:
     ^~~~


vim +470 drivers/net/ethernet/cadence/macb_ptp.c

   445	
   446	int gem_set_hwtst(struct net_device *dev, struct ifreq *ifr, int cmd)
   447	{
   448		enum macb_bd_control tx_bd_control = TSTAMP_DISABLED;
   449		enum macb_bd_control rx_bd_control = TSTAMP_DISABLED;
   450		struct hwtstamp_config *tstamp_config;
   451		struct macb *bp = netdev_priv(dev);
   452		u32 regval;
   453	
   454		tstamp_config = &bp->tstamp_config;
   455		if ((bp->hw_dma_cap & HW_DMA_CAP_PTP) == 0)
   456			return -EOPNOTSUPP;
   457	
   458		if (copy_from_user(tstamp_config, ifr->ifr_data,
   459				   sizeof(*tstamp_config)))
   460			return -EFAULT;
   461	
   462		/* reserved for future extensions */
   463		if (tstamp_config->flags)
   464			return -EINVAL;
   465	
   466		switch (tstamp_config->tx_type) {
   467		case HWTSTAMP_TX_OFF:
   468			break;
   469		case HWTSTAMP_TX_ONESTEP_SYNC:
 > 470			if (gem_ptp_set_one_step_sync(bp, 1) != 0)
   471				return -ERANGE;
   472		case HWTSTAMP_TX_ON:
   473			tx_bd_control = TSTAMP_ALL_FRAMES;
   474			break;
   475		default:
   476			return -ERANGE;
   477		}
   478	
   479		switch (tstamp_config->rx_filter) {
   480		case HWTSTAMP_FILTER_NONE:
   481			break;
   482		case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
   483			break;
   484		case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
   485			break;
   486		case HWTSTAMP_FILTER_PTP_V2_EVENT:
   487		case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
   488		case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
   489		case HWTSTAMP_FILTER_PTP_V2_SYNC:
   490		case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
   491		case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
   492		case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
   493		case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
   494		case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
   495			rx_bd_control =  TSTAMP_ALL_PTP_FRAMES;
   496			tstamp_config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
   497			regval = macb_readl(bp, NCR);
   498			macb_writel(bp, NCR, (regval | MACB_BIT(SRTSM)));
   499			break;
   500		case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
   501		case HWTSTAMP_FILTER_ALL:
   502			rx_bd_control = TSTAMP_ALL_FRAMES;
   503			tstamp_config->rx_filter = HWTSTAMP_FILTER_ALL;
   504			break;
   505		default:
   506			tstamp_config->rx_filter = HWTSTAMP_FILTER_NONE;
   507			return -ERANGE;
   508		}
   509	
   510		if (gem_ptp_set_ts_mode(bp, tx_bd_control, rx_bd_control) != 0)
   511			return -ERANGE;
   512	
   513		if (copy_to_user(ifr->ifr_data, tstamp_config, sizeof(*tstamp_config)))
   514			return -EFAULT;
   515		else
   516			return 0;
   517	}
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
