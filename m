Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031B2F360C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 15:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134880; cv=none; b=c9TLdefnXdCwsnwcpHIn7+K7hqhWvggElepbDnM75aNjN+TZU5eEj/dh4/qEND8zrm19/DlBqBnro68sD54MOImuSVpMn60B9aH2BrNtIIRew3E0y3I3nCqdwtFdSc1AbiXEVWQyR+WHnt/H1i0v39nMD8FMjiLx5stm6THSBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134880; c=relaxed/simple;
	bh=6w5UjqRQrL39JleEcYLaqQU9bMYqXKN1Sz9AiChMAO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fVvJCZ2CngdFo5cIlYEYkT04xUeXWhn3WgMr1gNZe/eYzT+NvOGmoZlX49Js1Y75KWWH+p1i5POE4oJZCr/pzRqzURXjeE8Lad++R0EwU19pw9WCdulIIpnoD+DDkVkUhjPvNz/YULo/P0Fp98v/nzZ/c+RfR/w5/AhPqYOAci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqW0rqlV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqW0rqlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756134880; x=1787670880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w5UjqRQrL39JleEcYLaqQU9bMYqXKN1Sz9AiChMAO4=;
  b=dqW0rqlV+4jcsI+1zFL+O8ecxd7eUb89HuUEUEEZm7N6PWi51RhvUWLi
   TztRjdqDysQnP07/YXmIvPc2FzY8pCCBJWdGTgFnYOqLuhjPOVf2yk0IN
   k7+tIq7fkGFqQHW8BAHu7AaxJ5jUxt8L30nvZnuxm0mQUO+7PiHluhA06
   60/1QoDtC3hz//4sJnlyODxKu1+6OJxI/Xc9kJDgnCshc9OH+9J3Cqu/V
   TnFc4JOOvJf4l3ZEJb1sReh1II6vGCuESauspmtf+mwVqHmxOM4gE3d7u
   omH3k/EKGP/qe8AdyVMZqVoAn6VQZtc+ZApX+VEgxx1GmpwUN0uwSSGDs
   Q==;
X-CSE-ConnectionGUID: qK6cJxMRQDK2fA2GS20Rbw==
X-CSE-MsgGUID: d9clQmZQSvCj+aEm6XNAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61993648"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="61993648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:14:39 -0700
X-CSE-ConnectionGUID: HRrm19yhSAWPTxNLj9y65w==
X-CSE-MsgGUID: oXgLs5U2QGSHNpZSgZz2cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="174603149"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Aug 2025 08:14:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqYu3-000NnX-26;
	Mon, 25 Aug 2025 15:14:35 +0000
Date: Mon, 25 Aug 2025 23:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:vsrv 4/8] drivers/net/ethernet/vlsi/vlsi-mac.c:491: Error:
 unrecognized instruction `nop'
Message-ID: <202508252354.zOBWWc2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux vsrv
head:   f84f11fb4d6f91be1877e3c875925b65db83d318
commit: 29b289977925d54598d3ca35d4d41794ee885fa4 [4/8] net: vlsi: Add VLSI ethernet driver
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250825/202508252354.zOBWWc2r-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508252354.zOBWWc2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508252354.zOBWWc2r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/vlsi/vlsi-mac.c: Assembler messages:
>> drivers/net/ethernet/vlsi/vlsi-mac.c:491: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:493: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:495: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:807: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:807: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:853: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:853: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:586: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:588: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:637: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:637: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:640: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:640: Error: unrecognized instruction `nop'


vim +491 drivers/net/ethernet/vlsi/vlsi-mac.c

   487	
   488	static void vlsi_mac_flushrx(struct vlsi_mac_private *priv)
   489	{
   490		writel(readl(&priv->regmap->cf) | ETH_CF_RXMEMON, &priv->regmap->cf);
 > 491		nop();
   492		writel(readl(&priv->regmap->cf) & ~ETH_CF_RXMEMON, &priv->regmap->cf);
   493		nop();
   494		writel(readl(&priv->regmap->cf) | ETH_CF_RXMEMON, &priv->regmap->cf);
   495		nop();
   496		writel(readl(&priv->regmap->cf) & ~ETH_CF_RXMEMON, &priv->regmap->cf);
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
