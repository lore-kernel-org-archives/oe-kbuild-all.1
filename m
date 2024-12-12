Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495021547F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734047647; cv=none; b=b30EWnUNqu59mG0g5xYY/5qPdEvHTCPt7l0lqprDAU7b1mINd5/4FZEC5ITyhGg0XP01byrWKdt/9EHq4linqF1MUTAvg1bZAc+4MrWbG4vGBzmhwmQyD6kyNiI1WYaMDITIBiufOsGbjCzhlMAIESP2M1PkmPn7UVaOftV1zcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734047647; c=relaxed/simple;
	bh=pP6gBYI6vCEpqGgcb+2FnQDVJ13I/YYIPLcaD7XhDmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIEnwH/ggdmx8iITIas5aWMtMW5R5wEiy9865IA0Oaeaxl3pexsHtyKB0EDJ7A3KTa1xHuVmVbRo/LGuVKOzXKjxG9zF49e6D9J86gnHLPMQcc+f6IIlICPUG9DxGGpiM7alPwRbNSjVQjpZjP1ghhSAGIQedcKLENkQ/A4JkZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1wQN5v4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1wQN5v4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734047646; x=1765583646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pP6gBYI6vCEpqGgcb+2FnQDVJ13I/YYIPLcaD7XhDmM=;
  b=P1wQN5v4GwUsurjaivnrmIbFhTy1ZF9BHoJbViwziDUar9hXOvdWFHlR
   oldpmjK4T2vYjd/Kaa5mQotQKbCP92lRS9cXmXg1ppfSRHOg61A0eJAtY
   /bPfmPoxbnNLPBaZ6sZc0d119Fmd8xnjaki2+IL+rgi6W71DReUKwtmzR
   7R4R81YagnTndG1ZPFCpIK+x0A3b76IZFp4RhYX1cUC4jO415qDXcdJUd
   N2BN5lrE7iq7hYandNJ9PtdAtjMWT8tl/TRFIJTb0wrMzIb3hHeDRq7lD
   sGrETCCKkmJ6k7PQhBKqdZ+/lhiQtTNMyaTHqCgtD5StPgAXA4lAeaHJ+
   g==;
X-CSE-ConnectionGUID: RKmAvAY+S7OgLrqKB7g+GQ==
X-CSE-MsgGUID: TufjPgHYTvair+seoQlkUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34407734"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34407734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:54:05 -0800
X-CSE-ConnectionGUID: MEDDlDLXSA66rWzN6IFJ1w==
X-CSE-MsgGUID: /YH4kSwISaCrntI5Bh8m2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96226931"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2024 15:54:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLt0L-000BUb-1m;
	Thu, 12 Dec 2024 23:54:01 +0000
Date: Fri, 13 Dec 2024 07:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14346/24503] versioncheck:
 ./drivers/net/wireless/iwl7000/mac80211/parse.c: 934: need linux/version.h
Message-ID: <202412130720.Qv8w4xma-lkp@intel.com>
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
commit: abf11131c93b512ab6a8618710f31dcd678338d5 [14346/24503] CHROMIUM: iwl7000: mac80211: move element parsing to a new file
reproduce: (https://download.01.org/0day-ci/archive/20241213/202412130720.Qv8w4xma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130720.Qv8w4xma-lkp@intel.com/

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
