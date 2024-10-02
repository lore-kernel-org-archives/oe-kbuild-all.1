Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9314A8B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727845493; cv=none; b=fugDJ+3am+NtjNhCD68Q9a6esvQ65hp589NVi5bfa2ErK6+D8W5y+AZ+68+yVeAhFnqSLELVA5ry1SHo6uWz9F6BywBtBu5QgQsch14al1T30ddGYpUXUuCZ0M//VP88n8hDM3e41rK2KDvfdkNXeJwxv4GEBY0TUUHpVE9zJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727845493; c=relaxed/simple;
	bh=q3bSj+qJKScOXKjPhujg8F+/anq82a8I89hG99u8ZVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQhp6lLZj/DwrNwGEsGWH5G34zdCOTpwOyfyrCjNFdd2eR1nPtVANs5sj6LPJB4jWUqFh5VGFwvWI4Ka0GOipEVHvdim1ua/7h0OKMckMSJuQ0+ChZdRcEJvyMdA8w9ogQ0OPFFrtvoMUcT/QI1Ahz4toNH0df4NpREnVG68gIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIN3q0Bh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIN3q0Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727845492; x=1759381492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q3bSj+qJKScOXKjPhujg8F+/anq82a8I89hG99u8ZVA=;
  b=CIN3q0BhrzFMEtg1qgSSy9af9QhXlyXSVlCQP4o0QtWfGYcdhKF2sUpJ
   rFgY2xgt4JgKvsLNP42Y6fcDzHgtDURIp07ImSWHoldGm+n9aXMLfqLS2
   ghlRwf5y4y7uVWnLzdInKLUZx12FWtDEWlE4LF6BwTgvipOlFxGg3UV7W
   hob+MNi8wXT8XMjq9xRYLm0eUxNhzLX2+943L85FInAwPyRERYfP4UhgZ
   4acI3TPy0AhiEe4JnrYINOfWG5DQfzFW7j0IUJAbtq0bXSK6D5L8N3RFb
   IF+2KcJMUP+0hf+5g9+yNGqplihDx3yVHVT1KC8KZiAPNU79HmCOVZ193
   A==;
X-CSE-ConnectionGUID: xGRfzNuwTYqFpwEiaKq0tg==
X-CSE-MsgGUID: y+a69aMASoSNFNEJNasvfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27137271"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27137271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:04:52 -0700
X-CSE-ConnectionGUID: 7Tb6HFkBReaPsHvnHf25KQ==
X-CSE-MsgGUID: PuWr062oRmWZhltGwqJmIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78758834"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Oct 2024 22:04:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svrXc-000RYv-0V;
	Wed, 02 Oct 2024 05:04:48 +0000
Date: Wed, 2 Oct 2024 13:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14344/20658] versioncheck:
 ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h
 not needed.
Message-ID: <202410021228.hi1sIk4E-lkp@intel.com>
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
commit: 78bceee84b6a7e0875d0390d24c0d1ada743a23d [14344/20658] CHROMIUM: iwl7000: Merge remote-tracking branch 'auto/master'
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410021228.hi1sIk4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021228.hi1sIk4E-lkp@intel.com/

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
