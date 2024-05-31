Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FC1CA89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181253; cv=none; b=m1OmVNu8FxH+Vh7fxbR+6Zewdj1TEca6GHXOajxG8jBDqrIEOieDQSaF+c3+D40KrfALApXiQiqfGsOCzt/POYr0qpzPzdnF+g9HR+UGXH1269npIVWiB9Ol+zwCvouI8kasNcbCAQFwwioyFbrOipvdqoYp1Eh4iog6lIq0I7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181253; c=relaxed/simple;
	bh=MfUexiyLJUvUGPbpZloGZBWXo+IozbVhfmq325rKU60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkHQi/6OO/m+Nk4l6QyiYOIJAanzjYmGghbZ3cxYj5k8LuG5Nf09/vtDIVRIkzujs5wZFgn3TL4dgRISe2Icp8qkWMSmA8EuDklfBR+YBnFQKKZQEsjNVWE7TTOCWnRbTVoUeUh/FvjPnzWzzCRrzEjsj9Ef0LglecUrjcJvkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY/zTlGU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY/zTlGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717181252; x=1748717252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfUexiyLJUvUGPbpZloGZBWXo+IozbVhfmq325rKU60=;
  b=NY/zTlGUFPhyqX7RLERkL+tq/5j1EFQDlYrjgHFz6uLIJ3k5crjuShD5
   8y6nEWKePw2GSZ3NxQe1Q1KIex+A/7mGxIq7XGskI40GnQ7FGuU3E1JLt
   GeMDc0C7cKlIygt0E+KeLAR2+RyRs3fFKJYaSvczSh/Gco9LgqjdCw5fB
   YERxAipsgRwFZxuVeiFAD9azJ0D+pGTvh2aZwmnUn2Jm4/FulRTgLts/p
   tLWx11esRGrw9ApigtdmBBY/VmtQqzgppz/Hk/G+Axl+kBstwe/ayW+RF
   cezzEsLgmL+nLg95WpyHRcHdOSPiZLptks3DqTZI6SyJjumWu1iui29Ww
   g==;
X-CSE-ConnectionGUID: WG19YtvrT6q+t6P2ZDrLDw==
X-CSE-MsgGUID: nR3XoSbRQnKZng2ast4S5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13587613"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13587613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:47:32 -0700
X-CSE-ConnectionGUID: x8kpRNgqQhKXqIeyT6Clog==
X-CSE-MsgGUID: MFa1XXzbTvieeA5ApkL8BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36189606"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 11:47:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD7HV-000HfX-0B;
	Fri, 31 May 2024 18:47:21 +0000
Date: Sat, 1 Jun 2024 02:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:24: error: implicit declaration of function
 'tdx_gmem_private_max_mapping_level'; did you mean
 'vt_gmem_private_max_mapping_level'?
Message-ID: <202406010214.TVKMj4UN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-05-30
head:   538d25a4d08a3dc487fc9be78bef09105ef54e27
commit: a3c36efd448bd3b25ee0cf2672f177ff603a6be6 [59/115] KVM: TDX: TDP MMU TDX support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240601/202406010214.TVKMj4UN-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010214.TVKMj4UN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010214.TVKMj4UN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/main.c: In function 'vt_gmem_private_max_mapping_level':
>> arch/x86/kvm/vmx/main.c:224:24: error: implicit declaration of function 'tdx_gmem_private_max_mapping_level'; did you mean 'vt_gmem_private_max_mapping_level'? [-Werror=implicit-function-declaration]
     224 |                 return tdx_gmem_private_max_mapping_level(kvm, pfn);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        vt_gmem_private_max_mapping_level
   cc1: some warnings being treated as errors


vim +224 arch/x86/kvm/vmx/main.c

   220	
   221	static int vt_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
   222	{
   223		if (is_td(kvm))
 > 224			return tdx_gmem_private_max_mapping_level(kvm, pfn);
   225	
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
