Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18A139CE9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714720881; cv=none; b=uFwC0LMz9epxwXfS+fQ7NzI9J7mIhn++Pi5yRrLcAWn3FgT3sRUBUXIFthigS/U/o4nxOiodDSh/ongWcEX6Zcw/CbG/H0KKTiqUsuuzhzK8r/FQKuxGQWLsmCxv/vGie8CmPEJ9kYFRW5UwwkkrURx5YFLKouvw8pqlU1qTkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714720881; c=relaxed/simple;
	bh=a96NRwg43sZeytTfx01O2Lkk7sr7e4R8E/xnx55iZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rceoMSUlvVHtKejQzs1jSgtFO8PxS4apLsFJKSbIRU+qTxibz3xZotm8cDDUgpSZ7MTitRKgOZaHAEYezZEqL3B/HZ06V0IclzvGExCis95/9GLCLpjOvPVNaz4NiOoPdpAGLQU4R39HnMCRnD5+XWIMV5SkF2zUi7w+qcDQlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M24aeSGB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M24aeSGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714720879; x=1746256879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a96NRwg43sZeytTfx01O2Lkk7sr7e4R8E/xnx55iZCk=;
  b=M24aeSGBmWideKJicyz5ZgkGuIazWzWDb9TKsX2mfsnKH2b8e2YSHWVg
   lfToBWns3gsg7d2cFboi12QsBzBY+e7XG7AL2A/oE6xM2zK6CU67xmejJ
   7sehbGrWZEGuuvCWJ/+5GNXf6vEJdnUugiExBjxv5l9UmhBQX872MrGrP
   JWjAzuAJ8P24C2K92c8e0H6jAE0Ufld+nJB0oB2jsnU2mzpSL95ogiZDw
   j1aTENOKLpDTouBOZ40yt2JevVkJZ1eGiu69UCQnXpq5nhNQRqA9xZ5N1
   e69E0zi2BpqEJhZPi01E4hbrju5OqnIBnfjW31lyPOHAzV2PlIwkRF4n+
   A==;
X-CSE-ConnectionGUID: zBHlzM4EQK2HByfLWHa9qQ==
X-CSE-MsgGUID: ecOpV/crSi2Hkp0lsZJz0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="14331888"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="14331888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 00:21:18 -0700
X-CSE-ConnectionGUID: +9AuIQirTQOPC0jF4f4wUw==
X-CSE-MsgGUID: pL6ChSMnRAuOJZj1PyuU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31852687"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 May 2024 00:21:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2nEJ-000BOc-1A;
	Fri, 03 May 2024 07:21:15 +0000
Date: Fri, 3 May 2024 15:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 333/1143] versioncheck:
 ./drivers/soc/aspeed/aspeed-host-bmc-dev.c: 5 linux/version.h not needed.
Message-ID: <202405031514.Rxw142V1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 04915d7a3a4227b25ec12f962920278a437df53b [333/1143] soc:aspeed: add host side bmc driver
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031514.Rxw142V1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031514.Rxw142V1-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.76.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/soc/aspeed/aspeed-host-bmc-dev.c: 5 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 410: need linux/version.h
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
