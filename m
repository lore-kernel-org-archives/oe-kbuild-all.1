Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDBA3DB8F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 21:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7zZRM0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704836637; x=1736372637;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OMdXuTCIIJ5wHrSSTEeB4t+5HVl9ldc0ixcWKTgspbA=;
  b=P7zZRM0RycYZOPU5uBnRp/im21nJGn2o+U1fK/QGW268fR1baHCocCyQ
   yHoARqQdcGJxl7Lxp6di5Xp3/aVomVyj4bwM+b8/obzzpnICpU+OolOjp
   UWsmK1jKBzC1CjSZk4MqS0ucaQhOnrsJ2RX6QEm5Pjoja7Lz3QJ46S6IV
   CMSXcrD9wkbVC0LvjmeCTiDW7mL44DRwOuo/DNb1+9LddsX7Wd6TVbwm2
   cDMrxYSA7fd9FHnKxgnWgGiAFx6ZJ37B5dEXJQS/oYCe9t1FxxwlpKw2D
   dFmdddnNOFS+9tVRyptAeMSCD6pU37fHMtEasBdHdrhLa/onDChF+a555
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11676498"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="11676498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 13:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731618177"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="731618177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2024 13:43:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNJt2-0006Hk-3D;
	Tue, 09 Jan 2024 21:43:53 +0000
Date: Wed, 10 Jan 2024 05:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 32/33]
 drivers/android/binder.c:6202:47: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'int'
Message-ID: <202401100511.A4BKMwoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   6246b8f3ef4604042c1141448e9e46d6389dd74b
commit: 63f7ddea2e483bd4e475d03590c877d7d1837a71 [32/33] ANDROID: binder: fix KMI-break due to address type change
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240110/202401100511.A4BKMwoq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100511.A4BKMwoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100511.A4BKMwoq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c: In function 'print_binder_transaction_ilocked':
>> drivers/android/binder.c:6202:47: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
    6202 |         seq_printf(m, " size %zd:%zd offset %lx\n",
         |                                             ~~^
         |                                               |
         |                                               long unsigned int
         |                                             %x
    6203 |                    buffer->data_size, buffer->offsets_size,
    6204 |                    proc->alloc.buffer - buffer->user_data);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
--
   drivers/android/binder_alloc.c: In function 'binder_alloc_deferred_release':
   drivers/android/binder_alloc.c:936:39: warning: variable 'page_addr' set but not used [-Wunused-but-set-variable]
     936 |                         unsigned long page_addr;
         |                                       ^~~~~~~~~
   drivers/android/binder_alloc.c: In function 'binder_alloc_print_allocated':
>> drivers/android/binder_alloc.c:980:47: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
     980 |                 seq_printf(m, "  buffer %d: %lx size %zd:%zd:%zd %s\n",
         |                                             ~~^
         |                                               |
         |                                               long unsigned int
         |                                             %x
     981 |                            buffer->debug_id,
     982 |                            buffer->user_data - alloc->buffer,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              |
         |                                              int


vim +6202 drivers/android/binder.c

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6162  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6163  static void print_binder_transaction_ilocked(struct seq_file *m,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6164  					     struct binder_proc *proc,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6165  					     const char *prefix,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6166  					     struct binder_transaction *t)
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6167  {
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6168  	struct binder_proc *to_proc;
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6169  	struct binder_buffer *buffer = t->buffer;
5d4d5dbeab2ce0 drivers/android/binder.c         Chuang Zhang       2023-04-24  6170  	ktime_t current_time = ktime_get();
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6171  
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6172  	spin_lock(&t->lock);
3c5df4a52e4a1e drivers/android/binder.c         zhang chuang       2021-06-16  6173  	trace_android_vh_binder_print_transaction_info(m, proc, prefix, t);
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6174  	to_proc = t->to_proc;
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6175  	seq_printf(m,
5d4d5dbeab2ce0 drivers/android/binder.c         Chuang Zhang       2023-04-24  6176  		   "%s %d: %pK from %d:%d to %d:%d code %x flags %x pri %d:%d r%d elapsed %lldms",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6177  		   prefix, t->debug_id, t,
99027afdd195e3 drivers/android/binder.c         Chuang Zhang       2023-04-24  6178  		   t->from_pid,
99027afdd195e3 drivers/android/binder.c         Chuang Zhang       2023-04-24  6179  		   t->from_tid,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6180  		   to_proc ? to_proc->pid : 0,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6181  		   t->to_thread ? t->to_thread->pid : 0,
e00eb41c0c7bea drivers/android/binder.c         Martijn Coenen     2017-06-06  6182  		   t->code, t->flags, t->priority.sched_policy,
5d4d5dbeab2ce0 drivers/android/binder.c         Chuang Zhang       2023-04-24  6183  		   t->priority.prio, t->need_reply,
5d4d5dbeab2ce0 drivers/android/binder.c         Chuang Zhang       2023-04-24  6184  		   ktime_ms_delta(current_time, t->start_time));
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6185  	spin_unlock(&t->lock);
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6186  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6187  	if (proc != to_proc) {
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6188  		/*
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6189  		 * Can only safely deref buffer if we are holding the
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6190  		 * correct proc inner lock for this node
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6191  		 */
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6192  		seq_puts(m, "\n");
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6193  		return;
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6194  	}
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6195  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6196  	if (buffer == NULL) {
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6197  		seq_puts(m, " buffer free\n");
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6198  		return;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6199  	}
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6200  	if (buffer->target_node)
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6201  		seq_printf(m, " node %d", buffer->target_node->debug_id);
f0667c870ce00a drivers/android/binder.c         Carlos Llamas      2023-12-01 @6202  	seq_printf(m, " size %zd:%zd offset %lx\n",
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6203  		   buffer->data_size, buffer->offsets_size,
f0667c870ce00a drivers/android/binder.c         Carlos Llamas      2023-12-01  6204  		   proc->alloc.buffer - buffer->user_data);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6205  }
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6206  

:::::: The code at line 6202 was first introduced by commit
:::::: f0667c870ce00ad02f90c64e2a7f00e785fe83ba FROMGIT: binder: avoid user addresses in debug logs

:::::: TO: Carlos Llamas <cmllamas@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
