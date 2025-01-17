Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CED1F758F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 06:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737095822; cv=none; b=Oq0HLNBlhYQ0W7b7itQYrppmavPUv1f/faIoogZPyCSegTAwgl7fTqm3pDuEaygaCKijNK15dsz+++1pPtkH4Ix3XrRpU7vWIO43QxWOBG1+6R4jvucpcvU1VOCQypbkUJt9XBay8XpxqP5AaKvZs7udcGJ5syog7irXHuFc+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737095822; c=relaxed/simple;
	bh=mHeuyJU0Kxrjw2wgDrkIPajeFthZDke9wD20je7ALy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SrovGy9UID9+NSRdGiV3YToAGABWeCqDKqeG78iNLZEYjnlLhKyx1cfj7krDo58ZMC/aI/aXo+UiQc9S3l4Hn4yvuNxsSvWBrBiJqZX/tX+pD/EbXTf/JAvj+JQfA+yesESOUqb8yB+91sou8SYUNkY7Hkoyu177lULIvNntuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkweH70x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkweH70x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737095820; x=1768631820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHeuyJU0Kxrjw2wgDrkIPajeFthZDke9wD20je7ALy8=;
  b=JkweH70xgIVys1JKCtLCVDp2tR1MGnADSt4/1f/ByxOVsE0LZRi0JjAu
   UMRLjCDXKik2gsQUeistto3VkjEWPofRdmp2oRPMSm/kse76OBLHAtaHn
   GwfqWmGJEZxlZqbwxs/83tUBgH8rSep3XJ8JCVceg01ytGcqLZXrc+0vF
   2SjyFmdYz4RZbovpytKQAx/pgEbobf1RtRt9vw9hJ1UeiMwJQPImKOtHm
   Gv40hDnaNfPfLicoHil6gSfmO7ObsLocQJ8xm6lpjmfzRbsnk7OiMSX+4
   zBLHuGIRXjjsdztVS8WRlfE/BVNykVu23IHpiLBeDYtV3BJsFvsT5BfJt
   w==;
X-CSE-ConnectionGUID: GIv0/CigQXCz2wQDdstrfA==
X-CSE-MsgGUID: JjZTfi7SSd6sR3rKBjxRzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48009342"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48009342"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:37:00 -0800
X-CSE-ConnectionGUID: qSozzW5mQXihUynH59OmtQ==
X-CSE-MsgGUID: pFYPtuLQRsCAD2sUoAgbrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143007787"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2025 22:36:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfyS-000Srf-1d;
	Fri, 17 Jan 2025 06:36:56 +0000
Date: Fri, 17 Jan 2025 14:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 25/25] versioncheck:
 ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not
 needed.
Message-ID: <202501171447.IDZuazxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   e5247e8df469b81bea0d59bde9faf0e99e3bb259
commit: 1e2b5b4170dade205fc539537d66ec3e8ef50c0a [25/25] media: pci: intel: psys driver
reproduce: (https://download.01.org/0day-ci/archive/20250117/202501171447.IDZuazxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171447.IDZuazxV-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/pci/intel/ipu6/psys/ipu-fw-psys.c: 8 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu-psys.c: 16 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu-psys.h: 10 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c: 4 linux/version.h not needed.
>> ./drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: 12 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
