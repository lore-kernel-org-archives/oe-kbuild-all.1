Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559B24133
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 23:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686008433; x=1717544433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIFJr/YYMTqZjMdbM6ssDWK4YRBXeZ61/IxbvVmMXh4=;
  b=JdgpeAm8Y0ajWP0KWpI9JdVVtZRb3l8Nv4j0V1yTzPTt4WSx0eJMKc9N
   V0oJn8X71fX0AlRdQy5m1T1cIssoxe92KcSEY4FTPCL02AgfO0j+2eXQE
   gyD+Gcac2dknyEXOLhYak+NMl9AMcyQgcDDR4smeSQzVUgfT0BTaYVQPB
   qEI8Zw9R4IelvnytHzZ9GQi3OnPc6zxHaOTTrqW5AixtB43Y8f56INA73
   /Ai/tJ09sBi+aNuf/ZZn9KxUM7VShiNa/p4VMa1PHCNCbykwJ3zfRPD8I
   AHymKob5FE9fRXYHCgjXidLdtdWWtpgBVOA9rmb2IEqRJs4iF7newCn6P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336133220"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="336133220"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798609422"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="798609422"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 16:40:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6JoM-0004YR-2Y;
	Mon, 05 Jun 2023 23:40:30 +0000
Date: Tue, 6 Jun 2023 07:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6542/10688]
 arch/arm64/kvm/hyp/nvhe/trace.c:150:49: warning: variable 'new_head' set but
 not used
Message-ID: <202306060708.vSTYxUc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c0cfeeaa8851ea3d206df6ac485c27e8eb8d7083
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [6542/10688] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r006-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060708.vSTYxUc5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 4c095252cfa95e2d7850c70ec055de1b2284cc76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060708.vSTYxUc5-lkp@intel.com/

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
