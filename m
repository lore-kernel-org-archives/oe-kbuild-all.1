Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A13B1025
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662706; cv=none; b=CvTB1XC9PsUqy8g686DyI2OmPM7fFEm7h4diqCTW7L4gJBA5MNImWd41Gt1E+6ATwFn9elOJ3MxTdhmYBujCqDKGcSS1KfhPR6cau6bPSlnJtOEcUeIDBwUzaA8hxX/RxBN/lPbW4TfyvtAk9K08u/dpNYVMwXEqqIYiW65wBWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662706; c=relaxed/simple;
	bh=N5hnD2M4N0BUzMs0Wp/UJ3iOx94XEarsegnMo3+J3Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CQnR3jOiHPyRTmFfNkCgUucsV8Efnsu+aGXLO3vgU84GDqJvMlOOrpOicU9D/1V4HdRZX0jDj6BButC+Nm8FDohQEH5admdwfPKijfXdb6Lmp+H+miVM4n2TosaFc1yeMigj6l5UarzAc8sGpvSEv6qU/faWfzF3TuxdlbVN4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSFu9Mtg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSFu9Mtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786662705; x=1818198705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5hnD2M4N0BUzMs0Wp/UJ3iOx94XEarsegnMo3+J3Co=;
  b=dSFu9Mtg+D7t37f1hLbPX9kEYN9nyINYIS4Cf2ORz8sQqkgeDIm7DjHe
   2ifPuXSJU/L+dKJm+WElmF50ZzUC3JBEHMIvKtb+yZR5aJyWZ9E0NevXo
   RoAqLCn/w/8akUWS9OHpvwOjqIwe/5seh92Zb/MghjG/v4D+W/IhdKk+3
   k9P0cjjyY0LEwJzXp9ipggPbMn46gnIMGFfgGQw7XMPJCSkCyO5zIfXjv
   yCHmYDVZl5XuIXA+8xsECg08amAkz7tZDLvUvz/JjjpkxADDVa/sa+61j
   O4DiOSqvDBoI+IsuTtbNnCZCMWKCd1m5hLX4bJfvvGMogwUKnWXpHhEQN
   w==;
X-CSE-ConnectionGUID: MMsTDgYYSjeqP3sDkkhbpw==
X-CSE-MsgGUID: GyEK6qqVTbWHCfwu+AA1og==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87464130"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87464130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 16:11:44 -0700
X-CSE-ConnectionGUID: oVsO0JN9QKWw+XV17sLfjw==
X-CSE-MsgGUID: JI8WB32BTg6ejEjTEw5ddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="287546985"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2026 16:11:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wueaJ-00000000Wvm-43lz;
	Thu, 13 Aug 2026 23:11:39 +0000
Date: Fri, 14 Aug 2026 07:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-apply-fixed 43/60] lib/dynamic_debug.c:88:
 Warning: missing closing `"'
Message-ID: <202608140716.I6IqVJu5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-apply-fixed
head:   f34250f02483802d911ebbe4ebd4e5c98e3fa7b1
commit: 9f5cf4c1a9478dc71bb8bda5d5f48e587cf81f17 [43/60] dyndbg: add +c flag to count advantage of classmaps for DRM
config: s390-randconfig-r052-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140716.I6IqVJu5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140716.I6IqVJu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140716.I6IqVJu5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: Assembler messages:
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
>> lib/dynamic_debug.c:88: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'
   lib/dynamic_debug.c:93: Warning: missing closing `"'


vim +88 lib/dynamic_debug.c

9f5cf4c1a9478d Jim Cromie  2026-04-15  82  
22640017eab569 Jim Cromie  2025-11-18  83  static bool ddebug_class_map_in_range(const int class_id,
22640017eab569 Jim Cromie  2025-11-18  84  				      const struct ddebug_class_map *map);
22640017eab569 Jim Cromie  2025-11-18  85  static bool ddebug_class_user_in_range(const int class_id,
22640017eab569 Jim Cromie  2025-11-18  86  				       const struct ddebug_class_user *user);
e9d376f0fa66bd Jason Baron 2009-02-05  87  static DEFINE_MUTEX(ddebug_lock);
e9d376f0fa66bd Jason Baron 2009-02-05 @88  static LIST_HEAD(ddebug_tables);
f657fd21e16e3a Joe Perches 2012-12-05  89  static int verbose;
74df138d508eb3 Jim Cromie  2011-12-19  90  module_param(verbose, int, 0644);
09ee10ff804ec4 Jim Cromie  2021-10-19  91  MODULE_PARM_DESC(verbose, " dynamic_debug/control processing "
09ee10ff804ec4 Jim Cromie  2021-10-19  92  		 "( 0 = off (default), 1 = module add/rm, 2 = >control summary, 3 = parsing, 4 = per-site changes)");
e9d376f0fa66bd Jason Baron 2009-02-05  93  

:::::: The code at line 88 was first introduced by commit
:::::: e9d376f0fa66bd630fe27403669c6ae6c22a868f dynamic debug: combine dprintk and dynamic printk

:::::: TO: Jason Baron <jbaron@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
