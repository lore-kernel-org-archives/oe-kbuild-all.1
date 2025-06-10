Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31827AC34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539081; cv=none; b=KsVw15KMgkKPTX3FGOIcZdRfLEHntPNL6dp1oTWGx6hq8kvhH44hgXNj0Sv9M+xNFsl/HSQ0vyqUgJnXee2w4PbszwfFqJoEP54Fw8K2OzcvpSE4wT1Z/xvS8ycrRJzJUPk26mm3PqrvjQr3k49wjsXoD0lJUG3RkeMVLEEXtgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539081; c=relaxed/simple;
	bh=jd61kX+KRNakrslYpRMksDzpvxPPKRScG9zL/DMbkrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsQPiuSOvrqwZXEGZqzoBJDM0Ve6wSgT3hEjOuadMsy6vCRr5jI6D5zb8ZPxNJZQka9ILp5icaAv/8mKeLO+6XAnYPkfdvRy1AGDErJ0gz9F9AIDisvG3oMfWPklIuyT7V0PA2IGftat8igc3gCpY5U0akN7Vj8zQ5jh1R0mjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBAKDlzq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBAKDlzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749539079; x=1781075079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jd61kX+KRNakrslYpRMksDzpvxPPKRScG9zL/DMbkrU=;
  b=XBAKDlzqphgfrXhD05BxHqqudzn3gHVFNrXcc6Td6+fnoWmwmVi/cz1c
   pXqr8U+vBFXH7xmySNVHjka9Qr0lyEqbv/HzG5dUWBKWKOmxjG1hMwn+V
   5N83ETlOT0ziwLDj3WNYtY2Tt9X9R42A1qWfHBSqabcy7IRyw7Y2e4kXu
   bHkxxREKfBjAzMS17p8nLMLf1HflJZT8L5ZeVwuXrpO2XPoc9InF10gkV
   k13WYl67zfajp5w4j0WPx/y2rWJ8qkoRGseWn9ioeBjJelMbbtX8j421k
   JTlWFN/hHmfpd5EuZrwSDypc8aeuUwO0Pa0Lt/QaYbkvDaD/0U9gc7iwq
   A==;
X-CSE-ConnectionGUID: EZ3LgYtBTx6ka7rG3KBLDw==
X-CSE-MsgGUID: Xi+1KzQfSPyizRi9q8KBcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50860227"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50860227"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:04:38 -0700
X-CSE-ConnectionGUID: AKxqpntmS7KpGd2d1b5gcQ==
X-CSE-MsgGUID: cu//+GwVRFqC5jXkPny6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146672030"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2025 00:04:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOt2A-0007uL-2f;
	Tue, 10 Jun 2025 07:04:34 +0000
Date: Tue, 10 Jun 2025 15:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 33/40]
 drivers/iommu/generic_pt/fmt/../pt_common.h:345:20: warning:
 'pt_test_sw_bit_acuire' declared 'static' but never defined
Message-ID: <202506101405.GuSwtNYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   282698ed3a69e2f70fd682b369cf39c972c0bb2b
commit: 7ed632ebae4de991a280472e711b204da244ba74 [33/40] iommupt: Add basic support for SW bits in the page table
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250610/202506101405.GuSwtNYA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101405.GuSwtNYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101405.GuSwtNYA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:37,
                    from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
>> drivers/iommu/generic_pt/fmt/../pt_common.h:345:20: warning: 'pt_test_sw_bit_acuire' declared 'static' but never defined [-Wunused-function]
     345 | static inline bool pt_test_sw_bit_acuire(struct pt_state *pts,
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +345 drivers/iommu/generic_pt/fmt/../pt_common.h

   337	
   338	/**
   339	 * pt_test_sw_bit_acquire() - Read a software bit in an item
   340	 * @pts: Entry to set
   341	 *
   342	 * Software bits are ignored by HW and can be used for any purpose by the
   343	 * software. This does a test bit and acquire operation.
   344	 */
 > 345	static inline bool pt_test_sw_bit_acuire(struct pt_state *pts,
   346						 unsigned int bitnr);
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
