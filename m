Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294756B74
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520600; cv=none; b=qEfKOOAzzhMyYKnHPmHBcfG0dPIhcil6+7kjDMF+ekc+ne2Xo26fOhgP8C+UrENxJgTSuz4pweVsbk4cHrYTdGgSjQtaa7HPH7Jzy8avfzAfHOLhJHovAiU12zJlsnXzJIuJmq0UILI2m2LJamxnJ/WkEWlIgirtgFua0cbPTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520600; c=relaxed/simple;
	bh=5JOI5Hdh+FuDUGa1FXx+YB1cVjIUPnDyx9QgmcUVxAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTf+OXEkLkAgvCas8VfVaCoVx2oUZoshhVRS0LQz7w0NtgDZkkv+hg4FUfcWtIsYDHpap2dMIFltnCq0LNPY15a88r0qf0H/qm+SslVa2SaHe6Jxofz1EfDspmbF/2ILueihnv6xLQb4ZikZ9ePjSrJZ4st3E1+3kc1MxVNiavw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+JEvpII; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+JEvpII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708520599; x=1740056599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JOI5Hdh+FuDUGa1FXx+YB1cVjIUPnDyx9QgmcUVxAQ=;
  b=b+JEvpIInzmjbWFNdh/U0C6ABl1H9UtdfFGkbyUmSLKXvu705Vcka7HY
   By0LptBNxa4jzmUh9JkViw+swFLpGwIsPNV0K8b7mRVqeKxu7CHfjyZUd
   tEedUM9bWinI+MPXuxIF+qkGNBKpLbnVF9i1g49IF2VQCUZ+FVzvC4DkT
   0VUnQn3EptFOCl4G9OkxE47vTO/Y3H/ebuZrtGdOxRUBjpQ/lCiMGaLSG
   OBKNdQgCSNtXrkwWePtCbD0j3Yjai0DdUyr4p90Yka7rLbYdit9u4Wgct
   Yk8RsMdfdU5wAebIXY/Ac7rEl+Duci1u4CSmJew0GdIuLm6iQC9utTEam
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5631957"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5631957"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5103365"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2024 05:03:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcmFh-0005Kg-38;
	Wed, 21 Feb 2024 13:03:09 +0000
Date: Wed, 21 Feb 2024 21:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/kernel/module.c:256:5: warning: no previous prototype for
 'static_relocate'
