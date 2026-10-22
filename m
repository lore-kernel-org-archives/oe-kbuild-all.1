Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699014;
	b=jmxx0HnswSMalEBrcpKfNErgkQWTX6yhMC5F7vxRYMAvN2V2h89hucCWZfn2JI8D5seR
	 es5w/fbfQZiBKgjyNmuXseHE2yse7KozFCJFR06T21vsKd/8J+Q+eELh50McUP8b4LQC4
	 QlbTmo7Wo16uQ5fIQuGZ8XM2clnIwnPIPfusDUvRE55xZexguSKEOke/sAuT4ECvb5Vmp
	 dg2X0kTS89eBESvGU3+xosmxjTQO4QAchGfhXcf6n82xeJDqhN4HoUSF+TEG9HtRYBD4g
	 bttKlo9rosOXfi1CPRII62N3lv05k7faoLQMpuCWzaNkesJaBkig454jFkC5plnnb9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699014;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qiJeYnQWyTxtNsxD1Z1hSjdZMCeCpJalgUKFhflUOAg=;
	b=v6x8sOsBCBbJ9qFTA/Ck7oswaSHSF9ZSSRm281rvOzLZejGafQwJIE3LXytbDdVKtTP9
	 EfhyZjvgvF0YlInObV99ctXiHrzOsMA9dFziknPR3dIPEHIEI4hszojWi1B6Yf5N6Fy+V
	 hSxnCc7+InlrA36Tzy0SRwSY8y3ap6Mvq7jX+gCq0XW9dO2LZgvTkCVys4seP6SM6Gnch
	 ym25t0yzE0AO8vVVWtIz1DLjk2Xa4psavj+v6L1CcUAEUHvN0nLbCLx49ODV2fxZgvGDZ
	 piW+wFa4+SwcJv/326k1/qPyYwhG0y3vzSYreZSy6zWQa1SoLu/X0O79d9sSWaKE02A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ixpRtZjV;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E1606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 19:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ixpRtZjV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792699013; x=1824235013;
  h=date:from:to:cc:subject:message-id;
  bh=hayzcoVWuKvJ443/Rtq5isab19R4zOw2asw+hKHhb2U=;
  b=ixpRtZjVJMPMxBeCDhuh0rx7Iqa7bYk/KBvO6jBHd8ErwFT+5idXauPF
   xPQ9HMg+/krSrFDl12baol4qyiWdte8SMb38ughTF4da/44pj3jPMxgeV
   3jkTHh4q4cEwWs8EXbg9da96sshigeK6AW6lcmpeRT5aD+a+Im96RSQi7
   HSj1lSyCP7VeY7WQpcFPk3pbWv3+jJLCojC4z2lWbNsvxYZuM7T013yKa
   +L5dYBlovQp9kpSpvUE65wC5NbN/8dO/F5bzNdyeEtjLtdgyIa2VW7L+Q
   QnoPclc2Cue+3ugvmFrp3ufEcsFVQjNVFpBRQ1zdkWsUJ5Wr3o/mlIjAy
   Q==;
X-CSE-ConnectionGUID: GjZPia3sSJaMwrrEUlju7w==
X-CSE-MsgGUID: RFd3P2pbQrWyUibejcQ0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1477759"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1477759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 12:56:52 -0700
X-CSE-ConnectionGUID: CF1t66c0RhSLFZ1I9fco2Q==
X-CSE-MsgGUID: TugKI6gMTgmywEhan8fs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3842485"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 12:56:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJyu7-00000000RbG-2wv3;
	Thu, 22 Oct 2026 19:56:47 +0000
Date: Fri, 23 Oct 2026 03:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Magnus Lindholm <linmag7@gmail.com>
Subject: [mattst88-alpha:alpha-fp-tininess 1/1]
 include/math-emu/op-common.h:145:26: warning: variable
 '_FP_PACK_CANONICAL_T_e' set but not used
