Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E2D30DED1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781559654; cv=none; b=tLNRRqG8iTD5x2zXcXnfg6J7dJYqFTuVNKm9cayc+myIIIauCHsrvFWhZ1o1EYs8eftWFVdFjxkyzH1IcGTmmLb+HkIEQ1EPGvJPIkrtEcuV9XliZQ53a39mfsm+0uTUe6QOHjPjQstkV3HCR16x1VXZPGp9kNz12z3D+CwW7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781559654; c=relaxed/simple;
	bh=Yf0sxr4Gax7l07+UkqpcezBZUWp0jZZblDjufHRHkyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAun20cYZK1wmJwDA2MRNjDwFukzOSGNbLOJ6iRdkOe4atYikrWMZ8KbMt8OsaAQqOFPz/imflO0SxeUhming/Y6iK+QkGlNo7n8vDDsRj+Wo3g6kDLfpM2RgPGOVOK1hR7cYy4tk43KVQElxfHBA+XqAdDuOndycaYIXtH38CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHDnDHM4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHDnDHM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781559652; x=1813095652;
  h=date:from:to:cc:subject:message-id;
  bh=Yf0sxr4Gax7l07+UkqpcezBZUWp0jZZblDjufHRHkyQ=;
  b=VHDnDHM4BAejJ2ywADcz0T1F0rjmRL6FdCWaacfZdqBbE9s+aGgrPS5G
   gi1XT6svELQiyG6m3tVTZvo0cdr5K9J0vfX/1BNXlNEa/GwXQsxcMoCqo
   T2rn34XSsXoHd5ILwRzMy7WxJQd0WS1EM2syvOI5QBiFaNA4xrlw4DA0g
   8sFeuC2tPcVosr6yXgLljW4G9KwmCPhQ7LKEQe4OZD9x1LG/t4eihn62P
   SpToGAHmDuUHarue3PiPghSogqL/WuXrnfbeYoZ/Thcpx4qFTJbVPLxDk
   yDvpypaTw+gTxc17A1KUHPcTnEMPPM9o9DAXFrWxdxsToXL2dnByPQ9n6
   g==;
X-CSE-ConnectionGUID: A/7AC5pjSFmPymNk1sGlIQ==
X-CSE-MsgGUID: UEgK+AkaSbGinke2J6ZgYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82055225"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82055225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 14:40:52 -0700
X-CSE-ConnectionGUID: oZad9gNeRU+dzj7SRmKEdg==
X-CSE-MsgGUID: QKDu1Zj8SJePJ84A/WeWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="271656463"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jun 2026 14:40:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZF32-000000004yH-1UIC;
	Mon, 15 Jun 2026 21:40:48 +0000
Date: Mon, 15 Jun 2026 23:39:49 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] versioncheck:
 ./drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c: 23
 linux/version.h not needed.
Message-ID: <202606152339.KJRKaW6p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   6bdef374f5ba12588b2adf49bb4a94f4ba3d0a52
commit: 6bdef374f5ba12588b2adf49bb4a94f4ba3d0a52 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260615/202606152339.KJRKaW6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152339.KJRKaW6p-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c: 23 linux/version.h not needed.
>> ./drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_io.c: 24 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
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
