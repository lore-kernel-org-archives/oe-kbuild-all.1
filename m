Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5A32E15F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705569; cv=none; b=oogiyBWOQAUGlkl10nwkAves0wUGVLqi/HEKnGgN0y8Q7woU/QJhhGo07ZtS28yMaFMhOAC9iU7aEoqShICxNpAKw+xmJiliKKgtRc3j+CWGvA7A2pPTS/Z8jEH5A/0QY6ggyr8u0OWuRy4CdgP7meG5qJNIa1Ml0Gi04AbuTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705569; c=relaxed/simple;
	bh=sz5VihAueaqum5wYTgww8H9zVedSGsLr/iIXpbB2h8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NgkVf86KXX7OD2Tj0ivYytSE6AiMpY/frbDDTgOZE76LPu3pxwjhNKVUUp+XJobkgiUhC2BB52UmlWROvmEyg02KfljVtaUMGBIXdCyyu9kYSJpSrpx2Y/kEJvjHEASEpP5uCDNPgeenrVjyPTWz65idI7wXyXZa3aKUpMU0IDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLenuCj8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLenuCj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770705568; x=1802241568;
  h=date:from:to:cc:subject:message-id;
  bh=sz5VihAueaqum5wYTgww8H9zVedSGsLr/iIXpbB2h8s=;
  b=lLenuCj8xIA/GP2B3XbDhrTGfUOy5F6p/tVyEkfnX36ctKJ5A2Hg3q0J
   y6w5+IGOYwdk/W0/Te6899BErEL/efwPAjc5MbDroU3Rt+TsAltDd2aIB
   8+r2NviZXkNbC2XkY5908LknbVM/DQ//eCQsjLRkaFxyxzhNCl2ksCNBD
   eINzP/ijPyMmcbVZzhiEk8XW5PLy67dKzvEsv8ayLlntG2KZcnyGeGW42
   DJYWjZJfjvIs1p5hoczunPYgoGpPfEjUZdXhDXssSiwrPbW+/23N3in8t
   hCD573kODVqJjfN+EXAZjnLZLNxoxkGC/NJJh0c59kNLnCegpMuTZ0/Oo
   Q==;
X-CSE-ConnectionGUID: 7b7SFWAQSlqdJBFTDBXc8g==
X-CSE-MsgGUID: gv5rj++mRCqogLCGZFOblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72009668"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72009668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:39:28 -0800
X-CSE-ConnectionGUID: nG76xQtvRWOlJfm38sY1vA==
X-CSE-MsgGUID: 2H+Aw1gaSM+6WJ4nCrEppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="215999489"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 22:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphP9-00000000ojC-32H9;
	Tue, 10 Feb 2026 06:39:23 +0000
Date: Tue, 10 Feb 2026 14:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_2 1/1]
 kernel/bpf/trampoline.c:40:48: sparse: sparse: non size-preserving pointer to
 integer cast
Message-ID: <202602101418.dDmyGSaa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_2
head:   ebbef7d1c33bdfa68df327c0d80101c04ab6d996
commit: ebbef7d1c33bdfa68df327c0d80101c04ab6d996 [1/1] trampoline mutext pool
config: parisc-randconfig-r121-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101418.dDmyGSaa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101418.dDmyGSaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101418.dDmyGSaa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/trampoline.c:18:31: sparse: sparse: symbol 'bpf_extension_verifier_ops' was not declared. Should it be static?
   kernel/bpf/trampoline.c:20:27: sparse: sparse: symbol 'bpf_extension_prog_ops' was not declared. Should it be static?
>> kernel/bpf/trampoline.c:40:48: sparse: sparse: non size-preserving pointer to integer cast

vim +40 kernel/bpf/trampoline.c

    37	
    38	static struct mutex *trampoline_locks_lookup(struct bpf_trampoline *tr)
    39	{
  > 40		return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)];
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