Message-ID: <202402212023.nQCsgfJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 11 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240221/202402212023.nQCsgfJM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212023.nQCsgfJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212023.nQCsgfJM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/module.c:256:5: warning: no previous prototype for 'static_relocate' [-Wmissing-prototypes]
     256 | int static_relocate(struct module *me, int type, void *loc,
         |     ^~~~~~~~~~~~~~~
   arch/arm64/kernel/module.c: In function 'static_relocate':
   arch/arm64/kernel/module.c:378:53: error: 'struct module' has no member named 'kpatch_info'
     378 |                         ovf = reloc_insn_adrp(me, me->kpatch_info->sechdrs, loc, val);
         |                                                     ^~
   arch/arm64/kernel/module.c:423:74: error: 'struct module' has no member named 'kpatch_info'
     423 |                                 val = module_emit_plt_entry_kpatch(me, me->kpatch_info->sechdrs, loc, val);
         |                                                                          ^~


vim +/static_relocate +256 arch/arm64/kernel/module.c

   255	
 > 256	int static_relocate(struct module *me, int type, void *loc,
   257			    unsigned long val)
   258	{
   259		int ovf = 0;
   260		bool overflow_check = true;
   261		/* Perform the static relocation. */
   262		switch (type) {
   263			/* Null relocations. */
   264			case R_ARM_NONE:
   265			case R_AARCH64_NONE:
   266				ovf = 0;
   267				break;
   268	
   269			/* Data relocations. */
   270			case R_AARCH64_ABS64:
   271				overflow_check = false;
   272				ovf = reloc_data(RELOC_OP_ABS, loc, val, 64);
   273				break;
   274			case R_AARCH64_ABS32:
   275				ovf = reloc_data(RELOC_OP_ABS, loc, val, 32);
   276				break;
   277			case R_AARCH64_ABS16:
   278				ovf = reloc_data(RELOC_OP_ABS, loc, val, 16);
   279				break;
   280			case R_AARCH64_PREL64:
   281				overflow_check = false;
   282				ovf = reloc_data(RELOC_OP_PREL, loc, val, 64);
   283				break;
   284			case R_AARCH64_PREL32:
   285				ovf = reloc_data(RELOC_OP_PREL, loc, val, 32);
   286				break;
   287			case R_AARCH64_PREL16:
   288				ovf = reloc_data(RELOC_OP_PREL, loc, val, 16);
   289				break;
   290	
   291			/* MOVW instruction relocations. */
   292			case R_AARCH64_MOVW_UABS_G0_NC:
   293				overflow_check = false;
   294				/* Fall through */
   295			case R_AARCH64_MOVW_UABS_G0:
   296				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
   297						      AARCH64_INSN_IMM_MOVKZ);
   298				break;
   299			case R_AARCH64_MOVW_UABS_G1_NC:
   300				overflow_check = false;
   301				/* Fall through */
   302			case R_AARCH64_MOVW_UABS_G1:
   303				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
   304						      AARCH64_INSN_IMM_MOVKZ);
   305				break;
   306			case R_AARCH64_MOVW_UABS_G2_NC:
   307				overflow_check = false;
   308				/* Fall through */
   309			case R_AARCH64_MOVW_UABS_G2:
   310				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
   311						      AARCH64_INSN_IMM_MOVKZ);
   312				break;
   313			case R_AARCH64_MOVW_UABS_G3:
   314				/* We're using the top bits so we can't overflow. */
   315				overflow_check = false;
   316				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 48,
   317						      AARCH64_INSN_IMM_MOVKZ);
   318				break;
   319			case R_AARCH64_MOVW_SABS_G0:
   320				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
   321						      AARCH64_INSN_IMM_MOVNZ);
   322				break;
   323			case R_AARCH64_MOVW_SABS_G1:
   324				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
   325						      AARCH64_INSN_IMM_MOVNZ);
   326				break;
   327			case R_AARCH64_MOVW_SABS_G2:
   328				ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
   329						      AARCH64_INSN_IMM_MOVNZ);
   330				break;
   331			case R_AARCH64_MOVW_PREL_G0_NC:
   332				overflow_check = false;
   333				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
   334						      AARCH64_INSN_IMM_MOVKZ);
   335				break;
   336			case R_AARCH64_MOVW_PREL_G0:
   337				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
   338						      AARCH64_INSN_IMM_MOVNZ);
   339				break;
   340			case R_AARCH64_MOVW_PREL_G1_NC:
   341				overflow_check = false;
   342				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
   343						      AARCH64_INSN_IMM_MOVKZ);
   344				break;
   345			case R_AARCH64_MOVW_PREL_G1:
   346				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
   347						      AARCH64_INSN_IMM_MOVNZ);
   348				break;
   349			case R_AARCH64_MOVW_PREL_G2_NC:
   350				overflow_check = false;
   351				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
   352						      AARCH64_INSN_IMM_MOVKZ);
   353				break;
   354			case R_AARCH64_MOVW_PREL_G2:
   355				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
   356						      AARCH64_INSN_IMM_MOVNZ);
   357				break;
   358			case R_AARCH64_MOVW_PREL_G3:
   359				/* We're using the top bits so we can't overflow. */
   360				overflow_check = false;
   361				ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 48,
   362						      AARCH64_INSN_IMM_MOVNZ);
   363				break;
   364	
   365			/* Immediate instruction relocations. */
   366			case R_AARCH64_LD_PREL_LO19:
   367				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
   368						     AARCH64_INSN_IMM_19);
   369				break;
   370			case R_AARCH64_ADR_PREL_LO21:
   371				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
   372						     AARCH64_INSN_IMM_ADR);
   373				break;
   374			case R_AARCH64_ADR_PREL_PG_HI21_NC:
   375				overflow_check = false;
   376				/* Fall through */
   377	                case R_AARCH64_ADR_PREL_PG_HI21:
   378	                        ovf = reloc_insn_adrp(me, me->kpatch_info->sechdrs, loc, val);
   379	                        if (ovf && ovf != -ERANGE)
   380	                                return ovf;
   381	                        break;
   382			case R_AARCH64_ADD_ABS_LO12_NC:
   383			case R_AARCH64_LDST8_ABS_LO12_NC:
   384				overflow_check = false;
   385				ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 0, 12,
   386						     AARCH64_INSN_IMM_12);
   387				break;
   388			case R_AARCH64_LDST16_ABS_LO12_NC:
   389				overflow_check = false;
   390				ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 1, 11,
   391						     AARCH64_INSN_IMM_12);
   392				break;
   393			case R_AARCH64_LDST32_ABS_LO12_NC:
   394				overflow_check = false;
   395				ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 2, 10,
   396						     AARCH64_INSN_IMM_12);
   397				break;
   398			case R_AARCH64_LDST64_ABS_LO12_NC:
   399				overflow_check = false;
   400				ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 3, 9,
   401						     AARCH64_INSN_IMM_12);
   402				break;
   403			case R_AARCH64_LDST128_ABS_LO12_NC:
   404				overflow_check = false;
   405				ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 4, 8,
   406						     AARCH64_INSN_IMM_12);
   407				break;
   408			case R_AARCH64_TSTBR14:
   409				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 14,
   410						     AARCH64_INSN_IMM_14);
   411				break;
   412			case R_AARCH64_CONDBR19:
   413				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
   414						     AARCH64_INSN_IMM_19);
   415				break;
   416			case R_AARCH64_JUMP26:
   417			case R_AARCH64_CALL26:
   418				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
   419						     AARCH64_INSN_IMM_26);
   420	
   421				if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
   422				    ovf == -ERANGE) {
   423					val = module_emit_plt_entry_kpatch(me, me->kpatch_info->sechdrs, loc, val);
   424					if (!val)
   425						return -ENOEXEC;
   426					ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
   427							     26, AARCH64_INSN_IMM_26);
   428				}
   429				break;
   430	
   431			default:
   432				pr_err("module %s: unsupported RELA relocation: %d\n",
   433					me->name, type);
   434				return -ENOEXEC;
   435		}
   436	
   437		if (overflow_check && ovf == -ERANGE) {
   438			pr_err("module %s: overflow in relocation type %d val %lx\n",
   439				me->name, type, val);
   440			return -ENOEXEC;
   441		}
   442	
   443		return 0;
   444	}
   445	EXPORT_SYMBOL_GPL(static_relocate);
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
