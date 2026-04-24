Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7A3BE628
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030750; cv=none; b=MT5z1msunhOI325G4YUsKzOXfrYs76L49o6KKTMWaZanTk94nmC5dcTzQ3V/P7UeNA40PVAYX6Vky7QXqcx+Nb6w64PiqLQ6DeFdni9qLWgday6B5sUGdEJkCMcmkTMQR2UbGkOd7qhU5lharo0QoH2Q9dyi1PMesFOfQDg2PQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030750; c=relaxed/simple;
	bh=4K6p+HTGOR4EzoyaHAS43QOLoPZw/J/jLvTDQXMyZEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hrhW+2a4dCjEwdVjy5BxmUr8FCc2ziWhRtRJY7+ipb0gfhJV1IfCniJT/VW9KN4ldUiOzLiu6tX4WIrVt/OlUpoONbY4K89gvvw6fswizupaozv1L13VqswYMqOi19B+c95KAh6n1PgV6zWqp6QqGaJwRO2RtHko4b3v9Cm6FK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6XXAuY8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6XXAuY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777030750; x=1808566750;
  h=date:from:to:cc:subject:message-id;
  bh=4K6p+HTGOR4EzoyaHAS43QOLoPZw/J/jLvTDQXMyZEQ=;
  b=e6XXAuY8/GrB/aUf+Ct/JJ0tWKKvGYt1kd3MVFGq20lrMk5ymlj6+fzw
   tQSrzS6Ql5DBnqBLDQn5XSiv7kX+A+Z7f57Z5xmqQhcpqipf5E2tUQ09D
   ADmQ8KLyr163X81B3h2nhyQCRNjJvdAmeID8F05bh9xQfuGsnuAugyWyg
   1wdspMF05AqOV/8VZ4//DZsSX38eynYZ2yyE7I1DALY2aqOAnxQncP5ZD
   msIZAP43Dl1Zeo4Qr5lvPzrp9QQhbNJT9kcmcm87qo7FEXwkxv/Fa0/RS
   XZyx/oNkVM9isSHtjbaotgaNZ0vOYdJyvzWzYH9PRMl4XjwZ6Rz+dlLm1
   g==;
X-CSE-ConnectionGUID: bNVsS+WuRoel1oq+vcvtxA==
X-CSE-MsgGUID: 9MxEqCEiS8e3Gi0ZfK4UFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89392449"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89392449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:39:08 -0700
X-CSE-ConnectionGUID: Wzdx+M7xTwyoa078x49VNg==
X-CSE-MsgGUID: 6nubKRssQAWHjvVdvGYU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234724418"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 04:39:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGEsC-000000005cV-1RV6;
	Fri, 24 Apr 2026 11:39:04 +0000
Date: Fri, 24 Apr 2026 19:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/binfmt_elf.c:2162:19:
 error: 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202604241950.Nv1GRfE5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5076a018b13cfc75cb2a033a8f548c1b1691fb7b
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-002-20260424 (https://download.01.org/0day-ci/archive/20260424/202604241950.Nv1GRfE5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241950.Nv1GRfE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241950.Nv1GRfE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


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
