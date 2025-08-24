Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD713AA2F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756070293; cv=none; b=tpceN35mRO2H/2wpmiDW1dBlqCoTmeKSwVJ16lJJiw0GYxIOwnyzmVp0C8lORH76f9IavgES+sPVae62jKGCpxoezVsBnrZdpE0z/DLnMOAEVOblIY5jlp74/vpe+b+ldVyoGVhaiTbKi9MTyeDnMSumitzAshnRHJpFA8t6Cp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756070293; c=relaxed/simple;
	bh=SnlzZkOU1jv2BzY8sHtahlrWlxacuqb8NUwqrTmiqgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pk4m/pFL1hMhyPUDC4SuNy4zHG3aLeVJHBbnq2cuMITiZWaXu8e+pN5wXN0Vion7exqNpUoG0AaqB+HEDT6AqWp6yHniN7rANwjPZM7AYQdFXBpuRJDpcCenRSE8B2k9deKxt9uQQ9U5hrDuzApy1EZ2Yisno9mYQaHfJTYKx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAEshPNl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAEshPNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756070291; x=1787606291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnlzZkOU1jv2BzY8sHtahlrWlxacuqb8NUwqrTmiqgo=;
  b=lAEshPNl4B34nIi2925EZlnMZZcq4TbYgI9ZzZRzoknGJtBWq9Rz5dd2
   E9aHKhzkGhJLhGa0RKqLvw41wlHaaoISf/MJxlxmX/oRRce6k1l+IiZki
   rNXgZioeCQewTgtzN+lhf1EkWa6Va9cXqCsVtKBNggu9bEGoiicIXmmxL
   xo+ubOJywH90o0ox2hq4dFy8y/HyB2nPkPMJ6pTuJJ1uIsrSMsvTkPn03
   sTdVfYlSMjPYnRvEoaXwG/Ii0WSnBXrN2On2IrEVTULTFn0ubRXDHuya1
   tf834ar/94rKibiubbVi6OqNKll0YfB8qjZzBPIKD2TEmUq3u+4xYPHSc
   w==;
X-CSE-ConnectionGUID: H4wYOC46RS2maFPj1jvfDw==
X-CSE-MsgGUID: TDvyujClRiWBic2I0iHFIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="57995487"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57995487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 14:18:09 -0700
X-CSE-ConnectionGUID: vDgp+Wx+Qo6+zx/6ameBtQ==
X-CSE-MsgGUID: Bbx8qrrISYC/yxMglymFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174420667"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2025 14:18:08 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqI6H-0002FP-34;
	Sun, 24 Aug 2025 21:18:05 +0000
Date: Sun, 24 Aug 2025 23:17:16 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2/2] drivers/mtd/ubi/wl.c:322:27:
 warning: variable 'prev_e' set but not used
Message-ID: <202508242353.KlSjjuFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e4601d0bb216a56336728892a74ca28f26967193
commit: cbd2ee90d3c1d32ccd9ba37a6b87ecd2f309627e [2/2] ubi: Fix producing anchor PEBs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250824/202508242353.KlSjjuFZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508242353.KlSjjuFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508242353.KlSjjuFZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/ubi/wl.c:322:27: warning: variable 'prev_e' set but not used [-Wunused-but-set-variable]
     322 |         struct ubi_wl_entry *e, *prev_e = NULL;
         |                                  ^
   1 warning generated.


vim +/prev_e +322 drivers/mtd/ubi/wl.c

801c135ce73d5d Artem B. Bityutskiy 2006-06-27  308  
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  309  /**
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  310   * find_wl_entry - find wear-leveling entry closest to certain erase counter.
8199b901a31b6e Richard Weinberger  2012-09-26  311   * @ubi: UBI device description object
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  312   * @root: the RB-tree where to look for
add8287e3fa216 Artem Bityutskiy    2012-03-07  313   * @diff: maximum possible difference from the smallest erase counter
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  314   *
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  315   * This function looks for a wear leveling entry with erase counter closest to
add8287e3fa216 Artem Bityutskiy    2012-03-07  316   * min + @diff, where min is the smallest erase counter.
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  317   */
8199b901a31b6e Richard Weinberger  2012-09-26  318  static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
8199b901a31b6e Richard Weinberger  2012-09-26  319  					  struct rb_root *root, int diff)
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  320  {
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  321  	struct rb_node *p;
8199b901a31b6e Richard Weinberger  2012-09-26 @322  	struct ubi_wl_entry *e, *prev_e = NULL;
add8287e3fa216 Artem Bityutskiy    2012-03-07  323  	int max;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  324  
23553b2c08c9b6 Xiaochuan-Xu        2008-12-09  325  	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
add8287e3fa216 Artem Bityutskiy    2012-03-07  326  	max = e->ec + diff;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  327  
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  328  	p = root->rb_node;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  329  	while (p) {
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  330  		struct ubi_wl_entry *e1;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  331  
23553b2c08c9b6 Xiaochuan-Xu        2008-12-09  332  		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  333  		if (e1->ec >= max)
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  334  			p = p->rb_left;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  335  		else {
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  336  			p = p->rb_right;
8199b901a31b6e Richard Weinberger  2012-09-26  337  			prev_e = e;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  338  			e = e1;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  339  		}
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  340  	}
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  341  
8199b901a31b6e Richard Weinberger  2012-09-26  342  	return e;
8199b901a31b6e Richard Weinberger  2012-09-26  343  }
8199b901a31b6e Richard Weinberger  2012-09-26  344  

:::::: The code at line 322 was first introduced by commit
:::::: 8199b901a31b6e89b63842643f644fc05b403b20 UBI: Add fastmap support to the WL sub-system

:::::: TO: Richard Weinberger <richard@nod.at>
:::::: CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
