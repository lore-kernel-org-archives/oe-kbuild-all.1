Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98297140E38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729596340; cv=none; b=sZYZSgcOK49RBCWJ0GntAb7qElgSq5vTb4pJrysXTdJdflOUSvhmvJNv1waYPKBT1dqKdDm+RiIHpetK+kDtyblXM/rmZDPLD5i4X68/Lsf5t1D/w6nEA8SYnXuzFMmtKkpYMU1x29qZE2tbuVAyp4ED9ys0UbDTUPv7wvuws3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729596340; c=relaxed/simple;
	bh=BqzDKVhcNrJhSLdTVDYEagX4fNXOW0Zu1EqI5vXrL9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NocxeSwafHRYkAgME6h0+LYbyfeItDo+txm0nYY/RtRgSlZneUO1J87zbRuzAoYWK5ygJ2IZdsmgL880zzJvmg9IKtNa8E+u1ibdDia9RUStwPXLyci1QrwRMJIpY7l6NRqf+p4HxsAMO6u94RlNpjxfwRlj37/LwgpzFoARM70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JElVe9Wv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JElVe9Wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729596337; x=1761132337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqzDKVhcNrJhSLdTVDYEagX4fNXOW0Zu1EqI5vXrL9g=;
  b=JElVe9WvLAU9W39EYiOBGg1vnmpSifZfLRV47QSaeZ6Xi4zaax9+r3wO
   ulitq7qiKzNRZvV4eKSQsEg2cIF2ZPQ0uP9EJdp3E1KlQ7ZC4CXEFLQXL
   gxgzdeRZJt4uXHUAzjmb3SOhrQpJsK+ULAPUrZjyGq7RKf5If0OQSCooo
   8SkCJ1bPcaprteGIDCMTUGYpqxXi7KYwlwBeY5+uDprqoLkDHeq8n/4pP
   ShZI8ZN25hrSGfIJUIFmD5Zu5amGBcczygqjB6LAmS854kmu7uGh48XQ9
   KA5MU9Tt0owNfAkX445tPBSNcwsBFL34mFxyVEypBmQjrO2bhPJ68TC0s
   w==;
X-CSE-ConnectionGUID: oM4/5l71TZCMSs7amTX5Bg==
X-CSE-MsgGUID: F2lt4QubQRuZCepz2csKxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="16753754"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="16753754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:25:37 -0700
X-CSE-ConnectionGUID: Hdr/aE69Qn2onWt6qux9zw==
X-CSE-MsgGUID: boGdJYLxSqGfbPtnmvLUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79755350"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 04:25:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3D11-000TUQ-0x;
	Tue, 22 Oct 2024 11:25:31 +0000
Date: Tue, 22 Oct 2024 19:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2230/2444]
 arch/x86/mm/numa.c:925:5: warning: no previous prototype for
 'memory_add_physaddr_to_nid'
Message-ID: <202410221958.C7mIKYtt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jarkko,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 9dbd28a697a6333fa61e89292aa06fc7fc0ef441 [2230/2444] x86/sgx: Add a basic NUMA allocation scheme to sgx_alloc_epc_page()
config: x86_64-buildonly-randconfig-002-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221958.C7mIKYtt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221958.C7mIKYtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221958.C7mIKYtt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:1875,
                    from arch/x86/include/asm/amd_nb.h:6,
                    from arch/x86/mm/numa.c:18:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
   arch/x86/include/asm/pci.h:122:16: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     122 |         return to_pci_sysdata(bus)->node;
         |                ^~~~~~~~~~~~~~
   arch/x86/include/asm/pci.h:122:35: error: invalid type argument of '->' (have 'int')
     122 |         return to_pci_sysdata(bus)->node;
         |                                   ^~
   arch/x86/mm/numa.c: At top level:
>> arch/x86/mm/numa.c:925:5: warning: no previous prototype for 'memory_add_physaddr_to_nid' [-Wmissing-prototypes]
     925 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]


vim +/memory_add_physaddr_to_nid +925 arch/x86/mm/numa.c

93c573edf4d3ac Dan Williams 2020-02-16  924  
93c573edf4d3ac Dan Williams 2020-02-16 @925  int memory_add_physaddr_to_nid(u64 start)

:::::: The code at line 925 was first introduced by commit
:::::: 93c573edf4d3ac33f2e5fb4e515e724fafc75594 x86/NUMA: Provide a range-to-target_node lookup facility

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
