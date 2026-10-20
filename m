Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507496;
	b=IeaSyHUCyzKury974gPPar8cMIpzZ3qMgSzcxRrjP13AKllTpD4cXxiJHmsnMmuhPk7J
	 bsDBXzqVswie5w05CYSZFtIMmbWO+f/6V6oBxQFMRs1aI0rpn0ptG09Ve68RAuS+FF028
	 jN+x3tyD0g5e3y5TaGIMb2853VqRBjVu2woxthDW2LHD+4+FW8L50qxZiXiPvRfq6IgS+
	 pNg45wJW4uWS+cIIwx6340r1ecvFMTkag8l8HSWH/SQkW/NtGKqjMf/FzdX6drphZ9a23
	 Vo2GVn/ZoQ8l7ASoTXeC5M4nTSqQjabnS2lXFrVLIUIonP/3uTwWz/vHtiM9VPkttaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507496;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent;
	bh=zDmGjWDTrry1e61eMZDMUTT/J2cySDBXqb2JMulxJHk=;
	b=2+OPomFHjlzSr0hMWIwaI25EmmZPnvRdNvpw8y2aPVcdc9whCDz/KdfA8eRPUxbeV3ob
	 7zNjptz5rZq1fhalE2FBYzf1lqjcxY19JhXnXyi90qSXgC1BwGgxvpIsW+2R9y/FtFOqC
	 /neLXrvoDg7Rof8XS0+QflmK34h3TIAe9APFcMqElthwBPZzuU8KBML/I/OF78u45b/Hm
	 J2DsN1D2zWet5N9EerTrF2+MYPWpWLkxMsnoXe32SIXvNBERaoQyqvM4p3Yx6SUB3sGGl
	 GNKyXWaVmTty4p0HCiPsh5KJtpiu4HUwLOZSAtiLPTePVffYgmU+nw2/+h27XP65fbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zva19nxb;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 14:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C4A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zva19nxb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792507495; x=1824043495;
  h=date:from:cc:subject:message-id;
  bh=dwxpkdNVSrlBXe8V1IxKED74robss0C6kuFMPAAxFrg=;
  b=Zva19nxbQ3EAXmi01Mz2RVb7XHwg4kqctJUEFbUrm4nhRfdVn449CkrV
   lg4rwD6+r2GkUTKwUgpq9BthOQ+643Qn58bbPRygXXFHmBrbTtPPam1xa
   rSqu4fu5M8uoiCu8G5hH+zMJm679Yrhb0VQZaIeSG43+TvSZOMUK5FSi0
   /YjUuaqOgyScNz6PPBphGoIxxSUqgXtGJK1ufeuOPhNihRYtqtbe0uy51
   1zHKGIJB1Yr4czi79JUN/9Pdv2mpdx8Ew1fBc4hmPQjBDQuEBck5JEHEy
   228j/Mt9XVV/m5XUr/q9aWQRNlTt5lrI9sSzeTVPCfqDuYwdDmuqE0+Xt
   w==;
X-CSE-ConnectionGUID: Ocn5WTzFTdqUfp+Suz2nUw==
X-CSE-MsgGUID: 9D20esKuTUeIIp2duIHwXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1218986"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1218986"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 07:44:54 -0700
X-CSE-ConnectionGUID: oI+NxkTAQSOaV5BnOPLUfg==
X-CSE-MsgGUID: v2JbGSyKSfG4IkcNHzTEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2788687"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2026 07:44:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJB59-00000000Nhq-2Otr;
	Tue, 20 Oct 2026 14:44:51 +0000
Date: Tue, 20 Oct 2026 22:44:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 52/52]
 drivers/media/i2c/lt6911gxd.c:637:12: warning: 'lt6911gxd_resume' defined but
 not used
Message-ID: <202610202239.ek7qbw1P-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Muhammad,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   773b2eb76d5ee325c7d60f2c161b9b12f32d13fa
commit: c8916bd5daa29aca311b6d811197dfeb9af3c368 [52/52] Add Lontium sensor support for ipu7
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261020/202610202239.ek7qbw1P-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202239.ek7qbw1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202239.ek7qbw1P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/lt6911gxd.c:637:12: warning: 'lt6911gxd_resume' defined but not used [-Wunused-function]
     637 | static int lt6911gxd_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911gxd.c:625:12: warning: 'lt6911gxd_suspend' defined but not used [-Wunused-function]
     625 | static int lt6911gxd_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/lt6911gxd_resume +637 drivers/media/i2c/lt6911gxd.c

dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  624  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15 @625  static int lt6911gxd_suspend(struct device *dev)
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  626  {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  627  	struct i2c_client *client = to_i2c_client(dev);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  628  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  629  	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  630  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  631  	/* Active low gpio reset, set 1 to power off sensor */
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  632  	gpiod_set_value_cansleep(lt6911gxd->reset_gpio, 1);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  633  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  634  	return 0;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  635  }
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  636  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15 @637  static int lt6911gxd_resume(struct device *dev)
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  638  {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  639  	struct i2c_client *client = to_i2c_client(dev);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  640  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  641  	struct lt6911gxd *lt6911gxd = to_lt6911gxd(sd);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  642  	int ret = 0;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  643  	int count = 0;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  644  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  645  	if (lt6911gxd->reset_gpio != NULL) {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  646  		do {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  647  			gpiod_set_value_cansleep(lt6911gxd->reset_gpio, 0);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  648  			ret = gpiod_get_value_cansleep(lt6911gxd->reset_gpio);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  649  			usleep_range(200 * 1000, 200 * 1000 + 500);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  650  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  651  			if (++count >= 20) {
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  652  				dev_err(&client->dev,
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  653  					"%s: failed to power on reset gpio, reset gpio is %d",
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  654  					__func__, ret);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  655  				break;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  656  			}
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  657  		} while (ret != 0);
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  658  	}
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  659  
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  660  	return ret;
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  661  }
dab4e1f04f20f6 Shahidan, Muhammad Shahmil 2026-04-15  662  

:::::: The code at line 637 was first introduced by commit
:::::: dab4e1f04f20f6e3fd88b5952d40b7a20d4edd68 Add psys driver and i2c sensor

:::::: TO: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>
:::::: CC: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
