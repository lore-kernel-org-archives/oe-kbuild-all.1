Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B5386450
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062647; cv=none; b=B1B3WSoWYSJTWGqPdhpwsucBUuYsmLUirucxl1XJU/Oynuiac5Q/2eDElLfT6aHKK39JuSWfNQnAeruujb9mtHhmQ36iUHYRkiUvcsByl9NL3V1Ah/4qbQCnKJMcOmiYMYe8+l2tY2o5RzFk29oFjHoPTX1+288f4wrp7hnJmz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062647; c=relaxed/simple;
	bh=8M7DUN2ktn6a5nj9IxKRy0Q44WVnBZ/IMSFwuTbfcN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwqwhjh9XAl+ur6QBcSskYTqCRInzCzp18q+xjyOouxd/ivHZjmjvIuu25Ej0M1/J1InhTUl3+BstJIjHb6qC7Nu8wA1SK1us3pDqiH9KY5CpjN+/T5rj5Pak+zA4ish2rCTIFGT5B1y+uJbLvU2wUP1BTDP50FUYMwaw/+I1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4gOW/m2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4gOW/m2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783062644; x=1814598644;
  h=date:from:to:cc:subject:message-id;
  bh=8M7DUN2ktn6a5nj9IxKRy0Q44WVnBZ/IMSFwuTbfcN8=;
  b=c4gOW/m2uqmAODBCyaYEvD+rlUWcuc+GoDoX00tbII854dV0Tdqhl+XI
   XuwN9JBTdgGKyy6hyQD7gZ1LDxkYmee2v7HGbj2V0vbwXjD0WRUcOZRWz
   dM94f9MVcbpdeD3Cp8UA4mijuDW26/OeKeampx6+qKPL4jRnILD1VFAUx
   8IIzE/BUmfjMT3r0d+B2r4e9JfyKXXXp4Wc9tAYMCHtXdjuuXXaK61MqL
   IPMEijQrW1jMr8UwYdklh6eoU9HU9M10vAsEZ8IMqldmCIh5bqjEZ6HhZ
   KMGkfmEABnM0Qtu/TmaTGcvPpVqmJHDYxaiJ80mCd5H8VpIpFBHIBD+wi
   g==;
X-CSE-ConnectionGUID: 8mBlXxJLQRWC7Q1Boxoyrg==
X-CSE-MsgGUID: 2QPicf6vTZC3o68Ee7Z8jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82920735"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82920735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 00:10:43 -0700
X-CSE-ConnectionGUID: 3dbzONjCQEy1GWDvft8Ygg==
X-CSE-MsgGUID: JIoJFEksRMugoHcgn0+Elw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283139757"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2026 00:10:41 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfY2o-000000001RV-154H;
	Fri, 03 Jul 2026 07:10:38 +0000
Date: Fri, 03 Jul 2026 09:09:43 +0200
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202607030916.GmKrmmLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-up-to-date-error/20260703-063422
head:   0b2980db22d2384c1783f5302b968c8aea3abf3b
commit: 0b2980db22d2384c1783f5302b968c8aea3abf3b Input: Add TouchNetix aXiom I2C Touchscreen support
date:   8 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607030916.GmKrmmLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030916.GmKrmmLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:63: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
   No bottom table border found.


vim +63 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom

  > 63	What:		/sys/bus/i2c/devices/xxx/device_state

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
