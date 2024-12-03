Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980D1925AF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211662; cv=none; b=iRBn50hOisg0GeJmIL7rEbSUYLnVZOeFjyHtAcMiEEamZp1anhk1nyQNxenYaU1q6Hqd2zkcyQXE437euHYk/+D2W+3Gh/k33uAAh6YwD6m9OGKOuUK1XqKQRCRIzB+SvZV+kMotLMA4ZtVflbO/swmqhopm8nhprJVWE0deEdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211662; c=relaxed/simple;
	bh=ZYZJ6CVtx0bfhYyPg8Y+yJP5ZY2jBouRmSutZeAGxHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XonOO66f1ExzEq/A3b/Su0ecgQPD70CFAVxRNNcucaNFJqjudqB0JUT9dUROZ48gEt7VO5O09/WvR/pxm3wC5m1F4KteZzM6wDkm7fIvhhAFChGbaFA24lFIHdsOlgRAHah1I+HLY5t7lwyEyidI4YKp30tuC74Yc7X9E65qTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfnmwyc3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfnmwyc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733211661; x=1764747661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYZJ6CVtx0bfhYyPg8Y+yJP5ZY2jBouRmSutZeAGxHM=;
  b=nfnmwyc3m5gobqe7YLNHC2yLrXWGnB48+EIbtvlvEvHMQOi2UuTysVFv
   Mvc/dEp6I61j8EDKtJ3YVE0XJ2jFK/BRT8ZEO/NPqyQHoWCd195QwJUAe
   cKPwSFFj4iecKfgU/Jw592Np2OZLKnsFGzuZgX/dOy3gaJBUE+40LpP2e
   CIn2m4jPvvRYqZm9R9xa8vWF53C2L6M06MFX3D5vl12fhoy3O0XvLKAB4
   0irQWA2Eb50QdgHFYnhvzvTTUaTOTNbvZBGOuCnpozjKX+sITALDln42w
   9nJ7nKym3PQTdIdw8ZSKxkmL4v28zGL9k5yw0IneU41tyhj0oy+I1DSP8
   A==;
X-CSE-ConnectionGUID: W6qjrfbNS9GrSvidKv0ycg==
X-CSE-MsgGUID: jcmyXeR+SCCBftqCNcSiFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33468505"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33468505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:40:59 -0800
X-CSE-ConnectionGUID: vZfXRxSYQe6SUHuXm82UNQ==
X-CSE-MsgGUID: jOiv8j6pQOGRmpdyzIu4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98126660"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 23:40:59 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINWh-0000IN-1V;
	Tue, 03 Dec 2024 07:40:55 +0000
Date: Tue, 3 Dec 2024 15:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: versioncheck: ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9
 linux/version.h not needed.
Message-ID: <202412031555.UCGHkMdh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: dd65acf72d0e073970459d5da80573a04304aaa9 selftests/bpf: Remove SEC("version") from test progs
date:   3 years, 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20241203/202412031555.UCGHkMdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031555.UCGHkMdh-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -Wformat-overflow -Wformat-truncation -Wrestrict -Wenum-conversion W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
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
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 262: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
>> ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
>> ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
