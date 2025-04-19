Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192B4207F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088604; cv=none; b=u+zXgEgFI81RTZO1a1L83kCayeg5/zb+G1bgG6m+fCMDO/AN5ERwCVSWyCLetptHDvQ6tleIsLfvPN+1O8hR7EwqDY2m9IAoQnHvOUjo0faJrlZzqU9QqG9TS4PmgrD38pCgAA63stUZh5ucHAkED+2klyujbKill7XOPhAGA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088604; c=relaxed/simple;
	bh=S4OrhhGs0YCeuAnB9WipJv+auHb5/rBsXsT2GePBFls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJqrYT98bGye0d7Rjt33gq4m5G9qbQPJ+YXDwDcl9jGQ/dxyjB3mClf9qiTPdUOTFsdAgJVEibOb/lYj6XTbbK/1qpfkTPgIw6NZ93FwUnowTGgVLbQIct2gscR2GPMVYCPlYMoIMr3iXCMvTPbHwY+TsxrVs5s5T03N/L+MGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg8nhKTT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg8nhKTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745088603; x=1776624603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4OrhhGs0YCeuAnB9WipJv+auHb5/rBsXsT2GePBFls=;
  b=Sg8nhKTTC5svOOE8/rk02XDgnf9+vkAZUmuKoaBh3KzkPELj32XkDN0f
   MAlSnkStxBZV5qheDq2S3nUBRj9R+acAIXDWljZ1j+laIny4JnfwLtcJh
   0wAa4i43OkmJwAlOd3cTVxq/eDG9wqRFaCgy/p+v4GIj0QgeOujx9b5lJ
   hqGTgC8SsDHAsEL/4mlWoWagvpV3Iokzn4kBU7SHzNLZT1ELWeP/nX9US
   uzmyZq7WU7zSjqZevpx6A9wBS/Wvw9UZ4KFwO8R0WR6wY7p+ULC7qGLjx
   QDhdWq4HZ1VJjGXwN+8bo0WWma5JZARXj1Tvk2h5JpssziGjHTUuYfUg2
   A==;
X-CSE-ConnectionGUID: pJvawW/ZR66A9eE014lAqQ==
X-CSE-MsgGUID: kAAWJw6JTXC+Wc5L7lvzVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50513600"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50513600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 11:50:02 -0700
X-CSE-ConnectionGUID: h9B8TcJ9Sii/m/e0IUguJA==
X-CSE-MsgGUID: zcYpmt+URSaXsX1cObScbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131904692"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2025 11:50:01 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6DGI-000461-1y;
	Sat, 19 Apr 2025 18:49:58 +0000
Date: Sun, 20 Apr 2025 02:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/16]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype
 for '__get_vcpu'
Message-ID: <202504200212.nSkcr4T1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf1d8c3f9c916968d5bba0758ce104055fed43cd
commit: 41148bbeb73900a1fe8c5d7c64bbec5207d84c06 [0/16] ANDROID: KVM: arm64: iommu: Make allocation guest aware
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250420/202504200212.nSkcr4T1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200212.nSkcr4T1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200212.nSkcr4T1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:77:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
      77 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^~~~~~~~~~


vim +/__get_vcpu +77 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    75	
    76	/* Return current vcpu or NULL for host. */
  > 77	struct pkvm_hyp_vcpu *__get_vcpu(void)
    78	{
    79		struct kvm_vcpu *vcpu = this_cpu_ptr(&kvm_host_data)->host_ctxt.__hyp_running_vcpu;
    80	
    81		if (vcpu)
    82			return container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
    83		return NULL;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
