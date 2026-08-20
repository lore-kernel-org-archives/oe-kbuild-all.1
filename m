Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322A388E74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215527; cv=none; b=sIqdtbrDxji8+1WbwhT+ug/2DzrRehH+2zu2fWhfdT1fBY2BnlUs9ta2tI9iH7Q+jE3U7hmXcbRA6qBfFVWNfv5ok+nsB8hekd1JukQDPi2thP/pKFsP0MgAVjOBrG8sbnupn9hx1c/JfDaaVBtDgtnnuiFVXuniPdYvZOZIVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215527; c=relaxed/simple;
	bh=sSllEq+MdIlgyjXeKBBVm2eKT3U4rpAN9oASWy8jJn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gd5A/0MAZTOtGCYNBlJi+0ZFdl8xUiBSsP0cFEbN/pOWurfScAhV47xz6Tgbg1tAvYTwgUtT1lFDvIVS83bd/thM0L41qN4r4aSoQgFcsJj/c5ZCXZ55zGdDNiUIe2yiAnCy6yAIjbEQYlyqnGCjfdrT/oKd5lupV7t/3auTq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEOw5vQy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEOw5vQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787215526; x=1818751526;
  h=date:from:to:cc:subject:message-id;
  bh=sSllEq+MdIlgyjXeKBBVm2eKT3U4rpAN9oASWy8jJn0=;
  b=AEOw5vQyXg0zBbcoEd3BsIyQCjsfViC7IKozyQdtcrSH80db9oNREJI5
   H1Y3U4AXvI774O2jQLL6D7K9HDEzlS3G6Ugu9l29v0Aa7jmMz4KCyIMRX
   QYblUR5MpnE2D31cRcq5uI9L3aqwd4pxltdBjQ5xUuJkd1nfhANU6iIs9
   y4wCPNSNxbttQ5qtyIX17uWfOERREKSjUVjfLfE1NfuNbxHBdUAPrnVSw
   0HY1WPNb76ELLTBxFP7QMsowTw/mJxFNCzRsjGewPiNkNqsBEn/q/U2kH
   6JdWfjWCjMMPmU2BSHKt1Ivmrd5X0qNmzMhXQV0x/zrzDezqg/W9qiyn7
   w==;
X-CSE-ConnectionGUID: sR2fq3gmSsO3dhD0h7PEdg==
X-CSE-MsgGUID: HKsVXs+WTT+B/shFBpmYGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91617451"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="91617451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:45:24 -0700
X-CSE-ConnectionGUID: m3Obt7nqSeu/TNi0ZKfJzg==
X-CSE-MsgGUID: dixsdl56TaCQOYqM1duzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="290742914"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2026 01:45:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwyOl-00000000iQp-1w4j;
	Thu, 20 Aug 2026 08:45:19 +0000
Date: Thu, 20 Aug 2026 16:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/soc/fsl/qman.h:383:4: warning: field context_a
 within 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <202608201631.dsIekKuW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
date:   7 weeks ago
config: arm-randconfig-r071-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201631.dsIekKuW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201631.dsIekKuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201631.dsIekKuW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/qman_ccsr.c:31:
   In file included from drivers/soc/fsl/qbman/qman_priv.h:33:
>> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     383 |         } context_a;
         |           ^
   1 warning generated.


vim +383 include/soc/fsl/qman.h

c535e923bb97a4 Claudiu Manoil 2016-09-22  346  
c535e923bb97a4 Claudiu Manoil 2016-09-22  347  struct qm_fqd {
c535e923bb97a4 Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
c535e923bb97a4 Claudiu Manoil 2016-09-22  349  	u8 orpc;
c535e923bb97a4 Claudiu Manoil 2016-09-22  350  	u8 cgid;
c535e923bb97a4 Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
c535e923bb97a4 Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
c535e923bb97a4 Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
c535e923bb97a4 Claudiu Manoil 2016-09-22  354  	/*
c535e923bb97a4 Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
c535e923bb97a4 Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
c535e923bb97a4 Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
c535e923bb97a4 Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
c535e923bb97a4 Claudiu Manoil 2016-09-22  359  	 */
c535e923bb97a4 Claudiu Manoil 2016-09-22  360  	union {
c535e923bb97a4 Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
c535e923bb97a4 Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
c535e923bb97a4 Claudiu Manoil 2016-09-22  363  	};
c535e923bb97a4 Claudiu Manoil 2016-09-22  364  	__be32 context_b;
c535e923bb97a4 Claudiu Manoil 2016-09-22  365  	union {
c535e923bb97a4 Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
c535e923bb97a4 Claudiu Manoil 2016-09-22  367  		__be64 opaque;
c535e923bb97a4 Claudiu Manoil 2016-09-22  368  		struct {
c535e923bb97a4 Claudiu Manoil 2016-09-22  369  			__be32 hi;
c535e923bb97a4 Claudiu Manoil 2016-09-22  370  			__be32 lo;
c535e923bb97a4 Claudiu Manoil 2016-09-22  371  		};
c535e923bb97a4 Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
c535e923bb97a4 Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
c535e923bb97a4 Claudiu Manoil 2016-09-22  374  		struct {
c535e923bb97a4 Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
c535e923bb97a4 Claudiu Manoil 2016-09-22  376  			/*
c535e923bb97a4 Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
c535e923bb97a4 Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
c535e923bb97a4 Claudiu Manoil 2016-09-22  379  			 */
c535e923bb97a4 Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
c535e923bb97a4 Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
c535e923bb97a4 Claudiu Manoil 2016-09-22  382  		} __packed;
c535e923bb97a4 Claudiu Manoil 2016-09-22 @383  	} context_a;
c535e923bb97a4 Claudiu Manoil 2016-09-22  384  	struct qm_fqd_oac oac_query;
c535e923bb97a4 Claudiu Manoil 2016-09-22  385  } __packed;
c535e923bb97a4 Claudiu Manoil 2016-09-22  386  

:::::: The code at line 383 was first introduced by commit
:::::: c535e923bb97a4b361e89a6383693482057f8b0c soc/fsl: Introduce DPAA 1.x QMan device driver

:::::: TO: Claudiu Manoil <claudiu.manoil@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
