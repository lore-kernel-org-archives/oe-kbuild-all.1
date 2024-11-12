Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D72AF06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376098; cv=none; b=nCp3fdKGS2pB6V3Kj25bqdxdGLv6dxSoaAVQttiwkkwqW4LsQUDnOutT/CL8nzyJNJZFNEVM6lB6lBoISkzqqBh9aFzSpBeOmrZqdr49NAigaJ4jE5MwOHq99DwjCPS1t51HeRpLOnnFmB/zXUeS3JHUJwHJC5QwL5hZYNtbeMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376098; c=relaxed/simple;
	bh=920BwwTdZcXpmaxfD6WxLp2FmNRj1rcoqZjzP00dta4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqD6e8apivDKO1TI9Yht1QNh+WvdpSL2U3nPMAqll0IxwnFXzeckWflkor/F0SQC0j+vC5G7IF0Jgf56CmeNl+lCvguCxjAnbhukHBDJ/Ga2ycBUQa3kCx5Mr2ZQYZyRle2hfpV71eJiDyV1PCXdrSttaxAGg5XqsXzpDHcTKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9wKZBQi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9wKZBQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731376095; x=1762912095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=920BwwTdZcXpmaxfD6WxLp2FmNRj1rcoqZjzP00dta4=;
  b=l9wKZBQiw+Tq/79zrCwkKdb4zFwQRCtVvlpPxmZsgXhk9W1m64M4JuIj
   Iikw0BDV414nFVN40LzjeJhLrGPoKq2gLiLIYbjU5W4tTHCGGe2tzQd+Q
   1wrsrEKE+M4SKlS1bzuxMZl2hzYt3/0VC7pi6BEffTrCPxBGbAONF0Afr
   6Zv8UVP5pOaSXHq8CiQlsEP9u1KayJ3gmVg+OkYvbYH+pZmVNO8Fuqe8u
   75xm3ToTg6xgvCgx5lfUlUWZbWuNldFvh7tC8x1nVUYJN3LbyHbgBitHI
   JzSr4d96q7rHxhGSuKlKclakYo0mN3LHVHrX2J2UGZyPGl1wv0Tbx1+gI
   g==;
X-CSE-ConnectionGUID: OXzRNU2fQ+uHjWrTzV6C7A==
X-CSE-MsgGUID: NQpOSdJxS52MxOoGzDHbOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31155242"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31155242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 17:48:15 -0800
X-CSE-ConnectionGUID: 2YZAhjzHSkyf3oj4Fpa+oQ==
X-CSE-MsgGUID: noWIB74TRM+YBvvZ3YRhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="91704944"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2024 17:48:13 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAg0p-0000LO-0u;
	Tue, 12 Nov 2024 01:48:11 +0000
Date: Tue, 12 Nov 2024 09:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] mm/vmscan.c:3467: undefined reference
 to `kernel_swap_enabled'
Message-ID: <202411120941.Ots9b35i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf973836a0d3e07d47c4005e1c6d32a27f35b2b2
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [2417/2417] etmem: add original kernel swap enabled options
config: x86_64-randconfig-014-20241112 (https://download.01.org/0day-ci/archive/20241112/202411120941.Ots9b35i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120941.Ots9b35i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120941.Ots9b35i-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: mm/vmscan.o: in function `kernel_swap_check':
>> mm/vmscan.c:3467: undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3467: undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3467: undefined reference to `kernel_swap_enabled'


vim +3467 mm/vmscan.c

  3459	
  3460	#ifdef CONFIG_ETMEM
  3461	/*
  3462	 * Check if original kernel swap is enabled
  3463	 * turn off kernel swap,but leave page cache reclaim on
  3464	 */
  3465	static inline void kernel_swap_check(struct scan_control *sc)
  3466	{
> 3467		if (sc != NULL && !kernel_swap_enabled())
  3468			sc->may_swap = 0;
  3469	}
  3470	#endif
  3471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
