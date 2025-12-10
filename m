Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A426CE23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396956; cv=none; b=AMf3iJdrz3mOWh5EO8e8AK5fnO3g+sKBycqwBYeqR91Fxq5iK8uDUoPhotdKjnCbPILRLXIiUA0YAw5SH7LWW9Pfkdju4uvlxcN5VS2Y0ZweUmnvbP95lfjEE7fG0wSeE54x+jSq7TV7AfUp4eZoavZIo7ZX4GVfdIl3zWZerD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396956; c=relaxed/simple;
	bh=PYLfo48yWj1JARJN+upWOMU4bv6rSFDdcqQzkk3Cguw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfuHsMpf9dPYfJCH9PcmIbUVfEuRvOevrDfKKtCNnEsMOCeEvw1kgHAlLx+56/DgpoOiUC0fNRw+0uhJWpsDZ7ex79GM/HKcx0ykaSw+uAA/r05HU6CePvUOjyy5K+dKQTHkinJ8xgyHV7qHNXAGb6RC/d6dpXpSmQYCTdrNZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifH9Y4KI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifH9Y4KI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765396956; x=1796932956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYLfo48yWj1JARJN+upWOMU4bv6rSFDdcqQzkk3Cguw=;
  b=ifH9Y4KIqHGL9Dql90rTfVn6FMVejIYfXt6m/OsYJnXNpFQ0fkGedHgy
   iSjZB1jBv3CrFc3yPXCi6gNLDDl3U2z2jsdIFkKCajZlaThyplmiSdfDi
   cnpGuixchi6nxH7mwxNghClxz46FAJgM9PWXclC+rCP+nbeNolyG0+RDh
   G9NttNtmvHJKb3deDQqUHtyHu4z9XC7s/rwCqV0FkCmRPxxsXz/1WGPcP
   wQEoxWo3P1+NYlqBnQcyHilhK5xXbkJhAGtZTlKO9V0cL5yyyHEzafbVy
   tCFvXh6cjlPDXPirHIfqpvsOn2erg9OSxNFrs5EOYkZnARNHt+vYMwiVa
   Q==;
X-CSE-ConnectionGUID: 8VlXCWcMTMK34j3uEMZDQQ==
X-CSE-MsgGUID: E+kpTGc4Th+An+KV45GrfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67262825"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67262825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:02:32 -0800
X-CSE-ConnectionGUID: xM1LaTo9TFSRX9cyWjkTQQ==
X-CSE-MsgGUID: 2jeQyh5ZRyWYhW9ayOGw1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="234023287"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 12:02:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQOK-000000000lU-2tEu;
	Wed, 10 Dec 2025 20:02:28 +0000
Date: Wed, 10 Dec 2025 21:02:06 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] versioncheck:
 ./drivers/net/ethernet/nebula-matrix/m1600/txrx.c: 9 linux/version.h not
 needed.
Message-ID: <202512102133.IdeNoKkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   41baca24098d5757f3aea4d98e63eb9d9f7d43a3
commit: 01e6e2075c432fde7fb5a66202b41bbd469de620 [3406/3406] Net: m1600: Add m1600-driver for nebula-matrix m1600 series smart NIC.
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512102133.IdeNoKkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102133.IdeNoKkX-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/atomic.h: 6 linux/version.h not needed.
   ./arch/csky/include/asm/io.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/thread_info.h: 9 linux/version.h not needed.
   ./arch/csky/include/asm/uaccess.h: 15 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./arch/csky/mm/fault.c: 16 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 183: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 26 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 62 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 38 linux/version.h not needed.
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_include.h: 32 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c: 17 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_include.h: 20 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_main.c: 22 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_mce.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c: 16 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic/ossl_knl.h: 22 linux/version.h not needed.
   ./drivers/net/ethernet/nebula-matrix/m1600/common.h: 12 linux/version.h not needed.
>> ./drivers/net/ethernet/nebula-matrix/m1600/txrx.c: 9 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/huawei/hifc/hifc_knl_adp.h: 23 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf.h: 15 linux/version.h not needed.
   ./drivers/scsi/qedf/qedf_dbg.h: 13 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_fw.c: 6 linux/version.h not needed.
   ./drivers/scsi/sssraid/sssraid_os.c: 6 linux/version.h not needed.
   ./drivers/soc/tegra/powergate-bpmp.c: 10 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/drv_types.h: 17 linux/version.h not needed.
   ./drivers/staging/rtl8723bs/include/ioctl_cfg80211.h: 10 linux/version.h not needed.
   ./drivers/watchdog/ziirave_wdt.c: 21 linux/version.h not needed.
   ./fs/eulerfs/euler.h: 20 linux/version.h not needed.
   ./fs/eulerfs/euler_common.h: 25 linux/version.h not needed.
   ./fs/proc/etmem_scan.c: 13 linux/version.h not needed.
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 20 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/libbpf_sched.h: 19 linux/version.h not needed.
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
