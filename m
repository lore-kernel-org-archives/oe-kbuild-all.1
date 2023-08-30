Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A8749D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693425621; x=1724961621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQfZLAkmyzDwrLkUPhd36ZsfuVwT+ZzQc5J2trL9A0w=;
  b=l/2f65ggak0Ka4itwNY2DQbhRSKYo1JjQbroMAGNRpP9aXkvYo5QRY23
   SavFjWs+p5kIDRNrYcptHrPehamve0SFWkNGaTdg5wLtH5thMFw1R0pfV
   iPck6U3pftKnZdcLURzfvSvatcrNREySwHWEBJzodkVf93tOix1paiEBC
   4rZ4MSH0EAbGYINiZki5ykv+EOtfVqO5pkn3Pt7TMwDSmUlljmtxsVtqh
   jr+6uQu82NWiyvr6bIn5zuOy8lSfBcr15G8HiHS/THUJgH9eEY/EDztqv
   kJSzZCzji6kiPgsmLLN+UhxeP+lNAQqAqdfUcki42GwOzf9UZ85LH0jIk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356055399"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="356055399"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768524087"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="768524087"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 13:00:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbRLw-000AB1-1L;
	Wed, 30 Aug 2023 20:00:13 +0000
Date: Thu, 31 Aug 2023 03:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 83/84] arch/riscv/kernel/ptrace.c:123:18: warning:
 unused variable 'size'
Message-ID: <202308310306.tOrkoBmI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   046ba817faa2e609c3751e2ee388d427fe9dd470
commit: dbe46b0940261301a038bbe1d699b29158b35a8d [83/84] RISC-V: Add ptrace support for vectors
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230831/202308310306.tOrkoBmI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310306.tOrkoBmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/ptrace.c: In function 'riscv_vr_set':
>> arch/riscv/kernel/ptrace.c:123:18: warning: unused variable 'size' [-Wunused-variable]
     123 |         int ret, size;
         |                  ^~~~


vim +/size +123 arch/riscv/kernel/ptrace.c

   117	
   118	static int riscv_vr_set(struct task_struct *target,
   119				const struct user_regset *regset,
   120				unsigned int pos, unsigned int count,
   121				const void *kbuf, const void __user *ubuf)
   122	{
 > 123		int ret, size;
   124		struct __riscv_v_ext_state *vstate = &target->thread.vstate;
   125		struct __riscv_v_regset_state ptrace_vstate;
   126	
   127		if (!riscv_v_vstate_query(task_pt_regs(target)))
   128			return -EINVAL;
   129	
   130		/* Copy rest of the vstate except datap */
   131		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
   132					 sizeof(struct __riscv_v_regset_state));
   133		if (unlikely(ret))
   134			return ret;
   135	
   136		if (vstate->vlenb != ptrace_vstate.vlenb)
   137			return -EINVAL;
   138	
   139		vstate->vstart = ptrace_vstate.vstart;
   140		vstate->vl = ptrace_vstate.vl;
   141		vstate->vtype = ptrace_vstate.vtype;
   142		vstate->vcsr = ptrace_vstate.vcsr;
   143	
   144		/* Copy all the vector registers. */
   145		pos = 0;
   146		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
   147					 0, riscv_v_vsize);
   148		return ret;
   149	}
   150	#endif
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
