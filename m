Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF951B95B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 02:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723172075; cv=none; b=IWv4VdJmLvHByUeSNRT9QJGO8NEYXfhn/xN7MDNCGZiOFv72UNi1FFjoCpCSvxBaIiLALhtazHzgBMNFLaG4FY5RKun5u7hNRXQ8TJui/bOEybgL5C/KAwt54HXKaHcHaFUAD5dsZ2szMjNshgawhZqf/t/OyOs43naiMbORjAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723172075; c=relaxed/simple;
	bh=vHt08DCS1gx6tNAwXARs2RXJqFZyTh/2qZl++Pwo6Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvdLNBYkqdNPeTGdD3PtgTEIqRFrxVw3MhXyC8Ki7bnyTHXVknFRy8GCbhlg/BLqv6EqKlsSh6I988fFlx8NktJvC/Y15LJQFArtKGC8ow1K4GFyjVYtgc9tYH3ZSSPefmZ6tA9kfMLOjj4h73azgSHIp/NT51Vr20aIMKDLDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWEbKmTg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWEbKmTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723172073; x=1754708073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vHt08DCS1gx6tNAwXARs2RXJqFZyTh/2qZl++Pwo6Ks=;
  b=CWEbKmTgLLGXqMNsQPpGXNsEReF/nuwLNh/ICf5Bn43zJCQC1lbgqPB0
   zwPKdIQDR8V36klJYdPi0hBzUtbAU77+EsXJC8WHxy5o1RhhKm6zKYMRZ
   kCH399g0Hq5xQS5A7DdiIVDIs5/SCsFguAr1TISaqAhMexnGc+3WpgdA8
   9unKA+g/dq4IKAaNfK8Bw8AK2u0haGpqUKSoeeG1E05OenKhcdlgXUis1
   rtf3mjns9LJgLHFkD3uMQmYb1I7OOzFjA3KphJqqmKYAzhZDp/qzzjo0b
   aU0AMkGB2Cpuk5+sHFAeKyCMEYej1lktNNTS/9zdIhI4C/Pgc7dKSiv3s
   Q==;
X-CSE-ConnectionGUID: DbXOPpXGTxCkj5lqe/KmCQ==
X-CSE-MsgGUID: Pi2wIeU+R5O1nGkbF4J2CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12927377"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="12927377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 19:54:32 -0700
X-CSE-ConnectionGUID: ncnCi8dHTim256aTIQXizQ==
X-CSE-MsgGUID: +UdeSUXaQ6GNBJK5YabBXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57345724"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2024 19:54:31 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scFls-0006n0-0b;
	Fri, 09 Aug 2024 02:54:28 +0000
Date: Fri, 9 Aug 2024 10:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 23/26] drivers/cxl/core/mbox.c:1737:39:
 sparse: sparse: cast to restricted __le32
Message-ID: <202408091045.U0qVklYb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 544c750835b77dd040b625cf1d158b4f3c9704a6 [23/26] cxl/region: Read existing extents on region creation
config: x86_64-randconfig-121-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091045.U0qVklYb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091045.U0qVklYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091045.U0qVklYb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/cxl/core/mbox.c:1737:39: sparse: sparse: cast from restricted __le32
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: cast to restricted __le32
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
>> drivers/cxl/core/mbox.c:1737:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/cxl/core/mbox.c:1737:39: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] extent_cnt @@     got unsigned int @@
   drivers/cxl/core/mbox.c:1737:39: sparse:     expected restricted __le32 [usertype] extent_cnt
   drivers/cxl/core/mbox.c:1737:39: sparse:     got unsigned int

vim +1737 drivers/cxl/core/mbox.c

  1710	
  1711	/* Return -EAGAIN if the extent list changes while reading */
  1712	static int __cxled_add_extents(struct cxl_endpoint_decoder *cxled)
  1713	{
  1714		u32 current_index, total_read, total_expected, initial_gen_num;
  1715		struct cxl_memdev_state *mds = cxled_to_mds(cxled);
  1716		struct device *dev = mds->cxlds.dev;
  1717		struct cxl_mbox_cmd mbox_cmd;
  1718		u32 max_extent_count;
  1719		bool first = true;
  1720	
  1721		struct cxl_mbox_get_extent_out *extents __free(kfree) =
  1722					kvmalloc(mds->payload_size, GFP_KERNEL);
  1723		if (!extents)
  1724			return -ENOMEM;
  1725	
  1726		total_read = 0;
  1727		current_index = 0;
  1728		total_expected = 0;
  1729		max_extent_count = (mds->payload_size - sizeof(*extents)) /
  1730					sizeof(struct cxl_extent);
  1731		do {
  1732			struct cxl_mbox_get_extent_in get_extent;
  1733			u32 nr_returned, current_total, current_gen_num;
  1734			int rc;
  1735	
  1736			get_extent = (struct cxl_mbox_get_extent_in) {
> 1737				.extent_cnt = max(max_extent_count,
  1738						cpu_to_le32(total_expected - current_index)),
  1739				.start_extent_index = cpu_to_le32(current_index),
  1740			};
  1741	
  1742			mbox_cmd = (struct cxl_mbox_cmd) {
  1743				.opcode = CXL_MBOX_OP_GET_DC_EXTENT_LIST,
  1744				.payload_in = &get_extent,
  1745				.size_in = sizeof(get_extent),
  1746				.size_out = mds->payload_size,
  1747				.payload_out = extents,
  1748				.min_out = 1,
  1749			};
  1750	
  1751			rc = cxl_internal_send_cmd(mds, &mbox_cmd);
  1752			if (rc < 0)
  1753				return rc;
  1754	
  1755			/* Save initial data */
  1756			if (first) {
  1757				total_expected = le32_to_cpu(extents->total_extent_count);
  1758				initial_gen_num = le32_to_cpu(extents->generation_num);
  1759				first = false;
  1760			}
  1761	
  1762			nr_returned = le32_to_cpu(extents->returned_extent_count);
  1763			total_read += nr_returned;
  1764			current_total = le32_to_cpu(extents->total_extent_count);
  1765			current_gen_num = le32_to_cpu(extents->generation_num);
  1766	
  1767			dev_dbg(dev, "Got extent list %d-%d of %d generation Num:%d\n",
  1768				current_index, total_read - 1, current_total, current_gen_num);
  1769	
  1770			if (current_gen_num != initial_gen_num || total_expected != current_total) {
  1771				dev_dbg(dev, "Extent list change detected; gen %u != %u : cnt %u != %u\n",
  1772					current_gen_num, initial_gen_num,
  1773					total_expected, current_total);
  1774				return -EAGAIN;
  1775			}
  1776	
  1777			for (int i = 0; i < nr_returned ; i++) {
  1778				struct cxl_extent *extent = &extents->extent[i];
  1779	
  1780				dev_dbg(dev, "Processing extent %d/%d\n",
  1781					current_index + i, total_expected);
  1782	
  1783				rc = validate_add_extent(mds, cxled, extent);
  1784				if (rc)
  1785					continue;
  1786			}
  1787	
  1788			current_index += nr_returned;
  1789		} while (total_expected > total_read);
  1790	
  1791		return 0;
  1792	}
  1793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
