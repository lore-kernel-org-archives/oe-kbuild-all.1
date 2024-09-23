Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AF19F470
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727120687; cv=none; b=brHMpMgx1aIYOK0QbjgRLGMjDHxs2SlUbfZ0uMfz60fH1G0aKip5l0vnO+yU7iUsimge9mvYPSVcuNixOixnlVYSju5a4I5/ZHq3OKDcDtOX+igXlc3gZ9AdEVb2bkbgr90LCs6fhM6iQr8o+oLFcTiPANRmCmJRqMqP61nd/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727120687; c=relaxed/simple;
	bh=Clkk71o0s79HGUcEPbrwaa9UXB/yqp1hOLGuoxrDjV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkXfVFWOMElubnmN4YL1Uf67kRNee3AMahpnK2sAk1uzj5JKG/C++hmBO/RhljjlPbLGYnubfrkpI4HCSOVPK8geEwkG9Zi9wZ7Yytu24AKcDg4zz3B+MKaw8rFWmG0tRHRSeYkn7WFrdy7U8KMsO9uFJoRSAIdnfDxS+lQhsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnPn24Wm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnPn24Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727120685; x=1758656685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Clkk71o0s79HGUcEPbrwaa9UXB/yqp1hOLGuoxrDjV8=;
  b=PnPn24Wmdakqby7eV5vnHGZgjKVbRQfG+2b3cTETYfh766Ggof2pLWDz
   JUKwxiYKOXSamdY7xEb/TyQzMbRjL7TC4h0IRK4J4Gcq5vs6ltVhYWTfL
   +Sqrxslpb96SceB0O6Qu6GWa7EncT3dKwrLzjwW9JKGY/SjKlOu+bjOML
   VBWLP60I1C7gOmm64eAFB91xSf5I9VG0mwybtny0MDSCXRKCIN/dfHXaw
   xYzezXUYHE4PqcYDeTlIrlcfkNBh/94WDx1TXSouEyrlCsAw9qIg60MCs
   8x2GjmX+a7SoPp4dbW/qQK43xNK8xHrANqBn6vIDCHZeqAoY5Pc1ra01y
   w==;
X-CSE-ConnectionGUID: Upmmi9qTQouydFctdLUtKQ==
X-CSE-MsgGUID: ZrzkVrq0RCudUtQ8Fo7pvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25602857"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="25602857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:44:45 -0700
X-CSE-ConnectionGUID: tEv9MQoSStOASbPCzWw2iQ==
X-CSE-MsgGUID: O+i2Mu1OSs+QdEZ2xYMJkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75553711"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 12:44:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssozA-000HYI-05;
	Mon, 23 Sep 2024 19:44:40 +0000
Date: Tue, 24 Sep 2024 03:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dipendra Khadka <kdipendra88@gmail.com>, andrew@lunn.ch,
	florian.fainelli@broadcom.com, davem@davemloft.net,
	edumazet@google.com, bcm-kernel-feedback-list@broadcom.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, Dipendra Khadka <kdipendra88@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net] net: Add error pointer check in bcmsysport.c
Message-ID: <202409240305.PgIkDx1K-lkp@intel.com>
References: <20240923053900.1310-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923053900.1310-1-kdipendra88@gmail.com>

Hi Dipendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Dipendra-Khadka/net-Add-error-pointer-check-in-bcmsysport-c/20240923-134407
base:   net/main
patch link:    https://lore.kernel.org/r/20240923053900.1310-1-kdipendra88%40gmail.com
patch subject: [PATCH v2 net] net: Add error pointer check in bcmsysport.c
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240305.PgIkDx1K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240305.PgIkDx1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240305.PgIkDx1K-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bcmsysport.c: In function 'bcm_sysport_map_queues':
>> drivers/net/ethernet/broadcom/bcmsysport.c:2341:24: error: implicit declaration of function 'PRT_ERR'; did you mean 'PTR_ERR'? [-Werror=implicit-function-declaration]
    2341 |                 return PRT_ERR(dp);
         |                        ^~~~~~~
         |                        PTR_ERR
   cc1: some warnings being treated as errors


vim +2341 drivers/net/ethernet/broadcom/bcmsysport.c

  2330	
  2331	static int bcm_sysport_map_queues(struct net_device *dev,
  2332					  struct net_device *slave_dev)
  2333	{
  2334		struct dsa_port *dp = dsa_port_from_netdev(slave_dev);
  2335		struct bcm_sysport_priv *priv = netdev_priv(dev);
  2336		struct bcm_sysport_tx_ring *ring;
  2337		unsigned int num_tx_queues;
  2338		unsigned int q, qp, port;
  2339	
  2340		if (IS_ERR(dp))
> 2341			return PRT_ERR(dp);
  2342	
  2343		/* We can't be setting up queue inspection for non directly attached
  2344		 * switches
  2345		 */
  2346		if (dp->ds->index)
  2347			return 0;
  2348	
  2349		port = dp->index;
  2350	
  2351		/* On SYSTEMPORT Lite we have twice as less queues, so we cannot do a
  2352		 * 1:1 mapping, we can only do a 2:1 mapping. By reducing the number of
  2353		 * per-port (slave_dev) network devices queue, we achieve just that.
  2354		 * This need to happen now before any slave network device is used such
  2355		 * it accurately reflects the number of real TX queues.
  2356		 */
  2357		if (priv->is_lite)
  2358			netif_set_real_num_tx_queues(slave_dev,
  2359						     slave_dev->num_tx_queues / 2);
  2360	
  2361		num_tx_queues = slave_dev->real_num_tx_queues;
  2362	
  2363		if (priv->per_port_num_tx_queues &&
  2364		    priv->per_port_num_tx_queues != num_tx_queues)
  2365			netdev_warn(slave_dev, "asymmetric number of per-port queues\n");
  2366	
  2367		priv->per_port_num_tx_queues = num_tx_queues;
  2368	
  2369		for (q = 0, qp = 0; q < dev->num_tx_queues && qp < num_tx_queues;
  2370		     q++) {
  2371			ring = &priv->tx_rings[q];
  2372	
  2373			if (ring->inspect)
  2374				continue;
  2375	
  2376			/* Just remember the mapping actual programming done
  2377			 * during bcm_sysport_init_tx_ring
  2378			 */
  2379			ring->switch_queue = qp;
  2380			ring->switch_port = port;
  2381			ring->inspect = true;
  2382			priv->ring_map[qp + port * num_tx_queues] = ring;
  2383			qp++;
  2384		}
  2385	
  2386		return 0;
  2387	}
  2388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
