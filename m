Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F123BBEF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748867; cv=none; b=tAacr7mo9W8K1/jk0SVhJEuJxAKJBEbdsky93YjTcDCM+AD5VYh4XYM5jIeJjMQOllNDUriBBZGVxSjT6EyHOURMc3dQ28+rfc5F/Twc2c8cp/VerKLYQ8r/x1lRNxWFHV6v/QOoi4nT6y/WLh+tAt1RmvdPniX58NXwU4SOHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748867; c=relaxed/simple;
	bh=BI/4m+ehj6WvkwPBhUjw99GSm6MHwH2md5j+Qi631DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThVaHsxmA6nh1xAhJAwON6mtkmgATPIyVwPUyA1VzPmP0bh0OPnUr48lDBEKvxTktgdYntEFgETC7xxR3GcwWRfA97D8ePIoZE/6T8NRdd/xJ5IjE8oYoERXXrKWKdv5yEH3gSz5XgL0SlJ3zyxZGQ9S3ZpvJPyuqTqdMo7bqto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2KRZWFo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2KRZWFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715748865; x=1747284865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BI/4m+ehj6WvkwPBhUjw99GSm6MHwH2md5j+Qi631DQ=;
  b=n2KRZWFo/VLqpsO/HGBFFnHqqvGxN7riGRNKBOz5N50L2ZSvhKnR+BIm
   qky34CkczQtZGoPqctDOE7Mniuy9BdAvfiQeM44bRNLiiW9iD9xFIXiZ2
   rU4RCUrcRj7iFFEKxeKdtaU3kDmD+DyBPSVCjA2IXD/qSFpGDUk9zNpuw
   +ILVqtjM0xfFRPD3k/h66gxA69hdrdnOBoq9H2rs9+u+qNI3XOSHtpIlW
   PMK72rK772Y1iQPxriBK7MEsw75P0G6YYk8yxZx7055RMrSiqLaqsmGpw
   wOUoSnQdL6krNTcxiHviJbzp95+z24r15gb155EPpX0uS4KiChX0GE7kW
   g==;
X-CSE-ConnectionGUID: c33eW+JsTY6W07CRMOo78g==
X-CSE-MsgGUID: ufmJ12/zQI+2o0CbTddH4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11642497"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11642497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 21:54:24 -0700
X-CSE-ConnectionGUID: Fll8VzF9Sq+MfNcNcwMmXA==
X-CSE-MsgGUID: /Bbx+m9WRkaisAKW1wk2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="30854920"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2024 21:54:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s76ei-000CSF-2W;
	Wed, 15 May 2024 04:54:20 +0000
Date: Wed, 15 May 2024 12:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6911/9610]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1182:29: sparse: sparse:
 restricted __be32 degrades to integer
Message-ID: <202405151226.9E443DSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c6c7d83d2bc788cd9aef8983afa59eae25e148e
commit: 92e27ee40a7ac6d7716ce01305906610e50f577a [6911/9610] net: hns3: add support handling tx dhcp packets for ROH
config: arm64-randconfig-r132-20240515 (https://download.01.org/0day-ci/archive/20240515/202405151226.9E443DSy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405151226.9E443DSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151226.9E443DSy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:1182:29: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

vim +1182 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

  1165	
  1166	static struct hns3_dhcp_packet *hns3_get_dhcp_packet(struct sk_buff *skb,
  1167							     int *dhcp_len)
  1168	{
  1169		struct hns3_dhcp_packet *dhcp;
  1170		union l4_hdr_info l4;
  1171		int l4_payload_len;
  1172	
  1173		l4.hdr = skb_transport_header(skb);
  1174		if (l4.udp->dest != htons(HNS3_DHCP_CLIENT_PORT) ||
  1175		    l4.udp->source != htons(HNS3_DHCP_SERVER_PORT))
  1176			return NULL;
  1177	
  1178		dhcp = (struct hns3_dhcp_packet *)(l4.hdr + sizeof(struct udphdr));
  1179		l4_payload_len = ntohs(l4.udp->len) - sizeof(struct udphdr);
  1180		if (l4_payload_len < offsetof(struct hns3_dhcp_packet, options) ||
  1181		    dhcp->hlen != ETH_ALEN ||
> 1182		    dhcp->cookie != htonl(HNS3_DHCP_MAGIC))
  1183			return NULL;
  1184	
  1185		*dhcp_len = l4_payload_len;
  1186		return dhcp;
  1187	}
  1188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
