Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A61F03D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629311; cv=none; b=UXhApdKRC5Sy2F2DfUX0bX12mszbHsuU6u8LxsCS0lc1SAgk+3IAVHD6JKQMSyONn+3ZNTTHb/qJP2+GQ8X4PY8Uzk/7+pR6lWOShlIGR00ZykQ2cTaDgYJZhj+SiB/KRb0QunmvrOhLaQfDXkx1BuOYkiJkyeB2ir1u4tCwkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629311; c=relaxed/simple;
	bh=0zGa1rN2hIZOriPxd0/KRNqjiHPqJR+zHa8UhGPavvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSZ3wY1CBy/vNzY+TiH+ewGCjm9v3pynOYS49cO5+ZrI6Fkx4zac1tk9jLVmUJZ7oc1/2Q/p8xOZOfXRXEPG3nTBx5MFGNsXHh9frdiqtl42LSmD7cthE4kW1Oaov7aKWj0/crvGplUST5coDD/q32obnDDS+TuIOoYa0JixAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4ygk0pj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4ygk0pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763629309; x=1795165309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zGa1rN2hIZOriPxd0/KRNqjiHPqJR+zHa8UhGPavvI=;
  b=A4ygk0pj0TING3Zuwa3tVsn54eCllVa2JZzQv2gF4Ru7GvDJOYVSAIFe
   P/GmggfLJBoifEowfhHbShLFFCI/VKbBsw89sV8GFTW6Ndl/2wdQkgq8A
   heH8LEUQxRkmJPhqHDiKt59qWUk3oa3VrDWpWoGwobUjvbr6vgFV/s7W8
   ZBdFtwnHosmzGEppi44eoOFqYbeaBu6zKa9DKW8BMzTpT0YcoCgvnBdx9
   2ZuczwIYUlOp25pM9F/p60fVzjykEVCvdRybLeYIWA01lWWNRFp16J0Nz
   1GFMH4VyIFEfJFdOoGLkf1NgrYnfpkm6XYXhRgPKRYg0jg7oHcGWVG69i
   g==;
X-CSE-ConnectionGUID: /aPeFE34R6Ojae1bUmCqGg==
X-CSE-MsgGUID: sXoR0FTiQdSEggAm5xQJTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77050387"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="77050387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:01:48 -0800
X-CSE-ConnectionGUID: w+Kv1AKjQBe0FVnU6CD7cQ==
X-CSE-MsgGUID: lx3FtMxxTkSWNFR+NxSSGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="214673726"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 01:01:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0Xw-0003nT-0Q;
	Thu, 20 Nov 2025 09:01:44 +0000
Date: Thu, 20 Nov 2025 17:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-6.19.ovl 43/57] fs/overlayfs/dir.c:599:27: error:
 incompatible pointer types passing 'const struct cred *(const struct cred
 *)' to parameter of type 'struct cred *'
Message-ID: <202511201634.e38SpSUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux vfs-6.19.ovl
head:   dd93300969b6b87e330947921579bb32d6b02cc1
commit: ff652575590b634a780d46e6500e88f4e162f7db [43/57] ovl: add ovl_override_creator_creds cred guard
config: hexagon-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201634.e38SpSUL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201634.e38SpSUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201634.e38SpSUL-lkp@intel.com/

