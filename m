Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052110A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768634; cv=none; b=Zhi4yRGFZCEp9PkiqV9peB11uhM0ujd2GomdfnWTYLxCqaiuNdaeIRjkPY6qn5M5TL6vK8Npgup0CTaaOKa2IwSsLA+RujpxJiCZ1Z26IA//BLMS/lZ2eYBau7Rw43YMuGtP6EyTqAOstXcYaG38LYMImb+dY0Gysr03BqZ5G2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768634; c=relaxed/simple;
	bh=Vfmz/PC3OFdYsUCoKGoIj49F5FVv54CObl0hwIcVZYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hv/weKgynJ07DK0b4hdACBcrmqoFf+sJuW8rRgUZh/anbM7yjVl6Y0H/k/4UytCRtyGoBUKY9RU3+h6WkCm7B/1SFiRF8AiiBw3RZN963n/jfZa6+HVuDeMLeaetsVn0dnXy6U3wrHPc9DvplxEWvco1JgGE6b1e+y3Sy/Ii1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnGrCajs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnGrCajs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768633; x=1763304633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vfmz/PC3OFdYsUCoKGoIj49F5FVv54CObl0hwIcVZYs=;
  b=OnGrCajsMlv7nIylg8FsJywzFnJpGHpN/FyeGVGvIOLuXT15d0OgzRgh
   IdFgQGSGDAcjg5kLC3Fy3Xzavp/9T/sCi2fGRWsr9Jv3LwC+mqswkS4LX
   B7p+g5278cKtdiJE+sn1OWzWX8bIHiLUz0o//rnoPjK3glu3svn78tix5
   DYfLWzpdNqzGDuAc3xn62nFY6BRdkwLCw6BkVSYY/YpZ1USOrZnQqYnAH
   Z34jNooFxqWyQONJpSh63jhibITuEGeIyB4DT6tEvgSEZgc/myWeVJwNx
   zqORYD6++99xzIHu/v5mohcwEVdn1C3p8N44Syp+dtX1tCYfRf0wI50Dz
   w==;
X-CSE-ConnectionGUID: 45xiTxrRQ36odT/zKaldOg==
X-CSE-MsgGUID: U8Dp0eOoRAGiKapbBykduA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49197532"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49197532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:32 -0800
X-CSE-ConnectionGUID: 1orjB6vzRwKrCP+3fMYvPA==
X-CSE-MsgGUID: 1eWwfcZVSCKyUULs17pV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88711498"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2024 06:50:32 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000hj-1d;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 21/28] drivers/fwctl/cxl/cxl.c:68:9: error:
 cleanup argument not a function
Message-ID: <202411161416.maeaSV6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   350392d25327a67c7299583a05481dfe524c7257
commit: 5c902403b6f17b767d928359b553668e4ca61b42 [21/28] fwctl/cxl: Add hw_info callback
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161416.maeaSV6t-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161416.maeaSV6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161416.maeaSV6t-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
   drivers/fwctl/cxl/cxl.c:47:16: error: implicit declaration of function 'kzalloc'; did you mean 'key_alloc'? [-Werror=implicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
         |                key_alloc
   drivers/fwctl/cxl/cxl.c:47:14: warning: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_hw_info':
>> drivers/fwctl/cxl/cxl.c:68:9: error: cleanup argument not a function
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |         ^~~~
>> drivers/fwctl/cxl/cxl.c:68:36: error: implicit declaration of function 'kvzalloc'; did you mean 'key_alloc'? [-Werror=implicit-function-declaration]
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |                                    ^~~~~~~~
         |                                    key_alloc
>> drivers/fwctl/cxl/cxl.c:68:36: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +68 drivers/fwctl/cxl/cxl.c

    55	
    56	static void *cxlctl_hw_info(struct fwctl_uctx *uctx, int commands, size_t *out_len)
    57	{
    58		struct cxlctl_uctx *cxlctl_uctx =
    59			container_of(uctx, struct cxlctl_uctx, uctx);
    60		struct fwctl_device *fwctl = uctx->fwctl;
    61		struct cxlctl_dev *cxlctl =
    62			container_of(fwctl, struct cxlctl_dev, fwctl);
    63		int rc;
    64	
    65		if (commands > cxlctl_uctx->nr_commands)
    66			return ERR_PTR(-EINVAL);
    67	
  > 68		void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
    69		if (!out)
    70			return ERR_PTR(-ENOMEM);
    71	
    72		rc = cxl_mailbox_user_commands_info_get(cxlctl->mbox,
    73							commands, out, out_len);
    74		if (rc)
    75			return ERR_PTR(rc);
    76	
    77		return_ptr(out);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
