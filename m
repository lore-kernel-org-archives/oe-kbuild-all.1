Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D65229B12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204261; cv=none; b=cURi7fUuNekuBEVfaMMNOoKTO8mtbhERwSswzJleQ9HSqdFj9PbAi4JYxa3Xlvb3NHbvBAy0He2A4NWpfDzd8croHLN2CCzm3U1WnFBCPg13dNoqZWyAFdDMrihywyt8m2acJ7Hmyaqk73OaDYmKSw45YYP/PosgnsRUdNhDZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204261; c=relaxed/simple;
	bh=GdWmUa8wUADha/7NeydVAAgkLELH/jB/ArZuE/nSTfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+lGZACx9/Kf/+juWpYDOne1kC4uVWxArQIRhodARMm/0ZH1eRhxlEUf0v8HthbgNkYISypd7wO/ocHu+BCH5AmXJBNS+kzMJLuIkCV236ar6ejEqlfekNW+JZoySGRzOl/I4f1q0GPv8ZH37AXGombxocUK0KYiSCEowz4T/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajm92Fa3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajm92Fa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755204259; x=1786740259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GdWmUa8wUADha/7NeydVAAgkLELH/jB/ArZuE/nSTfU=;
  b=ajm92Fa3hX6p4lEJM78E6cIqAxCBfKhhq4xCtqY5hI65JWTzyCmR4t3s
   jPHHczosmwZDEUHpuY9IfAJWqf9obkPUdyGp7zR4JmEO5QTUqJ6IExGW5
   IIdQEu864pjQvePPEuB+OZ9ZootcagbwkP3qUFoa/tPvJitqmEassoAT2
   wa8zfp2iaBZEOA4ngi2UsV2djIiswiRi3RFDiZW/tRmPudeZVDNpoF332
   CslMvAYndoxmFza6W8nrcMeylExJYTDTLIFw6UFzTerhoiMSQu7jpIDhk
   rr1d6hrnzYHABeVR5j7vRwV4toa95VHBU5YuHNPoIYi+pQpbIG1/qF8yl
   w==;
X-CSE-ConnectionGUID: 0HbGF94IR3694SukL9ZACw==
X-CSE-MsgGUID: jbi32WkFRW6+Os+PN4kXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75101603"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75101603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 13:44:18 -0700
X-CSE-ConnectionGUID: /JeymMoDSyCem3gED+KAOQ==
X-CSE-MsgGUID: y/GdFm/rS1eMb0NirkGIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197695432"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 13:44:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umeo3-000BK4-0D;
	Thu, 14 Aug 2025 20:44:15 +0000
Date: Fri, 15 Aug 2025 04:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] include/soc/fsl/qman.h:383:4:
 warning: field context_a within 'struct qm_fqd' is less aligned than 'union
 (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to
 'struct qm_fqd' being packed, which can lead to unaligned accesses
Message-ID: <202508150448.EUG0zT5p-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 [4/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
config: arm-randconfig-r063-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150448.EUG0zT5p-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150448.EUG0zT5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150448.EUG0zT5p-lkp@intel.com/

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
