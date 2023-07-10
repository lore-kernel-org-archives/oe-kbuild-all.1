Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1733517C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 04:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688964013; x=1720500013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOUaiguCef64qsJv1iADJ0JKEdcapd14q4Yi/uTKdyo=;
  b=TdtecAWUbfa107c2x6BTxZNyVLBANSuzjCxW29Xeq2HePbGSuRcqfghh
   SwbnUOCy+AYR1xvRK/kj+8lMB86cWU7UOwuwW7mhy8bHR4G5SxsAfLL+t
   ZYsH22w0+QzEAWD1i7iLHumE59UHt24GkGPepZ24jsvaI28z/YuM6a9Ps
   QEjLqrL1VdOPPHimcb7FnrE1AHdLCNc7XoYOyuBz5+q2AJuUBNPr2WVxn
   Zcauq17FAd9U0EmufvNw81d29RvnVnIbLqQ7haVzSldZtsV0a2SIZnzee
   HWqiVuww/Wo2MUNOn9Z+jMdxJsSf8RxhREOllszjUkiqm5uM7Su7ZD1cC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="354112397"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="354112397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 21:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="834128656"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="834128656"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2023 21:40:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIigw-0003XE-13;
	Mon, 10 Jul 2023 04:40:06 +0000
Date: Mon, 10 Jul 2023 12:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>
Subject: tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one
 of the .gitignore files
Message-ID: <202307101239.qYEDPWtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
commit: b7a2d774c9c5a9a3228c6169ecf32f05b96609cf perf build: Add ability to build with a generated vmlinux.h
date:   2 weeks ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230710/202307101239.qYEDPWtZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307101239.qYEDPWtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307101239.qYEDPWtZ-lkp@intel.com/

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
