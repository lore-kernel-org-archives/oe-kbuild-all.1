Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331905394
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687616047; x=1719152047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JTUIWbueFKDAMm5iqqpTt3Fmd0nOIgMfJfGaJ8uoPxA=;
  b=dtxks2VT9+w7v687hjuFK6RVBD5wP/EU/xLq3qqap4yYS4N2uXu77dvu
   RA/mnoid9qyFnJJya4EYtLI7cOhm6N/tFrvksWt7KtxgbtFRSvisNAS+O
   nR3ywPYusVkAAFkb4AurKKIhJYhj225/7Eu6pPNFJFbr4AwWEbKZccIVZ
   u8gIE7G5nq93aseWLcaqjBABFePymmkU1RevrdGleO8KPNZb7hieZrCIH
   oiI9lElbcVPBz8Soj2lzGWFKlOPX41qrya/cBRIrRJ9r1O5nc5nnYN0t7
   qvU00w7eNcLn7IiyK0iPX8kpSe2BZVLwdV/XgAdLkxIhsr073vaeL+b/B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="364392324"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="364392324"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 07:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045951915"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="1045951915"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2023 07:14:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD41c-00096v-0s;
	Sat, 24 Jun 2023 14:14:04 +0000
Date: Sat, 24 Jun 2023 22:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] riscv: add floating point insn support to
 misaligned access emulation
