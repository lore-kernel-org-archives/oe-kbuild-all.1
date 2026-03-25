Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B82957B6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472320; cv=none; b=qGWdZm6jmd9CbkZEt4tu4YXLqdkR3ynqv3SP4rkY+7zX/eLk5kRHpNBU0pTMhi6+3J0e2WNSrA/89rcevID/u8+dUe/9SFaPxopiNeMyX+7AVshekJymdgQzTysRYjvvgzflNVjGyCOdiv/++qeV7ah/U1AZg7AE/9rNm1Z99zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472320; c=relaxed/simple;
	bh=nym6Oo9roQ0UMHxde2N+x/PXm/VpZhPvoSGt6t3sH80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3OwjNi6mN7XGmmhOsjMWpX+d7GEUwKjlAYKHpW5zc4aQAgi9ZjbVwYld6Jja3pvJKb+nhw4pav4G9+/Z9gTXtsu/TKZBqlkC4ir9ucEaXwqMvAapcrJpZ0cRnn/FObxvjqqPdVUKyJ/0u0qfrnzoOchy8cHKy/7OR6UenWJtnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0Ocs5ft; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0Ocs5ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472319; x=1806008319;
  h=date:from:to:cc:subject:message-id;
  bh=nym6Oo9roQ0UMHxde2N+x/PXm/VpZhPvoSGt6t3sH80=;
  b=n0Ocs5ftp+gRjvKpCUfqKaWYML6nxqXnx7zz0fzK3l5GHASVmQiSb4cw
   atn/ejD56hlgXgsjP9JLj0f+4Cu4GSxiKtG7ja6KfQywWe7Qx2DWR3ajT
   BGvoOkiBLr6FQOvM2aFQYjFpA7S4VNk8lI+n0nxotqDVyj2MBkPBur377
   UQl/29sRRUA+k2CqMWt5iOlLMZ49bpq++EgwSEahTEhTGUFojYZs0yWyZ
   92St7eECVRY02vnYgectFtpWiRpc6iSHOMVx+rME5vkIb0e5N+dnJUO3K
   +U9izz18Xn8HvrIAxobmtEBOzEASii6W2/r8DOzlOHQmlPKtQ+h2ALPJV
   w==;
X-CSE-ConnectionGUID: XIuqSGmmRDSNc/8iXUfBfw==
X-CSE-MsgGUID: AfocAqxKRBKeKjD1OCV9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74702350"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74702350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:58:36 -0700
X-CSE-ConnectionGUID: X/4Stsq8Qi67brYN6xL29g==
X-CSE-MsgGUID: zLSb2FptQtyNiLHpsLitCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262719575"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 13:58:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5VJA-000000007il-092f;
	Wed, 25 Mar 2026 20:58:32 +0000
Date: Thu, 26 Mar 2026 04:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous
 prototype for function 'pci_read'
Message-ID: <202603260408.oqJDEtxz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [0/1] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-randconfig-011-20260324 (https://download.01.org/0day-ci/archive/20260326/202603260408.oqJDEtxz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260408.oqJDEtxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260408.oqJDEtxz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:971:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         | ^
         | static 
   drivers/pci/endpoint/functions/pci-epf-vntb.c:980:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:15: warning: Cannot understand  * +------------+         +---------------------------------------+
    on line 15 - I thought it was a doc line
   drivers/pci/endpoint/functions/pci-epf-vntb.c:338: warning: Function parameter or member 'ntb' not described in 'epf_ntb_config_sspad_bar_clear'
   drivers/pci/endpoint/functions/pci-epf-vntb.c:338: warning: Excess function parameter 'ntb_epc' description in 'epf_ntb_config_sspad_bar_clear'


vim +/pci_read +971 drivers/pci/endpoint/functions/pci-epf-vntb.c

   970	
 > 971	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   972	{
   973		if (devfn == 0) {
   974			memcpy(val, ((u8 *)pci_space) + where, size);
   975			return PCIBIOS_SUCCESSFUL;
   976		}
   977		return PCIBIOS_DEVICE_NOT_FOUND;
   978	}
   979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
