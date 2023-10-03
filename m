Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4E3C6AA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696363102; x=1727899102;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VWWeXlsnnqhG26y8rY/ibAS+kNe8mluPlLhX0m/bQ1I=;
  b=GsV0/U559Kxtirvhjly1yy++InaTb4ErEeEPok2ZvCP9yNOflcm6+rBj
   DSgyaKHb/GfNCWC3v1OxMdoTW4Yi0i1g3kM3rKNvOH0hZbU+PWQ82d8dw
   ahKMrcqvp0lJ4RNS5MvV8KlIlmnTk9LEYSsdPQMykDiXZFkSD0tH9PMLN
   Xm3wDkyELx0EfXZ1F5wsQcphHKwt/KmJHiYcrDWr43iTf14ai+c9pDDy1
   5QGDSeA3TtiOclDT+b2+OeIFc0L/SrnGrk1MeFepEoUE9nuFb7ltAn3OI
   EYiyYbBUUyX5nAdb5PJIiHkKnjotbC1/AGiQFQgrdxpWekNUwoCNU+Bv2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413881692"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="413881692"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 12:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082142199"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1082142199"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2023 12:58:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnlX7-0008oA-38;
	Tue, 03 Oct 2023 19:58:18 +0000
Date: Wed, 4 Oct 2023 03:57:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, matthieu.baerts@tessares.net
Subject: .topdeps: warning: ignored by one of the .gitignore files
Message-ID: <202310040324.kAm5LFea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jenkins,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git b4/mptcp-issue-368-selftests-old-kernels
head:   71ffa0bf649c2228f63bcb4633c8b02bb2b266af
commit: e8a6a7e84c5b102e6d35e436f83832915f6022ee tgupdate: merge t/upstream base into t/upstream
date:   7 months ago
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231004/202310040324.kAm5LFea-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040324.kAm5LFea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040324.kAm5LFea-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .b4-config: warning: ignored by one of the .gitignore files
   .cirrus.yml: warning: ignored by one of the .gitignore files
   .git_markup: warning: ignored by one of the .gitignore files
   .github/workflows/build-validation.yml: warning: ignored by one of the .gitignore files
   .github/workflows/checkpatch.yml: warning: ignored by one of the .gitignore files
   .github/workflows/notif.yml: warning: ignored by one of the .gitignore files
   .github/workflows/update-tg-tree.yml: warning: ignored by one of the .gitignore files
>> .topdeps: warning: ignored by one of the .gitignore files
>> .topmsg: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
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
