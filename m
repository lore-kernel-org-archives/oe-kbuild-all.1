Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575942AA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 04:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691914; cv=none; b=SyYu4CpJox7PNcqMz3S6EQMVZTdOcyOzNPA3lQ7wtUKX/t55rKYrpzB6VYoWHoMOSh/qcrYk2digfAd/BPpClmuNMiAOV15JHYcerfjkmYUWXznmc+HsxkAnKZWelQU8E+IcgFZAcQ01vnvaE9nBVr4ialFz51abbnaZmy7PZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691914; c=relaxed/simple;
	bh=2/IYNjmmgTXd/QXQ4TvBargyVqdCB+UcIXXDcZPEhlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kFF/7w+zUmRvPxDh+IAui7KCorLAMUjlNOhBlHcupQ+Gus9mUmLyHVkobEtYDiRN7dWHPUL3KARw0xP4JvkBxTzf651MeO6Pifhm3jRqAoor45ZM8NpdSdvbxeYeL4ciiiqV12XixQQE56ch5r5lFW7ORWtKcwZGKFKZ53C5lGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+qIl8za; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+qIl8za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791691913; x=1823227913;
  h=date:from:to:cc:subject:message-id;
  bh=2/IYNjmmgTXd/QXQ4TvBargyVqdCB+UcIXXDcZPEhlg=;
  b=I+qIl8zacyiTNbX6JF+KvHj3uYPvaQrstd0nmJliqIW4ki5GR+c086Ji
   HODIVcplk1rj1emw7cJwdTBiF1Pq1GoXxgO9OZcUZHSJnHifiyGpoYCKr
   4i6UBl8fqgxaLvrX/e37TcQvth1S46VmnTaUKTkNvuqY77pAVnkQGZD5d
   tCWWYTANi5FZc92d+FSF8xi6G5x82oY5zgOPUegMVQOujQmc6lRhOvwI1
   luF+6qjRyPpui2EkC9Zn+HPWsa/kxEt5yWZmSoA5I7OsojVqm76lL6ba0
   VC+7KMnlaAl8/yT9QEyXY1O4p+Tuslctd2rmo9YgMYE8suhJSozzTzwhy
   g==;
X-CSE-ConnectionGUID: MAoz/DwiQhq4vIB83kv0GQ==
X-CSE-MsgGUID: wkcZgSHlQZygjYg9Jexfiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="443590"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="443590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 21:11:52 -0700
X-CSE-ConnectionGUID: gOT5S9W/Q4GPnq4adoMl+w==
X-CSE-MsgGUID: bh4ivdT/S8WxSTObUZHumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="943260"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2026 21:11:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFkua-000000009Op-0r6U;
	Sun, 11 Oct 2026 04:11:48 +0000
Date: Sun, 11 Oct 2026 06:11:24 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 244/244] versioncheck:
 ./drivers/ub/ubdevshm/ubdevshm_main.c: 22 linux/version.h not needed.
Message-ID: <202610110651.U012Ww8V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b0fcbe992d4be39e9a0d83bb472dfda2e212b0e1
commit: 061ae1aaee655b70fb47c8a7a69e9f580720e791 [244/244] ub/ubdevshm: Fix spelling errors and optimize prints
reproduce: (https://download.01.org/0day-ci/archive/20261011/202610110651.U012Ww8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110651.U012Ww8V-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c: 428: need linux/version.h
   ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe2vf/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-ethtool.c: 1114: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: 6256: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: 2329: need linux/version.h
   ./drivers/net/ethernet/motorcomm/yt6801/fuxi-os.h: 27 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/scsi/hisi_raid/hiraid_main.c: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 11 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_cli.c: 14 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_driver_log.c: 3 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.h: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 7 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 9 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
>> ./drivers/ub/ubdevshm/ubdevshm_main.c: 22 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 407: need linux/version.h
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
