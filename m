Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AAA23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714279093; cv=none; b=nCTmgfBbKQM/AgsDfislChIj7hBzS7C5f+rzgzc2UOR4tmkxYQ2FGwjBg0OLeOKMi3KrPv7uXHgGLvl/c4dcF3z9WLNvwpLHCduS9XNvV/M00GcDPDd/f/Xr8s8EVgHPE3WpqyW4eBxE+Diiu8gxOUjT+v3FGzh4LA/hMslh7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714279093; c=relaxed/simple;
	bh=nvXR/jZAP14rqP2cRGtkKwknbsvZRW/aG4mb6I3l0VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WW6dPnm4l1BGTxTA962lSR9klLtPpT8Fm/yDnaNZuU/tdetjF7L5ukYGyusLgtZMrOnGuDLc52x8Q7iYm9Kzufp/PYfOL1vcIExPmQoPNilu361lHSz3BlKLdMZkPDifzXz4G4hAWarl04h4Pryf/J4R500ZZ4QCzsPQWmyTeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN4grv7A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN4grv7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714279092; x=1745815092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvXR/jZAP14rqP2cRGtkKwknbsvZRW/aG4mb6I3l0VU=;
  b=QN4grv7A+M273JO1uhnQrxcU1jvDpC2pXLWrTZW/Ip+PyjbG+d4Kf+CO
   T+/7Jfnyiz1KtHF5BgWimlGhwiZhIA4FN9fYuC6p6l4yFFJqCCoWFxFEA
   1xsxmgHZknbnwp/ULBCSabgFDdQkjmtN2aeBsxUfJUgP0bTDh9pZQ6pXe
   1vquVjCNF4t/zyfrSKoVVB+BWH332u2jMvhIE8U8AEN8t6xUyQmITZR4b
   BnlEDMv20nJoBUVbGHwmCEAEcsOAYDxk5b/UxE2Pl9ASHXhdD4zlRqHgv
   JXQZU6o/iiumZfJduLspgc2pUhZfBsVGRVqu6y2zxzo1DN8kzzWadzpRn
   Q==;
X-CSE-ConnectionGUID: RsMTZuWoRBWHxOnOiw2BJQ==
X-CSE-MsgGUID: IhUgjoJHQpi2/7Qz38GZ9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13800391"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="13800391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 21:38:09 -0700
X-CSE-ConnectionGUID: uNxknGVUS4+zMbpDk1hrjQ==
X-CSE-MsgGUID: s6JFelhoQ4ONa87q5HsKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30462326"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2024 21:38:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0wIf-0005pg-1p;
	Sun, 28 Apr 2024 04:38:05 +0000
Date: Sun, 28 Apr 2024 12:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7547/7556] versioncheck:
 ./drivers/net/ethernet/huawei/hinic3/bond/hinic3_bond.c: 12 linux/version.h
 not needed.
Message-ID: <202404281213.ck83MEim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6773f12aed5e797a2c93fd0f7632568554503971
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7547/7556] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
reproduce: (https://download.01.org/0day-ci/archive/20240428/202404281213.ck83MEim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281213.ck83MEim-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/montage/tsse/tsse_vuart.c: 21 linux/version.h not needed.
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
>> ./drivers/net/ethernet/huawei/hinic3/bond/hinic3_bond.c: 12 linux/version.h not needed.
   ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 11 linux/version.h not needed.
   ./drivers/net/ethernet/mucse/rnpm/rnpm_common.h: 7 linux/version.h not needed.
   ./drivers/scsi/hisi_raid/hiraid_main.c: 9 linux/version.h not needed.
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
