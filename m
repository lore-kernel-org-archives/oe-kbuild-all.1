Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30725D527
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755225631; cv=none; b=gwvdTQjXkXjgZEkZZhiwi0vCUpEQahQ+D6cjlHbsHriy8A44qVgBY87SWkdfvB7EiYNJmr+clC26Sp7lp7qz2PI7UVTxxE+SH2fyj8ZcXoYL7ex3DWqtimLRK3ht1xevYHeh3cFWVyPgmg2KYtOZz72aRZdn5HuiPVSS9muDGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755225631; c=relaxed/simple;
	bh=0z6+JUj8QTUD1XoM9tH7r6mlwZQGqL4fzEtREB6Mx+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1Dry+cGZjxoVffgx5yocAmiSc9VBcMXOtVwjA7BLQ/gyLBjFtYLILYZGZ2c34FCJXYL6IbmbQdxG6N0rkrVqieRnUMO/2gkYdgR/Ls8TXpdgqPeDRlkKMI9+HaaZSWpUz76wZldEBatUBcX8Fqh3+4EMnyH0305baX5VhOXNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyHJJIrc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyHJJIrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755225629; x=1786761629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0z6+JUj8QTUD1XoM9tH7r6mlwZQGqL4fzEtREB6Mx+Q=;
  b=fyHJJIrcEw2ySuoQaQ1QXFXL6OLWZ05jn/7QpCtsVyk4S7XJX23nN6IA
   NneOeUZLk9nCajlgIMWCDoGhThQn/jPiaArYVHBl6dJF6pE6d7DvEXjm+
   CH20oQlvpEBUlQlprpbMlVvmS/o8kCfsejuAp97V8IqV8o7XrRGOXkcCp
   P3KGeo89vMHrFjZNb6EndOBzStlxa7HaADT17OLV0xT30/s2VuWDM4GYM
   Mn3DBTAl8gmHJDNesLpCJmkU1l8dEIaUy2gafQKrqsinzsPJoJmUEpYIK
   dNKrIoCHjn6Izw5+oBLuuOGNYkO0+D5BnWmS892m3vBbq6sNm0nH+Bn6+
   A==;
X-CSE-ConnectionGUID: Cr0pzS+3RG67mKvmC5GIgg==
X-CSE-MsgGUID: q531ms5pShKx1sKfUefehQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57508225"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57508225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 19:40:29 -0700
X-CSE-ConnectionGUID: nd6DCoZvRVGs0G5xf9B+uw==
X-CSE-MsgGUID: Lmd3jrYSQ52MGL2enRoafA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167165978"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 19:40:27 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umkMj-0000Ox-0k;
	Fri, 15 Aug 2025 02:40:25 +0000
Date: Fri, 15 Aug 2025 04:40:23 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1] kernel/module.c:4789:6: warning:
 no previous prototype for 'android_debug_for_each_module'
Message-ID: <202508150401.T2I4BEVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   7801f8b27aa77497b7759fbac0387747b42485ad
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [0/1] ANDROID: android: Create debug_symbols driver
config: i386-buildonly-randconfig-2003-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150401.T2I4BEVS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150401.T2I4BEVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150401.T2I4BEVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module.c:4789:6: warning: no previous prototype for 'android_debug_for_each_module' [-Wmissing-prototypes]
    4789 | void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:4809:6: warning: no previous prototype for 'module_layout' [-Wmissing-prototypes]
    4809 | void module_layout(struct module *mod,
         |      ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/android_debug_for_each_module +4789 kernel/module.c

  4787	
  4788	#ifdef CONFIG_ANDROID_DEBUG_SYMBOLS
> 4789	void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
  4790		void *data)
  4791	{
  4792		struct module *module;
  4793		preempt_disable();
  4794		list_for_each_entry_rcu(module, &modules, list) {
  4795			if (fn(module->name, module->core_layout.base, data))
  4796				goto out;
  4797		}
  4798	out:
  4799		preempt_enable();
  4800	}
  4801	EXPORT_SYMBOL_NS_GPL(android_debug_for_each_module, MINIDUMP);
  4802	#endif
  4803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
