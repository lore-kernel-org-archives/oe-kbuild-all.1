Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833914F112
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 02:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025208; cv=none; b=GlxZCILq6b+sI37qPU2WSVxHGevLnVftgmYMFYjfboblXSV4SGmK0zViiGwja24qHoXLac5fspO2BBq2PdotwPDAf0MqzbavdyDxHcR3GkMjUKb5EUavkgAoWJNHMiLk/a/XAHKaOanZlBQX0q5qnaiFMTdTKOeRA/kWjCpl4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025208; c=relaxed/simple;
	bh=qWQI+2I7pI3Y9Z4pTAhE38RkfvU9VrTd5QesIT4CioY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEXzF5vUq+QVv3d1LFd8L9LQD1GolLbnxvUgZHfU/rdJq20Nkp0inNxhwlIw1KHxeHqKyEXz/p4buaJNKvW9dhx7IXeo6jcmKheuXH6yE0SyZgOosiCcnobMjsByn1FS2gDGFNeKvn3hhTAd3kAPmDIKaU1oosomuXKCZGNbXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkDReqNk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkDReqNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766025206; x=1797561206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWQI+2I7pI3Y9Z4pTAhE38RkfvU9VrTd5QesIT4CioY=;
  b=HkDReqNkCyTtaAf44K1a6/NCyiO7dk8mFZzWGRExayAtUAdewPZp/MG9
   LmXLTkEIaaK6ZNRiDMhNodxY+Zyd712WzPQEo7TeBR5pG+hSZuK/F/sp2
   OY6OH8nwwbqfhL5dDojF9sEpYdx92kdleVzptgXg4AFK/GRyOY17wZ9mj
   zA2r/90ECEVXtOPZVK9TIkYE2Hwy+aLtmIuzAtDCzAnORMUPj8kr6yW1h
   gzBZ/JRFeAV0UPJyPCB3jrElFV+nDwUE5GyfAZj2Xib5tgH8pmBLnEaeC
   KsNU+oD356F2zxRYKdJ3q/ajBzB52H3X6kwm6+UU9IIkOs85lKLKRxIvo
   A==;
X-CSE-ConnectionGUID: Z6q5y8HWRk2B2I/qCJ0NsQ==
X-CSE-MsgGUID: baJ7rr+5Raafw35gvx+8Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="66969940"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="66969940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 18:33:25 -0800
X-CSE-ConnectionGUID: TVCTouhYQLW5J1Hl3vnKaQ==
X-CSE-MsgGUID: 3MexFKR1T22w+xqoEXZgtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229511128"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2025 18:33:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW3pS-000000001TB-2S1a;
	Thu, 18 Dec 2025 02:33:22 +0000
Date: Thu, 18 Dec 2025 10:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for
 'rb_event_size'
Message-ID: <202512181005.6NcnI0A2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [43/43] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181005.6NcnI0A2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181005.6NcnI0A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181005.6NcnI0A2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
   arch/arm64/kvm/hyp/nvhe/trace.c:150:56: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     150 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for 'rb_event_size' [-Wmissing-prototypes]
     190 | unsigned long rb_event_size(unsigned long length)
         |               ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:17:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: sparse: sparse: symbol 'rb_event_size' was not declared. Should it be static?

