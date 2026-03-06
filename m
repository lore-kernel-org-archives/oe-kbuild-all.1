Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8FC38B7C8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799098; cv=none; b=SHksmZhFsnb9CIeclHCSecyuqfR+kIBDNKvvcKKzKAqSJXHJ+NizrlEX3JdSP3vMmQ9WELy+Vd7ejgnwJ7iJTm7IPh2BnccrLhI8ecXZB2YNawJf/BM0p+5s/B90sOuleSEoYNvrNFvItol9+JkdenjvmzVkZ1jFzEfr6G50hCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799098; c=relaxed/simple;
	bh=EVGlJdk1lfGZy7FgjVTQQNB/BTrpw8ZeseLt7GadQgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nijkK8n40HMeHeL9OtnD2m22b2UZi/ThY6X1dYUH1a/CLS2OYlomLeuyJl5RdR0eK2IdwEx5csp9edukVwzIfWZ/zR3ESm2pPL5OMYkaTXr3zqatfypY09Jpqt21Ry5UhfYjVTkMn3NOvfgLyl/QOGkcnmlVBNDYWLcZK8hPo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ka39Q3OI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ka39Q3OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772799097; x=1804335097;
  h=date:from:to:cc:subject:message-id;
  bh=EVGlJdk1lfGZy7FgjVTQQNB/BTrpw8ZeseLt7GadQgE=;
  b=ka39Q3OI2M5JXGq31lIZVnCSnMASZ1r5NVv8cQCPXLce803zTz9HYxvJ
   4VqaTg6Di2PlSiUhj7zu7DTSf0EcbXOeRoY360L4nYnRIOLhBgQy6ZvpI
   7txCbUSgfOxltPpPChJArNQGaa9PnexvalbWcK0miIiHaMKSoP6WwA8uw
   tuprhoyz+ltzu4u+L6pCDX63YlUXSrYEdlU7KdZUD9RChbCJjBwT8nCYY
   6D7ec7/49hGviPhLEOUGovPepuZbq1qAFteGVhI+Ijnoul2DI8npOdM8v
   hWUAGaWKPil5364nWdFaniCa4fiSiQseLEDOtyOxTgZ05uaQDsvPftDYr
   A==;
X-CSE-ConnectionGUID: FfbFUZ0iQveJBcHzDDnRcQ==
X-CSE-MsgGUID: sZl27a0lQC6ZEJkjGRstOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73872927"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73872927"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:11:37 -0800
X-CSE-ConnectionGUID: c2raqjBCRxGd9mX35PT4HQ==
X-CSE-MsgGUID: YaKwEALzSP2NIw4kAPnGGw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 04:11:35 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyU1k-000000000pB-1Csl;
	Fri, 06 Mar 2026 12:11:32 +0000
Date: Fri, 06 Mar 2026 20:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.kthread.nullfs.split 19/24]
 include/linux/mount.h:109:12: error: expected '=', ',', ';', 'asm' or
 '__attribute__' before 'kthread_mntns'
Message-ID: <202603062006.S5wm9IBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.kthread.nullfs.split
head:   e510f1a052643c804811b9ff87f571987ee24477
commit: aca200641ae3560c5471d9ded56c3bb7ea9c5c58 [19/24] fs: add kthread_mntns()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603062006.S5wm9IBS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062006.S5wm9IBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062006.S5wm9IBS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/pnode.c:9:
>> include/linux/mount.h:109:12: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'kthread_mntns'
     109 | int __init kthread_mntns(void);
         |            ^~~~~~~~~~~~~


vim +109 include/linux/mount.h

    99	
   100	extern struct vfsmount *kern_mount(struct file_system_type *);
   101	extern void kern_unmount(struct vfsmount *mnt);
   102	extern int may_umount_tree(struct vfsmount *);
   103	extern int may_umount(struct vfsmount *);
   104	int do_mount(const char *, const char __user *,
   105			     const char *, unsigned long, void *);
   106	extern const struct path *collect_paths(const struct path *, struct path *, unsigned);
   107	extern void drop_collected_paths(const struct path *, const struct path *);
   108	extern void kern_unmount_array(struct vfsmount *mnt[], unsigned int num);
 > 109	int __init kthread_mntns(void);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
