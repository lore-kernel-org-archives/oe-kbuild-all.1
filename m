Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF412B79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686173088; x=1717709088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZ2DePtd/5n2kWZ3K/sTR9MXXW3+/h2OU665VEqhTss=;
  b=OAVLPyA8VGIYIDvzIH2Nx4mgOXU3j8+uJE5SidGpg7P30je6lcwrPHaw
   TKbOEoPANFbe+zCs3YlgJeweMmCejp2mTzqLB72kjcti1ST/WCIgCPgAp
   wWSaZLs53p4JkWaqDCfcvvGsM3FVdDxKAL/Pdo5WlItWmr4c4Jk+L2HqD
   e9z2aDXOzh851pYfWU4fvAXSYvTLnwXdFzq9dfM0WtRnoBHIMAf4ufvfF
   P62otSZA3DYGsfwUCQ0fMFRnbjyz4NXYUlRwVzuyx3iOwrmzKXT6XK2zD
   A01UmoWVk1vu3kypnbbuZVsDjg+Bk83XEj0R18rO1a45cLvM/Vx+dzjMR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360444613"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="360444613"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 14:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774790166"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="774790166"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 14:24:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q70e5-0006w3-0I;
	Wed, 07 Jun 2023 21:24:45 +0000
Date: Thu, 8 Jun 2023 05:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sergei Trofimovich <slyich@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: make[5]: *** No rule to make target 'scripts/module.lds', needed by
 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko'.
Message-ID: <202306080543.EJWQZYkE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a27648c742104a833a01c54becc24429898d85bf
commit: 82880283d7fcd0a1d20964a56d6d1a5cc0df0713 objtool: Fix truncated string warning
date:   1 year, 4 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=82880283d7fcd0a1d20964a56d6d1a5cc0df0713
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 82880283d7fcd0a1d20964a56d6d1a5cc0df0713
        make W=1 O=/tmp/kselftest headers
        make W=1 O=/tmp/kselftest -C tools/testing/selftests
        make W=1 O=/tmp/kselftest -C tools/testing/selftests/bpf

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080543.EJWQZYkE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:19:1: warning: no previous prototype for 'bpf_testmod_test_mod_kfunc' [-Wmissing-prototypes]
      19 | bpf_testmod_test_mod_kfunc(int i)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:24:14: warning: no previous prototype for 'bpf_testmod_loop_test' [-Wmissing-prototypes]
      24 | noinline int bpf_testmod_loop_test(int n)
         |              ^~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:36:30: warning: no previous prototype for 'bpf_testmod_return_ptr' [-Wmissing-prototypes]
      36 | __weak noinline struct file *bpf_testmod_return_ptr(int arg)
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:53:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
      53 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:89:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
      89 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
         | ^~~~~~~~~~~~~~~~~~~~~~
--
>> make[5]: *** No rule to make target 'scripts/module.lds', needed by 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko'.
   make[5]: Target '__modfinal' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
