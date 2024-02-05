Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1411193
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707120560; cv=none; b=YuSmQ6Fpdv1yn+ubpdF2ZgpTCqjSra+xUSKyFCfgczZEiHq4wVbtK6/xvDBs9/3G+F/QDSAS/TAsRTck+GpYZJEEJqJNWbT2MLEgARSJYkV1ZOt45q7M5E/HaZwV9LROq+q1PBSRXqDYnZxBVm1k+YzY5/wN+jZZM33grgFrpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707120560; c=relaxed/simple;
	bh=Ks0lov1gh8JDgxR8hvosm1lvqFBO+qlrZkDzphBDnY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uH6ivbsJHmK+LWr0/kx5c+wHfmjuvR61HGJv2ApmZH0k5Chefr/VilDAsvXS36g63h+RhnMOrzIZCS4JNU3fw9KdSYuhCtCkCRsAmtbhU6EqX2OjW2Iy272d99gvNxsUjfYt6nSp0LTUPHtM4ERj9JET2xRPb9wURECo7BxmI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQXpRCKa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQXpRCKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707120559; x=1738656559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ks0lov1gh8JDgxR8hvosm1lvqFBO+qlrZkDzphBDnY0=;
  b=dQXpRCKayzdRi9Xm3DULUXBDsiykRHIJA0UUEZmyulj8EIGAhVsNK4dG
   jNHJvFojjUdPcdTR4kUrDxpTRf6rp84cavNKgqMm1/LoMsld2qjGEncFq
   P6f6uhAxhb+tFD5tcsXHJBD9LQ9gPclbHItghjTdNGLVLnO02oUAX5dB3
   YZcuR3mgBExv74ggb4RyNDIB45MJGrMBuiXRC3MECCtcpJo3CdaovSIHC
   yriu5rkATyxF11VYvZqd5JZhTk24KQp0ptfRlH005KSa2w51sVtsfv0Sx
   Ljb1Rt0vqVZQ9pvuKbOJhoq6A3ofAUcBdxRZ0JD23RjuKoWsHX1JPtaGq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4267207"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4267207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 00:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="31747434"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2024 00:09:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWu2U-0000FQ-1r;
	Mon, 05 Feb 2024 08:09:14 +0000
Date: Mon, 5 Feb 2024 16:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 4156/30000]
 arch/arm64/kvm/arm.c:1906:6: sparse: sparse: symbol
 '_kvm_host_prot_finalize' was not declared. Should it be static?
Message-ID: <202402051501.Ds1wSsCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   bc4cd26292c67455a84d6e7f6b7355e6fc9377f7
commit: 68bd98a28aa622358c73420792329221c86fbe0c [4156/30000] FROMLIST: KVM: arm64: Wrap the host with a stage 2
config: arm64-randconfig-r123-20240204 (https://download.01.org/0day-ci/archive/20240205/202402051501.Ds1wSsCt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402051501.Ds1wSsCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051501.Ds1wSsCt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:1906:6: sparse: sparse: symbol '_kvm_host_prot_finalize' was not declared. Should it be static?

vim +/_kvm_host_prot_finalize +1906 arch/arm64/kvm/arm.c

  1905	
> 1906	void _kvm_host_prot_finalize(void *discard)
  1907	{
  1908		WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize));
  1909	}
  1910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
