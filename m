Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF253515C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554203; cv=none; b=UHOWNkwZLvvlfHzAzONR92nYhDz1TYc9d8CjPv9zDop4R+pEzgo7u8yDoH5G+JrBWHww4t9w5q3ZGi/L7pzhR/NwtDbD6m3CmJDUJfIYPdZBph8Bo11gOlKgphB//3F09yuJCDYoTkT8oNF/MV6K/0HFKds0ruscYYdOYNrgn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554203; c=relaxed/simple;
	bh=F5QKQsjXAUkIcxTjJNEZcExHkwKqVKaa+2c12mLgdac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OE8UbcsNj35IkfW4JxJcm6+SVX6yI+Kf2VlbqbPqyHYbfKihVaQJ58XGd23Nf76Tln+zSSbzuEC6KI2lDavi+9EIBS0iTHjzJBMMVseJ7OQtEfeGaCXWv9V/XQ4Js9wS3s3vKKn3EReaTON4oITNSc/Z+NJ5plXSiHyGYkX0RHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY4eMA/2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY4eMA/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786554201; x=1818090201;
  h=date:from:to:cc:subject:message-id;
  bh=F5QKQsjXAUkIcxTjJNEZcExHkwKqVKaa+2c12mLgdac=;
  b=mY4eMA/25bxe7DTlyWS1QHQ8K1Mv0u76352v4WsnentC6Swoy5dfs94B
   8YMz9l1I2TbckYw6tEkYYWgTYg5DhrsTodG0fh/oEJ1EaIPYWm3Sb8UjZ
   fgUJ/GCWFA0kiuJWy/n1g+Z/wt5UTaltuSuvy71nqe3T+vt+rvFUsXkCq
   FELmOxwL/nTpeUppadLrSG2RAKPj3DSzTg1nVFkMNE/JYgTqIkFfR2zri
   ORyJeQ6cI6cPPxklNgDmaUzThKiKvwHmicYiCayrtnBkotqF48lxv4sYP
   obhdnfvA4meSgYf28ZPsuY2YI4mVQwAHHDsWJTbM9T2hI5eMkA3jkZvQ5
   A==;
X-CSE-ConnectionGUID: uSQKtozvQpypkeHU/MJ6nQ==
X-CSE-MsgGUID: AE3W+Gi2R0i1cIGcFNAXjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89640478"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="89640478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:03:20 -0700
X-CSE-ConnectionGUID: PKvrOzU8RyywcyZW8DcEsg==
X-CSE-MsgGUID: 0PymIWiDTmKQSV4IDC9YeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="288473929"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 10:03:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuCMG-00000000R9q-25zQ;
	Wed, 12 Aug 2026 17:03:16 +0000
Date: Thu, 13 Aug 2026 01:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tvs 3/5] drivers/hwmon/tvs-mpfs.c:266:2-3: Unneeded
 semicolon
Message-ID: <202608130032.EGmlagz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tvs
head:   89556bbdc65141c9062cd1bfe255b48c96fb9e8b
commit: 691d6378025fb2fcf003b98e2094c97ba617272b [3/5] hwmon: (mpfs) add workaround for interrupt erratum
config: arm-randconfig-r052-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130032.EGmlagz3-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130032.EGmlagz3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/tvs-mpfs.c:266:2-3: Unneeded semicolon

vim +266 drivers/hwmon/tvs-mpfs.c

   219	
   220	static int mpfs_tvs_temp_write(struct mpfs_tvs *data, u32 attr, long val)
   221	{
   222		u32 tmp;
   223		int temp;
   224	
   225		switch(attr) {
   226		case hwmon_temp_enable:
   227			if (val > 1 || val < 0)
   228				return -EINVAL;
   229	
   230			tmp = FIELD_PREP(MPFS_TVS_CTRL_TEMP_ENABLE, val);
   231			regmap_update_bits(data->regmap, MPFS_TVS_CTRL,
   232					   MPFS_TVS_CTRL_TEMP_ENABLE, tmp);
   233			break;
   234		case hwmon_temp_max:
   235			if (val < -273)
   236				return -EINVAL;
   237	
   238			temp = val << 4;
   239			temp /= 1000;
   240			temp += MPFS_TVS_K_TO_C;
   241	
   242			if (temp > GENMASK(14, 0))
   243				return -EINVAL;
   244	
   245			tmp = FIELD_PREP(MPFS_TRIGGER_MAX_MASK, temp);
   246			regmap_update_bits(data->regmap, MPFS_TVS_TRIGGER,
   247					   MPFS_TRIGGER_MAX_MASK, tmp);
   248			break;
   249		case hwmon_temp_min:
   250			if (val < -273)
   251				return -EINVAL;
   252	
   253			temp = val << 4;
   254			temp /= 1000;
   255			temp += MPFS_TVS_K_TO_C;
   256	
   257			if (temp > GENMASK(14, 0))
   258				return -EINVAL;
   259	
   260			tmp = FIELD_PREP(MPFS_TRIGGER_MIN_MASK, temp);
   261			regmap_update_bits(data->regmap, MPFS_TVS_TRIGGER,
   262					   MPFS_TRIGGER_MIN_MASK, tmp);
   263			break;
   264		default:
   265			return EOPNOTSUPP;
 > 266		};
   267	
   268		return 0;
   269	}
   270	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
