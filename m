Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2517565
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660937; cv=none; b=sOETJIXB2bvxWsOhDBJFBeL7EcuSqfcoIRZQvgfdxl2Q44rISCHHaPhzjYdMU+r25mhnYNdD/fzQBOa2w6gjdhA8O5XMEM9bwk81QPmQPOsCQqBd6YvWrGKd5jzS7t6fR83bIqIsND0RbL1+UbOqaI/5WdVN4TAXu2Lvi5E2BxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660937; c=relaxed/simple;
	bh=D3qmUysHobrb1ZLL2KrUfK/52wlpd5598r+H2ZbRmZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNkSH+VY4yuc9gACjplQfYnq64oDdW9OXr9LUP6DbmMwznVsAXeVWEhJaTysR7vL9F6XcViTn97Uq16fLk4cnY8ylm5uWUJNdyk6HeTEV8mcyQk9GLfx7QusTeo2ALNJhMW/AttoajJQG6AHs0/9DiLue9MrLggZRxd17JV00T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6ODHlOu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6ODHlOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709660935; x=1741196935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3qmUysHobrb1ZLL2KrUfK/52wlpd5598r+H2ZbRmZM=;
  b=W6ODHlOuBOCKO7P+R+RxoCFdayblzytElPCR67y7bd/iTZoMlyVEyRqW
   YnpKKf7Rtmmc3UvE4iSEyVKDVfw5b/gzAh1+DQcduQt2ClReYhDQHcqSp
   7HPfyP7w4hV6NozBHfHec8i8efcHXdtiXsf47G63dL3qCdB+CERh66Yed
   T9wv4x3v7gfe8egME8HagPhRDRuoyWolTwPNoSzciEpQLvhTfm19zartp
   gfgnE29BWJONMBWzAxqXmDF71gDPbwS3YOTAFHnIYilKCsizxXh5ZhI4g
   rd/2VIGwADF97MUdZD/uyc5xG0MnTDTnEiSIoCfG7rGW9dIuFT/qhFVX/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21690120"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="21690120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 09:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14024790"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 09:48:54 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhYuJ-0003X6-1Z;
	Tue, 05 Mar 2024 17:48:51 +0000
Date: Wed, 6 Mar 2024 01:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3166/3862]
 __kvm_nvhe_mem_protect.c:(.hyp.text+0x6ff8): dangerous relocation:
 unsupported relocation
Message-ID: <202403060152.uNHb0jNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f44547cb66ee30ed552adb15046a912cd1409c1f
commit: 625086f87673687dc420e79c9fedff0c2d65cb49 [3166/3862] KVM: arm64: Add support for probing Hisi ncsnp capability
config: arm64-randconfig-004-20240305 (https://download.01.org/0day-ci/archive/20240306/202403060152.uNHb0jNS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060152.uNHb0jNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060152.uNHb0jNS-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_clean_dcache_guest_page':
   __kvm_nvhe_mem_protect.c:(.hyp.text+0x6ff8): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__kvm_nvhe_kvm_ncsnp_support' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> __kvm_nvhe_mem_protect.c:(.hyp.text+0x6ff8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: __kvm_nvhe_mem_protect.c:(.hyp.text+0x6ffc): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_kvm_pgtable_stage2_flush':
>> (.hyp.text+0x122cc): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__kvm_nvhe_kvm_ncsnp_support' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> (.hyp.text+0x122cc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: (.hyp.text+0x122d8): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
