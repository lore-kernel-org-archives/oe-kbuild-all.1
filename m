Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01242641C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791766072; cv=none; b=lyXPrWCqyf3dMu7Sl1CHqWj52KjIMtCdC7HflcYqmTnd7RpgtchzPAUEZNsGTm4drHu3ElwgPeRpqAVfJxQHOcIBvis10LTHFpCE9knv4tiaRihxCFm2f46fqaoUQVgz+OvkRZeSKZuIIvz7LeFW9QbSJDFR8V8ntncUwgNzA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791766072; c=relaxed/simple;
	bh=fCcjVe1Qj2T8fTsW4i6uJSvy6dXn/7Etr5UGN/kRPlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L9a0XGgFOxqfr5X+m/ZCZDC77HPFtIsmc572zz7lcuFaezP4UyxQU71X52WDCBv7hiFzeWUvnsljegxlzdpf+FoZSlc/20Rfqpdx+XSTKgn2eV+kLxsjIOQ0epGkYZ35J52A7ASU1XkKo6bluryX14b94+gCCoyXcfbl4vfN7w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/v9jbIm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/v9jbIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791766070; x=1823302070;
  h=date:from:to:cc:subject:message-id;
  bh=fCcjVe1Qj2T8fTsW4i6uJSvy6dXn/7Etr5UGN/kRPlA=;
  b=A/v9jbImF+e/0vA/nDY5HgKLNshfq4oFjzN8U5HSD9wr+WPsZc2NFQhT
   msbZxEBAtZ87BkMAdX4je3UGxIzCw/sc0+59NlNu6iQ0FEBRyqx25MJJr
   QIuUnLCxjeD/GqaNZm++tpJOyFZRYFL2ZVTaHroX15dIrxog1UxaOfgtO
   AsxmQMeW8b19x219Bg3blsq/IX+bXc7jqg8A5sxF39MyD8abzTtv4SCFQ
   uViBkbDntPCJVhs11h6tBwLJ//q6fLQYAX/TQUiKt41z/hxW0zyvlVNd0
   +R6A3kJCBBBo8U3Heykaph6czXIUQnNhHqwl8HsZw/jiaoucEzkPa8NAE
   w==;
X-CSE-ConnectionGUID: //shb3qOR1i8PcPdj+fqpA==
X-CSE-MsgGUID: 1eG9rO/aR5uc8j6S0G0a/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="580377"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="580377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 17:47:49 -0700
X-CSE-ConnectionGUID: 3tELTA37T1+J5tJY3Odrjw==
X-CSE-MsgGUID: aegh6zXYRu+F8XD9C5MV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="739486"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2026 17:47:48 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG4Cf-000000009kF-0wDd;
	Mon, 12 Oct 2026 00:47:45 +0000
Date: Mon, 12 Oct 2026 02:47:35 +0200
From: kernel test robot <lkp@intel.com>
To: Scott Weaver <scweaver@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: 
 [snitzer:kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention 3415/7381]
 versioncheck: ./kernel/rh_messages.h: 21 linux/version.h not needed.
Message-ID: <202610120213.WroFRVzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/nfs-testing-canary-reduce-ff-layout-contention
head:   d889639e439fd6441ed5737e9091862837e322f9
commit: 3c9c2eee0cc5572d6b703acb371fd0450564f0de [3415/7381] [redhat] kernel/rh_messages.c: move hardware tables to rh_messages.h
reproduce: (https://download.01.org/0day-ci/archive/20261012/202610120213.WroFRVzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120213.WroFRVzI-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./kernel/rh_messages.h: 21 linux/version.h not needed.
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
