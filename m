Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2991FA5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 01:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyFE9sPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704418915; x=1735954915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2KNVkZ7Bh9mEBIHnqSWX3LfK4vIXcN9fT1T551CPh8=;
  b=LyFE9sPci2KO7reGHSci7KR8Vv0tRzlyIpoaCl5yNE7SwgWvHZ1Twkmw
   N6b1ebtklEzThms+Blv5oXhnZ89QhxhQGhATRxNpvaxNKs4FvVc0EjoGK
   hdvMc8Y1te8/BAgXtm9zfQAYUpP/AVAaouxhcv4HKeRD05LsI+3Mg73Ig
   J/8JYx6KAzjv+MN+0IQwrEY88T5/jHF7D4VdHylWHl1s1pXCAoLNMEGhu
   paoG1t268ILMMRn3kS/Ts2sdQgmm6UvzH4jyWAelYZZfT9XLlj/WVaysE
   aMPa6zmsYiBK7sR9oywT6WYi/tfiyDPpsSoP8JhL/GLLuwO91+jipOAOX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400168740"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="400168740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 17:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="22357966"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2024 17:41:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLZDW-0000cK-1E;
	Fri, 05 Jan 2024 01:41:50 +0000
Date: Fri, 5 Jan 2024 09:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 19/43] versioncheck:
 ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need
 linux/version.h
Message-ID: <202401050930.imTjcGqY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   e136b1438e7e7838acc6127c3f1a9200356d7248
commit: 4bbe55067a282a1a5f7f6021bd8175a9b233c82d [19/43] drivers/net/wireless/espressif/esp32-ng: initial import
reproduce: (https://download.01.org/0day-ci/archive/20240105/202401050930.imTjcGqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050930.imTjcGqY-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h: 11 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: 1596: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_spi.c: 697: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/main.c: 921: need linux/version.h
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
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
