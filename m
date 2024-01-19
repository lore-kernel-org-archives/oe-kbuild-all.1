Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC0338E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705705581; cv=none; b=fNwAH8O50+95lr+j1bQB7s705Bhm52MHQmCpkItcF/iS/yt34e1w2qYUPUnC22EZ1raDast6A6mWpkENW2N/JcyOVp465wjuELiqihNuofi1jEgCEiomwMcHU69kS7WSRxBdTiqVV1FgaxxcOM8RnGwDUsGsU/H8I3x8vQejrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705705581; c=relaxed/simple;
	bh=RBdAFe5joGfbUFqJiRa/X0hT6wrpahk73bwI9Y3hyZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CK+37+cKGteqopdd2vgrg7cFHuZDyxRoCzR6+FiWbR0pX80WlCAts8ZDFCbycVhAYCnuSL7+/PHX5O9DYU0h41eN90wkLNm+GDlSGCRzB4qfDdXJYhpuvUfAP4usSk6VeO5iSMrL48raQ/4g6R7ZUSVbpf8cCxXAmhoyjiUl30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efZDdLmu; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efZDdLmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705705579; x=1737241579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBdAFe5joGfbUFqJiRa/X0hT6wrpahk73bwI9Y3hyZI=;
  b=efZDdLmuFuQVM/dTIqvN3H7UXzQ3CpwgWpdDqjIn1P/1ntr9cYRbRkA4
   BjXZ6iTliDBzcpxIQ9wAH+9nV6+ralycGqYHOMwKyvXraRIqoMIhFmWeH
   o3BGeLG/+VpYnucC7oDKljCUYcNNmgSitqtFuQmpgs3OMMNdm/WNhfvm2
   N7WAvctcFXmDweLTNEDxuvnfNhD9Q46qBpWzG2Gd3AQk8JPfSc6UXb/Tk
   TG4oYvd0HkizUmHHcOwcX1YnhwiDR9kEJFal/cveH5n5MLFLslnEEIDyI
   53FR2qSDXLpN8NiJJO/ErXhdvrCehhDSpvxbYUPIqy5veUWzMxJNzCOkz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467234109"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="467234109"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 15:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904272777"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="904272777"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2024 15:06:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQxwF-0004UW-0Z;
	Fri, 19 Jan 2024 23:06:15 +0000
Date: Sat, 20 Jan 2024 07:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Huang, Ying" <ying.huang@intel.com>
Subject: [djiang:cxl-hmem-report 12/13] drivers/cxl/core/cdat.c:627:16:
 error: implicit declaration of function 'hmat_update_target_coordinates';
 did you mean 'cxl_update_hmat_access_coordinates'?
Message-ID: <202401200618.ADsYOGpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   b720bb8edd5a52abe7d5c888245352e3dbaefdb1
commit: b278f4f522cb92b95bad61cbd30324f94eaf778c [12/13] cxl: Add memory hotplug notifier for cxl region
config: arm-randconfig-001-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200618.ADsYOGpc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200618.ADsYOGpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200618.ADsYOGpc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/cdat.c: In function 'cxl_update_hmat_access_coordinates':
>> drivers/cxl/core/cdat.c:627:16: error: implicit declaration of function 'hmat_update_target_coordinates'; did you mean 'cxl_update_hmat_access_coordinates'? [-Werror=implicit-function-declaration]
     627 |         return hmat_update_target_coordinates(nid, &cxlr->coord[access], access);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                cxl_update_hmat_access_coordinates
   cc1: some warnings being treated as errors


vim +627 drivers/cxl/core/cdat.c

   623	
   624	int cxl_update_hmat_access_coordinates(int nid, struct cxl_region *cxlr,
   625					       enum access_coordinate_class access)
   626	{
 > 627		return hmat_update_target_coordinates(nid, &cxlr->coord[access], access);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
