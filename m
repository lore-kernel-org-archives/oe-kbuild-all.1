Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB92236E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778892324; cv=none; b=TK1G3IxeQ0nelW6IGna41XcsnLINR/NbV3px5Su7h1cpCn7xwrmQsvZoAX3yFmtDpgHeRpZDHgI5m/NXgQuF+eL8DY0wjLBNpXp8UK/ltDzfNA7K08sEzJo8wE8YKxsZfviai/mOQYOysWGtss7cuaU4ZjAPBc9sKzpwvJpakCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778892324; c=relaxed/simple;
	bh=IRYM6gs/k4e5g+DZLKyq3LupHwMmC4tfpYyQusz73Uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GhJx2UuFhfnrnTj/7DCAKZ8WjNddJT/TCvqgOPS2MWY/mP72d2+2Pci+zdWQqyW75kxcxV1+60YyQF0JsKvVjipblucUfGzDxdaVH7xbFB4cAgG9FtTASqh3niEvQtgGkcrm4igPv0wNMSIBS4PyI/ZqujPdiCY7mcbE1/B0z3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyH0B2cF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyH0B2cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778892322; x=1810428322;
  h=date:from:to:cc:subject:message-id;
  bh=IRYM6gs/k4e5g+DZLKyq3LupHwMmC4tfpYyQusz73Uc=;
  b=EyH0B2cFMxG52CPViqMuYMtCoYCrPz+/WK4oBw0c71vNqBBQD7qPoW4H
   R5iJXiAa5iBLG3uOxED+EKMlGTqhSkGuDC1AQRK10N0siGMIgIaGIdpCz
   3GDcUKTK4nDnsdjogS896GEusFmuUB8VmyjjJ8f527ajVVe4Sg1NTSNIi
   nyuSIlx/dHj06akHmXjGj1KJJ7xjB5gt+YF8ewYnPiQlaodAsEdYHGhqV
   VbEa0Om6rqAGZWeg/Epkz4VMm7de9GH8qDYEpDM5eiSpM06cD5zaK9+jK
   k7pIr4YK2zYYFcRp2Y0nl9S29+eglPefmavEwWBqHu7Jw4YbwSHMfvb5I
   w==;
X-CSE-ConnectionGUID: pPkZfD46ST+qUwlbWOB0ww==
X-CSE-MsgGUID: 1gfh6m4hSv6REVdtCYciSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97422719"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97422719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 17:45:21 -0700
X-CSE-ConnectionGUID: hJnIiaAtQSy8UsMMAl3GMQ==
X-CSE-MsgGUID: 2GNll55ORfWqnnuBE0hpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="262374177"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 May 2026 17:45:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO39Z-0000000099V-0dCk;
	Sat, 16 May 2026 00:45:17 +0000
Date: Sat, 16 May 2026 02:44:50 +0200
From: kernel test robot <lkp@intel.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 3552/4394] htmldocs:
 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title
 overline too short.
Message-ID: <202605160214.wOV5aa0q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: b4a0774bd7fd859c1d243be0919c8df39eac20c0 [3552/4394] dm: add documentation for dm-inlinecrypt target
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160214.wOV5aa0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160214.wOV5aa0q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title overline too short.
--
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +1 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst

   > 1	========
     2	dm-inlinecrypt
     3	========
     4	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
