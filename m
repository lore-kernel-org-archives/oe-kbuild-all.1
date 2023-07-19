Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F517F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689787363; x=1721323363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H1fYcKxZ4wvhEmLnAQiEgrIrX8HCMrsMQcbm8Qc1JtU=;
  b=Iy3zutB46OW0OZiyboZycmaidXhExXto/KIgVg5AwYsJvL3hC9QY1xCY
   GQe7iVdH1n0/PwEMjkoOKoSzpoZOG3N95GZdUagGrMsA3FG5EoWlVLXQE
   oKnmJkzyCEw6Pi4ar+Ylw50TLvcmLug3UvdiHazJCdeG9HKX1E4JNChIR
   cx/Cq1eWEIrHzkNWtVSC2eXN4zvnpK+cn/hV2Q4yPRgVAdiU1EQ1c7uEM
   ftxfEL3HSVuSCPHSKbSuIqkI1GM7mR8i/yNLIb3hR9FjovLKa5vIGu1Qi
   i2V6oCXtLE2bquaOlusX0l4SDXygO9AZTGa3aZaglOtc3lAdbMH+1lLWL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366569079"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366569079"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759259174"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="759259174"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 10:22:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMAsp-0005KT-03;
	Wed, 19 Jul 2023 17:22:39 +0000
Date: Thu, 20 Jul 2023 01:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 8/13]
 arch/mips/kernel/scall64-n64.S:108: undefined reference to
 `sys_futex_requeue'
Message-ID: <202307200118.N7iLbljS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   b70d7a00de0dc4c0525ce8226eb903695114f8ab
commit: 7c350c2f4ddab8995bb0006cc834b652acbd1970 [8/13] futex: Add sys_futex_requeue()
config: mips-randconfig-r023-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200118.N7iLbljS-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200118.N7iLbljS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200118.N7iLbljS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/kernel/scall64-n64.o: in function `illegal_syscall':
>> arch/mips/kernel/scall64-n64.S:108: undefined reference to `sys_futex_requeue'


vim +108 arch/mips/kernel/scall64-n64.S

^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  101  
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  102  illegal_syscall:
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  103  	/* This also isn't a 64-bit syscall, throw an error.  */
bda8229bdd0871 arch/mips/kernel/scall64-64.S Atsushi Nemoto 2008-10-25  104  	li	v0, ENOSYS			# error
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  105  	sd	v0, PT_R2(sp)
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  106  	li	t0, 1				# set error flag
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  107  	sd	t0, PT_R7(sp)
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16 @108  	j	n64_syscall_exit
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  109  	END(handle_sys64)
^1da177e4c3f41 arch/mips/kernel/scall64-64.S Linus Torvalds 2005-04-16  110  

:::::: The code at line 108 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
