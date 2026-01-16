Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5E313558
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 02:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768529138; cv=none; b=GUVJUx0NZq2QXpvBEFtnXnUs8MLwrFXNLqz6bL4aNL/QvEi5pGzW05lTO1rkD2eKCHUiuDXhXqGZNSqc1ziKveVee7MUHx+vTBPuxaoKb5gdRI4WJkEXUfZ4L5gn17I+XWeT8uYnf2i4eiNq5a3soUKdzzAu4O5wW7UPBqhWqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768529138; c=relaxed/simple;
	bh=zBI9STJQbwYJhjf91xRCl061vLx07xAX7O+4pojyyvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6KOrFAi+KqSJ3JOskiTkGBhMisQFlvd4GKVE8HZvej3twizaMV4O3b1/uMOJWWfVu9SsN8dp7XQq569TuU6KEt/7wbBuP2yq6Tu2Db79Sqy1k/VOcGdDvjTO2L45MO8AOfezSAkbmRSiW/HA1eNE7gdiA4iWla8GvR53JdTTtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctp9VfnJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctp9VfnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768529135; x=1800065135;
  h=date:from:to:cc:subject:message-id;
  bh=zBI9STJQbwYJhjf91xRCl061vLx07xAX7O+4pojyyvA=;
  b=Ctp9VfnJhvbsSRjHpDouNWdl+9OUg+zV0PI3rsslbSNzjyOi+MvMqf4Y
   I0VWzbk7AWp56GfcP5fZ+XUr9KD49URTHT/qLS0sVOfzhc2IJo2iBc+kW
   +rUBCAr5Cu/AI+YT1Jz3Y7MIM8rjY+X7SyBIe+kdJmYEWxgPvGTjiYnCU
   Em7KHBhXF4691MFKCDS00wTQCk7Qn6prnCDDjNufGXH9CDU640dWFIXpb
   oGTlsE/0SkIWQc7XBxiqtlPJDte+RNJkuNnpA5YYWNQ3Z5xxWK3Aocx1W
   ctrhXQsphVfRgSsvJtyhuB7lFRqcvVnL7BkYWQmBGoYSUTKu5iCG6HPJQ
   Q==;
X-CSE-ConnectionGUID: 5v9OgPwiTICD/mmI78Qp8w==
X-CSE-MsgGUID: xlHbcf77TpSFr+dLn9k2tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80958762"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80958762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:05:32 -0800
X-CSE-ConnectionGUID: VOBk9MoyTUGUpJ4MK+9lDQ==
X-CSE-MsgGUID: JN6+9e21Rbuw0zPgyL0j3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209978775"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 18:05:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZDM-00000000KFc-1Hoa;
	Fri, 16 Jan 2026 02:05:28 +0000
Date: Fri, 16 Jan 2026 10:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/4] fs/binfmt_elf.c:2162:13:
 error: no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202601160950.w4SJEArO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [0/4] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-003-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160950.w4SJEArO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160950.w4SJEArO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160950.w4SJEArO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/binfmt_elf.c:17:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/binfmt_elf.c:2162:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
