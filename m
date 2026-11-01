Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793507575;
	b=CnFluuR1aUd8GpyA4j5lYlDud4W8sYOAFL8HhH1yq3qCYgwHl4PyO9ahOzO4iF1dd09J
	 Ivpf2BxNzm1oI3SzrV47qNXy7uj3EqHicDXD88Gn1wwrpeaE+AuKE3XamMxXC8UKYiGxR
	 4fjWI2FF7Bg/y29UrcF2PkASFE6dm1566zRMm4kFQw6LlziO1dqbUiyuYuF/MVWWNg0vt
	 uFCXI7h5bsaAN5MaQF5/xJta5swveevuU55Hy+qCjP38ielb442y0IacWiaWPEjmGo1fg
	 mmqDhC8NkEXqczLVNkp6CdpkmWQqdM3rhRJi6bjNALGVkmlAXACQHmRexbSQ8wKZ35Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793507575;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+SlgzNmMrVT2oiA5340i9plcwP7aEg1sjzSrh6oTYDk=;
	b=Pzdqv8OOqrxdNjUzgfoQHRRIALCVgt1D9OvdlcQgLAOrbt+6t00wWHcTLJ6i8nAmW7Yl
	 YcCXzar30hlUx9aUH7nwIec8EAMz4u0bY5NuocA3uBU8LX4wBzrBwaRSM4BWq9qBaqJ/k
	 Aq7SaOPl/h9ZQcT7Bpd70G6sMtqQmWUgJY5maTmvk47j6ZxDcPQW9ZAhliM6Saf24EjYl
	 BXKrBs6eSjAmrLOs3EcBUdeC8iOrZiFrrdOUguGPEJ6fb8WoMGhiyCp/frK5Fcw/msSWj
	 RKE/Tj7BJi7jO0Yz4iHEAbbFqtYHSjgTK9PyYfL876+x80I2cGDtdiLGT4H/EErF7vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GJo6vMBV;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39466606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 04:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39466606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GJo6vMBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793507573; x=1825043573;
  h=date:from:to:cc:subject:message-id;
  bh=BjvAz+y39ZzWltb76RfL4n6MF/qgUgfW+MAk4j/lLfI=;
  b=GJo6vMBVwCRAgdxIf7S0nJFtmoFrMoMmwOMlDtSv0Bi9auaLEkvxUNUv
   stbOy4eN2oJ/mSxzRWiT0FtumlzlZSCXndJKd4/5xUq8rXLVeSJ1Nljlv
   GTINnWuZ3VTFAtVDoscWC1qEJCC1kc40DYojEXmMkphHxX16JANZHyWWX
   00LmVV8IeoPW3Akm9XI/L11axGaY6xBySsf/Sg+pjM5O9WIk+fm3/QmkF
   iFTTqagNO53S7eqJqLb+pASQ3nvF9E63eUkgkjfC0ZdmbHyPbJ/JLDt6M
   FhGEYTqb17ccmTEI7E+pDYgF8+pVnTBfPQ4Uixwi4j/Kagk7iW4ELOL8z
   Q==;
X-CSE-ConnectionGUID: bFT14BxlQL2SZVlLn71HmA==
X-CSE-MsgGUID: xB99tv4ZQO2lW+WlknI8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2101872"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2101872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 21:32:52 -0700
X-CSE-ConnectionGUID: P3VkAEBGQmStNHocpua94w==
X-CSE-MsgGUID: L5NvN67SRAKF2POO2snfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5659214"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Oct 2026 21:32:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNNFR-000000006Kp-1AJL;
	Sun, 01 Nov 2026 04:32:49 +0000
Date: Sun, 01 Nov 2026 05:32:31 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] versioncheck:
 ./drivers/scsi/linkdata/ps3stor/ps3_platform_utils.h: 13 linux/version.h not
 needed.
Message-ID: <202611010509.TFulkIld-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: 10f82fb40a40440af028b6dd68c3ddaf0522accb [842/842] anolis: scsi: update Linkdata HBA/RAID controller driver
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010509.TFulkIld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010509.TFulkIld-lkp@intel.com/

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
>> ./drivers/scsi/linkdata/ps3stor/ps3_platform_utils.h: 13 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 7 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 9 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/ub/ubdevshm/ubdevshm_main.c: 22 linux/version.h not needed.
   ./drivers/ub/urma/ubagg/ubagg_main.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcm/ub_cm.c: 16 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_device.c: 13 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_dmac.c: 18 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl.c: 17 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl_admin.c: 12 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_tp.c: 18 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_umem.c: 17 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_main.c: 20 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_mmap.c: 12 linux/version.h not needed.
   ./drivers/ub/urma/ulp/ipourma/ipourma_ethtool.c: 11 linux/version.h not needed.
   ./drivers/ub/urma/ulp/ipourma/ipourma_netdev.c: 12 linux/version.h not needed.
   ./drivers/ub/urma/ulp/ipourma/ipourma_ub.c: 9 linux/version.h not needed.
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
