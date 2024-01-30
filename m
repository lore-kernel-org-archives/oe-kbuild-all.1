Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E279DCA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646817; cv=none; b=JIqmk79NjbGttHc3trFGrLg/kCD7yXGZCFb0PnBkCajO1jLulWL9GTk4X1VZ9zR7LBE5ZRM0w/ioQ0PEwgNSCMmJXdGpKzozVEPBeQckD+48kZkbbqZSy/8e4B++sxIle8LRhHv4Vu8Bq2go7xZqtC3ZZZeBvoHztGhLHGrfuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646817; c=relaxed/simple;
	bh=ZxUX/jXO2hBnq8qLs3h5u5OYNwbRLVSjBvQDtWPkH8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TC9X8KySdWIx9PXDZfjixa29ul/FatKtyQ9dIL1YQ5GdNpvOYmNb/8Q5rBnk7eIWIf+U8Am3B0DSs5oz5ZloZotjwRHGP5/c4VCGdi8FTCu9tJbQy321Z4o3xwR+doq+Hy1QeP6hhh+7t0a+jXwRfwvWFcKnnmlRYKcSnv3raXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCgHlgEL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCgHlgEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706646815; x=1738182815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxUX/jXO2hBnq8qLs3h5u5OYNwbRLVSjBvQDtWPkH8g=;
  b=hCgHlgELh0nM7Q9N7oxNeNthJpHaQc3SNO6dxqEP1w5HUknMikPsT2xz
   H7ByDrJB8GtzxUMUIOUhbWNq8kRC+LWll/CkPgj0jfKL8hLZSO+FV40Oc
   6+j8sxHqWqIHKp7hVRjaqj/Bw+dZq6H+FeCfEpRH93I307o86DNIj4oJa
   njnk+NC2DG3j3z6Q4YPOK/T2HXkErntJRPmv9rIZ5DQFN2cK3kScm+5NV
   XigEUdYWPRORpDBh6I17gM6A/B/XYsymRkWrhz7cTqyTC99RIc4ytmgMa
   kg9wqKYOBwKJCsJzqnSy4297yhJ75Raw9t8OxZHrKau8WjDqDiNJ3UHVo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16782098"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="16782098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 12:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788319239"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="788319239"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 12:33:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUunT-0000no-1u;
	Tue, 30 Jan 2024 20:33:31 +0000
Date: Wed, 31 Jan 2024 04:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28676/30000] arch/arm64/kvm/reset.c:102:34:
 error: implicit declaration of function 'sve_max_virtualisable_vl'
Message-ID: <202401310428.WDzXvKLP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7b3b2702f031a1a8368468aef621f12b23241185
commit: 68da302c8ae30331c8917f1dc7b0f1682f696d71 [28676/30000] arm64/sve: Put system wide vector length information into structs
config: arm64-randconfig-002-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310428.WDzXvKLP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310428.WDzXvKLP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310428.WDzXvKLP-lkp@intel.com/

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
