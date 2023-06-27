Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F417FE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687878177; x=1719414177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GRm+4KoHsYgA+dRXSMzNNPRfatpPkBJpgLpbpohTSLE=;
  b=elqg8OvvaHgqCNJsa2FcNB6RsETFEbooAqM82IuvtqUsQMKw+wPvNh62
   mh0bzNp+o5oAG+NaJeO9CllFrA+ZKP3NoM46CJV62vLD6ByXrYC/4o5TQ
   ItoIv4ycPrPhhbmSNuMJPsG1Mq/M8Wqe3sMfXW7RXeiibztMuc1gV1Rv1
   zlcWp9tCwrKLYLBxIZXwo6HOn2APbI/watpWTlWv/uUmS+Hq5s5cqYeub
   x0AnLVNI6hGi7WryoEKRspcharY7XupjvIRbeiAAN+g7SJg44NUfIKICi
   eDvry6zTX4dkHVxtmz8TyAD8dTpgT3PYAL+42kh6YHWLMGT+I70zti2G5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364141741"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="364141741"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 08:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840717254"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="840717254"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jun 2023 08:02:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEACn-000C0X-2g;
	Tue, 27 Jun 2023 15:02:09 +0000
Date: Tue, 27 Jun 2023 23:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-6.5-WIP-6.4 11/66]
 arch/arm64/kvm/emulate-nested.c:114:8: warning: type qualifiers ignored on
 function return type
Message-ID: <202306272233.zwKNnSCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-6.5-WIP-6.4
head:   4b1f7948108b02c167e9269eba4355c5bc9a3f68
commit: 1036bf3ae60e63df02d357ceaaf47dd483d56d3d [11/66] KVM: arm64: nv: Add trap forwarding infrastructure
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230627/202306272233.zwKNnSCj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306272233.zwKNnSCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306272233.zwKNnSCj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/emulate-nested.c:114:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     114 | static const enum coarse_grain_trap_id get_trap_config(u32 sysreg)
         |        ^~~~~


vim +114 arch/arm64/kvm/emulate-nested.c

   113	
 > 114	static const enum coarse_grain_trap_id get_trap_config(u32 sysreg)
   115	{
   116		return xa_to_value(xa_load(&sr_forward_xa, sysreg));
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
