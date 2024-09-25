Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CFD13D508
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727245986; cv=none; b=HmaFnV9ovW502DpVIMdTS3hMAulmEQDT0oYvj8l8Ph18Ojx5RLp8qdZs36OThI1mZwQeKOO6S3SLmPwrIH7RbH5vbpZdvGppMBo8/Mm2a3YI/o1j+2bw/nfJ8AKGV7Hnmi9dEY8b5EfvyPUJCxUBwJ+XcgKHTLhtr4b6TFzkzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727245986; c=relaxed/simple;
	bh=y2Oy0RSmXoJ5i4oID/CHBJYEtQ7H595BS4RVMcvCf1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMJGaapQiHvnGmttyC2i8gtOaxQaXJdqOnFQP55M90EoUgXJHHh5uCoFzlMCNKy92dChSJoB/txNUf0svV10xj0mVvMMgS4OaFwfs/MzMYgOSLZZSuQYagRTIpIo5Ez0raxQ7apLxeM6GNZkx81TOEcxTLbrTHycLhoSGMl1Dh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPFqf6nT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPFqf6nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727245985; x=1758781985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y2Oy0RSmXoJ5i4oID/CHBJYEtQ7H595BS4RVMcvCf1E=;
  b=gPFqf6nTC/8d+PQM6FUYAjzwzt0Vc6zoYYJaxdQmB7NXxM+lzVbx7Y17
   zxXZUYvV83P85TsEad26f49TX79eeasuHyTVFubpxgD/AHuZyJkmC4m/C
   N6AWa3FbFFwt7UpM/rF5AuVgN4GmwQ65LFHMVM2ns6TzQgO653LMB48Km
   M+QBb328+BeeVXQv3P4xqVjh/EfnCpr2SfFfaIq847nLgnRwEPCMsOpTT
   Bc65BSaY4dUYkZ9I+LcnZVAl1AsqgTqbRGdeXimPlxmcZM9yuUzFbYj5P
   MSNpepMab5SmqAO5wB+h3I2bjEZn0hcJzcsLvOW1v1aTjlATqQRzKF2MT
   w==;
X-CSE-ConnectionGUID: YVNpUOekQ/OHdOg8MBpxwg==
X-CSE-MsgGUID: RGukGrqETIWgdbRRtzPSAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30065795"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="30065795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 23:33:04 -0700
X-CSE-ConnectionGUID: VXgX49nERfCWHCctTv645Q==
X-CSE-MsgGUID: 6XECAs3hTcCk2I7J2hIP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71816071"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2024 23:33:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stLa8-000JDn-1z;
	Wed, 25 Sep 2024 06:33:00 +0000
Date: Wed, 25 Sep 2024 14:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] block: add support for partition table defined
 in OF
Message-ID: <202409251428.jWKG05TG-lkp@intel.com>
References: <20240923105937.4374-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923105937.4374-4-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on robh/for-next lwn/docs-next linus/master v6.11 next-20240925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/block-add-support-for-defining-read-only-partitions/20240923-190251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240923105937.4374-4-ansuelsmth%40gmail.com
patch subject: [RFC PATCH 3/4] block: add support for partition table defined in OF
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409251428.jWKG05TG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251428.jWKG05TG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251428.jWKG05TG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   block/partitions/of.c: In function 'add_of_partition':
>> block/partitions/of.c:47:35: error: 'pp' undeclared (first use in this function); did you mean 'np'?
      47 |         if (of_property_read_bool(pp, "read-only"))
         |                                   ^~
         |                                   np
   block/partitions/of.c:47:35: note: each undeclared identifier is reported only once for each function it appears in
   block/partitions/of.c: At top level:
>> block/partitions/of.c:58:5: warning: no previous prototype for 'of_partition' [-Wmissing-prototypes]
      58 | int of_partition(struct parsed_partitions *state)
         |     ^~~~~~~~~~~~


vim +47 block/partitions/of.c

    25	
    26	static void add_of_partition(struct parsed_partitions *state, int slot,
    27				     struct device_node *np)
    28	{
    29		struct partition_meta_info *info;
    30		char tmp[sizeof(info->volname) + 4];
    31		int a_cells, s_cells;
    32		const char *partname;
    33		const __be32 *reg;
    34		u64 offset, size;
    35		int len;
    36	
    37		reg = of_get_property(np, "reg", &len);
    38	
    39		a_cells = of_n_addr_cells(np);
    40		s_cells = of_n_size_cells(np);
    41	
    42		offset = of_read_number(reg, a_cells);
    43		size = of_read_number(reg + a_cells, s_cells);
    44	
    45		put_partition(state, slot, offset, size);
    46	
  > 47		if (of_property_read_bool(pp, "read-only"))
    48			state->parts[slot].flags |= ADDPART_FLAG_READONLY;
    49	
    50		info = &state->parts[slot].info;
    51		partname = of_get_property(np, "label", &len);
    52		strscpy(info->volname, partname, sizeof(info->volname));
    53	
    54		snprintf(tmp, sizeof(tmp), "(%s)", info->volname);
    55		strlcat(state->pp_buf, tmp, PAGE_SIZE);
    56	}
    57	
  > 58	int of_partition(struct parsed_partitions *state)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
