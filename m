Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5E26E6F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464719; cv=none; b=cjqjvui+5JZpZBg9VZQfOYyx5/oQxcpkJSHqHB5Dr0f+svnrbyfynm3GSXQuLNofzFZ0nU5k/21zaSrGYpnCWoi33vHE4QnVy/0QrmGeEEjV/AlzOe4fRoMvVmZXRkCpgsQ3q5xhf3TbKtNush+6qT58lnQJS4XulRR/oIhF0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464719; c=relaxed/simple;
	bh=zJQjJA5dYcCuQy7EChndvUXoqbaEX5kxVXkT17e5A54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RVoJ6zRlp+C2GM+0vVrD+ABZzeSDJrbQgyDu3yFOF7Wkssnuz8XsrzszLnUbGYKrO/aWZpvPGUSRx5ba4u3kKhstIs5hEx04E+ug1nKOsk8uhdS0NcE9d+CEJvEUD70cKBRPH9DkTzrplzWpSzB48ZruxQKOdWZtxE5VgtwYOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/JjCj0l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/JjCj0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464718; x=1801000718;
  h=date:from:to:cc:subject:message-id;
  bh=zJQjJA5dYcCuQy7EChndvUXoqbaEX5kxVXkT17e5A54=;
  b=N/JjCj0lFyMSzcOdjULVU9Hy9HrXmDZIj6+zHbWytdfI9idmxoAdCefv
   U7t9zYxTUHsZTaMoVBD50sLJP4JWHxy9+P3cx1klvGe+YM1x7mfL2ATuh
   vYIWuaaWP0mlb+qc0nQeEz9e4obZx1HrzaZk6jEhlnYh0UPOzGTKxbm7G
   ivA0BLxRAZGAnb/lCT+aAY4NeefxEE93zfSJkv84CwFX5xGzdBm4J0d1J
   xE/ZYCIU6zF37We/ihGzqEdB0vJxd+poXcDMuhGvE+VUpLiiQtKOllp6C
   EabkKUMXSMGOTZB8HcXzmlA3MF9HUz4j/cGvG/II3RP09nihRPUhmUxvd
   g==;
X-CSE-ConnectionGUID: rUo6JJBbRXeUyyhkchlwYQ==
X-CSE-MsgGUID: ZnI5/3rtTBylJooqK7wg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70545534"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70545534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:58:37 -0800
X-CSE-ConnectionGUID: 7mK/qIvVQNuQT/h3EVwIsw==
X-CSE-MsgGUID: gK3TssbxQYGehMxRy+g+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="239050813"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2026 13:58:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkUbQ-00000000Xj4-3X1V;
	Mon, 26 Jan 2026 21:58:32 +0000
Date: Tue, 27 Jan 2026 05:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 kernel/gki_module.c:35:6: warning: no previous prototype for
 'gki_is_module_protected_symbol'
Message-ID: <202601270525.XmLCyexi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   c35b97a00bbebbd99c3e1980433ff4e45ba40082
commit: 9ab6a242258a9ac17506b74c6ed7332703d536f4 [0/1] ANDROID: GKI: Add module load time protected symbol lookup
config: i386-randconfig-005-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270525.XmLCyexi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270525.XmLCyexi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270525.XmLCyexi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_symbol' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_exported_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_exported_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
