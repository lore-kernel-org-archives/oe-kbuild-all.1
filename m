Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9783E462
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710324108; cv=none; b=nLJbyPaEhzyxRnJ8vWX4kxpHw9LWy2MvuEpYXdPq0QMHgxDvkroprPk02nt9NH4YYsMcAvJPEVPFINboYPiCkOJImCh+D9102itYYwkilMNAg1lSKjIgSZmNGrsnCot6uMRTHcAUS1k/le0K+S+DVHodJLfZc4ckMJNsPSwSOiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710324108; c=relaxed/simple;
	bh=XOEZ6S5rWBNq4mZVob49zIlXMEKdcXsuOnpwub2oz5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1XOCbLdAaphRIjrtmjoHw4nfSKA6YQ8Uo1kGiDDEuJQXxsgVdBKHmamh/7rOcypSPSFj5eKF/5rN8I3TcufCWNq12laP/j9BYcu0kTHDR9oEfiBnBydCGrufpK8goR78+nDYc7RtG8vhAtuhDZgbV/W1EeSj9DA2iO4T62Iv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzmxbXfc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzmxbXfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710324106; x=1741860106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOEZ6S5rWBNq4mZVob49zIlXMEKdcXsuOnpwub2oz5A=;
  b=YzmxbXfcpP7f8fOhtS9Q7QWUSHlfdTisV380GPh1gq5AqnowkQf0lsUc
   sQqnMgDtb76CahL4ltiFJl0GIO2V3WnNeH5bG2BamNaTOLq9oz1E/gaaz
   0b0K3ByucKeF17nHkg8nQR+TZKPEfrImtYGTJz6GDarRcfUurqJlXDOY9
   LNfJI0VmOtxjDg4/tZi7Jhw6Ep3pkJm0JchddXyKwzKzvfrGjWRfrgD0w
   rO6pgh9qgeEn7Hzs05U4HFfKzcFNkBxtbbP5S4jpEakGHay3TJBUcpzjK
   VVRlt4Eg55S0PUh2nCloVBln28SqFyXhV5rd5DoSgEIYyqXATQ+8b9Ixz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5207841"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5207841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 03:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11900226"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Mar 2024 03:01:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkLQb-000CG7-2T;
	Wed, 13 Mar 2024 10:01:41 +0000
Date: Wed, 13 Mar 2024 18:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 16/26] drivers/cxl/core/extent.c:63:26:
 sparse: sparse: symbol 'dr_extent_type' was not declared. Should it be
 static?
Message-ID: <202403131750.pRpFmAB3-lkp@intel.com>
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
commit: 97067e939cce8e446d11828a50c70fac70baf06c [16/26] cxl/extent: Realize extent devices
config: i386-randconfig-063-20240311 (https://download.01.org/0day-ci/archive/20240313/202403131750.pRpFmAB3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131750.pRpFmAB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131750.pRpFmAB3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/extent.c:63:26: sparse: sparse: symbol 'dr_extent_type' was not declared. Should it be static?

vim +/dr_extent_type +63 drivers/cxl/core/extent.c

    62	
  > 63	const struct device_type dr_extent_type = {
    64		.name = "extent",
    65		.release = dr_extent_release,
    66		.groups = dr_extent_attribute_groups,
    67	};
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
