Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FA2CA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678827720; x=1710363720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnZYqRdIFaZ4volasEPx4GsQfadRSrlm0cSpSUNUcwM=;
  b=hF3H3oJrVElxCYQxtPWckQa5dpw8M6pbo1g6GHzeQb5r0oFSJO4cDYq3
   veYwahv6dzTGlppwofdOzftLkUOS2FmBkD0E+cv8l4mrxNpXDFi+X1kih
   uRfX3ErcQdm1TKjAXrXC3w8/cmmgO0cqaeeYaYR9e1pIU4ihVTc0YGyJ5
   Vp4eVxd/gkOLitiRyEhM/Uf8oiGScmNyYatQsaZ95IQb8sC0U0ZVC1/jw
   H2IXAGlMOmIN/PTQE+ua4AJOkeA48VtwBJNimuzx4rj5mCLo0tsQ62bXM
   Z/De55R+t3NjHhwkd5fvoeDyXZAPA+7oTYJ3oFsx6tJ5LtPQ1twXCiwid
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335027207"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="335027207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 14:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768247198"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="768247198"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 14:01:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcBmJ-0007C4-0u;
	Tue, 14 Mar 2023 21:01:51 +0000
Date: Wed, 15 Mar 2023 05:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 37/39] include/linux/wait.h:129: undefined
 reference to `sock_from_file'
Message-ID: <202303150438.A7QwwhSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 7cc1f70554018f6b92c0f424855474939d0882ce [37/39] pipe, splice: Make splice use the new pipe helpers
config: xtensa-randconfig-r002-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150438.A7QwwhSz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=7cc1f70554018f6b92c0f424855474939d0882ce
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 7cc1f70554018f6b92c0f424855474939d0882ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150438.A7QwwhSz-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: fs/splice.o: in function `wakeup_pipe_writers':
   fs/splice.c:435: undefined reference to `sock_from_file'
   xtensa-linux-ld: fs/splice.c:166: undefined reference to `sock_sendmsg'
   xtensa-linux-ld: fs/splice.o: in function `waitqueue_active':
>> include/linux/wait.h:129: undefined reference to `sock_from_file'
   xtensa-linux-ld: fs/splice.o: in function `pipe_to_sendmsg':
   fs/splice.c:413: undefined reference to `sock_sendmsg'


vim +129 include/linux/wait.h

^1da177e4c3f41 Linus Torvalds   2005-04-16   96  
69e51e92a39408 Peter Zijlstra   2015-10-23   97  /**
69e51e92a39408 Peter Zijlstra   2015-10-23   98   * waitqueue_active -- locklessly test for waiters on the queue
9d9d676f595b50 Ingo Molnar      2017-03-05   99   * @wq_head: the waitqueue to test for waiters
69e51e92a39408 Peter Zijlstra   2015-10-23  100   *
69e51e92a39408 Peter Zijlstra   2015-10-23  101   * returns true if the wait list is not empty
69e51e92a39408 Peter Zijlstra   2015-10-23  102   *
69e51e92a39408 Peter Zijlstra   2015-10-23  103   * NOTE: this function is lockless and requires care, incorrect usage _will_
69e51e92a39408 Peter Zijlstra   2015-10-23  104   * lead to sporadic and non-obvious failure.
69e51e92a39408 Peter Zijlstra   2015-10-23  105   *
9d9d676f595b50 Ingo Molnar      2017-03-05  106   * Use either while holding wait_queue_head::lock or when used for wakeups
8c1007fdc71fdf Tobin C. Harding 2019-04-09  107   * with an extra smp_mb() like::
69e51e92a39408 Peter Zijlstra   2015-10-23  108   *
69e51e92a39408 Peter Zijlstra   2015-10-23  109   *      CPU0 - waker                    CPU1 - waiter
69e51e92a39408 Peter Zijlstra   2015-10-23  110   *
69e51e92a39408 Peter Zijlstra   2015-10-23  111   *                                      for (;;) {
4b1c480bfa3b24 Ingo Molnar      2017-03-05  112   *      @cond = true;                     prepare_to_wait(&wq_head, &wait, state);
69e51e92a39408 Peter Zijlstra   2015-10-23  113   *      smp_mb();                         // smp_mb() from set_current_state()
4b1c480bfa3b24 Ingo Molnar      2017-03-05  114   *      if (waitqueue_active(wq_head))         if (@cond)
4b1c480bfa3b24 Ingo Molnar      2017-03-05  115   *        wake_up(wq_head);                      break;
69e51e92a39408 Peter Zijlstra   2015-10-23  116   *                                        schedule();
69e51e92a39408 Peter Zijlstra   2015-10-23  117   *                                      }
4b1c480bfa3b24 Ingo Molnar      2017-03-05  118   *                                      finish_wait(&wq_head, &wait);
69e51e92a39408 Peter Zijlstra   2015-10-23  119   *
69e51e92a39408 Peter Zijlstra   2015-10-23  120   * Because without the explicit smp_mb() it's possible for the
69e51e92a39408 Peter Zijlstra   2015-10-23  121   * waitqueue_active() load to get hoisted over the @cond store such that we'll
69e51e92a39408 Peter Zijlstra   2015-10-23  122   * observe an empty wait list while the waiter might not observe @cond.
69e51e92a39408 Peter Zijlstra   2015-10-23  123   *
69e51e92a39408 Peter Zijlstra   2015-10-23  124   * Also note that this 'optimization' trades a spin_lock() for an smp_mb(),
69e51e92a39408 Peter Zijlstra   2015-10-23  125   * which (when the lock is uncontended) are of roughly equal cost.
69e51e92a39408 Peter Zijlstra   2015-10-23  126   */
9d9d676f595b50 Ingo Molnar      2017-03-05  127  static inline int waitqueue_active(struct wait_queue_head *wq_head)
^1da177e4c3f41 Linus Torvalds   2005-04-16  128  {
2055da97389a60 Ingo Molnar      2017-06-20 @129  	return !list_empty(&wq_head->head);
^1da177e4c3f41 Linus Torvalds   2005-04-16  130  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  131  

:::::: The code at line 129 was first introduced by commit
:::::: 2055da97389a605c8a00d163d40903afbe413921 sched/wait: Disambiguate wq_entry->task_list and wq_head->task_list naming

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
