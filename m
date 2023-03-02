Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2DEDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677727801; x=1709263801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7YPNSCiyO4Pu6D0l8Bx4t1SJ/bCB+ANQfSNz1vh2wA=;
  b=musehGsm7CnBXT0qNkWxItvR3RucH3EImqK0p8YULxCVglWWEMqEXc0E
   5SZouggEp0qZR3rnRzl97XxCNfPdqVa1A1disK3TkJVlOujrTWeKTxOIz
   0JL21I4pbx6JZC/hm+IZlnHz8cGXYkZa0JVJergusVH3zTM+eJIV5yBh3
   X2OJxHoCDUMJkdem8eDQvf5Tpv5jlE2+LfVQdBoNHfMVJ9uThdaBhDXeS
   5cpENbkkZay5Y+U/yGBWvWr/WaHPp7OcvTQrIhWnP5KrxOzfCXMye2Q4w
   uOkeXv6OpxxjybsvDLc/8gDUpn5695Uo87a6EVqQLGsyAtHLsFpx6PhKx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332085161"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332085161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743674637"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743674637"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 19:29:58 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZdm-00009O-0I;
	Thu, 02 Mar 2023 03:29:58 +0000
Date: Thu, 2 Mar 2023 11:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 35/93]
 arch/s390/net/bpf_jit_comp.c:1122:7: error: implicit declaration of function
 'nospec_uses_trampoline'; did you mean 'node_set_offline'?
