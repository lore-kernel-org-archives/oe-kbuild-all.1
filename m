Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E2182A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980730; cv=none; b=sOZjKVJVmTzyyVuhm4pimt6rO6yhE1hKk8nqUbVCbtFA+PUOZY6acVScbTdvndb7Bo2XhkpVQRWsMYZPBMe2nmgQxrMi+dkALoSsAHl5MHqFvPyZzSg0eoW//OyJ4qXEKlewDvV/wErBtD+5HMHF1oDRBs12CN0PRPQNuLg4ihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980730; c=relaxed/simple;
	bh=WiGC4Z/5gs62RXHVO8Ngb2UW9RrCA+33UdLGD6ZeTc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jPMOdNT8mT3loZIM+9aMNitxd94dzcoozvp0q13s1z4WL9DcQp4G6LjQZS5GeIqfQQvqtl+aE1UVzkyP0O6GbaEgjhwCRyZGKn4IOienv7WZFw2aE2Ublrz2EPHYWiIu7jhmgL5tNmDCvz/x3utY26gaT+JLubAWjF5bcXLwSNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6GrYiw5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6GrYiw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727980728; x=1759516728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiGC4Z/5gs62RXHVO8Ngb2UW9RrCA+33UdLGD6ZeTc0=;
  b=n6GrYiw5109b8cV16NLtk6jq1viCMSWAVaXsauqIOgSxIC9cdE2m4ieV
   2yLY/7XY+n9h6AMbL97Ud1z7xrkCTgr7SOSCxr8UmRgWtuI0xkEUcagvo
   yrzPVPaSkx90frZACZeDI5Z1A55wnl+PeZdzR6IYAJEcgP+KrcBOqUeaH
   PUPEuL/dxkj/doOhQOQ7p4KzOrFzRnR+35zfkc0Fr2MvP2PR+H5mE+fX5
   1nCT+nNltdkMfN82uw881C3HOCjTn3UDMqHxea/pRSMRzSfJYgIQBlNGI
   dDLEBTyW0bi9UydH3T4LXmqY31UIJcsFE2JRHEtJAmhtp++x3Yv2y9Wae
   Q==;
X-CSE-ConnectionGUID: +/sfJY2JQ5eQizGDSN5MKA==
X-CSE-MsgGUID: 4BcX5DN7QNqdxie4Yo5Fbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44723896"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="44723896"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:38:48 -0700
X-CSE-ConnectionGUID: hNOBqz6sS4O3fGno0xoMsw==
X-CSE-MsgGUID: O96i0a1ORBS/zxR88JbTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111909311"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 11:38:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swQiq-0000mi-0J;
	Thu, 03 Oct 2024 18:38:44 +0000
Date: Fri, 4 Oct 2024 02:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-10-01 26/29] drivers/cxl/core/mbox.c:1794:
 warning: expecting prototype for cxl_process_extent_list(). Prototype was
 for CXL_READ_EXTENT_LIST_RETRY() instead
Message-ID: <202410040241.IYLrQyYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-10-01
head:   c240cf80afe13145f312562d144a7a60314806b0
commit: 049b4714fd94c3cfcca726f451861f05b3fe113c [26/29] cxl/region: Read existing extents on region creation
config: microblaze-randconfig-r072-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040241.IYLrQyYZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040241.IYLrQyYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040241.IYLrQyYZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1794: warning: expecting prototype for cxl_process_extent_list(). Prototype was for CXL_READ_EXTENT_LIST_RETRY() instead


vim +1794 drivers/cxl/core/mbox.c

  1783	
  1784	/**
  1785	 * cxl_process_extent_list() - Read existing extents
  1786	 * @cxled: Endpoint decoder which is part of a region
  1787	 *
  1788	 * Issue the Get Dynamic Capacity Extent List command to the device
  1789	 * and add existing extents if found.
  1790	 *
  1791	 * A retry of 10 is somewhat arbitrary, however, extent changes should be
  1792	 * relatively rare while bringing up a region.  So 10 should be plenty.
  1793	 */
> 1794	#define CXL_READ_EXTENT_LIST_RETRY 10
  1795	void cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
  1796	{
  1797		int retry = CXL_READ_EXTENT_LIST_RETRY;
  1798		int rc;
  1799	
  1800		do {
  1801			rc = __cxl_process_extent_list(cxled);
  1802		} while (rc == -EAGAIN && retry--);
  1803	}
  1804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
