Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200B4158545
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742262274; cv=none; b=XeFTvHPd7zZyhLQwkzA3JbBGkIBr1i1tbIHCed/Pg3j/6Xa4nhZz/SKARQsZ9DjL+BX17HhM/6zNZXEAHvK8wE3xZhDH67bX8Qlnl/sH8I1Mxgxx9fJbqxhz5AlQJBVHe54UIhJ2WRjpq4ggDhrMDjRX0WpNzVlvi3gp+3UOv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742262274; c=relaxed/simple;
	bh=9/QCKnJyO1jZvhFgzJcMKIKd3iOvTZcKkFHAn8+URMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FnXMnaqD/s2MsCgmgI5IflhdljkcK9VrAux5uXsvtF0SWK0CMojQaI7kQCd+LeBt10qs5Lm+4aiXTx9vE2Qe0Z/A8O6LJutGSdbjyVm8IIEgkABK/tqOGuzQReRUMQxWS2ozDg9lxTBxF94lH/9hnEmIVuKdGZNwEMOLv0v2QmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgYN/Hg8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgYN/Hg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742262273; x=1773798273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/QCKnJyO1jZvhFgzJcMKIKd3iOvTZcKkFHAn8+URMM=;
  b=EgYN/Hg8IhQHr3LkhPWWvRR3x5tN7QLjOnxmoRl5S15ai9nEdVR600vP
   vX3x8m9E8NQ4fvMXXbbKL9vBBUIkG5s1qKMf72BXIhW0wa3d8P5zcL9Ov
   edkeATONDf4Vf5Vkuq7gZrHN/dsr0OP3xSojhcxnGpt99EOHKNvJR3JtG
   SNXJBeO/HD9RvAPdfhzMEsavGt6VcQtzK4uGnRiOERH97wzF2m32QIzFl
   3BZxO6E91vev2AhIuCx9R6LazHsa0Zm7M3kXvZ7S2p8/5NVN6JubKjVxC
   W2KdWJPE+gajpd+NLCrr5Tc4qq7ZA91Oj6JEPX964y+rF+EzuVTlQPrw2
   w==;
X-CSE-ConnectionGUID: o++Xw8+eRIGzEqdYAkvndw==
X-CSE-MsgGUID: xd5Vrc6GSQ2b+q9BKEgHkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43574031"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="43574031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 18:44:32 -0700
X-CSE-ConnectionGUID: kaW4kYbjTSeb9n3QNB0t4Q==
X-CSE-MsgGUID: 78GkSX6vTPW5TzdmvQC64Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="127198846"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2025 18:44:30 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuM0J-000DIa-2S;
	Tue, 18 Mar 2025 01:44:27 +0000
Date: Tue, 18 Mar 2025 09:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: [hyperv:hyperv-next 22/22] versioncheck:
 ./drivers/hv/mshv_portid_table.c: 3 linux/version.h not needed.
Message-ID: <202503180913.gLveRQwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68
commit: 3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68 [22/22] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
reproduce: (https://download.01.org/0day-ci/archive/20250318/202503180913.gLveRQwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180913.gLveRQwr-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/hv/mshv_portid_table.c: 3 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
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
