Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B7199C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0ZZ3E60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700331123; x=1731867123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIX+XyQyKaE2qXE4zs3QANabAoGBOweJKq8ua79RUs4=;
  b=A0ZZ3E60BU/m4KdrgzYQfLi58QrCpgtC/jSQUHHeUKlYVDaDYrD7Ex3X
   AbBAytFZ9hm4YxpMpVMCWuvInOp6ZpJKKiRZA2uUxEbXm5Tg7SApkAvH4
   Gw1E2jfTFhQwV8wtt2Ub2YZdqbe3gB8b3IgypXd6rdscMiMCbMyZbilB0
   vXaa0+MNSwGhylexndlVWLnmbyeCYIUVdvXgW3TYPXYzkkd6iWtOWBk25
   oFVJADmomvag69slt+bCjMsZsHhSWqBQpjsBS3etSrWsn0E2e5REbX1RA
   Qx0jtJAhvRsaknITbQwaruVTUqk1XHFpzs+hc59iIQvVkW9sjA4cVqsaR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="388596193"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="388596193"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 10:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1013218454"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="1013218454"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2023 10:11:58 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4PnM-0004Ad-1o;
	Sat, 18 Nov 2023 18:11:54 +0000
Date: Sun, 19 Nov 2023 02:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [intel-tdx:kvm-upstream-next 50/273] kismet: WARNING: unmet direct
 dependencies detected for KVM_SW_PROTECTED_VM when selected by KVM_INTEL
Message-ID: <202311190252.qP2oLZNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: 561bcfe401080c0e47395e016656fa4a1781258c [50/273] KVM: TDX: create/destroy VM structure
config: x86_64-kismet-CONFIG_KVM_SW_PROTECTED_VM-CONFIG_KVM_INTEL-0-0 (https://download.01.org/0day-ci/archive/20231119/202311190252.qP2oLZNM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190252.qP2oLZNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190252.qP2oLZNM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KVM_SW_PROTECTED_VM when selected by KVM_INTEL
   
   WARNING: unmet direct dependencies detected for KVM_SW_PROTECTED_VM
     Depends on [n]: VIRTUALIZATION [=y] && EXPERT [=n] && X86_64 [=y]
     Selected by [y]:
     - KVM_INTEL [=y] && VIRTUALIZATION [=y] && KVM [=y] && IA32_FEAT_CTL [=y] && INTEL_TDX_HOST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
