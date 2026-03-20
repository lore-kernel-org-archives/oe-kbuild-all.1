Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211F12E1DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000833; cv=none; b=i813xX7/hzfVaquwBMCJtcF+rx7JvnarZ+KaLVhh9DVeqXTX+CIfeJxSfbIQfZmjoAfu5FyTNncAcXq/9lZViptOUj4KViOqTIOPVIXWxGqePIiOCtqSE7iwzCgv8uKPYETAT0lhi7WrId4VPDCEb7JJg4DOLI0P20mcSpPRbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000833; c=relaxed/simple;
	bh=Bg5bYBOo468/O6H6bc4bmB07Sn/UCpQu1a8CCcSJe/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LCZ408sAdTxzPDjJPPW6FwxDznNQNR/GNbURqK1cffcAm3ufD3JPEoXmTJRk1G+cI8OszySzaUYYzvDyajrryhePg+cvhFzsOLu12FxUpNfYbB3pynzA7ExkpJyR3xrn7uX0Y03jnlKRCMGI2leRRbJdGSsyJGIisMG3YI004d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxgwt6IV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxgwt6IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774000832; x=1805536832;
  h=date:from:to:cc:subject:message-id;
  bh=Bg5bYBOo468/O6H6bc4bmB07Sn/UCpQu1a8CCcSJe/s=;
  b=nxgwt6IVs382Efm3dxZNmTEK0P/b98FknifVKEgKadeOOECxRe39y7ED
   GPynl8eJfaTZIxW0U6DNarrkcJ+V79c42d5LtfIPGLrREC6+slTj3v+6X
   BnMsdBVgK0vKi++tPbobQj0JhgSQ8hjwGKkTyWWDfHdqr2IOi0p8XCB15
   zcCefS/XOBHRgCkCth8hOjvM8ehAtN0V1iR3oSuXgu91tPQutsuoeDfM6
   ygc8O8y11/GetsHnEsk7R9Q17v7NOQn0qD1BNL5zTWqIe/5rqIWfyVhGX
   +EPTx0eT3nF2pRO3iQXRo0yBGLzHPAxmLbC1wcBKs9qRBvNS5DI83IM3X
   g==;
X-CSE-ConnectionGUID: gc+jSWQhRheBy95MTDOKHg==
X-CSE-MsgGUID: bZNIumacRKyEUe/cKLAWlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86559249"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86559249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:00:31 -0700
X-CSE-ConnectionGUID: VxP49kE7QPWFg82tju1okg==
X-CSE-MsgGUID: wQhQTY/4TUipnO/GgAExww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223224971"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 03:00:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Wea-0000000050j-0rYw;
	Fri, 20 Mar 2026 10:00:28 +0000
Date: Fri, 20 Mar 2026 11:00:26 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 357/357]
 iommufd_utils.h:804:37: warning: array subscript 'struct
 iommu_test_hw_info[0]' is partly outside array bounds of 'struct
 iommu_test_hw_info_buffer_smaller[1]'
Message-ID: <202603201059.0A6p9gOT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   61d924e3c943dec5a1544973025226b69d3e9ae4
commit: 1bd6721c42a736a9452095171f28e724cd531c6b [357/357] iommufd: Extend IOMMU_GET_HW_INFO to report PASID capability
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260320/202603201059.0A6p9gOT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201059.0A6p9gOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201059.0A6p9gOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from iommufd_utils.h:11,
                    from iommufd.c:12:
   In function '_test_cmd_get_hw_info',
       inlined from 'iommufd_ioas_get_hw_info' at iommufd.c:779:3,
       inlined from 'wrapper_iommufd_ioas_get_hw_info' at iommufd.c:752:1:
>> iommufd_utils.h:804:37: warning: array subscript 'struct iommu_test_hw_info[0]' is partly outside array bounds of 'struct iommu_test_hw_info_buffer_smaller[1]' [-Warray-bounds=]
     804 |                         assert(!info->flags);
         |                                 ~~~~^~~~~~~
   iommufd.c: In function 'wrapper_iommufd_ioas_get_hw_info':
   iommufd.c:761:11: note: object 'buffer_smaller' of size 4
     761 |         } buffer_smaller;
         |           ^~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
