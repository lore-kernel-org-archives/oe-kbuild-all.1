Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757C36EAB2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273754; cv=none; b=hPljnAZQiZccT52XzkLtdWBM9OHPkiiUpCvxlgh3GVYuxN0ZsaBXJh14+PINr2p92hWEWJOSPVFyIMlol07Skn3ShgAIZz54dAs950XLWWA1T3A1HzuIkAlKbzvySXPA40tPw9kN1XM31ya0WKNmCLYDe4R1hwSd/DjB1v7yYeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273754; c=relaxed/simple;
	bh=3MxIwN27nFQhRr1kA51XcnxX3jfn0CBfYy65uVQjmaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BIVVj9kLeLJ+V65zalml6kATpiv8xDu+eNXIoOJ1zvaKe9xZ92edK07pLEXXaUVhz4l5egp8s/P+j7LzGqYiiGXeIDX5ziNflmWT3LP/meyrOXPT5SlFunH9NlbYHd8uVVoGt1R9kgNZGCqZqDzhpyZell4nN+k6GT5kCcBz1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsZg6nkO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsZg6nkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781273750; x=1812809750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MxIwN27nFQhRr1kA51XcnxX3jfn0CBfYy65uVQjmaw=;
  b=bsZg6nkOZ/sMuHtnPlFmooxNbVzbOSXX430GZ0KbvT/LNqpDnp6ZjVQo
   DoB7oLQ+YpYVr5enOl4zi5iilvTJv/KQhWA5DQfVrnWW/Q+WoLSe9mKY3
   mTwE5y24VlP/GGaR3zs6Bm2RcAwdTtMeMMHPfqqg4Jf0TzE9L+JGHrfef
   Ux8SqQEX4WNCBFfnIfGDdxApakXxVQctYiy3Nx0cD19EYzra0CpQA6TX8
   6ci7xCo2cFV4IyUMBtHcX2vYr2FkPrsEk+0h/bloDBpB7WpebU1jyE4+/
   wNXajcfkfwmhuYI78a5j0g8jlGK+wOWVL5IBVfct6+/11NL1gXokqbtkb
   A==;
X-CSE-ConnectionGUID: aQlkW6HtQx2WuiwcM5h9Cg==
X-CSE-MsgGUID: 4uUC63FITJm2TEvp/+tsqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107537500"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107537500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:15:49 -0700
X-CSE-ConnectionGUID: mqsuFAOcSrKpxhZn6SdmvQ==
X-CSE-MsgGUID: ThaldhReTmesqRqZas5v3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="244408811"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 07:15:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY2fg-00000000Oqt-3FyK;
	Fri, 12 Jun 2026 14:15:44 +0000
Date: Fri, 12 Jun 2026 22:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 "Nuno =?utf-8?Q?S=C3=A1"?= <nuno.sa@analog.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 26668/27391]
 drivers/clk/clk-adjustable-rate.c:166: warning: Function parameter or struct
 member 'node' not described in '_of_adjustable_clk_setup'
Message-ID: <202606122230.RvSBq6Xl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 3b1f15dc5c4de92663059705d6f1cb6fc87d4470 [26668/27391] Merge tag 'xilinx-v2025.1' https://github.com/Xilinx/linux-xlnx.git
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606122230.RvSBq6Xl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122230.RvSBq6Xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122230.RvSBq6Xl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-adjustable-rate.c:166: warning: Function parameter or struct member 'node' not described in '_of_adjustable_clk_setup'
   drivers/clk/clk-adjustable-rate.c:166: warning: expecting prototype for of_adjustable_clk_setup(). Prototype was for _of_adjustable_clk_setup() instead


vim +166 drivers/clk/clk-adjustable-rate.c

32d85645476ed0 Michael Hennerich 2016-10-18  160  
32d85645476ed0 Michael Hennerich 2016-10-18  161  #ifdef CONFIG_OF
32d85645476ed0 Michael Hennerich 2016-10-18  162  /**
32d85645476ed0 Michael Hennerich 2016-10-18  163   * of_adjustable_clk_setup() - Setup function for simple adjustable rate clock
32d85645476ed0 Michael Hennerich 2016-10-18  164   */
32d85645476ed0 Michael Hennerich 2016-10-18  165  struct clk *_of_adjustable_clk_setup(struct device_node *node)
32d85645476ed0 Michael Hennerich 2016-10-18 @166  {
32d85645476ed0 Michael Hennerich 2016-10-18  167  	struct clk *clk;
32d85645476ed0 Michael Hennerich 2016-10-18  168  	const char *clk_name = node->name;
32d85645476ed0 Michael Hennerich 2016-10-18  169  	u32 rate;
32d85645476ed0 Michael Hennerich 2016-10-18  170  	u32 accuracy = 0;
32d85645476ed0 Michael Hennerich 2016-10-18  171  	int ret;
32d85645476ed0 Michael Hennerich 2016-10-18  172  
32d85645476ed0 Michael Hennerich 2016-10-18  173  	if (of_property_read_u32(node, "clock-frequency", &rate))
32d85645476ed0 Michael Hennerich 2016-10-18  174  		return ERR_PTR(-EIO);
32d85645476ed0 Michael Hennerich 2016-10-18  175  
32d85645476ed0 Michael Hennerich 2016-10-18  176  	if (of_property_read_u32(node, "clock-accuracy", &accuracy))
32d85645476ed0 Michael Hennerich 2016-10-18  177  		return ERR_PTR(-EIO);
32d85645476ed0 Michael Hennerich 2016-10-18  178  
32d85645476ed0 Michael Hennerich 2016-10-18  179  	of_property_read_string(node, "clock-output-names", &clk_name);
32d85645476ed0 Michael Hennerich 2016-10-18  180  
32d85645476ed0 Michael Hennerich 2016-10-18  181  	clk = clk_register_adjustable_rate_with_accuracy(NULL, clk_name, NULL,
32d85645476ed0 Michael Hennerich 2016-10-18  182  						    0, rate, accuracy);
32d85645476ed0 Michael Hennerich 2016-10-18  183  	if (IS_ERR(clk))
32d85645476ed0 Michael Hennerich 2016-10-18  184  		return clk;
32d85645476ed0 Michael Hennerich 2016-10-18  185  
32d85645476ed0 Michael Hennerich 2016-10-18  186  	ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
32d85645476ed0 Michael Hennerich 2016-10-18  187  	if (ret) {
32d85645476ed0 Michael Hennerich 2016-10-18  188  		clk_unregister(clk);
32d85645476ed0 Michael Hennerich 2016-10-18  189  		return ERR_PTR(ret);
32d85645476ed0 Michael Hennerich 2016-10-18  190  	}
32d85645476ed0 Michael Hennerich 2016-10-18  191  
32d85645476ed0 Michael Hennerich 2016-10-18  192  	return clk;
32d85645476ed0 Michael Hennerich 2016-10-18  193  }
32d85645476ed0 Michael Hennerich 2016-10-18  194  

:::::: The code at line 166 was first introduced by commit
:::::: 32d85645476ed0845d7e11d75647d3ab0f15239d drivers/clk/clk-adjustable-rate: CCF new adjustable rate driver

:::::: TO: Michael Hennerich <michael.hennerich@analog.com>
:::::: CC: Michael Hennerich <michael.hennerich@analog.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
