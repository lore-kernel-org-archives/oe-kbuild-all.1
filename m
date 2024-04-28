Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971E6A8CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714327903; cv=none; b=bKZAaD3t40X0kvmf3troPS59ygjm9VmyQ7JT6NU6urUIbc9EhPLQmIN596gVJ6iNHjMDgrN8EJ51OEL47ML3L/3gXDxbDOYaoUlWIyWt1vHSoK5ACtxzqvMn0DSHR7ViG4+VEkxE5e0d4D/Zv4So4Zvj0VHYwB+cet1LUxDpNws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714327903; c=relaxed/simple;
	bh=AgXPqGSokvjG4SdxwLXUzaequJHonFj6SYwimqWc6Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gxGGQkLWfF1u4f1Bg7INtmQa0amUK8hh0sykv8YOJc8389Nt1of7cO6NSnc+HVQNENUJ/2WoOIEs3ZSsuPElhviQyfn1bWpnbIR1i2I8ezcm7EgekYrCB4BcrOreNzKIcXIES9ByBUPH/lm9ScIlGvrmCtkygXO7deHKjLLbD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpZf1s4j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpZf1s4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714327902; x=1745863902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgXPqGSokvjG4SdxwLXUzaequJHonFj6SYwimqWc6Dk=;
  b=GpZf1s4jsjDBUUHT2gZcHIUoebOYPUl95AzkdzzTJjOT726kOvL+tXsp
   xXvu37vAYeHLzA8omCqYD4ISkQXaTGpGrxt1vdezE4ajWp6jie7i0wQKW
   EsAfajqJwYGtF4+q7m4DGk9GNhu52pyZwY8OTbpc93PrAIfBPxcUHL11U
   +imrSKSIS42NTD5tBMtfvVF8ee5Po45hOZaM7Tmu8Am6eW7zlpwh+igSg
   iB5NmNiddiqF/weFxh5V1l9ybgE6cilNQZpMzvKzbXeC5LvU1pBtogB2H
   T4CuGY3JE/KL0IUio9FQQ7WrP32jGtstrhXw1OX0ZpSQ4BQAk+pFjwLw8
   Q==;
X-CSE-ConnectionGUID: ASPQgUT9TryoM5wl4tsYsA==
X-CSE-MsgGUID: PgBJtxJ9Rq22ZsEk0dqT6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20544753"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20544753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 11:11:41 -0700
X-CSE-ConnectionGUID: FWnZIU0rQ7+Is6yLFMAnvg==
X-CSE-MsgGUID: GSkpJ5lhQ9S8lw13exvjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26313812"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2024 11:11:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s18zx-0006Xe-0y;
	Sun, 28 Apr 2024 18:11:37 +0000
Date: Mon, 29 Apr 2024 02:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7592/7622] fs/ext4/inode.c:3585:24: sparse:
 sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be
 static?
Message-ID: <202404290230.zdcvkbB5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f120c2ab14341c60bcc055c700c0a29dce5837ac
commit: a38e9381cf2ba6f3300c716b1cff4551bec0fbdf [7592/7622] ext4: implement buffered read iomap path
config: x86_64-randconfig-121-20240429 (https://download.01.org/0day-ci/archive/20240429/202404290230.zdcvkbB5-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290230.zdcvkbB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290230.zdcvkbB5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3585:24: sparse: sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?

vim +/ext4_iomap_buffered_read_ops +3585 fs/ext4/inode.c

  3584	
> 3585	const struct iomap_ops ext4_iomap_buffered_read_ops = {
  3586		.iomap_begin = ext4_iomap_buffered_io_begin,
  3587	};
  3588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
