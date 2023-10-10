Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382543158C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZxaPtBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696969699; x=1728505699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPG4krj48QNW1LSVLNAZAI9rOouBbrQWlNRVreJbBy0=;
  b=KZxaPtBbxk05leoAGWGrMwFaVCi7W9aUjqcAiieUnOoyzXJ1cncuu9T+
   hu9gNMNbfcKOMva5UHOTurAcDaoI1EfEecvp+nocm2DIhSaaOom8bggJg
   5PEsWD/HcFkBmTSuJ1VI4bsLW8/0Y2GuFylPMeDl25s3GnFJAuZJ47b8D
   9n5ngERCsYuNuSWrD/hVqJ2QE0HNE4PTMAfeGfsMgGaRovD95NFMKcli0
   I6jCgNDV4N6Wf5G+i4qO00ACiww+xqejYypMocZbtersAgBVNBnSoTpqt
   KbMWsUX3HH4Amch8s2xElgW+6boPZHRSEh4ePDUxnXcjmpxKMmAxdsMVd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6060625"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="6060625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 13:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844282241"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="844282241"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 13:28:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqJKt-00015Q-1e;
	Tue, 10 Oct 2023 20:28:13 +0000
Date: Wed, 11 Oct 2023 04:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>
Subject: tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one
 of the .gitignore files
Message-ID: <202310110451.rvdUZJEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: b7a2d774c9c5a9a3228c6169ecf32f05b96609cf perf build: Add ability to build with a generated vmlinux.h
date:   4 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231011/202310110451.rvdUZJEY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110451.rvdUZJEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110451.rvdUZJEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
