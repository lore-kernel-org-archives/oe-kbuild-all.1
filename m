Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E8BE49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 00:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734136735; cv=none; b=b3TpW3hj+5oGd1GzdOoZzf2sAMK7HppdQjB1WntCU86E2emUVyPAt9GIa65WKjCVHjEeGCMiEOtt+uGURaPJqcZtXy4JBN0D7zzCpcAa/YOCZ2FRL47bzkcOWZYiyGEczYWhtY4AyTxONPklH68jOCx6cXgoTsLUWX4QhIrojRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734136735; c=relaxed/simple;
	bh=bXuxgqy0VhGJy1o6oRvK8MSeXeoOjrg09G16Bnu/HJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7aCsSWf75wUKClM7wUFr2ZcQUAv1/5tDNxlHfP5Vd3252eyx3k1dkQfSqqB2HeXlOI2T2IVGhw6ODJs5tvVrgQi7jUpKzsxEXOBzbc3m2dXdeWlbApI02nLlDzI91cJOQfPxtEV8LAq87981Sywkk87CU4C7wlV0DSHuRsSf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOyAsrmC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOyAsrmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734136733; x=1765672733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXuxgqy0VhGJy1o6oRvK8MSeXeoOjrg09G16Bnu/HJY=;
  b=OOyAsrmCMyRgLHKIL6SG9TPuOY+SY+2AILqEirT2rdTzW+cdwkaIttKK
   6R+KKgy+ykMhS2/WBVFOJX0JNbGYwN4ZP5NCa2qZCXHcNj8DmM+SlkN6o
   4hCn53IGsPvmWd5tvfYLUcS8q7/RSBG2RPMgIye1+eNHfQE3vfi4Wn+iO
   fGHjYdw+yZWv8U5KJM8VbhNvCrvErTNuEon6j6tjXI1spYDqC6MVbFSJq
   kxoRHXN9mXI3cS18BJ5XjSgo0hAHlmENXNl9//Exz3+SrWbDObBQh673U
   zDV0a8tEXFQK3GcyAn23D4GiAfXmynaYpGcf3ni1yuj04P66Ubto9dz3a
   g==;
X-CSE-ConnectionGUID: 8F5ZFm+XS3qHf/1vVXvSvg==
X-CSE-MsgGUID: zLuk3lwXTJCqLf0E6yFJjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="57083181"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="57083181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 16:38:52 -0800
X-CSE-ConnectionGUID: i5yvPORQT6SDsLA+7YsQrg==
X-CSE-MsgGUID: FXf9IqV8Qyq9KqQJu3VVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="101701547"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2024 16:38:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMGBE-000CZz-2y;
	Sat, 14 Dec 2024 00:38:48 +0000
Date: Sat, 14 Dec 2024 08:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2557/3192] pkey_sighandler_tests.c:166:2:
 warning: indirection of non-volatile null pointer will be deleted, not trap
Message-ID: <202412140850.4TW4YBqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
commit: 47f8fcd254f1a994c8ed16dcb7b6bf905c0af434 [2557/3192] selftests/mm: fix -Warray-bounds warnings in pkey_sighandler_tests
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140850.4TW4YBqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140850.4TW4YBqc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   pkey_sighandler_tests.c:46:15: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
      46 | static inline __always_inline
         |               ^
   /usr/include/sys/cdefs.h:426:26: note: expanded from macro '__always_inline'
     426 | # define __always_inline __inline __attribute__ ((__always_inline__))
         |                          ^
>> pkey_sighandler_tests.c:166:2: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     166 |         *(int *)NULL = 1;
         |         ^~~~~~~~~~~~
   pkey_sighandler_tests.c:166:2: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   pkey_sighandler_tests.c:197:2: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     197 |         *(int *)NULL = 1;
         |         ^~~~~~~~~~~~
   pkey_sighandler_tests.c:197:2: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
