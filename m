Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1F323D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680007026; x=1711543026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgncnnXFBBBLmeBiVEs0nZZBRkBgYgCSITMvnGSNSnM=;
  b=RDH8tPZFdaboJQ34INmpUNIe8BHgbXsdS1atVXttlgXuBEqhPbnC5AHM
   5vCXa4C4AqucdCj6j5dxq0DHQ8VeNcTPaVZKyGLjjlxvArpP53hGu+xe6
   FXIM+p0Ej4UcJ6FcKBeN1/qaR/i3TSbWdo2Z6heIBxeg3ygvb7RS8FSmQ
   x3RrjUSa1NFGQ3fjuXOHSNbAbS/ySUrkX7Yn8z1lbBccFMu9qpXAC+fX6
   qFbJw3SbjP3cvR5OQMWAOcb4TQEU8k3iums2AFpTXZdAy2zzY6p+01DaC
   B8j+97xs8E3JyJ4JZ50t7CPtAUG7eLGypGNyUYYh8xDSTCAffi+EEDRK4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339275656"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339275656"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807846248"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="807846248"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 05:37:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph8ZT-000IX5-2R;
	Tue, 28 Mar 2023 12:37:03 +0000
Date: Tue, 28 Mar 2023 20:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 63/328] kismet: WARNING: unmet
 direct dependencies detected for KVM_PROTECTED_VM when selected by KVM_INTEL
Message-ID: <202303282030.gAF5sKqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: b57e75070e4a561d94003782ea171d3cb2b7b8b2 [63/328] KVM: TDX: create/destroy VM structure
config: x86_64-kismet-CONFIG_KVM_PROTECTED_VM-CONFIG_KVM_INTEL-0-0 (https://download.01.org/0day-ci/archive/20230328/202303282030.gAF5sKqc-lkp@intel.com/config)
reproduce:
        # https://github.com/intel/tdx/commit/b57e75070e4a561d94003782ea171d3cb2b7b8b2
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b57e75070e4a561d94003782ea171d3cb2b7b8b2
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_KVM_PROTECTED_VM --selectors CONFIG_KVM_INTEL -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282030.gAF5sKqc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KVM_PROTECTED_VM when selected by KVM_INTEL
   
   WARNING: unmet direct dependencies detected for KVM_PROTECTED_VM
     Depends on [n]: VIRTUALIZATION [=y] && EXPERT [=n] && X86_64 [=y]
     Selected by [y]:
     - KVM_INTEL [=y] && VIRTUALIZATION [=y] && KVM [=y] && IA32_FEAT_CTL [=y] && INTEL_TDX_HOST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
