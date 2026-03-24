Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750133AE6EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339255; cv=none; b=j23F413G0bFwhLUom5rVNIyfWSkHBxmRo3a5nGERV/392F3KYQf5OIPP06fm64BAno191HcuhdQwlW9hmpI6qm65F/A3FY+xj/JMpnLDBIsQ0V0kw51TIVOGYFN17OVWD7Ibv3bMTTOeNwbatwESlBXMaezRJJruN6yKaQLcHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339255; c=relaxed/simple;
	bh=ocoi7pvGmuvDZoSOfl5t4+tndabVbyrA9wr21MqUqZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEOzhnflZorERW3fttXiJ0708Bz/qg39vt5tdSeowdtnAEYQNjAGAR3lH/+oCqZsgtPMSdWfkX1oYlp0tl1p9xhefywVdHXs89ttR1EJ+60Yb7WAN3jc342/LctQU2lVlkQalJJV/5h3LOtcHTMJmiBTgZUfUFc5GPBzGr91eRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1S5Givp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1S5Givp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774339243; x=1805875243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ocoi7pvGmuvDZoSOfl5t4+tndabVbyrA9wr21MqUqZY=;
  b=T1S5GivppzL+UJge1TWLApu/NqtRqv0h72y4ujyVdy+D5KoFdDzu9mrh
   u9OGufxiQq72B82qyWRBilbRsgPpbZlRgqjBoTOVRztynqRE2+J9wkFEZ
   MgUC3Ux732INJjP2aWXmGlTkOpGPW/xb200He60a0YmbKERCJkArheFxy
   +FKml4j13PMJIKoP2TM68CTJQVrzi6t2l4klHYPqq69Ph+ipmblyZZfJo
   Lj4no8Bm1Tjzkn3CAnp5QJpnMWafznrEoMyoDu7J97OYRV+1YeTbmUb1w
   977RJGUjfRs/bDbspYECfr/gWWPaf/zhSoEzjuynrg0mQUTd3RdAH16CI
   A==;
X-CSE-ConnectionGUID: +oSsw57tT6CZwhY5KLc/NA==
X-CSE-MsgGUID: 4MLlb5LNS/eGUBJ6RREQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75060884"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75060884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:00:42 -0700
X-CSE-ConnectionGUID: fFzXhO+xS3SDWPlVar7ADQ==
X-CSE-MsgGUID: Udc32wB4RE6CAt6sSsNiWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262202678"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2026 01:00:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4wgh-000000004CD-2iTp;
	Tue, 24 Mar 2026 08:00:31 +0000
Date: Tue, 24 Mar 2026 16:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, x86@kernel.org, rppt@kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>, derkling@google.com,
	reijiw@google.com, Will Deacon <will@kernel.org>,
	rientjes@google.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	patrick.roy@linux.dev, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	Andy Lutomirski <luto@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Yosry Ahmed <yosry@kernel.org>
Subject: Re: [PATCH v2 07/22] mm: KUnit tests for the mermap
Message-ID: <202603241512.3kG43FzT-lkp@intel.com>
References: <20260320-page_alloc-unmapped-v2-7-28bf1bd54f41@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-page_alloc-unmapped-v2-7-28bf1bd54f41@google.com>

Hi Brendan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b5d083a3ed1e2798396d5e491432e887da8d4a06]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/x86-mm-split-out-preallocate_sub_pgd/20260321-042521
base:   b5d083a3ed1e2798396d5e491432e887da8d4a06
patch link:    https://lore.kernel.org/r/20260320-page_alloc-unmapped-v2-7-28bf1bd54f41%40google.com
patch subject: [PATCH v2 07/22] mm: KUnit tests for the mermap
config: x86_64-randconfig-101-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241512.3kG43FzT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241512.3kG43FzT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/tests/mermap_kunit.c:156:2-3: Unneeded semicolon

vim +156 mm/tests/mermap_kunit.c

   131	
   132	static void test_multiple_allocs(struct kunit *test)
   133	{
   134		struct __mermap_put_args *argss[NR_NORMAL_ALLOCS] = { };
   135		struct page *pages[NR_NORMAL_ALLOCS + 1];
   136		struct mermap_alloc *reserved_alloc;
   137		struct mm_struct *mm = get_mm(test);
   138		int magic = 0xE4A4;
   139	
   140		for (int i = 0; i < ARRAY_SIZE(pages); i++) {
   141			pages[i] = alloc_page_wrapper(test, GFP_KERNEL);
   142			WRITE_ONCE(*(int *)page_to_virt(pages[i]), magic + i);
   143		}
   144	
   145		for (int i = 0; i < ARRAY_SIZE(argss); i++) {
   146			unsigned long base = mermap_cpu_base(raw_smp_processor_id());
   147			unsigned long end = mermap_cpu_end(raw_smp_processor_id());
   148			unsigned long addr;
   149	
   150			argss[i] = __mermap_get_wrapper(test, mm, pages[i], PAGE_SIZE, PAGE_KERNEL);
   151			KUNIT_ASSERT_NOT_NULL_MSG(test, argss[i], "alloc %d failed", i);
   152	
   153			addr = (unsigned long) mermap_addr(argss[i]->alloc);
   154			KUNIT_EXPECT_GE_MSG(test, addr, base, "alloc %d out of range", i);
   155			KUNIT_EXPECT_LT_MSG(test, addr, end, "alloc %d out of range", i);
 > 156		};
   157	
   158		/*
   159		 * Read through the mappings to try and detect if they point to the
   160		 * pages we wrote earlier.
   161		 */
   162		kthread_use_mm(mm);
   163		for (int i = 0; i < ARRAY_SIZE(pages) - 1; i++) {
   164			int *ptr  = (int *)mermap_addr(argss[i]->alloc);
   165	
   166			KUNIT_EXPECT_EQ(test, *ptr, magic + i);
   167		}
   168	
   169		/* Run out of alloc structures, only reserved allocs should succeed now. */
   170		KUNIT_ASSERT_NULL(test, __mermap_get(mm, pages[NR_NORMAL_ALLOCS],
   171						     PAGE_SIZE, PAGE_KERNEL, false));
   172		preempt_disable();
   173		reserved_alloc = __mermap_get(mm, pages[NR_NORMAL_ALLOCS],
   174					      PAGE_SIZE, PAGE_KERNEL, true);
   175		KUNIT_EXPECT_NOT_NULL(test, reserved_alloc);
   176		/* Also check if this mapping seems correct*/
   177		if (reserved_alloc) {
   178			int *ptr  = (int *)mermap_addr(reserved_alloc);
   179	
   180			KUNIT_EXPECT_EQ(test, *ptr, magic + NR_NORMAL_ALLOCS);
   181	
   182			mermap_put(reserved_alloc);
   183		}
   184		preempt_enable();
   185	
   186		kthread_unuse_mm(mm);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
