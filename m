Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BFC2CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689624669; x=1721160669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYZqomN1D8Ays6pcBE5K37CJAjiYI0nK8ppVqk/+ZOU=;
  b=BNZwT4NCJpwpm5QFs/Aiu95IqPs9sreEQkyw3HqRNwtnGgYK9kP+M06D
   SOkdRGl3f6y0JWbaCCG5jjRxdxRik/Tc+U5ZvhNVjIE+WP6fiQmK9neH7
   qBrsJMNWsRZUB65vu1O+Muheh3/mvwb9phSUiKLnyrdsr3TIlRxb5+Q3q
   5XbpvqsbYtg9/AhVTKtlNw/6FtM3gW5FwDTl5/KciqB+X1oMDupQWPQy7
   MEruynw30Yf90y7aU9YIBVS4vt3rlIojged1VBi2XTH7awMHSIeHM+O5S
   Ha2h4O03rCM4kfb5gMpCbardw0lSX+UFeVSSu5SWXjoEyBUeOW0uCZgR8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368668315"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368668315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 13:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="897323208"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="897323208"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jul 2023 13:11:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLUYl-0009sg-1k;
	Mon, 17 Jul 2023 20:11:07 +0000
Date: Tue, 18 Jul 2023 04:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6542/11052]
 arch/arm64/kvm/hyp/nvhe/trace.c:150:49: warning: variable 'new_head' set but
 not used
Message-ID: <202307180433.KF69fzvc-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a16d62a2960b9f3c3e809d8051accf68826f3d32
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [6542/11052] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180433.KF69fzvc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180433.KF69fzvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180433.KF69fzvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/trace.c:150:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
           struct hyp_buffer_page *tail_page, *new_tail, *new_head;
                                                          ^
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for function 'rb_event_size' [-Wmissing-prototypes]
   unsigned long rb_event_size(unsigned long length)
                 ^
   arch/arm64/kvm/hyp/nvhe/trace.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rb_event_size(unsigned long length)
   ^
   static 
   2 warnings generated.


vim +/new_head +150 arch/arm64/kvm/hyp/nvhe/trace.c

   146	
   147	static struct hyp_buffer_page *
   148	rb_move_tail(struct hyp_rb_per_cpu *cpu_buffer)
   149	{
 > 150		struct hyp_buffer_page *tail_page, *new_tail, *new_head;
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
