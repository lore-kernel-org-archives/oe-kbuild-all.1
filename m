Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CBD349AF9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885055; cv=none; b=tzHBDc/mKQDyxtdyyXRcjeIEH+3ikFDktF6p1ZEfY9e3+aogjNb++1I7jz/Ywt4F4+NN4Yo7Qp7nQt6zQP20FwG5YZBFc2XHkqdahjzfVCuPXHJDC0qMBxEyJshmkAfUGkH8TVDiFpMW+RpSOgEExwjxHhZR4GDTX0C6QjtwHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885055; c=relaxed/simple;
	bh=bEUtuzg/HJMugeLpdZwkZhBPJJZM/mIjQu4dSdyGCww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bFNv+v9XDWR+DUS0VyfhCnhj6t2FrmLv1PdyZ6vnTBrdVBf4/YQD437cX3wSI0em06go4nbxVPbciRrpzxgzXAjxx6x3Eja0dEFKANSVkgqyF2w13/F3SvAMT97ZM3MSATkZh3X83xKT1BFOMkJk13DtHLupbrZn84f7VyRoUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc+FbSHs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc+FbSHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777885054; x=1809421054;
  h=date:from:to:cc:subject:message-id;
  bh=bEUtuzg/HJMugeLpdZwkZhBPJJZM/mIjQu4dSdyGCww=;
  b=Kc+FbSHsIM20gnTq3ADe8FCeUW0yAfD8eO8uhbRBZrevxtX5ZE7DjkDP
   iOvJSyRX3i6DufXlN8hVIMrrywwGnhT+2bjq5HGzB259Ln1aqZQs49JVf
   bU0WT+GYxMUrqh8QBlGYmIQo4sH9mKhcio+ZHDtyqa+kYT01Fahq3Qixk
   9L1jh7XwpzodWNOgEIH590f0muof4Y58qtAJgYHxjxtQZJNJSz47pdEVh
   0nZ9YNXAX7YkfFQ66H/KUlqn4htjCHRN+gB/NT0hQMYcpZcWp+fQ8EUqD
   RQ7tuKJZQT0mRRmSnvdjNVAHjpL41rWw/M93VpujWneZG/QvVbwoOcrPm
   Q==;
X-CSE-ConnectionGUID: TtcShkBvR2OdKoj9oEiOnw==
X-CSE-MsgGUID: lQUUTYqYTe6XTfg0DLPS0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82350840"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82350840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:57:34 -0700
X-CSE-ConnectionGUID: WTvQcTosRAanbY/0x6myGg==
X-CSE-MsgGUID: aKiAhSfeSY6ja206pSOcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240444642"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 May 2026 01:57:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJp7K-000000005nN-1EVC;
	Mon, 04 May 2026 08:57:30 +0000
Date: Mon, 04 May 2026 10:57:17 +0200
From: kernel test robot <lkp@intel.com>
To: Felipe Matarazzo <felipemps@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/admin-guide/reporting-issues.rst:1390: WARNING: Title underline
 too short.
Message-ID: <202605041002.NG14fe8J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Felipe-Matarazzo/docs-fix-typos-in-reporting-issues-rst/20260504-100627
head:   87c6043bc64dbd3613715bed7671c5b8e586a71e
commit: 87c6043bc64dbd3613715bed7671c5b8e586a71e docs: fix typos in reporting-issues.rst
date:   7 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260504/202605041002.NG14fe8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041002.NG14fe8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/admin-guide/reporting-issues.rst:1390: WARNING: Title underline too short.


vim +1390 Documentation/admin-guide/reporting-issues.rst

3e544d72dfc8bb Thorsten Leemhuis 2020-12-04  1388  
87c6043bc64dbd Felipe Matarazzo  2026-05-03  1389  Inquiries and testing requests
3e544d72dfc8bb Thorsten Leemhuis 2020-12-04 @1390  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3e544d72dfc8bb Thorsten Leemhuis 2020-12-04  1391  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
