Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD34FBED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686086367; x=1717622367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAiQIXN9EjCATjeJmnCEEzjgcjauL972XVLy70xkRP0=;
  b=aSrDTSi9WXbQoE6LmW4zhE0gp1zZunqSgJaAw2U/FNjYyXu+GYXFu0bm
   xWlz23i8/aqaflfAYRChbYodXwmmUCnY1I1pkmVybP4w/sgv397UwlTmC
   UJG8i/HZz/NIaHrJJYdR9tWme8XyArojnmXXCB3ggzTi/FnsKg+F2giuJ
   +avUEcXXFsUfkgDP+2EniiVnTDyfZGVeg73ye9eDgZeZCogz/z05a+8Pd
   dLYr/ynlP0EHHOuSPo7mTFzgxP2m/fBhlith+hSasKYPWYA1LvnjOlsAC
   VQ95N5u+UVb6N146jI49Ly9mEKBe54aUvC4/IAlbrPUQExzfb/tjEj05u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422643797"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="422643797"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 14:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853578335"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="853578335"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 14:19:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6e5C-0005lP-1H;
	Tue, 06 Jun 2023 21:19:14 +0000
Date: Wed, 7 Jun 2023 05:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 2/2] ERROR: modpost: "bpf_base_func_proto"
 [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202306070527.ccOT6bLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   d33f8163fd6eef7f249c338d822b598ab306fab2
commit: d33f8163fd6eef7f249c338d822b598ab306fab2 [2/2] KVM: Add support for new KVM_DEV_TYPE_BPF device
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230607/202306070527.ccOT6bLb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=d33f8163fd6eef7f249c338d822b598ab306fab2
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout d33f8163fd6eef7f249c338d822b598ab306fab2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070527.ccOT6bLb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_base_func_proto" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
