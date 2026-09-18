Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7C2DA756
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717020; cv=none; b=OhGaejnrDdrEvNUqYfjQzqVBLMlEXbqIa8gXOBNbQJYZnqa2aG+EXKuFC1QeNDoOD7iqd/Daiu1Y4k6qaWAakJk637hY1Znp5AJmgiQ0WB3cabtKUBQBuKWQW+T1PPLBjXZ2NfPCRNb92U8C/HLsWwENoQd/GIWj2B6RnXNuynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717020; c=relaxed/simple;
	bh=G7p8Sg3e4GubrTPSSbirur2Jluh0LtCgdWUtmJb66Lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fQZQSJSlx0tSFmy+/yELcuJq/FSe+8/gOYWV2XMKaHRailaLQWgfbkUvaoIJ3kgi7pW96go/7COXUKsjvbShPrJj8+LnP4ATKxshpiCw5hga8SWGouXQX+8bZ17FfzVis88g0r42dPZO0kXnWCZvT+JGVWxFREkHjKVOe65fVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAGbqivr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAGbqivr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789717013; x=1821253013;
  h=date:from:to:cc:subject:message-id;
  bh=G7p8Sg3e4GubrTPSSbirur2Jluh0LtCgdWUtmJb66Lo=;
  b=lAGbqivrH37pziZdSNhYV04rtat+UMy9Sgq81RFZWvL5Vc4qQMkG34n7
   QnKo9vA6504Flu+ISmADi5T5oBn4/0MJdy8UaNEdRnJUiyiN6mIL48SMZ
   4SNS1lV24xGqh1+EdRUtyhFl5zvc2TvMity9O0nP1mOQnbzNrlvGbm29e
   hEGN9HmI8c7mgTVmlmqx2MMgyMAoAN9WKQHFDeVTZE4QeG84ravIMvL3W
   kbInbRSqEbSNxsut8FvRM5xpRpNONq82K2/7HPyuQgGxvb2Na9jTMCuBS
   VT250OXbmK27CaX3k1cmYcfJwB2R5G+llYiRPjZt52fdmhBOYyEqfV5CN
   Q==;
X-CSE-ConnectionGUID: s54uZUi9RL24MaOgM8gG7w==
X-CSE-MsgGUID: Ly0y+tCZRlOpT/R3wl/kxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101551867"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101551867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:36:47 -0700
X-CSE-ConnectionGUID: txSEoU97Qzu8SJzvFovDOw==
X-CSE-MsgGUID: rsqnfsxrQCC7W8qGqX0l6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270950093"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 00:36:45 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7T9A-0000000011I-0gHE;
	Fri, 18 Sep 2026 07:36:36 +0000
Date: Fri, 18 Sep 2026 09:35:51 +0200
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:klp_build_integrate_test 1/1]
 tools/testing/selftests/livepatch/test_patches/klp_test_hash_change.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202609180926.ZFDaHG1j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git klp_build_integrate_test
head:   8cba0be12aaf56c7191096e7b3e8d66d3c82adf3
commit: 8cba0be12aaf56c7191096e7b3e8d66d3c82adf3 [1/1] livepatch: Add tests for klp-build toolchain
config: sparc-randconfig-r2202-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180926.ZFDaHG1j-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180926.ZFDaHG1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180926.ZFDaHG1j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/livepatch/test_patches/klp_test_hash_change.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/livepatch/test_patches/klp_test_module.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/livepatch/test_patches/klp_test_nonstatic_to_static.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/livepatch/test_patches/klp_test_static_to_nonstatic.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/livepatch/test_patches/klp_test_vmlinux.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
