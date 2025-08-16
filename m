Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC32288D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350260; cv=none; b=q54YVgD+0xv7WRa+ZSfY75hkPequMn9Nb35FAH5PTzVBXM/qux1WqAEvZGL5qDh9/WH17aJpxY8ausFZfxgqQdaXz+tIPf44klakMCfe/a9AIcLED5JJpGVVH3OyneA8/Cn8ePAsW0XCT1eZpuFM+10DP6IcLyWrqLtWd9K342w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350260; c=relaxed/simple;
	bh=PTStkdIfU2rTuICxgzygX+J2+tDze/icFICFzGlRQ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcaiMD7Q/bj+QZQ0YII3nz9otpn1po3MwVcr7EU71Lyeuui7EpQ/ZF3/uGy+h0SCmkrW3g7fx78imQZ2q3coR0MjhmEohP0Z78P/jQlyIvdIUTqDeOjmvPCg0PBA34RZym9tJrD1zLCjq6+BEFD7mU8GRw1dIVoEu4C0TC15I6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4ljEx/R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4ljEx/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755350257; x=1786886257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTStkdIfU2rTuICxgzygX+J2+tDze/icFICFzGlRQ8o=;
  b=e4ljEx/RRidRhFmUlOi7r2NLozwcZAurLn4uUtM4DqXxcZw4wPo1vm29
   nrVgTSQr/K759hYWrt2VPpA4srUAEJm+8EDRLqUQezKqhzjYfT8CjMZ1l
   CDAG/373D4MSUIQ97DZhEjeLy9vpyzAPADGRtu8ZY0NuGoF5PvjqUWqQ0
   R4f6DIqriQTiYI4CO5rAwZbyIkosXswPejJnMcRduH//tUb4YAMGJMxgV
   HdHv5Pi75IN2LcdgDFvmK4Sm5qspn3N9P5hM2ayC7+SaiNhaQN5SvPID+
   pH3TfKDjR6ByShGco5wQLmdkwcUbXbU/o8ZHBrn5Cqjxi4ck1yw1bm/mp
   Q==;
X-CSE-ConnectionGUID: nsPNQGwMRsikXBQSQ1G2ug==
X-CSE-MsgGUID: gVrEe/SzQFmQTR+vaJY/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57554871"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57554871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 06:17:36 -0700
X-CSE-ConnectionGUID: GzVaCf7VQ3iKzGNC3JSzCw==
X-CSE-MsgGUID: YvqzF1IxTk+9mcfrmu47UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166702164"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2025 06:17:34 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unGmm-0000jz-0M;
	Sat, 16 Aug 2025 13:17:28 +0000
Date: Sat, 16 Aug 2025 15:16:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1757/1757]
 arch/x86/kernel/unwind_orc.c:199:12: warning: 'orc_sort_cmp' defined but not
 used
Message-ID: <202508161516.nk05OTkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bb7bded3da5e82ce40450cdb7a128c41403bf330
commit: badd79c400ed404df871e1d035bed971d20ead4c [1757/1757] x86/unwind/orc: Remove boot-time ORC unwind tables sorting
config: x86_64-buildonly-randconfig-2001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161516.nk05OTkQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161516.nk05OTkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161516.nk05OTkQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/unwind_orc.c:199:12: warning: 'orc_sort_cmp' defined but not used [-Wunused-function]
     199 | static int orc_sort_cmp(const void *_a, const void *_b)
         |            ^~~~~~~~~~~~
>> arch/x86/kernel/unwind_orc.c:179:13: warning: 'orc_sort_swap' defined but not used [-Wunused-function]
     179 | static void orc_sort_swap(void *_a, void *_b, int size)
         |             ^~~~~~~~~~~~~
   arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section .init.text


vim +/orc_sort_cmp +199 arch/x86/kernel/unwind_orc.c

ee9f8fce9964081 Josh Poimboeuf 2017-07-24  178  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24 @179  static void orc_sort_swap(void *_a, void *_b, int size)
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  180  {
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  181  	struct orc_entry *orc_a, *orc_b;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  182  	struct orc_entry orc_tmp;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  183  	int *a = _a, *b = _b, tmp;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  184  	int delta = _b - _a;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  185  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  186  	/* Swap the .orc_unwind_ip entries: */
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  187  	tmp = *a;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  188  	*a = *b + delta;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  189  	*b = tmp - delta;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  190  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  191  	/* Swap the corresponding .orc_unwind entries: */
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  192  	orc_a = cur_orc_table + (a - cur_orc_ip_table);
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  193  	orc_b = cur_orc_table + (b - cur_orc_ip_table);
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  194  	orc_tmp = *orc_a;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  195  	*orc_a = *orc_b;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  196  	*orc_b = orc_tmp;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  197  }
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  198  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24 @199  static int orc_sort_cmp(const void *_a, const void *_b)
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  200  {
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  201  	struct orc_entry *orc_a;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  202  	const int *a = _a, *b = _b;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  203  	unsigned long a_val = orc_ip(a);
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  204  	unsigned long b_val = orc_ip(b);
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  205  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  206  	if (a_val > b_val)
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  207  		return 1;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  208  	if (a_val < b_val)
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  209  		return -1;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  210  
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  211  	/*
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  212  	 * The "weak" section terminator entries need to always be on the left
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  213  	 * to ensure the lookup code skips them in favor of real entries.
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  214  	 * These terminator entries exist to handle any gaps created by
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  215  	 * whitelisted .o files which didn't get objtool generation.
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  216  	 */
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  217  	orc_a = cur_orc_table + (a - cur_orc_ip_table);
d31a580266eeb1f Josh Poimboeuf 2018-05-18  218  	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  219  }
ee9f8fce9964081 Josh Poimboeuf 2017-07-24  220  

:::::: The code at line 199 was first introduced by commit
:::::: ee9f8fce99640811b2b8e79d0d1dbe8bab69ba67 x86/unwind: Add the ORC unwinder

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
