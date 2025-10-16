Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E9334693
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760635481; cv=none; b=jYBRhz5LoCEvfsIaoh51FsBn9yM9maGrBMDyLqO6vwu1WqkTxoAt6h3zIc5LmxjqYGwGaR0X/LMpuohMrknSfQvQEk/tvMFne7YHhaM9b+g6n6NOrSrjw6jbXAup4hnp1ktHTMBuLklvLmzGctZwAbxAyHiNIRaXT1gHQjcm8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760635481; c=relaxed/simple;
	bh=jvtGxMYeejgIKcUGHnBqZMlBqTBjn5t4mivxqV78X5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUmsF8UGzxDTYhZfBpm7RCowCC+6akD/sN4z1BbMNif7KyPhwmMt0a/uvr6abVwaUecqeEfkbmKcnKhHstE2/cpeBF4PzZyDHR9/4EeAeZb+tUcHbbm5uw9ELxwVOG0lzgCwL1v+T6r8d6HE7C/JcMfZLTReEENtLy0RXYDoDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyMQuZkv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyMQuZkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760635480; x=1792171480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvtGxMYeejgIKcUGHnBqZMlBqTBjn5t4mivxqV78X5g=;
  b=RyMQuZkvouzfgINMciQvt0JZuvZ10aK3hJKW0zh/yV1/okKPnVqdUXZQ
   lopQddTygbnkBZMSLcqxALslynoJpcDYC71l/47QGC4xJvTpb812z8Oyd
   AC8F2vqShaabQuTn5X9mNRJ6jjYoINHUAnYGWuJ2v5Ga72+8Ro1WiQA4G
   EYahAgUfd4DAfcKyMsIu3H+vkcEMQ3e9XMGGGKPPkLCNI8LBNeGgz8bjs
   2O/Fn73Q/f15JQPTojCNuaaUvE9hTAoLxOniSZEVzVKy88gsxHpNdrNNG
   a7bijhAfJXxVH7KqNwZhRwu6zmOXj9cx87ekbfXI0EBlKHmlFZs5RBLN0
   A==;
X-CSE-ConnectionGUID: C8hpnY+oSIG+Op2gtSYZvQ==
X-CSE-MsgGUID: 7/rNzproSVOLIc8rWZElDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62747612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62747612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 10:24:40 -0700
X-CSE-ConnectionGUID: uP8RQ1y2SfyiXaIYYtqnVA==
X-CSE-MsgGUID: t6TNqMLcSvKjHANS02Qvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213098460"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Oct 2025 10:24:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9RiN-00055v-2e;
	Thu, 16 Oct 2025 17:24:35 +0000
Date: Fri, 17 Oct 2025 01:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976]
 include/linux/virtcca_cvm_domain.h:69:51: warning: declaration of 'struct
 pci_dev' will not be visible outside of this function
Message-ID: <202510170107.BBlmteyz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yxk,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65461ffb14372269f333f0e18867775c14741e76
commit: c5161d7e11a7e30755b2ec55aaebfd500193cbbc [2976/2976] virtCCA supports SR-IOV in CoDA scenarios.
config: x86_64-buildonly-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251017/202510170107.BBlmteyz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170107.BBlmteyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170107.BBlmteyz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/sched.c:24:
>> include/linux/virtcca_cvm_domain.h:69:51: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
      69 | static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
         |                                                   ^
   1 warning generated.


vim +69 include/linux/virtcca_cvm_domain.h

    68	
  > 69	static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
    70	{
    71		return 0;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
