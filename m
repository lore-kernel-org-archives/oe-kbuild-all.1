Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8696D531
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301920; cv=none; b=uA7Ryg4rOTA5vYzR3lo3jsLBFfkYmj2+giCAui81bJ3cU1XXBJRLhq+JYbfSoGueElQS+gDdSTyq9R/3ColYCYC5yYth2aPZicpZTdGDDtr25YDLNbcMbNielscowFh+kVxQZNzVIN5I2gQgB2U2ZGwhlYDwIUm0sCB4nnNQNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301920; c=relaxed/simple;
	bh=yOIFUadwx4bpfJjz2B6aymuaXiplxpg19w7pYlH9zl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gp0oWmWXHyLKZ2PEfPbGWaX+3uiTxVkj6R34x49FvpMh4PCx0aL4pBYH2DXa7DT8+tXPmRw9f6AAS0zgP+afwvd8OeX1+MRGzwjKN+0mctvyJW8PR8SnW6EvRxdJxdSRa2Y7szbwiG1DhL6Og74SjYG8hcReuGtPZ++GYVN2lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/LKjVA0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/LKjVA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737301919; x=1768837919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOIFUadwx4bpfJjz2B6aymuaXiplxpg19w7pYlH9zl0=;
  b=V/LKjVA07nx3ISP+kaWwUAFb1JLmNc7DvTzT+ZG0akVDNIZIjwPFpLt+
   lmSJ8olPolFdiS6XAn0wr7Sq0KhhmnEhyzGX6MBN8ASkJTRfxROQR2zBr
   2tDRrLs33iolmwdXY8MaFv2HyEcY7zbugc08W0Gdqj+qJqZ6cMPOsRtM2
   0YzGE+gHQ/RwDwu4P0KwlQ59O60zNZTJXB+J7vDuySUhUMb1Ho8LxTYRT
   t8A97Bpqn2x+a0sXIBVQPxRm4bMISfjs1zWzVVktVzRZH5w5qK9AIWhY+
   vJ0RZZq/R0kkkU/HkMEenyXJIKEOofRMMHrM0m3ehj4BRSmxX1M8CrzXY
   Q==;
X-CSE-ConnectionGUID: sNvdVq5oR6yC3LqUk18+wg==
X-CSE-MsgGUID: 7/NDx6joRPy8o2mQ7Jvcvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37910521"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37910521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 07:51:58 -0800
X-CSE-ConnectionGUID: TWETAQ+kStCvOcjLhG5lKg==
X-CSE-MsgGUID: v95IaoM+R4C1K8IDOq6peA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143533223"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2025 07:51:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZXac-000VZj-1v;
	Sun, 19 Jan 2025 15:51:54 +0000
Date: Sun, 19 Jan 2025 23:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2] drivers/clk/clk.c:3145:5:
 warning: no previous prototype for function 'clk_set_flags'
Message-ID: <202501192300.TS5GpmgC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 3179a1a38d96f565a2229b9244285c6abf62b10a [0/2] ANDROID: GKI: clk: Add support for voltage voting
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250119/202501192300.TS5GpmgC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192300.TS5GpmgC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192300.TS5GpmgC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c:624:24: warning: variable 'ignore' set but not used [-Wunused-but-set-variable]
     624 |         int level, rc = 0, i, ignore;
         |                               ^
>> drivers/clk/clk.c:3145:5: warning: no previous prototype for function 'clk_set_flags' [-Wmissing-prototypes]
    3145 | int clk_set_flags(struct clk *clk, unsigned long flags)
         |     ^
   drivers/clk/clk.c:3145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3145 | int clk_set_flags(struct clk *clk, unsigned long flags)
         | ^
         | static 
>> drivers/clk/clk.c:3157:6: warning: no previous prototype for function 'clk_debug_print_hw' [-Wmissing-prototypes]
    3157 | void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
         |      ^
   drivers/clk/clk.c:3157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3157 | void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
         | ^
         | static 
   3 warnings generated.
   drivers/clk/clk.c:4257: warning: Function parameter or member 'dev' not described in 'devm_clk_unregister'
   drivers/clk/clk.c:4455: warning: Function parameter or member 'get_hw' not described in 'of_clk_provider'


vim +/clk_set_flags +3145 drivers/clk/clk.c

  3144	
> 3145	int clk_set_flags(struct clk *clk, unsigned long flags)
  3146	{
  3147		if (!clk)
  3148			return 0;
  3149	
  3150		if (!clk->core->ops->set_flags)
  3151			return -EINVAL;
  3152	
  3153		return clk->core->ops->set_flags(clk->core->hw, flags);
  3154	}
  3155	EXPORT_SYMBOL_GPL(clk_set_flags);
  3156	
> 3157	void clk_debug_print_hw(struct clk_core *clk, struct seq_file *f)
  3158	{
  3159	}
  3160	EXPORT_SYMBOL(clk_debug_print_hw);
  3161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
