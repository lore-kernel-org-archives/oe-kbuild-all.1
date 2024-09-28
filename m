Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991741A8F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727523196; cv=none; b=Ntb/yRuZHMbP09IcAIY1/v1hmXAP/H6PLHb7qObMgew7Ggrk9hqysvqtniRNsgxUGX3mp32q6+ehFavA45cQ06DiAjtBcUNMVPo3n1TuDqPHTqSJUdoEIW3DjaWs3kNeo5D9dOC08DwVExGMwZB5Hlt9uixXrF8fpeYN9MT97Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727523196; c=relaxed/simple;
	bh=QAVMnFSavPHRL9SqeHubtPxcGE821BWzj5KW703bHjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJe5AoD5XJm1if2XVxmVpJl8PamIZMxDnYhkIGTuSgKdX6R78jXSNNGKDuO3pQTIy1klzhLBkVRr3sfgViY1vuWck30/chscEjpvJXUS8f+Jg2KmA8GD9WSZ9Qar4rXYw3zmF8McrVAiThw4I1uANSBtb3CTycwhozuh9+1IsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nR5sxx6S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nR5sxx6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727523195; x=1759059195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QAVMnFSavPHRL9SqeHubtPxcGE821BWzj5KW703bHjI=;
  b=nR5sxx6SOwnaom+JHjom6Vn5W0uB4YX6iwe4aHC/TH+DNUTJK39eCuSL
   OOAQmz2GWUcLNhWti2jXBYsNmAtZfcv//ITotp9gsTIN1EEYvaK8QQFuI
   Bf0K6ba3cen/VW0+VL20KrU8VF28cJeVRfcD02hS83UyubU4ZZ9BTTKnD
   DbeMdSF6KSoRZFSwhpmvlMfyfmj6t5xrBo3qmD99VZof/zvq7DdFi+umd
   dpJu6I1eOtw2c9FsSCDnfVwJ7LFLsYmJ7kr9UFKHwZ/5AMrYBGBAW86bO
   SS7oVsN8l6781+Ro74IJRhufmSX/ux4H6dIHaL7tlMc5h/6dsnGS/c5g4
   g==;
X-CSE-ConnectionGUID: 6nE6zsI7T5O8HEotNWm4ng==
X-CSE-MsgGUID: BRKs3lGcQPaZSSwusKvrTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26759304"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26759304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:33:14 -0700
X-CSE-ConnectionGUID: 1qvwKbx8REuRuW4sWMrMvA==
X-CSE-MsgGUID: 7GIGOfs3R3GCzCSjkSgeuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73111998"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 04:33:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVhG-000NDF-35;
	Sat, 28 Sep 2024 11:33:10 +0000
Date: Sat, 28 Sep 2024 19:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4273/16788]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:325:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202409281901.Eqeu7QPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 98ad662c434f5d3a43f0d7dec275529adfb67050 [4273/16788] drm/display: update header path and name
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409281901.Eqeu7QPZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281901.Eqeu7QPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281901.Eqeu7QPZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:325:5: warning: no previous prototype for 'cdns_mhdp_register_cec_driver' [-Wmissing-prototypes]
     325 | int cdns_mhdp_register_cec_driver(struct cdns_mhdp_cec *cec)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:353:5: warning: no previous prototype for 'cdns_mhdp_unregister_cec_driver' [-Wmissing-prototypes]
     353 | int cdns_mhdp_unregister_cec_driver(struct cdns_mhdp_cec *cec)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_mhdp_register_cec_driver +325 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c

