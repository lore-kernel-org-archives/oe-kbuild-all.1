Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AE2F6928
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 03:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162368; cv=none; b=a8RwY5BfPXwXUrDHZ5bl0yTKAyukFQ37B+arYY64jTRe1owKtgxTiAk/JmqvPetNeIbMeh8jlWv/srsPXGJL+43xYcXwLnd9PQbjxhRfNSwtfyv3GAv4R04qJ82b9n/LM3rrY1aMrvocv4wcpC45djJ98G2j/pmWOAEY/nQhvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162368; c=relaxed/simple;
	bh=Fh5ziuVqlTCCNWjGakzWDKAXIhJAKNeQkQXTmR/0Jj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+urIS1aEcNxvfMl/zF85GNTTim7+8JRoaGMtYNBSjMIwXUtc+QOewyf8zO1ilZnBZWUNYac/5/L7DRbzcmjJDsJDhm8qOPjhaiBfR80eI/CsNu+hmUncKYXC3aV2cZN11Ndfgo4H611hc2oD/kc3g85HFUbAjqkixvnlsq7zuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSB1IuVn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSB1IuVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772162366; x=1803698366;
  h=date:from:to:cc:subject:message-id;
  bh=Fh5ziuVqlTCCNWjGakzWDKAXIhJAKNeQkQXTmR/0Jj0=;
  b=FSB1IuVnhSbM2p2GAl7wP0tt9VLYpebNeKPO07kxp0uLf4FqDI2TYSc3
   Yy8TngdgoSmzwG0Tvxwk3rWl5lP+uU49xVz9gNmTmleiBb0PAmOgkYnAl
   ONg/CS96BAx/4hyPEvGGfU/KbPU+eKbnStpAcoCf6yLzLGeYvLkay/jLY
   KUPc6DFDhsXJjl2gM3qY0Ulkr1UTCssX/nqgdm0WY3MTpczSN+ym1XCnA
   EwKDhjoT2c7a8/qOwYXUrdD5J9MZECEoYx/cE8OEn3C5ZsSKSIE1xSt0P
   SHoOAXkylxOFLeBCuxtcUqyCTAD1PEQ/gT9xRJ1Ko9pkHF4y+sjv7W3ap
   w==;
X-CSE-ConnectionGUID: hlWRzgMQRjST1M0LLxEJcg==
X-CSE-MsgGUID: A3/ecc2eSB+noA50fat82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83949142"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83949142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 19:19:25 -0800
X-CSE-ConnectionGUID: OLG28BD+TAGnAbWFbWkb/w==
X-CSE-MsgGUID: wctDAkpATraHzzrVQqRbiA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2026 19:19:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvoNu-000000000Rd-2csK;
	Fri, 27 Feb 2026 03:19:22 +0000
Date: Fri, 27 Feb 2026 04:18:42 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] htmldocs: Warning:
 scripts/checkpatch.pl references a file that doesn't exist:
 Documentation/core-api/asm-annotations.rst
Message-ID: <202602270452.UeW86k32-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b5e973f489e4928831610623d5e272716600ff94
commit: abea1cb16e43c1dbbcad5b826fe6952c343f59fb [0/1] ANDROID: Snapshot Mainline's version of checkpatch.pl
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270452.UeW86k32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270452.UeW86k32-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: fs/locks.c references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/core-api/asm-annotations.rst
   Warning: tools/perf/.gitignore references a file that doesn't exist: Documentation/doc.dep
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-prog.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-map.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-cgroup.rst
   Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:91  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92
--
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: fs/locks.c references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/core-api/asm-annotations.rst
   Warning: tools/perf/.gitignore references a file that doesn't exist: Documentation/doc.dep
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-prog.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-map.rst
   Warning: tools/testing/selftests/bpf/test_bpftool_synctypes.py references a file that doesn't exist: Documentation/bpftool-cgroup.rst
   Warning: /sys/bus/iio/devices/triggerX/sampling_frequency is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:91  ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:92

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
