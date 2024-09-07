Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97EA3D0A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725745771; cv=none; b=EP2oQTKfAtzLgPg4PSW8PhPkkeBtDNuluy2pF3UguhpMCcb6NkyjJZKIWxJKCg7XX2ezhpdzbsmSetYv8yC32rHLXVFSa17DSgUZIlQX96PYtyep0Fm7QrVdi6CQA6QYvkILCZsJuQ7FxYmpvyuLK7QHTv4wVRIRfpGcCmM/5bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725745771; c=relaxed/simple;
	bh=m1rJIJMFyAc7V84iUgwrjgPtfoHSEXmHaeGMte9JalA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mknzfAwlixO106WYKBL9I4MX9lDGAPfwfMGVLkpRDlH28moLkViFee5bIo8aQ+sMUMmd34Je+DVkMeLh52Q79hk0u6he+h8bA0kquhpjIwFSMHu6aGM0sKV4zcDRFN/+K9iUXBTMTSMGRQk6CflG5l5tetkJqW3tKnGx70db8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjHNiC4/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjHNiC4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725745770; x=1757281770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1rJIJMFyAc7V84iUgwrjgPtfoHSEXmHaeGMte9JalA=;
  b=XjHNiC4/wqzZwOfphLDcgGwcLQMc2Iwu0mj1ma8czpjukSplTlI5e8dl
   9SprL0LQrEg+wbFVBOA1ccE1Y4AZAmLIgLbxVg2eQUrX4PLDfjvtpAA5M
   +aqyv+p6U9T/RcEto6avBAhNAw7C0mGEgB90FjFqlfR4PsBG3h5ZECnLk
   tRFVIcs7fst9HG5AR0QrYQNRDWSb6HED7u9lx6IQ4RpZJlvdncTAwLETY
   q7qHvX9SWd3r1jRwUfcR5hOEbzgqm+sjMwu32/GekOAAl/v5+nSR8SmBe
   MO2MkxTAd7r1J0YhYVF+xkVaJ6Hv7BcHJ4jYp7KAJiYo+iNJKOc7gSyfD
   g==;
X-CSE-ConnectionGUID: Z17DEucSQhWBfcuw2iZWTg==
X-CSE-MsgGUID: K8GLHN+IRxuk7BK7dB7mXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="28260839"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="28260839"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 14:49:30 -0700
X-CSE-ConnectionGUID: 0Eun4v0ATkCdaNKrr+XpxA==
X-CSE-MsgGUID: 3qdXTUssQ4q4wn+yGYf59Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66524970"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2024 14:49:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn3J7-000D2B-2a;
	Sat, 07 Sep 2024 21:49:25 +0000
Date: Sun, 8 Sep 2024 05:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chengchang Tang <tangchengchang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:1651:35: sparse: sparse:
 restricted __le16 degrades to integer
Message-ID: <202409080508.g4mNSLwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b31c4492884252a8360f312a0ac2049349ddf603
commit: 5a87279591a15f952043209d17429fadab278d47 RDMA/hns: Support hns HW stats
date:   1 year, 1 month ago
config: sparc64-randconfig-r111-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080508.g4mNSLwy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080508.g4mNSLwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080508.g4mNSLwy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:342:9: sparse: sparse: dubious: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:1651:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:486:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:488:9: sparse: sparse: dubious: x & !y

vim +1651 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

  1615	
  1616	static int hns_roce_hw_v2_query_counter(struct hns_roce_dev *hr_dev,
  1617						u64 *stats, u32 port, int *num_counters)
  1618	{
  1619	#define CNT_PER_DESC 3
  1620		struct hns_roce_cmq_desc *desc;
  1621		int bd_idx, cnt_idx;
  1622		__le64 *cnt_data;
  1623		int desc_num;
  1624		int ret;
  1625		int i;
  1626	
  1627		if (port > hr_dev->caps.num_ports)
  1628			return -EINVAL;
  1629	
  1630		desc_num = DIV_ROUND_UP(HNS_ROCE_HW_CNT_TOTAL, CNT_PER_DESC);
  1631		desc = kcalloc(desc_num, sizeof(*desc), GFP_KERNEL);
  1632		if (!desc)
  1633			return -ENOMEM;
  1634	
  1635		for (i = 0; i < desc_num; i++) {
  1636			hns_roce_cmq_setup_basic_desc(&desc[i],
  1637						      HNS_ROCE_OPC_QUERY_COUNTER, true);
  1638			if (i != desc_num - 1)
  1639				desc[i].flag |= cpu_to_le16(HNS_ROCE_CMD_FLAG_NEXT);
  1640		}
  1641	
  1642		ret = hns_roce_cmq_send(hr_dev, desc, desc_num);
  1643		if (ret) {
  1644			ibdev_err(&hr_dev->ib_dev,
  1645				  "failed to get counter, ret = %d.\n", ret);
  1646			goto err_out;
  1647		}
  1648	
  1649		for (i = 0; i < HNS_ROCE_HW_CNT_TOTAL && i < *num_counters; i++) {
  1650			bd_idx = i / CNT_PER_DESC;
> 1651			if (!(desc[bd_idx].flag & HNS_ROCE_CMD_FLAG_NEXT) &&
  1652			    bd_idx != HNS_ROCE_HW_CNT_TOTAL / CNT_PER_DESC)
  1653				break;
  1654	
  1655			cnt_data = (__le64 *)&desc[bd_idx].data[0];
  1656			cnt_idx = i % CNT_PER_DESC;
  1657			stats[i] = le64_to_cpu(cnt_data[cnt_idx]);
  1658		}
  1659		*num_counters = i;
  1660	
  1661	err_out:
  1662		kfree(desc);
  1663		return ret;
  1664	}
  1665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
