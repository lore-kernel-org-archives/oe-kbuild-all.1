Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389B215F45
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654699; cv=none; b=bcE/4Ji7VW3T3Yz8QjcJ377/CBY22QZMgjxNOHWIsCXaOwVDPIYc4DjzEkL/Es/G7jJ+Ce4ePCZvO4EHOxxkO2irSFPYGW4WVCYVAX+jW9xYGb4cNCi48JUZFueQwGTowOn02A1X3ypNR0aLDaC0BOmE0rJ4Z/2hlY9V560zhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654699; c=relaxed/simple;
	bh=Xp1tmPWbXFGGL+kTTqRAxYkdRAekRvnxrJ7O/cYzP98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/A3sfAw89wh06+uAhDcuvmhvDNYO1oDJE3jcLjr491B7Ag/CioAeegCjilSY4J0XLvsYulXYdbrvx9qt5A4XRM5VIyPEt10Zk2k5q+9fCNDZxdotFPGFA4esyVW+fwSDMnudx4Rb/Xb6R5r+QaL0dZmx0rzdW06lmBDwivGnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkkSMXVH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkkSMXVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740654698; x=1772190698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xp1tmPWbXFGGL+kTTqRAxYkdRAekRvnxrJ7O/cYzP98=;
  b=gkkSMXVHzGQPBgjBP8eJXhb6We2ZmejRkHdOmzOFgcevZG57iYX90JOE
   PMNIhZJW0dtSYE7Bwc87pnS5AQEPd2m+50vW5NNK5J4WrsQddoeRkrE1A
   juE2SGESN7NpTDXhr3Yr8sekCxcmoeIbnW2PUqco7z/ldks1LKSlUzA16
   MxEBiFmdGLg45KvTU5m9Es+flE8nFCKo4cjBpmmGZGOsTNg1LRsmxE1Bg
   00eqAFGh5+u96F2IKjIpYQnoiStYq7B4CoiEljdqU+ar40ppVezHCqUmC
   9hvnZV38KwHtL2VjdiqGYkiGqWpDMbA9UyQBUGfaqp9GdxQTRiQPu4uw0
   w==;
X-CSE-ConnectionGUID: nmugpgrfSV6d4dNTDmggwQ==
X-CSE-MsgGUID: 1GKvjAnEQCOHhdxN8cE2dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="59073328"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="59073328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:11:37 -0800
X-CSE-ConnectionGUID: DuEZPh1bRiSuK287cvOAzw==
X-CSE-MsgGUID: 7pByq1ykQk2rpOV+OYGFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117637165"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 03:11:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnbnh-000DGW-2b;
	Thu, 27 Feb 2025 11:11:33 +0000
Date: Thu, 27 Feb 2025 19:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2] drivers/clk/clk.c:3145:5:
 warning: no previous prototype for function 'clk_set_flags'
Message-ID: <202502271920.3qwgaLJp-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250227/202502271920.3qwgaLJp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271920.3qwgaLJp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271920.3qwgaLJp-lkp@intel.com/

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
