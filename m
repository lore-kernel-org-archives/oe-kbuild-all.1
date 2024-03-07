Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21475130ACC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709832616; cv=none; b=LJO+rPUU9LuLAXmV7k2K63MLad8GGW5wVFv6u79ieJLJrmeK6+jAW4jEBoPZakCquzGNniquFW/Up04LSaAF1PfqRXrLPXEvx8tTBkTY+JEoZcwui95rRirP2obBIBlU+w6gVxuPkBcD1NfUToS/pYiQb2lYgbvqfHwU290ax2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709832616; c=relaxed/simple;
	bh=004XPZuhyTmGJ24RRuq1WFE0wdbPbEM97IxUDPWlaMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VjAK7zJDZ6fxLO6dVuGXHaGKZgc6kQXkRxLPPCN89YRxFvKc57iLUzGhXbAIw8ASpi32AJuBfr9Int6IHGWF6WNBHjZG+/oAdCgXkhHPBXKGNtmMbXdkgh2pVrP1A3bnJ/zfVUo9NblRoKrri+67VH9Oev0XMkRuMNJuDXOBIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8X/KsuU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8X/KsuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709832614; x=1741368614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=004XPZuhyTmGJ24RRuq1WFE0wdbPbEM97IxUDPWlaMw=;
  b=Z8X/KsuUuOyicjpC+28/MkWc4+9Wfg7GUIccBq37E0ADv61adtbEtekm
   690rqPE8wBTFSBsf0L0KpSrsw8yQzWjV8Od6yRdoo3LfLr0LBDUGWRXMZ
   LJJ7HEq9fqQfvk+yLDXf/Zc8AumPv1kyPVlW185lAA4h2hC1O1P8ORO2k
   S+lePJ/6JZ3/JTEiX8nAplk2/zf2D2STG5NKyTltkqbzPiAleE3EhAPIf
   W5tSs0KVpxiyfY/4oVT+lzp7MBBJd2XscycbQkJof74CBMzuA44Q8CnLv
   7duaOTn7N3S1ytxXDGFmf+iQPVrkpsZxqybclLhqf5+J7MzrJCDslAY7o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7459414"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="7459414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 09:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10072457"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 09:30:10 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riHZH-0005SF-3B;
	Thu, 07 Mar 2024 17:30:07 +0000
Date: Fri, 8 Mar 2024 01:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24817/27434] net/toa/toa.c:213:17:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202403080120.UQOzf6rD-lkp@intel.com>
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
commit: 42d24297c006076ae13080d43bae627d5b492514 [24817/27434] net: csig toa patch
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240308/202403080120.UQOzf6rD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080120.UQOzf6rD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080120.UQOzf6rD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/toa/toa.c:49:15: sparse: sparse: symbol 'sk_data_ready_addr' was not declared. Should it be static?
   net/toa/toa.c:55:24: sparse: sparse: symbol 'toa_stats' was not declared. Should it be static?
   net/toa/toa.c:164:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got unsigned short [usertype] @@
   net/toa/toa.c:164:64: sparse:     expected restricted __be16 [usertype] sport
   net/toa/toa.c:164:64: sparse:     got unsigned short [usertype]
   net/toa/toa.c:166:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] vmip @@     got unsigned int [usertype] @@
   net/toa/toa.c:166:63: sparse:     expected restricted __be32 [usertype] vmip
   net/toa/toa.c:166:63: sparse:     got unsigned int [usertype]
   net/toa/toa.c:176:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vport @@     got unsigned short [usertype] @@
   net/toa/toa.c:176:64: sparse:     expected restricted __be16 [usertype] vport
   net/toa/toa.c:176:64: sparse:     got unsigned short [usertype]
   net/toa/toa.c:178:62: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] vip @@     got unsigned int [usertype] @@
   net/toa/toa.c:178:62: sparse:     expected restricted __be32 [usertype] vip
   net/toa/toa.c:178:62: sparse:     got unsigned int [usertype]
>> net/toa/toa.c:213:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:213:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:213:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:232:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:232:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:232:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:237:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:237:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:237:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:259:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:259:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:259:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:262:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:262:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:262:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:281:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:281:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:281:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:297:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:297:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:297:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:304:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:304:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:304:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:325:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:325:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:325:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:328:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:328:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:328:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:365:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:365:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:365:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:367:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:367:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:367:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:395:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:395:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:395:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:397:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:397:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:397:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:446:41: sparse: sparse: cast to restricted __be16
   net/toa/toa.c:486:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:486:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:486:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:490:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:490:47: sparse:     expected restricted __be16 [usertype] sin_port
   net/toa/toa.c:490:47: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:491:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:491:54: sparse:     expected restricted __be32 [usertype] s_addr
   net/toa/toa.c:491:54: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:493:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:493:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:493:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:498:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:498:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:498:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:501:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:501:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:501:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:527:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:527:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:527:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:528:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin6_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:528:48: sparse:     expected restricted __be16 [usertype] sin6_port
   net/toa/toa.c:528:48: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:529:94: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __be32 [usertype] w4 @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:529:94: sparse:     expected restricted __be32 [usertype] w4
   net/toa/toa.c:529:94: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:531:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:531:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:531:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:534:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:534:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:534:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:537:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:537:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:537:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:572:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:572:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:572:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:574:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:574:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:574:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:600:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:600:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:600:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:602:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:602:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:602:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:724:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:724:65: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:724:65: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:758:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:758:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:758:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:766:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:766:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:766:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:800:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:800:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:800:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:809:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:809:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:809:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:815:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] i_vmip @@
   net/toa/toa.c:815:48: sparse:     expected unsigned int [usertype] value
   net/toa/toa.c:815:48: sparse:     got restricted __be32 [usertype] i_vmip
   net/toa/toa.c:816:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] i_sport @@
   net/toa/toa.c:816:49: sparse:     expected unsigned short [usertype] value
   net/toa/toa.c:816:49: sparse:     got restricted __be16 [usertype] i_sport
   net/toa/toa.c:817:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] i_vip @@
   net/toa/toa.c:817:47: sparse:     expected unsigned int [usertype] value
   net/toa/toa.c:817:47: sparse:     got restricted __be32 [usertype] i_vip
   net/toa/toa.c:818:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] i_vport @@
   net/toa/toa.c:818:49: sparse:     expected unsigned short [usertype] value
   net/toa/toa.c:818:49: sparse:     got restricted __be16 [usertype] i_vport
   net/toa/toa.c:827:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:827:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:827:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:842:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:842:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:842:9: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:847:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:847:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:847:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:852:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:852:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:852:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:909:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats @@     got struct toa_stat_mib [noderef] __percpu * @@
   net/toa/toa.c:909:32: sparse:     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:909:32: sparse:     got struct toa_stat_mib [noderef] __percpu *
