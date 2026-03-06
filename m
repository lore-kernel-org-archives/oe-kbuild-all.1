Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9B33BBC6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816245; cv=none; b=GFxCXwZ1PnkXeAehtwl8sKMxqklGitoNie6D7lFZKudO5ytruJtq9M5nozhgpUOctTZM8XSDSShd0A3/w81jzvBMx8KnLqgk0VwF0ujIWwBsh5/4rYE6f0EJbBPWJfR6MpRjemHQABy6DtyqRZf7EdHmJOXm1hWUn6X31WzJc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816245; c=relaxed/simple;
	bh=2RyyObRa8oqxhcaCrZflA1I4B7pVovstSysG0cmSr84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LvgsRgiFTkNmwr618EPr1zyDXcNh/+PTUz98APnsgK3OoA393bwF+dRvB5gdGTjRvFEKbIuiUagpVFhVyzWTUt0GFE8JCVnHa+Ks1+ovnYNl3h3HxD6nPcHnAOZCMkeNQErLridXJoz07YH/zvC9avWDkGp5KjdIl97k30+K3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3mf0rVb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3mf0rVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772816244; x=1804352244;
  h=date:from:to:cc:subject:message-id;
  bh=2RyyObRa8oqxhcaCrZflA1I4B7pVovstSysG0cmSr84=;
  b=K3mf0rVbe5asRqJce7/9ffC6ynF6gsrZJ0Elkpw4y+RIGD8jwgKxlmxF
   7cLbH13SGpxiepM8KK4TfasBdk5fVorrz1OdmqWTepkft9OnD6YnMsCHT
   MHpPAG5A5dMI8VOOLNbGbSAkSPIJa4Z5hxf+5oBQjNkHggd2MfCCB47VJ
   5PjDECJN22FA4Dz/Y3q0+EAhICwzRoh6RXR1mnV5KzshpON/c/oALI+H9
   PnR/edf60OQevcXB2Emt9nMB/hiCZbSW6/vJygb+QrJIKH9dKMOEsnMN6
   b0QTTHrhWPM0pilxEpO9QQnf1QpxMb0jyinNoxr5zrzG4EX0PAqzD9cLo
   Q==;
X-CSE-ConnectionGUID: 7F1EH522R2y6pyXWUxNQ0Q==
X-CSE-MsgGUID: 2Kc0ES9AS8CTLTovhCMa2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73846128"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73846128"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:57:23 -0800
X-CSE-ConnectionGUID: gXMMajAjSo6Y1aJ69H7Jww==
X-CSE-MsgGUID: wXGwcesPQt6L0TZmj9MViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="215728942"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 08:57:22 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyYUJ-0000000016j-2oZF;
	Fri, 06 Mar 2026 16:57:19 +0000
Date: Sat, 07 Mar 2026 00:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/clk-scaling 7/7] drivers/clk/clk_test.c:204:45:
 warning: passing argument 5 of 'clk_hw_collect_sibling_rates' discards
 'const' qualifier from pointer target type
Message-ID: <202603070045.owjXWJhh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/clk-scaling
head:   35ae2ca226ff0b0f5ca4e9f3ce658d1ba7874e91
commit: 35ae2ca226ff0b0f5ca4e9f3ce658d1ba7874e91 [7/7] clk: test: add kunit test for coordinated rate change
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070045.owjXWJhh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070045.owjXWJhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070045.owjXWJhh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk_test.c: In function 'clk_dummy_div_coordinating_determine_rate':
>> drivers/clk/clk_test.c:204:45: warning: passing argument 5 of 'clk_hw_collect_sibling_rates' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     204 |                                             critical_clk_names,
         |                                             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/clk_test.c:6:
   include/linux/clk-provider.h:1481:41: note: expected 'void *' but argument is of type 'const char * const*'
    1481 |                                   void *filter_data,
         |                                   ~~~~~~^~~~~~~~~~~


vim +204 drivers/clk/clk_test.c

   184	
   185	/*
   186	 * Coordinating divider determine_rate that preserves sibling rates.
   187	 * Uses the generic helpers to collect sibling rates and add coordinated
   188	 * rate changes for the parent and all filtered siblings.
   189	 */
   190	static int clk_dummy_div_coordinating_determine_rate(struct clk_hw *hw,
   191							     struct clk_rate_request *req)
   192	{
   193		static const char * const critical_clk_names[] = { "child1", "child2", NULL };
   194		struct clk_sibling_rate_info critical_clks[ARRAY_SIZE(critical_clk_names) - 1];
   195		struct clk_hw *parent_hw = clk_hw_get_parent(hw);
   196		unsigned int num_critical_clks = 0;
   197		unsigned long lcm_rate = 0;
   198		unsigned int i;
   199		int ret;
   200	
   201		ret = clk_hw_collect_sibling_rates(parent_hw, hw, req->rate,
   202						    (bool (*)(struct clk_hw *, void *))
   203							clk_hw_sibling_name_filter,
 > 204						    critical_clk_names,
   205						    critical_clks, ARRAY_SIZE(critical_clks),
   206						    &num_critical_clks);
   207		if (ret)
   208			return ret;
   209	
   210		for (i = 0; i < num_critical_clks; i++) {
   211			if (critical_clks[i].target_rate == 0)
   212				continue;
   213			if (lcm_rate == 0)
   214				lcm_rate = critical_clks[i].target_rate;
   215			else
   216				lcm_rate = lcm(lcm_rate, critical_clks[i].target_rate);
   217		}
   218	
   219		ret = clk_hw_add_coordinated_rate_changes(req, parent_hw,
   220							   clk_hw_get_rate(parent_hw),
   221							   lcm_rate, critical_clks,
   222							   num_critical_clks);
   223		if (ret)
   224			return ret;
   225	
   226		req->best_parent_rate = lcm_rate;
   227		req->best_parent_hw = parent_hw;
   228		req->rate = req->rate;
   229	
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
