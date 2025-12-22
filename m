Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1513B293
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766362530; cv=none; b=Z7Tps9ywgilw1LuRgqrFkp15VH1GKdr5Afh4FuXyzeE1eZim9i/w45CkDOpHxOXGilftFj4KnOHHLeTUoIhuXuywtTrJFJXiRTQREKdYbrme4Xa8rQxC3qwrbEvibA4fCkraWlfB3Es7E6XsX0hT2nrl35BoZIr9O8t3KWm1+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766362530; c=relaxed/simple;
	bh=NOTqZfH5pTPYKdMRpQvlRKB2NqE0UrKbxMmP+nGHVC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdsxAEYm9s1KBB1Yra9SIqxhk4FMuWgO5Ny19wwWXISKoHiygF6DzuWJ46WXm1j37snhVl07BO/LrDRHeXPPvHDcVWZ5fnDd25l+jYPgfmKBk+zSrEszLX1EOkXlvM8LtN39tDvKUr1vXKmTdGOUE1OKcFNxm/a+lszylnFiUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2F7l0+J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2F7l0+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766362528; x=1797898528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOTqZfH5pTPYKdMRpQvlRKB2NqE0UrKbxMmP+nGHVC4=;
  b=P2F7l0+J3qh43RUzf15soRwXLoT/CDHxNbGOkEPErphFBWUOfxp3mhtA
   Ayc/Kbu6tnxQpzle+VML5sKGV4wU75qAtqpiNjdu/ZTj4t6S6hG8D/m2D
   kIZm1dbJNW5vFeA/SX0Qbzp1+aT8gzvNMzcs2j98gHvdXF+OopoSr6azb
   KiRBSp5rwtnwvQkYFAeV9bqwrGjcKyGwtYZyxEDYivGjqC+lUsuT2ahYO
   jVX7o1ixhXozhd27W6pYgtRVDjPe6Otgf0f4rejrh7fPVxVT7xusdF5FC
   +RsbDMxXlAFPl1sMD66XUxEgrOFrWQvF71amQ2dGPgneBoILbZPpV7ttq
   w==;
X-CSE-ConnectionGUID: gKuTR3OuSYyazfHowLMblA==
X-CSE-MsgGUID: gplP8jw+TpuQeBrBrHPRYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68267693"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68267693"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:15:27 -0800
X-CSE-ConnectionGUID: 5WYP459mRUG8oCxEZHdT7A==
X-CSE-MsgGUID: s9mIFQNYSNe2a5BjKRVPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230046351"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 16:15:26 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXTa7-000000000KP-3Po7;
	Mon, 22 Dec 2025 00:15:23 +0000
Date: Mon, 22 Dec 2025 08:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415] arch/arm64/kernel/fpsimd.c:158:12:
 warning: 'get_sve_default_vl' defined but not used
Message-ID: <202512220837.hZSDu6Y4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: bf04fdf1fcc0040e6c81b413cdae84c0eb9212b9 [3415/3415] arm64/sve: Track vector lengths for tasks in an array
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251222/202512220837.hZSDu6Y4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220837.hZSDu6Y4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220837.hZSDu6Y4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:158:12: warning: 'get_sve_default_vl' defined but not used [-Wunused-function]
     158 | static int get_sve_default_vl(void)
         |            ^~~~~~~~~~~~~~~~~~


vim +/get_sve_default_vl +158 arch/arm64/kernel/fpsimd.c

1e570f512cbdc5 Dave Martin 2020-06-10  157  
1e570f512cbdc5 Dave Martin 2020-06-10 @158  static int get_sve_default_vl(void)
1e570f512cbdc5 Dave Martin 2020-06-10  159  {
68da302c8ae303 Mark Brown  2023-11-28  160  	return get_default_vl(ARM64_VEC_SVE);
1e570f512cbdc5 Dave Martin 2020-06-10  161  }
79ab047c75d6a9 Dave Martin 2017-10-31  162  

:::::: The code at line 158 was first introduced by commit
:::::: 1e570f512cbdc5e9e401ba640d9827985c1bea1e arm64/sve: Eliminate data races on sve_default_vl

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
