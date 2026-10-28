Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215307;
	b=BT5XfdNmxsKLKUAHPOZIjb4F7Thl1WqJ0GcN/+i81IZKnfixOgKqIQcc/MdFyqR7ipsa
	 gR+d5itGx2kHcMldmOFAVw7XyhsUrEgucj/p6JINwEQ6FNWqV35k/CPhEpO03EslZQ4ly
	 IPFXu64oszX6RQQ4LgHnUtW44HGJvEbcXUP3rlp8OX+6Vk/EhCBglbNtvo/2laBb9+pp1
	 W6At36nNLg3LMZIDVk+dnvsCfFqzijCvnWGQC3qsdALvn6c9iWG3PVuhYWJ6qb5XiW2J3
	 yf4Mjs6KnnIZB1qr3qXvY8fzVoeRi8BnY2RzEYCLSASK+ZNT++chpprMls/F2Q/VN6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215307;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3UfJ/UDDYNtsRVbjk1VOgllBTR6S8HMDYf5Wwl/TVSM=;
	b=nHHJ4IEMxGlN61YuiVkJrxDho3iNA2oSUyITA+XJcFIdrs+gfes9p+DCsw7/OSMVFDG9
	 QYl6N9m/7o9nFi4thjyrTyMjiexMeLjDQWFw+CWK7YGT381Bh3/14HKIh9R+uXgg1b9pJ
	 gQfFhW/dK6e63bDBSyiisIA950FGqdfhgAHmwG5L8OHEnOvTmvXWElvvB2bVGWXlvlT4j
	 C5/c1e6kEsf/fNST/Jw5dR9+J4rG4ZsSRa66890XI76Tj08fUFtidRPA4Xc2KKf1V0o56
	 sJa6nsCJ3d0wX7Kd/EGD/C7wFlTbF7w/YUaLdheD5nBCIVQg9/uxobqx5rXdgucEKgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DEQdjY1k;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F75606A31F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DEQdjY1k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793215306; x=1824751306;
  h=date:from:to:cc:subject:message-id;
  bh=9SzP8TpOcoAbyNUrbrgeteRm2RM1I63JaVk5jfyF8qc=;
  b=DEQdjY1kT8MaQ8WWjI3L2D3NdTq1jvOVOMm/cugbQR7VGIe9u1lsUMfc
   pUfVuGiJ4+Z3C5r6/RSFNHYXQ2EZqkoLV9C9828cWu6JMHySKoXBsnEml
   rhI0TGHBjY3598BslqXzrFneFFeVfKFaJ/2Bo04mzwxnj/BTM1DExC0o/
   Rwic3PAuVI5J1LeFGQpATa2WmVSMh/8zBdJbwxduz7dAPbClm85IgDvWF
   shsSTdFeIbdSLEBuddMLjey6yrEEW7jW1c39KyjbzbiDKLsJUAZR1ogd0
   CYBOOR0UTbbKtKDLbxdjns/ELu1vscMbRfRi1CPYGMeSr5mHMrG/BuHHL
   g==;
X-CSE-ConnectionGUID: CM/N8/eMQVGVX3S4LnA5EQ==
X-CSE-MsgGUID: 2GwyWnAwSNKBeKO4c8EG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1939535"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1939535"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:21:46 -0700
X-CSE-ConnectionGUID: h+ON/x8iStavlt7UNmv8nA==
X-CSE-MsgGUID: zzGnhn5mSO+C42wL+F0OFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5264555"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2026 12:21:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9DS-00000000Z9Y-1wXD;
	Wed, 28 Oct 2026 19:21:42 +0000
Date: Thu, 29 Oct 2026 03:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 4/6] kernel/bpf/arena.c:307:36:
 warning: comparison between pointer and integer
Message-ID: <202610290324.ePHdVCuy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 71ddc46be0a854bf80bacf6c588aefd04049b95e [4/6] bpf: arena: Add the scratch PTE table and PMD-level fault recovery
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610290324.ePHdVCuy-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290324.ePHdVCuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290324.ePHdVCuy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/arena.c: In function 'arena_pmd_is_scratch':
>> kernel/bpf/arena.c:307:36: warning: comparison between pointer and integer
     307 |         return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
         |                                    ^~
   kernel/bpf/arena.c: In function 'arena_alloc_scratch_pt':
   kernel/bpf/arena.c:319:17: error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'? [-Wimplicit-function-declaration]
     319 |                 set_pte(&arena->scratch_pt[i], pteval);
         |                 ^~~~~~~
         |                 set_ptes


vim +307 kernel/bpf/arena.c

   294	
   295	/*
   296	 * A PMD slot of the band is in one of three states: none, holding the arena's
   297	 * scratch table, or holding a real table. The scratch table maps every page of
   298	 * its slot to the scratch page. Kernel-fault recovery installs it into a none
   299	 * slot, which keeps that path allocation-free: it runs from any context,
   300	 * including NMI, under memory exhaustion and with the arena lock held, and must
   301	 * never oops. The price is that one stray kernel access to an empty slot now
   302	 * backs 2 MB with scratch rather than one page; nothing real can live there,
   303	 * because a real page is only ever installed into a real table.
   304	 */
   305	static bool arena_pmd_is_scratch(struct bpf_arena *arena, pmd_t pmd)
   306	{
 > 307		return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
   308	}
   309	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
