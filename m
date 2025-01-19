Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BAC29415
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737268203; cv=none; b=uLs5h9/+Xsp+OBNHfYuwYPwF/Lzi+FEKs4rwYfe//gknfncXwib5FtpGqP5XE4MuaCBUENK65i8e3VuUHdkkgtswzUtTr8wZS7w0ynrKoX96FFk27+Z6HmfC3fAyDG5jzzMe7uSbJV9qmOfLnaZzGuEjTNlsB+qiAA1zMBDiUQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737268203; c=relaxed/simple;
	bh=pnnoUDOnwQkNnugAq50636pN1p+hKZBxkS1gjh74p4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AtLU8Zu6tglTags3R8H2ppqvrkOFX1c3hb8KYltWpffY+wwytUa06rdhsFqC7t4SI5s8UitwzDzgWOApuqCrA9mxHuNRmv3wIphgIHkxOug+nIPbH31/RayVtSSIHlTVpJoA/KrHVpp5pTxbLKBSiNnWQVd37fRY7lP9DrDXha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+A2xIU+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+A2xIU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737268201; x=1768804201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnnoUDOnwQkNnugAq50636pN1p+hKZBxkS1gjh74p4E=;
  b=b+A2xIU+eSRg5QfKz2LUb22xY+Tcc0SJ/yVWCeCj+wnLHguBEo2A9kI6
   7UdQPT7N7k7b60fdMlpU4qYjh06S76eve1XAClKDaMOJu/hvmQHVe3grj
   czL5my9wrdy9U6aRsW++ZaCFeS1bTPr1yAMHR2G0ztaXeTS93vOOF0V/W
   kODIudaUG0XE5Pw9X+U1gqluhJ+L6KXZKCpuLpszdU/PG2w2F6PjLuDRV
   qJ5Pcco3RxmKW/UE5FqT1qivOzY6cQlJ7Ib7GskMe6u8qwUSctgtfDf2K
   MqHuARtoqXMhXZtKGVAxvHXAUiChTOwSZ4fIJa766p0yAQd7NolbQxg4C
   Q==;
X-CSE-ConnectionGUID: 1U16j+6TT426ArQVRYXYiw==
X-CSE-MsgGUID: CdLLfXN0TwS1seGkCldp2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49070546"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49070546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 22:30:00 -0800
X-CSE-ConnectionGUID: DewUi9xkQ8iFjiXh8Qdbng==
X-CSE-MsgGUID: OgUW44D2TQWDtk0DXWGYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137077684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 22:29:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZOom-000VB5-2Q;
	Sun, 19 Jan 2025 06:29:56 +0000
Date: Sun, 19 Jan 2025 14:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rickard Andersson <rickard.andersson@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: error:
 cast specifies array type
Message-ID: <202501191405.WYnmdL0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
head:   01099f635a4c68b8574d350a972ba062dd5142e9
commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [7/7] ubi: Implement ioctl for detailed erase counters
config: riscv-randconfig-001-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191405.WYnmdL0U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/mtd/ubi/cdev.c:25:
   drivers/mtd/ubi/cdev.c: In function 'ubi_get_ec_info':
>> arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
      33 |         (__force __typeof__(addr))__untagged_addr_remote(current->mm, __addr);  \
         |         ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/riscv/include/asm/uaccess.h:42:50: note: in expansion of macro 'untagged_addr'
      42 | #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
         |                                                  ^~~~~~~~~~~~~
   drivers/mtd/ubi/cdev.c:854:14: note: in expansion of macro 'access_ok'
     854 |         if (!access_ok(ureq->erase_counters, (end_peb-req.start) * sizeof(int32_t)))
         |              ^~~~~~~~~


vim +33 arch/riscv/include/asm/uaccess.h

2e1743085887ba Samuel Holland 2024-10-16  30  
2e1743085887ba Samuel Holland 2024-10-16  31  #define untagged_addr(addr) ({							\
2e1743085887ba Samuel Holland 2024-10-16  32  	unsigned long __addr = (__force unsigned long)(addr);			\
2e1743085887ba Samuel Holland 2024-10-16 @33  	(__force __typeof__(addr))__untagged_addr_remote(current->mm, __addr);	\
2e1743085887ba Samuel Holland 2024-10-16  34  })
2e1743085887ba Samuel Holland 2024-10-16  35  

:::::: The code at line 33 was first introduced by commit
:::::: 2e1743085887ba3f553c2bb472a75a3ff744b242 riscv: Add support for the tagged address ABI

:::::: TO: Samuel Holland <samuel.holland@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
