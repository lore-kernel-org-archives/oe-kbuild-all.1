Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB115B6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 03:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689476414; x=1721012414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=emmhLBByRRKGW/xqWw/pxXYPDGeHnyVUtkDtqz79Ixo=;
  b=NGbwJun2bigJl9n3qcsXMLrGnLtHhOozQGsxOmyRBJxa5urXZt/qClQf
   Wohu7ZkMqt1/2eEa/+8GnPASQevPJGqDdSVj8Kh3y5Ffp8KfxvDvZBwwo
   /deYoAFiTDeFkmbqEJCJGQ8fYOgvfq2UGMfmBZvW2EN8MY4FtmnqrXSJv
   r7njiGusO3k4DGMvMe8nV7VtxXQjpVygsUIQhqJWhi/+bZ1QyUipURSaf
   GM1sK0hwnS2Vw8liXudSZx7+yMu8upGCmHFdpFR6HrO5me8ie+wHAYnMu
   YoGOVrZmR4ESRWBodJ36kQmCtKu+28FF8Yiv2QMkDTb+Ufg9znkXIzfTL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364595517"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364595517"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846879204"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846879204"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 20:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrzW-0008Uz-0v;
	Sun, 16 Jul 2023 03:00:10 +0000
Date: Sun, 16 Jul 2023 11:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 41/365]
 include/linux/kvm_host.h:2369: multiple definition of
 `kvm_arch_gmem_invalidate';
 arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined
 here
Message-ID: <202307161001.yu1v6oX5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: f3918645dc85801290d3e7cf1c2ce9e19b1d8489 [41/365] KVM: x86: Add gmem hook for invalidating private memory
config: x86_64-randconfig-x013-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161001.yu1v6oX5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161001.yu1v6oX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161001.yu1v6oX5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/vfio/vfio_main.o: in function `kvm_arch_gmem_invalidate':
>> include/linux/kvm_host.h:2369: multiple definition of `kvm_arch_gmem_invalidate'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2369: first defined here


vim +2369 include/linux/kvm_host.h

  2368	
> 2369	void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
  2370	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
