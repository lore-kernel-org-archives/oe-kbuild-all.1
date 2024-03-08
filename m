Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA255788
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709893914; cv=none; b=kEJy2kPewzOiUP0qkr+mNVpTvcwh4pRkI9QmLWXgBH2BWkqr6nIPsvacQu5g21tzX3QxFdH5jS8pSvpCRfmTODlDBmTP3n7KlCTcsvknEmmajaD6Ws3Cn4FHIbm2Sfy+Aeu9nPv6VBbUFyqqd7ApLCupJ2r7/WYdSKNjaSeXJjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709893914; c=relaxed/simple;
	bh=2d9GQJVzm61vTNAph2dMJh9EdnQCDdel5E4CievRllo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpIjmvGqt2gBYxzU5kGs52IvPMTicbjXD2cyPb0Du7jxcmpZPsbN38iOKjyzPjjLQqG0iekEnhS3T9Qo43fqP6lEXkMIL+Prha/DyL5HlqsDVhfhPyrBNrj+EA63nqYU0M+vdgjIelpwZaPoS/XAbp5htUdmOEED2tnbO9j1/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2U97Z0K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2U97Z0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709893913; x=1741429913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2d9GQJVzm61vTNAph2dMJh9EdnQCDdel5E4CievRllo=;
  b=d2U97Z0KxFfoEQLIQjkiJpckRdk8S1oM8c7B9iDBiUvh8VRkxAcr/PXX
   n10ymXlDYumyPLcwEPO3KuIXSWLaRjAUAYMA5R+/2lLGPtjsd2s3CgDqT
   f+aVZaZk/kfgfBpUNNSVv+gzHLUCQYJ4XOmjLJE/lg7YIK9hx7cKiL9r+
   wWl57SruEJ99nsbIGeW1DmOsX5e3z6mGSXD7scBaeGYaLedsOTFbqLtLd
   u7fAT5OQsFgMy39M6AVKHqzDTj2C9G57USE6fy+UdBe0lbWIHsh+kH8HD
   rB6dfJKR7y+KkBin9b/wpUeaomvxqRyekE0O2Q7FdzSlOxYz7eqLBQSPg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7552453"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="7552453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 02:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="14903241"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2024 02:31:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riXVw-0006I5-2j;
	Fri, 08 Mar 2024 10:31:44 +0000
Date: Fri, 8 Mar 2024 18:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25785/27434]
 net/ipv4/netfilter/ipt_WH.c:41:18: sparse: sparse: cast from restricted
 __be32
Message-ID: <202403081807.TSiHfqWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 09290fb1ad50a24d68b78beb85193a2b20ec73e3 [25785/27434] net: iptables: add iptables target WH and DNATLB
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240308/202403081807.TSiHfqWo-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081807.TSiHfqWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081807.TSiHfqWo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/netfilter/ipt_WH.c:41:18: sparse: sparse: cast from restricted __be32
>> net/ipv4/netfilter/ipt_WH.c:41:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tmp_ip @@     got restricted __be32 [usertype] @@
   net/ipv4/netfilter/ipt_WH.c:41:16: sparse:     expected unsigned int [usertype] tmp_ip
   net/ipv4/netfilter/ipt_WH.c:41:16: sparse:     got restricted __be32 [usertype]
>> net/ipv4/netfilter/ipt_WH.c:42:20: sparse: sparse: cast from restricted __be16
>> net/ipv4/netfilter/ipt_WH.c:42:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] tmp_port @@     got restricted __be16 [usertype] @@
   net/ipv4/netfilter/ipt_WH.c:42:18: sparse:     expected unsigned short [usertype] tmp_port
   net/ipv4/netfilter/ipt_WH.c:42:18: sparse:     got restricted __be16 [usertype]

vim +41 net/ipv4/netfilter/ipt_WH.c

  > 41		tmp_ip = htonl(iph->daddr);
  > 42		tmp_port = htons(tcph->dest);
    43		option_addr[0] = 0xfd;
    44		option_addr[1] = 0x08;
    45		memcpy(option_addr + 2, &tmp_ip, 4);
    46		memcpy(option_addr + 6, &tmp_port, 2);
    47		memcpy(new_head + hdr_len, option_addr, 8);
    48		d = new_head;
    49		skb_pull(skb, hdr_len);
    50		skb_push(skb, hdr_len + 8);
    51		memcpy(skb->data, new_head, hdr_len + 8);
    52		skb->transport_header = skb->transport_header - 8;
    53		skb->network_header = skb->network_header - 8;
    54		iph = ip_hdr(skb); //update iph point to new ip header
    55		iph->tot_len = htons(skb->len);
    56		iph->check = 0; //re-calculate ip checksum
    57		iph->check = ip_fast_csum(iph, iph->ihl);
    58	
    59		tcph = (struct tcphdr *)skb_transport_header(skb);
    60		tcph->doff = tcph->doff + 2;
    61		tcph->check = 0;
    62		data_len = (skb->len - iph->ihl * 4); //tcp segment length
    63		tcph->check =
    64			csum_tcpudp_magic(iph->saddr, iph->daddr, data_len,
    65					  iph->protocol,
    66					  csum_partial((char *)tcph, data_len, 0));
    67		skb->ip_summed = CHECKSUM_UNNECESSARY;
    68	
    69		return 0;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
