Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFD86353
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770367677; cv=none; b=kMtL0Vlx7Ivdxfv/SwJ5LvdV7x9/1zZHFQw2Gd5Q55LuvI38RvwzpLlxAYfrj6ySgas94GnC0VQBAw4hfIG9c+z7gh3HQ1Dwr7B1SvoljMhjHCLplHu250eOs0hNDvF6ADPZoceH8YLXGKpV0z9daLyzc121zmUo7U0GlpX79Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770367677; c=relaxed/simple;
	bh=O+3Ph7kSejZU8/SGiiLpBCMD8gUJxSDKfGkKWkVOw4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nBSw69UwAarNVD1CrPLQ+AqHnsO8iqaUFbIp896NeFHHkZPjk+G/jmQW/Sty+9+kf3sHiTu6s4uuC6TYthsKppn8RSPJUYcjbdGJKiQczMpwuZ9D+RYoOwf/nEF21ezCqpdOcrR1eWmdyaBkMWSvggXNVWFehSuYZZY2ec2NqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO/8Yz5B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO/8Yz5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770367677; x=1801903677;
  h=date:from:to:cc:subject:message-id;
  bh=O+3Ph7kSejZU8/SGiiLpBCMD8gUJxSDKfGkKWkVOw4U=;
  b=GO/8Yz5BeIr2vkAn43zcfIFLQ+KgKPWohLInyX0/nZIiEpsdnxaIqfgH
   Ibq5xXF5BEfssNfJ1fyujDtwUuPUP+tnN6MQRu3QIvqcsh1anbN8y5n13
   H1G8O1HvU1+BSV0UDYwGI0HEraOgOBk7cgofZga6+RSP+QI12/jMO1Dc8
   EvVNcAxrudV0ubxpS2KWKuX9BnzFPka3qKBxQimHOLrrfreyrl5NwbBNl
   PIBIQkv8YUc21hmhdPUWPl/vELL48JjZ4jV+zQQzPGpq28T4KX/wVStBj
   5TBPK0nU+5Pa8i0FsrBgEJQM2Y7l9IgeU2hpWJKOtOv+YbyOOSg3dfqwJ
   Q==;
X-CSE-ConnectionGUID: 0ZlEDHQ8Q0K8hqALLKz3QQ==
X-CSE-MsgGUID: jAIMcQSzR7SSwgGv9S9QFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71298369"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71298369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 00:47:52 -0800
X-CSE-ConnectionGUID: ihrKt4u3RSqP3bbFw7uOGQ==
X-CSE-MsgGUID: kUZltu9DRFSq72QdB7v5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210859439"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 00:47:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voHVD-00000000kaK-3B2j;
	Fri, 06 Feb 2026 08:47:47 +0000
Date: Fri, 06 Feb 2026 16:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1906:40: sparse: sparse: cast to restricted
 __le32
Message-ID: <202602061656.HTIBEG7j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   367ce0597211847ec0f62618e0a515f37cc84dd6
commit: eff36ac2fe9748dfe31b22d00b62f6eaf7323732 [1/1] ANDROID: KVM: arm64: Add TRNG handling for protected guests
config: arm64-randconfig-r134-20260205 (https://download.01.org/0day-ci/archive/20260206/202602061656.HTIBEG7j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061656.HTIBEG7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061656.HTIBEG7j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/pkvm.c:248:1: sparse: sparse: symbol 'vm_table_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1906:40: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1907:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1908:34: sparse: sparse: cast to restricted __le32
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1909:34: sparse: sparse: cast to restricted __le32

vim +1906 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1879	
  1880	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1881	{
  1882		u32 fn;
  1883		u64 ret = SMCCC_RET_NOT_SUPPORTED;
  1884		const uuid_t *uuid;
  1885	
  1886		fn = smccc_get_function(vcpu);
  1887		uuid = module_get_guest_trng_uuid();
  1888		if (!uuid)
  1889			return false;
  1890	
  1891		switch (fn) {
  1892		case ARM_SMCCC_TRNG_VERSION:
  1893			ret = ARM_SMCCC_TRNG_VER_1_0;
  1894			break;
  1895		case ARM_SMCCC_TRNG_FEATURES:
  1896			switch (smccc_get_arg1(vcpu)) {
  1897			case ARM_SMCCC_TRNG_VERSION:
  1898			case ARM_SMCCC_TRNG_FEATURES:
  1899			case ARM_SMCCC_TRNG_GET_UUID:
  1900			case ARM_SMCCC_TRNG_RND64:
  1901				ret = SMCCC_RET_SUCCESS;
  1902				break;
  1903			}
  1904			break;
  1905		case ARM_SMCCC_TRNG_GET_UUID:
> 1906			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
  1907					 le32_to_cpu(((u32 *)uuid->b)[1]),
  1908					 le32_to_cpu(((u32 *)uuid->b)[2]),
  1909					 le32_to_cpu(((u32 *)uuid->b)[3]));
  1910			return true;
  1911		case ARM_SMCCC_TRNG_RND64:
  1912			return module_handle_guest_trng_rng(vcpu);
  1913		default:
  1914			return false;
  1915		}
  1916	
  1917		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1918		return true;
  1919	}
  1920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
