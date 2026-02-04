Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8DE33985
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770243133; cv=none; b=elWjNB/2b7kFbUAlQp1ae8AMSKw52cYhIT6q57FYayx2MwnSjryfs3++zKQBtuFIgPaZD9rg6XeSv/HXJ42vaF87zgFvMgtTV+lzUu9gtAB0fDdct6sThpjgLlaPqfHHNTouQSctG/pU0L2uKdTnmmpTho8oyAI3TKg0/QRBLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770243133; c=relaxed/simple;
	bh=FJJLT541JmEjriMJyHRAXJurUjs+1ZSGX25Jq+PTanc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ogjpvDVOiAE+6Q8f1YZnp8cBMjVY5eAEfOGL8C49C7vd2qa0zc9F1poyDICJgX4ilYqsMEc+J5E7Gy9/ci1j0Zi6X0z8B/R2z2NkRHinlU5Rwn3XA1Ke6HJAS3R+yXDmqxEvWa9XbwstoRm3Mq9EiSq/tQlUIWVANZS2c2amUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtVZZuNS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtVZZuNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770243133; x=1801779133;
  h=date:from:to:cc:subject:message-id;
  bh=FJJLT541JmEjriMJyHRAXJurUjs+1ZSGX25Jq+PTanc=;
  b=XtVZZuNSyOTFBRpTJkCEls3JUhzRjYpTgue0XpIlZNNfSxW6I4WRlooV
   dYKyE2eQgfa8GAurcLoMd6s0sgK5MA5iwMEZSWkfhzV4yqnxHI9fRm1Z8
   MUyc9HrCwQ1jcKAd2gjr4bZ9MvOu4wK2xfzfbXIhbIdYP2EHEkZC+Up5U
   3aw032ZSbjwBBSkJyeKhWy3hgSs88Haz+JeGS9goqJSaA9EY2A6Amx5ak
   X3MQ8YDYSpBnnGVJSev/zswlrJURbkqyo5K6TLGWaZ6ynhJtQ44Y1YJu5
   DrIEeYj+d5iGDKez5z/F2ltdMT6kHMfsXknkf2bKqs30Uh6xV/JTVtzF1
   g==;
X-CSE-ConnectionGUID: GVPgMIGpTA2tnVs3ILkCrQ==
X-CSE-MsgGUID: Wjhd8NNATVehbJg5de4PQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96895114"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="96895114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 14:12:12 -0800
X-CSE-ConnectionGUID: Mc59haB0S4KDT7RtA2vqxw==
X-CSE-MsgGUID: v8RM7rN9TR20r19w5lSJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214786138"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 14:12:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnl6V-000000003px-4AEU;
	Wed, 04 Feb 2026 22:12:07 +0000
Date: Wed, 04 Feb 2026 23:11:38 +0100
From: kernel test robot <lkp@intel.com>
To: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Bob Zhou <bob.zhou@amd.com>,
 "Le.Ma" <Le.Ma@amd.com>, Qiang Yu <Qiang.Yu@amd.com>,
 Flora Cui <flora.cui@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Slava Grigorev <slava.grigorev@amd.com>,
 Yang Xiong <Yang.Xiong@amd.com>
Subject: [agd5f:baseline0 1714/3826] versioncheck:
 ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not
 needed.
Message-ID: <202602042312.byaaqLcH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git baseline0
head:   b6a8211a7821bf70201912b493ab705f423700c7
commit: 1429c99a3b772d6c1b7dfa812e05cd7e6faa2634 [1714/3826] drm/amdkcl/dkms: add backport support for scheduler
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042312.byaaqLcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042312.byaaqLcH-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/gpu/drm/amd/backport/backport.h: 5 linux/version.h not needed.
>> ./drivers/gpu/drm/scheduler/backport/backport.h: 5 linux/version.h not needed.
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