vim +/rb_event_size +190 arch/arm64/kvm/hyp/nvhe/trace.c

    14	
    15	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
    16	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
  > 17	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    18	
    19	static bool rb_set_flag(struct hyp_buffer_page *bpage, int new_flag)
    20	{
    21		unsigned long ret, val = (unsigned long)bpage->list.next;
    22	
    23		ret = cmpxchg((unsigned long *)&bpage->list.next,
    24			      val, (val & ~HYP_RB_FLAG_MASK) | new_flag);
    25	
    26		return ret == val;
    27	}
    28	
    29	static void rb_set_footer_status(struct hyp_buffer_page *bpage,
    30					 unsigned long status,
    31					 bool reader)
    32	{
    33		struct buffer_data_page *page = bpage->page;
    34		struct rb_ext_page_footer *footer;
    35	
    36		footer = rb_ext_page_get_footer(page);
    37	
    38		if (reader)
    39			atomic_set(&footer->reader_status, status);
    40		else
    41			atomic_set(&footer->writer_status, status);
    42	}
    43	
    44	static void rb_footer_writer_status(struct hyp_buffer_page *bpage,
    45					    unsigned long status)
    46	{
    47		rb_set_footer_status(bpage, status, false);
    48	}
    49	
    50	static void rb_footer_reader_status(struct hyp_buffer_page *bpage,
    51					    unsigned long status)
    52	{
    53		rb_set_footer_status(bpage, status, true);
    54	}
    55	
    56	static struct hyp_buffer_page *rb_hyp_buffer_page(struct list_head *list)
    57	{
    58		unsigned long ptr = (unsigned long)list & ~HYP_RB_FLAG_MASK;
    59	
    60		return container_of((struct list_head *)ptr, struct hyp_buffer_page, list);
    61	}
    62	
    63	static struct hyp_buffer_page *rb_next_page(struct hyp_buffer_page *bpage)
    64	{
    65		return rb_hyp_buffer_page(bpage->list.next);
    66	}
    67	
    68	static bool rb_is_head_page(struct hyp_buffer_page *bpage)
    69	{
    70		return (unsigned long)bpage->list.prev->next & HYP_RB_PAGE_HEAD;
    71	}
    72	
    73	static struct hyp_buffer_page *rb_set_head_page(struct hyp_rb_per_cpu *cpu_buffer)
    74	{
    75		struct hyp_buffer_page *bpage, *prev_head;
    76		int cnt = 0;
    77	again:
    78		bpage = prev_head = cpu_buffer->head_page;
    79		do {
    80			if (rb_is_head_page(bpage)) {
    81				cpu_buffer->head_page = bpage;
    82				rb_footer_reader_status(prev_head, 0);
    83				rb_footer_reader_status(bpage, RB_PAGE_FT_HEAD);
    84				return bpage;
    85			}
    86	
    87			bpage = rb_next_page(bpage);
    88		} while (bpage != prev_head);
    89	
    90		cnt++;
    91	
    92		/* We might have race with the writer let's try again */
    93		if (cnt < 3)
    94			goto again;
    95	
    96		return NULL;
    97	}
    98	
    99	static int rb_swap_reader_page(struct hyp_rb_per_cpu *cpu_buffer)
   100	{
   101		unsigned long *old_head_link, old_link_val, new_link_val, overrun;
   102		struct hyp_buffer_page *head, *reader = cpu_buffer->reader_page;
   103		struct rb_ext_page_footer *footer;
   104	
   105		rb_footer_reader_status(cpu_buffer->reader_page, 0);
   106	spin:
   107		/* Update the cpu_buffer->header_page according to HYP_RB_PAGE_HEAD */
   108		head = rb_set_head_page(cpu_buffer);
   109		if (!head)
   110			return -ENODEV;
   111	
   112		/* Connect the reader page around the header page */
   113		reader->list.next = head->list.next;
   114		reader->list.prev = head->list.prev;
   115	
   116		/* The reader page points to the new header page */
   117		rb_set_flag(reader, HYP_RB_PAGE_HEAD);
   118	
   119		/*
   120		 * Paired with the cmpxchg in rb_move_tail(). Order the read of the head
   121		 * page and overrun.
   122		 */
   123		smp_mb();
   124		overrun = atomic_read(&cpu_buffer->overrun);
   125	
   126		/* Try to swap the prev head link to the reader page */
   127		old_head_link = (unsigned long *)&reader->list.prev->next;
   128		old_link_val = (*old_head_link & ~HYP_RB_FLAG_MASK) | HYP_RB_PAGE_HEAD;
   129		new_link_val = (unsigned long)&reader->list;
   130		if (cmpxchg(old_head_link, old_link_val, new_link_val)
   131			      != old_link_val)
   132			goto spin;
   133	
   134		cpu_buffer->head_page = rb_hyp_buffer_page(reader->list.next);
   135		cpu_buffer->head_page->list.prev = &reader->list;
   136		cpu_buffer->reader_page = head;
   137	
   138		rb_footer_reader_status(cpu_buffer->reader_page, RB_PAGE_FT_READER);
   139		rb_footer_reader_status(cpu_buffer->head_page, RB_PAGE_FT_HEAD);
   140	
   141		footer = rb_ext_page_get_footer(cpu_buffer->reader_page->page);
   142		footer->stats.overrun = overrun;
   143	
   144		return 0;
   145	}
   146	
   147	static struct hyp_buffer_page *
   148	rb_move_tail(struct hyp_rb_per_cpu *cpu_buffer)
   149	{
   150		struct hyp_buffer_page *tail_page, *new_tail, *new_head;
   151	
   152		tail_page = cpu_buffer->tail_page;
   153		new_tail = rb_next_page(tail_page);
   154	again:
   155		/*
   156		 * We caught the reader ... Let's try to move the head page.
   157		 * The writer can only rely on ->next links to check if this is head.
   158		 */
   159		if ((unsigned long)tail_page->list.next & HYP_RB_PAGE_HEAD) {
   160			/* The reader moved the head in between */
   161			if (!rb_set_flag(tail_page, HYP_RB_PAGE_UPDATE))
   162				goto again;
   163	
   164			atomic_add(atomic_read(&new_tail->entries), &cpu_buffer->overrun);
   165	
   166			/* Move the head */
   167			rb_set_flag(new_tail, HYP_RB_PAGE_HEAD);
   168	
   169			/* The new head is in place, reset the update flag */
   170			rb_set_flag(tail_page, 0);
   171	
   172			new_head = rb_next_page(new_tail);
   173		}
   174	
   175		rb_footer_writer_status(tail_page, 0);
   176		rb_footer_writer_status(new_tail, RB_PAGE_FT_COMMIT);
   177	
   178		local_set(&new_tail->page->commit, 0);
   179	
   180		atomic_set(&new_tail->write, 0);
   181		atomic_set(&new_tail->entries, 0);
   182	
   183		atomic_inc(&cpu_buffer->pages_touched);
   184	
   185		cpu_buffer->tail_page = new_tail;
   186	
   187		return new_tail;
   188	}
   189	
 > 190	unsigned long rb_event_size(unsigned long length)
   191	{
   192		struct ring_buffer_event *event;
   193	
   194		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
