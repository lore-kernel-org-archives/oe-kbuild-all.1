Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99D4F93D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748345; cv=none; b=OkssrbYFb+AlqX7b8b/2AlkaXz3uawEqpEmiD933MG7pYIAjv+2OPYN/u678pTNYD4H/HIji2CMqVkI85aw73aiDP9LjBnO6I8DM3XoRcWGh0MWJQmpT7ABihm09ZIqbTtcgnI+NWmu6O6IR1Fh70XT2+pDc+J0c/C2/NhIlY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748345; c=relaxed/simple;
	bh=PlykoV156QyryAF5a++IwAJxki7utDVsYl0aWjXtIJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pHxGfgP/B9dFtqSRZ5mgMFTMSVZMQlxp8goAjbeo4g7zrq5xbYOWLjqV2hCjQcuTaJDJpHBCv4dUbIAeWd365Iik+mJrYVUxdwPF9sU6W4DTvJpjGS6Kj6Mq9oBYHTFV9MudnkzN+IkIkIHnF9xSz3VWiESygjfrvWepVC9rYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPr6kCpI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPr6kCpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789748344; x=1821284344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlykoV156QyryAF5a++IwAJxki7utDVsYl0aWjXtIJ0=;
  b=RPr6kCpIoYLJRG//LOXG/mqQbBgV6ADP49O2mTCNsNs9OyVeDvyk1coY
   WbTaWHrxXu3xzjxxW+9BIEqiwxr4uWNY8LpIXc1fu/JfB5pSaf78ba3uT
   AmrLislx7uvbSsvNS1HySYcC5ieWzR7tvhOjq0fhS6g0Z9keHSzN3EfSb
   ps37FtrX0ue6jxkHlkemjagRgMTJJ8ug1MUp5bHZCWGQSrACsMqpvE2j9
   1xpSXvokGxlQlhrbUThwWs+z1gazBJRzJO8SgAor5UuUAADDvIdvtxl2H
   geaOTDvIeIqc6H0UVGhvzZT9IDFjC8XO7MmAKkJSRq+XR52Hjs12bKlNY
   Q==;
X-CSE-ConnectionGUID: gawPCk3XStqBENIBn8ZAwQ==
X-CSE-MsgGUID: 40alYiJcR7OSmTFcQu4EuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77830596"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="77830596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:18:54 -0700
X-CSE-ConnectionGUID: 1WVDo48USxOyjIbjqiJvmQ==
X-CSE-MsgGUID: 0uGKrQvBS4GdImdOfv3VYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271797164"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 09:18:52 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7bIT-0000000018S-04lY;
	Fri, 18 Sep 2026 16:18:45 +0000
Date: Fri, 18 Sep 2026 18:17:48 +0200
From: kernel test robot <lkp@intel.com>
To: Jelle van der Waa <jelle@vdwaa.nl>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 18/40]
 versioncheck: ./drivers/platform/x86/acer-wmi-battery.c: 29 linux/version.h
 not needed.
Message-ID: <202609181840.TqiSRkWd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4a79b1992685552a060ecef666f57e0ea994ab5e
commit: b36ee17b40037845eb2f29c151a65c698f273d4e [18/40] platform/x86: add Acer battery control driver
reproduce: (https://download.01.org/0day-ci/archive/20260918/202609181840.TqiSRkWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181840.TqiSRkWd-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/net/wireless/morsemicro/mm81x/core.h: 14 linux/version.h not needed.
   ./drivers/net/wireless/morsemicro/mm81x/mmrc.h: 9 linux/version.h not needed.
>> ./drivers/platform/x86/acer-wmi-battery.c: 29 linux/version.h not needed.
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
