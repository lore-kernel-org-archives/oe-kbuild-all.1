Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF22482CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726841758; cv=none; b=F46fVp6hqnGKLvWNr55lxdMMzLICIpVgEqg3caoxFFEQZz0r+ciq9YsoSWkKtzgkYwhwFsbTYcxXleJBzE3KegVpxusJuoTlKIW6Yt0pgN4KJ0TIYv5+KdDkpWKMpiT2tPu2ASalmqEFo49wM6gw+EkhfJC60xabxLYPajd9ZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726841758; c=relaxed/simple;
	bh=s7Z2yD8W7Bt3nmb50tK0LRarYt+RKLWXM8GL8UX0Rx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmlmGlGgZgDp/sJtkjaM7yvD98a97cW0VTelU4wAEReuVi2YJ03VeSmRCaa7Ddh+lfjy+fk46EgMeEUmqd1mqKNi+FELXCgjfuRZ59obCuFjGFUR6oaSdFMUJMtUisozojBtzNR0jU2NyVTxrMvRBeD5P+8mg6G9N5U0js040kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCCp+CX6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCCp+CX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726841756; x=1758377756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7Z2yD8W7Bt3nmb50tK0LRarYt+RKLWXM8GL8UX0Rx0=;
  b=eCCp+CX6gpVTxLTvDb5LAKDOu5zK6PK5CIs1wDAPviNh8ODZBuO4RvtD
   +zNVl1JOPFatO5Trcb4sHSTQBA5Q98kcWRfy/NDqdYI+x/058xOgqebpl
   NYqEA7hMF7YZbScNBkuXXa8T2QVLRnPklsNpdv7WDrHUc/cyknRC9ro6X
   e/z990tSrQZepYBeoOJzyaXstL1zPDgYGIdLW5Zcn1N6FvaFl72PearhM
   rGy3EmAhx9u5wAEYlQ8a0wdLgjzpWPW43p+1q5xus5/wWPUZV6nVMzIQl
   VUXFA81QTgE1Clc8V+NEzLABV9O6phUjagdPhOtzp1t5OxDKwspQLhY0F
   A==;
X-CSE-ConnectionGUID: 8Acs/2DLQZGI42UbczSKXg==
X-CSE-MsgGUID: 71najzkjSv6lG3foL6rBew==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25368167"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25368167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:15:55 -0700
X-CSE-ConnectionGUID: 0HSFcw4RTlqhiywCFHqGiA==
X-CSE-MsgGUID: 0IRX3fBkQ0m1d94Fa+Dgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75259432"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Sep 2024 07:15:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sreQK-000EWL-0M;
	Fri, 20 Sep 2024 14:15:52 +0000
Date: Fri, 20 Sep 2024 22:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4621/16779] versioncheck:
 ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 40
 linux/version.h not needed.
Message-ID: <202409202209.dBQC84HN-lkp@intel.com>
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
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: df8db0096d064c633b7ee07c8b21dae16e7cd677 [4621/16779] net: ethernet: sdk_fman: replace '---help---' in Kconfig files with 'help'
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409202209.dBQC84HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202209.dBQC84HN-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: 40 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm_port.c: 40 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: 40 linux/version.h not needed.
>> ./drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_sysfs.h: 37 linux/version.h not needed.
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
