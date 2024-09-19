Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6F33D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726713188; cv=none; b=tRxLDndEeUv5vkFisg1K8wDnwG9hImqQ+rAgOPt2EE/yQk9AXg/XZAVH3xED6YublWL0Q6C6PH2hAvHKERNV21Q/9PufoP4fYY1+Zw5R24RHcje3hkMwCgwhmSTZ39Jj+ZSBLOjg0yVjHz9sLStSzbKgK/HayleSpXRk/rNM/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726713188; c=relaxed/simple;
	bh=s/0tHyfwzyUQzSCBAbzIZzszt7ISBM1BSeranvsvRls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQT58jAJIWqpFXaxF2kD4OtQJCUjwmPjcj4ZFoMBNnejN7eAWRjBLobiXS84u3YfPaDrA+3jwQF15xpqmTpd49gy0KNNvi57cnCeBP+cztJiwXFLYKFRQxhET3k+AowEZkRo5m9bdmkza5M5LuelyJsTq8VcC9W4BGIumcLSebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0xzJ+Qy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0xzJ+Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726713187; x=1758249187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/0tHyfwzyUQzSCBAbzIZzszt7ISBM1BSeranvsvRls=;
  b=D0xzJ+QyOReHwjQpdNVRPQc4mUxmPvNBWWddh4HdADuD8nIcjk4OdBms
   KT8QpJjnqHbq9pMtMSoo5cFvNRKAxcDWxRw1x9aN+//Vuf46kFRQTBREx
   /cx1Rxk698Yv4MXZ455QB7lnN/ZYzSJLGYR1TMAYSTzcrVaGb8qMd+Fz6
   8ybHQgyibI7OEuLC8kWN2n3hC6J6xb5Xt0P7u2MIgFuv4Tga3eNzOnPEP
   VP6CkWMzZMkUrv2WcuRAGVjESKMVYW9Ee+IyKA7aC+ybNrkJMWOdke9wE
   3cTvwx3N6ugFPvfXjq08fFTUTKUE9eyFFnNHk0dfgHvjA2m8XvGGFf0Q5
   g==;
X-CSE-ConnectionGUID: W+b6ryjMQcKqurXFVQ0QyQ==
X-CSE-MsgGUID: OGnPI6XvTPOEgneihCzUqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36226622"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="36226622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 19:33:07 -0700
X-CSE-ConnectionGUID: NlCbsVMjQg6uGSGXHqqZjA==
X-CSE-MsgGUID: DLeR6TlWQxyeHlQhSKFoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74315461"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Sep 2024 19:33:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr6yd-000CpU-0c;
	Thu, 19 Sep 2024 02:33:03 +0000
Date: Thu, 19 Sep 2024 10:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3139/16779] versioncheck:
 ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
Message-ID: <202409191021.P9qKp3eG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   60c5d539014532e8a81ac01467dc47b2c67b77c7
commit: 128586e3fb789efb20263e3da10f7059b68a8e26 [3139/16779] LF-1762-5 mxc: vpu: replace '---help---' in Kconfig files with 'help'
reproduce: (https://download.01.org/0day-ci/archive/20240919/202409191021.P9qKp3eG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409191021.P9qKp3eG-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/mxc/hantro/hantrodec.c: 41 linux/version.h not needed.
>> ./drivers/mxc/hantro_845/hantrodec_845s.c: 40 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
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
