Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270391E230E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260671; cv=none; b=Ty4rUN4tMod+iYc9nvyEeSgkePNCzicpXORowe/3fqe2/85Yo0DIeLnbcx9rOZ9dYsTb2rxuPWRswgPYI4TCtVgJueGeKgTu5bWYIFs7GllIAALzvptQ1NyZFiorwnmanEiRoOnDcxsqwmeYXxbrc0wKflfL2vmEhlOEYPxEoDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260671; c=relaxed/simple;
	bh=1l6xte5qhXaEsBjCoeIHszojYX3EdVZmc7nDk85LEtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTODETRHOC+LrhHWrXZuqgeXV2prARABK1NZXLfcSOyMybu1dlDf8UqkbC5sv3aRLzjnTKy7Um605+KQLk+l0XxtzeeLSA+awfTstlWyr/2UNBDKbcO0HVE/oODY2TtN27xy3PO/XraqavekxWsmc2Lg584d69O8WQ0JDEeKnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjjQ4vSB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjjQ4vSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260670; x=1797796670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1l6xte5qhXaEsBjCoeIHszojYX3EdVZmc7nDk85LEtg=;
  b=ZjjQ4vSBqn2setYnUnfShh4TSDbRNNFsrENmFAVApga/ImQKG6rAi/nx
   HgQHHs0X4+OYgeb0QYkQpTL1jXV0vH2p09kySFosoiT698kts8u/RuU92
   DhqrOW7LoqpSXfaBdGcg4CPChp8M0vjT3MKFouOH0m66JUg1OWavQtmT6
   4LT4+QexUfRPwYAUhakXPsjpicXsTrZx30bj8m6rZnF2LLOmSj2G0MSJw
   WgDmMn7zsDZwHpbW0ULFszi7TnI+qc1+9BFdJxg3jV9DkBRhVYRPwfJVZ
   DVnN46amrqtlnRo9MsOwSfhpreJdVBb7g1fctdlMrInpiMeuZWMLLrqVq
   w==;
X-CSE-ConnectionGUID: OIIUw1EjS1Sv3I/lBBmsKQ==
X-CSE-MsgGUID: 4Sf7Kje6RpGlQxGDsGQcbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71816125"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71816125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:57:47 -0800
X-CSE-ConnectionGUID: tiJYGBzFTFKRocu7cgTqBw==
X-CSE-MsgGUID: 3qyts4rVRluaI8YQ/o2T7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199073276"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 11:57:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX35E-000000004lk-2cyG;
	Sat, 20 Dec 2025 19:57:44 +0000
Date: Sat, 20 Dec 2025 20:56:45 +0100
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg
 statistics and events
Message-ID: <202512202007.vewIitSc-lkp@intel.com>
References: <20251220041250.372179-5-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220041250.372179-5-roman.gushchin@linux.dev>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Gushchin/mm-declare-memcg_page_state_output-in-memcontrol-h/20251220-121603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251220041250.372179-5-roman.gushchin%40linux.dev
patch subject: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg statistics and events
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512202007.vewIitSc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202007.vewIitSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202007.vewIitSc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mem_cgroup_usage
   >>> referenced by bpf_memcontrol.c:103 (mm/bpf_memcontrol.c:103)
   >>>               mm/bpf_memcontrol.o:(bpf_mem_cgroup_usage) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
