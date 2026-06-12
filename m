Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D5362152
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257555; cv=none; b=IE5g5O8BsyRfkRTL7LihR1TxOW3l/Prrgenu/BNBkmu1iAxV3kzKwUo1lC1+e3URYd1/NTNgJDTo3vKwmyG9KWhX8k3HcdOELNytAp9hEB84kyfDrKqTSE0V1jJPq78KsS/kh89u8lBkjlcn5Vh9b1QJ4RqcfToi50WAjp8SF3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257555; c=relaxed/simple;
	bh=CQpTxIZr97JoWc7gLplkiBV8bfvIQ/X75hjuylm0XHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rtYKK+8QPl1OmBoByUnB4AZXm3EJCmjkdLNlvM/Hbzo4zUgOW1HQetlD7DlQgc6Gj3868BjBIboxte6ka/JAZ6fDv9SdwB0B/oE/iR+kmwNNSKuxhB/i+GMy4mhih66dvqVLADQtqBjHur5FqFm2RT6+k+ooQQnxBc8YFsUiMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpBLdRB+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpBLdRB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781257554; x=1812793554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQpTxIZr97JoWc7gLplkiBV8bfvIQ/X75hjuylm0XHA=;
  b=BpBLdRB+Ejeyo63nonstJrk76o6+SqVd+KqjTS5vNor/XwOHxVLAEDeT
   RQkLolBbJjkQOt6x39leIowYiFwBLCEWdJYQFdP5YMWuMJT0NI7HiOg6u
   V48NBwkTQHvQnldplTBAqrCEOlpmfimWf2eK5GdhzRn7vcGh8Bv0LLivn
   rmItx5LKAwClveBXjq7KKYj3XicvHnhBUJUPUtEnPFQ5MLXQb+SCrL96B
   jYzWeIetYVCyN1RiUPtgrA4mjIYN795GyD1HDJrOLCzF+dG7VFRm2Z65q
   NDgk1vYa7JHINXPHD0Kyc37L2dhZ8jiHzkqyTon4t8oYFN4cXnSmFB9Ar
   g==;
X-CSE-ConnectionGUID: Np0FFIL+QJG+pX8Qp7ivZg==
X-CSE-MsgGUID: YLjMOB8LST+6CG3uapJ83g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85984821"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85984821"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:45:53 -0700
X-CSE-ConnectionGUID: khRxSFU/RS+/jA5bBmBhWw==
X-CSE-MsgGUID: PWFBL4ZETwGsrzVZ0/YU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245683251"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2026 02:45:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXySS-00000000OZp-48gJ;
	Fri, 12 Jun 2026 09:45:48 +0000
Date: Fri, 12 Jun 2026 17:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 "Nuno =?utf-8?Q?S=C3=A1"?= <nuno.sa@analog.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 19282/27391]
 drivers/clk/clk-adjustable-rate.c:166: warning: expecting prototype for
 of_adjustable_clk_setup(). Prototype was for _of_adjustable_clk_setup()
 instead
Message-ID: <202606121711.8pM5bINT-lkp@intel.com>
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
commit: 67d89797e6b7e313f93f3683f7dd0479895ee9b0 [19282/27391] Merge tag 'xilinx-v2021.1' of https://github.com/Xilinx/linux-xlnx.git
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606121711.8pM5bINT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121711.8pM5bINT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121711.8pM5bINT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-adjustable-rate.c:166: warning: Function parameter or member 'node' not described in '_of_adjustable_clk_setup'
>> drivers/clk/clk-adjustable-rate.c:166: warning: expecting prototype for of_adjustable_clk_setup(). Prototype was for _of_adjustable_clk_setup() instead


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
