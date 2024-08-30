Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92CD136E3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725060048; cv=none; b=s3ZqDU5/6DxQvNyUBcp8zWTFZ3vu4pm7nhUy6PzP+KQGqH374dZxVBTIaHfVVP7Lp2VnQyzRXGxoczIlGQ0abzMIAuAECdMtWQByPxXPVZi5qVRY9eQFCmUpqKzLj6Q6hQO2aSxo38WL/coTUHCXjxzj4Yn+uIZ9epmx766gLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725060048; c=relaxed/simple;
	bh=nPwrvEN9XYrbT3J+y8lcXmeIHnztMSIuwQQIDpKMEbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ls+8OxcgAb5p70CIKnT5rE5TfejAUt+DKcclYr/ZidZG7eKNEpHw9BEcEPB1N/LAi7Ha/NirXRIue8E4kxHIvwX4YIsug/E/7AzEae6RIyZzWZqPXOBQnWlRrTMUCSrIy3KnAcYSOnT+suOQ4UP0CQTlzdPZtJ8WxHiFQJchqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvbWrE1b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvbWrE1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725060047; x=1756596047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nPwrvEN9XYrbT3J+y8lcXmeIHnztMSIuwQQIDpKMEbw=;
  b=XvbWrE1bdyBWhAkL9P0LByjqexq/pnj1saMZfpNwjhZj/hj7ko79XSdH
   tToN4R9cRi/M8Zi1q4JNiy2gl2D5IrzPl1rwf3nv2nrBX1rpPN6OcjBWW
   lTl1MImKdN2esZo8PHJMEyN2mKpYJNpCVfQZVUYqB0b3dX/0/Ka4Vs/Ml
   WpL/rvWtCMgek1LJ9d+2j4tBSzNyYv+qsoqoKUFyS3S2DmtvKWFSH2tRU
   MBV0xCBeQTt4RVcBtMzVQXMj1v5XmOv4icx4NOuLFdvBSjY759Ic7GCk6
   wBlaXeMddnlks7ddIC/cgx0FGoYM12dhXdbD9+JEp1I+JoLvwvWfx/IGk
   A==;
X-CSE-ConnectionGUID: N1rG0vPhRhuvFLIj/NR/Ig==
X-CSE-MsgGUID: PR5kdOwlQfiFPG9e0n6aqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35127144"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="35127144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 16:20:46 -0700
X-CSE-ConnectionGUID: MIvltLxURYi6utmjs8MKtg==
X-CSE-MsgGUID: X1M4ydP+RYiEybVXoNsE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="63990529"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Aug 2024 16:20:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skAv1-0002Ck-1t;
	Fri, 30 Aug 2024 23:20:39 +0000
Date: Sat, 31 Aug 2024 07:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: ende.tan@starfivetech.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrew@lunn.ch,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, leyfoon.tan@starfivetech.com,
	minda.chen@starfivetech.com, endeneer@gmail.com,
	Tan En De <ende.tan@starfivetech.com>
Subject: Re: [net-next,v3,1/1] net: stmmac: Batch set RX OWN flag and other
 flags
Message-ID: <202408310604.E3C4zDID-lkp@intel.com>
References: <20240829134043.323855-1-ende.tan@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829134043.323855-1-ende.tan@starfivetech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on horms-ipvs/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ende-tan-starfivetech-com/net-stmmac-Batch-set-RX-OWN-flag-and-other-flags/20240829-214324
base:   linus/master
patch link:    https://lore.kernel.org/r/20240829134043.323855-1-ende.tan%40starfivetech.com
patch subject: [net-next,v3,1/1] net: stmmac: Batch set RX OWN flag and other flags
config: x86_64-randconfig-r132-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310604.E3C4zDID-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310604.E3C4zDID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310604.E3C4zDID-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse:     expected unsigned int [usertype] flags
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:59:21: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse:    left side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:62:24: sparse:    right side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse:    left side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:64:17: sparse:    right side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: sparse: restricted __le32 degrades to integer
--
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse:     expected unsigned int [usertype] flags
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:189:21: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse:    left side has type unsigned int
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:192:23: sparse:    right side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse:    left side has type restricted __le32
   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:194:17: sparse:    right side has type unsigned int

vim +59 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c

    56	
    57	static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
    58	{
  > 59		u32 flags = cpu_to_le32(XGMAC_RDES3_OWN);
    60	
    61		if (!disable_rx_ic)
  > 62			 flags |= cpu_to_le32(XGMAC_RDES3_IOC);
    63	
    64		p->des3 |= flags;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
