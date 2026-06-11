Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9173BB117
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191137; cv=none; b=ugR92E0m8D/SwJVv1tEtgp3w4e88ygILHtHUipQ6MWv6JrmdLe1kuc50idnqFM8HUm4s5FGIuGKn0YWfYmxsG6Sy1BNVhRdu2/WSCljSNb1VfRSo5jx830LG/rDjRdlymLve1Le/ugffo19NKr8SftB2crBI4a3+XXqTjFUh4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191137; c=relaxed/simple;
	bh=guXSVKdhixiNuDY0AMkc5kgOOk0OWQf35Jnt8j728Yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fVHzXwM2H+a2Jomj4MH+VHwAZ4agKlLQc7iZjjklUKw+52NLQ4eTBcZoLDwOk9BsNcxK7rt0KQe9ex0tKiTAhWeU4rMM1H03QSCSkqz666CRGLK7T/37rosk7Y+DmZCNPwcDHFNeTRFUJQJAWy0o8ScTXU/OOiDtQpnjJ1UnTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfrqDu6Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfrqDu6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781191136; x=1812727136;
  h=date:from:to:cc:subject:message-id;
  bh=guXSVKdhixiNuDY0AMkc5kgOOk0OWQf35Jnt8j728Yc=;
  b=hfrqDu6Y/ZAyanlCym2HA8Ynq+F/A3tVRE1IXPApBzFKgyCAp/xOzc1l
   MuOkuZQu8KbgD8SUtuq82vyEsooMVUFprMbDMMl+HXuWBE/77a3FwkoMs
   XEIpCySEen7hHMVlOz+FYFWufwF/jhxSONUBD1eHbmAtIw7Q+RTYcKEWW
   YUXWER5/oe1ZryqfRWeUi8hOjnN2XIGraYM5m8v17pOhA+MO/cSku5cq7
   QBup/xtPa6DEettcop14IDTmJAF2ey2p8q0zYqQtf9sbgywgHYDE0kJ4r
   WiooigdrfI1a3TpQIDBXWVjjGnNyzyJAefny2zktVH9qO1es+kMCS67tL
   g==;
X-CSE-ConnectionGUID: 5HMEtOJbSvCSoUxyOq3EHA==
X-CSE-MsgGUID: YXpWuUIKSCquuGaIUZ2BaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85846833"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85846833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:18:55 -0700
X-CSE-ConnectionGUID: p132RhIGSQm2SK0olqHiLQ==
X-CSE-MsgGUID: d9HsgI5tRkKVkhX2Yhw9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246385745"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2026 08:18:54 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhBC-0000000042j-4AaC;
	Thu, 11 Jun 2026 15:18:50 +0000
Date: Thu, 11 Jun 2026 17:18:26 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 3/3] versioncheck:
 ./drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c: 2481: need
 linux/version.h
Message-ID: <202606111741.LzcZ37VS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   a235b3f30d6299ee67af8059ef1bcf76d470ee29
commit: a235b3f30d6299ee67af8059ef1bcf76d470ee29 [3/3] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260611/202606111741.LzcZ37VS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111741.LzcZ37VS-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c: 2481: need linux/version.h
>> ./drivers/accel/adla_legacy/kmd/drv/port/adlak_os.h: 130: need linux/version.h
>> ./drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c: 616: need linux/version.h
>> ./drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os_base.h: 46 linux/version.h not needed.
>> ./drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: 727: need linux/version.h
>> ./drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c: 485: need linux/version.h
>> ./drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_io.c: 89: need linux/version.h
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
