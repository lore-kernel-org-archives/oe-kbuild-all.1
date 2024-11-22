Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F243158205
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732260602; cv=none; b=UEG1+FOn9Rg8h3tvnjmKHDfTFi9VXn7Keob0ymfW7AjrxOd2LZNkLAH8LoGDrsLJuy7zO+824Uv4Z3+8TjbRb64GkRdqrT3SyByZrhpcMYcF+oeihumNpS7ggyLPYGYZCUyhdY+3W7xoKHAIJrTCYWItfWGO1t4p8YSzLnJuTak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732260602; c=relaxed/simple;
	bh=E4YMxKxgPHZaBNkrDwmtt89EMLlV0AlVf9ZqK0030dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdjGWd4gOGzvu+5HAcHekV/GpHn0XyN80D6TY20iQfcxSoaPAl6siHjplOPXXrTJLXBVynqNVD9NtbnubNzKGlA+gUpPhh6c/1UzwAW1PnSVcefvR0uwtSPG5uZ0RkCKLIKWbN8mYjH7WH9PguMKnO4pRKad/3zw0M1Faho8oMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3/3osvg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3/3osvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732260600; x=1763796600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4YMxKxgPHZaBNkrDwmtt89EMLlV0AlVf9ZqK0030dI=;
  b=b3/3osvgI2wwGT9LZIjjKJX8c8fJuUze1Dw2s/Unph1k1tpUtygeI6UP
   gKry99NYO+G1Fknipl+ahVO1O/i05X7K6kc7DEoU5kswDQcG1L0RK/6xD
   /NZjruZe+M9tFBB/9DNjcu4FBjSVjSWXjkMXD6yNfAuYUSKMiCTNkuA9A
   3uZo2kRsHPLhX9d8VCfdr7e7N329vdv9uflrv+ANss7qStwFhoBy4iwZM
   9LQzG9ljbU+HROKWT73uIOWO682v1PbD9bo8uWGpWJIo5F/acLsiPaGI1
   tkxn3WW6sJVjaMwpqLNEE3Us0ZKrZee0fOOX+pWZn7b8ijnmP+i9/VKwE
   A==;
X-CSE-ConnectionGUID: T0TTNY7cQsikr1GDVcsB2g==
X-CSE-MsgGUID: Tddk8+X9QfaoVLTmK1i6BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36311847"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="36311847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 23:30:00 -0800
X-CSE-ConnectionGUID: fCUIUw4rTIaSB8vCYWZZYA==
X-CSE-MsgGUID: 8TSOa9JnSlqQA8tUlYbjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90487018"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2024 23:29:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEO72-0003lH-1H;
	Fri, 22 Nov 2024 07:29:56 +0000
Date: Fri, 22 Nov 2024 15:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Weaver <scweaver@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: [snitzer:snitm-kernel-6.12/delstid-localio 3531/4957] versioncheck:
 ./kernel/rh_messages.h: 21 linux/version.h not needed.
Message-ID: <202411221546.FI24owuG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git snitm-kernel-6.12/delstid-localio
head:   f102a32db07d849c674ad967119239239a8730f8
commit: f9d46605f74154bae280eeac8693aee75e2707f2 [3531/4957] [redhat] kernel/rh_messages.c: move hardware tables to rh_messages.h
reproduce: (https://download.01.org/0day-ci/archive/20241122/202411221546.FI24owuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221546.FI24owuG-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./kernel/rh_messages.h: 21 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 423: need linux/version.h
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
