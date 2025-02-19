Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE311DFE00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739967261; cv=none; b=Dk0HF7i8b90YcBKjjShBOHoxjqGVJl5wLKNLbQVBSqLKNN7QYVFeERdO4/Fr6StZOhCxSrr4LRlE1CsZs4tF9GSCxoah3YuZ1wm2cLrz1YoDOadapgj49od+RYXxGMhPJcCH5qv1El1flpE+1m0uOg/UyHYw4hXBkpM0BGz5rrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739967261; c=relaxed/simple;
	bh=DBhtexsRawZQE5Apvh/KOA+irN0nD6iXbRVxEeBFcR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pb2zqvsu+e43oSzFx3EW/ub10RcdlYWwADWdgLmJgoIze9Mb0pBbvjgR7QidpZoQNQK2zCrKtm1/X3ALr+6CXrDaleh36Rbi0sX8F1uqfssT0a/kiwzdafnZCISMCAZczAFJSYMNnqnL6tnQ8e+Psxdw7oorVktR0uuKed7N43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkLbjpFO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkLbjpFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739967260; x=1771503260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBhtexsRawZQE5Apvh/KOA+irN0nD6iXbRVxEeBFcR8=;
  b=FkLbjpFO3upXLYni/opWvtaf+/dZdg0gVHASfpHrwtjsc5kL0ES1RbuO
   CPkRL6FN44QBdLKeEkWXOiY83lk60K1/wQF59e2LbXXlJ/61NOe+WY8LY
   I1e+zHHO0D0Xwxh0PX4Y8MgxijtXm2qrDV71TvdVtG0uMb7/yiEuRiPz0
   mWLeMzn1kQLvmxBz8BNyk1HKljWWwlU0+ZawkBARUoEFd3u1tIko6gKEI
   NNimeZWy3Wzbh82n2Vm5HH17folJUKMCssgCD33sys5xcFYB27Lcie1q/
   MKIk7Fp+MjqdBGxbqRKDRVeo9MLt5focV9H/cLSliFVqgk1po9Xy2q0/+
   g==;
X-CSE-ConnectionGUID: dVpbzweOTY6CZUhQClnJCQ==
X-CSE-MsgGUID: kQA6pitnSQSvWYsKC5xkYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40558118"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="40558118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:14:17 -0800
X-CSE-ConnectionGUID: 4bR8hYjRR1ePRXCTDlB2zQ==
X-CSE-MsgGUID: IVjenaVnRiWuEVdgbHUdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114676145"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 04:14:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkixx-0002u1-2E;
	Wed, 19 Feb 2025 12:14:13 +0000
Date: Wed, 19 Feb 2025 20:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: kbandi <kushal.bandi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/media/i2c/max9286.c:108:6: warning:
 variable 'ret' set but not used
Message-ID: <202502192035.PikhUukm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi kbandi,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 9cef7f9b88549f0e9b46631edd29e5f619afa928 [1/1] media: intel-ipu: Merge IPU kernel driver into 4.14 kernel
config: xtensa-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192035.PikhUukm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192035.PikhUukm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192035.PikhUukm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/bug.h:58:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:58:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   include/asm-generic/bug.h:58:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:58:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:69:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:58:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:58:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:69:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   include/asm-generic/bug.h:58:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                   ^~
   include/linux/compiler.h:48:24: note: in expansion of macro '__branch_check__'
    #  define unlikely(x) (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:58:36: note: in expansion of macro 'unlikely'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                       ^~~~~~~~
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/media/i2c/max9286.c: In function 'max96705_write_register':
   drivers/media/i2c/max9286.c:115:11: warning: comparison is always false due to limited range of data type [-Wtype-limits]
      if (val < 0)
              ^
   include/linux/compiler.h:58:30: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                 ^~~~
   drivers/media/i2c/max9286.c:115:3: note: in expansion of macro 'if'
      if (val < 0)
      ^~
   drivers/media/i2c/max9286.c:115:11: warning: comparison is always false due to limited range of data type [-Wtype-limits]
      if (val < 0)
              ^
   include/linux/compiler.h:58:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
   drivers/media/i2c/max9286.c:115:3: note: in expansion of macro 'if'
      if (val < 0)
      ^~
   drivers/media/i2c/max9286.c:115:11: warning: comparison is always false due to limited range of data type [-Wtype-limits]
      if (val < 0)
              ^
   include/linux/compiler.h:69:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
   drivers/media/i2c/max9286.c:115:3: note: in expansion of macro 'if'
      if (val < 0)
      ^~
>> drivers/media/i2c/max9286.c:108:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~


vim +/ret +108 drivers/media/i2c/max9286.c

   103	
   104	/* Serializer register write */
   105	static int max96705_write_register(struct max9286 *max,
   106		unsigned int offset, u8 reg, u8 val)
   107	{
 > 108		int ret;
   109		int retry, timeout = 10;
   110		struct i2c_client *client = v4l2_get_subdevdata(&max->v4l2_sd);
   111	
   112		client->addr = S_ADDR_MAX96705 + offset;
   113		for (retry = 0; retry < timeout; retry++) {
   114			ret = i2c_smbus_write_byte_data(client, reg, val);
 > 115			if (val < 0)
   116				usleep_range(5000, 6000);
   117			else
   118				break;
   119		}
   120	
   121		client->addr = DS_ADDR_MAX9286;
   122		if (retry >= timeout) {
   123			dev_err(max->v4l2_sd.dev,
   124				"%s:write reg failed: reg=%2x\n", __func__, reg);
   125			return -EREMOTEIO;
   126		}
   127	
   128		return 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
