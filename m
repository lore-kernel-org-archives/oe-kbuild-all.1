Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935612E1CD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 03:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738900502; cv=none; b=ajgFxiMq4uwlGwQvsdMhRdCub4OFKLjc7MJHmMxlZA+dr2A2fahutjhO8K+B/WWj9Dhz7f/wG031P5khiTO+VqGehyAkuleCwwFiB+rSiy/y0Dx/u37FK5WfVPvCQRqsODm1n1NwCSYcxnMn3Tk4OsyXqiM55DD32wOtWFMY4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738900502; c=relaxed/simple;
	bh=q8wmppMm7NhplvktKWOLXadDVWTTG9qK3vMXcQ1F+II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNpFFxu10kLDfwa6m9M3RVxyh/DWsExJpTSFVQ1IMlj0DUqFSlxBQyqgNVwiyAk1btGF922CW3o49ei5Zhmu8V52AD9WAKqry8ek2lnsNlm24X47ZTkXzMfhZbkses96G3cBAxj3/zUxEd8vyDLZ2Af/gDWthwZL0CSa6eObwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKyCWBTK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKyCWBTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738900499; x=1770436499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q8wmppMm7NhplvktKWOLXadDVWTTG9qK3vMXcQ1F+II=;
  b=GKyCWBTK4Yn09CT2jZ89oGXmptrLbEdkVecNporZxaimFRyVOz702SPZ
   Yd5cV/tyb50K/rzmjxkOjVarULjo5ZSBMtvXPbbj9eN0aLQ/+DHDEkMvT
   BJ6uS2O/oSA98lSRfGZ4FvY0EAG1YArE9tLUn1kK1FKKt807ajyS0HcLY
   1UXFW1goHaG/nwg5lh+YZX1EAw9AD1E8NiX+AH/i5UElUQXH3CroVtsgG
   rrSjnqHEerhkHoVAMzJoEs9WtHVMXfcXMihCgVzBQd2mXeMbB+adLOcmo
   BhSYLpWCRElfutFBo4dlPzzQL7ox6hUnSFuAQQgPHuhPquM9iXQydti0t
   A==;
X-CSE-ConnectionGUID: rEtrq1w5T9ebJoNmYrJr1Q==
X-CSE-MsgGUID: XVtfk8I2TqqUhm2NJWSsig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50518065"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50518065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 19:54:58 -0800
X-CSE-ConnectionGUID: riO+g72TQfWrji58byGZVQ==
X-CSE-MsgGUID: Po5zKba3TL22l9sZiSKs5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="112023399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2025 19:54:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgFSB-000xj1-39;
	Fri, 07 Feb 2025 03:54:55 +0000
Date: Fri, 7 Feb 2025 11:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink
 managed EEE
Message-ID: <202502071101.4IcHJJ4b-lkp@intel.com>
References: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-provide-phylink_mac_implements_lpi/20250206-032648
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tfh3R-003aRS-3M%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink managed EEE
config: i386-buildonly-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071101.4IcHJJ4b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071101.4IcHJJ4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071101.4IcHJJ4b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/mt7530.c: In function 'mt753x_phylink_get_caps':
>> drivers/net/dsa/mt7530.c:3008:15: error: 'struct phylink_config' has no member named 'lpi_timer_limit_us'
    3008 |         config->lpi_timer_limit_us = FIELD_MAX(LPI_THRESH_MASK);
         |               ^~


vim +3008 drivers/net/dsa/mt7530.c

  2998	
  2999	static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
  3000					    struct phylink_config *config)
  3001	{
  3002		struct mt7530_priv *priv = ds->priv;
  3003		u32 eeecr;
  3004	
  3005		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
  3006	
  3007		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
> 3008		config->lpi_timer_limit_us = FIELD_MAX(LPI_THRESH_MASK);
  3009	
  3010		eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
  3011		/* tx_lpi_timer should be in microseconds. The time units for
  3012		 * LPI threshold are unspecified.
  3013		 */
  3014		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
  3015	
  3016		priv->info->mac_port_get_caps(ds, port, config);
  3017	}
  3018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
