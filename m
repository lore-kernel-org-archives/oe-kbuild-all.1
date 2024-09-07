Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3523A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 00:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725669325; cv=none; b=YEY4qJ1R7yuVg6LCBIjJs5gc6s8CepGj5jKcLa82ZONmzKzliwOEUewNnEQFacHKzxz2gq3OZPGojeplIhSnnNfYBXbyITpNejLKoC793OXgWJ8jegZpjX+yIj+Xta7WQpSUeOHh2gtsFsC4UAhgQO3Vm6BOipypUdW1RVjsaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725669325; c=relaxed/simple;
	bh=SSYmJ29vN0AmeryudefBf2ex9aMR+zsELepfMogsrDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLp54rkr0o6NmguGQuADExxC+yo3UE5mzz0+JaQi0rFCPacLPj5XjXVwuewiAn015678qu56qXKinxiQNNnWhSJVNnRBS3ePwkH9JTmXHZJwfLuuiL/8fuSmnKT5sovy2UaPnZcdDu2vknSM4z8Mn85xtHNKbJw3C8HagtIg5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1AyMX1a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1AyMX1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725669323; x=1757205323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSYmJ29vN0AmeryudefBf2ex9aMR+zsELepfMogsrDg=;
  b=Y1AyMX1aeuYBXJE3mucBF8umMItkVAT0H/yCV3T+/rf3FdOF8hNCLCk6
   AmKRl4+8X6o5XG0jO1jG1DjpKdjB/s2wraNq1Da/A3vfNf+6TqFF41m73
   xmtAARNl4hxmDKvlkdOmpvFG77JDKcAOOvaAOmGVbjQKDFV4kp24Jk2oN
   4fcoH10XnXKH4RKXJ3RBqXtoSCpXQCqcVbkrXytUtPKKBBILWYOQaKQ2b
   cA8K4htBGiVHsVoFu2Y6HgiRkqDVeTAPGmjSNduiZWy6CUwTpYUvK/thN
   pHs3CInSvvVR21vngcyDKhJsQUYRqncHZLpasCE/07+YM86diOYeAAire
   Q==;
X-CSE-ConnectionGUID: SPTX+G7hR8uQtW98svmbMQ==
X-CSE-MsgGUID: fMVInFNPQDmsB3S5O9PT1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24604499"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24604499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 17:35:22 -0700
X-CSE-ConnectionGUID: Dmj+W4BHQr62XeDvd9lewQ==
X-CSE-MsgGUID: 7SUVBFpiRYirZUvO0FrZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66344233"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2024 17:35:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smjQ7-000BuB-0h;
	Sat, 07 Sep 2024 00:35:19 +0000
Date: Sat, 7 Sep 2024 08:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Lucas Stach <l.stach@pengutronix.de>
Subject: [pengutronix:mfe/v6.10/topic/touchscreen-axiom 6/6]
 drivers/input/touchscreen/touchnetix_axiom.c:594:69: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202409070843.gi38ZcOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/linux-0-day mfe/v6.10/topic/touchscreen-axiom
head:   24a4e77c6d046026ad63145d5a5a71bca496da45
commit: 24a4e77c6d046026ad63145d5a5a71bca496da45 [6/6] Input: Add TouchNetix aXiom I2C Touchscreen support
config: sparc-randconfig-r113-20240906 (https://download.01.org/0day-ci/archive/20240907/202409070843.gi38ZcOG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409070843.gi38ZcOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070843.gi38ZcOG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/touchnetix_axiom.c:594:69: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] command @@     got unsigned short [usertype] cmd @@
   drivers/input/touchscreen/touchnetix_axiom.c:594:69: sparse:     expected restricted __le16 [usertype] command
   drivers/input/touchscreen/touchnetix_axiom.c:594:69: sparse:     got unsigned short [usertype] cmd
>> drivers/input/touchscreen/touchnetix_axiom.c:626:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] command @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:626:21: sparse:     expected restricted __le16 [usertype] command
   drivers/input/touchscreen/touchnetix_axiom.c:626:21: sparse:     got int
>> drivers/input/touchscreen/touchnetix_axiom.c:628:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:628:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:628:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:629:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:629:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:629:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:656:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] command @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:656:21: sparse:     expected restricted __le16 [usertype] command
   drivers/input/touchscreen/touchnetix_axiom.c:656:21: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:687:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] command @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:687:21: sparse:     expected restricted __le16 [usertype] command
   drivers/input/touchscreen/touchnetix_axiom.c:687:21: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:688:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:688:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:688:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:689:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:689:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:689:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:690:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:690:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:690:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:713:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:713:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:713:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:720:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:720:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:720:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c:727:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int @@
   drivers/input/touchscreen/touchnetix_axiom.c:727:27: sparse:     expected restricted __le16
   drivers/input/touchscreen/touchnetix_axiom.c:727:27: sparse:     got int
   drivers/input/touchscreen/touchnetix_axiom.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +594 drivers/input/touchscreen/touchnetix_axiom.c

   590	
   591	static int
   592	axiom_u02_rev1_send_single_cmd(struct axiom_data *ts, u16 cmd)
   593	{
 > 594		struct axiom_u02_rev1_system_manager_msg msg = { .command = cmd };
   595	
   596		return axiom_u02_send_msg(ts, &msg, true);
   597	}
   598	
   599	static int axiom_u02_handshakenvm(struct axiom_data *ts)
   600	{
   601		return axiom_u02_rev1_send_single_cmd(ts, AXIOM_U02_REV1_CMD_HANDSHAKENVM);
   602	}
   603	
   604	static int axiom_u02_computecrc(struct axiom_data *ts)
   605	{
   606		return axiom_u02_rev1_send_single_cmd(ts, AXIOM_U02_REV1_CMD_COMPUTECRCS);
   607	}
   608	
   609	static int axiom_u02_stop(struct axiom_data *ts)
   610	{
   611		return axiom_u02_rev1_send_single_cmd(ts, AXIOM_U02_REV1_CMD_STOP);
   612	}
   613	
   614	static int axiom_u02_save_config(struct axiom_data *ts)
   615	{
   616		struct axiom_u02_rev1_system_manager_msg msg;
   617		struct device *dev = ts->dev;
   618		int ret;
   619	
   620		if (axiom_usage_rev(ts, AXIOM_U02) != 1 &&
   621		    axiom_usage_rev(ts, AXIOM_U02) != 2) {
   622			dev_err(dev, "Only u02 rev.1 and rev.2 are supported at the moment\n");
   623			return -EINVAL;
   624		}
   625	
 > 626		msg.command = AXIOM_U02_REV1_CMD_SAVEVLTLCFG2NVM;
   627		msg.parameters[1] = 0; /* Don't care */
 > 628		msg.parameters[1] = AXIOM_U02_REV1_PARAM1_SAVEVLTLCFG2NVM;
   629		msg.parameters[2] = AXIOM_U02_REV1_PARAM2_SAVEVLTLCFG2NVM;
   630	
   631		ret = axiom_u02_send_msg(ts, &msg, false);
   632		if (ret)
   633			return ret;
   634	
   635		/* Downstream axcfg.py waits for 2sec without checking U01 response */
   636		ret = wait_for_completion_timeout(&ts->nvm_write_done,
   637						  msecs_to_jiffies(2 * MSEC_PER_SEC));
   638		if (!ret)
   639			dev_err(ts->dev, "Error save volatile config timedout\n");
   640	
   641		return ret ? 0 : -ETIMEDOUT;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
