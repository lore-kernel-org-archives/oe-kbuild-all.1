Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A51C32FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748070513; cv=none; b=mp3QxR8XAAZJlTeuXR9ZW+MQcOzgofcE2LqAzWPMPsorGf25U9YXJkIKOJQdHIdW+MXb1pByBJaze/zgY+ZSZHfd7WNRNeDIrFCKZ1Am4o79HYsT0RRh1/Qpa/pnfPH6Um2Ssffe1D8T7tauQNtvPT46xAX4WVyYjRfnL0Dqtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748070513; c=relaxed/simple;
	bh=l37WYSNzESuYD9qyW8zIng69i8oJzNe3v0Zfd5DYfD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leuAs9R6nK2uXg9UlLV5WN+3xCWwo+QxwPNdmv+4g47gP84WkRk3DG7KoawYAfOC7VMV1JppI+UpkNi8NfCZixlF42hUXlVn1a+WvpLChNApsIPowJDMsEX3fj4yIklQOeadNvDW4kJwNUr41PAvqSBa6mhmFXmmuon+WJDUcNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmFNCNit; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmFNCNit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748070511; x=1779606511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l37WYSNzESuYD9qyW8zIng69i8oJzNe3v0Zfd5DYfD4=;
  b=KmFNCNithi3F1cepzrc37SutBz82ppH+Q15WmUIj6/0nW7GogXLWXYV6
   r5WNabipfeLJVEGU79QQIK2HZxH0kihq5MyGgk3d3PEO1sC8H1ZtSzMkN
   tb5NnokYn4wxgGyCJAm06VnSW2XTpdV9YKcMMPVIsAKcya2/KnWloP2iY
   68zWGBdnN/sLtWq5jUDl0hFke8PToWDecclmeM8vDUi52WI0RxAXuCw+I
   3v+dF2BZbGQ5DPOKJW4vRo6DDao1A6qF6xuEoOmdZ3LPPFBkPpUwMjozW
   Gdre/QKQQA2lUTB9Un6AtBAk2KjYtfTJ5tVNjTSpVVcQ67hyYrcQsafLg
   w==;
X-CSE-ConnectionGUID: 0touSaFHTfeMu3Cg5GZ7xw==
X-CSE-MsgGUID: KphDtISoT/SogSdgEDY8tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75517070"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="75517070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:08:30 -0700
X-CSE-ConnectionGUID: OPPtt+mzRh+P9vJawESPvg==
X-CSE-MsgGUID: Ds2XSvuTTYOsy98bc+fBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="145420530"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2025 00:08:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiza-000R0n-1M;
	Sat, 24 May 2025 07:08:26 +0000
Date: Sat, 24 May 2025 15:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.pais@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Silviu Smarandache <silviu.smarandache@oracle.com>,
	Shannon Nelson <shannon.nelson@oracle.com>
Subject: [jlayton:uek-localio 2061/2262] net/core/dev.c:6148:1: warning:
 label 'out' defined but not used
Message-ID: <202505241510.y618UgaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 8020f88cb880cb42b8f311b05a7d0cafdd7df045 [2061/2262] net: enable RPS on vlan devices
config: x86_64-buildonly-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241510.y618UgaX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241510.y618UgaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241510.y618UgaX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/dev.c: In function 'netif_receive_skb_internal':
>> net/core/dev.c:6148:1: warning: label 'out' defined but not used [-Wunused-label]
    6148 | out:
         | ^~~


vim +/out +6148 net/core/dev.c

  6112	
  6113	static int netif_receive_skb_internal(struct sk_buff *skb)
  6114	{
  6115		int ret;
  6116	
  6117		net_timestamp_check(READ_ONCE(net_hotdata.tstamp_prequeue), skb);
  6118	
  6119		if (skb_defer_rx_timestamp(skb))
  6120			return NET_RX_SUCCESS;
  6121	
  6122		rcu_read_lock();
  6123	#ifdef CONFIG_RPS
  6124		if (static_branch_unlikely(&rps_needed)) {
  6125			struct rps_dev_flow voidflow, *rflow = &voidflow;
  6126			int cpu;
  6127	
  6128			/* strip any vlan tag before calling get_rps_cpu() */
  6129			if (skb->protocol == cpu_to_be16(ETH_P_8021Q) ||
  6130			    skb->protocol == cpu_to_be16(ETH_P_8021AD)) {
  6131				skb = skb_vlan_untag(skb);
  6132				if (unlikely(!skb)) {
  6133					ret = NET_RX_DROP;
  6134					goto out;
  6135				}
  6136			}
  6137	
  6138		cpu = get_rps_cpu(skb->dev, skb, &rflow);
  6139	
  6140			if (cpu >= 0) {
  6141				ret = enqueue_to_backlog(skb, cpu, &rflow->last_qtail);
  6142				rcu_read_unlock();
  6143				return ret;
  6144			}
  6145		}
  6146	#endif
  6147		ret = __netif_receive_skb(skb);
> 6148	out:
  6149		rcu_read_unlock();
  6150		return ret;
  6151	}
  6152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
