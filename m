Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F93A7F4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781650328; cv=none; b=FTBh0o+5j8G95G1XBJijOvtHN+QXZGl4qXIneZ6KDLbvIztr0O4OZ7+UvvpCAhLvG7CLYeKwWdbwr8z30PFwGBKoiQ3oQPOLyBq/VmxfpPAskWFwUM69T73EBbLUmdkbR7Fps4VSOVPGOJkthHN3JJJMdbXiTqRNJ0cADlOlV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781650328; c=relaxed/simple;
	bh=c6U7BqyQ69cXsAxR++4TmI/k4tVgzMGAGBQhgH2v2ek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NO9iNrjFvclsuCDM0wqQeaCJerjEA6LXE5gaCqwVx+rB3R4cHUKSZio83kxh+H+sS0bx31bfKiLDgStXbdpt6dgQibvibuStVJcSBMWRtfD/GINqSIlUxZr5IuKMYGz7n8Ri9auTwDSxDuu27PVP4Yc8VaEeeNRIf/touk60ilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Esg7ZaA3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Esg7ZaA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781650327; x=1813186327;
  h=date:from:to:cc:subject:message-id;
  bh=c6U7BqyQ69cXsAxR++4TmI/k4tVgzMGAGBQhgH2v2ek=;
  b=Esg7ZaA37A+5rzkVfRlRKwuoLUXHU+f2W6zF69tLeEYMQ/RxDGpd+Npc
   FNRH/Jpb/LWHAWJuEZfmRvIL/DLYV4oHzSkWd6ELixSB5K1UmAiXkuj2x
   NCIxvUpawOXNsEDkpnfHEdURjhkw5LT9V84276XFlrmtFXTlVexUEthgd
   o9SsdvQ7SByIutBbgdHXQ17fkg4GljVMcYYpqW6OJA43nijSHkxzV8nOT
   CL/QN/Xq5U5GvJ/Re07Mc/krsKOkiLo+Mh7mW3DRSssAUrgWOv/uX5Bt1
   o6p+KdtbNMw2YsFZfD8LZLq4DMjIuPNx4xwFBfQwreSDeqrbSmrN1NKNc
   A==;
X-CSE-ConnectionGUID: iGjkv6TXS1OKqKutor7+4g==
X-CSE-MsgGUID: MeqI8L2IS7SxDUCnsqptQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82478831"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82478831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:52:06 -0700
X-CSE-ConnectionGUID: kUuYlmLbQi6D1sAQzePSow==
X-CSE-MsgGUID: yiF+Hvc7SUOxjUrnm76WAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241550083"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jun 2026 15:52:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZcdX-000000005Eh-1F82;
	Tue, 16 Jun 2026 22:52:03 +0000
Date: Wed, 17 Jun 2026 00:51:21 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] versioncheck:
 ./drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c: 24
 linux/version.h not needed.
Message-ID: <202606170045.tPIfLMOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   a3dd7a9a9874cb20a2ad24b712853d9e56778ea4
commit: a3dd7a9a9874cb20a2ad24b712853d9e56778ea4 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260617/202606170045.tPIfLMOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170045.tPIfLMOJ-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c: 24 linux/version.h not needed.
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
