Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502045;
	b=2r/6n4N1AfL4kW76pS+OEQZ0IZ8oJl7Jv4ZUO1VaeQAiQ8VmqADwa73fcM08/AUVIeli
	 BWlssIg3eFv7Wd9mZXnRVA/ZI0pYR6WffYDtZ168V4iBg85+dCIElW9aNaGLFrlkP5xWY
	 4NJUyLnjD/0V1aXP8c4PS7x6w2fW4BHpz/LryFK4sLVy6NrEF3L3nuhTd7XY0/X3zRCh2
	 n9VXysOm4NqaJQMKNfwDCJDoGRFeOhCEscYbNoQkVVFIVarz4gf0bUKazBQDmll4dZq8Z
	 KORj9XUHZ+8vHViwKNrwPEJ1prBdb4sRyYgF7EoNXjhUGbpvuC3mrZqP82eXQr8F+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502045;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PhiY8NhERregr6MzloTgfj+M9YHeyQyJRotmPudSFS0=;
	b=Vx7ujqok640U5/v1qojrdzaSxrmo5Mztd65426RvVe0QCMfAv5AvaXtVxk+HkZjwh9Dj
	 w2/13wI76chUPcsO5l/c/BS5g5YteiEudu3qkHt12VghMoxco7B7gURjTSIgUy6LQ/XOx
	 tzV7L4kz2fjHq/8MyI01DUX9h6aZfXwRP7Y/I3mj6TJLRZLZ9h9Bn3NUbVqhKEkD9dfmP
	 m554kuvWVG+t04TBbJHXfq7t6x8E+GXo/Y0NlnAN/EqnG4oMpxqHU2kgLW+Eib7BcLEBb
	 eW0qVNwoACC0Keqle83ourwHgVDWpawtQGxKQ8h7dqW4yAkjp8yuA7O7zKVHVVRWgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KhHWqHGw;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE206606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 03:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE206606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KhHWqHGw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793502044; x=1825038044;
  h=date:from:to:cc:subject:message-id;
  bh=j4nF+j6n9uc2VnOt5Lms6Dkqi1AVbVGJihN8Nx4xO2o=;
  b=KhHWqHGw4jTlnmA9+MvQiPsYK/Pr4nGn5NbpUUFlR0sG2bOefVK8dXu/
   CcP2olgPWWuCnwzkX0m2JDjJbGEy4pSGiKxV1riWNXb6z0Tox1VFIfkCG
   COnAncaqTMCNHnCFYV0NM7A9LZRDYivEf+uxPw5ttg8kLZC+1f+LLrG8c
   ICgCYnnoKU2r7JQ8V0do+1oDZ7OkP/U/I9rgMoI0/1gqDi9oH+6o/R24T
   Ne2p0b3eDQeoU8S10AlxAZjanoS2SYvPbVvRaA1MBfH+qSuBDaHEvGgkR
   S1xuHdOPEb9dhqzqRz+TVDpw3eCKHdhGhbiAe+2I2SpuNh4MdRS4Qp8BN
   A==;
X-CSE-ConnectionGUID: hmqV/JpQQaiwqtwCtsZKaw==
X-CSE-MsgGUID: rVkjH7iLQ3iTOHHg+fR2UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2215597"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2215597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 20:00:44 -0700
X-CSE-ConnectionGUID: PYxEVAF/QSu3943DS79L1A==
X-CSE-MsgGUID: HNO0s915R0qz/UdHKwO9TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="6097328"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2026 20:00:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNLoG-000000006Jg-1351;
	Sun, 01 Nov 2026 03:00:40 +0000
Date: Sun, 01 Nov 2026 04:00:38 +0100
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 41/139] mm/damon/vaddr.c:891:21: error: too
 few arguments to function 'damos_va_invalid_folio'; expected 2, have 1
Message-ID: <202611010354.GdEQgO22-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   7004d750fdd0fe580091136ef098fba296e51863
commit: 046c68e46b042453c4cdbd909eb4dc448dde6325 [41/139] mm/damon/vaddr: use damos->last_applied for migrate action
config: csky-randconfig-2000-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010354.GdEQgO22-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010354.GdEQgO22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010354.GdEQgO22-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/damon/vaddr.c: In function 'damos_va_migrate_pmd_entry':
>> mm/damon/vaddr.c:891:21: error: too few arguments to function 'damos_va_invalid_folio'; expected 2, have 1
     891 |                 if (damos_va_invalid_folio(folio))
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   mm/damon/vaddr.c:840:20: note: declared here
     840 | static inline bool damos_va_invalid_folio(struct folio *folio,
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/damos_va_invalid_folio +891 mm/damon/vaddr.c

   877	
   878		start_pte = pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
   879		if (!pte)
   880			return 0;
   881	
   882		for (; addr < next; pte += nr, addr += nr * PAGE_SIZE) {
   883			unsigned long page_idx;
   884	
   885			nr = 1;
   886			ptent = ptep_get(pte);
   887	
   888			if (pte_none(ptent) || !pte_present(ptent))
   889				continue;
   890			folio = vm_normal_folio(walk->vma, addr, ptent);
 > 891			if (damos_va_invalid_folio(folio))
   892				continue;
   893			page_idx = folio_page_idx(folio, pte_page(ptent));
   894			nr = folio_nr_pages(folio) - page_idx;
   895			if (damos_va_filter_out(s, folio, walk->vma, addr, pte, NULL))
   896				continue;
   897			s->last_applied = folio;
   898			damos_va_migrate_dests_add(folio, walk->vma, addr, s,
   899					migration_lists);
   900		}
   901		pte_unmap_unlock(start_pte, ptl);
   902		return 0;
   903	}
   904	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
