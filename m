Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963917AA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693336365; x=1724872365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ti9b0F3GGy9y4DVtVXWI/UR0f1DH4vbIFN59XWem554=;
  b=KDokiW/3K+XeMxdTenHOEhybD9GbPRG9DX3Yik9XN6FwDGx5BDPvh1zW
   6kwIB5Ko8ZeIaVMAwM1bGt1OmqyvZAFfGUjFJO7wARdm1cXAre/CmancR
   umPD7VUUs9J6da3p3rpUlnDwfIEs0epg+1yWsn8txU/AIiWo/HgqdYfa/
   GPnu23wSAnB1BrSisCgKY9Owj2Thbm57Lz6T6y6g8i7TW9vtMLbj/Zpwf
   E0SSZZgoL41GYr1r/scSChf2EajuZegHPh2lITI4JGQtlSPt7exP2/OAW
   +l6cfK280FxHL3NwJRC1dB/j9icRhGA5rFNv6z+Nfx6Bkk31iehp1LDgX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406454491"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="406454491"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="741949827"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="741949827"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 12:12:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb48m-00090t-2w;
	Tue, 29 Aug 2023 19:12:41 +0000
Date: Wed, 30 Aug 2023 03:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, selinux@vger.kernel.org
Subject: [pcmoore-selinux:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
Message-ID: <202308300357.yzGpfBQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git main
head:   50a510a78287c15cee644f345ef8bac8977986a7
commit: 50a510a78287c15cee644f345ef8bac8977986a7 [1/1] selinux: add a SELinux specific README.md and SECURITY.md
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230830/202308300357.yzGpfBQ9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300357.yzGpfBQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300357.yzGpfBQ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
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
