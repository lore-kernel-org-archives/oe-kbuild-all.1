Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960C55C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710186125; cv=none; b=mGhKMnbSWRAVR/Q3vlk8e/eun3PGjDT/oSwZinVQ8nwjfbP1Pwhvo1Dk/+3ZJrhocJNVT1pCcp6XSFmOkKaa+Df7oxkBvd3m+YuqWwMH92k24Zy7UWNzT5EyNYUrZvg7EPZ/RbO3zr7ECXTPVGxZrqg1ze4sapuLSH7m2iyXtkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710186125; c=relaxed/simple;
	bh=d58KjjSGdIOMjQJiiN3kfczant3BjVWs1h4LIOZPxn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqmfAr5cvQO2nU3G7rzrGbzXQU+e+qPhVGH4W2rq6HFqOe/+E5kIPZvEv7PHXDYQHCZx9LewAv/wOXaFnWt5h4bIlWYhjnjpDpp5z+nSR0UCp6v4Dd9AXVws8g05VmnfwDxbGgQwybFtNBgcu6FvzJUpPHD9IRAcFuOaA1puWlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9B0gvUb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9B0gvUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710186124; x=1741722124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d58KjjSGdIOMjQJiiN3kfczant3BjVWs1h4LIOZPxn0=;
  b=V9B0gvUbqMm/8YH/SwK/VTgcdDSLnHG8Rurj5b002vwXTVuUUfEba6AN
   No6W63JFZd6wWvJXEkdj9iS8NoLOokTbkkeTAcmzlT26PsIYaR5wXBcFV
   kl98gAkuW1c0m1houRfUOZgRD1QLeF6u7yh8hgrglK34xlo0e1mrou9rl
   RXJMNMMG+vGRe2mY06hNJ1dzjvvNGe4kApcbIzrkCEV6uRiGyTjjbsrje
   iEA05V0XZKm/EYbkz+8inj77nhE1Jook4MMnqbNn0tNl6+b8o2Yg7yhII
   VLfOhvWY8ek+4SWKn+G9HVYIVd429Ga9BO6sPgQBbgY0TKUAFWKeUJ15L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4746435"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4746435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 12:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15890321"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Mar 2024 12:41:57 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjlWz-0009PF-1J;
	Mon, 11 Mar 2024 19:41:53 +0000
Date: Tue, 12 Mar 2024 03:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 15/26] drivers/cxl/core/mbox.c:1520:47:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202403120337.MWj24QMY-lkp@intel.com>
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
commit: 35c0cb21fc4648b411f40ca8d597991afb0b93f2 [15/26] cxl/region: Read existing extents on region creation
config: alpha-randconfig-r133-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120337.MWj24QMY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240312/202403120337.MWj24QMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120337.MWj24QMY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1520:47: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] extent_cnt @@     got unsigned int @@
   drivers/cxl/core/mbox.c:1520:47: sparse:     expected restricted __le32 [usertype] extent_cnt
   drivers/cxl/core/mbox.c:1520:47: sparse:     got unsigned int
>> drivers/cxl/core/mbox.c:1521:47: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] start_extent_index @@     got unsigned int [assigned] start_index @@
   drivers/cxl/core/mbox.c:1521:47: sparse:     expected restricted __le32 [usertype] start_extent_index
   drivers/cxl/core/mbox.c:1521:47: sparse:     got unsigned int [assigned] start_index
   drivers/cxl/core/mbox.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +1520 drivers/cxl/core/mbox.c

  1497	
  1498	static int cxl_dev_get_dc_extents(struct cxl_endpoint_decoder *cxled,
  1499					  unsigned int start_gen_num,
  1500					  unsigned int exp_cnt)
  1501	{
  1502		struct cxl_memdev_state *mds = cxled_to_mds(cxled);
  1503		struct cxl_mbox_get_dc_extent_out *dc_extents __free(kfree) =
  1504					kvmalloc(mds->payload_size, GFP_KERNEL);
  1505		unsigned int start_index, total_read;
  1506		struct device *dev = mds->cxlds.dev;
  1507		struct cxl_mbox_cmd mbox_cmd;
  1508	
  1509		if (!dc_extents)
  1510			return -ENOMEM;
  1511	
  1512		total_read = 0;
  1513		start_index = 0;
  1514		do {
  1515			unsigned int nr_ext, total_extent_cnt, gen_num;
  1516			struct cxl_mbox_get_dc_extent_in get_dc_extent;
  1517			int rc;
  1518	
  1519			get_dc_extent = (struct cxl_mbox_get_dc_extent_in) {
> 1520				.extent_cnt = exp_cnt - start_index,
> 1521				.start_extent_index = start_index,
  1522			};
  1523	
  1524			mbox_cmd = (struct cxl_mbox_cmd) {
  1525				.opcode = CXL_MBOX_OP_GET_DC_EXTENT_LIST,
  1526				.payload_in = &get_dc_extent,
  1527				.size_in = sizeof(get_dc_extent),
  1528				.size_out = mds->payload_size,
  1529				.payload_out = dc_extents,
  1530				.min_out = 1,
  1531			};
  1532	
  1533			rc = cxl_internal_send_cmd(mds, &mbox_cmd);
  1534			if (rc < 0)
  1535				return rc;
  1536	
  1537			nr_ext = le32_to_cpu(dc_extents->ret_extent_cnt);
  1538			total_read += nr_ext;
  1539			total_extent_cnt = le32_to_cpu(dc_extents->total_extent_cnt);
  1540			gen_num = le32_to_cpu(dc_extents->extent_list_num);
  1541	
  1542			dev_dbg(dev, "Get extent list count:%d generation Num:%d\n",
  1543				total_extent_cnt, gen_num);
  1544	
  1545			if (gen_num != start_gen_num || exp_cnt != total_extent_cnt) {
  1546				dev_err(dev, "Possible incomplete extent list; gen %u != %u : cnt %u != %u\n",
  1547					gen_num, start_gen_num, exp_cnt, total_extent_cnt);
  1548				return -EIO;
  1549			}
  1550	
  1551			for (int i = 0; i < nr_ext ; i++) {
  1552				dev_dbg(dev, "Processing extent %d/%d\n",
  1553					start_index + i, exp_cnt);
  1554				rc = cxl_validate_extent(mds, &dc_extents->extent[i]);
  1555				if (rc)
  1556					return rc;
  1557				if (!cxl_dc_extent_in_ed(cxled, &dc_extents->extent[i]))
  1558					continue;
  1559				rc = cxl_ed_add_one_extent(cxled, &dc_extents->extent[i]);
  1560				if (rc)
  1561					return rc;
  1562			}
  1563	
  1564			start_index += nr_ext;
  1565		} while (exp_cnt > total_read);
  1566	
  1567		return 0;
  1568	}
  1569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
