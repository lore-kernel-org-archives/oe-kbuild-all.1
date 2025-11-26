Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77091317702
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146516; cv=none; b=Zjnu23qtCDUfGJFbU79+B/Bdi5WGjqWuC2LDz7IVnRHdQ3wkRE80z3gkqotICL4Bar2g6f+VMOcT9L6CLoKhrUNXQZeUzrixl0nYvCLxy9Kc32TgY0tbvJpXMrLpAQr3GCLFrXNxCz4k89zcpnRTNwFVFywjns+EbGs8u+IjFmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146516; c=relaxed/simple;
	bh=5pyc0kCOD3KfZXztnywCeBxebdBz1rlvjJ+p/BaI+2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaKjnO9zDrlXwrCBGkcd4CAWxdDf1+b7gXogaC0E1uGpeqq9oDFMW5xuEuXZNP1h9aw/FEW7tvDqawyBreEOhped0x43UzE93jD28+mb+ZNUKq2pHwTprNqVMNHR2XqP6zasjiDYbIkO+54VSQWsgxnUZsgfBLPQxa1YRFa23Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+ByYgvN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+ByYgvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764146514; x=1795682514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pyc0kCOD3KfZXztnywCeBxebdBz1rlvjJ+p/BaI+2o=;
  b=V+ByYgvNV19vkDSrVe47O9RlT8cxHdSuMN+MIYZ7rprpeYJMzH78E+uu
   da4eyP6jXjn3ghYtO2BAPgbIqbL7PgdJKJrbO4ziTFN5zvfGHXT9IJ6wp
   Aggt6jlH7GLrljNtzSDJXEXsg4RWJ9wc3mm+aNfHioGyEe6/uA/I7E6v/
   WGlbmEtOqSI8Kbeo1WwVVxXiBDOc4LBMCa3GL7Jb6/09p31Ea8Nk2k0ec
   v9rnlwWZhrKyxVJJH9Mt1ADQTFAgHN2J8AnK24buu+JrrlbJrOL/LwgAR
   jXr388OzU/d/V5A1LOWMDT9UQ6A0buILIEoTVZ0mVljKjb+nYO4cifxdP
   w==;
X-CSE-ConnectionGUID: s/Fpg2kUTDKCxULID5PSJQ==
X-CSE-MsgGUID: lt+PFQtFRrm5Qu8erh1UDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66062848"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66062848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 00:41:53 -0800
X-CSE-ConnectionGUID: auk3zdsLToeHhhHiPxqCOw==
X-CSE-MsgGUID: EMYadbr7TwixorF/+Fv7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197824654"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 00:41:52 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOB5y-000000000jN-1xcN;
	Wed, 26 Nov 2025 08:41:50 +0000
Date: Wed, 26 Nov 2025 09:41:32 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Ruilin <liruilin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3372/3372] versioncheck:
 ./drivers/ub/obmm/obmm_lowmem.c: 13 linux/version.h not needed.
Message-ID: <202511260904.bsCpbGak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9faad151530e11624fffe9d2ab408edffb682db0
commit: f6bc214461e913ec9380b6f692a26e05a3bb276e [3372/3372] obmm: Add low memory management support
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511260904.bsCpbGak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260904.bsCpbGak-lkp@intel.com/

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
>> ./drivers/ub/obmm/obmm_lowmem.c: 13 linux/version.h not needed.
   ./drivers/ub/urma/ubagg/ubagg_main.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/net/ubcore_sock.c: 23 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcm/ub_cm.c: 16 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcm/ubcm_genl.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_cdev_file.c: 14 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_device.c: 13 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl.c: 17 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_genl_admin.c: 11 linux/version.h not needed.
   ./drivers/ub/urma/ubcore/ubcore_umem.c: 17 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_main.c: 20 linux/version.h not needed.
   ./drivers/ub/urma/uburma/uburma_mmap.c: 12 linux/version.h not needed.
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
