Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61DC1DE2DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666420; cv=none; b=Ks85s7W9mgB7VduecccDccxVz6Jvb0l3P1LHNa+huBPHXgCvi8Np0oLDn2FWdbNn5MJcqRx44jfCydfQvvSc1us4UOognkn0Nwijw+QsXxjD5tB3x1mo92Bb40+i26NptWPGP8lkeki5BoZvZtMgqNRRbnCNFURT3QGU0Zf+ycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666420; c=relaxed/simple;
	bh=1Qfl53dLX7zdJ/z9SArsIaXIovUiA5rLdFmxvGpol3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UX9D6Nbz1fhqLQCSX5QMErLjlScZmtr8ei1sNiB+l7/kqxa21nTnpDT3OCVDJXgKPVEodsOsQl2GVnInHRpc0wbfz/gl13EtCpgcpJWAV3MqFCHhivU2MVkQQQCKaYC31ekR72hqK84a2uV/gpyPzsSjgQzYdaIumZFqDwJ4NGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BduyaNs3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BduyaNs3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747666419; x=1779202419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Qfl53dLX7zdJ/z9SArsIaXIovUiA5rLdFmxvGpol3c=;
  b=BduyaNs3hRJEcym5asqclTikQ2PLbwaZjhOaoVTAT3u9BsSrFqHo+5ie
   mAuYLhl95BTxLZQGWv1IH80/7HICk2f9tyWFVPfL70K38sb68HfuDov8u
   IsHxlBsSRG2IBKNy76k/xFEy6niNKF6D2XgUwplHDso1Vhl8korp5CXmy
   40btGLonsG0dKANC745zrpjvjyhV3smcHRJ8iBiSkjDl6mlrzdX6iso88
   p/AwQhh7Vp2pbvaKgfxkKPo2nKRFjduX+xUCqC3w8SRw22vkhsck2CDtg
   QaWkhoejokzZRC9oVZwP6+oTydVeLKqiHjo+ViRvOtMZ6NLAmbKAur3x9
   g==;
X-CSE-ConnectionGUID: /Jn+3JzbSOKwKgVZbvmUcA==
X-CSE-MsgGUID: hMk35hZ3Svik+unUi/RDSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49444580"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49444580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:53:38 -0700
X-CSE-ConnectionGUID: nfc0G+I2S5S9wzXp9sSPKw==
X-CSE-MsgGUID: lqcCvFJ7RfeEHadwtHBpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176500799"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 07:53:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1ry-000Lb8-1s;
	Mon, 19 May 2025 14:53:34 +0000
Date: Mon, 19 May 2025 22:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 52/75] kismet: WARNING: unmet direct
 dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP when selected by
 GUESTMEM_HUGETLB
Message-ID: <202505192239.lmyltpWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 4f9ec797adddb85edd77bc785348b440d8025dc9 [52/75] mm: guestmem_hugetlb: Wrap HugeTLB as an allocator for guest_memfd
config: alpha-kismet-CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP-CONFIG_GUESTMEM_HUGETLB-0-0 (https://download.01.org/0day-ci/archive/20250519/202505192239.lmyltpWw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250519/202505192239.lmyltpWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192239.lmyltpWw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP when selected by GUESTMEM_HUGETLB
   WARNING: unmet direct dependencies detected for HUGETLB_PAGE_OPTIMIZE_VMEMMAP
     Depends on [n]: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP [=n] && SPARSEMEM_VMEMMAP [=n]
     Selected by [y]:
     - GUESTMEM_HUGETLB [=y]
   
   WARNING: unmet direct dependencies detected for HUGETLBFS
     Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=n] || BROKEN [=n]) && (SYSFS [=y] || SYSCTL [=n])
     Selected by [y]:
     - GUESTMEM_HUGETLB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
