Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD2221271
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763661418; cv=none; b=alBUNl1ffm8d+Sjn7JACjuc6RCG0sdacVQKojn3/3iiVK5VudSXdclik6B9KXVep5U9XOcut7z/ESxwuxd2VMjeKdlqjxK1L4jllgS5jcBiCsaWA4mWf2LbbD55WQPyGzWU0W6IajMo9YQCgkfiQksoP/1/IZADA/oNkJc4002o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763661418; c=relaxed/simple;
	bh=8pXGGS3Eed59IyA36tLE7h61Hit1QhPMMFC7yJk2keY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3bYiwXNvA0+yYzrVpksS+ryPpPdu6BGsckHZgjNW0NeBOHsPdUDxaLQoyY2VB26pCePkD09bNtoXzvYvUWndNyNgB5q05bZQ8YzHkwUBye6ixCn4UXbLi4hDvFWBatu28DkHTpxhBOcqQjEqDtRVXDyUhgECiU+tzqXuXSBzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL9z+4KH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL9z+4KH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763661417; x=1795197417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pXGGS3Eed59IyA36tLE7h61Hit1QhPMMFC7yJk2keY=;
  b=QL9z+4KHclPHd2DXXNh03127phDLzkjvn5R6g+BKKblQ1flyzTWr84IH
   frspmJZnsITmVSuhJt0JrdLxGQITFvLIRqRrLHwuNlrYhmgb8ncrVQrhx
   W2VeQw44IqUYcApCY8OQVoNioA/XbdoUsX6ZtHCTCbcPVGRrSYn0ATsqO
   Kasvt76kd3B3oowjMK9iav0qS+VmHMoeZfK6eF+zDV3yGpQgE2LHGwMCb
   2LyVTKHjvCOm3Qhw1asiuOD1Jmg+otflt8Ps90RCn+G6puIlZVBlUHAiP
   /dbr4hJ0yAv9tFqWYpb9vLjNrEQGtISzc9buyHz85y6lsK9QV8SML/WtK
   g==;
X-CSE-ConnectionGUID: S6Q+2PRBS8OrvhMS2xl57A==
X-CSE-MsgGUID: /fY/xverSiO5ejSKDIgxyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65771875"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65771875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 09:56:56 -0800
X-CSE-ConnectionGUID: Bg5Vj59ISNOlQq18ZxYRew==
X-CSE-MsgGUID: 3MshzoCFRWqftzVgxkRJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191245932"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 09:56:55 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM8to-000000001Vf-2rOc;
	Thu, 20 Nov 2025 17:56:52 +0000
Date: Thu, 20 Nov 2025 18:56:32 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3297/3297] versioncheck:
 ./drivers/ub/urma/ubcore/ubcm/ub_cm.c: 16 linux/version.h not needed.
Message-ID: <202511201819.SUr4K1Gq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c349580fcd9fbdf61e88be41b45051d3326d2a79
commit: e34a52d4eed8912f6dfdc7d68152c45f7a071ca8 [3297/3297] ubcore: implement ubcore connection management and messaging feature.
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201819.SUr4K1Gq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201819.SUr4K1Gq-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.0/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
   ./drivers/crypto/sedriver/wst_se_common_type.h: 19 linux/version.h not needed.
   ./drivers/gpu/drm/phytium/phytium_gem.c: 9 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 13 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_include.h: 32 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c: 17 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_include.h: 20 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_mce.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic/ossl_knl.h: 22 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic3/bond/hinic3_bond.c: 12 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/mucse/rnpm/rnpm_common.h: 7 linux/version.h not needed.
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
   ./drivers/scsi/sssraid/sssraid_fw.c: 6 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_os.c: 6 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/ub/cdma/cdma_mmap.c: 6 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/net/ubcore_sock.c: 23 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcm/ub_cm.c: 16 linux/version.h not needed.
>> ./drivers/ub/urma/ubcore/ubcm/ubcm_genl.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_device.c: 13 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl.c: 17 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl_admin.c: 11 linux/version.h not needed.
   ./fs/proc/etmem_scan.c: 13 linux/version.h not needed.
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
