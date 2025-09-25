Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F834BA52
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758770795; cv=none; b=WnqKmV5aD3kzV6QtqEvhHZ1/5iSfiPMUe+JQ4H8hL5DA9aJM+dxo/FZSwQIKb4zWi2pWTJpdKc8gEnlFuKQYhjMDQ5ruE+UotqUthMpi/RkODps9hlNYGrmtf1XgHRN84d8j42Z2GXTQQ1mo9ULQHuOtWejruN9scD7kIISB3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758770795; c=relaxed/simple;
	bh=wwdd41SNS5vZtwDOOmEFK2a4Gj2wlqtkjPllVIwODW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mv5pt2AGiFjP0aYRL8qOjVvjaCAsQ4x9pstIHJk2RlCWRWTfcE68W//3/o3DAtrgN4PYbN/bFwk6KOa8b3UR/Rhftwmb5sN3hygjycm/sSxT4w3wpHJ4WuB3Ev9HtPkpSkBUBmQc4jk0eFDci+tzmvAPdQ0E3Fl8nX094qPg5WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGVuYW9+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGVuYW9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758770794; x=1790306794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwdd41SNS5vZtwDOOmEFK2a4Gj2wlqtkjPllVIwODW4=;
  b=TGVuYW9+Y1+CkNswoOfcC4mLB+SRuNPuN3EE6IwmZ/XU0VxZv3E8hpYQ
   9zVNP+86bkidB1ik7xQ/3PzymgvwfEZ6iJ6/w/w0+SGbTnIQGpKYfbtbW
   5GZJI4+7JkntptI7QSW+ej6XNnWo34/4oFs7MWygHBI+F/yOdaHJ/p/Rg
   BclCQqeg9eUvLPLg5GGEtSyAkFiZfaALTka5rd2/cLWidMAny0aardcyu
   Qqkx1DbuMtsJZHLAd045wV8hiiTldNfP400Bh4u09Mzsb5VEuteM4oTHg
   CRsMM2StnLEkB8r8ZlwaRe34AeTp3VncOiFZnC3aHFgrtbyfqkYQLdcp7
   A==;
X-CSE-ConnectionGUID: rBF9VWcER/SgPB8CVEfKsA==
X-CSE-MsgGUID: pjEJHL5/QQqbSjqZwTR/NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72181341"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="72181341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 20:26:33 -0700
X-CSE-ConnectionGUID: EiUI+T+bTsGMxmrLFgWkAA==
X-CSE-MsgGUID: vfAHrEIKTCCnUSzqe6jYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="176808672"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2025 20:26:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1ccn-000000004mQ-2Bqf;
	Thu, 25 Sep 2025 03:26:29 +0000
Date: Thu, 25 Sep 2025 05:26:12 +0200
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>,
	icg_intg <icg_intg@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] versioncheck:
 ./drivers/media/i2c/ti953-ser.c: 11 linux/version.h not needed.
Message-ID: <202509250557.hPSdJFR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: 4f29719d32db19c7291043693e973b463d7df25b [3/3] media: intel-ipu4: css: scci_IPU4_master_20181222_1218 fw release
reproduce: (https://download.01.org/0day-ci/archive/20250925/202509250557.hPSdJFR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250557.hPSdJFR1-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
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
