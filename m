Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790294;
	b=wSG1CQBBdOwHNF53wl+brQwOsJF1TLYoryh2dQQPK+Y24EdXCXk6IWAUL+DhcVQl/aJn
	 2kKk1KuWAifjR0LnBGVBaKdfbG3rwFdtU4SGjExJ13C+2McWZUg3jXDFhSlekrl9+S/+H
	 ZZxPoHI9TpmaV+S0bwN1ICdusX/BnLVtGnWKNxevF78egY3SO1rLkPorHHkHYTy9xU8jt
	 kuE8IK6Xfd5FAoIEKUPpboLTHuKEfwRIVISWcIb5luyEFq6j3U6xEi63N8S1kbY/UWGJi
	 ty6pudMN6DTwjgwNGHDbVdcJLIzFKsAH5D7lLAWAYYoVafT9jIU645Wnmfuj93CccdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wOb12xkWZVjhYzCurd/ZI6ToPWaUsFJwt+UCtkhDn9w=;
	b=JCFYXYrFGVoEYlbVRrT147YBI0MCv/aoI/xJ3FG77BIId2Hk+GjB4/mV5tNNntWJTW5Z
	 RJyGR1b8/GkvHDE3/eqjtEYDQs8XWsk4QEdzZY1/W6EEdWet8rFEr4INkrLyuIL1K3qgY
	 faPwHQtYFtCQXFma9kL0kcODRatyae3H5KQGGHHBLexR3nS4kQClKWatrscvVUPH1pDyb
	 MxCnNYrrmcffaXWckV/dNuDcJhZ+KXDhqW4V2iohwCJyt9SDtz/9L9osYYKhbqRCu0+vV
	 hgKvzMODATaIeEAqUJy6RKy1Bm2yM8yHuRsu6a2XCX6MLSiHCbsW5EQAlHmS2thag8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csT6yXhm;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC47606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 21:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC47606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csT6yXhm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792790292; x=1824326292;
  h=date:from:to:cc:subject:message-id;
  bh=+bWnenLI6SJwels9hIcQHHZXmTZ9QzdVN6RaHtenBcU=;
  b=csT6yXhmy62yb4O9NeHW0SQMP1g483wBTBNOmpNxDi7UGHqEqy8byXxW
   Pn3grjZYi6CapcmV1h/vLjYEzFVkuzhA7NO2b72qIhFPhdthbiWiJi4Kb
   A1gE1Mpwi58DlWGg2t+ezLT5mFjlNgWOwgQy0gxev4aPZJGGuQyDFx2/a
   T0X495CjCx5nVOQyWNjLERI1MOIwWRLSXY/D0fr1XDfPAs/yNc07bOVp+
   JT5tfoufqd2C6SK/CRWik/9XBEQhF1FjgUP6vOO2vWLj9Av1Ouw5uH0xZ
   wrtGbJ/rzLI6nqJi2UHinNbWjn0SYIvXJ5joLk/xRLgk4tKlnNIbcW1hd
   g==;
X-CSE-ConnectionGUID: GCjAiZgtRq2MnZRtrJ03XQ==
X-CSE-MsgGUID: BFZ9PCsHQzmStOSalq38/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1565694"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1565694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 14:18:11 -0700
X-CSE-ConnectionGUID: Szh/lgj9QR2H7hsBBSxNRA==
X-CSE-MsgGUID: vyFE54LFRhigXFOMzWR2+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3694210"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 14:18:10 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKMeN-00000000239-2udc;
	Fri, 23 Oct 2026 21:18:07 +0000
Date: Fri, 23 Oct 2026 23:17:27 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/soc/fsl/qman.h:383:4: warning: field context_a
 within 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <202610232348.7xnFvvIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a78f7ba9f24962c8033e0152bf34a7903ff61ba
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
date:   4 months ago
config: arm-randconfig-r2100-20261023 (https://download.01.org/0day-ci/archive/20261023/202610232348.7xnFvvIC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610232348.7xnFvvIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610232348.7xnFvvIC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/qman.c:31:
   In file included from drivers/soc/fsl/qbman/qman_priv.h:33:
>> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     383 |         } context_a;
         |           ^
   1 warning generated.


vim +383 include/soc/fsl/qman.h

c535e923bb97a4b Claudiu Manoil 2016-09-22  346  
c535e923bb97a4b Claudiu Manoil 2016-09-22  347  struct qm_fqd {
c535e923bb97a4b Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
c535e923bb97a4b Claudiu Manoil 2016-09-22  349  	u8 orpc;
c535e923bb97a4b Claudiu Manoil 2016-09-22  350  	u8 cgid;
c535e923bb97a4b Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
c535e923bb97a4b Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
c535e923bb97a4b Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
c535e923bb97a4b Claudiu Manoil 2016-09-22  354  	/*
c535e923bb97a4b Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
c535e923bb97a4b Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
c535e923bb97a4b Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
c535e923bb97a4b Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
c535e923bb97a4b Claudiu Manoil 2016-09-22  359  	 */
c535e923bb97a4b Claudiu Manoil 2016-09-22  360  	union {
c535e923bb97a4b Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
c535e923bb97a4b Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
c535e923bb97a4b Claudiu Manoil 2016-09-22  363  	};
c535e923bb97a4b Claudiu Manoil 2016-09-22  364  	__be32 context_b;
c535e923bb97a4b Claudiu Manoil 2016-09-22  365  	union {
c535e923bb97a4b Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
c535e923bb97a4b Claudiu Manoil 2016-09-22  367  		__be64 opaque;
c535e923bb97a4b Claudiu Manoil 2016-09-22  368  		struct {
c535e923bb97a4b Claudiu Manoil 2016-09-22  369  			__be32 hi;
c535e923bb97a4b Claudiu Manoil 2016-09-22  370  			__be32 lo;
c535e923bb97a4b Claudiu Manoil 2016-09-22  371  		};
c535e923bb97a4b Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
c535e923bb97a4b Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
c535e923bb97a4b Claudiu Manoil 2016-09-22  374  		struct {
c535e923bb97a4b Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
c535e923bb97a4b Claudiu Manoil 2016-09-22  376  			/*
c535e923bb97a4b Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
c535e923bb97a4b Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
c535e923bb97a4b Claudiu Manoil 2016-09-22  379  			 */
c535e923bb97a4b Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
c535e923bb97a4b Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
c535e923bb97a4b Claudiu Manoil 2016-09-22  382  		} __packed;
c535e923bb97a4b Claudiu Manoil 2016-09-22 @383  	} context_a;
c535e923bb97a4b Claudiu Manoil 2016-09-22  384  	struct qm_fqd_oac oac_query;
c535e923bb97a4b Claudiu Manoil 2016-09-22  385  } __packed;
c535e923bb97a4b Claudiu Manoil 2016-09-22  386  

:::::: The code at line 383 was first introduced by commit
:::::: c535e923bb97a4b361e89a6383693482057f8b0c soc/fsl: Introduce DPAA 1.x QMan device driver

:::::: TO: Claudiu Manoil <claudiu.manoil@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
