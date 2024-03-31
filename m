Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10035894
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711898013; cv=none; b=ONLGXgXtBDu+JAtuwADPChpPiCGXAMsuzF4V36l8pg4y1utdOu5gVZYvZIser91FA101RueLncj5ov9McCuj+3y7G/Mgi288oBBgwPy3X4eWW3kPd95F763yoGB9e8f1/TaQWYipBaT3AHcAszilej8d7hvJIO08XAPKmNAxq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711898013; c=relaxed/simple;
	bh=2+Ep+atIQFwlDBsPHXFNkU+85mwHHqFbQbYrlJrPcmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKYsQQbuUTO8EXSS9Yflycln5RCeBK6JNV5TtzHkHFMasxPJs46z9SsnTPeoVJ7EhHEonkdtYfqMvG4B/hRPqomj5TJWMBycN4BU+t+MmUdH1ZcwMl59SeC3Kbm9uY7pqcSmhUL7E+JJpnIvFfy15m41r5WrrtMAS1/DNR7BlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i750N2gl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i750N2gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711898012; x=1743434012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+Ep+atIQFwlDBsPHXFNkU+85mwHHqFbQbYrlJrPcmU=;
  b=i750N2glY8MK2X1h3sXW6F08UDofAx/GdKQw5FD+/gxc1GDHoQvvSfOl
   0hPzK62vXvC9hxJurqt76le2Kn1o9KdBQ4EDtTYV9g31erhNrXRXiU5nU
   8R1Z34ChO8Z/LnpkuDRQNWJpxE3Hn/SfZ5zFmWnq4o2kILm2mI/8NCN0i
   GbYfAwqOy9MqAfeotHndPERR9fJ2EPpJ3audeQZNhEO+dpLu/iBjVwwoE
   kgzHaHt4rAnHBV/+SzaCTCmOv+XTXyAHGJemvq/DllgviQWJVk1fw5Q7l
   t6QnQdRUEdVjqmqeN2SfK5E80OdqiGpxpFYoFXmnW3mSN8Fo1sCkdqCYa
   Q==;
X-CSE-ConnectionGUID: lx5WLdWfSLibsOaD9M2uqg==
X-CSE-MsgGUID: Nxqg08aKTiWiI/NdU6SIew==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6967017"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="6967017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 08:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17549021"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 08:13:30 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqwsB-0001Cs-2N;
	Sun, 31 Mar 2024 15:13:27 +0000
Date: Sun, 31 Mar 2024 23:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhiquan Li <zhiquan1.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13084/30000]
 arch/x86/kernel/cpu/sgx/virt.c:95:35: sparse: sparse: symbol
 'sgx_vepc_vm_ops' was not declared. Should it be static?
Message-ID: <202403312308.poZqKVE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   737efe73dd2ca6ee503ba26e6fc3ee41bd8cf633
commit: 4fca036fe49fc7b29c8c2fb4e67a5dc64041507c [13084/30000] x86/sgx: Introduce virtual EPC for use by KVM guests
config: x86_64-randconfig-122-20240331 (https://download.01.org/0day-ci/archive/20240331/202403312308.poZqKVE9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403312308.poZqKVE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403312308.poZqKVE9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] ret @@     got restricted vm_fault_t @@
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     expected int [assigned] ret
   arch/x86/kernel/cpu/sgx/virt.c:59:13: sparse:     got restricted vm_fault_t
   arch/x86/kernel/cpu/sgx/virt.c:60:20: sparse: sparse: restricted vm_fault_t degrades to integer
>> arch/x86/kernel/cpu/sgx/virt.c:95:35: sparse: sparse: symbol 'sgx_vepc_vm_ops' was not declared. Should it be static?

vim +/sgx_vepc_vm_ops +95 arch/x86/kernel/cpu/sgx/virt.c

    94	
  > 95	const struct vm_operations_struct sgx_vepc_vm_ops = {
    96		.fault = sgx_vepc_fault,
    97	};
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
