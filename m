Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF026B2AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 01:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774055797; cv=none; b=A6fXOW9zzq2r8F8hemThK/TL9otBujHiRl2LGg+2uSapJ5SQDLeBZu4FnDiQpZqq3QO1IilYtAjDmjX913wU1UpvXOEihdmKF0z2xZb3GjvXj5s4Zs+IXRzB7CIT22ADeAE/ZwmuieRHSdAVnMZIbn/Nn3AGx344oUZ+iUqevkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774055797; c=relaxed/simple;
	bh=3wqs39psbPerZx+Y4rHE1v7Up8s8LiRYWfGuDJFbg5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OLsuZYhO77uNhD361f5x2tAyFwaU8cXdG0Y9j7aA+aQrJ4kJErohXlUfHF+cfXOPSBtMUlvsPLaFPN9WYJ0hzulcWh+UHZGcRI5xqGR5AmZz6FxFFWViciGTBb7obwl2pzqp3hGXVI86zdwn7YAs3qk2QJWNA9B1s5LWMUq0Psc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT6+plqZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT6+plqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774055796; x=1805591796;
  h=date:from:to:cc:subject:message-id;
  bh=3wqs39psbPerZx+Y4rHE1v7Up8s8LiRYWfGuDJFbg5Q=;
  b=nT6+plqZik8JEDY2Od9Xb/pKzF3GNZCpPnYr9AR5+LNxlRncfBDws+bS
   +jaU/bFaw9QgT7UJlSkAg5Rc1mowaj5KF08/CzJ7xTwdIt2Dd+y68IKG6
   7BjGV7Wv2oILfqbfZ0oYgR6spI946mcZZXJTEEZyn5su0w3ZrpP0LXMlr
   u2j2NolZ+qdIA1VRmIrNyxZfkHB42m+P5xDF5YUfc0hdQwKbJ5rFpkEXT
   JPU2NFr7uZRqdRnhjszgYj7eyw71OIAKGd+esJqkwA98twVMkg+2DViJW
   mefQzK6Hr1ArrM2kpJFbg0tnO826zrGAiaemm1+HazMR7rdwx5EOEzbFj
   Q==;
X-CSE-ConnectionGUID: h9Wz9kTsRriKxo1hVbD4fA==
X-CSE-MsgGUID: oV832mSST/WcDd0Zp4fQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77753077"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77753077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 18:16:35 -0700
X-CSE-ConnectionGUID: ytKCc92KRTaC/F1P3PnfdQ==
X-CSE-MsgGUID: rOXlejATQLOrKsBRPr1Gsw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 18:16:34 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3kwt-0000000008n-2NSH;
	Sat, 21 Mar 2026 01:16:22 +0000
Date: Sat, 21 Mar 2026 09:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] fs/binfmt_elf.c:2131:13:
 error: no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202603210914.QDIVAB6Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   bda92803db1ff53c9b60734a6a9ef9c09491e678
commit: 7964dc9503054b0e617a38f92e9751a60c6ce975 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-002-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210914.QDIVAB6Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210914.QDIVAB6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210914.QDIVAB6Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2131:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2131 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.


vim +2131 fs/binfmt_elf.c

  2128	
  2129	static int __init init_elf_binfmt(void)
  2130	{
> 2131		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2132		register_binfmt(&elf_format);
  2133		return 0;
  2134	}
  2135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