37f090fcc75f8b Sandor Yu 2020-04-20  324  
6dfb0effbcb07b Sandor Yu 2020-11-16 @325  int cdns_mhdp_register_cec_driver(struct cdns_mhdp_cec *cec)
37f090fcc75f8b Sandor Yu 2020-04-20  326  {
37f090fcc75f8b Sandor Yu 2020-04-20  327  	int ret;
37f090fcc75f8b Sandor Yu 2020-04-20  328  
37f090fcc75f8b Sandor Yu 2020-04-20  329  	cec->adap = cec_allocate_adapter(&cdns_mhdp_cec_adap_ops, cec,
37f090fcc75f8b Sandor Yu 2020-04-20  330  					 CEC_NAME,
37f090fcc75f8b Sandor Yu 2020-04-20  331  					 CEC_CAP_PHYS_ADDR | CEC_CAP_LOG_ADDRS |
37f090fcc75f8b Sandor Yu 2020-04-20  332  					 CEC_CAP_TRANSMIT | CEC_CAP_PASSTHROUGH
37f090fcc75f8b Sandor Yu 2020-04-20  333  					 | CEC_CAP_RC, CEC_MAX_LOG_ADDRS);
37f090fcc75f8b Sandor Yu 2020-04-20  334  	ret = PTR_ERR_OR_ZERO(cec->adap);
37f090fcc75f8b Sandor Yu 2020-04-20  335  	if (ret)
37f090fcc75f8b Sandor Yu 2020-04-20  336  		return ret;
6dfb0effbcb07b Sandor Yu 2020-11-16  337  	ret = cec_register_adapter(cec->adap, cec->dev);
37f090fcc75f8b Sandor Yu 2020-04-20  338  	if (ret) {
37f090fcc75f8b Sandor Yu 2020-04-20  339  		cec_delete_adapter(cec->adap);
37f090fcc75f8b Sandor Yu 2020-04-20  340  		return ret;
37f090fcc75f8b Sandor Yu 2020-04-20  341  	}
37f090fcc75f8b Sandor Yu 2020-04-20  342  
37f090fcc75f8b Sandor Yu 2020-04-20  343  	cec->cec_worker = kthread_create(mhdp_cec_poll_worker, cec, "cdns-mhdp-cec");
37f090fcc75f8b Sandor Yu 2020-04-20  344  	if (IS_ERR(cec->cec_worker))
37f090fcc75f8b Sandor Yu 2020-04-20  345  		dev_err(cec->dev, "failed  create hdp cec thread\n");
37f090fcc75f8b Sandor Yu 2020-04-20  346  
37f090fcc75f8b Sandor Yu 2020-04-20  347  	wake_up_process(cec->cec_worker);
37f090fcc75f8b Sandor Yu 2020-04-20  348  
6dfb0effbcb07b Sandor Yu 2020-11-16  349  	dev_dbg(cec->dev, "CEC successfuly probed\n");
37f090fcc75f8b Sandor Yu 2020-04-20  350  	return 0;
37f090fcc75f8b Sandor Yu 2020-04-20  351  }
37f090fcc75f8b Sandor Yu 2020-04-20  352  
6dfb0effbcb07b Sandor Yu 2020-11-16 @353  int cdns_mhdp_unregister_cec_driver(struct cdns_mhdp_cec *cec)
37f090fcc75f8b Sandor Yu 2020-04-20  354  {
37f090fcc75f8b Sandor Yu 2020-04-20  355  	if (cec->cec_worker) {
37f090fcc75f8b Sandor Yu 2020-04-20  356  		kthread_stop(cec->cec_worker);
37f090fcc75f8b Sandor Yu 2020-04-20  357  		cec->cec_worker = NULL;
37f090fcc75f8b Sandor Yu 2020-04-20  358  	}
37f090fcc75f8b Sandor Yu 2020-04-20  359  	cec_unregister_adapter(cec->adap);
37f090fcc75f8b Sandor Yu 2020-04-20  360  	return 0;
37f090fcc75f8b Sandor Yu 2020-04-20  361  }
37f090fcc75f8b Sandor Yu 2020-04-20  362  

:::::: The code at line 325 was first introduced by commit
:::::: 6dfb0effbcb07b7568a792c3067eb1f71fa40525 MLK-24081-03: drm: bridge: cdns-cec: support hdmi rx cec

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
