Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344A21CC5C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553982; cv=none; b=JNpRWFzErO+4uOEzHGgCGdbUlSXgYMO0CB7WXYLcQ+cC9ndYc8AW5wCz7JTXnhK8N3TUdgwo+H7pbiYeToaL2ndXbtbXmIIIoKLrWHBdOeTC8II6v1EURUgY9w2ZVDZoXFIrTwyaTZjHxtF5qsGghTYLl7QjRBtm0VqSMSk4/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553982; c=relaxed/simple;
	bh=0nEfsrXzS2dhAO3GiXrvUZT/BYzlzt2BtcRLLtnqQ7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p4AtNV7degMzcVAzLjf0WUsQKKPB0A6dhBQUb43vKRcU92Fd2U/sprn5lZGe0XsQbGmR/OttqDMIhebVz7pobl4Z8UUrHyl5ZLzZcPd8206NCnauc6HZSLRTZHxwp2xNixkpPlaXqjXdvbzVENWZWV6B78qlQjOLRyNqxjVH054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqX0Xl7N; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqX0Xl7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778553981; x=1810089981;
  h=date:from:to:cc:subject:message-id;
  bh=0nEfsrXzS2dhAO3GiXrvUZT/BYzlzt2BtcRLLtnqQ7g=;
  b=SqX0Xl7NAiFF36aKGJeZrMr80j0PKGTgxkKuNuM/dc3x55QNBIIEWI5h
   nTJbbd33t0Frxwi4Mvy41vayz1Pj2UNHn++U45ZGKjAmztSYrZaated3V
   olxWzy/hibrxKZT0cofvUEGmhG5xzF1O34pS+BAip/eqRciWNpoUOsK9d
   SQpvKCMKKU4fhLOnKJAOom2SEHcehVzCR0JxiYOWTRrFR0B1gTaH8RFNV
   pRZiCqTwElw9SNsRi/7GAJwW4tLkM1Z+TKZ+Js2IpbrzoWvXuhiLh2HdT
   Xw/lg/x1juxUlDpnfMLGmYEhPPiQdPwZQJ2/KfjuJIoRmK8W0YMNzzshm
   g==;
X-CSE-ConnectionGUID: XGGVCwAGRN+uWYlewougYg==
X-CSE-MsgGUID: weftxI8iTfiqpEm7R4cvPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104909511"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104909511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 19:46:20 -0700
X-CSE-ConnectionGUID: FXhE5pnETvCa4LQufKyJaw==
X-CSE-MsgGUID: rE04aa1BRlCRe4X8bGx2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241984805"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2026 19:46:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMd8S-0000000088b-3mfz;
	Tue, 12 May 2026 02:46:16 +0000
Date: Tue, 12 May 2026 04:45:47 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 28/28] versioncheck:
 ./drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h: 17
 linux/version.h not needed.
Message-ID: <202605120443.SrB3bLNB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   239030146b40c31f21eee583f7f678be653a646e
commit: dce7db61f61d8ac759d22bd218a3cb5cc247c562 [28/28] anolis: net: update linkdata ethernet driver features.
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605120443.SrB3bLNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120443.SrB3bLNB-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j384 ARCH=x86_64 versioncheck 
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
   ./drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
>> ./drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
>> ./drivers/net/ethernet/linkdata/sxe2vf/base/compat/sxe2_compat.h: 17 linux/version.h not needed.
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
