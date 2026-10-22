Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649080;
	b=2DmpZbzAdAJME2QqVmvUrHlKBNA4auH7+2u6wjF0NQHetl0HR0lUMibbdWXmIQ2Q8V7w
	 JWhi1h5Zps3m8DP5cbix/R4DbGQHZdKJEVvja26ZTwIZdmTKiFKQtXAxhBNTTxau2jx5s
	 k9ZbMQiethE/32/vDQhVBbTHSgCu7RXQB4DOhKvRb+VWlLGfj8p2zC6UFuxP1lR27EE6E
	 QI6TXOxw4y9FEZMcvbP703XL1nx86PO/8cm+IwlFlqB3w+SJu87HEOWyTJ31G4v8ywemU
	 TxAXMoaTBelDSgOU4hX0nFTIojh/w8mURBvE/J3cSzG/h1YZtXs0zFOfnC3gtJajzow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649080;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BDIVAGffyB129ox0WpIM9x42kpjHaRQupngeEd0HKRo=;
	b=hnlj+lyUC06lCWJcPKE/zQIvgw0GdEgUAd0zSaaKIQjFypeEvkTOHxSdj8h7BkDmvxvg
	 R9tOELhiGyFVBsNCf0KWaQPJEREOfWiulizq+9HBZnX40U1qsWg6KzD6RV5EmM1KSF4II
	 bYME1Ccmj6nyuM6UmcrqN9f4OSENvXpXHGH3exu47wwHWATR9iypCs6s7Ov1CgWfGak4z
	 JlIZ0c/odFFBDhI+yxZElCgoF1yvKhpNsubL2xHLDlnGSPiGWxckVbfq9xctoPa4wEwfn
	 EF5QUyNni4M8Qxr5ooewjO5FE+SXhALP5I7vcNP1L2coTTFNYDkxgNwQ6L3AfVqCqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E+F3Xn7A;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF60606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 06:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E+F3Xn7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792649079; x=1824185079;
  h=date:from:to:cc:subject:message-id;
  bh=zZh57W7/FAQjLG9MO0rHToibCz3lBoTWtyJNW0lJx1U=;
  b=E+F3Xn7AnoqDQdOVx/IY6wjqEDCm+ZPAMAEO/Jiani4Vx7VcQh3zzG3a
   Acx6r7OOfcrNGeDg1Xecos9exKH/Zie1+Z/8kEXEJ34bbeBc61rNZoNLe
   rExjPzbcMOvSeVEF56s6iuZdKJFHEoSqujUbF16p6L4+l08gQs3/uWBlg
   bchrrOi4U8ItoR1LS2yg/bV4leuAQtveEDz361cFl53lEwiLsXGaikyek
   H934VDMVggeGx0qPYffxQRGxWBS6gEG3rncKDAusfKHelXCZKrQyI34Xd
   68/1Ebgza8tkHIIygOaxwybS89aIgBkZdjuLHMRpdGVyXSUAgsm3nlAW9
   g==;
X-CSE-ConnectionGUID: lw8kkqpwRaCq9FCH9CadCw==
X-CSE-MsgGUID: Z9+5xPWDRT22mkkoZvtOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1402515"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1402515"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 23:04:39 -0700
X-CSE-ConnectionGUID: 9cFrtx65SoujW301IRfznA==
X-CSE-MsgGUID: UfQM2lboTt6vSFmBSj18bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5090941"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 21 Oct 2026 23:04:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJluk-000000000Fr-0c8Y;
	Thu, 22 Oct 2026 06:04:34 +0000
Date: Thu, 22 Oct 2026 08:04:24 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Magnus Lindholm <linmag7@gmail.com>
Subject: [mattst88-alpha:alpha-fp-tininess 1/1]
 include/math-emu/op-common.h:145:26: warning: variable
 '_FP_PACK_CANONICAL_T_e' set but not used
