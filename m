Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EA17A2EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766268050; cv=none; b=coWBW8zP9Kb3SOjIityDUzuoGA4/o/XHzntxpgl+MVjOCBWmWIFgAlAF7PkaNLhHHfFeKBKuqONZqRc9zxX7OQkYMCv6kSyNxT9d+LzxiOKrRpRdvxJh3nCSjA2+YsDhJWAp2vCJdjmt9ygGJCaFnCk6hbXt00j4vRe2w4Rypl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766268050; c=relaxed/simple;
	bh=7r8+sxWQd3HrA0BsQ8ZFXNVgrfZMHRKI8wMCB1RvWAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlMgqISvoLYRzDzzMvsrTLKK2YDgCLt58nyMbRn7fsP66qQVmjZYPQlmJmBZR5zAbzDnGHf17hkkAXd92tZks7SAxQz4v2WTF6qxwlnn0l5n7Z+TUuy1DswyBMYWFnV7kkG7J/UfOS7x2EbBXFYD8SraFudUsCvqgIC0MQXCG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3196v91; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3196v91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766268048; x=1797804048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7r8+sxWQd3HrA0BsQ8ZFXNVgrfZMHRKI8wMCB1RvWAE=;
  b=A3196v91dBbHUKaENNmxy1UGsE4NI5D0HU7a125LySLjS0cFEd0R44e6
   cRjoPqoWVs7uJslwNKwJVwabNUjEmfwWvW1yf/wy6WW1Pm3xjpdBjoZOu
   1fBHNRBXwtRf/lq/19wGva5nk5aIujpG23b+qnsNrjBKRn5DAYxYRUKGV
   /D09ljXV10DgRFeR/R4JKCksnX1mUuPndBem84raI0MSABvCkw4uzfrxl
   Hbs6Ozz3FcRtpClQ5/256EANnt004LwkPeiDThbzD+5k4OYVSzMkN2BOP
   KNR1XGoo1nKuxhwQ98UQviADXgQ5GF8a5SgLyYlPV+l+NS1L9gCxbhLYE
   A==;
X-CSE-ConnectionGUID: M9ZIuxL2Tu2Aaj2/II9+jg==
X-CSE-MsgGUID: /EjkF1FcSomQ8wJO7ISW4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78903570"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78903570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 14:00:47 -0800
X-CSE-ConnectionGUID: 3UrcvTy6S3ynUnhEeO2Sow==
X-CSE-MsgGUID: B7aJSnKTSAKfHzMJOX09sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198922963"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 14:00:46 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX50F-0000000059l-2mIt;
	Sat, 20 Dec 2025 22:00:43 +0000
Date: Sun, 21 Dec 2025 06:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544] arch/arm64/kvm/arm.c:569:5: warning:
 no previous prototype for 'kvm_arch_rec_init'
Message-ID: <202512210513.adq7k77G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: fa36fa3469d2461c1887e823371059401941ae8a [3544/3544] CCA: Fix cca kabi conflict
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251221/202512210513.adq7k77G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210513.adq7k77G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210513.adq7k77G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:569:5: warning: no previous prototype for 'kvm_arch_rec_init' [-Wmissing-prototypes]
     569 | int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
         |     ^~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/arm.c:52:
   arch/arm64/kvm/hisilicon/hisi_virt.h:116:13: warning: 'hisi_ipiv_enable_per_vm' defined but not used [-Wunused-function]
     116 | static void hisi_ipiv_enable_per_vm(struct kvm_vcpu *vcpu) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hisilicon/hisi_virt.h:112:13: warning: 'hisi_ipiv_supported_per_vm' defined but not used [-Wunused-function]
     112 | static bool hisi_ipiv_supported_per_vm(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_rec_init +569 arch/arm64/kvm/arm.c

   568	
 > 569	int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
   570	{
   571		struct realm_rec *rec;
   572	
   573		rec = kzalloc(sizeof(struct realm_rec), GFP_KERNEL_ACCOUNT);
   574		if (!rec)
   575			return -ENOMEM;
   576		rec->mpidr = INVALID_HWID;
   577		vcpu_arch->rec = rec;
   578		return 0;
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
