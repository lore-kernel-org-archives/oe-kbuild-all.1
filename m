Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC243B2A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695220234; x=1726756234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghnn89fdH+/6rmTvQKe+FGjHMzbd5Fg1H4P9BfycNR0=;
  b=S5L6wKGyikRrbYKA3Vm0qRXTshmWtVaZdthU3HRdz+nlWahqEsQAH7lp
   tv2y3jYfWVLoo+bFs62mwNnXuSCQ0eiIOfk9k1hbD8c1MD8AsDjYucu64
   N5WvyCpGHV8pJRyQJmrieMn/SXOlWqlThhOi6mmCVQpChWWpghAEGXX2b
   K2z+tBVMy5NOXi2Gm9Iz0wsXysJKucMx0PyNYGnSQSfv8UIbEjdWqFDgD
   tv4VJ+rRTZ3ovJXN0HLCGQYQrPVRNZ0pNZhU8xMl1MijjkLXudUAQxW4I
   SOy0EunTkz72mrFYdjqhA7BQ4bEz8RZVYtT2cXem1yiClE2IlKObl4C9H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377539413"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="377539413"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="861990022"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="861990022"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2023 07:30:23 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiyDd-0008pc-2f;
	Wed, 20 Sep 2023 14:30:21 +0000
Date: Wed, 20 Sep 2023 22:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Drew Fustini <drew@beagleboard.org>
Subject: [esmil:visionfive 46/46] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202309202225.fhgw2vqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   726782fad491c490b32476a34f0a50062352cf58
commit: 726782fad491c490b32476a34f0a50062352cf58 [46/46] [NOT-FOR-UPSTREAM] Add build instructions
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230920/202309202225.fhgw2vqy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202225.fhgw2vqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202225.fhgw2vqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
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
