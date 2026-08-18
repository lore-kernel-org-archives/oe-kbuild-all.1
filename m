Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767AC469835
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056376; cv=none; b=AS62c653CjgGPj1mPxYF3P1WabI9tNzGzc/OLzTeC10+rjkfjFHpVLXUxpNoTv5Goz0k+lsOrzgXRIzBskbtaCYsk7BUaZoVR3YqPYo+1FSBHQMjLp6W8YwlwRzIQW6eiE2YylCQq4goeC+kMTYgANCCgF3fe0ULz20lVG5s2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056376; c=relaxed/simple;
	bh=23roUva7FZZUNYI4ckA/jKTEdYg5sJToerwTnS6LXgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pVVyAs1/xIxoCjYmKYtyyGqiywdObsz/IKZEkBNAqcG5oXBk38M+gZKyHm6LFJIvHDNw0MrwuLwce0IbjGGLXHzMpDmioN4v3/44LycVjAhanb6hjOo4J/YWizLg/oGy3PNorGAW0/l8JvNNaam0a0Vush+WX4TGIh65t1KTgAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKRj4H5J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKRj4H5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787056371; x=1818592371;
  h=date:from:to:cc:subject:message-id;
  bh=23roUva7FZZUNYI4ckA/jKTEdYg5sJToerwTnS6LXgo=;
  b=VKRj4H5J7qgCulcMOGohajU8ZB7vwlOrp6W4isMoYXF5NL9u4eeElEbm
   XhbFE1DHCe8/8TfwevOXW9PCDqcfnuLnqFeudyupDSKJyVeYn4wRng8mJ
   XIjEf4wVaejoiOuz9VOnSpS0pQyqVVhcSEaUHBoRFd4GrB+c6QPovJiMX
   wJM6pBilotBqpOuL1X/J0HbSzFlIuPDlAYZMA6TwnRlMSlLH01O1X5ArC
   aLM3QP76xBfCo1UppjCeoNnvZZo/I+105XHbfgsOeYOSrOyImseM60t9f
   u9Ya0O3kV/ZdRithoE1IC86Tro6vhzyikkQb7Y7zDf0uJNveR40KlpykZ
   A==;
X-CSE-ConnectionGUID: ywaTHY/JRxCjkXEma608wQ==
X-CSE-MsgGUID: g8Gh5mmjST2I5wFofSwzrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87668875"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87668875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 05:32:49 -0700
X-CSE-ConnectionGUID: 4fDixFz5RFSuHKj38muwYQ==
X-CSE-MsgGUID: oeqGE0C1QXOTUB2rZ1e4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261004838"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 05:32:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwIzm-0000000075R-1qOh;
	Tue, 18 Aug 2026 12:32:46 +0000
Date: Tue, 18 Aug 2026 14:32:36 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 23/111] versioncheck:
 ./fs/bcachefs/data/ec/io.c: 594: need linux/version.h
Message-ID: <202608181408.bsywuFie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 28c1a456c029fb2053818271a8810e557f02eaa0 [23/111] bcachefs: Update for Linux 7.1
reproduce: (https://download.01.org/0day-ci/archive/20260818/202608181408.bsywuFie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181408.bsywuFie-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
>> ./fs/bcachefs/data/ec/io.c: 594: need linux/version.h
   ./fs/bcachefs/util/util.c: 1210: need linux/version.h
   ./fs/bcachefs/vfs/buffered.c: 1169: need linux/version.h
>> ./fs/bcachefs/vfs/io.c: 1087: need linux/version.h
>> ./fs/bcachefs/vfs/pagecache.c: 916: need linux/version.h
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
