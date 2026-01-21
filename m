Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98D3806AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769026151; cv=none; b=OXVCQYjpclVa+Boji7btMDsaXuuNfOjyJm/xzWFHS0EHC9YF9l0DXzscFQLOPmoGdbBkd3BA9erVWZ3vykGnY1GE7YgqzT1l84kzhpIgM3ud3kryy2nxDY2EZ0MwxrKf6FuylklZXGg/BD48HBinPYleKdTBP0+vjrxSQo5MxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769026151; c=relaxed/simple;
	bh=8SJNJV9ibReMM+sNm8aw7yEqddDQ0XShs9kO6fySuv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sMCOxsag9b8umsWZsxOV0nfL9AwARVQeFeNTfltOTKCSdnMtysgGDWrPSH7RnsdYYfF8KeQm74RhtPXZN6Y1ElIa0eHgGqbU1Sp4ixfwoh/eDAyW0iG+RfwH4uplVYMsAqFnq5j1PC+Ut5hZCFotYC8naf9EByc8UaOgQV16pKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PS772rz/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PS772rz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769026150; x=1800562150;
  h=date:from:to:cc:subject:message-id;
  bh=8SJNJV9ibReMM+sNm8aw7yEqddDQ0XShs9kO6fySuv0=;
  b=PS772rz/9VdimdmZZs93xfXB5LgCCez81JlOmJLey5vwDXbv37KYg1eY
   PybCPZMTZb+OHBrdJU+4gKsFRXEX9c7ctwFvswMYxQKO/Ad2J1pQJ49MP
   PhabfZ/AffLaKtUfWUJwenlYp5p1Zd4X+0yW4S2qUDAaKHo9b5r2HybM5
   cs9xYOFT0BnGnh7CL0VboYIJ8m26pEgptptMh2pLp152A7Rs3eRTixbdc
   VJmmwMA2zwC69bNx8u+CnVZQnq/Suf3fasXSk02/X6shuSIVejisgrZSR
   DtF9RSW2px8jBTGR2WpM10t1gUuXlElWKMmPGFkb5mW6TJ9EggbQu057u
   w==;
X-CSE-ConnectionGUID: V5ib9BsfRkuhzSLvxmT+Hg==
X-CSE-MsgGUID: wQ60qo3pS5SRFHUiTizQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80981805"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="80981805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 12:09:09 -0800
X-CSE-ConnectionGUID: NiKFvGYCQqa6yBIpLgtTWw==
X-CSE-MsgGUID: 3kz7PFz4TEySCm9hteuFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="205793202"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 12:09:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vieVl-00000000RsX-0ZZ8;
	Wed, 21 Jan 2026 20:09:05 +0000
Date: Thu, 22 Jan 2026 04:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 19/34] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x3ffac): cannot reach
 0000ba9e_trace_raw_output_prep+0, recompile with -ffunction-sections
Message-ID: <202601220345.3R9TSP8V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   517a3a901c85c7f5ede7f82520ddb11cb66c2ef8
commit: 9ac2411669f1d80d2e3d4f2d5de46f53ea831aa2 [19/34] xfs: add media verification ioctl
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601220345.3R9TSP8V-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220345.3R9TSP8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220345.3R9TSP8V-lkp@intel.com/

Note: the djwong-xfs/iomap-fuse-prep HEAD 517a3a901c85c7f5ede7f82520ddb11cb66c2ef8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffac): cannot reach 0000ba9e_trace_raw_output_prep+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffac): cannot handle R_PARISC_PCREL17F for trace_raw_output_prep
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
