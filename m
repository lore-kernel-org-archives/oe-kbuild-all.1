Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94531206271
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503918; cv=none; b=AW7H3rPivZSU2mschK77NRGsflnmCsUl32UZ4sSmriV6049YaXPO21OITa3cBfRF+vAXoVyelke2bMKbs+6fK+ikz3e5o5WzrsyE43M7ocXAJZkcx6I9cfJGO/uHDjpnd901+lgVodIMSPyUQeDjsx9mFr5NU9SkkcnGCKZ/PCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503918; c=relaxed/simple;
	bh=XO69zOGxRwpkjO5sWQYhiDxj9edsb3g+H+xh8b+hwCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2ye+soogHk4aYqSitTkqFxWbpK66AkghAeEbxBGBrpdjPBcdKqlMZBp8iMRQB5GApcsLWcF4sfgcK5AMt6hBUxdkY5YkarCOXCykZxD/aPJRE4JkNPGMBtGF+luADWyYUR99BkRKldHJPtoNpusBAgEAEKOEt5FfpEmB0kl0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJ3r8M/1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJ3r8M/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733503917; x=1765039917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO69zOGxRwpkjO5sWQYhiDxj9edsb3g+H+xh8b+hwCU=;
  b=OJ3r8M/1udXs0cxwqiItWyAftkz538aQGMEVSNq8d8EwOqISR1Vl/CDy
   hMGtrRx0+lVz0Qi7dm2dyppyOxISnxmRbd8NE0IaQxVAD3SnmUR7QvtvO
   ZTxNntC2Z2Jvvvip0JHFQ6rkIZk4jt3rPupL/U7aFj/KTHA3NEn66iQ3A
   iUHKKg4dKzi2RVl2xTunNUmxcjpb0uclw1SaaoRSQL1V6GNkolHT0FaoT
   sB/EwuLMO7V4R1FC79L25olSOh8/0eyzWdzpj/LhjK1FlPmdWEqIR1b7Y
   Nd4I7ujSDKJPYAPoJWdCQDXZhUkXApqWUYKqkBIw4581i6jfQHiLm/ASH
   w==;
X-CSE-ConnectionGUID: oQtUV4/PTFOT3blraYJdkA==
X-CSE-MsgGUID: brkn3CDKQcSi6rZesKR7AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34104197"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="34104197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:51:56 -0800
X-CSE-ConnectionGUID: jg2DK+nGTze9YM4ikt0uhA==
X-CSE-MsgGUID: Qw4X+zUGRDOP3s26b7I+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94261535"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Dec 2024 08:51:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbYW-00025s-0G;
	Fri, 06 Dec 2024 16:51:52 +0000
Date: Sat, 7 Dec 2024 00:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, haodongdong <doubled@leap-io.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1604/1604] versioncheck:
 ./drivers/scsi/leapioraid/leapioraid_app.c: 44 linux/version.h not needed.
Message-ID: <202412070024.wP2d7kdl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   39c261e60f0891bbf1a4405522c7e14f0a072b60
commit: 7fea595ef48e9ab13bd31df067b19152153e1925 [1604/1604] SCSI: LEAPIORAID: Supports LEAPIO RAID controller
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070024.wP2d7kdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070024.wP2d7kdl-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/char/ipmi/ipmi_si_ls2k500.c: 19 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/hct.c: 6 linux/version.h not needed.
   ./drivers/crypto/ccp/hygon/tdm-dev.h: 29 linux/version.h not needed.
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
   ./drivers/net/ethernet/huawei/hinic3/ossl_knl_linux.h: 11 linux/version.h not needed.
   ./drivers/net/ethernet/mucse/rnpm/rnpm_common.h: 7 linux/version.h not needed.
   ./drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h: 26 linux/version.h not needed.
   ./drivers/scsi/hisi_raid/hiraid_main.c: 9 linux/version.h not needed.
>> ./drivers/scsi/leapioraid/leapioraid_app.c: 44 linux/version.h not needed.
>> ./drivers/scsi/leapioraid/leapioraid_func.c: 44 linux/version.h not needed.
>> ./drivers/scsi/leapioraid/leapioraid_os.c: 43 linux/version.h not needed.
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
