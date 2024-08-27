Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554812C475
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800464; cv=none; b=QXK0pNs6yjHip4U5KSA6Gm9Az2wGKpjPMk8iDijlNqUe60tvfp7QCeWtMbtzpjqNgJO7zsZBoLk5wThKr0wus+MuaNe8OPDA/jaVeyw4uomvoAVT2oOvQHotfrs+dq5YcBYX4vQwVoDJCwBdjRnCZUWFRUZClwhR5sjQYf4fGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800464; c=relaxed/simple;
	bh=GMqw17wL/izMKjXvNQ7IzG9lohB6pm4k0qMlwLUZH9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eysUwXgrKx3OYfjENoRL0uoghNSPAaoLNic9I7xWQ6tvx292ktjJoYvsDvb210rzr4jQggxt7u7gjh9V1b1S1Ua8H3TYINN5legJAxhfSfxsCtwNqd1szWTqJA2rRxggicvW1gyQEuEDJV1rkmloejOj2lowC/xeFjzE8YYft2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay82lU97; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay82lU97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724800462; x=1756336462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GMqw17wL/izMKjXvNQ7IzG9lohB6pm4k0qMlwLUZH9M=;
  b=Ay82lU97viiompvu+ywYQ3Ma3ejflu6oU0lYJyQHty8E9SmvO8MibpM9
   3SApEUGlom99n40iObED2Ko8GoIsoQadt5/Kj2IluAeaoGrz7D1XjyzGK
   Ols+KlK6WR4VpxlwKJUAui4ic9zISKqbrcfoFRFuL6XNjbovzniTQF1S4
   0YX5q0UDpMr38mQf86S5af1TmrXYQthJUwbNwPCZWNvPFzkt1bZcoEWwb
   N0P0LvVQI9PAxx4/OIvU/Coc1FHu5rwhVDs5MthPRSOzU3+4MkQbERoRl
   97esf07l0lcLENJ/FA/ZkAQOeUU+oiVhS3N2EpmdBfvXNIb/ZKWyyS6I4
   w==;
X-CSE-ConnectionGUID: d97lGIVITQSFOJalL4F8iQ==
X-CSE-MsgGUID: oSd55VKFQeus2hXVcM5fDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27100621"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="27100621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 16:14:21 -0700
X-CSE-ConnectionGUID: SLGOulh4RRGfHV8ZuDCFMg==
X-CSE-MsgGUID: VT61x3gsQBeEeK1BKpukuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="100545290"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Aug 2024 16:14:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj5OE-000KBC-1D;
	Tue, 27 Aug 2024 23:14:18 +0000
Date: Wed, 28 Aug 2024 07:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26549/30000] kernel/static_call_inline.c:458:5:
 warning: no previous prototype for 'klp_static_call_register'
Message-ID: <202408280714.V3WjAG3t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b32a887db4e5c4c061e61977efabbc1d5e867aa7
commit: 581f41f797bd88092689c43c47ee06a8ab2eec7f [26549/30000] static_call: Don't make __static_call_return0 static
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240828/202408280714.V3WjAG3t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280714.V3WjAG3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280714.V3WjAG3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/static_call_inline.c:458:5: warning: no previous prototype for 'klp_static_call_register' [-Wmissing-prototypes]
     458 | int klp_static_call_register(struct module *mod)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/klp_static_call_register +458 kernel/static_call_inline.c

   457	
 > 458	int klp_static_call_register(struct module *mod)
   459	{
   460		int ret;
   461	
   462		ret = static_call_module_notify(&static_call_module_nb, MODULE_STATE_COMING, mod);
   463		return notifier_to_errno(ret);
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
