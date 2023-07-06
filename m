Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF046BA23
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688662421; x=1720198421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t813Uy0cMTyLAklty/3XvK2s62KEsvmWViPM+K3+gzU=;
  b=RDG6ys9YuOXO8GhrsVhILFvGQf36E8r5zrAx6eN98750yt40BPHj20SL
   EW1fs8nx/gjdfD2CmeWlVYko/WdYujhtfN/16nmxBXe588L16jIx+p1aY
   UI3t1t+4TD5ysFIdKvjzeDjDjqonS2FSdWpy9O/TSDt9xlgExMp7r0Hga
   +Whu/jzpSQPKqx+hFEXj7Z4jzV5omjT1otQPjj2KguJyNq5KkvnJ0uPuY
   ZAlqlJKgQr2Wz3qcrMN1eJF9rtNitrKQ6YCmv3OsK5jPbXB2x4oRKXMhW
   Tp5w9oG+EHRKpqsdQJLQyiH11aW4lNcvnTXw6xmE2fo2/Re+8szPEwb/I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367149433"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="367149433"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 09:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722863569"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="722863569"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2023 09:53:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHSEc-0001TG-3D;
	Thu, 06 Jul 2023 16:53:38 +0000
Date: Fri, 7 Jul 2023 00:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-fgt-wip 12/76]
 emulate-nested.c:undefined reference to `xa_store_range'
Message-ID: <202307070051.nlJurPO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-fgt-wip
head:   daf96054697428aa68c87db81dd3988fcf2e4bd8
commit: ddb3683ae6e0efd50d24f4390632cc98b0a88671 [12/76] KVM: arm64: nv: Add trap forwarding for HCR_EL2
config: arm64-randconfig-r015-20230706 (https://download.01.org/0day-ci/archive/20230707/202307070051.nlJurPO3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070051.nlJurPO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070051.nlJurPO3-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kvm/emulate-nested.o: in function `populate_nv_trap_config':
>> emulate-nested.c:(.init.text+0x120): undefined reference to `xa_store_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
