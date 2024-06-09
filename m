Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D921F951
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717966531; cv=none; b=YnqlLeFxKBpCCbBirilodeEfSAGCn1b4iRvQzm28CmPwEC4GcsaikAzX084vBwp7aCaEQL+sFh0TP3G3/o5Ro4qAbaK8wJzk2aEjXQKsuBmA8qtkhK4iL7h7blF1qyopRgcmMBNWypqHeezH7i4QbW8bXvEq+hEzvM1OLAN+WzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717966531; c=relaxed/simple;
	bh=5KWFO24ysH+tFwLa7ywVst5cKKNCR485hSjcytUVP6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjjVwP7gOGZVzhgovGwoTLOVRzGjWXPOGi8ettHzoD3eWB+iaBsG41slj9LSRRaU3jeq6UQZeQOQ7oGME9DHjsT/RZEkFm/hJvGJ0gC1yuV3HnweJUHqZgpuMBbnW8KUqf3OaqGOatOilrEU13t8Kbx8K+FTps0wKXNuqpZX/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOnyUBai; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOnyUBai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717966530; x=1749502530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5KWFO24ysH+tFwLa7ywVst5cKKNCR485hSjcytUVP6U=;
  b=aOnyUBaigb5ChhEYjDJOtoEcLxYIylc/mrHPDwGgV5W4YyaBb7Y8kFU+
   hPnBl8jyZ9iNHG5VjS8RDRkOXL22ddjkc90XQrbeRH+QDvIKwvVRfW1MK
   RwQ5z8137OWSpJkg2lGDFXEu4+KC8HJaG407WE55f+sog5bjwRDf3MnjP
   9YccLb9/VL4H1r2qfnb9jWAwUp9zLRYHmRk3VfAa9WStAKxR1TTSgDHEf
   VEtuV2yxwTQ6JujkaLzfGpNPep9E8xOXP2TdTDk3PHPEJvVpbf6IVo/RY
   Yh3pFF41Yy7x/kicz4fmOIohw2gFObdvlzUNH84zwPThzo+W5FNQ+wL1C
   w==;
X-CSE-ConnectionGUID: bBwkfUb6R8Gg5RgOeP7sFg==
X-CSE-MsgGUID: SiaMnTMuQD2DCreGxVpZ/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11988102"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="11988102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 13:55:30 -0700
X-CSE-ConnectionGUID: hYKvLdoRT7aKx6Y+11vJbg==
X-CSE-MsgGUID: wKoEgLP+SIeFcTt4XNQT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="69654788"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 13:55:29 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPZW-0001aL-2a;
	Sun, 09 Jun 2024 20:55:26 +0000
Date: Mon, 10 Jun 2024 04:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:kvm-arm64-fix-pkvm-sve-vl 5/5]
 arch/arm64/kvm/reset.c:55:43: error: implicit declaration of function
 'sve_max_cpu_vl'; did you mean 'sve_max_vl'?
Message-ID: <202406100455.Ewjp9Uex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git kvm-arm64-fix-pkvm-sve-vl
head:   9ea90d731627c7dad29ad83064ccd05fd04c696f
commit: 9ea90d731627c7dad29ad83064ccd05fd04c696f [5/5] KVM: arm64: Avoid underallocating storage for host SVE state
config: arm64-randconfig-003-20240610 (https://download.01.org/0day-ci/archive/20240610/202406100455.Ewjp9Uex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100455.Ewjp9Uex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100455.Ewjp9Uex-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_arm_init_sve':
>> arch/arm64/kvm/reset.c:55:43: error: implicit declaration of function 'sve_max_cpu_vl'; did you mean 'sve_max_vl'? [-Werror=implicit-function-declaration]
      55 |                 kvm_host_sve_max_cpu_vl = sve_max_cpu_vl();
         |                                           ^~~~~~~~~~~~~~
         |                                           sve_max_vl
   cc1: some warnings being treated as errors


vim +55 arch/arm64/kvm/reset.c

    50	
    51	int __init kvm_arm_init_sve(void)
    52	{
    53		if (system_supports_sve()) {
    54			kvm_sve_max_vl = sve_max_virtualisable_vl();
  > 55			kvm_host_sve_max_cpu_vl = sve_max_cpu_vl();
    56			kvm_nvhe_sym(kvm_host_sve_max_cpu_vl) = kvm_host_sve_max_cpu_vl;
    57	
    58			/*
    59			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
    60			 * to be extended with multiple register slice support in
    61			 * order to support vector lengths greater than
    62			 * VL_ARCH_MAX:
    63			 */
    64			if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
    65				kvm_sve_max_vl = VL_ARCH_MAX;
    66	
    67			/*
    68			 * Don't even try to make use of vector lengths that
    69			 * aren't available on all CPUs, for now:
    70			 */
    71			if (kvm_sve_max_vl < sve_max_vl())
    72				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
    73					kvm_sve_max_vl);
    74		}
    75	
    76		return 0;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
