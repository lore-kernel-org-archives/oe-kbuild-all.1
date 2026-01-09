Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF3226CFD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945684; cv=none; b=Epck3CTVqJSNjrCVM0FxTSJMNpwMr4F5keFPVBkyeVhIsKAe32UJxa3ISLfyJVjdd6rL2Bidgc9HMkSuRzlRMHQoNhTqVG2vEMN7UaGx0MtQi4mttYj06Fx7+qfsOfiOvs9iRtMc4pJ4AaPtmvLguOpgemHDfHMhttSTVL80t2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945684; c=relaxed/simple;
	bh=vkJGmRJf2FT39aLY71k0Bf1rkWM/JtrYJ0JM8ae6QdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHQ0BJmZc3jEZ6dCWtr2MQAPJYqJV10bAIB0PKL8dYBrlWKLR+zWS/iAXlJ7abGcQKr1CX+dQ4YbuVZUvwo+YD3nvQzKRmUEUHdJVo1RhsKGHjEGv9yInu5zj3McV5uMKOsbaDrrkCnPrhc96ReCZYhUCcbxzJD1BaQgJZAB2js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys69bd/v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys69bd/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767945683; x=1799481683;
  h=date:from:to:cc:subject:message-id;
  bh=vkJGmRJf2FT39aLY71k0Bf1rkWM/JtrYJ0JM8ae6QdE=;
  b=Ys69bd/vQYpemVv+xPhwM5+uptWsdXqxM/SMuS/9DT0uaVLAWa8758xL
   Z81TpjQVyzNxDHc2uJE1MkTBemec6fQVO5Bq05xJp1BJGyE2ziqH+RFgC
   6Vh+uwlPBgMmC7xk1LnLhzcXCTDmW26dfsmix23PTBZ3o4kZqyq3e50p/
   LoXJNdS4VT8n7TPl6M9S8kICPoyeea3Vg/C2xWy3h3uIVWb5oNwX1/3L0
   RgKQw6sS9hFKULvSP44wzKHJvRhYC5D1IZ9Ydkd4slMgXdQP3ePpjd2NX
   rYYMf/znoO2rEv6h12sA/CMGqbAkFVhS1s3nVqD+6e/bc5nJX86pDvzYM
   w==;
X-CSE-ConnectionGUID: wS9VMEXBQISNj02lgROT8A==
X-CSE-MsgGUID: bcHhQbe1RHCLJQIjexmzeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80436050"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="80436050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:01:23 -0800
X-CSE-ConnectionGUID: W5sy8tHERAqERtOl6VX/uA==
X-CSE-MsgGUID: fiAkE76EQRG4e13so2su+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203038740"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2026 00:01:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve7Qs-0000000021Q-1aXS;
	Fri, 09 Jan 2026 08:01:18 +0000
Date: Fri, 09 Jan 2026 09:00:53 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] versioncheck:
 ./drivers/gpu/drm/yhgch/yhgch_drm_drv.h: 6 linux/version.h not needed.
Message-ID: <202601090925.chQ9GibQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   75e02b373eb40145f030484c85f2104e7b630275
commit: 59bf69909663163b6aa30bec72c151c7c467a4c2 [1/1] drm/yhgch: rename inspur_drm to yhgch_drm
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601090925.chQ9GibQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090925.chQ9GibQ-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
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
   ./arch/loongarch/kvm/kvm_compat.c: 5 linux/version.h not needed.
   ./arch/loongarch/kvm/kvm_compat.h: 8 linux/version.h not needed.
   ./arch/riscv/mm/dma-mapping.c: 11 linux/version.h not needed.
   ./arch/s390/include/asm/setup.h: 183: need linux/version.h
   ./arch/um/drivers/vector_kern.c: 11 linux/version.h not needed.
   ./drivers/block/rsxx/rsxx_priv.h: 14 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/alibaba/alicc/alicc_uio.c: 14 linux/version.h not needed.
   ./drivers/crypto/cavium/cpt/cptpf_main.c: 13 linux/version.h not needed.
   ./drivers/crypto/cavium/zip/common.h: 59 linux/version.h not needed.
   ./drivers/crypto/ccp/hct.c: 7 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/ccp-mdev.c: 12 linux/version.h not needed.
   ./drivers/crypto/ccp/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/ccree/cc_driver.h: 25 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 62 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c: 28 linux/version.h not needed.
   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c: 26 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/pl111/pl111_drv.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_display.c: 14 linux/version.h not needed.
   ./drivers/gpu/drm/tve200/tve200_drv.c: 38 linux/version.h not needed.
   ./drivers/gpu/drm/verisilicon/vs_crtc.c: 461: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_dc.c: 1304: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_gem.c: 552: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_gem.h: 74: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_plane.c: 403: need linux/version.h
   ./drivers/gpu/drm/verisilicon/vs_virtual.c: 363: need linux/version.h
>> ./drivers/gpu/drm/yhgch/yhgch_drm_drv.h: 6 linux/version.h not needed.
   ./drivers/hv/hv.c: 16 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
   ./drivers/i2c/busses/i2c-zhaoxin.c: 18 linux/version.h not needed.
   ./drivers/media/pci/cx25821/cx25821.h: 31 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 18 linux/version.h not needed.
   ./drivers/net/ethernet/3snic/sssnic/include/kernel/sss_linux_kernel.h: 12 linux/version.h not needed.
   ./drivers/net/ethernet/broadcom/genet/bcmgenet_wol.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxe/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/linkdata/sxevf/base/compat/sxe_compat.h: 16 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_main.c: 10 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/net/usb/lan78xx.c: 5 linux/version.h not needed.
   ./drivers/net/wireless/rsi/rsi_91x_ps.c: 19 linux/version.h not needed.
   ./drivers/pci/iohub-sriov/iohub-sriov.c: 16 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: 11 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_cli.c: 14 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/linux/ps3_driver_log.c: 3 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_device_manager_sas.h: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_qos.c: 6 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_rb_tree.h: 7 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_sas_transport.h: 9 linux/version.h not needed.
   ./drivers/scsi/linkdata/ps3stor/ps3_scsi_cmd_err.c: 9 linux/version.h not needed.
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
   ./include/linux/qed/qed_ll2_if.h: 15 linux/version.h not needed.
   ./kernel/bpf/syscall.c: 20 linux/version.h not needed.
   ./net/ipv4/tcp_rt/tcp_rt.h: 15 linux/version.h not needed.
   ./samples/bpf/sampleip_kern.c: 7 linux/version.h not needed.
   ./samples/bpf/trace_event_kern.c: 8 linux/version.h not needed.
   ./sound/soc/codecs/cs35l35.c: 12 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 145: need linux/version.h
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
