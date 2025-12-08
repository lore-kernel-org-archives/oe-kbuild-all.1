Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFC12517A5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765173002; cv=none; b=QkbJgA8q6HtifltORJLC1lDnrzUamAuDfhzIPY54cGrRnylIANW3mTvmlZCrmTSC7RTPuUyIZBFct67nm0TVhkRxHLp7AtvVRbTYePOQ5aRckY8v1TSozYEdxGdWSXf92Prb35VqiucNtPmP8ZaYZtabnzwwo3R0F9PEPmT5u2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765173002; c=relaxed/simple;
	bh=yKdLtfhwiVacmzDzBbM7cc+mYooItDu1hYnEADZapsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NyoK7Dhrmx2Eb2SbvDR2E1c9fVsZO1h83e3UNARxj3HqKY4UcRwhYlYw8SIChhH2joDpfS2VaeO2hcs5WgXtDHQVCFLYrP0592/MF7ILSOMGwtmdXmTEUtCk8tv13r5aKjOQwpMI2mAWTq2ghpjtxwSiwoGluDQUb5GWF6htYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIpvNe5C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIpvNe5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765173000; x=1796709000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKdLtfhwiVacmzDzBbM7cc+mYooItDu1hYnEADZapsw=;
  b=LIpvNe5C6YcwNC/ln3PMhnndpRouYPpMKEVzMFe3V1SXW3Gy39arpJc8
   NqNbVIdl5/uMjqW5sy61FNwWoXQ7K4dqf/2V0L7EswPlulT0v2n5JczjD
   tlg8awSIIaJnrMWZp8d9yGPX494yfXPQnz4S6tqZSEhSBI7eXFgpH/T+n
   ihv7HK1sFM3vWTAaauTSrXSrAbgAIHOhSV8CosVDUcdkhQ+vk34dU9IO6
   ImZFczK0MIW4XpNiBfT3Qwy2Q6hsBHBDe1djI1Zrx8IgLbsDMy7WCoa+O
   zKHBcgrlhpkO1kNCpEIVIE1LXvrhn2l9SAKSw/dlgtVqUrLwdLQKOoEyH
   A==;
X-CSE-ConnectionGUID: QiD0CuwjR7aXjkEBOT4s8A==
X-CSE-MsgGUID: ko4SJm7WQyiWOeixh77iRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67073231"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67073231"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 21:49:59 -0800
X-CSE-ConnectionGUID: F731T6FWTJGGyKsrVijoQA==
X-CSE-MsgGUID: LymyL4NfThiLM/fUyN1SlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196120508"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Dec 2025 21:49:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSU8B-00000000K0T-46ei;
	Mon, 08 Dec 2025 05:49:55 +0000
Date: Mon, 8 Dec 2025 13:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 1083/1104]
 fs/bcachefs/btree/cache.c:26:6: sparse: sparse: symbol
 'bch2_mm_avoid_compaction' was not declared. Should it be static?
Message-ID: <202512081305.iI4tU1gY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   2f94f2e080a961cd6401d4bea5c31ff03516d30e
commit: ef1f22b44d2de654c5a124c1205313b7f4ce5663 [1083/1104] bcachefs: Avoid waiting on compaction when allocating btree node bufs
config: nios2-randconfig-r133-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081305.iI4tU1gY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081305.iI4tU1gY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081305.iI4tU1gY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/cache.c:26:6: sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it be static?

vim +/bch2_mm_avoid_compaction +26 fs/bcachefs/btree/cache.c

    25	
  > 26	bool bch2_mm_avoid_compaction = true;
    27	module_param_named(mm_avoid_compaction, bch2_mm_avoid_compaction, bool, 0644);
    28	MODULE_PARM_DESC(force_read_device, "");
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