All errors (new ones prefixed by >>):

         |   ^
   <scratch space>:87:1: note: expanded from here
      87 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:459:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:87:1: note: expanded from here
      87 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:459:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:83:1: note: expanded from here
      83 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/dir.c:18:
   fs/overlayfs/overlayfs.h:459:1: error: unknown type name 'class_override_creds_t'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:89:1: note: expanded from here
      89 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/dir.c:18:
   fs/overlayfs/overlayfs.h:459:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:94:1: note: expanded from here
      94 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:459:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:80:1: note: expanded from here
      80 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/dir.c:18:
   fs/overlayfs/overlayfs.h:459:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   fs/overlayfs/dir.c:591:2: error: use of undeclared identifier 'class_prepare_creds_t'
     591 |         CLASS(prepare_creds, override_cred)();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~~~~~~~~~~~~
   <scratch space>:145:1: note: expanded from here
     145 | class_prepare_creds_t
         | ^~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/dir.c:592:7: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     592 |         if (!override_cred)
         |              ^~~~~~~~~~~~~
         |              override_creds
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
   fs/overlayfs/dir.c:592:7: warning: address of function 'override_creds' will always evaluate to 'true' [-Wpointer-bool-conversion]
     592 |         if (!override_cred)
         |             ~^~~~~~~~~~~~~
   fs/overlayfs/dir.c:592:7: note: prefix with the address-of operator to silence this warning
     592 |         if (!override_cred)
         |              ^
         |              &
   fs/overlayfs/dir.c:595:2: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     595 |         override_cred->fsuid = inode->i_uid;
         |         ^~~~~~~~~~~~~
         |         override_creds
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
   fs/overlayfs/dir.c:595:15: error: member reference base type 'const struct cred *(const struct cred *)' is not a structure or union
     595 |         override_cred->fsuid = inode->i_uid;
         |         ~~~~~~~~~~~~~^ ~~~~~
   fs/overlayfs/dir.c:596:2: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     596 |         override_cred->fsgid = inode->i_gid;
         |         ^~~~~~~~~~~~~
         |         override_creds
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
   fs/overlayfs/dir.c:596:15: error: member reference base type 'const struct cred *(const struct cred *)' is not a structure or union
     596 |         override_cred->fsgid = inode->i_gid;
         |         ~~~~~~~~~~~~~^ ~~~~~
   fs/overlayfs/dir.c:599:27: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     599 |                                               current->cred, override_cred);
         |                                                              ^~~~~~~~~~~~~
         |                                                              override_creds
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
>> fs/overlayfs/dir.c:599:27: error: incompatible pointer types passing 'const struct cred *(const struct cred *)' to parameter of type 'struct cred *' [-Wincompatible-pointer-types]
     599 |                                               current->cred, override_cred);
         |                                                              ^~~~~~~~~~~~~
   include/linux/security.h:877:22: note: passing argument to parameter 'new' here
     877 |                                                   struct cred *new)
         |                                                                ^
   fs/overlayfs/dir.c:603:36: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     603 |         return override_creds(no_free_ptr(override_cred));
         |                                           ^~~~~~~~~~~~~
         |                                           override_creds
   include/linux/cleanup.h:228:11: note: expanded from macro 'no_free_ptr'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                  ^
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
   fs/overlayfs/dir.c:603:36: error: use of undeclared identifier 'override_cred'; did you mean 'override_creds'?
     603 |         return override_creds(no_free_ptr(override_cred));
         |                                           ^~~~~~~~~~~~~
         |                                           override_creds
   include/linux/cleanup.h:228:77: note: expanded from macro 'no_free_ptr'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                                                                    ^
   include/linux/cleanup.h:217:25: note: expanded from macro '__get_and_null'
     217 |                 __auto_type __ptr = &(p);   \
         |                                       ^
   include/linux/cred.h:173:34: note: 'override_creds' declared here
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                  ^
   fs/overlayfs/dir.c:603:24: error: non-object type 'const struct cred *(const struct cred *)' is not assignable
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:228:62: note: expanded from macro 'no_free_ptr'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:219:10: note: expanded from macro '__get_and_null'
     219 |                 *__ptr = nullvalue;         \
         |                 ~~~~~~ ^
   fs/overlayfs/dir.c:603:24: error: used type 'typeof (override_creds)' (aka 'const struct cred *(const struct cred *)') where arithmetic or pointer type is required
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:228:3: note: expanded from macro 'no_free_ptr'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |          ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/dir.c:660:2: error: 'cleanup' argument is not a function
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^
   include/linux/cleanup.h:294:7: note: expanded from macro 'scoped_class'
     294 |         for (CLASS(_name, var)(args);                           \
         |              ^
   include/linux/cleanup.h:290:34: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                                         ^
   <scratch space>:162:1: note: expanded from here
     162 | class_override_creds_ovl_destructor
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])


vim +599 fs/overlayfs/dir.c

   583	
   584	static const struct cred *ovl_override_creator_creds(struct dentry *dentry, struct inode *inode, umode_t mode)
   585	{
   586		int err;
   587	
   588		if (WARN_ON_ONCE(current->cred != ovl_creds(dentry->d_sb)))
   589			return ERR_PTR(-EINVAL);
   590	
   591		CLASS(prepare_creds, override_cred)();
   592		if (!override_cred)
   593			return ERR_PTR(-ENOMEM);
   594	
   595		override_cred->fsuid = inode->i_uid;
   596		override_cred->fsgid = inode->i_gid;
   597	
   598		err = security_dentry_create_files_as(dentry, mode, &dentry->d_name,
 > 599						      current->cred, override_cred);
   600		if (err)
   601			return ERR_PTR(err);
   602	
   603		return override_creds(no_free_ptr(override_cred));
   604	}
   605	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
