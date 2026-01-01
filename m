Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C725B311
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767231745; cv=none; b=cH1RGR6pD/IqE1g1vjPzRNOVMdWevIBtHg5ZHoZbxG/BsHl6R5SraJwvk0E+fH75vrlGtuUy5Qo5tpInDpuLpxuyy/PsyzqUpvtZ062CcLd3jBkVyTKBUhA0xjuTHHEXBeBUmXIyyBcOAEjeIo5f2wdfAdd/iaVFttQWU1VBXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767231745; c=relaxed/simple;
	bh=mfWLd4ohdMgm3sb/NAOFZ2+94DcdxEzL1xgsM3SnUcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kz8CPC2g+IJ6apjeIxAPuDTiCm9g/tdQTB1l3V+L6As6ZVg+jSyMhLnWmTT3eEc258r/CZP5Kv9yzFtawpVJIuQgk3VfEUz3d4zScYvDjjf4tyfuft4NJDHuGukKaOui0WEfhHsZmp7LUzTcfTrmFKuu9eOzNTgIZggGjOlFyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6r4sYKU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6r4sYKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767231744; x=1798767744;
  h=date:from:to:cc:subject:message-id;
  bh=mfWLd4ohdMgm3sb/NAOFZ2+94DcdxEzL1xgsM3SnUcU=;
  b=D6r4sYKUseJzU9yTaqCWjtCOow/XXtmiLzQOjFGfNWO5B6jirIiyOIP+
   xk8xzePXAa0TCmtQYotra1FB+CBVnFH3dKdw93FeS+rcuUAwAdEEydt4l
   vgQ06EGuEALgFDkcqUmn5kGBVDLmwRnBkc6MIaLW4l2l9Ra8jPtL+UIoA
   quJFYb/h5y5OsfjUBg+ZCXj8T9iKTjvP/P9ssRy2MISBXxM3irUwcanS6
   NkhnsVdlqanHqfVtq8twm0lImpRR0SkvXd78iIk/QaqqQ0WMOdWCbp9Hu
   u4LT6dMuWqbUWIaGzV7lybCNRfSrS6gE9ivcuLbdme/Tey3mH/An8hDux
   Q==;
X-CSE-ConnectionGUID: EZUtm9eSSmeHe5h7tA85bQ==
X-CSE-MsgGUID: WKC4V556RjGc7f4uKdH7fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68820806"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68820806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 17:42:24 -0800
X-CSE-ConnectionGUID: e3ZOaUEYTKux03jTQWaNZA==
X-CSE-MsgGUID: 7CctOFpAQMm1E008j6zMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201171220"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2025 17:42:21 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb7hj-000000001az-28aT;
	Thu, 01 Jan 2026 01:42:19 +0000
Date: Thu, 01 Jan 2026 09:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
Subject: fs/file_attr.c:263:9: error: unexpected token, expected
 comma
Message-ID: <202601010950.QjCTROwO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9528d5c091c59b408a754a1823cf0942069867cc
commit: 2f952c9e8fe13c6ee15c05189f1f87c1a70b866c fs: split fileattr related helpers into separate file
date:   6 months ago
config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010950.QjCTROwO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/file_attr.c:263:9: error: unexpected token, expected comma
     263 |                 err = put_user(fa.flags, argp);
         |                       ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   fs/file_attr.c:263:9: error: instruction requires a CPU feature not currently enabled
     263 |                 err = put_user(fa.flags, argp);
         |                       ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         swe $2, 0($16)
         |         ^
   fs/file_attr.c:276:8: error: unexpected token, expected comma
     276 |         err = get_user(flags, argp);
         |               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   fs/file_attr.c:276:8: error: instruction requires a CPU feature not currently enabled
     276 |         err = get_user(flags, argp);
         |               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         lwe $20, 0($20)
         |         ^
   4 errors generated.


vim +263 fs/file_attr.c

   255	
   256	int ioctl_getflags(struct file *file, unsigned int __user *argp)
   257	{
   258		struct fileattr fa = { .flags_valid = true }; /* hint only */
   259		int err;
   260	
   261		err = vfs_fileattr_get(file->f_path.dentry, &fa);
   262		if (!err)
 > 263			err = put_user(fa.flags, argp);
   264		return err;
   265	}
   266	EXPORT_SYMBOL(ioctl_getflags);
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
