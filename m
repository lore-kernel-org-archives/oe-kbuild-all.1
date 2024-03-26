Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21C129E99
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711432252; cv=none; b=W+GkdNmANKfIgGv3Y58d54nBxnGi2Idw/Ml4fmfsksImNLUat0o+c2y9AEEq5WrUeHnvqVXAsZe1NpZ+wydkBDx5TOz/OVUmo0xVSP5on0CFaoADRC7iNEnyLELQFwrbec43m29fmQI9bNDvqd0hz85N/pHALwiUR3sPqqjl4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711432252; c=relaxed/simple;
	bh=EBE9RKICPZlOvC3SIVaiWVpCaStNsExQ0eZ3p26xvy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCPqNAIAEQBGyUwkCR9rAuxsGv5yr938DY8Ubk2BEMA+skvtwzKYGX/dVOTDWHN8jqMWPaEJzan/aRocYT2y4bPxzrBkjDh+cviHDpFUPu9b6te7AVKMh5fSll7t31I7hD7n1Ewxb7FcJMh68IqEyznBDLamJKa8xmISwjF79p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErG/bavM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErG/bavM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711432251; x=1742968251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBE9RKICPZlOvC3SIVaiWVpCaStNsExQ0eZ3p26xvy8=;
  b=ErG/bavM8nDOl4uBnyynNPeg7uO2Zd7CgeJyiZRLZtSiLph7skcCtbNb
   ddHhgW/8UC9bPAZB0FI2+1iApCIWTKe3avzovGf/knAY49Tmrre0bAU4K
   qe+bvFx2ZwrfeRvvD2L62/wZ3+lV/NASqgoeewV4vdwi068XzJUFogKzb
   IqCOOFu/n2GWYfGixnyDka3Qj40k8+5vXGFAaG3kxcUtGANDdk3mbei7N
   Z4ZUjCBtDPCjLNoeYLnAwu505MxfOgayhkuvPa8buqZ1Iax2x01q3Cp5O
   VsSOY7GkF3NHF7cd/Aro9S38zVRhaXKfofQNI8HubN8rBojTTCC3+GriK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6329068"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6329068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 22:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="53314336"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2024 22:50:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rozhu-000N9W-2l;
	Tue, 26 Mar 2024 05:50:46 +0000
Date: Tue, 26 Mar 2024 13:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bp:rc1-snp 4/5] arch/x86/coco/core.c:22:3: sparse: sparse: symbol
 'cc_flags' was not declared. Should it be static?
Message-ID: <202403261310.vQmXYKzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git rc1-snp
head:   e4ebc402b2c134524c0f8564a385e6f6613ad34e
commit: 8ea03a1dd663ccedd7e684e01061452f29826514 [4/5] x86/cc: Add cc_platform_set/_clear() helpers
config: x86_64-randconfig-123-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261310.vQmXYKzL-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261310.vQmXYKzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261310.vQmXYKzL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/coco/core.c:22:3: sparse: sparse: symbol 'cc_flags' was not declared. Should it be static?

vim +/cc_flags +22 arch/x86/coco/core.c

    18	
    19	struct cc_attr_flags {
    20		__u64 host_sev_snp	: 1,
    21		      __resv		: 63;
  > 22	} cc_flags;
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
