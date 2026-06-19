Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9104369A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jun 2026 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846253; cv=none; b=Rfv1x3YmsNHo7tVSRQzQQyczYe/MiWTVNfOy8194HROU3AtFxJfnWaStbD5xWWXeDYuVOpfNxyBD2jt/eiPtz1p5j4Efzmt2mue6a+nc1rPOrxU2THdr+Tzh7PUagI28ho7bddP2EQiZdNrnnG78T2AJRi7Nqq77zfv/Pr56XLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846253; c=relaxed/simple;
	bh=kJbUi83wmC5H9tkkUrITIOScWYwAB3AD8Pok0867ssU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NlJRi45rcIXO8vAgLQO2HA5UWVaZkzh/p1N8bjvn+Fdy4RY90I7nOCAZIUxKRZNVbgWPjkqWRDE831aZIelo7N9SeSpgpsQVRN2o63VaYhybOnf5LRijhMA6V0Q8E45GZTRl0mYfjEWcLpUOWOwR+NL1NVQICzd2hIMEyfIphx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZdegbDk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZdegbDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781846250; x=1813382250;
  h=date:from:to:cc:subject:message-id;
  bh=kJbUi83wmC5H9tkkUrITIOScWYwAB3AD8Pok0867ssU=;
  b=TZdegbDkQHvKoz7uu2XQdizIOskzcLhZwVaG4iLbxJyetPHEiM8iXTai
   7PqMVipXriwm6yzo+SB+V46DsBRHSYJpefXJSU0o2feJXORSRh3MhfgfJ
   qjA4a55BNfdR37EtCBUQAmxZyLMw/C41XwT1FL+ehXO62ipHovmKHJCyZ
   kqtpftMxR3Gi6J5L0alV9JDppC8O/u/w2bt6vITbLfPgclHFjea9umI3X
   564t7yEXJUa2CnJkBO5a1paswEU2H0voEY6OObLrERz7rgDri5wfMbyrF
   /PiFZYGyYXrvrHK+jmPIxUJAtEcOLF7enaJmkajrZVfaj1OA7AfOdt3Ql
   A==;
X-CSE-ConnectionGUID: 3szxmCJKS3GxFCXjdwzwOQ==
X-CSE-MsgGUID: CV4tVIVKTCCVyWO/bTRKCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82586089"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="82586089"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 22:17:30 -0700
X-CSE-ConnectionGUID: iA50ZsOfTmeKr0wVqSxxsQ==
X-CSE-MsgGUID: Y7BauSJrSIajuHXantQhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="244200555"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jun 2026 22:17:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waRba-000000005eT-207m;
	Fri, 19 Jun 2026 05:17:26 +0000
Date: Fri, 19 Jun 2026 07:16:28 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 52/55]
 htmldocs: Documentation/ABI/testing/sysfs-bus-dax:184: WARNING: Definition
 list ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202606190744.9fwTmXa8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   b20d77118eedcaee86ecfc4a7ecd4285c2762231
commit: e9dd3c30fc0be8eda22f834894fcfe47c5cab4fc [52/55] Documentation/ABI: document anondax private-node sysfs interface
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260619/202606190744.9fwTmXa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606190744.9fwTmXa8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-bus-dax:184: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-bus-dax:184: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-bus-dax:184: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/kref:328: ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)


vim +184 Documentation/ABI/testing/sysfs-bus-dax

 > 184	What:		/sys/bus/dax/devices/daxX.Y/reclaim
   185	What:		/sys/bus/dax/devices/daxX.Y/mempolicy
   186	What:		/sys/bus/dax/devices/daxX.Y/hotunplug
   187	What:		/sys/bus/dax/devices/daxX.Y/tiering
   188	What:		/sys/bus/dax/devices/daxX.Y/ltpin
   189	What:		/sys/bus/dax/devices/daxX.Y/user_migrate
   190	Date:		January, 2026
   191	KernelVersion:	v6.21
   192	Contact:	nvdimm@lists.linux.dev
   193	Description:
   194			(RW) anondax only.  Per-service opt-ins (booleans) recorded on
   195			the device and applied to its private node at hotplug, selecting
   196			which mm services may act on the node's memory.  A private node
   197			opts out of everything by default; each toggle relaxes one
   198			service:
   199	
   200			  reclaim		allow reclaim of the node's folios, by the mm
   201						and by userspace MADV_COLD/PAGEOUT/FREE
   202			  mempolicy		allow userspace placement policy
   203						(mbind()/set_mempolicy()/home_node) onto the node
   204			  hotunplug		allow hot-unplug via migration
   205			  tiering		allow kernel access-aware migration: demotion
   206						target, NUMA balancing, and DAMON migration
   207			  ltpin			allow FOLL_LONGTERM GUP pins
   208			  user_migrate		allow userspace move_pages() to/from the node
   209	
   210			Writable only while the device is "unplugged" (-EBUSY otherwise).
   211			Dependencies between opt-ins (tiering requires reclaim) are
   212			validated when the device is hotplugged, not
   213			at write time: an inconsistent combination is accepted by the
   214			write but the subsequent hotplug then fails.
   215			See Documentation/mm/numa_private_nodes.rst.
   216	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
