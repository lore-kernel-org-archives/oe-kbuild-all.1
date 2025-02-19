Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1161EDA1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974133; cv=none; b=LnjZcStwkoQL3jB4ihU5qNy1w6WpouNHKzJyEVxrGSh80ZkyaoTwR0GGardxkrwAyoIdAc/Zn7pRzKyTe5j971sianjnNPykjFDUwxZiHWQjtwtJVsSZslcTNmCZJhwmPpGFu1ymReAWlDH7AhLQZTYYubv2iQs/XaifcJ2QjmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974133; c=relaxed/simple;
	bh=LXzoI4MgVtnrrO+9DgZ9wLs5b33JMNUuJ0NF4Ln7qBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHwbm3n5dhE+atn/DYYQE8ziWzUo9TAndn8wJ8NjZ78T6VJ76HFvidzkMEBVB0qPu3CnoO9K7mYQkXznUKKJXOLdHpl6wFuLpB+lPTfFO+47c7lz97p2N/yskvNurN/u4//tZgB+4UkZPzl7zhv5PFKHX0Yt3TolYtePx8MxOMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k90v4awJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k90v4awJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739974131; x=1771510131;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LXzoI4MgVtnrrO+9DgZ9wLs5b33JMNUuJ0NF4Ln7qBk=;
  b=k90v4awJaDnMZn+4pyRlHuc/1Bez7LB04FipcX62P2zuBIIDr8LfdPTX
   NIt3DKo0muyktfSByF7lPy3pcZj3Ghf9WIacsKR2cXO+JF5IXORrxrIgs
   rSzW1sU87IoigXr2pw7X5rPPmivxfAs9jH+MtqPXZbOAPdCXAF8DvEjsS
   KjOWtD8fUDvG6gCUiNCh2VQ2+B7OF5bGCIea2Q+ps3AYZF5de0CJu1RYU
   vuBLr1Oh5wZ0xwNsug47ITAxndhdFAygjDYp33KOFkZ6XYmjwzIIoG4m2
   YdW4d6WP3/TtdpskQ1TWFmGxjVnLx9a+tWSQDZhgClcaDvqKWFarSTZdn
   w==;
X-CSE-ConnectionGUID: uRoNEmkXRyqTzutlHtJAqg==
X-CSE-MsgGUID: siQKnNB8SU6wmGexXpdqtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40425256"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40425256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 06:08:51 -0800
X-CSE-ConnectionGUID: HDRQJaJNTAS8+U8EKC3NLw==
X-CSE-MsgGUID: Prkh5lcVQWaZMM66/k3A9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119658411"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Feb 2025 06:08:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkkki-000327-1l;
	Wed, 19 Feb 2025 14:08:43 +0000
Date: Wed, 19 Feb 2025 22:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/intel/i40e/i40e_txrx.c:1996:3: warning: this statement
 may fall through
Message-ID: <202502192100.cNpacWNJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Björn,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 0c8493d90b6bb0f5c4fe9217db8f7203f24c0f28 [1/1] i40e: add XDP support for pass and drop actions
config: sparc64-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192100.cNpacWNJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192100.cNpacWNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192100.cNpacWNJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/i40e/i40e_txrx.c: In function 'i40e_run_xdp':
>> drivers/net/ethernet/intel/i40e/i40e_txrx.c:1996:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      bpf_warn_invalid_xdp_action(act);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:1997:2: note: here
     case XDP_TX:
     ^~~~


vim +1996 drivers/net/ethernet/intel/i40e/i40e_txrx.c

  1972	
  1973	/**
  1974	 * i40e_run_xdp - run an XDP program
  1975	 * @rx_ring: Rx ring being processed
  1976	 * @xdp: XDP buffer containing the frame
  1977	 **/
  1978	static struct sk_buff *i40e_run_xdp(struct i40e_ring *rx_ring,
  1979					    struct xdp_buff *xdp)
  1980	{
  1981		int result = I40E_XDP_PASS;
  1982		struct bpf_prog *xdp_prog;
  1983		u32 act;
  1984	
  1985		rcu_read_lock();
  1986		xdp_prog = READ_ONCE(rx_ring->xdp_prog);
  1987	
  1988		if (!xdp_prog)
  1989			goto xdp_out;
  1990	
  1991		act = bpf_prog_run_xdp(xdp_prog, xdp);
  1992		switch (act) {
  1993		case XDP_PASS:
  1994			break;
  1995		default:
> 1996			bpf_warn_invalid_xdp_action(act);
  1997		case XDP_TX:
  1998		case XDP_ABORTED:
  1999			trace_xdp_exception(rx_ring->netdev, xdp_prog, act);
  2000			/* fallthrough -- handle aborts by dropping packet */
  2001		case XDP_DROP:
  2002			result = I40E_XDP_CONSUMED;
  2003			break;
  2004		}
  2005	xdp_out:
  2006		rcu_read_unlock();
  2007		return ERR_PTR(-result);
  2008	}
  2009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
