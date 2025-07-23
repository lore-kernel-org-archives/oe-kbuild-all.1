Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B061CCEE0;
	Wed, 23 Jul 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753285958; cv=none; b=esqfVVs89s5+zX30AQtmoOKlHKsnEVNH3C9vrOBj322alRLwtnPFQV+x0tlpNkYcFlu31nt5qgBrxLsHDQ9yY5KeF8bqMsBgDrcbUdvTC1xYEfaVEpacD2e6JzBi1rz+OZ3sPZZJMMfFeumKNw5vGV/sD5yi/2YFeqz65cV8qVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753285958; c=relaxed/simple;
	bh=UOmggXegZ3I7AUbaO4eA1lGNTCljsX3RiPVrPuISBFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZITDuIE89+b4S0/hfCQmnPdrznyJmPe5yTJ7sYuqIB8yeCpBX0tipGiwEAzDy3JSzEie9azaaIwX43ci0RMmAlICFVeerFUxNyMK0YZbUWYKleBQItsU92yJ1E8XBhp5NPbWG9KOZ/m8BIUQdD9nLJmzXx0IHjVx593AIvAXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqYIm+bS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqYIm+bS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753285956; x=1784821956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOmggXegZ3I7AUbaO4eA1lGNTCljsX3RiPVrPuISBFw=;
  b=TqYIm+bSHEYpQkYvvFQNFnD06b2/KX2b7cuifzYVGr3AE88rQJN4LXyu
   yX+bI4YUIUS785Ow8k3Bug9n2R9EWUYuEGppINFFRoZ3GOENF+mbIDv1c
   eIb5jLG1Hp6KDIJJDbPvNQMv0NMlDYbGrkIBLkpEG/0R4yvZ0JOtLrguj
   tGAFSJIQGW7LksLPQcvirkBEFJxGc440bElh0HsGkci3yj+cgcCkWfaLN
   D0X9bDhlWl+ZfwaKJlDRdw5z4jfsZmB/WLlJwVyq5Ye5KOgOtFnndmod4
   /T8BNv0Di5nV/OGz+Ne1LJ0Wf5fYIZtTnsbO90//VM5+FNmjaas5Qtj4e
   w==;
X-CSE-ConnectionGUID: TjXvdg3kT1u8t0UZuU9rYg==
X-CSE-MsgGUID: FXiEmtY3QIqeO4fl3tX/MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66271353"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66271353"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 08:52:34 -0700
X-CSE-ConnectionGUID: 2oT4088jRjGtJKukWNNCSQ==
X-CSE-MsgGUID: qImF+t5SQlqYvA/5KfLGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="196690540"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jul 2025 08:52:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueblc-000JVH-2E;
	Wed, 23 Jul 2025 15:52:28 +0000
Date: Wed, 23 Jul 2025 23:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, jhs@mojatatu.com, xiyou.wangcong@gmail.com,
	jiri@resnulli.us, sdf@fomichev.me, kuniyu@google.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in
 dev_qdisc_change_tx_queue_len()
Message-ID: <202507232358.OuGr01a5-lkp@intel.com>
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722071508.12497-1-suchitkarunakaran@gmail.com>

Hi Suchit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master horms-ipvs/master v6.16-rc7 next-20250723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suchit-Karunakaran/net-Revert-tx-queue-length-on-partial-failure-in-dev_qdisc_change_tx_queue_len/20250722-151746
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250722071508.12497-1-suchitkarunakaran%40gmail.com
patch subject: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
config: parisc-randconfig-r072-20250723 (https://download.01.org/0day-ci/archive/20250723/202507232358.OuGr01a5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232358.OuGr01a5-lkp@intel.com/

smatch warnings:
net/sched/sch_generic.c:1465 dev_qdisc_change_tx_queue_len() warn: always true condition '(i >= 0) => (0-u32max >= 0)'
net/sched/sch_generic.c:1465 dev_qdisc_change_tx_queue_len() warn: always true condition '(i >= 0) => (0-u32max >= 0)'

vim +1465 net/sched/sch_generic.c

  1447	
  1448	int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int old_len)
  1449	{
  1450		bool up = dev->flags & IFF_UP;
  1451		unsigned int i;
  1452		int ret = 0;
  1453	
  1454		if (up)
  1455			dev_deactivate(dev);
  1456	
  1457		for (i = 0; i < dev->num_tx_queues; i++) {
  1458			ret = qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
  1459			if (ret)
  1460				break;
  1461		}
  1462	
  1463		if (ret) {
  1464			dev->tx_queue_len = old_len;
> 1465			while (i >= 0) {
  1466				qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
  1467				i--;
  1468			}
  1469		}
  1470	
  1471		if (up)
  1472			dev_activate(dev);
  1473		return ret;
  1474	}
  1475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
