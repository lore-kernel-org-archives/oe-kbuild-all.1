Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D56302755
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168365; cv=none; b=hztsn/HX1iRd6J+zPI5K99NcCLk0m93wl1dJtzyZKl7QCmaAMVQ4fsvKNx1mF6fbvF4rlU3yuc59HQeER2YOdQLK9+YFmFdWreTOGNLo+q9QO/tfT70RgERkhuwVHQqR9W7GY1dpcQ8U6zbFA9WeOghYaN2uGB0SvRpHYCnwR8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168365; c=relaxed/simple;
	bh=0eADdhlTisglLNm39/UTub275Oe0bJxEv8dNYysZJp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abZ9uiyWYGYo2VMoH28nAQ+8WNiZ1I+8rZLwTcrCxdIX+RIC0/guALTV16g/p/xSGRoo5cQub12UqqgmJ80HsnuRUN3DJ/rUDhHmapt0ygnkF5asbBpwHEw1WDGfNj6dPQ9HLVYZ3PGn8G6ovdCgKlZs86LO4CtSLc35gadtdnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgEI//P+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgEI//P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764168363; x=1795704363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0eADdhlTisglLNm39/UTub275Oe0bJxEv8dNYysZJp8=;
  b=HgEI//P+FSCr9rw9HNu1ocpG7MOdqDlYRrMLUzFBsWaOq7i6aJb6tQBG
   02t8YjIF7qKVHkjwRAiM1i5ZoZwTjvAxoj0wM+9UrFa70HfBEdbJmuJML
   PlXm1tITgX8wVl/oRlE9BbSp3ASGi2/ESMqgDS4NJYkuuCFSc8gqO/vq7
   T+jCpnO1HnmTUv6yWCawXJQwkZU2Ppzs+I26UE+ILJgqbMBhY4nsOCLqh
   8m+jBwknaZXdZA+mb9ArKdDTVmYlfRE4KjIiI36odKtS6wwxd4M8axxCK
   P+8bqIdRvBFEMzKPcAIULX3xcoMieS0E+d+qJHdkNzD7uXsjr4wIRyG9j
   Q==;
X-CSE-ConnectionGUID: sc0CpaA4QAWkS3Dj+A6xMw==
X-CSE-MsgGUID: 9Ymn4JEiQimTa7P8o4lDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76831847"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76831847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 06:46:02 -0800
X-CSE-ConnectionGUID: hPa2hPQQSIeWIySYpCSI5g==
X-CSE-MsgGUID: FV6I5QDjQAKBZWM5RkPZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192594141"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 06:46:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOGmM-00000000305-3xZk;
	Wed, 26 Nov 2025 14:45:58 +0000
Date: Wed, 26 Nov 2025 22:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: mc13xxx-core: Fix memory leak in
 mc13xxx_add_subdevice_pdata()
Message-ID: <202511262250.jglT8Ap3-lkp@intel.com>
References: <20251125171936.98101-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125171936.98101-1-nihaal@cse.iitm.ac.in>

Hi Abdun,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes lee-leds/for-leds-next linus/master v6.18-rc7 next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abdun-Nihaal/mfd-mc13xxx-core-Fix-memory-leak-in-mc13xxx_add_subdevice_pdata/20251126-012428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251125171936.98101-1-nihaal%40cse.iitm.ac.in
patch subject: [PATCH] mfd: mc13xxx-core: Fix memory leak in mc13xxx_add_subdevice_pdata()
config: i386-randconfig-141-20251126 (https://download.01.org/0day-ci/archive/20251126/202511262250.jglT8Ap3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262250.jglT8Ap3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262250.jglT8Ap3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/mc13xxx-core.c: In function 'mc13xxx_add_subdevice_pdata':
>> drivers/mfd/mc13xxx-core.c:388:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     388 |                 kfree(cell.name);
         |                 ^~~~~


vim +/kfree +388 drivers/mfd/mc13xxx-core.c

   364	
   365	static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
   366			const char *format, void *pdata, size_t pdata_size)
   367	{
   368		int ret;
   369		char buf[30];
   370		const char *name = mc13xxx_get_chipname(mc13xxx);
   371	
   372		struct mfd_cell cell = {
   373			.platform_data = pdata,
   374			.pdata_size = pdata_size,
   375		};
   376	
   377		/* there is no asnprintf in the kernel :-( */
   378		if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
   379			return -E2BIG;
   380	
   381		cell.name = kmemdup(buf, strlen(buf) + 1, GFP_KERNEL);
   382		if (!cell.name)
   383			return -ENOMEM;
   384	
   385		ret = mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
   386				       regmap_irq_get_domain(mc13xxx->irq_data));
   387		if (ret)
 > 388			kfree(cell.name);
   389		return ret;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
