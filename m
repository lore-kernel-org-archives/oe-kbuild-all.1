Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC035959
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 22:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434451; cv=none; b=azBY2zX4WY2e8xn814z5qfj/8GhUVF7U5V9w+x2RezVyx4KurC/wHs2rRV0YrlbgU5N6yHizKV+bfoUbUbQ+q/9nGHUUIGxxBCKPItrccIDRlLtEPMrXdqTRp7oy+3KQtlgMs7ZkjAOSisf4RHbT+OR58RtR8bnBIfkWAyEeDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434451; c=relaxed/simple;
	bh=vobnKV000VeqZ7kFshdBi9VQxH3ym1t266baePJG7Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zn+WauE+Ow9jYth0uzREUNcUEQhhXPzqhsPnuVLAKcygDg+6hHa4lzzHcnz0l/QivRa2KguLlIEuCgWRmY+G0jkXUYXjW+f41auUlwzbseyMe6+FiyHXPEkKIREL5qdGS0Ecno7GhJXS5N+u1UHaWjOuCxJ7FedqsUSQKvMeWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k11Yw8yE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k11Yw8yE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754434449; x=1785970449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vobnKV000VeqZ7kFshdBi9VQxH3ym1t266baePJG7Mc=;
  b=k11Yw8yEyFWjIME2vtR7i6vGp9iyWw/7mNQxJOOTIkqAjKXT4Z9CFp1i
   X5rqN4aCL1G5W8MG0zrVWgeUOVMn0wJ9Khd2Sqv9XwKVhPBioQMbA/o3C
   KlIUIZ6z4QxlstJ1nW+L9PqqCPH3nTdCsNuC3/DUC41Px7eMry+qbMq6S
   8AKNZX9QL103y4OLcJDPhFtivqC8pDjcfVP1hkm3zC7+ppawy0dLas6CE
   Z1ul4XU5wU0i2r5EBZQTxcBP98rRt9NHAZm4E/l/yGIIDzaCoPm82y85j
   ZZ2IpWZFUgwqddMg/suy22UoQDvmCKUenD4IdV+fhOSJOs9mrldAtVn1r
   Q==;
X-CSE-ConnectionGUID: T4x4eM+3SjKYrJT4XWPsWQ==
X-CSE-MsgGUID: ixy0xHsKTfqX3i2aVRX4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68198137"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68198137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:54:09 -0700
X-CSE-ConnectionGUID: hSWgQPz5Rm+moh/VwmV2JQ==
X-CSE-MsgGUID: oxpvSO10Qs6FKwKO5XfoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164282526"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 15:54:08 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujQXl-00024t-2k;
	Tue, 05 Aug 2025 22:54:05 +0000
Date: Wed, 6 Aug 2025 00:53:19 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gdamjan:v6.17/thinkpad-x9-14 3/71] versioncheck:
 ./drivers/media/i2c/imx471.c: 4 linux/version.h not needed.
Message-ID: <202508060003.0t8ZIpIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.17/thinkpad-x9-14
head:   0ed6d5f55fcd53580388f5194121a2ac9d1a92cb
commit: d851f57e7f35726f06a7aba3f10adb3b4d53deeb [3/71] imx471: this is 6.17
reproduce: (https://download.01.org/0day-ci/archive/20250806/202508060003.0t8ZIpIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060003.0t8ZIpIT-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/i2c/imx471.c: 4 linux/version.h not needed.
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
   ./drivers/staging/media/ipu7/ipu7.c: 24 linux/version.h not needed.
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
