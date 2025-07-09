Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0A26E703
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046502; cv=none; b=IsfSDdp0iq9kFtTNFriQVyZpESuLvxJ2hOJqTlYeUmT2ZCJ/vsLZgUQdEr+hD/rQmXE3QkQ8WjG0pvHLtxFjz+waqmG7ohaJdeVR+uNyvhrf9SpOPWi4zMMUjhp/HoA5xNjFIXn3uujwBDYmJ57qsxtV3PTwFW2HCSTNWITuNv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046502; c=relaxed/simple;
	bh=4iWzE28VA4aa6Tt8tPinD9JI5fov/DISRjs2l1l9vPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4L1YKJ1wSZESURPEEuiXQSyZhuvXhiE0Er+j7NHJLSPz/nhoIM4qqAami9I28srhI9utkx53U0w7L/qj4Z850OxnyBprMz5JBYfDvSxI56qxVr7HRalPqEIJL2fj3dFpyo2BnfPyexjhzE27RqcIYwRwlHXlyaQtwHkJrkkeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0k1urIQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0k1urIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752046501; x=1783582501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4iWzE28VA4aa6Tt8tPinD9JI5fov/DISRjs2l1l9vPE=;
  b=O0k1urIQB5cgmcdoxtHl+uX7OQ11esF2l+ICLpNv0EjaionisJpKvxBf
   yikZARbXZGP+O7d6XLj+XjpAoBfQMT7QSeVfP4vxzMBwEBv7UVikOa5Dc
   y3LhEpuDX8l8p3pNrpBfHvFrKOruvagltC0RM/riukdKHbQCinuZDyYoN
   LtG+/pxTVfYN2NYDylI368DIqEDrlGX0B5EWcP2wvjTGCe+sFmRWILwTb
   YrO0X9RL1pguHCzYN7GBfDCLm1UIlmPyl2bvDk6LuWjslIb4e9V7QD2uB
   7TryFDOOB4DK8X0LbUVwztNZcTkpDbzemx+UBTmGFEoY10DSAlKtd1N3q
   A==;
X-CSE-ConnectionGUID: kn73iL3YTSy24TO+4wRfTQ==
X-CSE-MsgGUID: A/VnH3oaS8W/ke9XXS1j8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54226168"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54226168"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 00:34:59 -0700
X-CSE-ConnectionGUID: V/ZfDugCTqKmY/3OpomLJw==
X-CSE-MsgGUID: aMC4EV/jSLGzEnnTK2rSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155439070"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2025 00:34:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZPKR-0003FP-1L;
	Wed, 09 Jul 2025 07:34:55 +0000
Date: Wed, 9 Jul 2025 15:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 9/9]
 mm/kasan/kasan_test.c:412:14: warning: allocation of insufficient size '13'
 for type 'struct <anonymous>' with size '16'
Message-ID: <202507091500.4iS6Xo93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   233cd6b58e4f649fb1ae02fb654ee3c7b0cea9f1
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf [9/9] kasan: move tests to mm/kasan/
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091500.4iS6Xo93-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091500.4iS6Xo93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091500.4iS6Xo93-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/kasan_test.c: In function 'kmalloc_oob_16':
>> mm/kasan/kasan_test.c:412:14: warning: allocation of insufficient size '13' for type 'struct <anonymous>' with size '16' [-Walloc-size]
     412 |         ptr1 = kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL);
         |              ^


vim +412 mm/kasan/kasan_test.c

26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  402  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  403  static void kmalloc_oob_16(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  404  {
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  405  	struct {
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  406  		u64 words[2];
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  407  	} *ptr1, *ptr2;
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  408  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov 2020-11-01  409  	/* This test is specifically crafted for the generic mode. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov 2021-02-24  410  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov 2020-11-01  411  
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13 @412  	ptr1 = kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  413  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  414  
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  415  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  416  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  417  
aaf50b1969d793 lib/test_kasan.c Kees Cook        2022-06-08  418  	OPTIMIZER_HIDE_VAR(ptr1);
aaf50b1969d793 lib/test_kasan.c Kees Cook        2022-06-08  419  	OPTIMIZER_HIDE_VAR(ptr2);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  420  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  421  	kfree(ptr1);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  422  	kfree(ptr2);
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  423  }
3f15801cdc2379 lib/test_kasan.c Andrey Ryabinin  2015-02-13  424  

:::::: The code at line 412 was first introduced by commit
:::::: 3f15801cdc2379ca4bf507f48bffd788f9e508ae lib: add kasan test module

:::::: TO: Andrey Ryabinin <a.ryabinin@samsung.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
