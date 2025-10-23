Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1196175BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 01:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761181692; cv=none; b=fSOxHDE0YeSCasIEGdreDyrcqA2wEE0x0ATFzPX53iJ3FrJsdkXw9mYw6GceVT2Ox7mhNCIC89eFu82jjlXkisxfKF5fgvHZS80m3YsVUo4v/mZ5NyWr613oxgn6hE13DRKymVn8T967lJigRghzs9M/RmVef71kiVcUWSHuQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761181692; c=relaxed/simple;
	bh=/QnnjvDVo/hmpCy4nNwckEif4CdVWMcA1D02KxvDAj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G73wKuMxQPLnGzyPEQa6DtwtFBVDyW9zv2e1mPwuvosO5Jt/P2cnpessESHMSY7y70kGTogEb05AitpEZONGK9Bn7PA3EKvP4mrEuZ7n6LZr5Ig7PK81FOHAyfk8OyDYbni0iq1Y23bK7PIqIc5OrBqyhevBny2+wB+5832z9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2X6AVQR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2X6AVQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761181690; x=1792717690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QnnjvDVo/hmpCy4nNwckEif4CdVWMcA1D02KxvDAj8=;
  b=A2X6AVQRWBX27MGiZEQm46kcfEDqZL96jfB1KIZzuxzOfS3ViJxuAIZ2
   XZv62FHC27Fc5l6b5Mqk73iwtFDFC7iQ4tMScugr/hvYBfH7Nb1b29mLp
   CzqKLHXme8w65OpTDRyaLfCLbQUH7bR/EUXwis/B2qNhLnQLyhNbxR1TW
   TWT8IKYQRJxD19JKLPnSkxss6zHpyfDFbD48R4h4JkP4qhakqw1rxDZZV
   yXgXUWGWe99MUwqBnE047tdcJzSlD1VHgN8hGwR3iTdW1rykgorAn9sza
   mudOB81F76MqXS/1SQt5yQhdc6Q5ZWOhWyVhN/TVNuyWWuStxg90yG8IN
   g==;
X-CSE-ConnectionGUID: TY48s8ikTHO+ufbcwO6y/A==
X-CSE-MsgGUID: IPTPA7YcTVWpJ5W9UfWtSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62551841"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="62551841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:08:10 -0700
X-CSE-ConnectionGUID: uciMWNa9TOCDkQAimdnqlg==
X-CSE-MsgGUID: a9G8W0lzSwGYp8EYHuJGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="189290630"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2025 18:08:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBjoF-000CsL-16;
	Thu, 23 Oct 2025 01:08:07 +0000
Date: Thu, 23 Oct 2025 09:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next PATCH 2/2] net: ethernet: Implement
 ndo_write_rx_config callback for the 8139cp driver
Message-ID: <202510230836.XzRA9Tg0-lkp@intel.com>
References: <20251020134857.5820-3-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020134857.5820-3-viswanathiyyappan@gmail.com>

Hi Viswanath,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/I-Viswanath/net-Add-ndo_write_rx_config-and-helper-structs-and-functions/20251020-215339
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251020134857.5820-3-viswanathiyyappan%40gmail.com
patch subject: [RFC net-next PATCH 2/2] net: ethernet: Implement ndo_write_rx_config callback for the 8139cp driver
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230836.XzRA9Tg0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230836.XzRA9Tg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230836.XzRA9Tg0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/realtek/8139cp.c:939:13: warning: 'cp_set_rx_mode' defined but not used [-Wunused-function]
     939 | static void cp_set_rx_mode (struct net_device *dev)
         |             ^~~~~~~~~~~~~~


vim +/cp_set_rx_mode +939 drivers/net/ethernet/realtek/8139cp.c

^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  938  
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16 @939  static void cp_set_rx_mode (struct net_device *dev)
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  940  {
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  941  	unsigned long flags;
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  942  	struct cp_private *cp = netdev_priv(dev);
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  943  
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  944  	spin_lock_irqsave (&cp->lock, flags);
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  945  	__cp_set_rx_mode(dev);
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  946  	spin_unlock_irqrestore (&cp->lock, flags);
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  947  }
^1da177e4c3f415 drivers/net/8139cp.c Linus Torvalds 2005-04-16  948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
