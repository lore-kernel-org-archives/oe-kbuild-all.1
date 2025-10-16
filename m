Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FCFC0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760588977; cv=none; b=jrVWcXLtMPpxuToXe7sT6c9ZXF966QaSyTgxBNJWaqMLm9eABo6n+a3cQTRaZ2GgqI0XZmhtgpmpKNAzbz8Pqr/IfvfO2g10BtWmK95uZ17bxTqPFthXMswZPTJU3viE04NM6dnj5JA5P39vC+TgBTxxz00ZAfZj9qhUPagiM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760588977; c=relaxed/simple;
	bh=KlMW9iKK6y+e5tsKIy73lFzHOKzvewaxeRP3EB/osqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcCrDRUQbPiPTu6xTRjGM0xii7eqGL81jza2qNgXwQVYhoJS/S/AxuJaTegjqBbOB5wNd59bULITaP9ISXJ6AQKWbVGrpGPbbq0QvXf6mXN5j/A3c7t90sFjloGel0HVFB6g+Xynsao7umH9ECj+7DEtSehw+clJMTEd5WijFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4d869r6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4d869r6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760588976; x=1792124976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KlMW9iKK6y+e5tsKIy73lFzHOKzvewaxeRP3EB/osqo=;
  b=T4d869r6p/qX1hNMU77ZfcPeGFRl4iH+4XpZhBNXs8VdzbbwoMjTtHQc
   BWLbUERQejismVUYZFUKsbMo2LIik2Bd+JqX/dbeEF+3VuLe/fG0OvSIF
   Rj19DvwwJ43VLaI2Wj2o3SkXQiXheaKttoR7sFl7xXV0E6caZLMuN6URA
   4vhDgDpvVpcHgN0eagXJXW7gFgkOyGnUzMNEvca/8Gmz1dmj9HRiyKcfT
   vYo6cuS18IoXg0gis9kMdYdkWs4BsY/gl3tSIxh93LGHkK78Sv11s0C1l
   nbwCvywfQgu2f3oSvHZfgOjz9M1/Ig9sPqAoVR9js4i8P1fFjfZx4LUfn
   w==;
X-CSE-ConnectionGUID: cZec15DmT1W5v88ZaRTyqg==
X-CSE-MsgGUID: tgsOg6lzRMe2DJNkPhs0og==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="65390342"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="65390342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 21:29:36 -0700
X-CSE-ConnectionGUID: +WzcM+2oTCWepe53QC4jyw==
X-CSE-MsgGUID: RiN3oia0TciYF0hH7mHDIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="186611037"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2025 21:29:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9FcE-0004SH-38;
	Thu, 16 Oct 2025 04:29:28 +0000
Date: Thu, 16 Oct 2025 12:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Yosry Ahmed <yosryahmed@google.com>
Subject: [bjackman:asi/next 45/49] arch/x86/include/asm/processor.h:247:16:
 error: implicit declaration of function '__read_cr3_raw'; did you mean
 'read_cr3_pa'?
Message-ID: <202510161252.WpOjfggs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   0c9d948029f991e9bf7db4697780d96945231c3c
commit: d8e2f01eaf621d38b5358709e26136c4bc69d25c [45/49] mm: asi: exit ASI before accessing CR3 from C code where appropriate
config: x86_64-buildonly-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161252.WpOjfggs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161252.WpOjfggs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161252.WpOjfggs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/processor.h: In function 'read_cr3_pa_raw':
>> arch/x86/include/asm/processor.h:247:16: error: implicit declaration of function '__read_cr3_raw'; did you mean 'read_cr3_pa'? [-Wimplicit-function-declaration]
     247 |         return __read_cr3_raw() & CR3_ADDR_MASK;
         |                ^~~~~~~~~~~~~~
         |                read_cr3_pa
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=529999952
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=529999952
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=529999952
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=529999952
   make: Target 'prepare' not remade because of errors.


vim +247 arch/x86/include/asm/processor.h

   244	
   245	static __always_inline unsigned long read_cr3_pa_raw(void)
   246	{
 > 247		return __read_cr3_raw() & CR3_ADDR_MASK;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