Message-ID: <202303021123.515eLXUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   725fa7e8c352c766f8910308f90357cc697bd9bd
commit: 9cf5fd9b44b622e4001ce0c618a9c2ed53697e04 [35/93] s390/bpf: Add expoline to tail calls
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021123.515eLXUB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=9cf5fd9b44b622e4001ce0c618a9c2ed53697e04
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.14
        git checkout 9cf5fd9b44b622e4001ce0c618a9c2ed53697e04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021123.515eLXUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:13:0,
                    from include/linux/netdevice.h:36,
                    from arch/s390/net/bpf_jit_comp.c:22:
   include/net/sch_generic.h: In function 'qdisc_qstats_cpu_drop':
   arch/s390/include/asm/percpu.h:74:21: warning: comparison is always true due to limited range of data type [-Wtype-limits]
         ((szcast)val__ > -129) && ((szcast)val__ < 128)) {  \
                        ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
    #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
                                     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: in expansion of macro 'this_cpu_add_8'
      case 8: stem##8(variable, __VA_ARGS__);break;  \
              ^~~~
   include/linux/percpu-defs.h:496:33: note: in expansion of macro '__pcpu_size_call'
    #define this_cpu_add(pcp, val)  __pcpu_size_call(this_cpu_add_, pcp, val)
                                    ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:507:28: note: in expansion of macro 'this_cpu_add'
    #define this_cpu_inc(pcp)  this_cpu_add(pcp, 1)
                               ^~~~~~~~~~~~
   include/net/sch_generic.h:656:2: note: in expansion of macro 'this_cpu_inc'
     this_cpu_inc(sch->cpu_qstats->drops);
     ^~~~~~~~~~~~
   arch/s390/net/bpf_jit_comp.c: In function 'bpf_jit_insn':
>> arch/s390/net/bpf_jit_comp.c:1122:7: error: implicit declaration of function 'nospec_uses_trampoline'; did you mean 'node_set_offline'? [-Werror=implicit-function-declaration]
      if (nospec_uses_trampoline()) {
          ^~~~~~~~~~~~~~~~~~~~~~
          node_set_offline
>> arch/s390/net/bpf_jit_comp.c:1127:4: error: implicit declaration of function 'EMIT6_PCREL_RILC'; did you mean 'EMIT6_PCREL_RIL'? [-Werror=implicit-function-declaration]
       EMIT6_PCREL_RILC(0xc0040000, 0xf, jit->r1_thunk_ip);
       ^~~~~~~~~~~~~~~~
       EMIT6_PCREL_RIL
   cc1: some warnings being treated as errors


vim +1122 arch/s390/net/bpf_jit_comp.c

   527	
   528	/*
   529	 * Compile one eBPF instruction into s390x code
   530	 *
   531	 * NOTE: Use noinline because for gcov (-fprofile-arcs) gcc allocates a lot of
   532	 * stack space for the large switch statement.
   533	 */
   534	static noinline int bpf_jit_insn(struct bpf_jit *jit, struct bpf_prog *fp, int i)
   535	{
   536		struct bpf_insn *insn = &fp->insnsi[i];
   537		int jmp_off, last, insn_count = 1;
   538		unsigned int func_addr, mask;
   539		u32 dst_reg = insn->dst_reg;
   540		u32 src_reg = insn->src_reg;
   541		u32 *addrs = jit->addrs;
   542		s32 imm = insn->imm;
   543		s16 off = insn->off;
   544	
   545		if (dst_reg == BPF_REG_AX || src_reg == BPF_REG_AX)
   546			jit->seen |= SEEN_REG_AX;
   547		switch (insn->code) {
   548		/*
   549		 * BPF_MOV
   550		 */
   551		case BPF_ALU | BPF_MOV | BPF_X: /* dst = (u32) src */
   552			/* llgfr %dst,%src */
   553			EMIT4(0xb9160000, dst_reg, src_reg);
   554			break;
   555		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
   556			/* lgr %dst,%src */
   557			EMIT4(0xb9040000, dst_reg, src_reg);
   558			break;
   559		case BPF_ALU | BPF_MOV | BPF_K: /* dst = (u32) imm */
   560			/* llilf %dst,imm */
   561			EMIT6_IMM(0xc00f0000, dst_reg, imm);
   562			break;
   563		case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = imm */
   564			/* lgfi %dst,imm */
   565			EMIT6_IMM(0xc0010000, dst_reg, imm);
   566			break;
   567		/*
   568		 * BPF_LD 64
   569		 */
   570		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
   571		{
   572			/* 16 byte instruction that uses two 'struct bpf_insn' */
   573			u64 imm64;
   574	
   575			imm64 = (u64)(u32) insn[0].imm | ((u64)(u32) insn[1].imm) << 32;
   576			/* lg %dst,<d(imm)>(%l) */
   577			EMIT6_DISP_LH(0xe3000000, 0x0004, dst_reg, REG_0, REG_L,
   578				      EMIT_CONST_U64(imm64));
   579			insn_count = 2;
   580			break;
   581		}
   582		/*
   583		 * BPF_ADD
   584		 */
   585		case BPF_ALU | BPF_ADD | BPF_X: /* dst = (u32) dst + (u32) src */
   586			/* ar %dst,%src */
   587			EMIT2(0x1a00, dst_reg, src_reg);
   588			EMIT_ZERO(dst_reg);
   589			break;
   590		case BPF_ALU64 | BPF_ADD | BPF_X: /* dst = dst + src */
   591			/* agr %dst,%src */
   592			EMIT4(0xb9080000, dst_reg, src_reg);
   593			break;
   594		case BPF_ALU | BPF_ADD | BPF_K: /* dst = (u32) dst + (u32) imm */
   595			if (imm != 0) {
   596				/* alfi %dst,imm */
   597				EMIT6_IMM(0xc20b0000, dst_reg, imm);
   598			}
   599			EMIT_ZERO(dst_reg);
   600			break;
   601		case BPF_ALU64 | BPF_ADD | BPF_K: /* dst = dst + imm */
   602			if (!imm)
   603				break;
   604			/* agfi %dst,imm */
   605			EMIT6_IMM(0xc2080000, dst_reg, imm);
   606			break;
   607		/*
   608		 * BPF_SUB
   609		 */
   610		case BPF_ALU | BPF_SUB | BPF_X: /* dst = (u32) dst - (u32) src */
   611			/* sr %dst,%src */
   612			EMIT2(0x1b00, dst_reg, src_reg);
   613			EMIT_ZERO(dst_reg);
   614			break;
   615		case BPF_ALU64 | BPF_SUB | BPF_X: /* dst = dst - src */
   616			/* sgr %dst,%src */
   617			EMIT4(0xb9090000, dst_reg, src_reg);
   618			break;
   619		case BPF_ALU | BPF_SUB | BPF_K: /* dst = (u32) dst - (u32) imm */
   620			if (imm != 0) {
   621				/* alfi %dst,-imm */
   622				EMIT6_IMM(0xc20b0000, dst_reg, -imm);
   623			}
   624			EMIT_ZERO(dst_reg);
   625			break;
   626		case BPF_ALU64 | BPF_SUB | BPF_K: /* dst = dst - imm */
   627			if (!imm)
   628				break;
   629			if (imm == -0x80000000) {
   630				/* algfi %dst,0x80000000 */
   631				EMIT6_IMM(0xc20a0000, dst_reg, 0x80000000);
   632			} else {
   633				/* agfi %dst,-imm */
   634				EMIT6_IMM(0xc2080000, dst_reg, -imm);
   635			}
   636			break;
   637		/*
   638		 * BPF_MUL
   639		 */
   640		case BPF_ALU | BPF_MUL | BPF_X: /* dst = (u32) dst * (u32) src */
   641			/* msr %dst,%src */
   642			EMIT4(0xb2520000, dst_reg, src_reg);
   643			EMIT_ZERO(dst_reg);
   644			break;
   645		case BPF_ALU64 | BPF_MUL | BPF_X: /* dst = dst * src */
   646			/* msgr %dst,%src */
   647			EMIT4(0xb90c0000, dst_reg, src_reg);
   648			break;
   649		case BPF_ALU | BPF_MUL | BPF_K: /* dst = (u32) dst * (u32) imm */
   650			if (imm != 1) {
   651				/* msfi %r5,imm */
   652				EMIT6_IMM(0xc2010000, dst_reg, imm);
   653			}
   654			EMIT_ZERO(dst_reg);
   655			break;
   656		case BPF_ALU64 | BPF_MUL | BPF_K: /* dst = dst * imm */
   657			if (imm == 1)
   658				break;
   659			/* msgfi %dst,imm */
   660			EMIT6_IMM(0xc2000000, dst_reg, imm);
   661			break;
   662		/*
   663		 * BPF_DIV / BPF_MOD
   664		 */
   665		case BPF_ALU | BPF_DIV | BPF_X: /* dst = (u32) dst / (u32) src */
   666		case BPF_ALU | BPF_MOD | BPF_X: /* dst = (u32) dst % (u32) src */
   667		{
   668			int rc_reg = BPF_OP(insn->code) == BPF_DIV ? REG_W1 : REG_W0;
   669	
   670			jit->seen |= SEEN_RET0;
   671			/* ltr %src,%src (if src == 0 goto fail) */
   672			EMIT2(0x1200, src_reg, src_reg);
   673			/* jz <ret0> */
   674			EMIT4_PCREL(0xa7840000, jit->ret0_ip - jit->prg);
   675			/* lhi %w0,0 */
   676			EMIT4_IMM(0xa7080000, REG_W0, 0);
   677			/* lr %w1,%dst */
   678			EMIT2(0x1800, REG_W1, dst_reg);
   679			/* dlr %w0,%src */
   680			EMIT4(0xb9970000, REG_W0, src_reg);
   681			/* llgfr %dst,%rc */
   682			EMIT4(0xb9160000, dst_reg, rc_reg);
   683			break;
   684		}
   685		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst = dst / src */
   686		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst = dst % src */
   687		{
   688			int rc_reg = BPF_OP(insn->code) == BPF_DIV ? REG_W1 : REG_W0;
   689	
   690			jit->seen |= SEEN_RET0;
   691			/* ltgr %src,%src (if src == 0 goto fail) */
   692			EMIT4(0xb9020000, src_reg, src_reg);
   693			/* jz <ret0> */
   694			EMIT4_PCREL(0xa7840000, jit->ret0_ip - jit->prg);
   695			/* lghi %w0,0 */
   696			EMIT4_IMM(0xa7090000, REG_W0, 0);
   697			/* lgr %w1,%dst */
   698			EMIT4(0xb9040000, REG_W1, dst_reg);
   699			/* dlgr %w0,%dst */
   700			EMIT4(0xb9870000, REG_W0, src_reg);
   701			/* lgr %dst,%rc */
   702			EMIT4(0xb9040000, dst_reg, rc_reg);
   703			break;
   704		}
   705		case BPF_ALU | BPF_DIV | BPF_K: /* dst = (u32) dst / (u32) imm */
   706		case BPF_ALU | BPF_MOD | BPF_K: /* dst = (u32) dst % (u32) imm */
   707		{
   708			int rc_reg = BPF_OP(insn->code) == BPF_DIV ? REG_W1 : REG_W0;
   709	
   710			if (imm == 1) {
   711				if (BPF_OP(insn->code) == BPF_MOD)
   712					/* lhgi %dst,0 */
   713					EMIT4_IMM(0xa7090000, dst_reg, 0);
   714				else
   715					EMIT_ZERO(dst_reg);
   716				break;
   717			}
   718			/* lhi %w0,0 */
   719			EMIT4_IMM(0xa7080000, REG_W0, 0);
   720			/* lr %w1,%dst */
   721			EMIT2(0x1800, REG_W1, dst_reg);
   722			/* dl %w0,<d(imm)>(%l) */
   723			EMIT6_DISP_LH(0xe3000000, 0x0097, REG_W0, REG_0, REG_L,
   724				      EMIT_CONST_U32(imm));
   725			/* llgfr %dst,%rc */
   726			EMIT4(0xb9160000, dst_reg, rc_reg);
   727			break;
   728		}
   729		case BPF_ALU64 | BPF_DIV | BPF_K: /* dst = dst / imm */
   730		case BPF_ALU64 | BPF_MOD | BPF_K: /* dst = dst % imm */
   731		{
   732			int rc_reg = BPF_OP(insn->code) == BPF_DIV ? REG_W1 : REG_W0;
   733	
   734			if (imm == 1) {
   735				if (BPF_OP(insn->code) == BPF_MOD)
   736					/* lhgi %dst,0 */
   737					EMIT4_IMM(0xa7090000, dst_reg, 0);
   738				break;
   739			}
   740			/* lghi %w0,0 */
   741			EMIT4_IMM(0xa7090000, REG_W0, 0);
   742			/* lgr %w1,%dst */
   743			EMIT4(0xb9040000, REG_W1, dst_reg);
   744			/* dlg %w0,<d(imm)>(%l) */
   745			EMIT6_DISP_LH(0xe3000000, 0x0087, REG_W0, REG_0, REG_L,
   746				      EMIT_CONST_U64(imm));
   747			/* lgr %dst,%rc */
   748			EMIT4(0xb9040000, dst_reg, rc_reg);
   749			break;
   750		}
   751		/*
   752		 * BPF_AND
   753		 */
   754		case BPF_ALU | BPF_AND | BPF_X: /* dst = (u32) dst & (u32) src */
   755			/* nr %dst,%src */
   756			EMIT2(0x1400, dst_reg, src_reg);
   757			EMIT_ZERO(dst_reg);
   758			break;
   759		case BPF_ALU64 | BPF_AND | BPF_X: /* dst = dst & src */
   760			/* ngr %dst,%src */
   761			EMIT4(0xb9800000, dst_reg, src_reg);
   762			break;
   763		case BPF_ALU | BPF_AND | BPF_K: /* dst = (u32) dst & (u32) imm */
   764			/* nilf %dst,imm */
   765			EMIT6_IMM(0xc00b0000, dst_reg, imm);
   766			EMIT_ZERO(dst_reg);
   767			break;
   768		case BPF_ALU64 | BPF_AND | BPF_K: /* dst = dst & imm */
   769			/* ng %dst,<d(imm)>(%l) */
   770			EMIT6_DISP_LH(0xe3000000, 0x0080, dst_reg, REG_0, REG_L,
   771				      EMIT_CONST_U64(imm));
   772			break;
   773		/*
   774		 * BPF_OR
   775		 */
   776		case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
   777			/* or %dst,%src */
   778			EMIT2(0x1600, dst_reg, src_reg);
   779			EMIT_ZERO(dst_reg);
   780			break;
   781		case BPF_ALU64 | BPF_OR | BPF_X: /* dst = dst | src */
   782			/* ogr %dst,%src */
   783			EMIT4(0xb9810000, dst_reg, src_reg);
   784			break;
   785		case BPF_ALU | BPF_OR | BPF_K: /* dst = (u32) dst | (u32) imm */
   786			/* oilf %dst,imm */
   787			EMIT6_IMM(0xc00d0000, dst_reg, imm);
   788			EMIT_ZERO(dst_reg);
   789			break;
   790		case BPF_ALU64 | BPF_OR | BPF_K: /* dst = dst | imm */
   791			/* og %dst,<d(imm)>(%l) */
   792			EMIT6_DISP_LH(0xe3000000, 0x0081, dst_reg, REG_0, REG_L,
   793				      EMIT_CONST_U64(imm));
   794			break;
   795		/*
   796		 * BPF_XOR
   797		 */
   798		case BPF_ALU | BPF_XOR | BPF_X: /* dst = (u32) dst ^ (u32) src */
   799			/* xr %dst,%src */
   800			EMIT2(0x1700, dst_reg, src_reg);
   801			EMIT_ZERO(dst_reg);
   802			break;
   803		case BPF_ALU64 | BPF_XOR | BPF_X: /* dst = dst ^ src */
   804			/* xgr %dst,%src */
   805			EMIT4(0xb9820000, dst_reg, src_reg);
   806			break;
   807		case BPF_ALU | BPF_XOR | BPF_K: /* dst = (u32) dst ^ (u32) imm */
   808			if (imm != 0) {
   809				/* xilf %dst,imm */
   810				EMIT6_IMM(0xc0070000, dst_reg, imm);
   811			}
   812			EMIT_ZERO(dst_reg);
   813			break;
   814		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst = dst ^ imm */
   815			/* xg %dst,<d(imm)>(%l) */
   816			EMIT6_DISP_LH(0xe3000000, 0x0082, dst_reg, REG_0, REG_L,
   817				      EMIT_CONST_U64(imm));
   818			break;
   819		/*
   820		 * BPF_LSH
   821		 */
   822		case BPF_ALU | BPF_LSH | BPF_X: /* dst = (u32) dst << (u32) src */
   823			/* sll %dst,0(%src) */
   824			EMIT4_DISP(0x89000000, dst_reg, src_reg, 0);
   825			EMIT_ZERO(dst_reg);
   826			break;
   827		case BPF_ALU64 | BPF_LSH | BPF_X: /* dst = dst << src */
   828			/* sllg %dst,%dst,0(%src) */
   829			EMIT6_DISP_LH(0xeb000000, 0x000d, dst_reg, dst_reg, src_reg, 0);
   830			break;
   831		case BPF_ALU | BPF_LSH | BPF_K: /* dst = (u32) dst << (u32) imm */
   832			if (imm != 0) {
   833				/* sll %dst,imm(%r0) */
   834				EMIT4_DISP(0x89000000, dst_reg, REG_0, imm);
   835			}
   836			EMIT_ZERO(dst_reg);
   837			break;
   838		case BPF_ALU64 | BPF_LSH | BPF_K: /* dst = dst << imm */
   839			if (imm == 0)
   840				break;
   841			/* sllg %dst,%dst,imm(%r0) */
   842			EMIT6_DISP_LH(0xeb000000, 0x000d, dst_reg, dst_reg, REG_0, imm);
   843			break;
   844		/*
   845		 * BPF_RSH
   846		 */
   847		case BPF_ALU | BPF_RSH | BPF_X: /* dst = (u32) dst >> (u32) src */
   848			/* srl %dst,0(%src) */
   849			EMIT4_DISP(0x88000000, dst_reg, src_reg, 0);
   850			EMIT_ZERO(dst_reg);
   851			break;
   852		case BPF_ALU64 | BPF_RSH | BPF_X: /* dst = dst >> src */
   853			/* srlg %dst,%dst,0(%src) */
   854			EMIT6_DISP_LH(0xeb000000, 0x000c, dst_reg, dst_reg, src_reg, 0);
   855			break;
   856		case BPF_ALU | BPF_RSH | BPF_K: /* dst = (u32) dst >> (u32) imm */
   857			if (imm != 0) {
   858				/* srl %dst,imm(%r0) */
   859				EMIT4_DISP(0x88000000, dst_reg, REG_0, imm);
   860			}
   861			EMIT_ZERO(dst_reg);
   862			break;
   863		case BPF_ALU64 | BPF_RSH | BPF_K: /* dst = dst >> imm */
   864			if (imm == 0)
   865				break;
   866			/* srlg %dst,%dst,imm(%r0) */
   867			EMIT6_DISP_LH(0xeb000000, 0x000c, dst_reg, dst_reg, REG_0, imm);
   868			break;
   869		/*
   870		 * BPF_ARSH
   871		 */
   872		case BPF_ALU64 | BPF_ARSH | BPF_X: /* ((s64) dst) >>= src */
   873			/* srag %dst,%dst,0(%src) */
   874			EMIT6_DISP_LH(0xeb000000, 0x000a, dst_reg, dst_reg, src_reg, 0);
   875			break;
   876		case BPF_ALU64 | BPF_ARSH | BPF_K: /* ((s64) dst) >>= imm */
   877			if (imm == 0)
   878				break;
   879			/* srag %dst,%dst,imm(%r0) */
   880			EMIT6_DISP_LH(0xeb000000, 0x000a, dst_reg, dst_reg, REG_0, imm);
   881			break;
   882		/*
   883		 * BPF_NEG
   884		 */
   885		case BPF_ALU | BPF_NEG: /* dst = (u32) -dst */
   886			/* lcr %dst,%dst */
   887			EMIT2(0x1300, dst_reg, dst_reg);
   888			EMIT_ZERO(dst_reg);
   889			break;
   890		case BPF_ALU64 | BPF_NEG: /* dst = -dst */
   891			/* lcgr %dst,%dst */
   892			EMIT4(0xb9030000, dst_reg, dst_reg);
   893			break;
   894		/*
   895		 * BPF_FROM_BE/LE
   896		 */
   897		case BPF_ALU | BPF_END | BPF_FROM_BE:
   898			/* s390 is big endian, therefore only clear high order bytes */
   899			switch (imm) {
   900			case 16: /* dst = (u16) cpu_to_be16(dst) */
   901				/* llghr %dst,%dst */
   902				EMIT4(0xb9850000, dst_reg, dst_reg);
   903				break;
   904			case 32: /* dst = (u32) cpu_to_be32(dst) */
   905				/* llgfr %dst,%dst */
   906				EMIT4(0xb9160000, dst_reg, dst_reg);
   907				break;
   908			case 64: /* dst = (u64) cpu_to_be64(dst) */
   909				break;
   910			}
   911			break;
   912		case BPF_ALU | BPF_END | BPF_FROM_LE:
   913			switch (imm) {
   914			case 16: /* dst = (u16) cpu_to_le16(dst) */
   915				/* lrvr %dst,%dst */
   916				EMIT4(0xb91f0000, dst_reg, dst_reg);
   917				/* srl %dst,16(%r0) */
   918				EMIT4_DISP(0x88000000, dst_reg, REG_0, 16);
   919				/* llghr %dst,%dst */
   920				EMIT4(0xb9850000, dst_reg, dst_reg);
   921				break;
   922			case 32: /* dst = (u32) cpu_to_le32(dst) */
   923				/* lrvr %dst,%dst */
   924				EMIT4(0xb91f0000, dst_reg, dst_reg);
   925				/* llgfr %dst,%dst */
   926				EMIT4(0xb9160000, dst_reg, dst_reg);
   927				break;
   928			case 64: /* dst = (u64) cpu_to_le64(dst) */
   929				/* lrvgr %dst,%dst */
   930				EMIT4(0xb90f0000, dst_reg, dst_reg);
   931				break;
   932			}
   933			break;
   934		/*
   935		 * BPF_ST(X)
   936		 */
   937		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src_reg */
   938			/* stcy %src,off(%dst) */
   939			EMIT6_DISP_LH(0xe3000000, 0x0072, src_reg, dst_reg, REG_0, off);
   940			jit->seen |= SEEN_MEM;
   941			break;
   942		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
   943			/* sthy %src,off(%dst) */
   944			EMIT6_DISP_LH(0xe3000000, 0x0070, src_reg, dst_reg, REG_0, off);
   945			jit->seen |= SEEN_MEM;
   946			break;
   947		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
   948			/* sty %src,off(%dst) */
   949			EMIT6_DISP_LH(0xe3000000, 0x0050, src_reg, dst_reg, REG_0, off);
   950			jit->seen |= SEEN_MEM;
   951			break;
   952		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
   953			/* stg %src,off(%dst) */
   954			EMIT6_DISP_LH(0xe3000000, 0x0024, src_reg, dst_reg, REG_0, off);
   955			jit->seen |= SEEN_MEM;
   956			break;
   957		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
   958			/* lhi %w0,imm */
   959			EMIT4_IMM(0xa7080000, REG_W0, (u8) imm);
   960			/* stcy %w0,off(dst) */
   961			EMIT6_DISP_LH(0xe3000000, 0x0072, REG_W0, dst_reg, REG_0, off);
   962			jit->seen |= SEEN_MEM;
   963			break;
   964		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
   965			/* lhi %w0,imm */
   966			EMIT4_IMM(0xa7080000, REG_W0, (u16) imm);
   967			/* sthy %w0,off(dst) */
   968			EMIT6_DISP_LH(0xe3000000, 0x0070, REG_W0, dst_reg, REG_0, off);
   969			jit->seen |= SEEN_MEM;
   970			break;
   971		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
   972			/* llilf %w0,imm  */
   973			EMIT6_IMM(0xc00f0000, REG_W0, (u32) imm);
   974			/* sty %w0,off(%dst) */
   975			EMIT6_DISP_LH(0xe3000000, 0x0050, REG_W0, dst_reg, REG_0, off);
   976			jit->seen |= SEEN_MEM;
   977			break;
   978		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
   979			/* lgfi %w0,imm */
   980			EMIT6_IMM(0xc0010000, REG_W0, imm);
   981			/* stg %w0,off(%dst) */
   982			EMIT6_DISP_LH(0xe3000000, 0x0024, REG_W0, dst_reg, REG_0, off);
   983			jit->seen |= SEEN_MEM;
   984			break;
   985		/*
   986		 * BPF_STX XADD (atomic_add)
   987		 */
   988		case BPF_STX | BPF_XADD | BPF_W: /* *(u32 *)(dst + off) += src */
   989			/* laal %w0,%src,off(%dst) */
   990			EMIT6_DISP_LH(0xeb000000, 0x00fa, REG_W0, src_reg,
   991				      dst_reg, off);
   992			jit->seen |= SEEN_MEM;
   993			break;
   994		case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) += src */
   995			/* laalg %w0,%src,off(%dst) */
   996			EMIT6_DISP_LH(0xeb000000, 0x00ea, REG_W0, src_reg,
   997				      dst_reg, off);
   998			jit->seen |= SEEN_MEM;
   999			break;
  1000		/*
  1001		 * BPF_LDX
  1002		 */
  1003		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
  1004			/* llgc %dst,0(off,%src) */
  1005			EMIT6_DISP_LH(0xe3000000, 0x0090, dst_reg, src_reg, REG_0, off);
  1006			jit->seen |= SEEN_MEM;
  1007			break;
  1008		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
  1009			/* llgh %dst,0(off,%src) */
  1010			EMIT6_DISP_LH(0xe3000000, 0x0091, dst_reg, src_reg, REG_0, off);
  1011			jit->seen |= SEEN_MEM;
  1012			break;
  1013		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
  1014			/* llgf %dst,off(%src) */
  1015			jit->seen |= SEEN_MEM;
  1016			EMIT6_DISP_LH(0xe3000000, 0x0016, dst_reg, src_reg, REG_0, off);
  1017			break;
  1018		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
  1019			/* lg %dst,0(off,%src) */
  1020			jit->seen |= SEEN_MEM;
  1021			EMIT6_DISP_LH(0xe3000000, 0x0004, dst_reg, src_reg, REG_0, off);
  1022			break;
  1023		/*
  1024		 * BPF_JMP / CALL
  1025		 */
  1026		case BPF_JMP | BPF_CALL:
  1027		{
  1028			/*
  1029			 * b0 = (__bpf_call_base + imm)(b1, b2, b3, b4, b5)
  1030			 */
  1031			const u64 func = (u64)__bpf_call_base + imm;
  1032	
  1033			REG_SET_SEEN(BPF_REG_5);
  1034			jit->seen |= SEEN_FUNC;
  1035			/* lg %w1,<d(imm)>(%l) */
  1036			EMIT6_DISP_LH(0xe3000000, 0x0004, REG_W1, REG_0, REG_L,
  1037				      EMIT_CONST_U64(func));
  1038			if (IS_ENABLED(CC_USING_EXPOLINE) && !nospec_disable) {
  1039				/* brasl %r14,__s390_indirect_jump_r1 */
  1040				EMIT6_PCREL_RILB(0xc0050000, REG_14, jit->r1_thunk_ip);
  1041			} else {
  1042				/* basr %r14,%w1 */
  1043				EMIT2(0x0d00, REG_14, REG_W1);
  1044			}
  1045			/* lgr %b0,%r2: load return value into %b0 */
  1046			EMIT4(0xb9040000, BPF_REG_0, REG_2);
  1047			if ((jit->seen & SEEN_SKB) &&
  1048			    bpf_helper_changes_pkt_data((void *)func)) {
  1049				/* lg %b1,ST_OFF_SKBP(%r15) */
  1050				EMIT6_DISP_LH(0xe3000000, 0x0004, BPF_REG_1, REG_0,
  1051					      REG_15, STK_OFF_SKBP);
  1052				emit_load_skb_data_hlen(jit);
  1053			}
  1054			break;
  1055		}
  1056		case BPF_JMP | BPF_TAIL_CALL:
  1057			/*
  1058			 * Implicit input:
  1059			 *  B1: pointer to ctx
  1060			 *  B2: pointer to bpf_array
  1061			 *  B3: index in bpf_array
  1062			 */
  1063			jit->seen |= SEEN_TAIL_CALL;
  1064	
  1065			/*
  1066			 * if (index >= array->map.max_entries)
  1067			 *         goto out;
  1068			 */
  1069	
  1070			/* llgf %w1,map.max_entries(%b2) */
  1071			EMIT6_DISP_LH(0xe3000000, 0x0016, REG_W1, REG_0, BPF_REG_2,
  1072				      offsetof(struct bpf_array, map.max_entries));
  1073			/* clrj %b3,%w1,0xa,label0: if (u32)%b3 >= (u32)%w1 goto out */
  1074			EMIT6_PCREL_LABEL(0xec000000, 0x0077, BPF_REG_3,
  1075					  REG_W1, 0, 0xa);
  1076	
  1077			/*
  1078			 * if (tail_call_cnt++ > MAX_TAIL_CALL_CNT)
  1079			 *         goto out;
  1080			 */
  1081	
  1082			if (jit->seen & SEEN_STACK)
  1083				off = STK_OFF_TCCNT + STK_OFF;
  1084			else
  1085				off = STK_OFF_TCCNT;
  1086			/* lhi %w0,1 */
  1087			EMIT4_IMM(0xa7080000, REG_W0, 1);
  1088			/* laal %w1,%w0,off(%r15) */
  1089			EMIT6_DISP_LH(0xeb000000, 0x00fa, REG_W1, REG_W0, REG_15, off);
  1090			/* clij %w1,MAX_TAIL_CALL_CNT,0x2,label0 */
  1091			EMIT6_PCREL_IMM_LABEL(0xec000000, 0x007f, REG_W1,
  1092					      MAX_TAIL_CALL_CNT, 0, 0x2);
  1093	
  1094			/*
  1095			 * prog = array->ptrs[index];
  1096			 * if (prog == NULL)
  1097			 *         goto out;
  1098			 */
  1099	
  1100			/* llgfr %r1,%b3: %r1 = (u32) index */
  1101			EMIT4(0xb9160000, REG_1, BPF_REG_3);
  1102			/* sllg %r1,%r1,3: %r1 *= 8 */
  1103			EMIT6_DISP_LH(0xeb000000, 0x000d, REG_1, REG_1, REG_0, 3);
  1104			/* lg %r1,prog(%b2,%r1) */
  1105			EMIT6_DISP_LH(0xe3000000, 0x0004, REG_1, BPF_REG_2,
  1106				      REG_1, offsetof(struct bpf_array, ptrs));
  1107			/* clgij %r1,0,0x8,label0 */
  1108			EMIT6_PCREL_IMM_LABEL(0xec000000, 0x007d, REG_1, 0, 0, 0x8);
  1109	
  1110			/*
  1111			 * Restore registers before calling function
  1112			 */
  1113			save_restore_regs(jit, REGS_RESTORE);
  1114	
  1115			/*
  1116			 * goto *(prog->bpf_func + tail_call_start);
  1117			 */
  1118	
  1119			/* lg %r1,bpf_func(%r1) */
  1120			EMIT6_DISP_LH(0xe3000000, 0x0004, REG_1, REG_1, REG_0,
  1121				      offsetof(struct bpf_prog, bpf_func));
> 1122			if (nospec_uses_trampoline()) {
  1123				jit->seen |= SEEN_FUNC;
  1124				/* aghi %r1,tail_call_start */
  1125				EMIT4_IMM(0xa70b0000, REG_1, jit->tail_call_start);
  1126				/* brcl 0xf,__s390_indirect_jump_r1 */
> 1127				EMIT6_PCREL_RILC(0xc0040000, 0xf, jit->r1_thunk_ip);
  1128			} else {
  1129				/* bc 0xf,tail_call_start(%r1) */
  1130				_EMIT4(0x47f01000 + jit->tail_call_start);
  1131			}
  1132			/* out: */
  1133			jit->labels[0] = jit->prg;
  1134			break;
  1135		case BPF_JMP | BPF_EXIT: /* return b0 */
  1136			last = (i == fp->len - 1) ? 1 : 0;
  1137			if (last && !(jit->seen & SEEN_RET0))
  1138				break;
  1139			/* j <exit> */
  1140			EMIT4_PCREL(0xa7f40000, jit->exit_ip - jit->prg);
  1141			break;
  1142		/*
  1143		 * Branch relative (number of skipped instructions) to offset on
  1144		 * condition.
  1145		 *
  1146		 * Condition code to mask mapping:
  1147		 *
  1148		 * CC | Description	   | Mask
  1149		 * ------------------------------
  1150		 * 0  | Operands equal	   |	8
  1151		 * 1  | First operand low  |	4
  1152		 * 2  | First operand high |	2
  1153		 * 3  | Unused		   |	1
  1154		 *
  1155		 * For s390x relative branches: ip = ip + off_bytes
  1156		 * For BPF relative branches:	insn = insn + off_insns + 1
  1157		 *
  1158		 * For example for s390x with offset 0 we jump to the branch
  1159		 * instruction itself (loop) and for BPF with offset 0 we
  1160		 * branch to the instruction behind the branch.
  1161		 */
  1162		case BPF_JMP | BPF_JA: /* if (true) */
  1163			mask = 0xf000; /* j */
  1164			goto branch_oc;
  1165		case BPF_JMP | BPF_JSGT | BPF_K: /* ((s64) dst > (s64) imm) */
  1166			mask = 0x2000; /* jh */
  1167			goto branch_ks;
  1168		case BPF_JMP | BPF_JSLT | BPF_K: /* ((s64) dst < (s64) imm) */
  1169			mask = 0x4000; /* jl */
  1170			goto branch_ks;
  1171		case BPF_JMP | BPF_JSGE | BPF_K: /* ((s64) dst >= (s64) imm) */
  1172			mask = 0xa000; /* jhe */
  1173			goto branch_ks;
  1174		case BPF_JMP | BPF_JSLE | BPF_K: /* ((s64) dst <= (s64) imm) */
  1175			mask = 0xc000; /* jle */
  1176			goto branch_ks;
  1177		case BPF_JMP | BPF_JGT | BPF_K: /* (dst_reg > imm) */
  1178			mask = 0x2000; /* jh */
  1179			goto branch_ku;
  1180		case BPF_JMP | BPF_JLT | BPF_K: /* (dst_reg < imm) */
  1181			mask = 0x4000; /* jl */
  1182			goto branch_ku;
  1183		case BPF_JMP | BPF_JGE | BPF_K: /* (dst_reg >= imm) */
  1184			mask = 0xa000; /* jhe */
  1185			goto branch_ku;
  1186		case BPF_JMP | BPF_JLE | BPF_K: /* (dst_reg <= imm) */
  1187			mask = 0xc000; /* jle */
  1188			goto branch_ku;
  1189		case BPF_JMP | BPF_JNE | BPF_K: /* (dst_reg != imm) */
  1190			mask = 0x7000; /* jne */
  1191			goto branch_ku;
  1192		case BPF_JMP | BPF_JEQ | BPF_K: /* (dst_reg == imm) */
  1193			mask = 0x8000; /* je */
  1194			goto branch_ku;
  1195		case BPF_JMP | BPF_JSET | BPF_K: /* (dst_reg & imm) */
  1196			mask = 0x7000; /* jnz */
  1197			/* lgfi %w1,imm (load sign extend imm) */
  1198			EMIT6_IMM(0xc0010000, REG_W1, imm);
  1199			/* ngr %w1,%dst */
  1200			EMIT4(0xb9800000, REG_W1, dst_reg);
  1201			goto branch_oc;
  1202	
  1203		case BPF_JMP | BPF_JSGT | BPF_X: /* ((s64) dst > (s64) src) */
  1204			mask = 0x2000; /* jh */
  1205			goto branch_xs;
  1206		case BPF_JMP | BPF_JSLT | BPF_X: /* ((s64) dst < (s64) src) */
  1207			mask = 0x4000; /* jl */
  1208			goto branch_xs;
  1209		case BPF_JMP | BPF_JSGE | BPF_X: /* ((s64) dst >= (s64) src) */
  1210			mask = 0xa000; /* jhe */
  1211			goto branch_xs;
  1212		case BPF_JMP | BPF_JSLE | BPF_X: /* ((s64) dst <= (s64) src) */
  1213			mask = 0xc000; /* jle */
  1214			goto branch_xs;
  1215		case BPF_JMP | BPF_JGT | BPF_X: /* (dst > src) */
  1216			mask = 0x2000; /* jh */
  1217			goto branch_xu;
  1218		case BPF_JMP | BPF_JLT | BPF_X: /* (dst < src) */
  1219			mask = 0x4000; /* jl */
  1220			goto branch_xu;
  1221		case BPF_JMP | BPF_JGE | BPF_X: /* (dst >= src) */
  1222			mask = 0xa000; /* jhe */
  1223			goto branch_xu;
  1224		case BPF_JMP | BPF_JLE | BPF_X: /* (dst <= src) */
  1225			mask = 0xc000; /* jle */
  1226			goto branch_xu;
  1227		case BPF_JMP | BPF_JNE | BPF_X: /* (dst != src) */
  1228			mask = 0x7000; /* jne */
  1229			goto branch_xu;
  1230		case BPF_JMP | BPF_JEQ | BPF_X: /* (dst == src) */
  1231			mask = 0x8000; /* je */
  1232			goto branch_xu;
  1233		case BPF_JMP | BPF_JSET | BPF_X: /* (dst & src) */
  1234			mask = 0x7000; /* jnz */
  1235			/* ngrk %w1,%dst,%src */
  1236			EMIT4_RRF(0xb9e40000, REG_W1, dst_reg, src_reg);
  1237			goto branch_oc;
  1238	branch_ks:
  1239			/* lgfi %w1,imm (load sign extend imm) */
  1240			EMIT6_IMM(0xc0010000, REG_W1, imm);
  1241			/* cgrj %dst,%w1,mask,off */
  1242			EMIT6_PCREL(0xec000000, 0x0064, dst_reg, REG_W1, i, off, mask);
  1243			break;
  1244	branch_ku:
  1245			/* lgfi %w1,imm (load sign extend imm) */
  1246			EMIT6_IMM(0xc0010000, REG_W1, imm);
  1247			/* clgrj %dst,%w1,mask,off */
  1248			EMIT6_PCREL(0xec000000, 0x0065, dst_reg, REG_W1, i, off, mask);
  1249			break;
  1250	branch_xs:
  1251			/* cgrj %dst,%src,mask,off */
  1252			EMIT6_PCREL(0xec000000, 0x0064, dst_reg, src_reg, i, off, mask);
  1253			break;
  1254	branch_xu:
  1255			/* clgrj %dst,%src,mask,off */
  1256			EMIT6_PCREL(0xec000000, 0x0065, dst_reg, src_reg, i, off, mask);
  1257			break;
  1258	branch_oc:
  1259			/* brc mask,jmp_off (branch instruction needs 4 bytes) */
  1260			jmp_off = addrs[i + off + 1] - (addrs[i + 1] - 4);
  1261			EMIT4_PCREL(0xa7040000 | mask << 8, jmp_off);
  1262			break;
  1263		/*
  1264		 * BPF_LD
  1265		 */
  1266		case BPF_LD | BPF_ABS | BPF_B: /* b0 = *(u8 *) (skb->data+imm) */
  1267		case BPF_LD | BPF_IND | BPF_B: /* b0 = *(u8 *) (skb->data+imm+src) */
  1268			if ((BPF_MODE(insn->code) == BPF_ABS) && (imm >= 0))
  1269				func_addr = __pa(sk_load_byte_pos);
  1270			else
  1271				func_addr = __pa(sk_load_byte);
  1272			goto call_fn;
  1273		case BPF_LD | BPF_ABS | BPF_H: /* b0 = *(u16 *) (skb->data+imm) */
  1274		case BPF_LD | BPF_IND | BPF_H: /* b0 = *(u16 *) (skb->data+imm+src) */
  1275			if ((BPF_MODE(insn->code) == BPF_ABS) && (imm >= 0))
  1276				func_addr = __pa(sk_load_half_pos);
  1277			else
  1278				func_addr = __pa(sk_load_half);
  1279			goto call_fn;
  1280		case BPF_LD | BPF_ABS | BPF_W: /* b0 = *(u32 *) (skb->data+imm) */
  1281		case BPF_LD | BPF_IND | BPF_W: /* b0 = *(u32 *) (skb->data+imm+src) */
  1282			if ((BPF_MODE(insn->code) == BPF_ABS) && (imm >= 0))
  1283				func_addr = __pa(sk_load_word_pos);
  1284			else
  1285				func_addr = __pa(sk_load_word);
  1286			goto call_fn;
  1287	call_fn:
  1288			jit->seen |= SEEN_SKB | SEEN_RET0 | SEEN_FUNC;
  1289			REG_SET_SEEN(REG_14); /* Return address of possible func call */
  1290	
  1291			/*
  1292			 * Implicit input:
  1293			 *  BPF_REG_6	 (R7) : skb pointer
  1294			 *  REG_SKB_DATA (R12): skb data pointer (if no BPF_REG_AX)
  1295			 *
  1296			 * Calculated input:
  1297			 *  BPF_REG_2	 (R3) : offset of byte(s) to fetch in skb
  1298			 *  BPF_REG_5	 (R6) : return address
  1299			 *
  1300			 * Output:
  1301			 *  BPF_REG_0	 (R14): data read from skb
  1302			 *
  1303			 * Scratch registers (BPF_REG_1-5)
  1304			 */
  1305	
  1306			/* Call function: llilf %w1,func_addr  */
  1307			EMIT6_IMM(0xc00f0000, REG_W1, func_addr);
  1308	
  1309			/* Offset: lgfi %b2,imm */
  1310			EMIT6_IMM(0xc0010000, BPF_REG_2, imm);
  1311			if (BPF_MODE(insn->code) == BPF_IND)
  1312				/* agfr %b2,%src (%src is s32 here) */
  1313				EMIT4(0xb9180000, BPF_REG_2, src_reg);
  1314	
  1315			/* Reload REG_SKB_DATA if BPF_REG_AX is used */
  1316			if (jit->seen & SEEN_REG_AX)
  1317				/* lg %skb_data,data_off(%b6) */
  1318				EMIT6_DISP_LH(0xe3000000, 0x0004, REG_SKB_DATA, REG_0,
  1319					      BPF_REG_6, offsetof(struct sk_buff, data));
  1320			/* basr %b5,%w1 (%b5 is call saved) */
  1321			EMIT2(0x0d00, BPF_REG_5, REG_W1);
  1322	
  1323			/*
  1324			 * Note: For fast access we jump directly after the
  1325			 * jnz instruction from bpf_jit.S
  1326			 */
  1327			/* jnz <ret0> */
  1328			EMIT4_PCREL(0xa7740000, jit->ret0_ip - jit->prg);
  1329			break;
  1330		default: /* too complex, give up */
  1331			pr_err("Unknown opcode %02x\n", insn->code);
  1332			return -1;
  1333		}
  1334		return insn_count;
  1335	}
  1336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
