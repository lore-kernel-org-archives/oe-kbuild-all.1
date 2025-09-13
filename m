Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C921CA04
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757762134; cv=none; b=QemSmD2fc7vW1ZzvSSQDi6GEKkHqIvI8ab1i+FCXfVWfgYLqHRVunHVa2mEhSgobPZo5HNxRacxb3Rc5b9qnOehWXtZOy/Ds+kn0CLSCT8uyij7EsuEgvLh6be9FtCRN09hF44gmbVqu+4fgs8ksSPDhhlNPhf4JQwWdLTK+lmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757762134; c=relaxed/simple;
	bh=fBPxHT1qqii+p1KymiaenCvIJET4M3Cps3BIPBUVPmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncpQmgNe0WMT5tjTlEsc4dPSPu0Yo7Yq4h7KUCie/3k9+4JqguZEqsfq15GmxvHoBQeMPXCyyVgmTk1I2CNsGf43gF+CX9ezzK3eVBwLsksbWvBnzkaSTic9VL/086KkNkXcdFSva/RLZOO2unOSVOtkH1LmtCwYgJqIgj8z3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOJjo6qy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOJjo6qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757762133; x=1789298133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBPxHT1qqii+p1KymiaenCvIJET4M3Cps3BIPBUVPmw=;
  b=eOJjo6qyZ5X0WuyYSHiqwe85/pJbGEYH7CAuffHh4wuJV8hd/8hZjr0b
   PSJNRoJYqVOLyXFp0srQDN8eadR+4N6GYAUGSs63cV0CfP48KZMoPJnah
   lrwJs/0SLHmVDAAjwP7P+hu9LOdb2paDOMPQhQjCAUo1KwgS5hlG7T9LK
   PTPJmExFQOeJEznfvoLUfcEKvYWukwUGQ7apAty3xqb/oysffSMR3xUfA
   zU54dVMW8KVXn5DGLAxBlqLOaxwqAyR7wWCCE+3ajLJLEWd9StQMFWwc8
   0EL0cCUUVkk5NyCwL4z2yag5qOe4f2Ri5gcVaXNGOVic+rk5xynrBQA0C
   A==;
X-CSE-ConnectionGUID: gLSwSyu2Qu2gM3B/NE6a2A==
X-CSE-MsgGUID: ARpcZvsYRYaPI1DmwLO96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63910000"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63910000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 04:15:32 -0700
X-CSE-ConnectionGUID: 7vLOcqGOTr2vT0gjS1h2+Q==
X-CSE-MsgGUID: JoZvdP+lSy6osZcNjnAvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173793156"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2025 04:15:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxOE4-000000001bh-3Z1h;
	Sat, 13 Sep 2025 11:15:28 +0000
Date: Sat, 13 Sep 2025 13:15:23 +0200
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.16-esp32 25/55] versioncheck:
 ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need
 linux/version.h
Message-ID: <202509131307.PeqVbmuz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.16-esp32
head:   d1311ff3e71f2288a179d91bbfdcda659324e122
commit: 44b4a40d00a86130e22be50a41df9dea37c3aad7 [25/55] drivers/net/wireless/espressif/esp32-ng: initial import
reproduce: (https://download.01.org/0day-ci/archive/20250913/202509131307.PeqVbmuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131307.PeqVbmuz-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_bt.c: 253: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h: 11 linux/version.h not needed.
>> ./drivers/net/wireless/espressif/esp32-ng/esp_cmd.c: 1596: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/esp_spi.c: 697: need linux/version.h
>> ./drivers/net/wireless/espressif/esp32-ng/main.c: 921: need linux/version.h
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 432: need linux/version.h
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
