Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE5D517
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752869221; cv=none; b=f6a8KgYcan+BLZZkZBN9nJtuxgZ0AmtOZOsZsv3wcu5s7haNs7v/LuWJQNrgub497ZyolO3CZsvFqGBNPxZ4kQDJ5b3bzeozwW0wB0lWY6Ot/YA77XO01KfjHTMWWsv0Y5AIZLt1UzPrA3bx3G9HwxyK2OFFBZKeJPI5WkAWYmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752869221; c=relaxed/simple;
	bh=/c6W0QCExdJulJjR99oOqjyhyrpY5+1p7AIoo66B7Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqRchc3EvRhQTpspEiZKuI8DMO+UxV6m1rk1i/SN4bYjx8o3ljQwHbbPWkYixyrvQcm3R7PwzUxTfL1kN3AivOtwS/Z43iRHrtGZVBIGMdBqsCoFTaVfaNa/K97gCALOr+2LnNqamB4R0JfOoGNhJpCAqP7zLA1i1SjhgYLEHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgVQcSVo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgVQcSVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752869219; x=1784405219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/c6W0QCExdJulJjR99oOqjyhyrpY5+1p7AIoo66B7Z0=;
  b=OgVQcSVo4JjXefBqffr8YJgEwF79VybcKQNSbNBdg9wFKJaY1DqAyU8w
   ZwFKemdQ3y9EMKwigCUbXMor3CMdltBGgs7PV/diPPIsYEwrdr98VDNR5
   PM+33jyMkxa8jf40pl39DehJ/O2X6VxquuKT++HmSMTGqwLSicHRP8N+l
   +hPZX+nw/UEaacm9J4o06lJINainPoMDF0dT4klFKu4WVUKaDLgjDavKd
   wlbIbP7iunTTFcWNdj+Jj9F9rxKoFch68phhfGW9/oY8ex8uuE0gIpSrj
   wl3mW2ZEqpFD6RK/oir6uLxX+0ZUvHbxzVID1/ORzMuQMM/5gotxgqBEl
   A==;
X-CSE-ConnectionGUID: ugA88T7ESvejSV/ZOnbRgA==
X-CSE-MsgGUID: VEbbw7VGQ1SSV3y3AI3NZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55024604"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55024604"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 13:06:58 -0700
X-CSE-ConnectionGUID: kcMQmBCbTvaal1coT9H54Q==
X-CSE-MsgGUID: 7ChANxMLRIu9oGcBVrE+Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158239135"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2025 13:06:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucrM0-000F0N-2E;
	Fri, 18 Jul 2025 20:06:48 +0000
Date: Sat, 19 Jul 2025 04:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ye Liu <liuye@kylinos.cn>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for
 pages<->MB conversion
Message-ID: <202507190319.0rqhQw5l-lkp@intel.com>
References: <20250718024134.1304745-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718024134.1304745-1-ye.liu@linux.dev>

Hi Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Liu/mm-Replace-20-PAGE_SHIFT-with-common-macros-for-pages-MB-conversion/20250718-104347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250718024134.1304745-1-ye.liu%40linux.dev
patch subject: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for pages<->MB conversion
config: arc-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190319.0rqhQw5l-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190319.0rqhQw5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190319.0rqhQw5l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
      78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
         |         ^~~~~~~~~~~
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2205,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
     155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
         |         ^~~~~~~~~~~
--
   In file included from arch/arc/include/asm/cacheflush.h:18,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/ufs/super.c:83:
>> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
      78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
         |         ^~~~~~~~~~~
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/ufs/super.c:70:
   arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
     155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
         |         ^~~~~~~~~~~
   fs/ufs/super.c: In function 'ufs_reconfigure':
   fs/ufs/super.c:1246:22: warning: variable 'ufstype' set but not used [-Wunused-but-set-variable]
    1246 |         unsigned int ufstype;
         |                      ^~~~~~~
--
   In file included from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
      78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
         |         ^~~~~~~~~~~
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2205,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
     155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
         |         ^~~~~~~~~~~


vim +/PAGES_TO_MB +78 include/linux/mm.h

    71	
    72	/*
    73	 * Convert between pages and MB
    74	 * 20 is the shift for 1MB (2^20 = 1MB)
    75	 * PAGE_SHIFT is the shift for page size (e.g., 12 for 4KB pages)
    76	 * So (20 - PAGE_SHIFT) converts between pages and MB
    77	 */
  > 78	#define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    79	#define MB_TO_PAGES(mb)    ((mb) << (20 - PAGE_SHIFT))
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
