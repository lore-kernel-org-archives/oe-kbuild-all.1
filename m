Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C7BA3E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680622714; x=1712158714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JyEyesUAfsnh39QScCqENVpHW7W4d6bfrVDonXQ7JJk=;
  b=OSCVmmNEqocHrrWqApPNXa5pvwcJXlF/o7SoLBJzzeMu4JjKi0ZipNss
   Rm11zWnl06HnhyZuwX7PvR5zAWnZ/Zdm43IbD21c4Le7T/8aJ6ywzEW/Y
   7KnnXrxwkEffWxQ3kqPeKcYIzcRRK7tjezGI1GmqOfszRm3j05lnlxCpX
   wmkqecodwQT+uNOnTkYaOxLHY4xX5X7Y6dZiKnjIM1IW2TToUWfegv0KP
   aNftxG02+nYk902phHKan+GocRR9RCdqA73dm7DADkZcSYkTS58nyeCIO
   BKyM0ZXvSmT3zUjW9R4ZbRT+hRNBUSz06X0EfS8Ie20bKlncT8D+0KHYn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370039403"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="370039403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 08:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016148187"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="1016148187"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 08:38:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjijv-000Pq6-1Y;
	Tue, 04 Apr 2023 15:38:31 +0000
Date: Tue, 4 Apr 2023 23:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge 5/7] .github/problem-matchers/sparse.json: warning:
 ignored by one of the .gitignore files
Message-ID: <202304042327.blhF5nCp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
head:   639e8992872c632f27b130b403e263eae966231e
commit: ff94f02dbdf0d6077497f1ffb63080c6937c3ed9 [5/7] powerpc/ci: Add sparse problem matcher
config: arc-buildonly-randconfig-r003-20230403 (https://download.01.org/0day-ci/archive/20230404/202304042327.blhF5nCp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ff94f02dbdf0d6077497f1ffb63080c6937c3ed9
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc merge
        git checkout ff94f02dbdf0d6077497f1ffb63080c6937c3ed9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042327.blhF5nCp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/problem-matchers/compiler-non-source.json: warning: ignored by one of the .gitignore files
   .github/problem-matchers/compiler-source.json: warning: ignored by one of the .gitignore files
>> .github/problem-matchers/sparse.json: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-allconfig.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-clang.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-extrawarn.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-kernel+qemu.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-perf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-ppctests.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-selftests.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-sparse.yml: warning: ignored by one of the .gitignore files
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
https://github.com/intel/lkp-tests
