Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90793E8323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265403; cv=none; b=b+IHGXhN9gCiEyjjr5USL10JYV8kqKUlN2+vKvpeg8CRK6+2tmoh19qFhDIj5wt5JzFXUis2FfoDscGOpvTMBuTbVG+jKPJXQ7huyFtOFZgj2bWmdJ/lqjLA/5VUkKcQmtVgIzcavpKjqASwHY75N7tnbXo/KO/YElozaW8OOCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265403; c=relaxed/simple;
	bh=WB6J/RaqB9qLEeyUHQ0UigaqW1sYpPPsP389CEqlIc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SGI4+LpzpR/9Bmjb2oEDAhgbuVyTUYqh4Kd4VcW9qYoXxvam+nCgIMsKCSYTWONL9oDFBbnlM9/DUHD3n9DIBGlRdF1a0fd3HWuScgaE9W7A/AItgplGPL/pJ33Kkuf/Q3kPprToMlh53GIjzhAsC+tXTfpcOAmQr9DKyfF9lfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhrSWPg5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhrSWPg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781265399; x=1812801399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WB6J/RaqB9qLEeyUHQ0UigaqW1sYpPPsP389CEqlIc0=;
  b=WhrSWPg5Ph9cGMI0nWfLPKk7RVLK7jnvrhYQgukiMIY5ULaaO1AoyM7q
   ieSCKa2aK2aLKpSN7zZRtm+NZusOGE1t4TXP/KnnFRy0Y8Bb+E1DYrarm
   pQIQA5whfJFWyylK4puFILlZ+q5M8Vd5jz1cf6lPi/RCnxSsoXB/v2jP3
   kpSS5wU+P6ZiUq02e/J+AWPliPCFRYVLDtKTmRg2ixpDyxLkKMRh2P6/u
   P8k2PY9PEOEs42Z+xUe6awRrFzoyfqtjU4latvDEt+DBE1DDAdfmWwp5b
   /dn5X0VSwFzsxCj9EfGsC75APNoIeziKlpxdmvIFW4DPVjSHJugpcptA1
   g==;
X-CSE-ConnectionGUID: jw+UR2ypSnOIUECC3oNz3A==
X-CSE-MsgGUID: +F8ea7nqRDSMwTUDI5vaYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85993371"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85993371"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:56:35 -0700
X-CSE-ConnectionGUID: Jm437okCQ+OdKkPwBwORaw==
X-CSE-MsgGUID: j2Tvu4K9SP+6XfDw/jcd7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248690500"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 04:56:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY0Uw-00000000Ohl-1SLd;
	Fri, 12 Jun 2026 11:56:30 +0000
Date: Fri, 12 Jun 2026 19:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Nuno =?utf-8?Q?S=C3=A1"?= <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 26673/27391]
 drivers/clk/clk-adjustable-rate.c:136:13: warning:
 'clk_unregister_adjustable_rate' defined but not used
Message-ID: <202606121902.22tGU4au-lkp@intel.com>
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
commit: b4846602649827192f0ca6eb8f9231a6a0a84482 [26673/27391] clk: clk-adjustable-rate: misc fixes
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606121902.22tGU4au-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121902.22tGU4au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121902.22tGU4au-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-adjustable-rate.c:136:13: warning: 'clk_unregister_adjustable_rate' defined but not used [-Wunused-function]
     136 | static void clk_unregister_adjustable_rate(struct clk *clk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-adjustable-rate.c:94:20: warning: 'clk_register_adjustable_rate_with_accuracy' defined but not used [-Wunused-function]
      94 | static struct clk *clk_register_adjustable_rate_with_accuracy(struct device *dev,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/clk_unregister_adjustable_rate +136 drivers/clk/clk-adjustable-rate.c

    82	
    83	
    84	/**
    85	 * clk_register_adjustable_rate_with_accuracy - register adjustable-rate clock with the
    86	 *					   clock framework
    87	 * @dev: device that is registering this clock
    88	 * @name: name of this clock
    89	 * @parent_name: name of clock's parent
    90	 * @flags: framework-specific flags
    91	 * @adjustable_rate: adjustable clock rate
    92	 * @fixed_accuracy: non-adjustable clock rate
    93	 */
  > 94	static struct clk *clk_register_adjustable_rate_with_accuracy(struct device *dev,
    95								      const char *name,
    96								      const char *parent_name,
    97								      unsigned long flags,
    98								      unsigned long adjustable_rate,
    99								      unsigned long fixed_accuracy)
   100	{
   101		struct clk_adjustable_rate *adjustable;
   102		struct clk *clk;
   103		struct clk_init_data init;
   104		u64 delta;
   105	
   106		/* allocate adjustable-rate clock */
   107		adjustable = kzalloc(sizeof(*adjustable), GFP_KERNEL);
   108		if (!adjustable)
   109			return ERR_PTR(-ENOMEM);
   110	
   111		init.name = name;
   112		init.ops = &clk_adjustable_rate_ops;
   113		init.flags = flags;
   114		init.parent_names = (parent_name ? &parent_name: NULL);
   115		init.num_parents = (parent_name ? 1 : 0);
   116	
   117		/* struct clk_adjustable_rate assignments */
   118		adjustable->adjustable_rate = adjustable_rate;
   119		adjustable->fixed_accuracy = fixed_accuracy;
   120		adjustable->hw.init = &init;
   121	
   122		delta = (u64) adjustable_rate * (u64) fixed_accuracy;
   123		do_div(delta, 1000000000U);
   124	
   125		adjustable->max_rate = min_t(u64, adjustable_rate + delta, ULONG_MAX);
   126		adjustable->min_rate = max_t(s64, adjustable_rate - delta, 0);
   127	
   128		/* register the clock */
   129		clk = clk_register(dev, &adjustable->hw);
   130		if (IS_ERR(clk))
   131			kfree(adjustable);
   132	
   133		return clk;
   134	}
   135	
 > 136	static void clk_unregister_adjustable_rate(struct clk *clk)
   137	{
   138		struct clk_hw *hw;
   139	
   140		hw = __clk_get_hw(clk);
   141		if (!hw)
   142			return;
   143	
   144		clk_unregister(clk);
   145		kfree(to_clk_adjustable_rate(hw));
   146	}
   147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
