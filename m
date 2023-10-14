Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897696127
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVRhbZ9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697272485; x=1728808485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PfsLbB/qLurUeqtBrIBQ9mmO5pk9gJEhbnw94qBLG4=;
  b=fVRhbZ9LZ+BuBv/HKYOlYlQBfkGjq8nqNe6m7+Ptj0kgZT24uzKvxjEg
   JfMwIB5GJh2MRUcxuD9DoWYibkaZSuJP3qjMqSMo4wwsEwjEtnplzkFM1
   LsijcCbJqJWtSdxZU985Y0cQ7ikiQVEs1cY6A7d4lX/uJQZK9+e701g5D
   GNnjN2y34Y245RSOFq6khFAkua2wum5NPMf/ETAmaWnEg1bpj9a9Gt29W
   xI8/SKTnRmeu4WG0YCdKaaBwki5MshaKcljlHFB2B3tMriT3xLsqkGvnZ
   v2xW4LMxd1dhmyWFdMaGd4OyQTId0KkmJiczN6Jo3YcSxzfAe4px4/g4P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389172514"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389172514"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871400494"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871400494"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 01:34:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qra6Y-0005u7-2i;
	Sat, 14 Oct 2023 08:34:38 +0000
Date: Sat, 14 Oct 2023 16:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 146/232] checkpatch: ERROR: space prohibited
 before that ':' (ctx:WxV)
Message-ID: <202310141659.ugY67eiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   d354e0ef7a88098579c12505dc7734334593241a
commit: 6d5706d21a154ccb033f804b8f2904912ba5b97b [146/232] KVM: x86/mmu: Add a new is_private member for union kvm_mmu_page_role
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141659.ugY67eiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141659.ugY67eiH-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that ':' (ctx:WxV)
#27: FILE: arch/x86/include/asm/kvm_host.h:346:
+		unsigned :4;
 		         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
