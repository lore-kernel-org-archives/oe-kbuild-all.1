Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36802F5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060012; x=1705596012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7w2kiowsP1kbV+aVfDwigVDi0hRPGhPi46/JT9skzEI=;
  b=CzjIqR9d4sPBYl92MFZJ8/yqGVoXn1FGXevDGvo+8snwkBEJoN8HMAbR
   OOtUjD2Bn+gq/u5mkSb2iJyU5GACinTS4ycy9uBpqTLZsg9k67MRgjj4c
   nviCeSbLzE6tuRiJaJpX69MVPKDCj9XzoYxVOhn3dem6/VxKg5mx21qnJ
   SAll+hgz8/gfD+9Fwq8q0cQMkrlR73XP3GhoHCYnnR8KecIb/g3kSTnrQ
   JfZxXt3nlxNK4JkDN785QI/1QmhLy2eHKcBbenZWGsvvyiPM/sfsVXMpD
   6VLcB9j7wfFRsKx6vGaIulOx3UBmhN3xInpIwPaFE/NEjY6gBGOjXCzgO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308589361"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308589361"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783741416"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783741416"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 08:39:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBTg-0000WM-0d;
	Wed, 18 Jan 2023 16:39:56 +0000
Date: Thu, 19 Jan 2023 00:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol
 '__pcpu_scope_overflow_stack' was not declared. Should it be static?
Message-ID: <202301190044.0RtHssbW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 548ec3336f323db56260b312c232ab37285f0284 KVM: arm64: On stack overflow switch to hyp overflow_stack
date:   6 months ago
config: arm64-randconfig-s053-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190044.0RtHssbW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=548ec3336f323db56260b312c232ab37285f0284
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 548ec3336f323db56260b312c232ab37285f0284
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?

vim +/__pcpu_scope_overflow_stack +10 arch/arm64/kvm/hyp/nvhe/stacktrace.c

  > 10	#include <asm/percpu.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