Message-ID: <202610220827.AlfDjqIT-lkp@intel.com>
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
config: powerpc64-randconfig-r2111-20261022 (https://download.01.org/0day-ci/archive/20261022/202610220827.AlfDjqIT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220827.AlfDjqIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220827.AlfDjqIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/math-emu/fnmadd.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fnmadd.c:7:
   arch/powerpc/math-emu/fnmadd.c: In function 'fnmadd':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fnmadd.c:52:9: note: in expansion of macro '__FP_PACK_D'
      52 |         __FP_PACK_D(frD, R);
         |         ^~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fadd.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fadd.c:7:
   arch/powerpc/math-emu/fadd.c: In function 'fadd':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fadd.c:36:9: note: in expansion of macro '__FP_PACK_D'
      36 |         __FP_PACK_D(frD, R);
         |         ^~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/frsp.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from arch/powerpc/math-emu/frsp.c:9:
   include/math-emu/single.h:50:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/frsp.c:7:
   arch/powerpc/math-emu/frsp.c: In function 'frsp':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:185:12: note: in expansion of macro '_FP_PACK_CANONICAL'
     185 |            _FP_PACK_CANONICAL(S, 1, __X);                                       \
         |            ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/frsp.c:27:9: note: in expansion of macro '__FP_PACK_DS'
      27 |         __FP_PACK_DS(frD, B);
         |         ^~~~~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:189:20: note: in expansion of macro '_FP_PACK_CANONICAL'
     189 |                    _FP_PACK_CANONICAL(D, 2, X);                                 \
         |                    ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/frsp.c:27:9: note: in expansion of macro '__FP_PACK_DS'
      27 |         __FP_PACK_DS(frD, B);
         |         ^~~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fmadd.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fmadd.c:7:
   arch/powerpc/math-emu/fmadd.c: In function 'fmadd':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fmadd.c:49:9: note: in expansion of macro '__FP_PACK_D'
      49 |         __FP_PACK_D(frD, R);
         |         ^~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fadds.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from arch/powerpc/math-emu/fadds.c:9:
   include/math-emu/single.h:50:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fadds.c:7:
   arch/powerpc/math-emu/fadds.c: In function 'fadds':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:185:12: note: in expansion of macro '_FP_PACK_CANONICAL'
     185 |            _FP_PACK_CANONICAL(S, 1, __X);                                       \
         |            ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fadds.c:37:9: note: in expansion of macro '__FP_PACK_DS'
      37 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:189:20: note: in expansion of macro '_FP_PACK_CANONICAL'
     189 |                    _FP_PACK_CANONICAL(D, 2, X);                                 \
         |                    ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fadds.c:37:9: note: in expansion of macro '__FP_PACK_DS'
      37 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fdiv.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fdiv.c:7:
   arch/powerpc/math-emu/fdiv.c: In function 'fdiv':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fdiv.c:54:9: note: in expansion of macro '__FP_PACK_D'
      54 |         __FP_PACK_D(frD, R);
         |         ^~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fsqrts.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from arch/powerpc/math-emu/fsqrts.c:9:
   include/math-emu/single.h:50:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fsqrts.c:7:
   arch/powerpc/math-emu/fsqrts.c: In function 'fsqrts':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:185:12: note: in expansion of macro '_FP_PACK_CANONICAL'
     185 |            _FP_PACK_CANONICAL(S, 1, __X);                                       \
         |            ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fsqrts.c:39:9: note: in expansion of macro '__FP_PACK_DS'
      39 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:189:20: note: in expansion of macro '_FP_PACK_CANONICAL'
     189 |                    _FP_PACK_CANONICAL(D, 2, X);                                 \
         |                    ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fsqrts.c:39:9: note: in expansion of macro '__FP_PACK_DS'
      39 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fdivs.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from arch/powerpc/math-emu/fdivs.c:9:
   include/math-emu/single.h:50:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fdivs.c:7:
   arch/powerpc/math-emu/fdivs.c: In function 'fdivs':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_S'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:185:12: note: in expansion of macro '_FP_PACK_CANONICAL'
     185 |            _FP_PACK_CANONICAL(S, 1, __X);                                       \
         |            ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fdivs.c:56:9: note: in expansion of macro '__FP_PACK_DS'
      56 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:189:20: note: in expansion of macro '_FP_PACK_CANONICAL'
     189 |                    _FP_PACK_CANONICAL(D, 2, X);                                 \
         |                    ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fdivs.c:56:9: note: in expansion of macro '__FP_PACK_DS'
      56 |         __FP_PACK_DS(frD, R);
         |         ^~~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/fnmsub.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/fnmsub.c:7:
   arch/powerpc/math-emu/fnmsub.c: In function 'fnmsub':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/fnmsub.c:55:9: note: in expansion of macro '__FP_PACK_D'
      55 |         __FP_PACK_D(frD, R);
         |         ^~~~~~~~~~~
--
   In file included from arch/powerpc/math-emu/lfs.c:8:
   include/math-emu/double.h:59:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from arch/powerpc/math-emu/lfs.c:9:
   include/math-emu/single.h:50:21: warning: "__BIG_ENDIAN" is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^~~~~~~~~~~~
   In file included from include/math-emu/soft-fp.h:195,
                    from arch/powerpc/math-emu/lfs.c:7:
   arch/powerpc/math-emu/lfs.c: In function 'lfs':
>> include/math-emu/op-common.h:145:26: warning: variable '_FP_PACK_CANONICAL_T_e' set but not used [-Wunused-but-set-variable]
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/math-emu/op-common.h:28:32: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |                                ^
   include/math-emu/op-common.h:145:13: note: in expansion of macro 'FP_DECL_D'
     145 |             FP_DECL_##fs(_FP_PACK_CANONICAL_T);                 \
         |             ^~~~~~~~
   arch/powerpc/include/asm/sfp-machine.h:176:9: note: in expansion of macro '_FP_PACK_CANONICAL'
     176 |         _FP_PACK_CANONICAL(D, 2, X);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/math-emu/lfs.c:43:17: note: in expansion of macro '__FP_PACK_D'
      43 |                 __FP_PACK_D(frD, R);
         |                 ^~~~~~~~~~~
..


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