Message-ID: <202610230317.hE0gkSpO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-fp-tininess
head:   b74843b38da8f1186fd7d447646c835b47096a15
commit: b74843b38da8f1186fd7d447646c835b47096a15 [1/1] alpha: determine tininess after rounding in the FP emulation
config: sh-randconfig-1000-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230317.hE0gkSpO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230317.hE0gkSpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230317.hE0gkSpO-lkp@intel.com/

All warnings (new ones prefixed by >>):

      83 |         if (CMP(CMP) > 0)
         |             ^~~
   include/math-emu/soft-fp.h:102:24: warning: variable '_fex' set but not used [-Wunused-but-set-variable=]
     102 | #define FP_DECL_EX int _fex = 0
         |                        ^~~~
   arch/sh/math-emu/math.c:68:9: note: in expansion of macro 'FP_DECL_EX'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |         ^~~~~~~~~~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:83:13: note: in expansion of macro 'CMP'
      83 |         if (CMP(CMP) > 0)
         |             ^~~
   arch/sh/math-emu/math.c: In function 'fcmp_eq':
   arch/sh/math-emu/math.c:71:40: warning: variable 'Fn_c' set but not used [-Wunused-but-set-variable=]
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                                        ^~
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/sh/math-emu/math.c:71:27: note: in expansion of macro 'FP_DECL_D'
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                           ^~~~~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'CMP_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:94:13: note: in expansion of macro 'CMP'
      94 |         if (CMP(CMP /*EQ*/) == 0)
         |             ^~~
   arch/sh/math-emu/math.c:71:22: warning: variable 'Fm_c' set but not used [-Wunused-but-set-variable=]
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                      ^~
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/sh/math-emu/math.c:71:9: note: in expansion of macro 'FP_DECL_D'
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |         ^~~~~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'CMP_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:94:13: note: in expansion of macro 'CMP'
      94 |         if (CMP(CMP /*EQ*/) == 0)
         |             ^~~
   arch/sh/math-emu/math.c:71:40: warning: variable 'Fn_c' set but not used [-Wunused-but-set-variable=]
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                                        ^~
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/sh/math-emu/math.c:71:27: note: in expansion of macro 'FP_DECL_S'
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                           ^~~~~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'CMP_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:94:13: note: in expansion of macro 'CMP'
      94 |         if (CMP(CMP /*EQ*/) == 0)
         |             ^~~
   arch/sh/math-emu/math.c:71:22: warning: variable 'Fm_c' set but not used [-Wunused-but-set-variable=]
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |                      ^~
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/sh/math-emu/math.c:71:9: note: in expansion of macro 'FP_DECL_S'
      71 |         FP_DECL_##SZ(Fm); FP_DECL_##SZ(Fn); \
         |         ^~~~~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'CMP_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:94:13: note: in expansion of macro 'CMP'
      94 |         if (CMP(CMP /*EQ*/) == 0)
         |             ^~~
   include/math-emu/soft-fp.h:102:24: warning: variable '_fex' set but not used [-Wunused-but-set-variable=]
     102 | #define FP_DECL_EX int _fex = 0
         |                        ^~~~
   arch/sh/math-emu/math.c:68:9: note: in expansion of macro 'FP_DECL_EX'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |         ^~~~~~~~~~
   arch/sh/math-emu/math.c:78:27: note: in expansion of macro 'BOTH_PRmn'
      78 | #define CMP(OP) ({ int r; BOTH_PRmn(OP##_X,r); r; })
         |                           ^~~~~~~~~
   arch/sh/math-emu/math.c:94:13: note: in expansion of macro 'CMP'
      94 |         if (CMP(CMP /*EQ*/) == 0)
         |             ^~~
   arch/sh/math-emu/math.c: In function 'fadd':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_D'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:110:9: note: in expansion of macro 'BOTH_PRmn'
     110 |         BOTH_PRmn(ARITH_X, ADD);
         |         ^~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_S'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:110:9: note: in expansion of macro 'BOTH_PRmn'
     110 |         BOTH_PRmn(ARITH_X, ADD);
         |         ^~~~~~~~~
   arch/sh/math-emu/math.c: In function 'fsub':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_D'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:117:9: note: in expansion of macro 'BOTH_PRmn'
     117 |         BOTH_PRmn(ARITH_X, SUB);
         |         ^~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_S'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:117:9: note: in expansion of macro 'BOTH_PRmn'
     117 |         BOTH_PRmn(ARITH_X, SUB);
         |         ^~~~~~~~~
   arch/sh/math-emu/math.c: In function 'fmul':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_D'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:124:9: note: in expansion of macro 'BOTH_PRmn'
     124 |         BOTH_PRmn(ARITH_X, MUL);
         |         ^~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_S'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:124:9: note: in expansion of macro 'BOTH_PRmn'
     124 |         BOTH_PRmn(ARITH_X, MUL);
         |         ^~~~~~~~~
   arch/sh/math-emu/math.c: In function 'fdiv':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_D'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:34: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                  ^~
   arch/sh/math-emu/math.c:131:9: note: in expansion of macro 'BOTH_PRmn'
     131 |         BOTH_PRmn(ARITH_X, DIV);
         |         ^~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:105:9: note: in expansion of macro 'PACK_S'
     105 |         PACK_##SZ(N, Fr); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:68:56: note: in expansion of macro 'ARITH_X'
      68 |         FP_DECL_EX; if(FPSCR_PR) op(D,x,DRm,DRn); else op(S,x,FRm,FRn);
         |                                                        ^~
   arch/sh/math-emu/math.c:131:9: note: in expansion of macro 'BOTH_PRmn'
     131 |         BOTH_PRmn(ARITH_X, DIV);
         |         ^~~~~~~~~
   arch/sh/math-emu/math.c: In function 'fmac':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:149:9: note: in expansion of macro 'PACK_S'
     149 |         PACK_S(FRn, Fr);
         |         ^~~~~~
   arch/sh/math-emu/math.c: In function 'ffloat':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:290:9: note: in expansion of macro 'PACK_D'
     290 |         PACK_##SZ(N, Fn); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:296:17: note: in expansion of macro 'EMU_FLOAT_X'
     296 |                 EMU_FLOAT_X(D, DRn);
         |                 ^~~~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:290:9: note: in expansion of macro 'PACK_S'
     290 |         PACK_##SZ(N, Fn); }while(0)
         |         ^~~~~
   arch/sh/math-emu/math.c:298:17: note: in expansion of macro 'EMU_FLOAT_X'
     298 |                 EMU_FLOAT_X(S, FRn);
         |                 ^~~~~~~~~~~
   arch/sh/math-emu/math.c: In function 'ftrc':
   include/math-emu/soft-fp.h:102:24: warning: variable '_fex' set but not used [-Wunused-but-set-variable=]
     102 | #define FP_DECL_EX int _fex = 0
         |                        ^~~~
   arch/sh/math-emu/math.c:309:9: note: in expansion of macro 'FP_DECL_EX'
     309 |         FP_DECL_EX;
         |         ^~~~~~~~~~
   arch/sh/math-emu/math.c: In function 'fcnvsd':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/double.h:103:5: note: in expansion of macro '_FP_PACK_CANONICAL'
     103 |     _FP_PACK_CANONICAL(D,2,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:62:20: note: in expansion of macro 'FP_PACK_DP'
      62 |         {u32 t[2]; FP_PACK_DP(t,f); ((u32*)&r)[0]=t[1]; ((u32*)&r)[1]=t[0];}
         |                    ^~~~~~~~~~
   arch/sh/math-emu/math.c:326:9: note: in expansion of macro 'PACK_D'
     326 |         PACK_D(DRn, Fr);
         |         ^~~~~~
   arch/sh/math-emu/math.c: In function 'fcnvds':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable=]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   include/math-emu/single.h:92:5: note: in expansion of macro '_FP_PACK_CANONICAL'
      92 |     _FP_PACK_CANONICAL(S,1,X);          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/sh/math-emu/math.c:59:25: note: in expansion of macro 'FP_PACK_SP'
      59 | #define PACK_S(r,f)     FP_PACK_SP(&r,f)
         |                         ^~~~~~~~~~
   arch/sh/math-emu/math.c:337:9: note: in expansion of macro 'PACK_S'
     337 |         PACK_S(FPUL, Fr);
         |         ^~~~~~


