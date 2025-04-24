Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0121F8BA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745535786; cv=none; b=E39o+kWIwa51ktF0CJiCAapuHFrJSRAWEEAlZZ+EmtmuweSIHQ20fc+exd+Ke4PVtFo8Rvqlv7vVh/euQFLdTxEab06he3FAGjC2Sm9aGpdK7gEUn/wJUTQLSUfMuCYrG69Iy5aJdx6dMwWSlkWA/xsfdf9+YjnfZkQdk4u5h14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745535786; c=relaxed/simple;
	bh=iJKzbCyeA6kjT1QaTxRXswICWKq6ZN12o4L5k5sojkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WV9erRfOztkkgnepHrfahAA4R1yxC4SZ84LDUq/lA4wZcx3AaF98lVmlHNvwcwOE4/6VTHCgjNMXdycPwMtqtDFspCfIzp+SA9cqJDum1JV20sgHUi8EZaOczcc9fZY/s9HJC8Xnr/weLxRka4BYJRhaX/gxrKvkPManIuuiwiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGbHmYdn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGbHmYdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745535785; x=1777071785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJKzbCyeA6kjT1QaTxRXswICWKq6ZN12o4L5k5sojkE=;
  b=hGbHmYdnB7Joes+ayc/oalRBDi+3WzlCYFyKpPXElZRsoGAaZXpefDLr
   +oru6gaf4HXXnpuHkXu9ShT9R2MhvdlYEL1+clb7UWm16xuuAqdoOUl5S
   5EglJ+7yvD9+Rt/ThuiwRCEpS8dgfwdGmCL/+6NB28wmVHBmN7jtQPElI
   u1UPPQoEPavuZgFYVlWwI6H47rOQfXrXn2125c646ZnkDuQGN/+FGXMFq
   HRi4beVXTnT0utL/2L0Pt3vykRwIcavPHaGgLu0nvhZEaBDo/pbV10ZpK
   +/1ZmT0eaLiOe9VQjhiGcwkmbM/2ebckZkSk7aY9ckmZlwLpZFchuujjS
   w==;
X-CSE-ConnectionGUID: x0VePB2OROaCFL/RaUSX9Q==
X-CSE-MsgGUID: h0nCIJ2RQnWMNYP11q7WDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47104010"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47104010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 16:03:04 -0700
X-CSE-ConnectionGUID: IMV40qTWQxqh5W212dDYTg==
X-CSE-MsgGUID: Wf/C02LWSpi4Yn5niC2sVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="132630617"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2025 16:03:02 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u85au-0004en-10;
	Thu, 24 Apr 2025 23:03:00 +0000
Date: Fri, 25 Apr 2025 07:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1593/1593] block/blk-merge.c:688:16:
 warning: no previous prototype for 'blk_try_req_merge'
Message-ID: <202504250657.SBZLGq3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianchao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: 5f100bc6aabbe30e55cf20af8e163bb6dba3a3aa [1593/1593] block: fix the DISCARD request merge
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250425/202504250657.SBZLGq3K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250657.SBZLGq3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250657.SBZLGq3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-merge.c:688:16: warning: no previous prototype for 'blk_try_req_merge' [-Wmissing-prototypes]
     688 | enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
         |                ^~~~~~~~~~~~~~~~~


vim +/blk_try_req_merge +688 block/blk-merge.c

   687	
 > 688	enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
   689	{
   690		if (blk_discard_mergable(req))
   691			return ELEVATOR_DISCARD_MERGE;
   692		else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next))
   693			return ELEVATOR_BACK_MERGE;
   694	
   695		return ELEVATOR_NO_MERGE;
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
