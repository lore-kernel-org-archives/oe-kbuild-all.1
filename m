Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932737F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692673319; x=1724209319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7f9zHgpVnBODZtHB5ZWAa5ui8f8afEZC36kaOiMWCgA=;
  b=QfWaPbsxgceFU7KHqy4rsqoMZiqHdbMzvTF3jBldkC01++gRBZxW+l6w
   V1eaMtbPzJgywb+3HuJ1vhdhD6/ntX4nd59ZysEQ9RFJW/80tw5ryypUs
   2qvJcCpuG73VDlfd3gOtrRXWNOpRqZYN42iWWXLyO3kztE2M9g63fjTAt
   0Tb6C5K4EojclhtSZVQAyYpuPDQcwZsNAUePiJIIiEM+x/RcESCGNQbXF
   tO4f3THRbeN3zNh/9mFdj/hj6Teg/L04xNBAjU+4gCKBjFQUqIkYZHuEC
   Eq6Ijo9MTcmLKodLeK91o4hrcAET2jL7akq//LzAPGLH/L7zo+YEcFsxI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353334853"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="353334853"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="736051606"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="736051606"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 20:01:57 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYHeW-0001H6-1Z;
	Tue, 22 Aug 2023 03:01:56 +0000
Date: Tue, 22 Aug 2023 11:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 11/13] arch/parisc/net/bpf_jit_core.c:20:14:
 warning: variable 'again' set but not used
Message-ID: <202308221007.DdwwUTXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   557fefd16958f21ae5aa9994dd2b2d9e0d683787
commit: d5e3a70d1d99fe11c8552fd489ce6908774bf746 [11/13] parisc: Wire up eBPF JIT compiler
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230822/202308221007.DdwwUTXx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221007.DdwwUTXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221007.DdwwUTXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/parisc/net/bpf_jit_core.c: In function 'build_body':
>> arch/parisc/net/bpf_jit_core.c:20:14: warning: variable 'again' set but not used [-Wunused-but-set-variable]
      20 |         bool again = false;
         |              ^~~~~


vim +/again +20 arch/parisc/net/bpf_jit_core.c

0ae0a14c3835b3 Helge Deller 2023-08-17  15  
0ae0a14c3835b3 Helge Deller 2023-08-17  16  static int build_body(struct hppa_jit_context *ctx, bool extra_pass, int *offset)
0ae0a14c3835b3 Helge Deller 2023-08-17  17  {
0ae0a14c3835b3 Helge Deller 2023-08-17  18  	const struct bpf_prog *prog = ctx->prog;
0ae0a14c3835b3 Helge Deller 2023-08-17  19  	int i;
0ae0a14c3835b3 Helge Deller 2023-08-17 @20  	bool again = false;
0ae0a14c3835b3 Helge Deller 2023-08-17  21  
0ae0a14c3835b3 Helge Deller 2023-08-17  22  	ctx->reg_seen_collect = true;
0ae0a14c3835b3 Helge Deller 2023-08-17  23  	for (i = 0; i < prog->len; i++) {
0ae0a14c3835b3 Helge Deller 2023-08-17  24  		const struct bpf_insn *insn = &prog->insnsi[i];
0ae0a14c3835b3 Helge Deller 2023-08-17  25  		int ret;
0ae0a14c3835b3 Helge Deller 2023-08-17  26  
0ae0a14c3835b3 Helge Deller 2023-08-17  27  		ret = bpf_jit_emit_insn(insn, ctx, extra_pass);
0ae0a14c3835b3 Helge Deller 2023-08-17  28  // printk("instruction #%d -> RET %d\n", i, ret);
0ae0a14c3835b3 Helge Deller 2023-08-17  29  		/* BPF_LD | BPF_IMM | BPF_DW: skip the next instruction. */
0ae0a14c3835b3 Helge Deller 2023-08-17  30  		if (ret > 0)
0ae0a14c3835b3 Helge Deller 2023-08-17  31  			i++;
0ae0a14c3835b3 Helge Deller 2023-08-17  32  		if (offset) {
0ae0a14c3835b3 Helge Deller 2023-08-17  33  			if (offset[i] != ctx->ninsns)
0ae0a14c3835b3 Helge Deller 2023-08-17  34  				again = 1;
0ae0a14c3835b3 Helge Deller 2023-08-17  35  			offset[i] = ctx->ninsns;
0ae0a14c3835b3 Helge Deller 2023-08-17  36  		}
0ae0a14c3835b3 Helge Deller 2023-08-17  37  // printk("INSTR  %d  offset at %d\n", i, offset ? offset[i]: 0);
0ae0a14c3835b3 Helge Deller 2023-08-17  38  		if (ret < 0)
0ae0a14c3835b3 Helge Deller 2023-08-17  39  			return ret;
0ae0a14c3835b3 Helge Deller 2023-08-17  40  	}
0ae0a14c3835b3 Helge Deller 2023-08-17  41  	ctx->reg_seen_collect = false;
0ae0a14c3835b3 Helge Deller 2023-08-17  42  	return 0;
0ae0a14c3835b3 Helge Deller 2023-08-17  43  }
0ae0a14c3835b3 Helge Deller 2023-08-17  44  

:::::: The code at line 20 was first introduced by commit
:::::: 0ae0a14c3835b36b7a5eb1616cd28e5082029290 parisc: Add eBPF JIT compiler glue code and Makefile

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
