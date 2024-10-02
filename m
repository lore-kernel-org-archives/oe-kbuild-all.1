Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE0219408C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854206; cv=none; b=FIBI+ES29hievt2J8Nvi1wvJzgCrtAsOynjjs3pb356NeFmKG1CzfuVbmssqAfg+2rUPIZLFal3yb0RV84PoJAmGagJVWPwYq20mtmkjSq782AF8y48PvNgIoBsIT4I7VQWLH791XoeFC3Vrr+wMbSHptN0YqVf3PXJ73KFjdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854206; c=relaxed/simple;
	bh=5i11oanOulM+lrRsRVREA3F34dwIgn/eYTFJjEjjpoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF79cKqKWyu/whOr6TGw5yCg+FEkPcxRWbsgVf1qt1mNLuXWFreYpWFLGPPN+TNW1UNCjbY6Qm20FH0GcYX1R1B6GOzny6HMzmvnILkTrJ38RSivdXT1f1q45kVXHuQrKVeBZxv1F07Rsk/SbP3V6WmE12/y5r5sJA5xQ3OUwgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcmDv5I5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcmDv5I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727854204; x=1759390204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5i11oanOulM+lrRsRVREA3F34dwIgn/eYTFJjEjjpoM=;
  b=KcmDv5I5Q+Fm4NWYX/ub9sVY2X6KPKyhi+Qh7LjZgladn70ZoDZuoh5k
   ZXRD22ptT8U3SEXlODDLy7syrieIHgCarRfvPYTRr+4MUOOplB8dnTY1J
   pqj3nCki4WeQD7ZM6/G/wrXaL83++G8WeqPY8elGnLJ8OjMY4WUZ66Fa5
   0PiTuT27UBDGmVR/eIPNSJtrt4c7AcAuKMKpiT8geX2Qti46K/lX1/vkB
   ogKzpvDAviei6u2/kgPDAba+lC8XNoqshxb8qRjcIfblIf2ohcomI1KTH
   Ag/SMO3RNFIKaJ0vam7fcFfCBugUCX9gi1pJw7W7Uo56g6NTTbczWR5CO
   A==;
X-CSE-ConnectionGUID: sHgrKw/bQEazxF8QCZ3r9g==
X-CSE-MsgGUID: vQ9423yTSdSxPjlaRENkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37601696"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="37601696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 00:30:03 -0700
X-CSE-ConnectionGUID: ui7CV3/oS0uhyHoQZFIAKw==
X-CSE-MsgGUID: AatAl5GTQrayaOu5ZeRY0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="74726104"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 00:30:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svto8-000RjE-0T;
	Wed, 02 Oct 2024 07:30:00 +0000
Date: Wed, 2 Oct 2024 15:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14346/20658] versioncheck:
 ./drivers/net/wireless/iwl7000/mac80211/parse.c: 934: need linux/version.h
Message-ID: <202410021527.NiBjoXN1-lkp@intel.com>
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
commit: abf11131c93b512ab6a8618710f31dcd678338d5 [14346/20658] CHROMIUM: iwl7000: mac80211: move element parsing to a new file
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410021527.NiBjoXN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021527.NiBjoXN1-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 69: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/math.h: 4 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2321: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 177: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2535: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1244: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3497: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 304: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6595: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2856: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2330: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2602: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3408: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2418: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 557: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 255: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5439: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 735: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/driver-ops.h: 1719: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ethtool.c: 284: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2725: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2485: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 502: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1854: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 8757: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/parse.c: 934: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5551: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1470: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3037: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1302: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2097: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6300: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 4394: need linux/version.h
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
