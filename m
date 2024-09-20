Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0A1BF37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850405; cv=none; b=IKiRPwSrG8wBMbBGb0m+uafr66lusVaDN11S4EIEkvIZ1deInzWuRmC8snTHysm7f6X4Eb3lx5g/dcov3217GzLS4f/HLYFjhNnbVVTbIImWTuatFYjEHaAGEQOwW+BcDHlhE20aw2IgVRhErx38O6McKt8gZdYFaxfFq/3VHx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850405; c=relaxed/simple;
	bh=k+cNxakhXuT7n/sW/L129gHzos7ZQUOfLSGfK33QxK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxHk8fXxJPKFi6aBkQvJkJwI4iVzUx7hsLCLZemd+JV4cgudFFWp4f75Bate/Ejhw3+q1s8e9kx9bNnQVgAv5jBzyABuKElAIAfMOkdB6voTgNIOwqDyhn9zvC06ccdHTf6Gg2mvup+RAGPy/+vkbUcyAzIvm++CF0ShMoj1EtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POGR+pX6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POGR+pX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726850404; x=1758386404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+cNxakhXuT7n/sW/L129gHzos7ZQUOfLSGfK33QxK0=;
  b=POGR+pX6NWYyO3TvFDkBza6fZiPNVC0o4j6HGqEq0QZ8cYYwubDEG5Gl
   DvRusjKd3vC9LtpQaxsRhm1jYpmz2TWflAAW2ogmypqXAwfV0IMNErdsU
   AjQpeUR4tPUVMkdqzvIL4A6QyP1ZccydWGw5GbN4CFgaMkWBopI8zEOB8
   oJNA8FlXt9RxMT622ldyCXvw1kd1MgReyuqUOvuawRPZCYNtDtGZ2sT4X
   CSsNdsrh0rgrdNqdipsr2oLNnFF5I7KOouspuRIrMtYmzOR+asDBmkn59
   kmn54G8ocrsIs+gw+g/ambLnAWPNAdTAF41Wcxzzs+e1oL1ccrX2LtkFl
   w==;
X-CSE-ConnectionGUID: 8f4legvlR8mIojWXcEQ8nA==
X-CSE-MsgGUID: Nm8qWuOHTPaWKVlAbYxNPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26012464"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="26012464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:40:03 -0700
X-CSE-ConnectionGUID: Z+LJf1DbTDCzQrlcF8ZpdA==
X-CSE-MsgGUID: CjYo41yxQcejEOiL+2URuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75156432"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Sep 2024 09:40:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srgfn-000EfB-28;
	Fri, 20 Sep 2024 16:39:59 +0000
Date: Sat, 21 Sep 2024 00:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4663/16782] versioncheck:
 ./drivers/net/ethernet/freescale/sdk_fman/src/system/sys_io.c: 33
 linux/version.h not needed.
Message-ID: <202409210035.Zj8laLwq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: 22dba1ad7dd008079d0ba2ce70c78df80879ba01 [4663/16782] net: sdk_fman: remove obsolete modversions.h includes
reproduce: (https://download.01.org/0day-ci/archive/20240921/202409210035.Zj8laLwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210035.Zj8laLwq-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/system/sys_io.c: 33 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm_port.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: 40 linux/version.h not needed.
   ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_sysfs.h: 37 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./net/tsn/genl_tsn.c: 12 linux/version.h not needed.
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
