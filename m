Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A811A3A8A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811161; cv=none; b=Qcu6Mo1jCyX+xEIEQE4HCjDbkrUGOPdMp86KpYT9xkt+QRJmSg6E7W9RnpsuVyPm1ueK6MQPrTDtclu883jubKvzplOT6e7k+YBDr2et4lBiOestxbsnzP1iyTZswvWfK59S8YcewfrM2QXf0LyAhRGI1m47mirHv65bWS+knpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811161; c=relaxed/simple;
	bh=3OJ0XiLhYQoRF5k6wHHveqs1GX3BipOSP7tSzft5w9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pp7YgIdJhKKA/UkSoDhN4Cz0IKE2gULQ4Ecw1jco0utj279dYTSDhtlLp7XKN0+YwL3o8ITA3agD7JTBjxAaEvzDddYcZqdQ4wo7Gh6xi2qzrP4yzLUGV1jVpjCXVtFaNydDqnfFegReQ02h1+wxgkaKR5V5OV5yyx3wxhyQnh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqVt/fhn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqVt/fhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727811159; x=1759347159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OJ0XiLhYQoRF5k6wHHveqs1GX3BipOSP7tSzft5w9A=;
  b=WqVt/fhnNnZl+I2eKNIsHyiQN2fB2YPtsqqTAkblgVsxdAfr96LDqOOl
   iuGLvejRVrczQSiNTYZ9RZXpIG4qmS7ca0cQxmWrhTtJAe9gsS+eXyCYq
   iAqOxcM1yNGjF1ss7Ucdv+OW+as0xJscqsno/bY9BGntDb3Dy2yFQmi1t
   QxiZh2fGGuXlVihRh9SlG45cN5FdWuKWC2+OvLSxTwUhWH0l+tQDqq4lg
   V6KNo5HLsiDiSgi3vH3u4rh2P6N2W6VVLck0JIEMdxjyFMsUPRTUdtrVe
   WE4hXKjDMa2e++70lIA1Dn7KylOlE9WFie8HN+S0D3HDe8nvd04pe8zB3
   g==;
X-CSE-ConnectionGUID: cqDn9gSXTD2F0ohPsBxqag==
X-CSE-MsgGUID: HbfR5KPZRGGlIJ/hEJQgvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27122925"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="27122925"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 12:32:39 -0700
X-CSE-ConnectionGUID: 4cziJNwXSMS/3lLRq1dstA==
X-CSE-MsgGUID: jTWqvP+dRmGJDs6bzGdfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74573038"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2024 12:32:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svibr-000R6J-2z;
	Tue, 01 Oct 2024 19:32:35 +0000
Date: Wed, 2 Oct 2024 03:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14028/20658] versioncheck:
 ./drivers/net/wireless/iwl7000/hdrs/config.h: 70: need linux/version.h
Message-ID: <202410020347.GmqhekZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   a81f127d7432274edb73f16568b5b097fca99d2a
commit: 90bd21b536dd67fe8cd25d1a905b81a288d8bbf3 [14028/20658] CHROMIUM: iwl7000: add driver
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410020347.GmqhekZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020347.GmqhekZJ-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/config.h: 70: need linux/version.h
>> ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2148: need linux/version.h
>> ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 169: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2466: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1250: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3450: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 294: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6643: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2806: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2303: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 392: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2571: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3401: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2423: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/backports.c: 468: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 209: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5392: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2040: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 734: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs_netdev.c: 1080: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs_sta.c: 1370: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/driver-ops.h: 1675: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/ethtool.c: 261: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2692: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2463: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/link.c: 493: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/main.c: 1661: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 8301: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5489: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1463: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3023: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/status.c: 1308: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2103: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6312: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/util.c: 5229: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/vht.c: 795: need linux/version.h
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./fs/incfs/integrity.c: 8 linux/version.h not needed.
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
