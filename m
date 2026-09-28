Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA246EC9F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593476; cv=none; b=BDotsEjj4vXpGL8WvV1R773nydeJpyRXBq3CQdT08MKzH7klCG4DehOYkPnMg6S7C2y/gDjDxcLGGfyfMbX6g4OYcGtHwiwn0XN0dh1JwMwBkklf7UuxB9PDgdnfRBp+Tnt8T2crQAZpSKj3xNAg1z3XduBdjQ5mOB5d5BjcC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593476; c=relaxed/simple;
	bh=7YoH3gUcMaPzi3gH+ZHTf+C0WxbOV9erTuAFJa0om9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AywXlG2QgbXcrU2v3olJ2oHAbHZj1CPwPKe7StvW1v7isXfStX2vOguoG4UxWX300TVkz89zn56WUj1guHerz+Tnp+tAOD2oz3l3EUqbTJQa/NHvgAhN18BTw+6/Nk+ev52MdvEw5TNkITMN9gfyP2gX7blVzFpvZ+zuohIC2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7fN9KE7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7fN9KE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790593473; x=1822129473;
  h=date:from:to:cc:subject:message-id;
  bh=7YoH3gUcMaPzi3gH+ZHTf+C0WxbOV9erTuAFJa0om9g=;
  b=L7fN9KE7+xIG0q2e58cTgtHbW5UOu/ijIzSDm2uSnOlY4nGbmalvoSQo
   U628mNAggnjXMpSXKVr7FQQ7z4rj1zHu0uL6S8fS6jA6nRc/nSJasDSk5
   4KHolQhWB6j8d+T1r6snoAWdCL42s8AfmBfaRlXJTNNlpIPI9dtXG8KCW
   lkJfvWgIQVuhwQdj8dQquyTr1FWf/TCjYd5KSkRAsZv6mk6jbvvvGXlog
   xU9GQIkkEbTyeXNzCMkKyW3ifeiezhOcQ86H3FH9sQYkyl1sHtTHms1gn
   0xDRLtS4acnaFQdzV4TSoKdRvu6+6p8YBlwtPwzcEmhPiXgQSkvnzCQDf
   w==;
X-CSE-ConnectionGUID: oAsaMFrPQHuL+PJbHgNALw==
X-CSE-MsgGUID: mji88jmzTiKzFTLUhkLJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90417189"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90417189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:04:33 -0700
X-CSE-ConnectionGUID: hfgtC57xR6eNejxx4Jv4nw==
X-CSE-MsgGUID: xEZ4KwlzQQGXxW10igexrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="272819334"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2026 04:04:31 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB99o-000000000yf-2T1P;
	Mon, 28 Sep 2026 11:04:28 +0000
Date: Mon, 28 Sep 2026 13:03:37 +0200
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:feat-context-analysis-wip1.2-0day 15/17]
 arch/powerpc/mm/book3s64/hash_native.c:799:20: warning: variable 'pte' set
 but not used
Message-ID: <202609281203.zbPtnj2u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ritesh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/riteshharjani/linux feat-context-analysis-wip1.2-0day
head:   3763601e36b652fea5b4b266c875a38edf663ba5
commit: 6e1255f9927b2714a5f18c15971a70791b26b068 [15/17] powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260928/202609281203.zbPtnj2u-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281203.zbPtnj2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281203.zbPtnj2u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range_tlbiel':
>> arch/powerpc/mm/book3s64/hash_native.c:799:20: warning: variable 'pte' set but not used [-Wunused-but-set-variable]
     799 |         real_pte_t pte;
         |                    ^~~
>> arch/powerpc/mm/book3s64/hash_native.c:798:39: warning: variable 'shift' set but not used [-Wunused-but-set-variable]
     798 |         unsigned long vpn = 0, index, shift;
         |                                       ^~~~~
>> arch/powerpc/mm/book3s64/hash_native.c:798:32: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     798 |         unsigned long vpn = 0, index, shift;
         |                                ^~~~~
   arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range_tlbie':
   arch/powerpc/mm/book3s64/hash_native.c:821:20: warning: variable 'pte' set but not used [-Wunused-but-set-variable]
     821 |         real_pte_t pte;
         |                    ^~~
   arch/powerpc/mm/book3s64/hash_native.c:820:39: warning: variable 'shift' set but not used [-Wunused-but-set-variable]
     820 |         unsigned long vpn = 0, index, shift;
         |                                       ^~~~~
   arch/powerpc/mm/book3s64/hash_native.c:820:32: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     820 |         unsigned long vpn = 0, index, shift;
         |                                ^~~~~


vim +/pte +799 arch/powerpc/mm/book3s64/hash_native.c

   794	
   795	static void native_flush_hash_range_tlbiel(struct ppc64_tlb_batch *batch,
   796						   unsigned long number)
   797	{
 > 798		unsigned long vpn = 0, index, shift;
 > 799		real_pte_t pte;
   800		unsigned long psize = batch->psize;
   801		int ssize = batch->ssize;
   802		unsigned long i;
   803	
   804		asm volatile("ptesync":::"memory");
   805		for (i = 0; i < number; i++) {
   806			vpn = batch->vpn[i];
   807			pte = batch->pte[i];
   808	
   809			pte_iterate_hashed_subpages(pte, psize,
   810						    vpn, index, shift) {
   811				__tlbiel(vpn, psize, psize, ssize);
   812			} pte_iterate_hashed_end();
   813		}
   814		ppc_after_tlbiel_barrier();
   815	}
   816	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
