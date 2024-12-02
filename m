Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E117C21C17C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150023; cv=none; b=qgA3zSIJrHwAPUqlqIxUnC8m0zP+FGYqA2pzF8YaIvNf1Fy4s3vJGPo8plCICAnT89sFAEw6FC5/iZ4u0JwzoLUgSFA4Jsf8waS38dKi/QoXfO2HFfLmT2ykez/fRZolWuUlFzeNsniMxUswPOWFKNTfZK/OVh3Ds6DLKn4ZUys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150023; c=relaxed/simple;
	bh=a/25HVs0yA6eBaSB6rSCqAy9E99LVbbWKBcXuJ9I+f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftGkmRvvwUZtQsZZU/lLOt/vTCLLjMR0SP/QGNjo9p/9k9zoFH4w67CR7qCUyrfIWkib5XRjAvLZstgR+LlgPUHYSl2FRQ2Ca6naPbTJCq1yuT4NFjD4XZIqHq2YIpzMN/21IDnOQXr2LXI91d3xxOBe75upCP+mfPuxOGLsxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfJsrKuh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfJsrKuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733150022; x=1764686022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/25HVs0yA6eBaSB6rSCqAy9E99LVbbWKBcXuJ9I+f0=;
  b=FfJsrKuhxImDmNye/wbug59QsDhA6oAwS+6lFx0EdN/9DGz33J4crQ3s
   nsKbpuz5+SYkBgYXXyWKLc6BiPvc+5pQ/lQk66vU9sCuF9pOgDYaEuTWA
   iuiI0xNiRk7XOFVB6YbG3TL28S1IUAyQwcFp2AlyOZiqlDmjxKN+OiQ7D
   bU55iEdbtMGgzckJaiJ2q6csRrilPsON4SQW7vAnviK7iuh/plp1h0cJR
   HOYAQuxAKwYAb8oIy8TftsalTYM5hUC5+MxRY2HGE96Kb4h3jrjdMRQiw
   8RJntjfe97hJB25FVm+9XjS6yJE2/Y15Ud68hSW9Az/AhPMFx0vVxobc+
   g==;
X-CSE-ConnectionGUID: wCjYvdC1SbGBfPfi4YL1rA==
X-CSE-MsgGUID: L/AURhBOTJe6HHsQYjFtIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33062928"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33062928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:33:38 -0800
X-CSE-ConnectionGUID: Ok9RwDSLS625M4+A3AIFgA==
X-CSE-MsgGUID: 9u6NiAi1SaSDBYnjPPg03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97196467"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 06:33:37 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI7UU-0002Ut-2m;
	Mon, 02 Dec 2024 14:33:34 +0000
Date: Mon, 2 Dec 2024 22:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: versioncheck: ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9
 linux/version.h not needed.
Message-ID: <202412022244.0PSi8x5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: dd65acf72d0e073970459d5da80573a04304aaa9 selftests/bpf: Remove SEC("version") from test progs
date:   3 years, 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20241202/202412022244.0PSi8x5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022244.0PSi8x5T-lkp@intel.com/

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
