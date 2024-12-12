Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494D6F307
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013788; cv=none; b=s6TjKk73NKJG78OuPhPgR8hS4AycfHc7bK/xs61Z88C1raSJgKH/6mkcfQA1SAv7DpE0vtINdfMnw5BTo07Q5h43Ikkk+WThsgpBFYea9ZxhfuZhwn3zP1PgRNSO7O56DkGbDD+Jc4tzrLGPx7m3XVseJYf5301eKeDxjSvUP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013788; c=relaxed/simple;
	bh=GBynYVlWNbOclZQfdx4588QO8Ult+W2d8AT7PIWYCZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DM5yNRBicuAsLknB1nCH5m03zd9tAE7ICtNIz148+dVorMyB8HW++Zg9KOrfe5a+0skwLuSKpWN2TTTqLAHc7ru+2KD02SOWiEK4AxcRHnSteI/kpRGem8oy9AwqLRQpZJGpwD81EvffRw4z7UHNyuF356wU+wrNVSk4AIJ5Z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkKSgzyk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkKSgzyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734013786; x=1765549786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBynYVlWNbOclZQfdx4588QO8Ult+W2d8AT7PIWYCZA=;
  b=AkKSgzykb0N1ugdKceqvNhX1uTs8grSHNVTyuWPUmvdtkuQGlloqh9ZR
   Ai5uYfhAsckn/TA1y9jcQhcG/l0MWQWMBUljXX1Anigs+Sy6iwONLueO/
   lCDb+deHeKD88tf5L9C9qjdvhTIiKBC697fMHeNaukm/2eKzUoqJ+WNLi
   9cnelFkHuCJ4/drJq7MDgQee1olu+WYBaJv6QDqJdFp2DWJJjHua6+ur3
   1PcK9TYO6FKMj32rTiw3lKT4mAbdrAidQEKBgOXf8avgAND0z6aAl7jtn
   gyVTJPoDfeePKVU2gsuoOn5MHJGtGLOZaza4uEBM5wLiok46mXuBMcoYW
   A==;
X-CSE-ConnectionGUID: Y/zGjkfkRdu4M/W/HdM9UQ==
X-CSE-MsgGUID: lfmjTcnfRpGAxE5VMr+sWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45112736"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="45112736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:29:44 -0800
X-CSE-ConnectionGUID: PTfFi3VAQQm4hrDa4HyUgw==
X-CSE-MsgGUID: sujLFLMOQpGWEbOCmDjlAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96785404"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2024 06:29:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLkCA-0007vd-1y;
	Thu, 12 Dec 2024 14:29:38 +0000
Date: Thu, 12 Dec 2024 22:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14028/24503] versioncheck:
 ./drivers/net/wireless/iwl7000/hdrs/config.h: 70: need linux/version.h
Message-ID: <202412122241.uEjtAvkh-lkp@intel.com>
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
commit: 90bd21b536dd67fe8cd25d1a905b81a288d8bbf3 [14028/24503] CHROMIUM: iwl7000: add driver
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412122241.uEjtAvkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122241.uEjtAvkh-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
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
