Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7221D54E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114490; cv=none; b=USeS/OsnpQCR5/84apl3QbGh+tIl273C42/odtHbpY8zYIwF7lG/DSDpJA82XW287vj0CBmGm1v/5JXdOzxs6DCE6XTOPjBI4vhdoNJMdXoUR7/b+QYJYJFrZwaslzp6cTQ0P3TYbA4EAx7pvzCmmJTShsf3G+jzsHFOELZgTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114490; c=relaxed/simple;
	bh=IDprnaxoBnokH+dXGHPu/BrWZF3j1nid39+pVUMhP5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdj7Tx8e0kfpl8VO/PGV8Fmr18jRcSkaAvFhGpPA7hinWoPoIayXTCcIaB6Huv/VNpVyyPL/v34m7yWq30pV0YySqB3xfee/JbWAxPWJm9cAX5gtsYzRuVog69Cye8LeGstYn5i4Xv+pNew0bnoJwciauv8NJ6LICpRlD0435pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUyOnZwa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUyOnZwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753114490; x=1784650490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDprnaxoBnokH+dXGHPu/BrWZF3j1nid39+pVUMhP5o=;
  b=aUyOnZwaqLD2wQewqAAMDwK84Auc5mKZOZRXx8YMvR/ZhXApqg3WpRF2
   l4rEyDItEdOTwfDuQKutkUOxLOnleI9gT4HiMNZTFi+gI0T/BGaMiBum/
   bIbV0XH6ghdJ87dmz5AwSuDvfXdBD3+0WXxGXD0p1OkAija2t4sUaD4EE
   rs1tPOpTYgLgb14qGvMukjPSFAi+JE6C2CDJCIK6Yqa1eqvBmMFIMtYa+
   CP3jjKu21vZWPoD7A5HhCUQ26mfMbGVHWnLhVw2L1fDMfV0VHPK8XEEmu
   8MslciknlD2NwxbUd/v0RigeeKU/MCao5CEeDOcK6qHBCp0zgIx1KeZzf
   w==;
X-CSE-ConnectionGUID: b6GUccnLQ4i2eKxalg/gFA==
X-CSE-MsgGUID: E8uRRXByQeiVwwYnDaJydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="58993812"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="58993812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:14:49 -0700
X-CSE-ConnectionGUID: JC7LEfa8R767fVo18uU6/g==
X-CSE-MsgGUID: lKFYQg04QcykILtkxIpjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="163436214"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2025 09:14:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udtA5-000Gxx-2a;
	Mon, 21 Jul 2025 16:14:45 +0000
Date: Tue, 22 Jul 2025 00:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>
Subject: [legion:fix-modules-builtin-modinfo 7/7]
 include/linux/module.h:248:17: error:
 '__mod_device_table__kmod_pinctrl_amlogic_a4__of__aml_pctl_dt_match' aliased
 to undefined symbol 'aml_pctl_dt_match'
Message-ID: <202507220009.8HKbNP16-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git fix-modules-builtin-modinfo
head:   23cf9476592e737075728877cf6437c4042a9051
commit: 23cf9476592e737075728877cf6437c4042a9051 [7/7] modpost: Create modalias for builtin modules
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250722/202507220009.8HKbNP16-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220009.8HKbNP16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/meson/pinctrl-amlogic-a4.c:11:
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1026:25: error: 'aml_pctl_dt_match' undeclared here (not in a function); did you mean 'aml_pctl_of_match'?
    1026 | MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/module.h:256:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     256 | static typeof(name) __mod_device_table(type, name)                      \
         |               ^~~~
   In file included from <command-line>:
>> include/linux/module.h:248:17: error: '__mod_device_table__kmod_pinctrl_amlogic_a4__of__aml_pctl_dt_match' aliased to undefined symbol 'aml_pctl_dt_match'
     248 |         __PASTE(__mod_device_table__,   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/module.h:248:9: note: in expansion of macro '__PASTE'
     248 |         __PASTE(__mod_device_table__,   \
         |         ^~~~~~~
   include/linux/module.h:256:21: note: in expansion of macro '__mod_device_table'
     256 | static typeof(name) __mod_device_table(type, name)                      \
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1026:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    1026 | MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +248 include/linux/module.h

^1da177e4c3f415 Linus Torvalds 2005-04-16  245  
51faf81392f4303 Alexey Gladkov 2025-04-22  246  /* Format: __mod_device_table__kmod_<modname>__<type>__<name> */
51faf81392f4303 Alexey Gladkov 2025-04-22  247  #define __mod_device_table(type, name)	\
51faf81392f4303 Alexey Gladkov 2025-04-22 @248  	__PASTE(__mod_device_table__,	\
51faf81392f4303 Alexey Gladkov 2025-04-22  249  	__PASTE(__KBUILD_MODNAME,	\
51faf81392f4303 Alexey Gladkov 2025-04-22  250  	__PASTE(__,			\
51faf81392f4303 Alexey Gladkov 2025-04-22  251  	__PASTE(type,			\
51faf81392f4303 Alexey Gladkov 2025-04-22  252  	__PASTE(__, name)))))
51faf81392f4303 Alexey Gladkov 2025-04-22  253  

:::::: The code at line 248 was first introduced by commit
:::::: 51faf81392f4303d7c750afd163c018f5fe5f030 modpost: Add modname to mod_device_table alias

:::::: TO: Alexey Gladkov <legion@kernel.org>
:::::: CC: Alexey Gladkov <legion@altlinux.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
