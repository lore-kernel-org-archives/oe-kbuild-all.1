Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B641632D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986846; cv=none; b=eVcPqZivEbEf1ZaTrqqf1uITOW2vsWNhrGlMlNliahw4gUT8Jx4XY2mpYKn1UWRVYloSG639osjJixk6JrPnFQn+mtm3abPbhdsrf2fUwBk8UAj86GaXlXl1tq+mbOdC/AMa0pzxDO41PFHrouY2AJNOkJ4Exu5y8R4nB9g7cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986846; c=relaxed/simple;
	bh=wPvhBSlKW4xh1WH6sbRDIaOyfFVh/L11q22yl8FDCsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kn9mIws7fH/MUSbbJbpuQMM20mdi69096dEifzGK2hC3ppWwFOAMS5lDOx06mOevYvrhSvRMM2Y/uCBlmoLxMdGV5KHzA52d8fcMawjxNEOk3T1tfwz0KIiXmlVxEWFiV07KI6GQENt7D7KEmjbayEC22WKX5VstfgdpP7F6nAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3fnZ/oS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3fnZ/oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733986844; x=1765522844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPvhBSlKW4xh1WH6sbRDIaOyfFVh/L11q22yl8FDCsg=;
  b=F3fnZ/oSy6uJ9lrqMV7/cF8ENSK14K+w3TFocwHYv78Q1Y/KSHFEKEf2
   qlJ0PvySL4xVVLpr0NxPo0WnTzVjJqz7M36medWiPSeEZSJKFMtQTszHN
   cLoN/ukVCkrknOllFkIbck3f7LeKArlGmQfBahMaD9VjKGFTogNhWKvld
   KuG3BGc3yq5vLOcnFe1RAkePsgSACN2bTB5FovqHHcAnGc5Bkn2JFV57w
   qTP65HFA5kQcbIcMXvQxAg89EgwyWyajsJrCM+fVbLciVv0CmSBWK46G0
   wBORzhYI490TdZ7n0SXhoyMgWESVq7ArJfy9c8+lBvcCdUiGMLnOfs88G
   g==;
X-CSE-ConnectionGUID: vkGoaeq3SvGnB6Wa3R8Slw==
X-CSE-MsgGUID: +yMKYcA7QEqgeUI5zq+Rew==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45797435"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45797435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:00:43 -0800
X-CSE-ConnectionGUID: odk1G1cUROeJHcpZtIUMfw==
X-CSE-MsgGUID: FLaRpL4MRcO4IhO7cxBN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95982422"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 23:00:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLdBc-0007Y1-0k;
	Thu, 12 Dec 2024 07:00:36 +0000
Date: Thu, 12 Dec 2024 14:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Fan Ni <fan.ni@samsung.com>
Subject: [weiny2:dcd-v4-2024-12-10 19/22] drivers/cxl/core/mbox.c:1723:39:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202412121444.32A7KHLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-12-10
head:   1cded0f798c0254ebe5d5e5fe20658dfb97bb1b3
commit: 54947cbd680460aa9a09c36e86f83b47a334c3a2 [19/22] cxl/region: Read existing extents on region creation
config: csky-randconfig-r121-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121444.32A7KHLK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121444.32A7KHLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121444.32A7KHLK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1723:39: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] extent_cnt @@     got unsigned int @@
   drivers/cxl/core/mbox.c:1723:39: sparse:     expected restricted __le32 [usertype] extent_cnt
   drivers/cxl/core/mbox.c:1723:39: sparse:     got unsigned int
   drivers/cxl/core/mbox.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)

vim +1723 drivers/cxl/core/mbox.c

  1694	
  1695	/* Return -EAGAIN if the extent list changes while reading */
  1696	static int __cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
  1697	{
  1698		u32 current_index, total_read, total_expected, initial_gen_num;
  1699		struct cxl_memdev_state *mds = cxled_to_mds(cxled);
  1700		struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
  1701		struct device *dev = mds->cxlds.dev;
  1702		struct cxl_mbox_cmd mbox_cmd;
  1703		u32 max_extent_count;
  1704		int latched_rc = 0;
  1705		bool first = true;
  1706	
  1707		struct cxl_mbox_get_extent_out *extents __free(kvfree) =
  1708					kvmalloc(cxl_mbox->payload_size, GFP_KERNEL);
  1709		if (!extents)
  1710			return -ENOMEM;
  1711	
  1712		total_read = 0;
  1713		current_index = 0;
  1714		total_expected = 0;
  1715		max_extent_count = (cxl_mbox->payload_size - sizeof(*extents)) /
  1716					sizeof(struct cxl_extent);
  1717		do {
  1718			struct cxl_mbox_get_extent_in get_extent;
  1719			u32 nr_returned, current_total, current_gen_num;
  1720			int rc;
  1721	
  1722			get_extent = (struct cxl_mbox_get_extent_in) {
> 1723				.extent_cnt = max(max_extent_count,
  1724						  total_expected - current_index),
  1725				.start_extent_index = cpu_to_le32(current_index),
  1726			};
  1727	
  1728			mbox_cmd = (struct cxl_mbox_cmd) {
  1729				.opcode = CXL_MBOX_OP_GET_DC_EXTENT_LIST,
  1730				.payload_in = &get_extent,
  1731				.size_in = sizeof(get_extent),
  1732				.size_out = cxl_mbox->payload_size,
  1733				.payload_out = extents,
  1734				.min_out = 1,
  1735			};
  1736	
  1737			rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
  1738			if (rc < 0)
  1739				return rc;
  1740	
  1741			/* Save initial data */
  1742			if (first) {
  1743				total_expected = le32_to_cpu(extents->total_extent_count);
  1744				initial_gen_num = le32_to_cpu(extents->generation_num);
  1745				first = false;
  1746			}
  1747	
  1748			nr_returned = le32_to_cpu(extents->returned_extent_count);
  1749			total_read += nr_returned;
  1750			current_total = le32_to_cpu(extents->total_extent_count);
  1751			current_gen_num = le32_to_cpu(extents->generation_num);
  1752	
  1753			dev_dbg(dev, "Got extent list %d-%d of %d generation Num:%d\n",
  1754				current_index, total_read - 1, current_total, current_gen_num);
  1755	
  1756			if (current_gen_num != initial_gen_num || total_expected != current_total) {
  1757				dev_warn(dev, "Extent list change detected; gen %u != %u : cnt %u != %u\n",
  1758					 current_gen_num, initial_gen_num,
  1759					 total_expected, current_total);
  1760				return -EAGAIN;
  1761			}
  1762	
  1763			for (int i = 0; i < nr_returned ; i++) {
  1764				struct cxl_extent *extent = &extents->extent[i];
  1765	
  1766				dev_dbg(dev, "Processing extent %d/%d\n",
  1767					current_index + i, total_expected);
  1768	
  1769				rc = validate_add_extent(mds, extent);
  1770				if (rc)
  1771					latched_rc = rc;
  1772			}
  1773	
  1774			current_index += nr_returned;
  1775		} while (total_expected > total_read);
  1776	
  1777		return latched_rc;
  1778	}
  1779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
