Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2DD2AEE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784912804; cv=none; b=C+YdEe+N0sUjFCvgo+jmxn6isjMs78m1ZnFefyBbjJ2YCfj+/4a+/2Gy3Og7n/X7lD4a2FrPj+Yf0+P9MgmS/MIPxOtoUZxbFVJ54aICMQT1O3v0B/jOIxSkvGcUl9Nq287B3MOsXp7mtYNf5EETJCe4T2dlmjcrk1XFtgkVYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784912804; c=relaxed/simple;
	bh=et0UWU7GWJFC1gjDPbpE9qllm2y/YzAgaFxgHja6Us0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q069S+AdFMucFkdEA2wquE67j9WZX/TB+ZZsgmFYfb+YniEulRRuBrGUF4pt5pUFMsFTRe7WV5z0A/Emxo2XcdnQqyQpV6XVy0VtUYoapd9ofx7fKvx53Dhye5g65dLFqkwGW5aBYLm5zXSeZ7tu171oHtjFQ+mJVRZHoPUJKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPSJi8tZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPSJi8tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784912803; x=1816448803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=et0UWU7GWJFC1gjDPbpE9qllm2y/YzAgaFxgHja6Us0=;
  b=WPSJi8tZTmhG4fdU96gfmJkTeUFiSgnDmEIYUOb8n4q1WAQ3dB74GSbq
   PWNmSqjJ2XCioNiFnEn/B26+dmaVlensjY9R2DNm/lfaXh6ZSKteKY7Mi
   zXbSC0A/kC/fPpUz3U9gwhfKn5PxMbGAcrNjDNu2wzpb9hh/b+9vEiwGQ
   mN+JxwTY6BeZKM87vhk7gfRUEiyWA6T7Ve0s5QQgOCx/5RWZHaUax+Hpn
   ECcEunSeoh6D3JqaqNrLjzz6ke7/fQczKT/Vv8u735BhOfHYfXE0z7/Ra
   T4+NBFjXdT3GyEBpAOF9H78nHJRLudQJmul0Jv4JL8jwL6chyJ9QoJnI7
   Q==;
X-CSE-ConnectionGUID: y6C84ANFQTqW2qLTrdAVDA==
X-CSE-MsgGUID: VXWQW6SITQO46Y8fqpe2wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85699573"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85699573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 10:06:42 -0700
X-CSE-ConnectionGUID: 0Olbifv3SQGISQFQH44YYw==
X-CSE-MsgGUID: mR8xJkYlS+WK7oBFT9Sivg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="254835244"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2026 10:06:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnJM1-000000000z4-0zCh;
	Fri, 24 Jul 2026 17:06:33 +0000
Date: Fri, 24 Jul 2026 19:06:07 +0200
From: kernel test robot <lkp@intel.com>
To: Pedro Falcato <pfalcato@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: constify the pte_offset_map_ro_nolock() return
 value
Message-ID: <202607241905.9UNne8Y8-lkp@intel.com>
References: <20260724102017.141532-6-pfalcato@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724102017.141532-6-pfalcato@suse.de>

Hi Pedro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Pedro-Falcato/mm-constify-generic-pte_get/20260724-184321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260724102017.141532-6-pfalcato%40suse.de
patch subject: [PATCH 5/5] mm: constify the pte_offset_map_ro_nolock() return value
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260724/202607241905.9UNne8Y8-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241905.9UNne8Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241905.9UNne8Y8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:12:
   ./include/linux/pgtable.h: In function 'ptep_get_lockless':
>> ./include/linux/pgtable.h:782:25: warning: passing argument 1 of 'ptep_get' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     782 |         return ptep_get(ptep);
         |                         ^~~~
   In file included from ./include/linux/pgtable.h:6:
   ./arch/s390/include/asm/pgtable.h:989:37: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'const pte_t *' {aka 'const long unsigned int *'}
     989 | static inline pte_t ptep_get(pte_t *ptep)
         |                              ~~~~~~~^~~~
--
   In file included from ./include/linux/mm.h:31,
                    from ./arch/s390/include/asm/pgalloc.h:18,
                    from ./arch/s390/include/asm/mmu_context.h:11,
                    from ./arch/s390/include/asm/elf.h:173,
                    from ./include/linux/elf.h:6,
                    from ./include/linux/module.h:20,
                    from net/8021q/vlan.c:20:
   ./include/linux/pgtable.h: In function 'ptep_get_lockless':
>> ./include/linux/pgtable.h:782:25: warning: passing argument 1 of 'ptep_get' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     782 |         return ptep_get(ptep);
         |                         ^~~~
   In file included from ./include/linux/pgtable.h:6:
   ./arch/s390/include/asm/pgtable.h:989:37: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'const pte_t *' {aka 'const long unsigned int *'}
     989 | static inline pte_t ptep_get(pte_t *ptep)
         |                              ~~~~~~~^~~~
   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:249:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:249:42: note: directive argument in the range [0, 4094]
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:249:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     249 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c:237:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:237:42: note: directive argument in the range [0, 4094]
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:237:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     237 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from ./include/linux/mm.h:31,
                    from ./arch/s390/include/asm/pgalloc.h:18,
                    from ./arch/s390/include/asm/mmu_context.h:11,
                    from ./arch/s390/include/asm/elf.h:173,
                    from ./include/linux/elf.h:6,
                    from ./include/linux/module.h:20,
                    from net/netfilter/ipvs/ip_vs_core.c:24:
   ./include/linux/pgtable.h: In function 'ptep_get_lockless':
>> ./include/linux/pgtable.h:782:25: warning: passing argument 1 of 'ptep_get' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     782 |         return ptep_get(ptep);
         |                         ^~~~
   In file included from ./include/linux/pgtable.h:6:
   ./arch/s390/include/asm/pgtable.h:989:37: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'const pte_t *' {aka 'const long unsigned int *'}
     989 | static inline pte_t ptep_get(pte_t *ptep)
         |                              ~~~~~~~^~~~
   net/netfilter/ipvs/ip_vs_core.c: In function 'ip_vs_in_icmp':
   net/netfilter/ipvs/ip_vs_core.c:1768:15: warning: variable 'outer_proto' set but not used [-Wunused-but-set-variable]
    1768 |         char *outer_proto = "IPIP";
         |               ^~~~~~~~~~~


vim +782 ./include/linux/pgtable.h

024d232ae4fcd7 Peter Zijlstra 2020-11-26  775  
2a4a06da8a4b93 Peter Zijlstra 2020-11-13  776  /*
2a4a06da8a4b93 Peter Zijlstra 2020-11-13  777   * We require that the PTE can be read atomically.
2a4a06da8a4b93 Peter Zijlstra 2020-11-13  778   */
024d232ae4fcd7 Peter Zijlstra 2020-11-26  779  #ifndef ptep_get_lockless
3cfe4c8a2f30c7 Pedro Falcato  2026-07-24  780  static inline pte_t ptep_get_lockless(const pte_t *ptep)
2a4a06da8a4b93 Peter Zijlstra 2020-11-13  781  {
2a4a06da8a4b93 Peter Zijlstra 2020-11-13 @782  	return ptep_get(ptep);
2a4a06da8a4b93 Peter Zijlstra 2020-11-13  783  }
024d232ae4fcd7 Peter Zijlstra 2020-11-26  784  #endif
024d232ae4fcd7 Peter Zijlstra 2020-11-26  785  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
