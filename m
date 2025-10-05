Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2B26AEC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Oct 2025 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759635749; cv=none; b=rmI6L4sbWSa4NO9cuM09H5SjpeZoDpIaP1OmOhTJ48MY+WqmDvO1ulSqV2WTp7oK5fF2+7yhm4p7XGp5pUBuIxLzI8t5+fWCR01+K2lBW1M48C6vfBAf8xVuce90N24hOsa3WAsorwN8IA2OT67x7lU//lBY056FfN/pnwBGdjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759635749; c=relaxed/simple;
	bh=Ecl6X9QwGdhPx6vvVeS59fCqVJRCcO32togMsUKTyXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/wxE5BRMR6s2azewEvp6/sMyC/uGQBSTzNCyH58BBtsLTomcHgKbCX0+g7TISUcCRwL9KiMmVXm7fFy7nrZnRFF4tU6oSGIlIpGw21px2qeVLEKVYwN5cgXPBYrLwLqVfAuh0k4rkBVMWZivM9xNm8evoGxkywQaptJNvP16k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT7q/H58; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT7q/H58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759635748; x=1791171748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ecl6X9QwGdhPx6vvVeS59fCqVJRCcO32togMsUKTyXk=;
  b=BT7q/H58ggErq+LGbEBPjRNPMr0bh5raKFJ2CMG8Pcs6EB94xJOfvT0i
   XU0PBOi5nAGN8iPA7aPvGCRQKNmK9sciKe+4qAz0qV0cxPK+ws0Bd5/qL
   +ESO+879f23jC/Ezfhrlp2qFZ4bm2CK0agkiwySyo1d+FyzXiNi+Wm3rg
   U+KIb4Vk62kRsgr5VeFbU2cnjWuzD4x/mN+iXn2TQvoOcvlymgxmUaTWR
   4tjjlGawYccFwyjN3A5g/8rH4u4DaJbLJtnmlXhA/+1/tNG8ixZp02DRs
   BpJdEDJTccmLahMinMgiUAFrjKbEuOvKDTRc5nzvg7Jv+y1LUKPRsITPO
   g==;
X-CSE-ConnectionGUID: 1RzBAm3kQ064K3/ReXVOFQ==
X-CSE-MsgGUID: XxXNGhxcSzKZzNTHKTeR4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="72532515"
X-IronPort-AV: E=Sophos;i="6.18,316,1751266800"; 
   d="scan'208";a="72532515"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 20:42:27 -0700
X-CSE-ConnectionGUID: UnOGn3jTTguUbvxo53aNqg==
X-CSE-MsgGUID: wMEIQEdlSOOtUgzJv1wMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,316,1751266800"; 
   d="scan'208";a="180033494"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2025 20:42:26 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v5Fdg-000000007gT-0i0c;
	Sun, 05 Oct 2025 03:42:24 +0000
Date: Sun, 5 Oct 2025 05:41:30 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 475/484] versioncheck:
 ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
Message-ID: <202510050513.e8K7VqrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   44a1440638eaedfc8e935788b352326eb04a32b6
commit: 9e4a5a10a3fe9bc91a2ca126959de6fc61b6869e [475/484] bcachefs: move vfs-specific code to vfs/
reproduce: (https://download.01.org/0day-ci/archive/20251005/202510050513.e8K7VqrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510050513.e8K7VqrF-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/vfs/buffered.c: 1175: need linux/version.h
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
