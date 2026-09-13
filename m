Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7722B594
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789260675; cv=none; b=Wy9wNFRDZHaamFKcC53JWUwBsWeiXMe7KjplH/H73QII7N6OF9nl9cVAxP81R42upVftrhbfmES3h0VekQxUiJVzh6FNW6B2k9MBHRRuWC02dVofG3CSBx2dGTHEi5+VK0NHYV9D1zekX9N37HW/Hymf+os/PozzX270qQVhOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789260675; c=relaxed/simple;
	bh=Va3BIJRxXlx1yfX95omXytG1MLE/aoSkblLomLkDXe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OIPITEShwHxIgIJi8SQ46uDxnTKFozMULxLX4ZS0syvD/7lKl4GUtB0TwXLg/rUjzDlgqTed02ESNmgU+EmSC1mILBsgO87r6n/v4bUqkGnuFdLXgy+QZnoMuaGjSYSkkd7YD8p4sQLmoWsfu8egSFyWaRhTSM8uVP3ssvnxa8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OACD8fT6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OACD8fT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789260673; x=1820796673;
  h=date:from:to:cc:subject:message-id;
  bh=Va3BIJRxXlx1yfX95omXytG1MLE/aoSkblLomLkDXe8=;
  b=OACD8fT6MnGxBO9vFoMESVuR3rzVyI69nm6g2/Pvk2tttRiztuZrpr1D
   QDU7D5sbS4lKbZCdZMMhPU3jMGXrs9HsrCu7QgB18mf0zCY44rwWuUIuU
   YvSfqCxyEDbI1240ue2Z3lebtetdX7kmYy8n5eWsABc2b2uy6VX3AiwEh
   ecDP0SETR7ZXOvhkW0mrX8sN7CnTnRhl7JKqIOm5GY45SZp2dkndZS9KD
   lUzxcv4vhMCVs5AVBS2y/22WRuJj9AS4Fkx9/MJAx3+zispkEuBVh8aUI
   K09Gh13isAdQ8LjrJrOSLDbAplxPmxsMViTRCJpmopUsC//KVjOE2ofIj
   A==;
X-CSE-ConnectionGUID: aPBIdp5MQQimL2B3eEv6XA==
X-CSE-MsgGUID: YTHsgg8NQ6K2uRMaCi3Jew==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="101029059"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="101029059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 17:51:12 -0700
X-CSE-ConnectionGUID: prAei59URWiohI+1uUXiJg==
X-CSE-MsgGUID: caYn65fmQGG/px/x6wcsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="274201976"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2026 17:51:11 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5YR2-000000001T1-2prb;
	Sun, 13 Sep 2026 00:51:08 +0000
Date: Sun, 13 Sep 2026 02:51:01 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 224/332]
 versioncheck: ./fs/bcachefs/util/util.c: 1030: need linux/version.h
Message-ID: <202609130202.rIS11s9J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: e9546cca4f20b493a0f5131d5b50121f9a28dd8f [224/332] bcachefs: Update for v6.19
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609130202.rIS11s9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130202.rIS11s9J-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j128 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/util/util.c: 1030: need linux/version.h
   ./fs/bcachefs/vfs/buffered.c: 1169: need linux/version.h
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
