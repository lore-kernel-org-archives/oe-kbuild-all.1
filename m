Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8921FF35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753081616; cv=none; b=mSgr/qnSLd3nW99gVTZ1ZDiolYOwsXtGDnd2YjIv1GrvzZWT75nHUPvWukVgNB+eBLsjMYQGiYRRPEZw1H3VYCl8Cum+xk01kSb7Cr9p5tef1Q1KfhPuWsqqjvJygUyo3bJw1BYCl2ffbfp7X07SWlaYiNIHWRIRhZoTD9oWY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753081616; c=relaxed/simple;
	bh=MleYgnE/nrQ1vnINC25bOF7UB6BgWCKanaDG7XDi1Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGaL5AL78Nx4pw8MooazFWZgrgCpeTprxd/PQjZ/JFyNgQEXIiMNriOA8kQ+GI1I3Vsd+J4hxAv5e+i3m/iX6MFpjExe1HGbQtQykEpLjZyXup9/mhKiBZn6dCLA3AhHL8Uw8QM2SaMg2n9JbqVWuOR7TaT6/wQwAJqRdRvbvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHleXIrt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHleXIrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753081615; x=1784617615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MleYgnE/nrQ1vnINC25bOF7UB6BgWCKanaDG7XDi1Uw=;
  b=OHleXIrtfgGiMu7JBWz9K6NNSH/WK/nwtb6L0kVUKaqOTw+Oafcoujkz
   D1591NinK1pcD7xysZjpuqHY09D3Nr9AM91B+bXZiFybXFJ0GgayuVYHZ
   tPPKeN6wX4vE5MYABE3H40865bPI41cvC+BDyWkF7lGACZlQwnD3XjQ36
   ir9FOG21hgpnE0kjOESbnwXKCkwIOTF/qZejPmy047e4vk/pwKypd5ZrT
   7Mj7CV8XQS0tLnhQZjswrKuJ3a6Zto6Okjj1fz0URpwlT9nUbjKcb6qb8
   wC164pDRusilEqM48qefg1+APPFAwzgORceVI2bjbH2mxkF3n5oUbbK9S
   Q==;
X-CSE-ConnectionGUID: ic9+O8JrSkKgvGoCmR+LnQ==
X-CSE-MsgGUID: 0Gp1RJtjRl257JTPQNKIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55436978"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55436978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 00:06:54 -0700
X-CSE-ConnectionGUID: Ac2/BkT2QUWqqOSfGw1Vww==
X-CSE-MsgGUID: FxezOT0bQ/qf90lPMP1KRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158876562"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jul 2025 00:06:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udkbl-000GZt-1d;
	Mon, 21 Jul 2025 07:06:45 +0000
Date: Mon, 21 Jul 2025 15:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Joao Martins <joao.m.martins@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 mm-hotfixes 3/5] x86/mm: define
 ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
Message-ID: <202507211433.J7CqBp8O-lkp@intel.com>
References: <20250720234203.9126-4-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720234203.9126-4-harry.yoo@oracle.com>

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-asm-pgalloc-h/20250721-074448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250720234203.9126-4-harry.yoo%40oracle.com
patch subject: [PATCH v2 mm-hotfixes 3/5] x86/mm: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()
config: i386-buildonly-randconfig-003-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211433.J7CqBp8O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211433.J7CqBp8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211433.J7CqBp8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mremap.c:31:
>> arch/x86/include/asm/pgalloc.h:13: warning: "ARCH_PAGE_TABLE_SYNC_MASK" redefined
      13 | #define ARCH_PAGE_TABLE_SYNC_MASK \
         | 
   In file included from arch/x86/include/asm/pgtable_32_types.h:15,
                    from arch/x86/include/asm/pgtable_types.h:278,
                    from arch/x86/include/asm/paravirt_types.h:11,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/mremap.c:11:
   arch/x86/include/asm/pgtable-2level_types.h:21: note: this is the location of the previous definition
      21 | #define ARCH_PAGE_TABLE_SYNC_MASK       PGTBL_PMD_MODIFIED
         | 


vim +/ARCH_PAGE_TABLE_SYNC_MASK +13 arch/x86/include/asm/pgalloc.h

    10	
    11	#define __HAVE_ARCH_PTE_ALLOC_ONE
    12	#define __HAVE_ARCH_PGD_FREE
  > 13	#define ARCH_PAGE_TABLE_SYNC_MASK \
    14		(pgtable_l5_enabled() ? PGTBL_PGD_MODIFIED : PGTBL_P4D_MODIFIED)
    15	#include <asm-generic/pgalloc.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
