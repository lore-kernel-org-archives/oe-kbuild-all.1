Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2D265CAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732219; cv=none; b=VL38ZX4qp3OhN6/OUV+pE2EWa4u1bAt5jr/6z0AUIwxdUY9i2pEMfEqWXMSrssrgXBjEwV7GEly9mmMaQKj96I5NdtxOHtbh5DBlnEwn/Mw1pBnSdV5ERY1QPTvZIgP8jX/xxgu2VhHUo+Kl9zZswJGLcfAKxZN//qK5tkps6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732219; c=relaxed/simple;
	bh=lAA9DBb0xu/iMqBtuYrquSf9F7UL5g/HZkvavow5A5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aef3rhK4zjkovy+mN6qA+oLV3aKLwvc/YR+FO2lgVT5TiiiuoxNvB3Z9XcSQCwCeIX5BffNhfkE5gGAAeFB3d0ivRA9CHldUDwxfpd7s+TgRjUXE1TMmWvIY1CoiYUxUuveFEdpTpft9jkUfz4O3jYk5WbDwbQxvnBeV15x4WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/2AWXtd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/2AWXtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747732217; x=1779268217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lAA9DBb0xu/iMqBtuYrquSf9F7UL5g/HZkvavow5A5U=;
  b=V/2AWXtdmVODkE59KdEF3KJLDKZh8Abd80K6sHp9SsEbMdAj+6WtDYsV
   VwBCPZowH3F/HHjJ+/NjembNXvj1TkzVNKTcRCw3oLSuF3jCa9aO7Ksvq
   MmfBh/VbUOWgNUHgAw/eu5AcTpxWF8UU3PA0PD/cS9gR5bw2OYDiVNzSS
   NNL2mQSDX+ybzTZsxCyfYB43+gAzXBxXrWdkPVlBXVl/LSO/Eur7Fu16S
   rmGns30Z/CPFz7BNYI+Cv5KaIq1pM7pO3FG9I0vtYjicI95X7cFwd6Mbx
   MZaezZabvdm2sgOFFRBnCW+aw6ZxkK+VJo4dGwChwRtuckcsXqm/11ezj
   w==;
X-CSE-ConnectionGUID: zWil97AeT7iWHxsRQVesBA==
X-CSE-MsgGUID: LI2cKY6YTcS8M2OpNhsQ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="75056828"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75056828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:10:14 -0700
X-CSE-ConnectionGUID: huCiWGPXQD+6M20Bo30KuQ==
X-CSE-MsgGUID: l5e0/YF4R0eDD+JFEmVzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140541708"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 02:10:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIzC-000MMk-2Z;
	Tue, 20 May 2025 09:10:10 +0000
Date: Tue, 20 May 2025 17:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2258/2258] versioncheck:
 ./drivers/crypto/sedriver/wst_se_common_type.h: 19 linux/version.h not
 needed.
Message-ID: <202505201722.VJAhefze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   289de29f4f837038aa79e765e64ddc1d410fe5fd
commit: 3fb87845837f13b19d7b20349801e75f2e303293 [2258/2258] crypto: loongson: add wst se chip support
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201722.VJAhefze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201722.VJAhefze-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j16 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
>> ./drivers/crypto/sedriver/wst_se_common_type.h: 19 linux/version.h not needed.
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
