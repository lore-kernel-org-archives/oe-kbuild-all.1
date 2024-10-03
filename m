Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5B1CF7CD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 23:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999283; cv=none; b=teCC1CAmIdTOPPpvPgs0v4HElmEkOzuMMKM9KBBjPwWYgVx1jAGQ/4FdlBi5cdeo07qTHUM8mw9dN2LmwnEIQ2nBPXgeWIzVqenUbK3gi/6P89OqIjTeV/XuGF7XWVDh4MnygS90hWFkB0uEF3WVZ144Bxx0gn80VMttv3I1agE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999283; c=relaxed/simple;
	bh=YpJm5zAL3sDlVjemX098khAMcK/HGGEaVayroAhiqjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtcsBMvhsXsXp0OVuXuf1PbqX99+sbHkTbCXmsNLnvH3weef8yZQk6tkFz8YfDARYxGrPqEcT/XaGO6KvLcHwXLWckeHZ77QzJsBm5DEfWTnXSJ3LVnDPDy+55Wd59uQA+K0CNZWuWLj+03we7RDG4AGMA712sU7GlOO6vvFoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGH8BQCO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGH8BQCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727999281; x=1759535281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpJm5zAL3sDlVjemX098khAMcK/HGGEaVayroAhiqjw=;
  b=cGH8BQCOsac0GODk0PqOgpGUk2q3IFj8fkS2BUHtRQK8LVj+PUadetfe
   mOlC5iN5rfSlwJSWXEOvxOYHhKWKDvzttzvfFBtL/lQmw0sgRtBg29hsj
   8o8WbVbnTqBt/rYDlMv0Hu1LGot6DMhFeawARPeopG+eu3lcfVFY4BdlN
   uyu43yYrKYd8BSkQKSPWg6Phb58x0/R+tuvv/Npg18ouY+rsc+beJYE+P
   blJtSA8FVbTOX89OOCSTvk9vuScwjcukGGWX9X2XWpMNiqyP6oTvYYh5A
   XKxuJjLn6PH4pma2mQ1R85su8HcupXn4+u1mQKfNm0sQYASCkn9o4ihp6
   g==;
X-CSE-ConnectionGUID: dAA9+LaST6CQKprqHxUmNA==
X-CSE-MsgGUID: WSvPx0CUTYGLUUzW7ms5bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44683361"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="44683361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 16:47:57 -0700
X-CSE-ConnectionGUID: tKaF9EvoS4eHb+p1bliNuA==
X-CSE-MsgGUID: 4dVjhTyfQv6qTnoI5y0xAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74832317"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 16:47:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVY1-00011w-3D;
	Thu, 03 Oct 2024 23:47:53 +0000
Date: Fri, 4 Oct 2024 07:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-10-01 26/29] drivers/cxl/core/mbox.c:1727:39:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202410040757.WVMm1RVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-10-01
head:   c240cf80afe13145f312562d144a7a60314806b0
commit: 049b4714fd94c3cfcca726f451861f05b3fe113c [26/29] cxl/region: Read existing extents on region creation
config: x86_64-randconfig-121-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040757.WVMm1RVv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040757.WVMm1RVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040757.WVMm1RVv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1727:39: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] extent_cnt @@     got unsigned int @@
   drivers/cxl/core/mbox.c:1727:39: sparse:     expected restricted __le32 [usertype] extent_cnt
   drivers/cxl/core/mbox.c:1727:39: sparse:     got unsigned int

vim +1727 drivers/cxl/core/mbox.c

  1699	
  1700	/* Return -EAGAIN if the extent list changes while reading */
  1701	static int __cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
  1702	{
  1703		u32 current_index, total_read, total_expected, initial_gen_num;
  1704		struct cxl_memdev_state *mds = cxled_to_mds(cxled);
  1705		struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
  1706		struct device *dev = mds->cxlds.dev;
  1707		struct cxl_mbox_cmd mbox_cmd;
  1708		u32 max_extent_count;
  1709		bool first = true;
  1710	
  1711		struct cxl_mbox_get_extent_out *extents __free(kfree) =
  1712					kvmalloc(cxl_mbox->payload_size, GFP_KERNEL);
  1713		if (!extents)
  1714			return -ENOMEM;
  1715	
  1716		total_read = 0;
  1717		current_index = 0;
  1718		total_expected = 0;
  1719		max_extent_count = (cxl_mbox->payload_size - sizeof(*extents)) /
  1720					sizeof(struct cxl_extent);
  1721		do {
  1722			struct cxl_mbox_get_extent_in get_extent;
  1723			u32 nr_returned, current_total, current_gen_num;
  1724			int rc;
  1725	
  1726			get_extent = (struct cxl_mbox_get_extent_in) {
> 1727				.extent_cnt = max(max_extent_count,
  1728						  total_expected - current_index),
  1729				.start_extent_index = cpu_to_le32(current_index),
  1730			};
  1731	
  1732			mbox_cmd = (struct cxl_mbox_cmd) {
  1733				.opcode = CXL_MBOX_OP_GET_DC_EXTENT_LIST,
  1734				.payload_in = &get_extent,
  1735				.size_in = sizeof(get_extent),
  1736				.size_out = cxl_mbox->payload_size,
  1737				.payload_out = extents,
  1738				.min_out = 1,
  1739			};
  1740	
  1741			rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
  1742			if (rc < 0)
  1743				return rc;
  1744	
  1745			/* Save initial data */
  1746			if (first) {
  1747				total_expected = le32_to_cpu(extents->total_extent_count);
  1748				initial_gen_num = le32_to_cpu(extents->generation_num);
  1749				first = false;
  1750			}
  1751	
  1752			nr_returned = le32_to_cpu(extents->returned_extent_count);
  1753			total_read += nr_returned;
  1754			current_total = le32_to_cpu(extents->total_extent_count);
  1755			current_gen_num = le32_to_cpu(extents->generation_num);
  1756	
  1757			dev_dbg(dev, "Got extent list %d-%d of %d generation Num:%d\n",
  1758				current_index, total_read - 1, current_total, current_gen_num);
  1759	
  1760			if (current_gen_num != initial_gen_num || total_expected != current_total) {
  1761				dev_dbg(dev, "Extent list change detected; gen %u != %u : cnt %u != %u\n",
  1762					current_gen_num, initial_gen_num,
  1763					total_expected, current_total);
  1764				return -EAGAIN;
  1765			}
  1766	
  1767			for (int i = 0; i < nr_returned ; i++) {
  1768				struct cxl_extent *extent = &extents->extent[i];
  1769	
  1770				dev_dbg(dev, "Processing extent %d/%d\n",
  1771					current_index + i, total_expected);
  1772	
  1773				rc = validate_add_extent(mds, extent);
  1774				if (rc)
  1775					continue;
  1776			}
  1777	
  1778			current_index += nr_returned;
  1779		} while (total_expected > total_read);
  1780	
  1781		return 0;
  1782	}
  1783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
