Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF11898FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734041991; cv=none; b=BdAc19lKWFwBj8XC6Xr7hRqdz0N4AnpolwRwqNxK5ULFwM3lyU7Vz48MSYh3Z6Nu1qutezxbJvc/ccRVBmaKgXlIo7fxhF1Mk1B0wPMhNvfRsVWon7LlZk1rYxdmt8RDUYOQ56p6dl3QVvdWRWBeB1m/cd+utqmPrAobHYbby+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734041991; c=relaxed/simple;
	bh=mWaGvqtmlw+WR+b8yWRHVYQiVjDNKjh0ae1oZrF/tXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEfX1GXD2wDNn53Czc462d9gaDontlLyvnzpsTi3Bbc8ywIABFUt6zqxlZBEJ2XSgQC+RB/UcZNiwpY0hb+MkdfubJxSm5vi6pjDZI0HJXYsaIUTNYozVRXr0NznxhcQMpRNpQ/xfSdSJWm6/Ro1/qSmNExfte6iJd66p0B6RTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIsAC8Ep; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIsAC8Ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734041989; x=1765577989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWaGvqtmlw+WR+b8yWRHVYQiVjDNKjh0ae1oZrF/tXI=;
  b=aIsAC8Epfu9Hh45EHHcIMJwDPd4SRNn6q8KAUyboWgRIzRodZtY9K3Ua
   bEUFt8A50tZ7vl8QzGv98A3KoOj4H5KfCnVm2fAKR+8FW905pACgiI69n
   R3MCicKGnXaO6xtpHixgzThWwzdJPgHXRfHnyYja7eqb0kU6sYw+ahce1
   zSCcranlkCqjrfkRDabPbd0IJraRU34R6tS630CeamUYs1eNcPSvS2Yo6
   wmxhjooTyUAaOFXjzWR6wLChTbMNfrM0UsZuQO0jlKaSNtmkFCoVCsXfs
   mbTU3dSNCkdHlCrtCr+lDSFqbox8b/KkZWu3RnPsESHAS/1pOn10ooXN7
   A==;
X-CSE-ConnectionGUID: hR+cAo4hTQSkubrolaCATA==
X-CSE-MsgGUID: 22xfU8XIR+qze2gY1ubh7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37330811"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="37330811"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 14:19:48 -0800
X-CSE-ConnectionGUID: JpcQ46L3SU2B9nrXcVZ1dA==
X-CSE-MsgGUID: ty9jChkhQqmErPYxJmljYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96235960"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2024 14:19:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLrX7-000BQT-1j;
	Thu, 12 Dec 2024 22:19:45 +0000
Date: Fri, 13 Dec 2024 06:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14344/24503] versioncheck:
 ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h
 not needed.
Message-ID: <202412130651.VpBr8QOD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1533e63b4dde60f99fb88b41f9016dfe87282aab
commit: 78bceee84b6a7e0875d0390d24c0d1ada743a23d [14344/24503] CHROMIUM: iwl7000: Merge remote-tracking branch 'auto/master'
reproduce: (https://download.01.org/0day-ci/archive/20241213/202412130651.VpBr8QOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130651.VpBr8QOD-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 69: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/linux/math.h: 4 linux/version.h not needed.
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
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2728: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2485: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 502: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1854: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 8757: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5551: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1466: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3037: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1302: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2097: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6300: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 5294: need linux/version.h
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