>> net/toa/toa.c:938:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [toplevel] ext_stats @@
   net/toa/toa.c:938:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:938:29: sparse:     got struct toa_stat_mib *[addressable] [toplevel] ext_stats
>> net/toa/toa.c:955:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats @@
   net/toa/toa.c:955:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:955:29: sparse:     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats

vim +213 net/toa/toa.c

   193	
   194	/* get client ip from socket
   195	 * @param sock [in] the socket to getpeername() or getsockname()
   196	 * @param uaddr [out] the place to put client ip, port
   197	 * @param uaddr_len [out] lenth of @uaddr
   198	 * @peer [in] if(peer), try to get remote address; if(!peer), try to get local address
   199	 * @return return what the original inet_getname() returns.
   200	 */
   201	static int
   202	inet_getname_vtoa(struct socket *sock,
   203			  struct sockaddr *uaddr,
   204			  int peer)
   205	{
   206		int retval = 0;
   207		struct sock *sk = sock->sk;
   208		struct sockaddr_in *sin = (struct sockaddr_in *) uaddr;
   209	
   210		/* call orginal one */
   211		retval = inet_getname(sock, uaddr, peer);
   212		if (disable_getpeername & VTOA_GETPEERNAME_IPV4_DISABLE){
 > 213			TOA_INC_STATS(ext_stats,
   214				GETNAME_VTOA_GETPEERNAME_IPV4_ERR_CNT);
   215			TOA_DBG("%s called, toa ipv getpeername disable\n", __func__);
   216			return retval;
   217		}
   218	
   219		TOA_DBG("%s called, sk_data_ready:%px retval:%d peer:%d vmip:%x sport:%u vip:%x vport:%u\n",
   220			__func__, sk?sk->sk_data_ready:NULL, retval, peer,
   221			sk?sk->sk_tvpc_info.vmip:0, sk?ntohs(sk->sk_tvpc_info.sport):0,
   222			sk?sk->sk_tvpc_info.vip:0, sk?ntohs(sk->sk_tvpc_info.vport):0);
   223	
   224		/* set our value if need */
   225		if (retval == sizeof(struct sockaddr_in) && peer && sk) {
   226			if (sk_data_ready_addr == (unsigned long) sk->sk_data_ready) {
   227				/*syscall accept must go here,
   228				 *so change the client ip/port and vip/vport here
   229				*/
   230				if (0 != sk->sk_tvpc_info.vmip
   231					&& 0 != sk->sk_tvpc_info.sport) {
   232					TOA_INC_STATS(ext_stats, GETNAME_TOA_OK_CNT);
   233					sin->sin_port = sk->sk_tvpc_info.sport;
   234					sin->sin_addr.s_addr = sk->sk_tvpc_info.vmip;
   235				} else if (0 == sk->sk_tvpc_info.vmip
   236					&& 0 == sk->sk_tvpc_info.sport) {
   237					TOA_INC_STATS(ext_stats,
   238							SYN_RECV_SOCK_NO_TOA_CNT);
   239					sk->sk_tvpc_info.sport = sin->sin_port;
   240					sk->sk_tvpc_info.vmip = sin->sin_addr.s_addr;
   241				} else
   242					TOA_INFO("vmip or sport can not 0.\n");
   243	
   244				/*do not get vip and vport,
   245				 *maybe vpcgw do not pass them,
   246				 *maybe it is a flow just for this host
   247				*/
   248				if (0 == sk->sk_tvpc_info.vip
   249					&& 0 == sk->sk_tvpc_info.vport) {
   250					struct sockaddr_in addr;
   251					if (inet_getname(sock, (struct sockaddr *)&addr,
   252						0) == sizeof(struct sockaddr_in)) {
   253						sk->sk_tvpc_info.vport = addr.sin_port;
   254						sk->sk_tvpc_info.vip =
   255							addr.sin_addr.s_addr;
   256					}
   257				}
   258			} else {
   259				TOA_INC_STATS(ext_stats, GETNAME_TOA_BYPASS_CNT);
   260			}
   261		} else { /* no need to get client ip */
   262			TOA_INC_STATS(ext_stats, GETNAME_TOA_EMPTY_CNT);
   263		}
   264	
   265		return retval;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
