Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA2134B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690559553; x=1722095553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kqjMPRaODT/h8tYLSyRbDpGbXJ4BApK6en9ly9/fAIw=;
  b=Pv0OckY+m5QD04Yc8aeQklsuxNHAQadV3W5dF2gw65SEjbLFdKP7qB0Z
   ERmrEV0IbYVzI4k8IUROy0Iu6onmKi4uKq9pbjG59Ub4BRLoXzc/L/6v5
   uN8Ltph2fmPDszG3Nh8pZE3qIC9rJa/CvW5vQltqSSukm9jDvhu3BMwdf
   3Lx5coDAen1engcpQiHpYJVmXXCP6H76+9Zd5Wg/V/kh/BkbTw+7IBwat
   lBe90AKTXQF40acReFCFlgz/WSrk9Pf8zVapajyAfeaalzsWYFJ9VmIeI
   eWU3KSARTjmoX+NbJqsslp4O7SoN1eLb+9/FPDjPozCdyd6xKlsmTNOpy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348224001"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="348224001"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 08:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762645761"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="762645761"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 08:52:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPPl2-0003Kp-0g;
	Fri, 28 Jul 2023 15:52:08 +0000
Date: Fri, 28 Jul 2023 23:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol
 '__pcpu_scope_overflow_stack' was not declared. Should it be static?
Message-ID: <202307282357.QKRJ2Zqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57012c57536f8814dec92e74197ee96c3498d24e
commit: 548ec3336f323db56260b312c232ab37285f0284 KVM: arm64: On stack overflow switch to hyp overflow_stack
date:   1 year ago
config: arm64-randconfig-r071-20230728 (https://download.01.org/0day-ci/archive/20230728/202307282357.QKRJ2Zqf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307282357.QKRJ2Zqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307282357.QKRJ2Zqf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?

vim +/__pcpu_scope_overflow_stack +10 arch/arm64/kvm/hyp/nvhe/stacktrace.c

  > 10	#include <asm/percpu.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
