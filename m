Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9928CF5F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 23:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770246013; cv=none; b=fg9uybrAwWd2lXv4tCvk4FdiJFiyFLicvv+BRERbCmGDldc0ZU7upJ8Bt9l6S7Paqmx0GWyG75tHaUFPJonvMUCGebH8Q9N84/vX8gZKuqlLmJh61kOXf6+iOf0CoAOb4a+KGeTcvkBId2LJGZlDb2yBwuny0Rzb7QPFqWRifPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770246013; c=relaxed/simple;
	bh=JITMPTK8Bdly29DkQQ5KIhf5PlxyVjCeQ/ngwRfWlgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wdj3VXn5JhvCmGK60rHqTXXmYNizRzr3DV+15YkVMRR9onCvUFr3Y4mGH2qHUXsC5M8SpbyR5haC7FhBjwzwHTp+/uxfFD8WyO6StE6th3DlGvjeXlmMZ4B+cblsf/nMl7pRU3mXZXMJrL4BkWUranUyT8pu1WudWHqde1ts1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8rVKMtN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8rVKMtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770246013; x=1801782013;
  h=date:from:to:cc:subject:message-id;
  bh=JITMPTK8Bdly29DkQQ5KIhf5PlxyVjCeQ/ngwRfWlgo=;
  b=G8rVKMtNN63hxPZxsWkp2Zhn4lFruREEKjLHGle9b0Cyn02muiL1d++m
   yXC6fOrf2/JdCeqWmZGJW0U95B5a+gX0K2pDERi3hHW6jpgxJbuHy6PqK
   Ypl7hxKrPSD+GgHevmxNS7jv+YllfZKBnxofCllLI/hBZuEwtbFoFO3Og
   qSYNuZyvDoSi/bgVpd0UcRGuE0oJVPKUWx/s9Yo8RuuAodR87tGN7EFAQ
   THTMSf8keICTNTlMZCecd2rdm9jaNBjNZesYUhfJy/DgeARwwJAcI8Xmi
   O+hcSpY79ouzNJjHhd8DBa6W9QPAo51RmG0uzeMRx4JK7wewdZGqeWl/w
   Q==;
X-CSE-ConnectionGUID: XbYU/rmnTjWueUhEXjd/Fw==
X-CSE-MsgGUID: wR33n8tvTBib6dQNrLQsAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71499762"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71499762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 15:00:12 -0800
X-CSE-ConnectionGUID: fKj7QQfjTM2PDkokyKqWfw==
X-CSE-MsgGUID: ZoDZzZdgR/a1kVan8XeWcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209667524"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 15:00:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnlqy-000000003qH-1PAs;
	Wed, 04 Feb 2026 23:00:08 +0000
Date: Wed, 04 Feb 2026 23:59:38 +0100
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 Qiang Yu <Qiang.Yu@amd.com>, Jack Gui <Jack.Gui@amd.com>,
 Flora Cui <flora.cui@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:baseline0 1776/3826] versioncheck:
 ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
Message-ID: <202602042314.amOnndfr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: a3e905862b49873075cf9ad304e0bed4cf739c2c [1776/3826] drm/amdkcl: Test whether kthread_{park/unpark/parkme/should_park}() is available
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042314.amOnndfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042314.amOnndfr-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/amdkcl/kcl_common.h: 6 linux/version.h not needed.
>> ./drivers/gpu/drm/amd/amdkcl/kcl_kthread.c: 15 linux/version.h not needed.
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
   ./drivers/gpu/drm/ttm/backport/backport.h: 5 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 449: need linux/version.h
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
