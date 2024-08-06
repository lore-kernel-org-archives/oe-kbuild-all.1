Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA618FC91
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 03:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722915694; cv=none; b=AEzvA0zla4du15otIlvghBUix79NGYIVr/65OX2Wb+5jFLztpyUa4WAmRlk5FqGM8bx+FdH+7Kw9AqomDAQ9PX2ay0iGL0rh1qwhDvfE/RDrvMpt6EAN47AIH+wEfgNh1SzPUGBCZC3Cg1wjrUuhe54LMEJG3eIwoVWi23YsFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722915694; c=relaxed/simple;
	bh=NOIA6GXFGUTwznlVCMnQLZoaTmmRQ/fJ1wpbp9mPd7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Df0fwH38MJeiQUlkGuqClqpYdMEQ2KKqrdeqUwzubRoUrmOvffaUqEY+s8WMjrnVPr9jSFBjgOu90OmV+mE+Pdi/FAAQHG4iKTBVkL/ICch1BeYRhS7OKXI1z8oa0hcFRaFWr3JRNQo6AfVHQTP28IdYqNIKfgj0rCJVHAiEgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oApA7WMI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oApA7WMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722915686; x=1754451686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOIA6GXFGUTwznlVCMnQLZoaTmmRQ/fJ1wpbp9mPd7Q=;
  b=oApA7WMI0H7Wclys04JnqDfiCHCseQBK5Ya+dKEUP4WvuzjWrpRL0mH1
   BfAnhtInnOHoHbTA4e72O//6UYIBjc9TeHeC/kBe1pcVqweNgLoy8Tlw8
   koYBXmT89p49/BazZN5obGjS9DxYI7gMsz7Wgi8iyDwS2LLF91+Yh/awf
   yoUePHGPJhmxf5K/OO4crhjhJL7+XSPWnc4O2jD9HRmGwKiyUHwmcJd9k
   Unockj3WeWcHjNByqyN3iaTk/5NqAzOuLwwls9nrvHPGbOqFWzO18Az/s
   qWJg9IVgmcrDgCm76/2kZYsBHK7X+BUTtPe/m7OvRvmuBgtnh6J/j+7vS
   A==;
X-CSE-ConnectionGUID: IGQ7S5X+SiacLFNZsqSA7w==
X-CSE-MsgGUID: SYeQN9slTRmpDr7puts7+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21074698"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="21074698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 20:41:24 -0700
X-CSE-ConnectionGUID: kUDKNsGpSAOl9OOZqiGlLA==
X-CSE-MsgGUID: v1FaqqFETtOfVCKn83hT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56308200"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2024 20:41:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbB4a-000474-2P;
	Tue, 06 Aug 2024 03:41:20 +0000
Date: Tue, 6 Aug 2024 11:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:master 5/5] error:
 arch/arm64/tools/syscall_64.tbl: syscall table is not sorted or duplicates
 the same syscall number
Message-ID: <202408061154.f8BOOZRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
head:   95cca8c0b66557774e5d08d5d0cc28c099938f15
commit: 95cca8c0b66557774e5d08d5d0cc28c099938f15 [5/5] syscalls: add back legacy __NR_nfsservctl macro
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240806/202408061154.f8BOOZRJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061154.f8BOOZRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061154.f8BOOZRJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/arm64/tools/syscall_64.tbl: syscall table is not sorted or duplicates the same syscall number
   make[3]: *** [scripts/Makefile.asm-headers:88: arch/arm64/include/generated/asm/syscall_table_64.h] Error 1
   make[3]: *** Deleting file 'arch/arm64/include/generated/asm/syscall_table_64.h'
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [Makefile:1211: asm-generic] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
