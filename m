Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC407F7CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710267917; cv=none; b=Dxx98m290xTX9SAvUMQta5XVcCOEFgiHq4EBiOrM+xXzg6vnMy5TInT2i9WVD7q582gaZk3G0tmzfssnm2QHzuS+tY5W0yclQqZ9pQKm6qKTq9SiRXQY3gIA5izxpY1nl3ylo2t3UQ9oxIi+cLBwo48ksifLseeCSDgIGeaph/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710267917; c=relaxed/simple;
	bh=yA4d2n1wgEmUPMF32xooEGlKfIoHo7pht3j5kj58JVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avwkv6xWwQJNwc1QNZQNcOTF7g2KnXimyzBSbAdclb5hhZOeLDx3LiIMLFHJaLi6kinV0ilHPxSbTq85L7Hw03S+aZ+JpPBBrwfbyFeAB5mJrWlrpnydeGKmcobotl3kLkdgg2ldxE55PN0wTO7fOWybZtu26tgbQieTjeVdvLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsyYtYQ0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsyYtYQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710267913; x=1741803913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yA4d2n1wgEmUPMF32xooEGlKfIoHo7pht3j5kj58JVw=;
  b=SsyYtYQ027J3XZQhqCVVS5xozpe0vKtdwjYhINCyVfb/AosApt4/EWrO
   CFrN/oIwHgM0t0kTbNotKx810aKsJsPcONazxsrB4NATNRKWWiQCDxTsB
   ptjplMqUclIr6rusjVI4f+7W0FLzgwerKXsP2Ml0zN+BrCgySqn6ycQD2
   GkMc5cwWlHkfemUqbekTk/E2cICr/evGv71ZA87nYTZtMLwDf4pln9ZMv
   5dRkelQvjwKL6oRsMXAt8m91bMeIz7ZvWJ0yj4wsti3GuuM/FDz3mphST
   Grhhr/0ind5vZVihd/nXVSbywRrQBI6gMoWjDoL5vEfuPT12TTFfL21n5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16137539"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16137539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 11:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42630273"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2024 11:25:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk6oG-000BML-2F;
	Tue, 12 Mar 2024 18:25:08 +0000
Date: Wed, 13 Mar 2024 02:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 9/26] drivers/cxl/core/memdev.c:113:25:
 sparse: sparse: symbol 'dev_attr_region_count' was not declared. Should it
 be static?
Message-ID: <202403130218.eByjsHqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-10
head:   0dd99bd79b33de8f6e293c9a2373ca321dad33c7
commit: f649c5634f5047959eb0cffe61c7cec9075a5d61 [9/26] cxl/mem: Expose device dynamic capacity capabilities
config: i386-randconfig-063-20240311 (https://download.01.org/0day-ci/archive/20240313/202403130218.eByjsHqZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130218.eByjsHqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130218.eByjsHqZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/memdev.c:113:25: sparse: sparse: symbol 'dev_attr_region_count' was not declared. Should it be static?

vim +/dev_attr_region_count +113 drivers/cxl/core/memdev.c

   112	
 > 113	struct device_attribute dev_attr_region_count =
   114		__ATTR(region_count, 0444, region_count_show, NULL);
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
