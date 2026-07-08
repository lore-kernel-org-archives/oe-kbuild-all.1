Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1136606A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 00:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471320; cv=none; b=nyPzoqI2YUa1BiHHAqSIfBgBJPAvESMbBwPQZAAEotXThfnRxPx1J6efGVQggn50+4KBmagPcko2//nd/HPdXWBgKghg29bKqXx6dd8AUqC1RTleUdALsDNqUmBDyJ7qiK8h29hVrz9t5Bvb47A//KRLdMagSpw+okJsh6miMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471320; c=relaxed/simple;
	bh=cxMeteKO2kGrR0ZzI05VRnVRK4ew/RalLnytApYlQAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HsJBK6ZhYXTKVynQZw5qiyvT5scYC1YysjxTPenTGgyER/a8YfC+UdGBIytHecGgZ/jWRxl0RHOB3fo4/eMxrw97C4eMxTkTyMEKI0uCZtIaret1NyMfOd84M2pDJKPnKen3ac6SHIjYZhxKXrE7WGUC38+vCOtokcnFbdQtzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJdUbx6p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJdUbx6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783471319; x=1815007319;
  h=date:from:to:cc:subject:message-id;
  bh=cxMeteKO2kGrR0ZzI05VRnVRK4ew/RalLnytApYlQAg=;
  b=MJdUbx6p6BLN1MAMqEMFYy0vZOaIn9ga+xPuQLl3AUp+S/tcthA93LPx
   27EM1plShYJfvVeNyN9RCB8Aw7ggjIro6O0AmJnngCnfV4L6zIJa4Kci0
   0pek7j21Jr7dOFqI2MmFGwOVt6fuObvNLGbB8Lishmqjj73lbt1v1v8GM
   ennS9sh916xvBE6IspnA2htCH/paPXiFCc9K/Kkn19V2e5OICDjiWSNb8
   67e/iYUtTq1URKe1xEm16PK7liXPxtoQFylyPWqdaNVCGXxxTgjIStkI1
   4bq0P59DNHpBfKqt7A8XIBYqI46l80s6JdtIdyOzvCymQ7PzWdneZTPBP
   w==;
X-CSE-ConnectionGUID: LXBUh0wnTTijmZyI3SA/vw==
X-CSE-MsgGUID: DrRNEt0bT9mSllMnIU0+OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83240666"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83240666"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 17:41:58 -0700
X-CSE-ConnectionGUID: B5UHEegsTxa8NMmBCQ/IsA==
X-CSE-MsgGUID: sK8eRDtOSFC9abP72oRQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254213732"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2026 17:41:56 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whGMM-000000002dx-1sJy;
	Wed, 08 Jul 2026 00:41:54 +0000
Date: Wed, 08 Jul 2026 02:41:49 +0200
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/ABI/testing/sysfs-bus-iio:2158:
 WARNING: Inline emphasis start-string without end-string. [docutils]
Message-ID: <202607080218.L2vUY4uO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/iio-ABI-add-attributes-for-altcurrent-channels/20260707-222542
head:   ff135bf478a760bfa4cfa1e3a9aad54ebbc03556
commit: 52f850c53e7ec6dc4b094d19752bea9b2d9ecd36 iio: ABI: add parent entry for iio channels
date:   10 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260708/202607080218.L2vUY4uO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080218.L2vUY4uO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-bus-iio:2158: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
   No bottom table border found.


vim +2158 Documentation/ABI/testing/sysfs-bus-iio

> 2158	What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_parent
  2159	What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_parent
  2160	What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_parent
  2161	What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_parent
  2162	What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_parent
  2163	What:		/sys/bus/iio/devices/iio:deviceX/out_currentY_parent
  2164	What:		/sys/bus/iio/devices/iio:deviceX/in_altcurrentY_parent
  2165	What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_parent
  2166	KernelVersion:	7.2
  2167	Contact:	linux-iio@vger.kernel.org
  2168	Description:
  2169			Read-only attribute containing the sysfs name prefix of the parent
  2170			channel for hierarchical channel relationships (e.g. "out_altvoltage0").
  2171			The prefix uniquely identifies the parent channel and can be used by
  2172			userspace to organize channels in tree-like structures that reflects
  2173			virtual or logical relationships between them.
  2174	
  2175			For example, an IIO device may expose a primary output channel as
  2176			"out_voltage0" together with a set of profile-based or mode-based
  2177			subchannels used to configure or compose the output signal. These
  2178			subchannels may carry common attributes such as frequency, phase, etc.
  2179			They do not represent physical outputs, but rather logical/virtual
  2180			channels grouping configurations that affect the primary output.
  2181			Each subchannel exposes a *_parent attribute reading "out_voltage0",
  2182			allowing userspace to group controls under the output channel they
  2183			belong to rather than treating them as unrelated top-level channels.
  2184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
