Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28B1D61B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761180; cv=none; b=E6HS2wNSPTP1VGbIFuKBIcaQ00w1vrIhUDtuwtnpsv5shqtSdxyrQmFSJHpd0T4jci7MTZqSB5JBcR0KktzjsrQ2Q2R1I5S7Xyhg/NQT4gzAL0y89lgete8lPFBShyjtR+13DbJTBVB/mIcx8DyS2sLaowzrbLfToioPZroiRso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761180; c=relaxed/simple;
	bh=R1cqpfRiXtx+ib/rOTY+mNCJswmoIp6+zLgOP98rfLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JDCvpYqOAckXKMnF8lfutzIQpLOtVvy6ZJ755Oej+dB2k1ovPBt50BoA2XHZv7wsvXx4L1zoZZa/Nh+1rNzwQc5u1Py7H/9O3C7d5rjMO+TS/1qoxGkEtZcxlyDrFpl9kuphhRiiz9bawQMfvDJIf2kOmDuJIE+QQrBQob92hIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbHvZsfv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbHvZsfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773761179; x=1805297179;
  h=date:from:to:cc:subject:message-id;
  bh=R1cqpfRiXtx+ib/rOTY+mNCJswmoIp6+zLgOP98rfLg=;
  b=PbHvZsfvfK0o1MH8CcxB0iKchz3ovrjWxVyW4dnHBbcGK12WQMYmAVBN
   OEw0khdl/MCocSqsV5fJ0Wc6gD4OTed0DK3YiUc9rUuc1mNuhlwq4UHWA
   x/qT4AAn+K6EpACzASuP14WZS0GRlJWQ89tXVFeQcWItlyAlZFG1WfHNe
   YHZXEUcW2EMRRtiuLZPuWEosJTz81SrIp5i160+QcrqZLxI4ivczKtnxW
   76ZTgAXoGP8l18wPBGse3h3q38qBOFoLGgSRjKbtFxwyOHOoAPxa3rTfp
   6X0U2UN2xpyss0BjSKU/+71W3BYmsMQKQBCjdtwCKRrTREsLTXQtHF6kK
   g==;
X-CSE-ConnectionGUID: lR0ufWTMSl2P9dMSeP63gg==
X-CSE-MsgGUID: pCF+qlGgRtOH87so234qqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78691197"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78691197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:26:18 -0700
X-CSE-ConnectionGUID: Q95tq0IES3aImZEliFd63Q==
X-CSE-MsgGUID: 0BSizWLGShePda63SsyVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226438798"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 08:26:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2WJB-000000000dF-1PcC;
	Tue, 17 Mar 2026 15:26:13 +0000
Date: Tue, 17 Mar 2026 23:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 drivers/cma_test/cma_alloc_test_drv.c:93:24: error: no member named
 'cma_area' in 'struct device'
Message-ID: <202603172327.4YVhNiDs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: f13d84382b42c33d4a27e09136721a997da6b225 [30/30] ANDROID: cma: Init the CMA reserved memory during probing
config: x86_64-buildonly-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260317/202603172327.4YVhNiDs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172327.4YVhNiDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172327.4YVhNiDs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/cma_test/cma_alloc_test_drv.c:93:24: error: no member named 'cma_area' in 'struct device'
      93 |         if (ret || !pdev->dev.cma_area) {
         |                     ~~~~~~~~~ ^
   drivers/cma_test/cma_alloc_test_drv.c:140:12: error: incompatible function pointer types initializing 'int (*)(struct platform_device *)' with an expression of type 'void (struct platform_device *)' [-Wincompatible-function-pointer-types]
     140 |         .remove = cma_test_remove,
         |                   ^~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +93 drivers/cma_test/cma_alloc_test_drv.c

    78	
    79	static int cma_test_probe(struct platform_device *pdev)
    80	{
    81		int ret;
    82		const struct of_device_id *of_id;
    83	
    84		pr_info("Probing device");
    85	
    86		of_id = of_match_device(cma_test_dt_ids, &pdev->dev);
    87		if (!of_id) {
    88			pr_info("The node was not found in DTB");
    89			return -ENODEV;
    90		}
    91	
    92		ret = of_reserved_mem_device_init(&pdev->dev);
  > 93		if (ret || !pdev->dev.cma_area) {
    94			dev_err(&pdev->dev,
    95				"The CMA reserved area is not assigned (ret %d)\n",
    96				ret);
    97			return -EINVAL;
    98		}
    99	
   100		ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
   101		if (ret) {
   102			of_reserved_mem_device_release(&pdev->dev);
   103			return ret;
   104		}
   105	
   106		return 0;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
