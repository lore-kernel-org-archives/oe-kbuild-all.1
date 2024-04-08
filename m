Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77A147C60
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712611509; cv=none; b=hhcyLnLgWtqG3g0t4u3VOW3aacq1r0cou5ooaaOd0Ry4YIW/wCtFuYG1KBbe7+sz9WyZYWp+I8e7tgJWwAoHF+JwYe7ctm9s7n68KzyLDhoCmGd30S4oJuS3l5eygRRFbRpRosm72AoiyQDERAhCGO2HKlWnQrT8GheAQpFdBAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712611509; c=relaxed/simple;
	bh=RQlkDGeM0plgF7kqsG+MTmknBKynQpcMjOc/dYZhYds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKFDDZ0B9tTGLtduMSg6B/VBb3LXYoBQsfHwPFIOkhae/JopQrFw0rWyGidHdOxnssdaUPaah1H1j3hqkuMMRj4kDHiby8MY2r6+ss4rFYPrVXFunVUmnQCsj5DzuzGItlxtZDzjW+p6wpFZHb3x6FhB+A57KLD+LZ+X2v58Bz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XglNS4ZU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XglNS4ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712611506; x=1744147506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQlkDGeM0plgF7kqsG+MTmknBKynQpcMjOc/dYZhYds=;
  b=XglNS4ZUkXyKh9+TNype3A9gc2ptSJb86D/GtkdfaxwA/wIufJ+zRGSU
   f4/Pqb2w+/IVcm7Lz6XWLi28HMphuhEN+g5Xwi8m0t5uHN1Vqgt373sDM
   +YhzeMIq8rf3t3Xg3LiVUPRF3JZnNLYGRReFZacglVzbBxaI12qlMIeRI
   99ht+f3rq5A8lH1uCxHqQbLqivi/h9IEpM+17oRS7DXRtXKUylEWN1EX7
   FN0E9L0HarPIYmWANCsCwdGOWpVtGTW5ODLMms3rsEUxpfrxKnHGmo/0P
   qctFAjUED0uWlRXlz8luAnWyQ0jD60FYkUp01aI6lep+sGBbePhN5neTF
   g==;
X-CSE-ConnectionGUID: qENaNBfTReejotsuDRXuiQ==
X-CSE-MsgGUID: KgI1UbzBTiGweAhqqWqnbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7777034"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7777034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 14:25:05 -0700
X-CSE-ConnectionGUID: Yt1bIG7LSO+nMXdKAcBMkw==
X-CSE-MsgGUID: 1EFcIdLXTaud7E+N45Umsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20446910"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 14:25:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtwU9-0005VG-2q;
	Mon, 08 Apr 2024 21:25:01 +0000
Date: Tue, 9 Apr 2024 05:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6913/7311]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6003:37: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202404090532.QLIDcYg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   05607873db411ec3c614313b43cec60138c26a99
commit: e992b88fa60f2e405a35c281c549b4caf3cd78f3 [6913/7311] net: hns3: support set/get VxLAN rule of rx flow director by ethtool
config: loongarch-randconfig-r113-20240408 (https://download.01.org/0day-ci/archive/20240409/202404090532.QLIDcYg8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090532.QLIDcYg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090532.QLIDcYg8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6003:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6004:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6238:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6332:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:13360:21: sparse: sparse: symbol 'hclge_ops' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5574:31: sparse: sparse: context imbalance in 'hclge_sync_fd_user_def_cfg' - unexpected unlock

vim +6003 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  5945	
  5946		int offset, moffset, ip_offset;
  5947		enum HCLGE_FD_KEY_OPT key_opt;
  5948		u16 tmp_x_s, tmp_y_s;
  5949		u32 tmp_x_l, tmp_y_l;
  5950		u8 *p = (u8 *)rule;
  5951		int i;
  5952	
  5953		if (rule->unused_tuple & BIT(tuple_bit))
  5954			return true;
  5955	
  5956		key_opt = tuple_key_info[tuple_bit].key_opt;
  5957		offset = tuple_key_info[tuple_bit].offset;
  5958		moffset = tuple_key_info[tuple_bit].moffset;
  5959	
  5960		switch (key_opt) {
  5961		case KEY_OPT_U8:
  5962			calc_x(*key_x, p[offset], p[moffset]);
  5963			calc_y(*key_y, p[offset], p[moffset]);
  5964	
  5965			return true;
  5966		case KEY_OPT_LE16:
  5967			calc_x(tmp_x_s, *(u16 *)(&p[offset]), *(u16 *)(&p[moffset]));
  5968			calc_y(tmp_y_s, *(u16 *)(&p[offset]), *(u16 *)(&p[moffset]));
  5969			*(__le16 *)key_x = cpu_to_le16(tmp_x_s);
  5970			*(__le16 *)key_y = cpu_to_le16(tmp_y_s);
  5971	
  5972			return true;
  5973		case KEY_OPT_LE32:
  5974			calc_x(tmp_x_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5975			calc_y(tmp_y_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  5976			*(__le32 *)key_x = cpu_to_le32(tmp_x_l);
  5977			*(__le32 *)key_y = cpu_to_le32(tmp_y_l);
  5978	
  5979			return true;
  5980		case KEY_OPT_MAC:
  5981			for (i = 0; i < ETH_ALEN; i++) {
  5982				calc_x(key_x[ETH_ALEN - 1 - i], p[offset + i],
  5983				       p[moffset + i]);
  5984				calc_y(key_y[ETH_ALEN - 1 - i], p[offset + i],
  5985				       p[moffset + i]);
  5986			}
  5987	
  5988			return true;
  5989		case KEY_OPT_IP:
  5990			ip_offset = IPV4_INDEX * sizeof(u32);
  5991			calc_x(tmp_x_l, *(u32 *)(&p[offset + ip_offset]),
  5992			       *(u32 *)(&p[moffset + ip_offset]));
  5993			calc_y(tmp_y_l, *(u32 *)(&p[offset + ip_offset]),
  5994			       *(u32 *)(&p[moffset + ip_offset]));
  5995			*(__le32 *)key_x = cpu_to_le32(tmp_x_l);
  5996			*(__le32 *)key_y = cpu_to_le32(tmp_y_l);
  5997	
  5998			return true;
  5999		case KEY_OPT_VNI:
  6000			calc_x(tmp_x_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  6001			calc_y(tmp_y_l, *(u32 *)(&p[offset]), *(u32 *)(&p[moffset]));
  6002			for (i = 0; i < HCLGE_VNI_LENGTH; i++) {
> 6003				key_x[i] = (cpu_to_le32(tmp_x_l) >> (i * BITS_PER_BYTE)) & 0xFF;
  6004				key_y[i] = (cpu_to_le32(tmp_y_l) >> (i * BITS_PER_BYTE)) & 0xFF;
  6005			}
  6006			return true;
  6007		default:
  6008			return false;
  6009		}
  6010	}
  6011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
