Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884BD27702B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109188; cv=none; b=bEgmi7NvTAqCSxT1jlomw5Y0Xj6o/RMPN29o5kEfTQEbMy54QNzhyWnf69ErvAmPBgP7oB2PDfWACX+XceXqbqeTQsTwcJk2X+9VG2Oiq3A4EZWMPui2n87NQRohSWKmFZHtZWglbZ+xhYM7DdP57cmRiYj0+9feUJ7zfTPGshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109188; c=relaxed/simple;
	bh=TD8D4zHKf9wkLQP/vQMc01IziqxsnefIBWxXOQzfIWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZwkzk1Yc/Wk+qq15sofKLxDdMVCTGnD8bP8/7psKxD3xWmkhbYAI7Mtb71W5F5ZKDjFKxS2vkpJW2DqoZK3GUZSLUcgKejgm952Bwu3h7y6UoFE8Yli+YROdZzsruMdc6rrLfz/TgcLS+a3jbW1dv4zCt8UkNwl6n0GQs+rqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMGBw7o7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMGBw7o7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741109186; x=1772645186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TD8D4zHKf9wkLQP/vQMc01IziqxsnefIBWxXOQzfIWY=;
  b=NMGBw7o7KDrW3WQMAjxkk+zNyEylQlXgis0o5TrVck7PAfT0pZdWehPD
   YSIFbzJFJM3DurBNcWLz3w+eBpJAVnOhfPKxeMVIPGfqAA2f6POwDC2Uj
   xpXQjnWxIwqCqAl97wto4kYBkcM6GtS4LYfy6+AYx77+fbt0V3OP1vagJ
   SGrG7efVdVS/sNXN6CZhXu3EJvyONkr3UDSe7vCuE68JK3bGa0FIwUy3A
   e8W7i3VJnvcYcxrKmgdLncdF/TcwnngSnaZhoUe3yrmCLTp/l5wTHww3b
   wVcCBtX06Q7UlcdGtw6PamTrvY8PCZxOY5r0DjSAjHcJ3vI2kbF1SHWXj
   A==;
X-CSE-ConnectionGUID: giIYOjZXSuC5yEHDIT28RQ==
X-CSE-MsgGUID: YVY2siyBSEK8Eph19RzQWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64484716"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="64484716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:26:24 -0800
X-CSE-ConnectionGUID: a1GGDcV+SMe21v1ZpqLFWg==
X-CSE-MsgGUID: G7I5auZqR0CJB/Ltl9qI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118581456"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2025 09:26:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpW28-000K48-2H;
	Tue, 04 Mar 2025 17:26:20 +0000
Date: Wed, 5 Mar 2025 01:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ming-Hung Tsai <mtsai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Subject: [linux-next:master 7583/7930] drivers/md/dm-cache-target.c:2832:13:
 sparse: sparse: restricted dm_oblock_t degrades to integer
Message-ID: <202503050119.a86XEv30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
commit: 1895947a287bfa31f9d014afd82d2d39ab674479 [7583/7930] dm cache: support shrinking the origin device
config: alpha-randconfig-r123-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050119.a86XEv30-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250305/202503050119.a86XEv30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050119.a86XEv30-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-cache-target.c:2832:13: sparse: sparse: restricted dm_oblock_t degrades to integer
   drivers/md/dm-cache-target.c:2832:28: sparse: sparse: restricted dm_oblock_t degrades to integer

vim +2832 drivers/md/dm-cache-target.c

  2826	
  2827	static int load_filtered_mapping(void *context, dm_oblock_t oblock, dm_cblock_t cblock,
  2828					 bool dirty, uint32_t hint, bool hint_valid)
  2829	{
  2830		struct cache *cache = context;
  2831	
> 2832		if (oblock >= cache->origin_blocks) {
  2833			if (dirty) {
  2834				DMERR("%s: unable to shrink origin; cache block %u is dirty",
  2835				      cache_device_name(cache), from_cblock(cblock));
  2836				return -EFBIG;
  2837			}
  2838			set_bit(from_cblock(cblock), cache->invalid_bitset);
  2839			return 0;
  2840		}
  2841	
  2842		return load_mapping(context, oblock, cblock, dirty, hint, hint_valid);
  2843	}
  2844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
