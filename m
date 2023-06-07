Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1FC7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 00:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686098905; x=1717634905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pv17G2oqIqAGuP7/qSvRO/zchK7KP1XVoPBPVOQZTGQ=;
  b=J8gG8PXS/2Mt2BgqKsBsxurpboUwKjzMSbryyDU6B9sioOOnN1FbzwpX
   yzHF/y31j85d1doKVgmAw0jiPojkj4TwMxoH5D4YYOusoUMdPziUhCTCO
   qhY/TmeEl2b3XS5mYoBgzs9odAmY6a8MV0b2JcZkpx4K5awY/1JpaGTV6
   WVS5ZGFiMobikcNguMCBMHqS7kFVoF6ryi5H2YXBeRyCXWOtTXOmTw0y4
   s3uciMbRu6IfCRkEZEw22s0PTOhDkudUP7b4oXytrUn7NDXl2iop9C+k2
   KYdbG6rlvuLM7S4FRd3uti1sTjmKfjjyYl7Vd9TF4sTM9mBdUx6Pv8mo4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336465526"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="336465526"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 17:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="779174389"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="779174389"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2023 17:48:23 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6hLb-0005wB-0j;
	Wed, 07 Jun 2023 00:48:23 +0000
Date: Wed, 7 Jun 2023 08:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 2/2] ERROR: modpost: "bpf_base_func_proto"
 [arch/s390/kvm/kvm.ko] undefined!
Message-ID: <202306070830.RIwINQNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   044975299633da153eec3842998426f5f93cda92
commit: d33f8163fd6eef7f249c338d822b598ab306fab2 [2/2] KVM: Add support for new KVM_DEV_TYPE_BPF device
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230607/202306070830.RIwINQNS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=d33f8163fd6eef7f249c338d822b598ab306fab2
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout d33f8163fd6eef7f249c338d822b598ab306fab2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070830.RIwINQNS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_base_func_proto" [arch/s390/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
