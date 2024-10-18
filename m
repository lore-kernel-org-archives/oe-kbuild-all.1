Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2FE1D9686
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262269; cv=none; b=OADBIL3+d260u2wCfs9Z9dEszRkQ6wenJOTb8ufO6FVwnx0IlYnp7iyUsaHNNaAuMdoZB+Z3IRR33ve+jZYlhCjzT9p8/o/3xL5HO09Z4uhoqJlzpgX6VNNC54DAfeqhI8/0aeNMhzlbKfjBkmAvN5XZaeRjUzq9cP/TCr6MXzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262269; c=relaxed/simple;
	bh=it1Y9q6YoNHxwq+Tuvdp8THTniSvH+sYJZdaJo5nri0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDmJFPfbXWEqhYy+vrw4syQLc5ovOazYPZuzNusxzCYPzfz38UUJ9ewA2G9IO8QuJlp1qnu3uTs/ZMRWwf2Vd0OcPgNRpgayM30ZKFUWjgT7/vDxBe6XWhmm477fXpKrOFJyOqJoztmHa0pxIE/hRkAh+cCw/vk+qmWEPxRQ/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F58oBZcP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F58oBZcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729262267; x=1760798267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=it1Y9q6YoNHxwq+Tuvdp8THTniSvH+sYJZdaJo5nri0=;
  b=F58oBZcPYHyp1BOvPIsNbzvhETwKPHNe90x0IrISFjpkdxHp0XOhJhlk
   6aHANrhSyvkHvGCVzw6FUPqw/YW8/t26xEYm+/XpxRYFicyYzpdMqiTwr
   9yEw5QqEYMQNuWoKZIggaCZtOV30lFgh0eU3IozFK5C0FGjdbuXk8LF0u
   nyG58TN1AlPwvsoNE/ZyBhYq9sOIuugezX2pUj38qlupxu4XJ1oJcBdH5
   FVZxHbmSTaq2Oa1XPegPtNYxbXaMGB1apLV7F7sok1XqEwu2WRuDkhIjE
   ZGN6B8L/O2DNn0SRRy/lfg4Rv/sJgJpQpoTNWgWbab1KQgqGwv1RcEjWM
   A==;
X-CSE-ConnectionGUID: 23fBctw1QAulX8l7UcgQpw==
X-CSE-MsgGUID: q8MFeCGgT56L6EQu0nzYVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28887565"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28887565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 07:37:44 -0700
X-CSE-ConnectionGUID: fk/ikTcbS3qtQSXUpOH+HQ==
X-CSE-MsgGUID: HJJ3bdnyR1iEBUEZMy/3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78788906"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2024 07:37:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1o6n-000Nvd-0F;
	Fri, 18 Oct 2024 14:37:41 +0000
Date: Fri, 18 Oct 2024 22:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 4273/17818]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-cec.c:325:5: warning: no previous
 prototype for 'cdns_mhdp_register_cec_driver'
Message-ID: <202410182208.pxazi04P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: 98ad662c434f5d3a43f0d7dec275529adfb67050 [4273/17818] drm/display: update header path and name
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241018/202410182208.pxazi04P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410182208.pxazi04P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410182208.pxazi04P-lkp@intel.com/

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
