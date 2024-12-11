Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E91D61BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932538; cv=none; b=Chi7614d+pUwhtZvoDnokPSoy09uq/uqlwLWjodZaMNuBeLKM9Dff2H60SOK6eaRsop5STPCpUQMJguMKBchPiy2iJk7EKgPSfzhhyoDUX5NPfhPKK4y5Wk+Qi5ieSiar2c9ZsXq5M6T44Mm5m46bN6PAEHFCHfsfMprdFvfQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932538; c=relaxed/simple;
	bh=HmOxCZxjCiU378CSb7oKJA9Sc+js1sJTAFxOWMlCJmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CviuH4nRHI9BnFsMVQBVG4LuQIY02/7jEvjF8UKGhnSB6KdNzQtZQ2DX4k0NcLIbq3gEuwiluDlTFZzrOJ72JSTXj5PD5eEKkY9VCQtPOpUTlgiIG/kABd3SvQkstnNfVuc7p1CRkS8YLYJp8RTFBhl4r1pezvOxOh1WFULn55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcLiBDpF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcLiBDpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733932536; x=1765468536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmOxCZxjCiU378CSb7oKJA9Sc+js1sJTAFxOWMlCJmE=;
  b=dcLiBDpFgzGyp4Kc+k549p5BIaMb+Yec9fkqAbuWtTQYTdzVVd23pXN/
   r34Qjr1OG5AmZwSTlK7gKLAzqKQkKohwQ2k8QtisBGovTSX5eSrYVolEU
   ELqwkbo9zQCfpxMQn/Kly8gouJruVjA5mVE/pVAV0kgVd/yfJ0Wdd6Wl9
   C+jWBm0yom0BFGkLZcVpAzIPF27BcLRGqeF1yxbzxwDGFdw7qm+tLlcMg
   +mPn5FMHq9wVzYqj/nuzXrJso2PQNtG2WRCwMLMwPC9kecY/DUauUyPFN
   sNjcE6D3yLlF1V98PckA5HsxTLG7D4ylFAmvf9OfjQUI46S5aMYq17oQN
   w==;
X-CSE-ConnectionGUID: 5rWDOwwJTwmpU2Uz5y/uzw==
X-CSE-MsgGUID: DPxI2IKMRJOSGZYAjpfktQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="44988547"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="44988547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 07:55:35 -0800
X-CSE-ConnectionGUID: UHIfsOldR3+nqNbRXD6RFA==
X-CSE-MsgGUID: J0U5wcbMRZSxJwP6ZlSaoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133238907"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2024 07:55:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLP3j-0006pp-1K;
	Wed, 11 Dec 2024 15:55:31 +0000
Date: Wed, 11 Dec 2024 23:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Arinzon <darinzon@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>
Subject: drivers/net/ethernet/amazon/ena/ena_netdev.c:77 ena_tx_timeout()
 warn: inconsistent indenting
Message-ID: <202412112324.Ybl6uMc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 071271f39ce833a3534d1fbd47174d1bed6d9326 net: ena: Add more information on TX timeouts
date:   10 months ago
config: arm-randconfig-r073-20241209 (https://download.01.org/0day-ci/archive/20241211/202412112324.Ybl6uMc0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412112324.Ybl6uMc0-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/amazon/ena/ena_netdev.c:77 ena_tx_timeout() warn: inconsistent indenting

vim +77 drivers/net/ethernet/amazon/ena/ena_netdev.c

    47	
    48	static void ena_tx_timeout(struct net_device *dev, unsigned int txqueue)
    49	{
    50		enum ena_regs_reset_reason_types reset_reason = ENA_REGS_RESET_OS_NETDEV_WD;
    51		struct ena_adapter *adapter = netdev_priv(dev);
    52		unsigned int time_since_last_napi, threshold;
    53		struct ena_ring *tx_ring;
    54		int napi_scheduled;
    55	
    56		if (txqueue >= adapter->num_io_queues) {
    57			netdev_err(dev, "TX timeout on invalid queue %u\n", txqueue);
    58			goto schedule_reset;
    59		}
    60	
    61		threshold = jiffies_to_usecs(dev->watchdog_timeo);
    62		tx_ring = &adapter->tx_ring[txqueue];
    63	
    64		time_since_last_napi = jiffies_to_usecs(jiffies - tx_ring->tx_stats.last_napi_jiffies);
    65		napi_scheduled = !!(tx_ring->napi->state & NAPIF_STATE_SCHED);
    66	
    67		netdev_err(dev,
    68			   "TX q %d is paused for too long (threshold %u). Time since last napi %u usec. napi scheduled: %d\n",
    69			   txqueue,
    70			   threshold,
    71			   time_since_last_napi,
    72			   napi_scheduled);
    73	
    74		if (threshold < time_since_last_napi && napi_scheduled) {
    75			netdev_err(dev,
    76				   "napi handler hasn't been called for a long time but is scheduled\n");
  > 77				   reset_reason = ENA_REGS_RESET_SUSPECTED_POLL_STARVATION;
    78		}
    79	schedule_reset:
    80		/* Change the state of the device to trigger reset
    81		 * Check that we are not in the middle or a trigger already
    82		 */
    83		if (test_and_set_bit(ENA_FLAG_TRIGGER_RESET, &adapter->flags))
    84			return;
    85	
    86		ena_reset_device(adapter, reset_reason);
    87		ena_increase_stat(&adapter->dev_stats.tx_timeout, 1, &adapter->syncp);
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
