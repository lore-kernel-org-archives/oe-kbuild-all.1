Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC038F6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 01:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545940; cv=none; b=Jrl2FJBQ5i4qyBtBF+4HuZ/TJ/QTjWHxNcGX+VG6vPAxZLxFIoeEEC+5CxhsfsY9GRhLenZEMsqDBftfN47io/u2Tf9qtICNwvt1cvq3h4fgvzIlE2Mr1Ri3fN8X0NPNzn2u8swAbrcoZQEPQD8X35jx3lC6GyZJBJXgGPhKlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545940; c=relaxed/simple;
	bh=MDW2rpDfNu5UyEMKKF/+BPOMbUNfa9qgpA7eJ4Ft68g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/lyUrHT+img5k4s17u7zxp6vOOwjE4z/IEkUlzHnhrPK1DHwNDd32cdWV68OshsoA5P+jU4naImcj+sXCeg7BzTmhXQ0+j0yNOaW6zZdNBWceJ736y+KXcsfPmN5yh7OSPVEHgEvN+NdlWVJ4QbfHaiQBaDxrcep98VzW5t9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqvLiBtA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqvLiBtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745545938; x=1777081938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDW2rpDfNu5UyEMKKF/+BPOMbUNfa9qgpA7eJ4Ft68g=;
  b=bqvLiBtAfKqsaXOQC+yuS6IC/UyK5p0LSnKTZtQoH0oECyF0bqSsfuDx
   n3OIFqA1qo0bsojgcMVY6rP17TshOfULjw49ELdblANphEiD+Rld/9Ogg
   QJn2/yNB+SU7sjwhlgmdqHgWe/dhvuHShoYu9Rs0dCcgKKsdTkcU3Kplv
   i9r1a7BKsBdS1SWGC5KqAEEWUd1rzMRd+i/+JI9y7ZJkOVP2jINIksJjp
   Mg382EqObaEcDeUG6gZ4opecGTELuwgOzUhq2S9lSYlaKAKgxA7KQZ1I7
   OOpEwWIFz+9cu0hAZAskybYPRJLaKatpYratuy7Pz/AldTGtf42Tp6EMt
   Q==;
X-CSE-ConnectionGUID: 9T129YovSeG/I0u3MHM+dA==
X-CSE-MsgGUID: jzjS/6bsT7OXCPd5L2X+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50866344"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50866344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 18:52:17 -0700
X-CSE-ConnectionGUID: dN7Ym8/hS4K4iOqPJ7Sh7A==
X-CSE-MsgGUID: TjCzr+uvSraADorMnHB/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137858294"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 18:52:15 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u88Ef-0004il-0z;
	Fri, 25 Apr 2025 01:52:13 +0000
Date: Fri, 25 Apr 2025 09:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/misc/uid_sys_stats.c:508:41: error: lvalue required as unary '&'
 operand
Message-ID: <202504250934.hSCsFNAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b01e71951e32bcf55e252da941d55692247d1a5c
commit: 5f450572c83a34b6fb1936b8330f738e48e1d966 [0/1] ANDROID: uid_sys_stats: add ANDROID_OEM_DATA in struct uid_entry and update_stats_work
config: i386-randconfig-052-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250934.hSCsFNAt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250934.hSCsFNAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250934.hSCsFNAt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/uid_sys_stats.c: In function 'update_stats_workfn':
>> drivers/misc/uid_sys_stats.c:508:41: error: lvalue required as unary '&' operand
     508 |                 UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry),
         |                                         ^
   drivers/misc/uid_sys_stats.c:52:43: note: in definition of macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                           ^~~~~~
   drivers/misc/uid_sys_stats.c:509:25: error: lvalue required as unary '&' operand
     509 |                         &OEM_DATA(usw), NULL, 0);
         |                         ^
   drivers/misc/uid_sys_stats.c:52:51: note: in definition of macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                                   ^~~~~~
   drivers/misc/uid_sys_stats.c: In function 'process_notifier':
   drivers/misc/uid_sys_stats.c:547:55: error: lvalue required as unary '&' operand
     547 |                         UPDATE_ANDROID_OEM_DATA(NULL, &OEM_DATA(usw), task, 1);
         |                                                       ^
   drivers/misc/uid_sys_stats.c:52:51: note: in definition of macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                                   ^~~~~~
   drivers/misc/uid_sys_stats.c:563:33: error: lvalue required as unary '&' operand
     563 |         UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry), NULL, task, 2);
         |                                 ^
   drivers/misc/uid_sys_stats.c:52:43: note: in definition of macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                           ^~~~~~


vim +508 drivers/misc/uid_sys_stats.c

   491	
   492	static void update_stats_workfn(struct work_struct *work)
   493	{
   494		struct update_stats_work *usw, *t;
   495		struct uid_entry *uid_entry;
   496		struct task_entry *task_entry __maybe_unused;
   497		struct llist_node *node;
   498	
   499		node = llist_del_all(&work_usw);
   500		llist_for_each_entry_safe(usw, t, node, node) {
   501			lock_uid(usw->uid);
   502			uid_entry = find_uid_entry(usw->uid);
   503			if (!uid_entry)
   504				goto next;
   505	
   506			uid_entry->utime += usw->utime;
   507			uid_entry->stime += usw->stime;
 > 508			UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry),
   509				&OEM_DATA(usw), NULL, 0);
   510	
   511			__add_uid_io_stats(uid_entry, &usw->ioac, UID_STATE_DEAD_TASKS);
   512	next:
   513			unlock_uid(usw->uid);
   514			kfree(usw);
   515		}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
