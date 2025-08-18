Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133F2F0680
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507835; cv=none; b=uc/FXJ5zQwqffuKc7jOv3uhJoYo2WZiVkCfmI0O+AqV13CNZmhilQ7fej9eUhd9Qjuo+tzD02U75lgwut/eWjwRlNMKFQPhGTUwSklOl5mYA9EmqpW94ylAoDg3phxpk0+WZeU4jUNWmJkM8GcHuHluWNl0zHj2V4RFZ6diU7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507835; c=relaxed/simple;
	bh=OWOoQF84d3BzRuRCibcndl84kJkaUP1P6k3jTTCNgnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXeJZ6UAvK1vD8MWnNJtvcO/eU1ehZ+jxJamBqAYRwr16hNjxd2Eg/tFiITbJyw3uemZJxQdWvfWXQ5ZprijrRCfIVFaPoDQTwwBxCXc5C+9ChL7ukUtHidWmMgJpPKz1jEIJdzNZYOEof0SqOhUcU8wTg07i2z5O7pwqaxEfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYcreCbE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYcreCbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755507834; x=1787043834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OWOoQF84d3BzRuRCibcndl84kJkaUP1P6k3jTTCNgnQ=;
  b=OYcreCbEgtW1BFxdsZeLg27P5LOVHtF5GHAZBfTqpe19I9M/P9NCr6zT
   YwM9qyx79P7JFYYlYB+HmllAhaqIJFfnT1ypiFgrtEj/PHtuXCBtxkbMn
   TTlBdcX1Pdn2MshNki7qdkr5wTfepBxcpuIzIFdjsHN1q3+shq6eI+Vwd
   h7W8jX8RvLnz2p8KNcH3CiIYO5Bw/awdeZjlkgr+0MMN2YO3xeaq/0Fvw
   N/JCblQAuk5grFYNoJ3ciDuIT4XwDJKJURsBZ+ehTOVtIf9KZ1Za8K2Eu
   lo9D/frR+Gkvez0am3lGRb7dJfQKLeIQTxclUrWlhppw2Z326PKHK8PCe
   w==;
X-CSE-ConnectionGUID: 8Nqds9EuRF+aM8upntZUHw==
X-CSE-MsgGUID: u8UFi6P8TKmTOms5XjE8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="60350743"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="60350743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:03:52 -0700
X-CSE-ConnectionGUID: B+GzQsDuTHSZc9t3bcbcOQ==
X-CSE-MsgGUID: hgT/otIoT+2/coHI3tB4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172866753"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2025 02:03:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unvlu-000E5F-0V;
	Mon, 18 Aug 2025 09:03:31 +0000
Date: Mon, 18 Aug 2025 17:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: Add support to read MHI capabilities
Message-ID: <202508181647.7mZJVOr6-lkp@intel.com>
References: <20250818-mhi_cap-v5-1-5e2d69aa2ace@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-mhi_cap-v5-1-5e2d69aa2ace@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/bus-mhi-host-Add-support-to-read-MHI-capabilities/20250818-140440
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250818-mhi_cap-v5-1-5e2d69aa2ace%40oss.qualcomm.com
patch subject: [PATCH v5] bus: mhi: host: Add support to read MHI capabilities
config: i386-buildonly-randconfig-003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181647.7mZJVOr6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181647.7mZJVOr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181647.7mZJVOr6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/init.c:470:12: warning: 'mhi_find_capability' defined but not used [-Wunused-function]
     470 | static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/mhi_find_capability +470 drivers/bus/mhi/host/init.c

   469	
 > 470	static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
   471	{
   472		u32 val, cur_cap, next_offset;
   473		int ret;
   474	
   475		/* Get the first supported capability offset */
   476		ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, offset);
   477		if (ret)
   478			return ret;
   479	
   480		do {
   481			if (*offset >= mhi_cntrl->reg_len)
   482				return -ENXIO;
   483	
   484			ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
   485			if (ret)
   486				return ret;
   487	
   488			cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
   489			next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
   490			if (cur_cap >= MHI_CAP_ID_MAX)
   491				return -ENXIO;
   492	
   493			if (cur_cap == capability)
   494				return 0;
   495	
   496			*offset = next_offset;
   497		} while (next_offset);
   498	
   499		return -ENXIO;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
