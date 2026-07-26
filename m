Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A255477E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049290; cv=none; b=GMR+r5gp6WtGyknSFOlKC46NixlRYguHRnpK4Ku5x/1fB6b8AJ0KeIuM/SW6lgMOiJAeuRcWg6kCGUligBBa9nFKj6dIpL6X/x/wjxsDvhOijrUFUSvLvQG4gufXwBsHzXqiNzF6MVEHTioKBI3id15/TbPw0Qmm8qXn2sRNG5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049290; c=relaxed/simple;
	bh=8pYINuiUMxaztNVWRM0SyZ17zLuZ0msjuVWsAOmyXrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gpJQl6ptugDkGxH7jM92bLf4daZYcns5/BZajGiohX/YLip4dWsFmBumxsvoRrt0DcbZxbrp6U9QhjblL2CWhb/9HeQnqjYQx+r/LL5RmShC3qbt5eF1kSz3ALkAuAKkLWkjo849k8QNkVOv0L8N93eILlqXLOvormHP2Ob1Pgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T630mdCC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T630mdCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785049289; x=1816585289;
  h=date:from:to:cc:subject:message-id;
  bh=8pYINuiUMxaztNVWRM0SyZ17zLuZ0msjuVWsAOmyXrQ=;
  b=T630mdCCqW1yvXSaIk/SjKQB/arzO95sYjccfTCCLKDSjovf3ddms0r8
   T4nKugdiyKhuLqVs1LloQ2h75GKdNJrAgsC6k+SAZJbWdioLS31fWbYIe
   UDYPJ3yfzFZ4AXo9W7Z/42KIAfY9zX66vC0rbJByNLUw4DK6DuqSh7Pdl
   Ehx+kN0sttC/TFXZHo+E8Cem1lj6XX86v5wQfVvyfTyzWjM/WwwwMxesF
   PKyVV3v+X+gZTlpIPgj3TiwrQ/pRFnjvXW3be0C68SFrKZxD6O5NhLjAf
   cBlUNbxsgHCgLhiYOCRohanfA/2FzmdG3jdG6g28Z7bRPkae/TfqFpK3h
   g==;
X-CSE-ConnectionGUID: bum0bPRyTHmnCw5adEudjw==
X-CSE-MsgGUID: zyFqTF7kRtWMcqBoRazaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85592791"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85592791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 00:01:28 -0700
X-CSE-ConnectionGUID: cV+inMYVSY2mOHA87ViuHQ==
X-CSE-MsgGUID: wQ6ntgvoQoGR21OsG8PO8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="264093901"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2026 00:01:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnsrU-000000001N4-02da;
	Sun, 26 Jul 2026 07:01:24 +0000
Date: Sun, 26 Jul 2026 09:00:32 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 15/15]
 arch/arm64/kernel/alternative.c:200:1: warning: the frame size of 2064 bytes
 is larger than 2048 bytes
Message-ID: <202607260833.1OLNv3WC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   8bbe5292f78ff005386b5ccf26a290ebfcc8c42d
commit: 8bbe5292f78ff005386b5ccf26a290ebfcc8c42d [15/15] HACK: arm64: alternatives: dump summary of alternatives
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260726/202607260833.1OLNv3WC-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607260833.1OLNv3WC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607260833.1OLNv3WC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/alternative.c: In function 'summarize_alternatives.isra':
>> arch/arm64/kernel/alternative.c:200:1: warning: the frame size of 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     200 | }
         | ^


vim +200 arch/arm64/kernel/alternative.c

   141	
   142	#define for_each_region_alt(region, alt)		\
   143		for (struct alt_instr *alt = (region)->begin;	\
   144		     (alt) < (region)->end;			\
   145		     (alt)++)
   146	
   147	static void summarize_alternatives(const struct alt_region *region)
   148	{
   149		unsigned int entries[ARM64_NCAPS] = { 0 };
   150		unsigned int orig_len[ARM64_NCAPS] = { 0 };
   151		unsigned int repl_len[ARM64_NCAPS] = { 0 };
   152		unsigned int callbacks[ARM64_NCAPS] = { 0 };
   153	
   154		unsigned int total_entries = 0;
   155		unsigned int total_orig = 0;
   156		unsigned int total_repl = 0;
   157		unsigned int total_callbacks = 0;
   158	
   159		for_each_region_alt(region, alt) {
   160			int cap = ALT_CAP(alt);
   161	
   162			entries[cap]++;
   163			total_entries++;
   164	
   165			orig_len[cap] += alt->orig_len;
   166			total_orig += alt->orig_len;
   167	
   168			repl_len[cap] += alt->alt_len;
   169			total_repl += alt->alt_len;
   170	
   171			if (ALT_HAS_CB(alt)) {
   172				callbacks[cap]++;
   173				total_callbacks++;
   174			}
   175		}
   176	
   177		pr_info("Alternatives summary:\n"
   178			"    entries:      %6u (%6zu bytes)\n"
   179			"      standard:   %6d\n"
   180			"      callback:   %6d\n"
   181			"    instructions: %6u (%6u bytes)\n"
   182			"    replacements: %6u (%6u bytes)\n",
   183			total_entries,	total_entries * sizeof (struct alt_instr),
   184			total_entries - total_callbacks,
   185			total_callbacks,
   186			total_orig / AARCH64_INSN_SIZE, total_orig,
   187			total_repl / AARCH64_INSN_SIZE, total_repl);
   188	
   189		for (int i = 0; i < ARM64_NCAPS; i++) {
   190			if (!entries[i])
   191				continue;
   192	
   193			pr_info("cpucap %3d => entries: %6d, orig: %6d, repl: %6d, cb: %6d\n",
   194				i,
   195				entries[i],
   196				orig_len[i] / AARCH64_INSN_SIZE,
   197				repl_len[i] / AARCH64_INSN_SIZE,
   198				callbacks[i]);
   199		}
 > 200	}
   201	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
