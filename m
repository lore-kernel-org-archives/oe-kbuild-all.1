Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD08BEE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743393366; cv=none; b=Xly1ooAR8HvDKgJibXHswDDhSI/QPdUYVsk2UOzy4C5pqfHxQGHx2KiT70uhQohVwJjJlxfPq1Ht2RHr+4a1Awfl7slGdyg5GuEuRfK3ogN25GTy5rS9HL6OBdF+pBrM5ATcV7S/683EqZm1H9R3E11BC2cwfkQNOnh8wgSlhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743393366; c=relaxed/simple;
	bh=6zKk4MYaIxhYQLAH+A+aKjJmZXj02L5KsENmgTj1NeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QAA83uODffByL5dlAbka/gFFy0MF+c1JrxKJRK594Uesyz/aK0ZXgQkfy2wXTaX+VE11JWhLlaEfSLyLJxSPQ/YNF0tiTeJvBGI0ORWhUdQiExB1EwDE+YTMJp94BZpBLFwQeNtUrC23YOcZogPwb2K5Mse1R6VpCxM21bm4Ifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgU2N8iR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgU2N8iR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743393364; x=1774929364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6zKk4MYaIxhYQLAH+A+aKjJmZXj02L5KsENmgTj1NeI=;
  b=EgU2N8iRzWxXclfDLdqHHOS7tswZnVXPfVT0mWjycEVYzdJSI+HavL2v
   Ghi2MObQgKSI8CLYk0c4qLkRuiKiNPgM/gcnj0tjZul0Bq7BUJDWK1bcy
   G673t3rWjbXR72nEctKwWV21yhyoBxCfqTp2F4FmyBos5JRVGNJsi7kLW
   18gP3hnAV55JskMoPmNqBZaV0Urr9EBWS2l2SHcbzOGcFuK+BLrBTQbQI
   JM2rQzPEEbbu8dx3rVwY3jeS7BYaN6WBgJdSCzjlKxt1swqmWetjo6nlj
   TOPI/mre4iwfUCHzKDgR8JZXI7mIRS8UDaVN5ekPcKQjxLhhRPpf7V86n
   w==;
X-CSE-ConnectionGUID: Lub4+AILRp20GS80ALrxFA==
X-CSE-MsgGUID: LpuBj50dS8aXwUU+kOCNlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="62205391"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="62205391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 20:56:04 -0700
X-CSE-ConnectionGUID: iGh2WC8XR1uGsNI4YDSquA==
X-CSE-MsgGUID: gG5w+PvhTrCZcqm9MsldyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125874739"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Mar 2025 20:56:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz6Fk-00091i-11;
	Mon, 31 Mar 2025 03:56:00 +0000
Date: Mon, 31 Mar 2025 11:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 0/2] drivers/clk/clk.c:3145:5:
 warning: no previous prototype for function 'clk_set_flags'
Message-ID: <202503311111.HnmFmX6p-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20250331/202503311111.HnmFmX6p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311111.HnmFmX6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311111.HnmFmX6p-lkp@intel.com/

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
