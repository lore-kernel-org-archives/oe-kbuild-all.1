Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124637;
	b=ewWDk3Ts3P5fZFZrFMseh0DcXhmNQ09qIh1Qidp4UtxaXSXUwFIyrCntZSTX258v0rCD
	 xEWkTD205tEGeHM2q/Yk45bFdWSxXzc7hS0RsKI7uOZR81AG7JkR6SN7eUTUC+sJoRvZY
	 Y8aDzHAMtFS2YXU334IpOzlUj/s8L0TpL+6+g2L/flIRis0tQ49l2ka0B37mawDJxxmXv
	 4GSylpdhKjVOhw5Qmmgpt3mvtQh90DfXKDBgtTeMgJqXxxFs+ME2LY7al84/2bHSgEcvI
	 g0ZVbW69zdHmdiqPqb5C87FA0n1+9QUlX74uJCnoUtHyUcVhYQFJbf5PJw0I4vKhTHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124637;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ss+Lrlf3EizW1mMTSA8vqKuFWSqyehDwRxoJKqC91tM=;
	b=kmnoAR7A5VQjdouz5iY2Gpzi0eSMMsF+1H2+B4ZG+5dSAb9tQ2PkNox6XxkIqx9FbZtw
	 egh/Np/EYup+ubhEM7FMEmTFgHYGHL1tALNrnAd2ms6MaHASYifwO5XD90wfFxksOBy92
	 rBg2N+AKUHQ3B/6L69KfuhpoeBNn6wYhXxG4bt9lEhDIRHkXA8Hd3UYGE2HrgtJIgGU6y
	 VDVn0QMNiVwH0QbRoP6IBEiXDYvfXOGaLvzUmRoz0O/509CI8lMmtHz8RVFxkAW0D+Bri
	 ihP3LeNzA5mTY092UFf8W3FlOY9497h17dIGjqFo/KXTZFwPtxAGAilbW3rzjDYnT/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dOwY4D/7";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9B606A320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 18:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA9B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOwY4D/7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793124637; x=1824660637;
  h=date:from:to:cc:subject:message-id;
  bh=dYLpvVoMkKwD8Fe+YED0sks9BWpFJQKlUlGLQTSwlU8=;
  b=dOwY4D/7dj8ObcD+2FpU9/AYkuWhqGCpnEBjatsSXlzEAd+uVAiHmNle
   VpDT3B5gb2h4WAxEf2tetQL6xsNH8zetm1xSz7KwGC43vW8ZtpQl2N3OK
   3UxtLhBivSxsIb9naOi4lyRWe0RkChK56Zd6QMAMFCJ5mFpMrZbAKmdha
   AcuVnD5pSAWhbBK/dv9FzKEWTnSr8C+ztjIgeInBzZ1K8wqtM8YMg0uk3
   709gG7Xp2zjOX+CPVoLzzlcsjG/fMPPZjw0ijULIjsODahKnEt8FeAXTt
   86+p+bm89vkG0Bf+MtZnlhqv67YHhoph9JudNiBweb1rMw1A5VO+70MXC
   w==;
X-CSE-ConnectionGUID: w9yRxBxkS0ykjQh7Wyj7Tg==
X-CSE-MsgGUID: PZ0VIOMLTDqv22aFVdFYZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1710925"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1710925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 11:10:36 -0700
X-CSE-ConnectionGUID: rxpfLb94So6O9Ho11rRamQ==
X-CSE-MsgGUID: jUPVgX40Tv2QlhD18lV8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5139241"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 11:10:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLld3-000000004aJ-00oY;
	Tue, 27 Oct 2026 18:10:33 +0000
Date: Tue, 27 Oct 2026 19:10:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] versioncheck:
 ./drivers/android/wonder/band_config.c: 5 linux/version.h not needed.
Message-ID: <202610271938.KVcqVLGB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   f10481be4b057d0d5c830ae6c352d780a27bf753
commit: f10481be4b057d0d5c830ae6c352d780a27bf753 [1/1] Revert "ANDROID: Kconfig.ext: delete placeholder file"
reproduce: (https://download.01.org/0day-ci/archive/20261027/202610271938.KVcqVLGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271938.KVcqVLGB-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/android/wonder/band_config.c: 5 linux/version.h not needed.
>> ./drivers/android/wonder/mac80211.c: 19 linux/version.h not needed.
>> ./drivers/android/wonder/main.c: 13 linux/version.h not needed.
   ./drivers/net/wireless/morsemicro/mm81x/core.h: 14 linux/version.h not needed.
   ./drivers/net/wireless/morsemicro/mm81x/mmrc.h: 9 linux/version.h not needed.
   ./fs/incfs/integrity.c: 7 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
   ./tools/sched_ext/include/scx/common.bpf.h: 1192: need linux/version.h
   ./tools/sched_ext/include/scx/compat.bpf.h: 495: need linux/version.h
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
