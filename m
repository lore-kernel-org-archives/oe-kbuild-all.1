Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F32446074
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423401; cv=none; b=lX19zByOUtDwJ4HoDH24y10a4GEDU/RIQMt+2v2LHVlyC9BvYhBP+Pphx8hIb7iR6bExXx+ONbnrdfuwwcOjYFD177xHydXGCz65nw8/qFWxJC+xRs7Y58MGp/ZvOAy7j52oqdP5cyKfNh3nwHMXowePPr4hVMwb2q8C37Ks+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423401; c=relaxed/simple;
	bh=vvnJCYsFFvgqZYTElIH3fTMP24/Ta+kF9TNTTiW7xEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nwHFRBcpgJ8SE0goRb/RhJik79N8od6rM9APTrLT1Fzx1+sjQ1XY9mwMee9tGx9TTKFhkILrEQiP3mP29Qb8FJXqFwnWLo70jjXhMUvugrqxB+8qREDLKJ/HFhpYrRoMS1b0ErpIxbFNZ12C3A0rv874CCEXDoJu/Tk87LEarho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cg56wsqr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cg56wsqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785423400; x=1816959400;
  h=date:from:to:cc:subject:message-id;
  bh=vvnJCYsFFvgqZYTElIH3fTMP24/Ta+kF9TNTTiW7xEo=;
  b=cg56wsqrUYzSVriFEnUSw/muW0PEasO7LpW9pzM30K5GbuIwDrhkNY7P
   auPIIj2DqB8rJjIkw7p+QzGOxJRkwJG7+tXRbopCdYQ9ZqJwMDGWFISak
   0YdK7MOyHLSHiJ4noeQdnM3Oy03qDy2SvgEtZoxXU6UGnN0cgo2vXp3D5
   Jcb4Rkdu6f0yjqphNCZbdu9Oaia3E68+Fk/waeMMIt2VaGNKgBSVRqcNb
   7SDTmmj0uXxrHNFH5WP7qBTp/XG+JnXgZ8Bst8dPpQACSHAZYDzbfYV3Z
   42t5GqwN5p7qRuAzjGFWCPXXzSX6jJlFZJepc6T7qNsH25iwAO8HuIBvV
   w==;
X-CSE-ConnectionGUID: wOpyBarhSVePP+W7CvLkbA==
X-CSE-MsgGUID: XeYll+IoSAKxRASR260Haw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97558572"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97558572"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:56:36 -0700
X-CSE-ConnectionGUID: efO2XYvETlamuzI37W0o6Q==
X-CSE-MsgGUID: 9cJMYCNpSaCt9ykla1b0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264599133"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Jul 2026 07:56:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSBV-000000002Os-0Ymj;
	Thu, 30 Jul 2026 14:56:33 +0000
Date: Thu, 30 Jul 2026 16:56:12 +0200
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/android_t 1/1] versioncheck:
 ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
Message-ID: <202607301618.etIUunOu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: 4f29719d32db19c7291043693e973b463d7df25b [1/1] media: intel-ipu4: css: scci_IPU4_master_20181222_1218 fw release
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607301618.etIUunOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301618.etIUunOu-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.58.0-bindgen-0.56.0/cargo/bin:/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
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
