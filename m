Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA25187872
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734038263; cv=none; b=Q/N4zaxNxc+0xyzb9ZLU48eGk6fgIr7D32xeCBT23fuptedSAkEm4EVIoOSt3OqNY+uu/W0sHAl8iIRWLj8CSAxWOts8m3ZH65jDq4r6ky15F2m+pEOvIRzYk1QDNw51ED2TAJ4rsAzcubDTNWorKeyznj8OGC47G+I+2RBEKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734038263; c=relaxed/simple;
	bh=JVHjNsJaCsDt4Cfj+PhxpLYRi4uwXnrBaC0u2uBjXHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4JTfL51KQXvVADCjkjoVUEVPXeI1hzWGoc0Uv3/hUHKHogVV/4utFJ1RVkVTgRiaOesj0OXXAUFDySfEogu8tPMUyDgoxrYFo2BVYmekk+kCAIIryeUsV8l51Flpu/NHN2A8OZKEydBNC6LyM+0ZyWf1fCuzLzNDcqIWIdVVhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmlKX9ih; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmlKX9ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734038262; x=1765574262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVHjNsJaCsDt4Cfj+PhxpLYRi4uwXnrBaC0u2uBjXHY=;
  b=JmlKX9ih1go5oHjG0xJ2rYVhNaRnkCUE7nreZWUW2tOEvWk2sO/jftEX
   jnRxDtZkzUu7uG2PQbnNlIO9ZB7mM6MdyFSwNPujTqd1klTfLtmbt5Ul/
   ABWe6KQ0QNjbu4J50rf6oe2EcYOBYeN6uIOTLMeIVeAwWpny9mTFbe5/1
   BjEyzBpoUDwj2KjIVPyiqfeTDzfxcIbW/RO3JggfCsqshyLxn2opcjtd7
   5ccY9jo/KLx/uIPgOJtWs40Ef1jR4G42GNLySPmY2b34cTB34IvhOWLrf
   b6yXWIBOb91LXmLZgJ1UY3C5GBr8EChjekp+fKn8ojM7r+bnBsyYK4SlI
   A==;
X-CSE-ConnectionGUID: 2JX0HYNWS0mMrTnQEFvQaw==
X-CSE-MsgGUID: kQ4MuuexTyK5gI8xg4986g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="56950608"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="56950608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 13:17:41 -0800
X-CSE-ConnectionGUID: PJz0UgNxTE6ydX9b3esYSQ==
X-CSE-MsgGUID: UqfM+3hmQTeiVL/lU3qhQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96780109"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 13:17:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLqYz-000BNV-1p;
	Thu, 12 Dec 2024 21:17:37 +0000
Date: Fri, 13 Dec 2024 05:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14104/24503] versioncheck:
 ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need
 linux/version.h
Message-ID: <202412130525.mbcw7PVL-lkp@intel.com>
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
commit: d44cdba6b264739181753f6ffe09458cd0082ad6 [14104/24503] CHROMIUM: iwl7000: nvm: parse the VLP/AFC bit from regulatory
reproduce: (https://download.01.org/0day-ci/archive/20241213/202412130525.mbcw7PVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130525.mbcw7PVL-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 70: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2181: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 173: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2518: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1250: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3437: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 289: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6663: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2813: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2292: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 392: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2571: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3410: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2423: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 470: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 255: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5392: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2040: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 735: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs_netdev.c: 1080: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs_sta.c: 1370: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/driver-ops.h: 1675: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ethtool.c: 261: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2692: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2463: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 493: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1661: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 8320: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5483: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1506: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3037: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1307: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2103: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6312: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 5229: need linux/version.h
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
