Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07C10F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705192; cv=none; b=mO21+hCSuYl1vauKjdqgRPG7sI/0Lzb+C28SMZQF1lRNK/PSBocaas4lWSdzYKBpXltWCR5xXcWQTj3nfJOt/12RWruE82TcLEjlcsVlvINGSmHhiRBisvd1bEzZs+NoscPHUFuODhD5+wuteoEwYx3my5s4I0wCszuBE/lRwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705192; c=relaxed/simple;
	bh=RLVZ/IUuencqYbOyD799+DMXlsIcf9vlLlWAItgUAgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pANj/Xbh0N86Z+M0MsC9UJC0ytc3Q1bewZtLTxQBwpQdpzLdOZhpENg3R5ArcedihLS7YvPNRKybfkPud9cVgRsppeNo1MFvg8u7snzr5MxL3b+9p7UKeDyC1g+kmdP34EuFG1JLx+FjNwvav9mKl5Eg2+eIjnoyCYkoLKBhumE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFXb4+kx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFXb4+kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761705189; x=1793241189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RLVZ/IUuencqYbOyD799+DMXlsIcf9vlLlWAItgUAgU=;
  b=CFXb4+kxVJerkFyVlP6Lav3Jz5KSYY4BBx+yf9R5EiFt1LI7YYk3WR+E
   jFr0bNcyRv3oL+fYWehS8bjRzJ3wwFYsJ2pTItT6XW+AddpOT6lZA95dh
   IjeWuCRLg3q1zqqTn5tSFZE8TKvpc5uMZtmgDFOMXnGA+5dw51oM9R8Fg
   EHxz66d3/VgPNDRfLEjMyY+8viKxXOwac1y6HejylrB6dU6Z2DOJmqhpO
   NVmsy2m75auVL0XHE25DQMRi9m1XzeEqb/ZmvZLMgRafEjTql9g9c1I1o
   90pNEXjgj3/HVJreSRu/kddrmXHxylewHp8cbdScvkJOttty7Dena5pxQ
   Q==;
X-CSE-ConnectionGUID: Hzxd6sdeRPm2aVFDmJ8UFg==
X-CSE-MsgGUID: 46g9yeXPSkOWibkPuSd8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67654937"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67654937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:33:08 -0700
X-CSE-ConnectionGUID: 3lL/EDkYTy+lPVhj6PNCzw==
X-CSE-MsgGUID: hPJUbHjKTt2fe3QMrjQF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="209124204"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2025 19:33:07 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDvzl-000000000pk-0LLZ;
	Wed, 29 Oct 2025 02:33:05 +0000
Date: Wed, 29 Oct 2025 03:32:46 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2972/2972] versioncheck:
 ./drivers/i2c/busses/i2c-zhaoxin.c: 15 linux/version.h not needed.
Message-ID: <202510290332.JOR51z6Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f974d7dec2997dfe2d417f1c9cc0e2a6adb2d25c
commit: 7d6424d8bc9f404652b44c12a5c0b6f52521d514 [2972/2972] Add support for Zhaoxin I2C controller
reproduce: (https://download.01.org/0day-ci/archive/20251029/202510290332.JOR51z6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290332.JOR51z6Z-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/i2c/busses/i2c-zhaoxin.c: 15 linux/version.h not needed.
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
