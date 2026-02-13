Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA3B17ADE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993113; cv=none; b=PVU0F5Vd/vofl1qI6gWRJRXHWBbMxysJgEVvOxEC75PoN8G0NE8ZhemRb5qJaOHISR7FUOmUkJBoA96PkyzeLpeJ9awFkccOQ9GZ68ie6yRwKbpcUBwxv418zW83ZlTyQl+xuvxM3GQMtO26CdFyIkb7SazGIELzEwVia2voFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993113; c=relaxed/simple;
	bh=CZqEiUd0s1xxUPifcZ+/8kJbZFhRW8RHh7AsgkrK8Qs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Irotax2VSBDrdrnO2KsglHetZsX5bpFdSfctHbjCDpqgxODbO2+1Iikkhwf89lTfQPQgIJ+UoOc/7R+CKmej4XN2Jyhm1MIgXsSXyUtoKDkGwUpnqeHg8xkhDZUambuaJlXYaIgZdgj/SCZ9XFntFF23NBdppbSgrOxJj0ewKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyyUzzTN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyyUzzTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770993111; x=1802529111;
  h=date:from:to:cc:subject:message-id;
  bh=CZqEiUd0s1xxUPifcZ+/8kJbZFhRW8RHh7AsgkrK8Qs=;
  b=cyyUzzTNjdhLxUZkUBhiZIMrymwsALGfr/8nVQNSnHGTzkHZHHSmL9js
   77ZosyEQjet/s+jGcgGf0XSs1HUMNd8bjrEcxR5BTYVwBomzAduOqW3J5
   OFgEDUDDqduavP7ZHZeUFvvlDUTRVd+NlIJkwIUdDy7dwkXaOIVuu3aMg
   2NuNGdVZYJIiFRu3rsb50GmEGF8nVDkDbEfFwDtwj/dnNyrZVBnP5RAP4
   d8now4VC2eHWIUlfI6mNxbrZ2tn88Z2ifDiPCOQIx2SXDgdB4FSigb16R
   H72GKvMHNTalWLpKSgIFwNe1e1hqDrdkORmpozPpzYBxj7rDnQn6R4UtA
   A==;
X-CSE-ConnectionGUID: +IaCM4ALQ6u4dC8PPZXYdg==
X-CSE-MsgGUID: ozJjM8njReOsr3BkOi1JkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="75799033"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="75799033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 06:31:51 -0800
X-CSE-ConnectionGUID: p24WkonPQbCmAHEIWskBrg==
X-CSE-MsgGUID: wnfYpUnlSzy4fUNwvUF8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="242340686"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 06:31:49 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vquCw-000000001cX-2Xgr;
	Fri, 13 Feb 2026 14:31:46 +0000
Date: Fri, 13 Feb 2026 15:31:07 +0100
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/android_u 1/1] versioncheck:
 ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
Message-ID: <202602131539.zu7yAgOR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   7a3552a558d85f246a5731a63991323dda742a4c
commit: 4f29719d32db19c7291043693e973b463d7df25b [1/1] media: intel-ipu4: css: scci_IPU4_master_20181222_1218 fw release
reproduce: (https://download.01.org/0day-ci/archive/20260213/202602131539.zu7yAgOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131539.zu7yAgOR-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
>> ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu-bus.c: 469: need linux/version.h
>> ./drivers/media/pci/intel/ipu-cpd.c: 478: need linux/version.h
>> ./drivers/media/pci/intel/ipu-dma.c: 460: need linux/version.h
>> ./drivers/media/pci/intel/ipu-fw-com.c: 480: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2-be-soc.c: 366: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2-be.c: 306: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-csi2.c: 939: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-media.h: 138: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-queue.c: 1536: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-queue.h: 172: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-subdev.c: 1073: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-subdev.h: 227: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-tpg.c: 359: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys-video.h: 169: need linux/version.h
>> ./drivers/media/pci/intel/ipu-isys.h: 178: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.c: 883: need linux/version.h
   ./drivers/media/pci/intel/ipu-mmu.h: 62: need linux/version.h
>> ./drivers/media/pci/intel/ipu-wrapper.c: 515: need linux/version.h
>> ./drivers/media/pci/intel/ipu.c: 771: need linux/version.h
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu4/ipu4-isys-isa.c: 1076: need linux/version.h
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 19 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./fs/incfs/integrity.c: 8 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 232: need linux/version.h
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
