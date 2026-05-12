Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAB3876DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 05:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563970; cv=none; b=Zg5MSvdCrh5UF+IR0ugEHNm7B4kdsD8ZVK4MwJ0NaTCw1bExsozWNYRvT+/wkuhA+z1ogAo0wzFV+t3YGA+TP5S0PfKq/i7A6jjuBg34Jj+VKYePnCBuH83/vyse1qq0UxOcSorpK3+Pm9smspqlH4xa+JGBV1IEqnAYh1C+GMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563970; c=relaxed/simple;
	bh=9IcveBS9oOob0c0hrMKH4uuGApD+QgWC02heab40yPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0WBSb3Ha/A50HZDFJZxR/C8SnvgGEldsj9hs0gM5ifRpv4+/ct0frHT0a2JmU2Vs3vXncn9T+Y1Bx1WPvHLRwgi7D4ZFUS2BFz30+Fe27jEDIJC2y/ccmBpRQFpGC29tYSCukwTvYp0WUitBVGUb3XmWy93vX1TJPSHQ2UZGsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjHn0qHs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjHn0qHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778563968; x=1810099968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9IcveBS9oOob0c0hrMKH4uuGApD+QgWC02heab40yPY=;
  b=jjHn0qHs5tV2qq/qVaPkKGTKHrnHQZIqBkyrrZpEtRhg+9C0Ha1fYVON
   aZc6AyQQz9uNZAazg8h6gQmlhKReAUa+o1S+GA4AnFj9AmB2moyCYobN8
   kLc/GBqP+Wmd0fpsjB1hPpmPkh8B8TT7wh8XWy2UyT/GGPc1UpUD3N3lW
   qkqw1DEg+nR2P/O/W3gTuzUuwWuSJA43AwBeA2aTYMg0/pQKXgcojGqUL
   7ZaHE3ml0nJrFmfK9nyUD9cY83ek3VEZ5JoMHMm/OyiZmGLWpWDZaAE0O
   G6fkH8YbV6LA57GNbTyvbS5X5ShgonJBLearMSeqPrFq4slJqQ069k3uy
   w==;
X-CSE-ConnectionGUID: 1Klu9o3nRuiupmGo4fSb3w==
X-CSE-MsgGUID: OeVmP93PSEWjU+TfQTkFCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89766947"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="89766947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:32:48 -0700
X-CSE-ConnectionGUID: o/XC5a1zRyibkF9SwNBtaQ==
X-CSE-MsgGUID: dD7W+HfmQXmN392E01uEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233352082"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 22:32:46 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMfjY-000000001dr-0g0U;
	Tue, 12 May 2026 05:32:44 +0000
Date: Tue, 12 May 2026 13:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] xe/xe_mctp_mailbox: Add support for MCTP
 transport over mailbox
Message-ID: <202605121305.VSeyI6c5-lkp@intel.com>
References: <20260504193420.1232842-4-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504193420.1232842-4-badal.nilawar@intel.com>

Hi Badal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-misc/drm-misc-next drm-tip/drm-tip linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/xe-xe_mctp_mailbox-Add-support-for-MCTP-transport-over-mailbox/20260512-014830
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260504193420.1232842-4-badal.nilawar%40intel.com
patch subject: [RFC PATCH 1/1] xe/xe_mctp_mailbox: Add support for MCTP transport over mailbox
config: i386-randconfig-017-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121305.VSeyI6c5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121305.VSeyI6c5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121305.VSeyI6c5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/xe/xe_mctp_mailbox.o: in function `xe_mctp_mailbox_fini':
>> drivers/gpu/drm/xe/xe_mctp_mailbox.c:147:(.text+0x81): undefined reference to `mctp_unregister_netdev'
   ld: drivers/gpu/drm/xe/xe_mctp_mailbox.o: in function `xe_mctp_mailbox_init':
>> drivers/gpu/drm/xe/xe_mctp_mailbox.c:166:(.text+0x2d0): undefined reference to `mctp_register_netdev'
>> ld: drivers/gpu/drm/xe/xe_mctp_mailbox.c:175:(.text+0x37c): undefined reference to `mctp_unregister_netdev'


vim +147 drivers/gpu/drm/xe/xe_mctp_mailbox.c

   123	
   124	static void xe_mctp_mailbox_fini(void *arg)
   125	{
   126		struct xe_device *xe = arg;
   127		struct xe_mctp_mailbox *mctp_mailbox = xe->mctp_mailbox;
   128		struct net_device *netdev;
   129	
   130		if (!mctp_mailbox)
   131			return;
   132	
   133		netdev = mctp_mailbox->netdev;
   134		if (!netdev) {
   135			xe->mctp_mailbox = NULL;
   136			return;
   137		}
   138	
   139		if (mctp_mailbox->wq) {
   140			mctp_mailbox->running = false;
   141			cancel_delayed_work_sync(&mctp_mailbox->work);
   142			destroy_workqueue(mctp_mailbox->wq);
   143			mctp_mailbox->wq = NULL;
   144		}
   145	
   146		xe->mctp_mailbox = NULL;
 > 147		mctp_unregister_netdev(netdev);
   148		free_netdev(netdev);
   149	}
   150	
   151	int xe_mctp_mailbox_init(struct xe_device *xe)
   152	{
   153		struct xe_mctp_mailbox *mctp_mailbox;
   154		struct net_device *netdev;
   155		int ret, err;
   156	
   157		netdev = alloc_netdev(sizeof(*mctp_mailbox), "mctp_mailbox%d", NET_NAME_ENUM,
   158				      mctp_mailbox_netdev_setup);
   159		if (!netdev)
   160			return -ENOMEM;
   161	
   162		SET_NETDEV_DEV(netdev, xe->drm.dev);
   163		mctp_mailbox = netdev_priv(netdev);
   164		mctp_mailbox->netdev = netdev;
   165	
 > 166		ret = mctp_register_netdev(netdev, NULL, MCTP_PHYS_BINDING_VENDOR);
   167		if (ret) {
   168			free_netdev(netdev);
   169			return ret;
   170		}
   171	
   172		INIT_DELAYED_WORK(&mctp_mailbox->work, mctp_mailbox_rx_handler);
   173		mctp_mailbox->wq = alloc_ordered_workqueue("mctp-mailbox-ordered-wq", 0);
   174		if (!mctp_mailbox->wq) {
 > 175			mctp_unregister_netdev(netdev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
