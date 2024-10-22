Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F6198E93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590153; cv=none; b=c+5aqeGmWzmNwuC329R27Qe5OCvwfNomZ8lDoNnHxsx6wd/bOAlymXn2G7V7UGtqUh2U8zbxBi2LOZuXZCvl6BUhC7vapvTJFUxCDNohpf9Sq6t55j16wwVekkOb5Z9UxENpxTgciyCWfILoUuJzLEKQ5AXoBsSLyk9rGUSZni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590153; c=relaxed/simple;
	bh=aI6REviTskds6Vq3gwwfNgoKTyHWyS3XhMMKXYz44RI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBkq3mDYMMhMr2K6WcMoB+twfQkhbQcphc7f6XrTtgBS2YS9aFE/PIIYgr5L/1ewRJlI78nuH3KEZoFhoU2m1PGNvM/N8LdNRSwox+EhwMA4WdlUZhhJAu3iouHUt7gOm9eCI2CayPCzZoYU0nZM4+wQ1yy7MrF/fHnHmxDFxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8vb6/Yl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8vb6/Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729590151; x=1761126151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aI6REviTskds6Vq3gwwfNgoKTyHWyS3XhMMKXYz44RI=;
  b=D8vb6/YlnR9482a/2Ytg2SN1MHdTQeFWjXy9EiVsaPVxU2kKJoF/i7pV
   hgYh72u/cypp1sWxrj8vZmfL1pM7aTEPgJ/zEaMBKuqUl7dE7Jurreqr9
   wF6A1RXR/Iyy8YhLKauWn3OSuedS1FSodlLZmprcPP7NJyzqeg9zKtaZs
   JvMX63AyOGWTZnpNi2fIrlYwJSbhXhcZp2l8hvrJI6maWXwyXZIQqUy3m
   wP0Bfxl01Dmv37sFhcfHiLX4NCvdWQYl+7izapM5BecED5QHuu52cSG1/
   Ys0J0je2egw295Z9nI77LRCyM7shDCeh9bEh+1KYsEKYFUoWAF6twd6sG
   A==;
X-CSE-ConnectionGUID: OlYTmxkfQG6lYdyI0Ijq+Q==
X-CSE-MsgGUID: 07MB3+z6SGuHgc8b4css6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29003704"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29003704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:42:30 -0700
X-CSE-ConnectionGUID: I19jqvx8Tu+At5o7DNf4Iw==
X-CSE-MsgGUID: vLWl0IRYSsW6UNPtarwrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="84892359"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2024 02:42:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3BPG-000TOo-2Y;
	Tue, 22 Oct 2024 09:42:26 +0000
Date: Tue, 22 Oct 2024 17:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-esp32 25/53] versioncheck:
 ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need
 linux/version.h
Message-ID: <202410221711.rs0Wtt41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-esp32
head:   3b01ad2a1f71b72b27fefa08e4bf6acbe1de874f
commit: 23f7320d9509bb531e2adca756611547493bfce2 [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410221711.rs0Wtt41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221711.rs0Wtt41-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h: 11 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: 1596: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_spi.c: 697: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/main.c: 921: need linux/version.h
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
