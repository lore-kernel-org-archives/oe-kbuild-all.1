Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB717C9FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727527038; cv=none; b=LFZQUh5dJQ8L6ZzA7SxH9CTDU+4FnVI41Zi8FQsJojukXMl8lfW+gao9ONwuEbcR2Tr8Db+cr7HSWHWXHZVWCxn632zqdt/ykFC/aeTXWCP5f0d4WeQs7UDwl8dgQfWuqRAxYoI7NHa8om9co//ga5NlhdV5I1lGMOymxN4+zOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727527038; c=relaxed/simple;
	bh=nkootWGpf5p/Zj7Omg78MTkFm+oKszQ/yDfZD6JyYJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyanxViE7pTC7w/yMeQ2iWmj+bVh48MgCi063qY+BhwIlJZCpVAbvi9m0xxDn7Za7ObuaT2JVZyTROuH46OBYRCgZ/Hc9delDXFtdTf5aN9QRpSmpfjTW7Pt/z2sZzEd4on6KlX4foCZfsDo8A9IDPHfw4GpjEa2PxkG1thIiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9fuiyLY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9fuiyLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727527036; x=1759063036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nkootWGpf5p/Zj7Omg78MTkFm+oKszQ/yDfZD6JyYJg=;
  b=U9fuiyLYrAzPr+6wNhYQ3t37e9S4vctcarQuOprC4PCmZlALSmLxOYDM
   ziVL/OYofHx3Sakw6i2Y7UjrEY0LjB3RzLMPVGZiOG+uUFQHB60ObHEK/
   P0LJrQZe+1WhC9HB6lMo1nayLqIZGyHZCvIcKQ2xMb5xsxnhQm7C1pxiT
   ApHtBJtrwDZU7uOexQEDaw9hgnJFmS8yjwyRwUSmGpssVV12BxsD+noN0
   51Eg55tDWUSlnQqEE9Fsd2apzaPOXHO9nGs9ThgGkUMYZv+AxAO0sVkW4
   Er6XFJbzEAGmDuHl+t/Kd4l0/dh42im5PcQCmlc9IuijE7BQK2wdxvM/V
   A==;
X-CSE-ConnectionGUID: rJlFuZd1RK2TJplXO3XqoA==
X-CSE-MsgGUID: S5LfeDYQSi6vYlPalm/zog==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52079180"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="52079180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:37:15 -0700
X-CSE-ConnectionGUID: +XZESg5lSOi+TL62n+dt8A==
X-CSE-MsgGUID: Mtzwb8GKS3CGwFrLileCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="76892654"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2024 05:37:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWhE-000NGK-2J;
	Sat, 28 Sep 2024 12:37:12 +0000
Date: Sat, 28 Sep 2024 20:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Juan <nnuzj07170227@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15413/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1184:29: sparse: sparse:
 restricted __be32 degrades to integer
Message-ID: <202409282011.zsMjvrEl-lkp@intel.com>
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
commit: 19f053b7ee378e6d556caddf05485fe55695149e [15413/30000] net: hns3: add support handling tx dhcp packets for ROH
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409282011.zsMjvrEl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409282011.zsMjvrEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282011.zsMjvrEl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1184:29: sparse: sparse: restricted __be32 degrades to integer

vim +1184 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

  1167	
  1168	static struct hns3_dhcp_packet *hns3_get_dhcp_packet(struct sk_buff *skb,
  1169							     int *dhcp_len)
  1170	{
  1171		struct hns3_dhcp_packet *dhcp;
  1172		union l4_hdr_info l4;
  1173		int l4_payload_len;
  1174	
  1175		l4.hdr = skb_transport_header(skb);
  1176		if (l4.udp->dest != htons(HNS3_DHCP_CLIENT_PORT) ||
  1177		    l4.udp->source != htons(HNS3_DHCP_SERVER_PORT))
  1178			return NULL;
  1179	
  1180		dhcp = (struct hns3_dhcp_packet *)(l4.hdr + sizeof(struct udphdr));
  1181		l4_payload_len = ntohs(l4.udp->len) - sizeof(struct udphdr);
  1182		if (l4_payload_len < offsetof(struct hns3_dhcp_packet, options) ||
  1183		    dhcp->hlen != ETH_ALEN ||
> 1184		    dhcp->cookie != htonl(HNS3_DHCP_MAGIC))
  1185			return NULL;
  1186	
  1187		*dhcp_len = l4_payload_len;
  1188		return dhcp;
  1189	}
  1190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
