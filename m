Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CBB2E36E5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047433; cv=none; b=b2imO1IkrdBoPnay2EppOARaWMsBeKTxMIVuHhPRQx6ILAId9wmy7fvirRmp//HvRWCucKaqDdMuJLZFbb1xI0Xz0mWyzfFyBrYlkhgY0od6LomIFqVY1qefXYYaCMEibD5ihTJeg86Edw6eEdUnPPIeKKv0IoFt/audyOx0ZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047433; c=relaxed/simple;
	bh=SnoLBww2tQrjAIO7Cu5Cj+RAYtsRQPDSJFzLu9HS0Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/6p8oNpBir2M5cknxvviI6nd48f8/P6ul09E4ScKkYKkQ5v/XApzcKkfrIaqtJ8tPKQHWAQqSEWRkz/aUNsP2jOIVr0ruP3gJKww5kz2uf6uGBMj3OCRyPDsOcvTlwBo96D8wEZCYJeDCfKCCduRw/OLvTgLACppZT2i6KSGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAtaH3nc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAtaH3nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754047431; x=1785583431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnoLBww2tQrjAIO7Cu5Cj+RAYtsRQPDSJFzLu9HS0Kw=;
  b=NAtaH3ncAoAJgnDxJ9L6gOmvLm3yl+ZecOJiXGdhGY7eVtzo92yXepdA
   UEIwELW+BJpom1huZoe4fmcrj6agGBZdlEHOLXCV+D/vkHAFc5zY/1Y8/
   qWBYRsIyUvxWQwWVZo3OB6RXY+dXlPd9dZttPvkm1WphFtLfQG8F0Gi5c
   7nhsD3OA9Y5pleSTuSntl2hNCEzDuxIGTQbgx8GfixUZQjzpIxZulHpGc
   Qaxs34MeLyUUWFhQFEVUJyKDrFes5Ym3HtS6qaLC4Zqh7tWst/jR83xXt
   kysXoKBCZV4NOaFWGFUKRwcq9SDK225p58yj2t077JY6jBXf6HuVvB/Hc
   w==;
X-CSE-ConnectionGUID: SfjwraN3Rdm+WEvD6vIpTQ==
X-CSE-MsgGUID: rP0XN8/SQTCptbu9H9G6/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56351933"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56351933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 04:23:50 -0700
X-CSE-ConnectionGUID: UyOCugDBR46UO3E74xk5NQ==
X-CSE-MsgGUID: 501ilxYKQI2WNyBxo6yheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163473951"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2025 04:23:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhnrW-0001DP-2W;
	Fri, 01 Aug 2025 11:23:46 +0000
Date: Fri, 1 Aug 2025 13:23:29 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2628/2628] versioncheck:
 ./drivers/crypto/sedriver/wst_se_common_type.h: 19 linux/version.h not
 needed.
Message-ID: <202508011313.0ZBhYReL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1ca83de3cbd1afcc3038a46ab4c4c4626b9a4712
commit: 3fb87845837f13b19d7b20349801e75f2e303293 [2628/2628] crypto: loongson: add wst se chip support
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508011313.0ZBhYReL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011313.0ZBhYReL-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
