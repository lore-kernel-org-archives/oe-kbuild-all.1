Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A1D1FBA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727834385; cv=none; b=dNd+stEDYyI03BUc8BZVeibJ89S5qUF5ZA+sCcIHad7yzwKcFpgynOyU94EvunoTC6hcnDu7F+L5ZJKjiRuZgkxYA+7o8vgOjbvtjGyAUl7IJDMQslg9Xe32Wh0yJmFf0gedCKUmHh/s61uuxY3s1t00SIlLlmCyU2g+VNjGAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727834385; c=relaxed/simple;
	bh=+S3XO9pqpP6Mt9AnA8Ry5YqPyzXmWc8n1UHrJXk5Vjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VA4u9ILuh058+QxaWF3k+3AyHEDs4g7zs4a6zqbGDUUa1vok4EiFkS8Ua1ZLjQXueSPmCglS2O71SKHuBc/D8EWpquowiTYGbe5BYEALPM0fJ61zQLM0vpi2T07g4qWzekiWa60cPB0oKpp50NTgre0ZH4znfg2HIQ6EfAs0lP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPzFmUfH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPzFmUfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727834384; x=1759370384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+S3XO9pqpP6Mt9AnA8Ry5YqPyzXmWc8n1UHrJXk5Vjc=;
  b=WPzFmUfHJA9oRHb5KkUMz3HaARcrAthYotYXvE3QaU35KaWfXq4j1LJL
   JzY3Is0gd+kztf+/jQJcqK8kVt+IAYlab1z+NMxMgIsJyh/74F+Xp0srU
   7R9dfkW9bdBHoTnIzVHXCw9C+DHeJgHTM7QVJySfDdN+UD6khUZZiaNKG
   ZvUPesQ89SbwfJGGZ08Sgrp1KOnpkKkTsoGnc2ga2tgKuvdHPgFVxrTx+
   3DI5lEmsDrpaptYhgX9o/J2CGH2cBvVPnhERFOIKZMKSzsiy8eCeh4tUZ
   5pI4zgxdNgOpYKiwLeefBrFzQlLtnJz2zkDIKQVW//+KnwDmVXH6xH7uv
   Q==;
X-CSE-ConnectionGUID: hpP2SzJzS3a0MnuS5jwt9w==
X-CSE-MsgGUID: H49pGxqASMCbDkPWlcxNbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27129492"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27129492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 18:59:43 -0700
X-CSE-ConnectionGUID: kJtKbd3rTaqhO4HGt4nXdg==
X-CSE-MsgGUID: Teh1Ck3FTqGs+pw2+Qs/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="77891212"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2024 18:59:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svoeR-000RQL-21;
	Wed, 02 Oct 2024 01:59:39 +0000
Date: Wed, 2 Oct 2024 09:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14104/20658] versioncheck:
 ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need
 linux/version.h
Message-ID: <202410020910.O9AvfPKj-lkp@intel.com>
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
commit: d44cdba6b264739181753f6ffe09458cd0082ad6 [14104/20658] CHROMIUM: iwl7000: nvm: parse the VLP/AFC bit from regulatory
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410020910.O9AvfPKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020910.O9AvfPKj-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
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
