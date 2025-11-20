Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776CF2FB0BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636943; cv=none; b=e1OoOpAy0IxSmJwWQzIfAS/wSH4J56V6DcwPH6MzSrSSz0k28tfsXI6KJ4WMNHxMb3Wuzzj2Mm520rWUBzerAufIg4o9cpY6W7dkjoNRGvh5lYFvdEdhK93EZmyS9a2FJ8zWqThUg/VzuAN8CMMR5Nk+jQ07JW6rR05WO6jJ0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636943; c=relaxed/simple;
	bh=Vqerl3zfG+n1ae51zvdXpSbzBuIzJ15SwTpM8c4O3n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7R0zMWbUugIC7Kln8C1+BThatIGY2lCOA4RV0i2zJzW3j5kvcZ9cicQK+qyjUvvaD9ms82YRevpFrXkES+1e4cTQjMHCA8Y299y+8zu9cweXxeLbnYo8aAuTbPeP3ltRcWuEG2Clh9Wz3uX/NFM8rtduGevw9s+eB2bj5sc15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK9U3DwG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK9U3DwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763636942; x=1795172942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vqerl3zfG+n1ae51zvdXpSbzBuIzJ15SwTpM8c4O3n0=;
  b=GK9U3DwGhHf6NBGs4CgzgWHRRIr9FGN4j6O6o+223TAwDaqsQpW3EOVy
   flwJSUVBRc4mNzyjBG0YwXbix3nwY0ctY6qke2fB3PZDo3x+L59FLL0SO
   rxO3C4skOZsk2BhPZ2rkNGRHGDsKFJ1UEzUwSrYZ1a+01vMfpSBWUGBIi
   eT4zCI9CaRJvsnldImY5xPQ8MZQoyKjMqWu9svuOUMDz8D3EseOWFKKlm
   85eW9rXsPlNn8tiADCVMXerAtZsg6016hMHVxT2CzlAN21y9Wq25TVgsF
   YAnbJlDeOybSLNVkqXM3m8zOjQvxrOHqy2CvXd3qwh5gE8pwLcBDobB4E
   A==;
X-CSE-ConnectionGUID: 4eKU/JNmRZq7EimYpx6KsQ==
X-CSE-MsgGUID: vPMu0UdpQhSxuVxmz63XZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="53273194"
X-IronPort-AV: E=Sophos;i="6.20,317,1758610800"; 
   d="scan'208";a="53273194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 03:09:00 -0800
X-CSE-ConnectionGUID: u6TKo4r0QBaEU6ei9chEgA==
X-CSE-MsgGUID: uc/Wt60EQe6d4ELuHtSzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,317,1758610800"; 
   d="scan'208";a="195645707"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2025 03:08:58 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM2X2-0003st-06;
	Thu, 20 Nov 2025 11:08:56 +0000
Date: Thu, 20 Nov 2025 19:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-6.19.ovl 1/57] fs/overlayfs/overlayfs.h:460:1: error:
 unknown type name 'class_override_creds_t'
Message-ID: <202511201953.BhhW8yMG-lkp@intel.com>
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
commit: 541b457050a7e09c98f9e1a0b5a063037bd8c50e [1/57] ovl: add override_creds cleanup guard extension for overlayfs
config: sparc64-randconfig-r071-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201953.BhhW8yMG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201953.BhhW8yMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201953.BhhW8yMG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:283:9: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^
   <scratch space>:110:1: note: expanded from here
     110 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
   include/linux/cleanup.h:284:52: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^
   <scratch space>:118:1: note: expanded from here
     118 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: call to undeclared function 'class_override_creds_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:120:1: note: expanded from here
     120 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:120:1: note: expanded from here
     120 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:116:1: note: expanded from here
     116 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:122:1: note: expanded from here
     122 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:127:1: note: expanded from here
     127 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:113:1: note: expanded from here
     113 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/super.c:21:
>> fs/overlayfs/overlayfs.h:460:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   6 errors generated.
--
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:283:9: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^
   <scratch space>:133:1: note: expanded from here
     133 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
   include/linux/cleanup.h:284:52: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^
   <scratch space>:141:1: note: expanded from here
     141 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: call to undeclared function 'class_override_creds_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:143:1: note: expanded from here
     143 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:143:1: note: expanded from here
     143 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:139:1: note: expanded from here
     139 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:145:1: note: expanded from here
     145 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:150:1: note: expanded from here
     150 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:136:1: note: expanded from here
     136 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   6 errors generated.
--
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:283:9: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^
   <scratch space>:165:1: note: expanded from here
     165 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
   include/linux/cleanup.h:284:52: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^
   <scratch space>:2:1: note: expanded from here
       2 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: call to undeclared function 'class_override_creds_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:4:1: note: expanded from here
       4 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:4:1: note: expanded from here
       4 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:171:1: note: expanded from here
     171 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:6:1: note: expanded from here
       6 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:11:1: note: expanded from here
      11 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:168:1: note: expanded from here
     168 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/util.c:19:
>> fs/overlayfs/overlayfs.h:460:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   6 errors generated.
--
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:283:9: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^
   <scratch space>:112:1: note: expanded from here
     112 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
   include/linux/cleanup.h:284:52: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^
   <scratch space>:120:1: note: expanded from here
     120 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: call to undeclared function 'class_override_creds_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:122:1: note: expanded from here
     122 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:122:1: note: expanded from here
     122 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:118:1: note: expanded from here
     118 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:124:1: note: expanded from here
     124 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:129:1: note: expanded from here
     129 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:115:1: note: expanded from here
     115 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/inode.c:18:
>> fs/overlayfs/overlayfs.h:460:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   6 errors generated.
--
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:283:9: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^
   <scratch space>:155:1: note: expanded from here
     155 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
   include/linux/cleanup.h:284:52: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^
   <scratch space>:163:1: note: expanded from here
     163 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: call to undeclared function 'class_override_creds_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:165:1: note: expanded from here
     165 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: did you mean 'class_override_creds_ovl_destructor'?
   include/linux/cleanup.h:285:3: note: expanded from macro 'EXTEND_CLASS'
     285 | { class_##_name##_destructor(p); }                                      \
         |   ^
   <scratch space>:165:1: note: expanded from here
     165 | class_override_creds_destructor
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_destructor' declared here
   include/linux/cleanup.h:284:20: note: expanded from macro 'EXTEND_CLASS'
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                    ^
   <scratch space>:161:1: note: expanded from here
     161 | class_override_creds_ovl_destructor
         | ^
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^
   include/linux/cleanup.h:286:15: note: expanded from macro 'EXTEND_CLASS'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^
   <scratch space>:167:1: note: expanded from here
     167 | class_override_creds_t
         | ^
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
   include/linux/cleanup.h:287:3: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |   ^
   <scratch space>:172:1: note: expanded from here
     172 | class_override_creds_t
         | ^
   fs/overlayfs/overlayfs.h:460:1: note: 'class_override_creds_ovl_t' declared here
   include/linux/cleanup.h:283:27: note: expanded from macro 'EXTEND_CLASS'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |                           ^
   <scratch space>:158:1: note: expanded from here
     158 | class_override_creds_ovl_t
         | ^
   In file included from fs/overlayfs/file.c:15:
>> fs/overlayfs/overlayfs.h:460:1: error: incompatible pointer to integer conversion initializing 'class_override_creds_ovl_t' (aka 'int') with an expression of type 'const struct cred *' [-Wint-conversion]
     460 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:21: note: expanded from macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                     ^   ~~~~~
   6 errors generated.
..


vim +/class_override_creds_t +460 fs/overlayfs/overlayfs.h

   459	
 > 460	EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
