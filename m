Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824B1714C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 05:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729747119; cv=none; b=UKVf32IRGXtaYV4I/v+wHQkJEtOcgsgCjDbTOwLcdf6TT4cj3tKuEYiC/K+j8y2KpSKNAOxLQxRDTQ8cpRmTPPTAz4Z/oK/YvPs8hegRANWEBtghay1IDivE7I0NKDoNVs5T/xJIbOat+fsQ85Sb5/TJyenLWtbjz87WKnqe+fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729747119; c=relaxed/simple;
	bh=nW5lVy7pEyDkY7mM4WORR8ASNiP5YKNEm0GJyRfIYc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBSihrhzmwkOlhujH9Qon+P+pMoyWQmIR5M19U00wdwh7P1YAlrV3UoDKuuSyb93ZdiQ6xHEloYkO+Gq27PJp/YynLvZF9+7VlRZlRwcNO7QBSB7CethKXUNaDSvwJW30ThYSCLXagvug+CcXhPp9xAMhwfI14J3FB0wgvQnTuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/eUu7ya; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/eUu7ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729747117; x=1761283117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nW5lVy7pEyDkY7mM4WORR8ASNiP5YKNEm0GJyRfIYc8=;
  b=V/eUu7yahGfX0L9niOlt0J5Cfve0AES8MpADKSICvxhofM1XZ9TfR78W
   2NPF2m/2j+PEpGxpH8I15EX03vwFopFYznqEhj4amxRDTACcqkH5zW68W
   4uYGldiqvfzdcMCoMORaeon1JOY36s5atL38Tj1FuPWak7mBZFNzFL2G8
   mX5/yvycTzVMv1tIIssepb/lTcUjvw/sFXx7sO2OAe7yD++Aaa0qvHHFe
   Fw4k3VMP+dm0qg6JGl0US2qoL77/ZfsIVucXZyE8Zw3diMv9Gm12JwX6v
   GAX8dQPqj4qjPli1RU8PmkHArVrRQ6PPciTbtv2YPAGW7IDbslz0eq7c9
   w==;
X-CSE-ConnectionGUID: 5owH8AnKTfmF3RFfjAVB5g==
X-CSE-MsgGUID: r0GiwggUSHm2akjH2qOPFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33048287"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33048287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 22:18:37 -0700
X-CSE-ConnectionGUID: Pohe58VXTaaySUbuBZeAVg==
X-CSE-MsgGUID: m7YeAdbzRreUrEF/oBoBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="84452831"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Oct 2024 22:18:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3qEz-000Vy0-0C;
	Thu, 24 Oct 2024 05:18:33 +0000
Date: Thu, 24 Oct 2024 13:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21492/30000] arch/arm64/kvm/reset.c:102:34:
 error: implicit declaration of function 'sve_max_virtualisable_vl'
Message-ID: <202410241303.wTIeIXFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5faf5aae71283199f69c2a60ed91ab2847f3ffd8
commit: 68da302c8ae30331c8917f1dc7b0f1682f696d71 [21492/30000] arm64/sve: Put system wide vector length information into structs
config: arm64-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241303.wTIeIXFm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241303.wTIeIXFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241303.wTIeIXFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_arm_init_sve':
>> arch/arm64/kvm/reset.c:102:34: error: implicit declaration of function 'sve_max_virtualisable_vl' [-Werror=implicit-function-declaration]
     102 |                 kvm_sve_max_vl = sve_max_virtualisable_vl();
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_max_virtualisable_vl +102 arch/arm64/kvm/reset.c

    98	
    99	int kvm_arm_init_sve(void)
   100	{
   101		if (system_supports_sve()) {
 > 102			kvm_sve_max_vl = sve_max_virtualisable_vl();
   103	
   104			/*
   105			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
   106			 * to be extended with multiple register slice support in
   107			 * order to support vector lengths greater than
   108			 * SVE_VL_ARCH_MAX:
   109			 */
   110			if (WARN_ON(kvm_sve_max_vl > SVE_VL_ARCH_MAX))
   111				kvm_sve_max_vl = SVE_VL_ARCH_MAX;
   112	
   113			/*
   114			 * Don't even try to make use of vector lengths that
   115			 * aren't available on all CPUs, for now:
   116			 */
   117			if (kvm_sve_max_vl < sve_max_vl())
   118				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
   119					kvm_sve_max_vl);
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
