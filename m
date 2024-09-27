Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7BC138490
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727458255; cv=none; b=oH0pcKV23DIhgG6ZqmjethnSYcohVKXrmbYby2G4/FJegNWDHJWt/m7BguN5h5gOmfHQik3XYah/feQavvFekFjXz6jOHNv3oANdtf+vEe6494E+hBlS6q9i4DU334qGkRI2FrVeQhONUd0e9lxFk44U4TXpRwi3W8hTHcsprmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727458255; c=relaxed/simple;
	bh=pMeYaVWtm0bsMhSW5vZHLOQ+mTl8Bc8M4Jh0xcuVtlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILKt3Ux3WK9q0h0xYw/yIIo8yeVvXq3lI29Bz+UdYnuFqgvkH5GB+CUU2o+jw/YiTZfJ03pAVL9Cf433eQ0rg98RiLtVY7bx1FwYTB+y/GDihnPAJq+eS1m7qZbFyQhcCw17nkv2XJ0SnRW7P/353RUUimtMFrKprYxUYrdORws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXu65ovX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXu65ovX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727458253; x=1758994253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMeYaVWtm0bsMhSW5vZHLOQ+mTl8Bc8M4Jh0xcuVtlQ=;
  b=CXu65ovX+g0B4Sc33kgCyEkWP5AIcmiij7BQSiOIocOx8eIP8rpAYE/i
   MjDvpR/6WnAuiC+rVb0lXjq7hOBxVh6WulUVTQq1UV3fAdPFFdY+3Ogrv
   M/9/Y8/NKgxorosBhuhiJAjRnA2odgMtczIyrzKSov5fQl04S69RXDFaI
   bN1v2lTCSSMv3YjTsghTtY5j/d5EAU2ynzVTTKPEgY11gYxlM2HLyeG0N
   sDkY6ZuTO+keplylc6TRPcHKq2UrtW87mJweE7EdkXYn0uJhwEnFQu/oW
   oACuTT0G9cKK5NyfO24KS1fyJjY5Neoke2+NsRI/dDUUer5Eb/S7qC4jZ
   A==;
X-CSE-ConnectionGUID: 1DIc8XwBS3is4pSbgB9Rkw==
X-CSE-MsgGUID: /1+98NmlTqC4T2RMW/SqUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49137583"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="49137583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 10:30:38 -0700
X-CSE-ConnectionGUID: uaktLUt0RDKwgF74FpQckA==
X-CSE-MsgGUID: 3hxL1DoeSRuaasSQNUqzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77539120"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 10:30:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suEnY-000MQd-2z;
	Fri, 27 Sep 2024 17:30:32 +0000
Date: Sat, 28 Sep 2024 01:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13031/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5671:37: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202409280106.13pCWH1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 7b05030bb7ada6099be6aee436250b07e96a3901 [13031/30000] net: hns3: support set/get VxLAN rule of rx flow director by ethtool
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409280106.13pCWH1k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409280106.13pCWH1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280106.13pCWH1k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5671:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5672:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5906:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6000:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5252:31: sparse: sparse: context imbalance in 'hclge_sync_fd_user_def_cfg' - unexpected unlock
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:12259:23: sparse: sparse: memset with byte count of 131072

vim +5671 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  5613	
  5614		int offset, moffset, ip_offset;
  5615		enum HCLGE_FD_KEY_OPT key_opt;
  5616		u16 tmp_x_s, tmp_y_s;
  5617		u32 tmp_x_l, tmp_y_l;
  5618		u8 *p = (u8 *)rule;
  5619		int i;
  5620	
  5621		if (rule->unused_tuple & BIT(tuple_bit))
  5622			return true;
  5623	
  5624		key_opt = tuple_key_info[tuple_bit].key_opt;
  5625		offset = tuple_key_info[tuple_bit].offset;
  5626		moffset = tuple_key_info[tuple_bit].moffset;
  5627	
  5628		switch (key_opt) {
  5629		case KEY_OPT_U8:
  5630			calc_x(*key_x, p[offset], p[moffset]);
  5631			calc_y(*key_y, p[offset], p[moffset]);
  5632	
  5633			return true;
  5634		case KEY_OPT_LE16:
  5635			calc_x(tmp_x_s, *(u16 *)(&p[offset]), *(u16 *)(&p[moffset]));
  5636			calc_y(tmp_y_s, *(u16 *)(&p[offset]), *(u16 *)(&p[moffset]));
  5637			*(__le16 *)key_x = cpu_to_le16(tmp_x_s);
  5638			*(__le16 *)key_y = cpu_to_le16(tmp_y_s);
  5639	
  5640			return true;
  5641		case KEY_OPT_LE32:
  5642			calc_x(tmp_x_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5643			calc_y(tmp_y_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5644			*(__le32 *)key_x = cpu_to_le32(tmp_x_l);
  5645			*(__le32 *)key_y = cpu_to_le32(tmp_y_l);
  5646	
  5647			return true;
  5648		case KEY_OPT_MAC:
  5649			for (i = 0; i < ETH_ALEN; i++) {
  5650				calc_x(key_x[ETH_ALEN - 1 - i], p[offset + i],
  5651				       p[moffset + i]);
  5652				calc_y(key_y[ETH_ALEN - 1 - i], p[offset + i],
  5653				       p[moffset + i]);
  5654			}
  5655	
  5656			return true;
  5657		case KEY_OPT_IP:
  5658			ip_offset = IPV4_INDEX * sizeof(u32);
  5659			calc_x(tmp_x_l, *(u32 *)(&p[offset + ip_offset]),
  5660			       *(u32 *)(&p[moffset + ip_offset]));
  5661			calc_y(tmp_y_l, *(u32 *)(&p[offset + ip_offset]),
  5662			       *(u32 *)(&p[moffset + ip_offset]));
  5663			*(__le32 *)key_x = cpu_to_le32(tmp_x_l);
  5664			*(__le32 *)key_y = cpu_to_le32(tmp_y_l);
  5665	
  5666			return true;
  5667		case KEY_OPT_VNI:
  5668			calc_x(tmp_x_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5669			calc_y(tmp_y_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5670			for (i = 0; i < HCLGE_VNI_LENGTH; i++) {
> 5671				key_x[i] = (cpu_to_le32(tmp_x_l) >> (i * BITS_PER_BYTE)) & 0xFF;
  5672				key_y[i] = (cpu_to_le32(tmp_y_l) >> (i * BITS_PER_BYTE)) & 0xFF;
  5673			}
  5674			return true;
  5675		default:
  5676			return false;
  5677		}
  5678	}
  5679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