vim +/_FP_PACK_CANONICAL_T_e +145 include/math-emu/op-common.h

    81	
    82	/*
    83	 * Before packing the bits back into the native fp result, take care
    84	 * of such mundane things as rounding and overflow.  Also, for some
    85	 * kinds of fp values, the original parts may not have been fully
    86	 * extracted -- but that is ok, we can regenerate them now.
    87	 */
    88	
    89	#define _FP_PACK_CANONICAL(fs, wc, X)				\
    90	do {								\
    91	  switch (X##_c)						\
    92	  {								\
    93	  case FP_CLS_NORMAL:						\
    94	    X##_e += _FP_EXPBIAS_##fs;					\
    95	    if (X##_e > 0)						\
    96	      {								\
    97		_FP_ROUND(wc, X);					\
    98		if (_FP_FRAC_OVERP_##wc(fs, X))				\
    99		  {							\
   100		    _FP_FRAC_CLEAR_OVERP_##wc(fs, X);			\
   101		    X##_e++;						\
   102		  }							\
   103		_FP_FRAC_SRL_##wc(X, _FP_WORKBITS);			\
   104		if (X##_e >= _FP_EXPMAX_##fs)				\
   105		  {							\
   106		    /* overflow */					\
   107		    switch (FP_ROUNDMODE)				\
   108		      {							\
   109		      case FP_RND_NEAREST:				\
   110			X##_c = FP_CLS_INF;				\
   111			break;						\
   112		      case FP_RND_PINF:					\
   113			if (!X##_s) X##_c = FP_CLS_INF;			\
   114			break;						\
   115		      case FP_RND_MINF:					\
   116			if (X##_s) X##_c = FP_CLS_INF;			\
   117			break;						\
   118		      }							\
   119		    if (X##_c == FP_CLS_INF)				\
   120		      {							\
   121			/* Overflow to infinity */			\
   122			X##_e = _FP_EXPMAX_##fs;			\
   123			_FP_FRAC_SET_##wc(X, _FP_ZEROFRAC_##wc);	\
   124		      }							\
   125		    else						\
   126		      {							\
   127			/* Overflow to maximum normal */		\
   128			X##_e = _FP_EXPMAX_##fs - 1;			\
   129			_FP_FRAC_SET_##wc(X, _FP_MAXFRAC_##wc);		\
   130		      }							\
   131		    FP_SET_EXCEPTION(FP_EX_OVERFLOW);			\
   132	            FP_SET_EXCEPTION(FP_EX_INEXACT);			\
   133		  }							\
   134	      }								\
   135	    else							\
   136	      {								\
   137		/* we've got a denormalized number */			\
   138		int _FP_PACK_CANONICAL_is_tiny = 1;			\
   139		if (_FP_TININESS_AFTER_ROUNDING && X##_e == 0)		\
   140		  {							\
   141		    /* Architectures that detect tininess after rounding	\
   142		       only signal underflow if the result is still		\
   143		       subnormal once rounded as if the exponent range	\
   144		       were unbounded.  Round a copy to find out.  */	\
 > 145		    FP_DECL_##fs(_FP_PACK_CANONICAL_T);			\
   146		    /* The class field is not used by the rounding below,	\
   147		       and is unused entirely where this block is dead.  */	\
   148		    (void)_FP_PACK_CANONICAL_T##_c;			\
   149		    _FP_FRAC_COPY_##wc(_FP_PACK_CANONICAL_T, X);	\
   150		    _FP_PACK_CANONICAL_T##_s = X##_s;			\
   151		    _FP_PACK_CANONICAL_T##_e = X##_e;			\
   152		    _FP_ROUND(wc, _FP_PACK_CANONICAL_T);		\
   153		    if (_FP_FRAC_OVERP_##wc(fs, _FP_PACK_CANONICAL_T))	\
   154		      _FP_PACK_CANONICAL_is_tiny = 0;			\
   155		  }							\
   156		X##_e = -X##_e + 1;					\
   157		if (X##_e <= _FP_WFRACBITS_##fs)			\
   158		  {							\
   159		    _FP_FRAC_SRS_##wc(X, X##_e, _FP_WFRACBITS_##fs);	\
   160		    if (_FP_FRAC_HIGH_##fs(X)				\
   161			& (_FP_OVERFLOW_##fs >> 1))			\
   162		      {							\
   163		        X##_e = 1;					\
   164		        _FP_FRAC_SET_##wc(X, _FP_ZEROFRAC_##wc);	\
   165		      }							\
   166		    else						\
   167		      {							\
   168			_FP_ROUND(wc, X);				\
   169			if (_FP_FRAC_HIGH_##fs(X)			\
   170			   & (_FP_OVERFLOW_##fs >> 1))			\
   171			  {						\
   172			    X##_e = 1;					\
   173			    _FP_FRAC_SET_##wc(X, _FP_ZEROFRAC_##wc);	\
   174			    FP_SET_EXCEPTION(FP_EX_INEXACT);		\
   175			  }						\
   176			else						\
   177			  {						\
   178			    X##_e = 0;					\
   179			    _FP_FRAC_SRL_##wc(X, _FP_WORKBITS);		\
   180			  }						\
   181		      }							\
   182		    if (_FP_PACK_CANONICAL_is_tiny			\
   183			&& ((FP_CUR_EXCEPTIONS & FP_EX_INEXACT) ||	\
   184			    (FP_TRAPPING_EXCEPTIONS & FP_EX_UNDERFLOW)))	\
   185			FP_SET_EXCEPTION(FP_EX_UNDERFLOW);		\
   186		  }							\
   187		else							\
   188		  {							\
   189		    /* underflow to zero */				\
   190		    X##_e = 0;						\
   191		    if (!_FP_FRAC_ZEROP_##wc(X))			\
   192		      {							\
   193		        _FP_FRAC_SET_##wc(X, _FP_MINFRAC_##wc);		\
   194		        _FP_ROUND(wc, X);				\
   195		        _FP_FRAC_LOW_##wc(X) >>= (_FP_WORKBITS);	\
   196		      }							\
   197		    FP_SET_EXCEPTION(FP_EX_UNDERFLOW);			\
   198		  }							\
   199	      }								\
   200	    break;							\
   201									\
   202	  case FP_CLS_ZERO:						\
   203	    X##_e = 0;							\
   204	    _FP_FRAC_SET_##wc(X, _FP_ZEROFRAC_##wc);			\
   205	    break;							\
   206									\
   207	  case FP_CLS_INF:						\
   208	    X##_e = _FP_EXPMAX_##fs;					\
   209	    _FP_FRAC_SET_##wc(X, _FP_ZEROFRAC_##wc);			\
   210	    break;							\
   211									\
   212	  case FP_CLS_NAN:						\
   213	    X##_e = _FP_EXPMAX_##fs;					\
   214	    if (!_FP_KEEPNANFRACP)					\
   215	      {								\
   216		_FP_FRAC_SET_##wc(X, _FP_NANFRAC_##fs);			\
   217		X##_s = _FP_NANSIGN_##fs;				\
   218	      }								\
   219	    else							\
   220	      _FP_FRAC_HIGH_RAW_##fs(X) |= _FP_QNANBIT_##fs;		\
   221	    break;							\
   222	  }								\
   223	} while (0)
   224	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
