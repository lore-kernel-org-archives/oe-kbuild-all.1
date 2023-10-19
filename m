Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF4F15AF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/HCr7gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697706065; x=1729242065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k9xpYeMn2dRu3K0ZlBMn5PkKgBXt136jR4+ivl+/WqY=;
  b=E/HCr7gVoYaCBL6HryejFXgtzDloDWm/zbg8JQf4OUMs+56tyTlyG+sc
   IGhWDCTgMgGWdfSMLNSfHyyyHewZ1mKSTU6jx5RfZuUX+2nhBZNobRh7h
   hAvUlqs4BYZ79Rc8pPI4Md/brmCfKgqmO7QOQ+uZpd4LHDz51vwOFyeZv
   8T40ldWrZw2L7NkxXPYLd7x+tk7o+6Hv0PbXVmKNbT/McJ1gkqDOHn6h3
   FWPLUweBcxyXtkR7DAPB5WtuEkAf0kmhJcCD2pRO8tBq2ydIqD69sJjR2
   ligPkwB8D8Ii5GU20idgpS6R1gZvbD9XhszNx+DEBt/nz+7kSgE2jfU+D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7761629"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7761629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 02:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873394209"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="873394209"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2023 02:01:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtOto-0001tn-0g;
	Thu, 19 Oct 2023 09:01:00 +0000
Date: Thu, 19 Oct 2023 17:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 19/43] versioncheck:
 ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need
 linux/version.h
Message-ID: <202310191619.FAJ2CPxR-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191619.FAJ2CPxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191619.FAJ2CPxR-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wrestrict -Warray-bounds -Wformat-overflow -Wformat-truncation -Wstringop-overflow -Wundef -funsigned-char -Wenum-conversion -Werror=return-type W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 KBUILD_MODPOST_WARN=1 ARCH=x86_64 versioncheck
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
