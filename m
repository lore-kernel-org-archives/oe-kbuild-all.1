Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1413D26B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726859652; cv=none; b=gcFE23Rum1T2pso94k1aS2mcLIk9JigTAIjLgN4GZkO+SXtq6AKa3IVxocFSnXF1epX60Tzj65Ouz0i7swqPmyOAdmXZNRUW5RRaD3Y/28o1bVsXWdAIBTuG1YFX5J6LN2M/WAus4dNKNFSfGi1pL2zXyxO9XigJwpqxqCF/tBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726859652; c=relaxed/simple;
	bh=AEVXpg2h4gCYhKFM55oDzlE6tQ3k92e/XE8PrsMdMMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+q1mZi2s+RivF9M2jUYHHqgXb1LNGfza4FwvRnnawfn8ro6SPPIPITVzEJYDDJhCEq5bFpKYGcxd4kTUp3RqKMwY6UpyYb2WSIV4a3omH4Upm0v+kSE06x0qH4hHmqOPVA6hXcH6oDD+FhjLzbgwolDjZtYXYOexT3WHnZZB40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMS7Etm/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMS7Etm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726859650; x=1758395650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEVXpg2h4gCYhKFM55oDzlE6tQ3k92e/XE8PrsMdMMo=;
  b=UMS7Etm/TxHg7UKo/WZug9oEyXPeek8S7bfFR3wIyk7t/H2gIq7t1m+U
   8z+fi0Z+2EE/orv5tzdXcZFsR8x1D91/XUglr/+7/S7ic4wuqYiTQSGqn
   C+Zftvn79mRnNo4MQ7L9XD1elBt8Be+7cM8lL8uOZTORw/Lz7K088GG/5
   PsuH5MBSA6mnZcChaoq6euqZPz7Twktv8xnsofG+wMB7x/+OI6KNud+9b
   1Awv+zNZHOEXIrVkb3QAbGkoHXI0WOmi7WBT0o24YEtom6C4y3hLo5qQk
   JKNP0diqP6z0L7JjqaPkGwYlsH4yQNqVwczrGo0WpdiK1h22PrrwhFZmU
   A==;
X-CSE-ConnectionGUID: 4IwE+3BWTp23ZO/wW34ing==
X-CSE-MsgGUID: Ru7V7oLMTqOjDIGMm2Q9mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26029360"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="26029360"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 12:14:10 -0700
X-CSE-ConnectionGUID: E+zUWf9LTKKcfzVyNXIvHA==
X-CSE-MsgGUID: XG0zSKyPS9+TL7BKVkUuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="75356206"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Sep 2024 12:14:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srj4w-000EnR-1V;
	Fri, 20 Sep 2024 19:14:06 +0000
Date: Sat, 21 Sep 2024 03:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3385/16782] versioncheck:
 ./drivers/staging/fsl_ppfe/pfe_eth.c: 13 linux/version.h not needed.
Message-ID: <202409210334.5WhtPGtm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: 6da935cc9a4e6e3ae269f373f7206d783800e88b [3385/16782] LF-1762-2 staging: fsl_ppfe: replace '---help---' in Kconfig files with 'help'
reproduce: (https://download.01.org/0day-ci/archive/20240921/202409210334.5WhtPGtm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210334.5WhtPGtm-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.71.1-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
>> ./drivers/staging/fsl_ppfe/pfe_eth.c: 13 linux/version.h not needed.
>> ./drivers/staging/fsl_ppfe/pfe_hif_lib.c: 7 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
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
