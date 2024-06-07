Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5DDF51
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768153; cv=none; b=hQ+Ka6kBV2ehl5BZ+ahfuHDhRhYiprNZ30iZ/9YGA7p7A+VbXwOI+j8BnQ47NKTLugo3biw0myzRK48ZtQnvKIE8hIn//6gD3QBKU15pVypRSPC7vjh7fboplaXBsp6zvphdQ57PxPSOLHKkBckLhoXmBUa4ajbf2EESN29W5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768153; c=relaxed/simple;
	bh=Gyd+ZsITDuu0aTTNavP65GqyssP7mOZD6LYM6Mqe8Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2IVw/+6k9TLpwQ5rbWiwRp5+vBvIki4Kax6c2blK3FySIJlZh7+UKJ7FCLTmz0Sb+4jCWDgtF04dllJcJDJip9Cqe6N8BqRXfJAvZcekDyK9MtOghR/aePgqOk5sHWoF27M9tYT8xRvEnj28UkHEZYlZCN+ajy1ESEYDzbWcoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoZ1e4Hi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoZ1e4Hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717768151; x=1749304151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gyd+ZsITDuu0aTTNavP65GqyssP7mOZD6LYM6Mqe8Qs=;
  b=AoZ1e4HiCCg+xsl4h1p71vDnpGHU380xBLgFqDNwY6HYg67JyDzHBihB
   RpZa4A+heTE5Clw6EFk5rEs7jxW8yePXXEV1IQZD1w1hJ0Xcf2s2NQj7e
   VoYP4KSeluM3Jhswidr+QLvPyN4skdJPtKHIdTY5T5nqjP1visawfFinI
   C9WJ19gH4OiU0WkKtjaBj3zBX2cjWseYx3IGvU5D5fq8p2T2APkktXn6P
   B7HVuAxtfPC0bljugN5H/LC7S4CfDlFW/wO7YOp6dMfJx8YTU9TQnfd+v
   6msEqqeX9q3d3SaFX/k0ih9nR8RB0gbsaHDXUgqXUWhF6Ws7V1VxtbDcV
   g==;
X-CSE-ConnectionGUID: oYHjGEynRgijD3WgIkkbVQ==
X-CSE-MsgGUID: wI9vt2/5QC2j8yVnPSTTCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25062187"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25062187"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:49:11 -0700
X-CSE-ConnectionGUID: mthAXVXUT4CuAOKoRKHn9A==
X-CSE-MsgGUID: SLYztyB/Rv+Hlos1tWqBxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69495145"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 06:49:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFZxs-0004sc-0o;
	Fri, 07 Jun 2024 13:49:08 +0000
Date: Fri, 7 Jun 2024 21:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx 5/9]
 drivers/net/ethernet/ti/cpsw_ale.h:37:9: error: redeclaration of enumerator
 'ENTRIES'
Message-ID: <202406072141.mMIgOmYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx
head:   de06f4cc19db62212a2f1e83905ab3b287ced30e
commit: 8ba5217a2987d80532ab08449a7f6141d0e78298 [5/9] net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240607/202406072141.mMIgOmYi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072141.mMIgOmYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072141.mMIgOmYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/cpsw.c:42:
>> drivers/net/ethernet/ti/cpsw_ale.h:37:9: error: redeclaration of enumerator 'ENTRIES'
      37 |         ENTRIES,
         |         ^~~~~~~
   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/vmalloc.h:5,
                    from include/asm-generic/io.h:994,
                    from arch/x86/include/asm/io.h:327,
                    from include/linux/io.h:13,
                    from drivers/net/ethernet/ti/cpsw.c:10:
   arch/x86/include/asm/processor.h:64:9: note: previous definition of 'ENTRIES' with type 'enum tlb_infos'
      64 |         ENTRIES,
         |         ^~~~~~~


vim +/ENTRIES +37 drivers/net/ethernet/ti/cpsw_ale.h

    33	
    34	enum ale_fields {
    35		MINOR_VER,
    36		MAJOR_VER,
  > 37		ENTRIES,
    38		POLICERS,
    39		/* terminator */
    40		ALE_FIELDS_MAX,
    41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