Message-ID: <202306242203.FD8sVg6n-lkp@intel.com>
References: <20230624122049.7886-7-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230624122049.7886-7-cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc7]
[cannot apply to openrisc/for-next next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-remove-unused-functions-in-traps_misaligned-c/20230624-202152
base:   linus/master
patch link:    https://lore.kernel.org/r/20230624122049.7886-7-cleger%40rivosinc.com
patch subject: [RFC PATCH 6/6] riscv: add floating point insn support to misaligned access emulation
config: riscv-randconfig-r013-20230624 (https://download.01.org/0day-ci/archive/20230624/202306242203.FD8sVg6n-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306242203.FD8sVg6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306242203.FD8sVg6n-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c:353:5: warning: no previous prototype for 'handle_misaligned_load' [-Wmissing-prototypes]
     353 | int handle_misaligned_load(struct pt_regs *regs)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/traps_misaligned.c: In function 'handle_misaligned_load':
>> arch/riscv/kernel/traps_misaligned.c:449:17: error: implicit declaration of function 'set_f64_rd'; did you mean 'set_p4d'? [-Werror=implicit-function-declaration]
     449 |                 set_f64_rd(insn, regs, val.data_u64);
         |                 ^~~~~~~~~~
         |                 set_p4d
>> arch/riscv/kernel/traps_misaligned.c:451:17: error: implicit declaration of function 'set_f32_rd' [-Werror=implicit-function-declaration]
     451 |                 set_f32_rd(insn, regs, val.data_ulong);
         |                 ^~~~~~~~~~
   arch/riscv/kernel/traps_misaligned.c: At top level:
   arch/riscv/kernel/traps_misaligned.c:458:5: warning: no previous prototype for 'handle_misaligned_store' [-Wmissing-prototypes]
     458 | int handle_misaligned_store(struct pt_regs *regs)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/traps_misaligned.c: In function 'handle_misaligned_store':
>> arch/riscv/kernel/traps_misaligned.c:493:32: error: implicit declaration of function 'GET_F64_RS2'; did you mean 'GET_RS2'? [-Werror=implicit-function-declaration]
     493 |                 val.data_u64 = GET_F64_RS2(insn, regs);
         |                                ^~~~~~~~~~~
         |                                GET_RS2
>> arch/riscv/kernel/traps_misaligned.c:497:34: error: implicit declaration of function 'GET_F32_RS2'; did you mean 'GET_RS2'? [-Werror=implicit-function-declaration]
     497 |                 val.data_ulong = GET_F32_RS2(insn, regs);
         |                                  ^~~~~~~~~~~
         |                                  GET_RS2
>> arch/riscv/kernel/traps_misaligned.c:519:32: error: implicit declaration of function 'GET_F64_RS2S'; did you mean 'GET_RS2S'? [-Werror=implicit-function-declaration]
     519 |                 val.data_u64 = GET_F64_RS2S(insn, regs);
         |                                ^~~~~~~~~~~~
         |                                GET_RS2S
>> arch/riscv/kernel/traps_misaligned.c:523:32: error: implicit declaration of function 'GET_F64_RS2C'; did you mean 'GET_RS2C'? [-Werror=implicit-function-declaration]
     523 |                 val.data_u64 = GET_F64_RS2C(insn, regs);
         |                                ^~~~~~~~~~~~
         |                                GET_RS2C
   cc1: some warnings being treated as errors


vim +449 arch/riscv/kernel/traps_misaligned.c

   352	
   353	int handle_misaligned_load(struct pt_regs *regs)
   354	{
   355		union reg_data val;
   356		unsigned long epc = regs->epc;
   357		unsigned long insn;
   358		unsigned long addr;
   359		int i, fp = 0, shift = 0, len = 0;
   360	
   361		/*
   362		 * When running in supervisor mode, we only handle misaligned accesses
   363		 * triggered from user mode.
   364		 */
   365		if (!IS_ENABLED(CONFIG_RISCV_M_MODE) && !user_mode(regs))
   366			return -1;
   367	
   368		if ((current->thread.align_ctl & PR_UNALIGN_SIGBUS))
   369			return -1;
   370	
   371		if (get_insn(epc, &insn))
   372			return -1;
   373	
   374		addr = csr_read(CSR_TVAL);
   375		regs->epc = 0;
   376	
   377		if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
   378			len = 4;
   379			shift = 8 * (sizeof(unsigned long) - len);
   380	#if defined(CONFIG_64BIT)
   381		} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
   382			len = 8;
   383			shift = 8 * (sizeof(unsigned long) - len);
   384		} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
   385			len = 4;
   386	#endif
   387		} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
   388			fp = 1;
   389			len = 8;
   390		} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
   391			fp = 1;
   392			len = 4;
   393		} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
   394			len = 2;
   395			shift = 8 * (sizeof(unsigned long) - len);
   396		} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
   397			len = 2;
   398	#if defined(CONFIG_64BIT)
   399		} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
   400			len = 8;
   401			shift = 8 * (sizeof(unsigned long) - len);
   402			insn = RVC_RS2S(insn) << SH_RD;
   403		} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
   404			   ((insn >> SH_RD) & 0x1f)) {
   405			len = 8;
   406			shift = 8 * (sizeof(unsigned long) - len);
   407	#endif
   408		} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
   409			len = 4;
   410			shift = 8 * (sizeof(unsigned long) - len);
   411			insn = RVC_RS2S(insn) << SH_RD;
   412		} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
   413			   ((insn >> SH_RD) & 0x1f)) {
   414			len = 4;
   415			shift = 8 * (sizeof(unsigned long) - len);
   416		} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
   417			fp = 1;
   418			len = 8;
   419			insn = RVC_RS2S(insn) << SH_RD;
   420		} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
   421			fp = 1;
   422			len = 8;
   423	#if defined(CONFIG_32BIT)
   424		} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
   425			fp = 1;
   426			len = 4;
   427			insn = RVC_RS2S(insn) << SH_RD;
   428		} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
   429			fp = 1;
   430			len = 4;
   431	#endif
   432		} else {
   433			regs->epc = epc;
   434			return -1;
   435		}
   436	
   437		if (!IS_ENABLED(CONFIG_FPU) && fp)
   438			return -1;
   439	
   440		val.data_u64 = 0;
   441		for (i = 0; i < len; i++) {
   442			if (load_u8((void *)(addr + i), &val.data_bytes[i]))
   443				return -1;
   444		}
   445	
   446		if (!fp)
   447			SET_RD(insn, regs, val.data_ulong << shift >> shift);
   448		else if (len == 8)
 > 449			set_f64_rd(insn, regs, val.data_u64);
   450		else
 > 451			set_f32_rd(insn, regs, val.data_ulong);
   452	
   453		regs->epc = epc + INSN_LEN(insn);
   454	
   455		return 0;
   456	}
   457	
   458	int handle_misaligned_store(struct pt_regs *regs)
   459	{
   460		union reg_data val;
   461		unsigned long epc = regs->epc;
   462		unsigned long insn;
   463		unsigned long addr;
   464		int i, len = 0, fp = 0;
   465	
   466		/*
   467		 * When running in supervisor mode, we only handle misaligned accesses
   468		 * triggered from user mode.
   469		 */
   470		if (!IS_ENABLED(CONFIG_RISCV_M_MODE) && !user_mode(regs))
   471			return -1;
   472	
   473		if ((current->thread.align_ctl & PR_UNALIGN_SIGBUS))
   474			return -1;
   475	
   476		if (get_insn(epc, &insn))
   477			return -1;
   478	
   479		addr = csr_read(CSR_TVAL);
   480		regs->epc = 0;
   481	
   482		val.data_ulong = GET_RS2(insn, regs);
   483	
   484		if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
   485			len = 4;
   486	#if defined(CONFIG_64BIT)
   487		} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
   488			len = 8;
   489	#endif
   490		} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
   491			fp = 1;
   492			len = 8;
 > 493			val.data_u64 = GET_F64_RS2(insn, regs);
   494		} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
   495			fp = 1;
   496			len = 4;
 > 497			val.data_ulong = GET_F32_RS2(insn, regs);
   498		} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
   499			len = 2;
   500	#if defined(CONFIG_64BIT)
   501		} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
   502			len = 8;
   503			val.data_ulong = GET_RS2S(insn, regs);
   504		} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
   505			   ((insn >> SH_RD) & 0x1f)) {
   506			len = 8;
   507			val.data_ulong = GET_RS2C(insn, regs);
   508	#endif
   509		} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
   510			len = 4;
   511			val.data_ulong = GET_RS2S(insn, regs);
   512		} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
   513			   ((insn >> SH_RD) & 0x1f)) {
   514			len = 4;
   515			val.data_ulong = GET_RS2C(insn, regs);
   516		} else if ((insn & INSN_MASK_C_FSD) == INSN_MATCH_C_FSD) {
   517			fp = 1;
   518			len = 8;
 > 519			val.data_u64 = GET_F64_RS2S(insn, regs);
   520		} else if ((insn & INSN_MASK_C_FSDSP) == INSN_MATCH_C_FSDSP) {
   521			fp = 1;
   522			len = 8;
 > 523			val.data_u64 = GET_F64_RS2C(insn, regs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
