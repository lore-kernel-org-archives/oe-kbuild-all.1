Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE3369960
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882565; cv=none; b=Hx79ZAABYA/+W0fnuT+euYm1gYKqprsKNg5/g24uy/mFoTJofrquB1FXw5HLEyU8qnB6HHwCcDDvrqePuZpusDqYvWdnHBSbK5RXjB/A3BvVCNqr6iDGgFFCqhBNQL3TskXnDhkXrsYBRD6B6r5UvgX3TtheAiTQ79L1obiHLZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882565; c=relaxed/simple;
	bh=Z7z0jIBrfwPsTRvc359YlODnEv8zxrOoGI6oPJXnKfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmQr5bm0aXD0PilROgZP6nrMF31YeRrdH1WKlA/Fuxjtnt0tqv2+e6OW3K6NIzplOFyv0cxuyrhRyVZEn7ZNsceyaqdrVQ9XWOzE2XVzduA+ckOwSzHhV3vHYP8De7zMGp3Rc83sn7qv1PnBzWA4sauHMWrsOQ/oSG2uUe4HbFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW/VuR/n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW/VuR/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762882564; x=1794418564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7z0jIBrfwPsTRvc359YlODnEv8zxrOoGI6oPJXnKfw=;
  b=gW/VuR/n0uGYtDXwQ2JlPTK33BOKDH1aVdPAtTE2DDXKmnqxjcxPPzE/
   ofcNo1lOAhSXMrXenvuCk5W7vmud01vD0oNt8XvCy9lXQiLEuMqTnpqXk
   zYKOMp6KZVD8dv8Oa6sYgi+TsY87P1lHoEr2SIS3MV0uA9buj+aFutL+r
   Hr5OORxzhPDVk/mksoZ39C0RpU6+oIseBbkyIksIsuyerwNhYX1D6fbS5
   i/KmMKnQBi2t3l5wOAL6hf+VE2GAvYNhURgL2zZ8yUPPrRqeoq+x3SuT/
   l5wb2V5zO9F7Z2dVQGg+eD2aA3Ei13nKN5tMUYbsjBnBoIWTJEvCJcLb8
   g==;
X-CSE-ConnectionGUID: 9Qp5gmP7RoKLMew9PFXrhg==
X-CSE-MsgGUID: KJgvQnlbTBif7UCwSyHi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68797923"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="68797923"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 09:36:03 -0800
X-CSE-ConnectionGUID: ik2LA5FbRqiUUuxnHcGyDw==
X-CSE-MsgGUID: xj1IegX6T5G2gztP/SBUZw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2025 09:36:02 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIsHf-0003Qt-2j;
	Tue, 11 Nov 2025 17:35:59 +0000
Date: Wed, 12 Nov 2025 01:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/2] kernel/module.c:643:2: error:
 implicit declaration of function 'module_assert_mutex'
Message-ID: <202511120150.06MX9Nxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7a94817e9c9a8a92d1f149fa6333c80b6979c711
commit: 49d5970ee4529fa67b5a5bf273d82a977b363c99 [0/2] UPSTREAM: kallsyms: refactor {,module_}kallsyms_on_each_symbol
config: x86_64-randconfig-072-20251111 (https://download.01.org/0day-ci/archive/20251112/202511120150.06MX9Nxt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120150.06MX9Nxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120150.06MX9Nxt-lkp@intel.com/

Note: the android-common/android12-5.10 HEAD 7a94817e9c9a8a92d1f149fa6333c80b6979c711 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/module.c:12:
   In file included from include/linux/moduleloader.h:6:
   In file included from include/linux/module.h:16:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1163:6: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1163 |         int nid;
         |             ^
>> kernel/module.c:643:2: error: implicit declaration of function 'module_assert_mutex' [-Werror,-Wimplicit-function-declaration]
     643 |         module_assert_mutex();
         |         ^
   1 warning and 1 error generated.


vim +/module_assert_mutex +643 kernel/module.c

0d21b0e3477395 Rusty Russell  2013-01-12  640  
0d21b0e3477395 Rusty Russell  2013-01-12  641  struct module *find_module(const char *name)
0d21b0e3477395 Rusty Russell  2013-01-12  642  {
fe0d34d242fa1e Rusty Russell  2015-07-29 @643  	module_assert_mutex();
4f6de4d51f4a3a Mathias Krause 2013-07-02  644  	return find_module_all(name, strlen(name), false);
0d21b0e3477395 Rusty Russell  2013-01-12  645  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  646  

:::::: The code at line 643 was first introduced by commit
:::::: fe0d34d242fa1e0dec059e774d146a705420bc9a module: weaken locking assertion for oops path.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
