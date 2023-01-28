Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B75CBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674918584; x=1706454584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/zKoJZqVKkHhbud3Puge9twzzE3+iIldZHCU9QlsX8=;
  b=IyLgWyIApWn4fVMxm4JpapsPzy34lvoapJXW3bdXp7iEe9TchbCfk9/j
   H5l+WlfJmFGAxIoMrhTO9GajkLRDQoLJmaCb0F1o7Q9FLkM29mk4d46SZ
   WG01gZRAMpgcnFgHOnIYAo7PeQs3VuwEaWUJjkZMc6O2HKzwfws3VH/xn
   RSXiwV6OE/nTlxW1RjdmdPnx5qIr1gHm2fefiIBj8AXZSfF2aRhMGQ4J+
   GGC6feAt+NGWgB6siAYsdEU9IOH69/Q/6xjKx1Zh+muw9xcVxcV3nWM+E
   C4bZJLMz4L+xs76ujVzj8b3OnazNCg+9tOSFsK+4DtJ0q3iMrH30n3sUM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391852253"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391852253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 07:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665577714"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665577714"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 07:09:42 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLmpk-0000pT-2C;
	Sat, 28 Jan 2023 15:09:36 +0000
Date: Sat, 28 Jan 2023 23:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6542/6550]
 arch/arm64/kvm/hyp/nvhe/trace.c:150:56: warning: variable 'new_head' set but
 not used
Message-ID: <202301282336.MwZEUQuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5a5282ca964178e46d1adb96ea1c3341303e94b
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [6542/6550] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301282336.MwZEUQuS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 4c095252cfa95e2d7850c70ec055de1b2284cc76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
>> arch/arm64/kvm/hyp/nvhe/trace.c:150:56: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     150 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for 'rb_event_size' [-Wmissing-prototypes]
     190 | unsigned long rb_event_size(unsigned long length)
         |               ^~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
