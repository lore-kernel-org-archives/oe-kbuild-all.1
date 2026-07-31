Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8E37A498
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530409; cv=none; b=KyDBYeY5WH/NlAWAxZ+8OuFDJ1P1clPnuuUccyPbYP+3cIJ7Cv2U6axFvki1wvk8gsYj8r8WBSoAQ1/bgtu2kRLAfjWk0xQIlecGLVDBekY/jE/eVslt3UmUr7XY06yC/89RrQHWY/dH/UB+cEjJC0nlLM4/QxMxnxmvIyYbrR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530409; c=relaxed/simple;
	bh=dmboL9gEhRIl6I8X1AdpVrVVS3zkw/fKnlbJuQHHK8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RUu+oFbHfR5rjXEqg2Brc1//7VrScluNGx4wM7PVszIt+LWeHIv8GnapP6mcjU5wyNO0XP3+4u2b5LOqOvF4i8ysU+PDrl/yNj3Ae4JwnLtG1K+8w6rEFBK7X5HsyixYfEFXK7S5HT1ILjVpqry4jBkKSHYmRwB5ArF6MXCplsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAVmM69w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAVmM69w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785530408; x=1817066408;
  h=date:from:to:cc:subject:message-id;
  bh=dmboL9gEhRIl6I8X1AdpVrVVS3zkw/fKnlbJuQHHK8E=;
  b=IAVmM69wkh6DEZ49YEuc5hkw4OqGVkeaJ1zX1Aa0MHc/AyLko6ilI/oY
   aHkqHAHhJb3SsaWL3yCarZjLlfnpDw+Sv72y/3/dJkxmK7j0Tslqlfxg9
   /dQFBieTzpexDTJ0hNK/JZ7hy8d7tY34OOEwfeXz6tGvIqtTvinOgdKFK
   Whaa0sTDZClN9h0B+B67uutvPPwi2yomQoklYCXdm5RRr4T1ai5OJP2LH
   FrrxxMg4XwEczXeblT1+wHSiayIi0oxBzSdErg5Pd5pvYP1oh3yinTgSS
   FHfyAmw9eqnyfaoLZAwME89TRXM3ezO56lzdN4QNv5lNwR88iBYBZlJBv
   Q==;
X-CSE-ConnectionGUID: JdlpRWEMRjq+KKKdlZpoKQ==
X-CSE-MsgGUID: LxQuB7SXSzqVsYh/Zc2bbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86021086"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86021086"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:40:08 -0700
X-CSE-ConnectionGUID: +k1wh7rCQsSi6Wj13wEUzw==
X-CSE-MsgGUID: ZvzJ7k2jSuqLn0cJPAKJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="264483821"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 13:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpu1U-000000002Cz-0Olm;
	Fri, 31 Jul 2026 20:40:04 +0000
Date: Sat, 01 Aug 2026 04:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 11199/11507]
 init/initramfs_test.c:580:22: error: implicit declaration of function
 '__override_init_fs'
Message-ID: <202608010401.kTQlgqPH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: da46f0e1053c98355c2d7803ff1cc46617ca81bf [11199/11507] initramfs_test: use test init/exit hooks to override init fs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260801/202608010401.kTQlgqPH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010401.kTQlgqPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010401.kTQlgqPH-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/initramfs_test.c: In function 'initramfs_test_init':
>> init/initramfs_test.c:580:22: error: implicit declaration of function '__override_init_fs' [-Wimplicit-function-declaration]
     580 |         test->priv = __override_init_fs();
         |                      ^~~~~~~~~~~~~~~~~~
>> init/initramfs_test.c:580:20: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     580 |         test->priv = __override_init_fs();
         |                    ^
   init/initramfs_test.c: In function 'initramfs_test_exit':
>> init/initramfs_test.c:586:9: error: implicit declaration of function '__revert_init_fs' [-Wimplicit-function-declaration]
     586 |         __revert_init_fs(test->priv);
         |         ^~~~~~~~~~~~~~~~


vim +/__override_init_fs +580 init/initramfs_test.c

   576	
   577	/* Tests run in a nullfs kthread; always use the init fs for path resolution. */
   578	static int __init initramfs_test_init(struct kunit *test)
   579	{
 > 580		test->priv = __override_init_fs();
   581		return 0;
   582	}
   583	
   584	static void __init initramfs_test_exit(struct kunit *test)
   585	{
 > 586		__revert_init_fs(test->priv);
   587	}
   588	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
