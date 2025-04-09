Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61925C70A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188923; cv=none; b=l986C2lOgzUiw7FBXIB9qFKGyH2r1MrglSorNKJNBQoACsBvrItLZC7P9Y4dEi0TWSuefLDZd7v91qA438AlfAffVQtFVnbJiUa0YiogvsdE9d6dnk57u91Tcq3IcebrfhzYeCGsvMYaZrYa7RNUbStfSJ8GHXVwxJ84oTUTpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188923; c=relaxed/simple;
	bh=hxWa8FIZOoUlSsRe3LnMxLx1aRj2zI4Vnkme0L2swJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WyO+wj6QpzNuAG9kkVTSrV4l7Vo/hU/dDrObPeICdBg9SMxx6ypja7u6J5AytBdZFYBvYQx6sGYNZMTbVfrXMhGHI3xuN2uWQzegxFWiaHv206hfjjwc0u/nCJrp4IeA1Ya020L5xx6Ar158/wrqEW2XuJevlToUJfkyXcbQcXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMJmIw1P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMJmIw1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744188922; x=1775724922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxWa8FIZOoUlSsRe3LnMxLx1aRj2zI4Vnkme0L2swJc=;
  b=hMJmIw1PI4o4di9Tn0jvjVDYS9gNYJ9PiwBFLeasGea0y+BQJ3Snrav3
   HjvpjIB1YGNbjFXaMvSiNrBK/5KI9Woy4036MkWVMy/3Q1S+gEcS1OKAX
   Rve3DXubQNgjXVl7F1SQy9+y4sj009+oSjJw/sDhxIVPPq3X170uF2YRY
   5LzpAYoL5U7IYW1laOiBNuJtSS4CVfTTtPlhIPUAha97DfTZO8/p2dYfM
   JLFTNtO3xtX3Sjgqt4ZvKOIa5/DdArhtuN7yFz1MQQ1CZuy41iTvRfGbX
   zBYbVo0vVLRjarN9edH727q+QW9umzqTO2xdHkvq4wjt4TL40NjNKvupa
   Q==;
X-CSE-ConnectionGUID: gsamZYsRS1+vhxuezquTmQ==
X-CSE-MsgGUID: 4IV+sStnSM+d+Iqk4kvo+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56633598"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56633598"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:55:22 -0700
X-CSE-ConnectionGUID: sUTSVrVlTk63hrJ9zGn1xA==
X-CSE-MsgGUID: UHt2NETASm2bg1nK6qklJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129351826"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Apr 2025 01:55:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2RDJ-0008bR-25;
	Wed, 09 Apr 2025 08:55:17 +0000
Date: Wed, 9 Apr 2025 16:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: include/soc/fsl/qman.h:383:4: warning: field context_a within
 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <202504091657.OgPuMa8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Breno,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a24588245776dafc227243a01bfbeb8a59bafba9
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
date:   9 months ago
config: arm-randconfig-r063-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091657.OgPuMa8C-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091657.OgPuMa8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091657.OgPuMa8C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/qman_ccsr.c:31:
   In file included from drivers/soc/fsl/qbman/qman_priv.h:33:
>> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           } context_a;
             ^
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
