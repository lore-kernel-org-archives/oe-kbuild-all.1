Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAB1E9B3A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172403; cv=none; b=Dzcto24H1sy3jsOEQS73gTI9i4XdY+M6SDscMz7gLBJ0LZf9Aj42DOPLTqK9IX+xczToeNTwvhsG5xae3xVPgpYIjn2PR7rqsuY39MoUPEhoI8DTe066umkGglSFHVqJ/BU8HeNK7KhtZm3I1aIatnmz92Ty26TlqZ0LbRS7ans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172403; c=relaxed/simple;
	bh=eBWzCEIXpqzNEKqXFbOIa51BKZwmC9j3CCr26z96S+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kDiZ1Ez+49fGBVT6i+n0rqKAT1oRUFEoKHcHuOKUhndker9eZPvMLNzmSA4pZdM9Nd5UPm/TuesaZDjJI7Qu1dVqq6hc4G6OftPrt3TVha6wCTut0siKpTH9cFgABo7uF+f94qtsLJmJ6D1jjPVfHg0JAP0OoblWfkxbmgdMisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6MZY63J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6MZY63J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765172401; x=1796708401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBWzCEIXpqzNEKqXFbOIa51BKZwmC9j3CCr26z96S+g=;
  b=l6MZY63J6SfVqqvHjOyh1Vi5efVZ7K6mVrL66L9VFRcfR1CjFqeLYC7n
   NabxKBYjpsTAuWyyY+cjfs48PbMa09vw4UHVpJp7g4p5MjrAP6eXZtrSL
   eWuPgeBhBmNC9nj3CCIplozIWLDOfuqPvGn+my23eYqwop7VkAJVckfBl
   uDezFKuJKYTUClM/fq6xtXSltx0OUd7W9Hu5QpUDBgqdhAIfPbfWihh5z
   uJy7XdQsnE8c/VhckCxdQ3C7Sh5fBj/KOaMmoH5db2LUoeY3fxv/4fuIw
   tkxY0qUpD1ERmy9HaAb4kPVY7SkF1ovRP/FRbqFOWusYUjpBeU5xSq8eV
   w==;
X-CSE-ConnectionGUID: C/qQ9fnvROWVoxCAJlIKWQ==
X-CSE-MsgGUID: LPVmNtMrRkeH2w8B9S5OMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67145658"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67145658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 21:40:00 -0800
X-CSE-ConnectionGUID: 3Qmm1ynbQ4Wm7ipRW62D5A==
X-CSE-MsgGUID: zb1gnYLmSsKKqB8brPbOcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200976000"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Dec 2025 21:39:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSTyV-00000000Jzh-1QMw;
	Mon, 08 Dec 2025 05:39:55 +0000
Date: Mon, 8 Dec 2025 13:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 3/8] include/linux/uuid.h:53:2: error:
 expected ')'
Message-ID: <202512081318.I5Rv7Imo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   161065454fa1b06980ecf2610f26819235eb6ffa
commit: a1a0378deeaf70bc733141e6decd369495938079 [3/8] objtool: Rename C ANNOTATE_REACHABLE to ANNOTATE_REACHABLE_LABEL
config: loongarch-randconfig-r052-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081318.I5Rv7Imo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081318.I5Rv7Imo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081318.I5Rv7Imo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
>> include/linux/uuid.h:53:2: error: expected ')'
      53 |         memcpy(dst, src, sizeof(guid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
   include/linux/uuid.h:58:2: error: expected ')'
      58 |         memcpy(dst, src, sizeof(guid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
   include/linux/uuid.h:63:2: error: expected ')'
      63 |         memcpy(dst, src, sizeof(guid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
   include/linux/uuid.h:78:2: error: expected ')'
      78 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
   include/linux/uuid.h:83:2: error: expected ')'
      83 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   In file included from scripts/mod/devicetable-offsets.c:4:
   In file included from include/linux/mod_devicetable.h:14:
   include/linux/uuid.h:88:2: error: expected ')'
      88 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^
   include/linux/fortify-string.h:690:26: note: expanded from macro 'memcpy'
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^
   include/linux/fortify-string.h:634:2: note: expanded from macro '__fortify_memcpy_chk'
     634 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^
   include/linux/fortify-string.h:24:34: note: expanded from macro 'fortify_warn_once'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^
   include/asm-generic/bug.h:185:29: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   6 errors generated.


vim +53 include/linux/uuid.h

df33767d9fe0ca Christoph Hellwig 2017-05-11  50  
df33767d9fe0ca Christoph Hellwig 2017-05-11  51  static inline void guid_copy(guid_t *dst, const guid_t *src)
df33767d9fe0ca Christoph Hellwig 2017-05-11  52  {
df33767d9fe0ca Christoph Hellwig 2017-05-11 @53  	memcpy(dst, src, sizeof(guid_t));
df33767d9fe0ca Christoph Hellwig 2017-05-11  54  }
df33767d9fe0ca Christoph Hellwig 2017-05-11  55  

:::::: The code at line 53 was first introduced by commit
:::::: df33767d9fe0ca93c606cc9042df05e5045c8158 uuid: hoist helpers uuid_equal() and uuid_copy() from xfs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
