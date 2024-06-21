Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D883EA6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935876; cv=none; b=G4sD2CQ4BE5NqEdYG7nafu3WNuYrP8YYvr9HeCYHZcS9DJfA3qxmwMtusMIVZkWNXLOsX6YdbL2vBT3nJA8MjRMM6BYsQ4lLnLqIyvsjiKvFjicCxvOk4Z9M+JYaQspSWCyRwqJWfF2ZnbvVKJTLulUE1HjDr1RLCv6wfCwBWL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935876; c=relaxed/simple;
	bh=m7f2lGgkipNoqhlRWYYkScYFaRweNuSJ82A+iTZB86I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5WgHX8sOwVYdmWxdqRB3/gVO2Xd9nHVk/YvwGfz7RfSlBXGbZmFAlmroe1xffexfu+tAnPXNpl8Vmvgq1hlJe23K3n5eVGiv54CRST7p2c78ZblKEwWcZWO+l+8Nn2HhLEVxU/9syBHo1eq+IsTdbOSi5YLiq461464Q+22oIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg30G9Ki; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg30G9Ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935874; x=1750471874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7f2lGgkipNoqhlRWYYkScYFaRweNuSJ82A+iTZB86I=;
  b=Gg30G9KiGFDE3dENnK78634rqcbg7hgO/gY1l62TgiBpraYbB0lPrmCh
   pqwsVuFA1lKjoGaHmlG75ag3q0UrnxNy+zqQmBzqG8PlC+dByeTKA5PGl
   wr+mYO80H6y4z3BqzIxWqoaw8fiBjh0aDTs/d0P9j/6+INE9mX5l9+YE5
   M0r9e89toKC8rjsmLmHN26oMG5n1Mbs0FfGEcGMWVIlFnvdosNNRRvjYX
   j6rvjSLD+PLtU45/VkIw+kafRSfUCfzKAzI4dL/1F0iNkp/1l/77dlPEC
   oCyf7QnXMXuTvHPud0M8bOUKlhuL0Xs271Re+zCn6TR+aj3jxTHFdxv4e
   Q==;
X-CSE-ConnectionGUID: Y+pqOuCkRJ+emDkV0ulWqg==
X-CSE-MsgGUID: K9s+0BXJS3mJBXHXVKyZIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096254"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096254"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:11:13 -0700
X-CSE-ConnectionGUID: LxgzIy8cQpWnrXM47qy0HA==
X-CSE-MsgGUID: E5ZL6+3wRYaSFMs8Q7U7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42522752"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2024 19:11:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTk6-00086y-1M;
	Fri, 21 Jun 2024 02:11:10 +0000
Date: Fri, 21 Jun 2024 10:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v7 7/11]
 drivers/iommu/iommufd/fault.o: warning: objtool: unexpected relocation
 symbol type in .rela.discard.reachable
Message-ID: <202406210932.brH9HIzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v7
head:   70b73843dcbb25ba1e5ac34d66ceecd24cecbfce
commit: 8110a9ab91e8ab6e53f89d00ce42fe302e972a1c [7/11] iommufd: Fault-capable hwpt attach/detach/replace
config: loongarch-randconfig-r071-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210932.brH9HIzQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210932.brH9HIzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210932.brH9HIzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/fault.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
