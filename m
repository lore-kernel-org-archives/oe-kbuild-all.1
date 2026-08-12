Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05632B111
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566144; cv=none; b=PKtwJQsK6xRx/vN7QW0TDbjDLuO7f2a6zboP8FyF8fAXibGMQd2CSO2g1M3PQ7P+Q4Ah235TGjiq/5UwTIPNtSKvffbPE03+HJymT8/7WMrXK+575WDypwkbSjoJWv4VAnYoXnGujt8fNFGbtodJwPwzVtx9kOTwbitxzKIC8Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566144; c=relaxed/simple;
	bh=2ZdJrm540RHQj59w6ajPotMKra8OVg/rphDYsRoqaZo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDkgCPapN5VWfJXRjnyMxsY4mlg3OUV+XEHyGEBV5ErVWWT1OymtnVSUxnN7GktiuIYNdQNxXRwu8KaudcnbHlHOkRDuk6KSPgLyn6VeWIo6BwttAcZ9pwINxwDoDryISCKtViU2cbyBCAigF12QkOrhWcJ0Z8CxjpGvJsgyOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jmad31JD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jmad31JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786566143; x=1818102143;
  h=date:from:to:cc:subject:message-id;
  bh=2ZdJrm540RHQj59w6ajPotMKra8OVg/rphDYsRoqaZo=;
  b=Jmad31JDwbIUc8DymdVweaHnnS01SKmWFi0abidw928JmiCE/n9MMjF8
   x9y/BT3WOAzgUDvC8deJxIjI8cCDXOchkXvN08SWgATgDDKk1U7evwnNZ
   yH58KmIq6iVW3VBbDMGm2fiuNm4Wdnu3idUOY6Vy49JNupc3Wj0aUlClA
   NQFXmYk8vcBDKNiA2te6kQng45rc20SJOtChlWUKMz2FEKHtcrdlnc8Ls
   XSo7wGZOGj7axIwgYWjnSUjqGb4JgqcFUjX2mBpXiu/fa9hzPyfXHRO7s
   gle2cN0LW8lasBF6EGSex0/H58i4vgoQ+0ij8LbchPJjU9021qYYG6Qsi
   g==;
X-CSE-ConnectionGUID: qV5N7uszQfeOpNfBZj2sNQ==
X-CSE-MsgGUID: iMGrPocKRpmeX6AFo0p24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87347995"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87347995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:22:22 -0700
X-CSE-ConnectionGUID: gjgaIq51RFOQcTmItmI8WQ==
X-CSE-MsgGUID: YVPIr7xFT/a+tPUFCYqynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="265727991"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2026 13:22:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFSs-00000000RaE-20Fu;
	Wed, 12 Aug 2026 20:22:18 +0000
Date: Thu, 13 Aug 2026 04:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1]
 drivers/edac/altera_edac.c:661:37: warning:
 'altr_edac_a10_device_inject2_fops' defined but not used
Message-ID: <202608130432.YAfeSR3U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1d929bc650954dfa344168039d30b1bc13a3e48e
commit: 877902ee5c938719299123aadaffdc2dbde2f1bf [1/1] EDAC/altera: Use INTTEST register for Ethernet and USB SBE injection
config: arm64-randconfig-004-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130432.YAfeSR3U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130432.YAfeSR3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130432.YAfeSR3U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/kallsyms.h:12,
                    from include/linux/ftrace.h:11,
                    from include/linux/kprobes.h:29,
                    from include/linux/kgdb.h:19,
                    from arch/arm64/include/asm/cacheflush.h:11,
                    from drivers/edac/altera_edac.c:8:
   include/linux/mmzone.h: In function 'movable_only_nodes':
   include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   drivers/edac/altera_edac.c: At top level:
>> drivers/edac/altera_edac.c:661:37: warning: 'altr_edac_a10_device_inject2_fops' defined but not used [-Wunused-const-variable=]
     661 | static const struct file_operations altr_edac_a10_device_inject2_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/altera_edac.c:641:37: warning: 'altr_edac_device_inject_fops' defined but not used [-Wunused-const-variable=]
     641 | static const struct file_operations altr_edac_device_inject_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/altera_edac.c:543:42: warning: 'a10_l2ecc_data' defined but not used [-Wunused-const-variable=]
     543 | static const struct edac_device_prv_data a10_l2ecc_data;
         |                                          ^~~~~~~~~~~~~~
   drivers/edac/altera_edac.c:542:42: warning: 'a10_ocramecc_data' defined but not used [-Wunused-const-variable=]
     542 | static const struct edac_device_prv_data a10_ocramecc_data;
         |                                          ^~~~~~~~~~~~~~~~~
   drivers/edac/altera_edac.c:541:42: warning: 'l2ecc_data' defined but not used [-Wunused-const-variable=]
     541 | static const struct edac_device_prv_data l2ecc_data;
         |                                          ^~~~~~~~~~
   drivers/edac/altera_edac.c:540:42: warning: 'ocramecc_data' defined but not used [-Wunused-const-variable=]
     540 | static const struct edac_device_prv_data ocramecc_data;
         |                                          ^~~~~~~~~~~~~


vim +/altr_edac_a10_device_inject2_fops +661 drivers/edac/altera_edac.c

c7b4be8db8bc33e Thor Thayer 2016-04-06  656  
064acbd4f4ab509 Thor Thayer 2018-09-25  657  static ssize_t altr_edac_a10_device_trig2(struct file *file,
064acbd4f4ab509 Thor Thayer 2018-09-25  658  					  const char __user *user_buf,
064acbd4f4ab509 Thor Thayer 2018-09-25  659  					  size_t count, loff_t *ppos);
064acbd4f4ab509 Thor Thayer 2018-09-25  660  
064acbd4f4ab509 Thor Thayer 2018-09-25 @661  static const struct file_operations altr_edac_a10_device_inject2_fops = {
064acbd4f4ab509 Thor Thayer 2018-09-25  662  	.open = simple_open,
064acbd4f4ab509 Thor Thayer 2018-09-25  663  	.write = altr_edac_a10_device_trig2,
064acbd4f4ab509 Thor Thayer 2018-09-25  664  	.llseek = generic_file_llseek,
064acbd4f4ab509 Thor Thayer 2018-09-25  665  };
064acbd4f4ab509 Thor Thayer 2018-09-25  666  

:::::: The code at line 661 was first introduced by commit
:::::: 064acbd4f4ab509dd3f31e1a2d1e04a43d5b1009 EDAC, altera: Add Stratix10 peripheral support

:::::: TO: Thor Thayer <thor.thayer@linux.intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
