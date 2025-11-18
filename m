Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF63195F4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435005; cv=none; b=hXwbYpU6gwaE5CeeB6ms7tdi2vI5+/x1ywlwFRCbccFKGdEOVKaBIC/KC9A0YgZLtsQdtuV/FjGalCzjHNYg0bJHj+YNLdQ9D8GNGp1RgGy+QZ1ftbdAARgV5Mi4HM6dhck5b9oLqCOsAESVJj5INWUsLWKHTd+vPslvtb2IMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435005; c=relaxed/simple;
	bh=aKjYm75Bkh3y9SdVm+oaCcNdXAUhDi95tf/RjvBmA/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVL7kbMlZhJE1mqlmOIVKlJw4S0oalykx6jrJ2PvfD64smu37c90H/QRD+aWXwpy1E2O9ACNDsz3GC2tgJMaHzWPDm3wGpChNYvS0HOWq3VQJ6RkN/5Z9Mg/489MIqqXggRAEP2G7bITCB9PFaRt1zg8doWEy/2f9EkBXBJ7b4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgk3V4/b; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgk3V4/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763435004; x=1794971004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKjYm75Bkh3y9SdVm+oaCcNdXAUhDi95tf/RjvBmA/E=;
  b=Qgk3V4/b48nlFzWDsgbzNb/pGusW+bLOyWMKzMLEjOL7JesEkDowNpFF
   C0ngfUaXdy54XtsSkQzSEsfLAc0inADKr8jobnadIbEXN8puyASK8AGJP
   2qUyIIfdyl3LtDj9lOp9CLy7xZsmdqoIQOQtEj9I2aQS9O1mvF5h0GRpY
   d510sS4yM9leUxO+c1LULeIjS1Y3ngImO9zEIjP51nrJ4BHfv4JgndSKf
   NlAH7NbPtAX9g8w7MBy0JZVmf9drqJKDa3L8eYKvE9YKBz3j/ilQep52r
   2WP/DYnSJBzsznGtDmcqA0Id38LGODEpNa9r7iXIQl1+wYJVyH9hYDvG+
   A==;
X-CSE-ConnectionGUID: uyMQG7BcQwSObhIhEVv5kQ==
X-CSE-MsgGUID: gyr1aFnUTOS2nbikxOqLHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65479383"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65479383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:03:23 -0800
X-CSE-ConnectionGUID: VNyzkYtGQQyPAy4OgwjlNA==
X-CSE-MsgGUID: dYqinpIpTuSqK/pA7jD8kQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 19:03:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLBzz-0001H1-2N;
	Tue, 18 Nov 2025 03:03:19 +0000
Date: Tue, 18 Nov 2025 11:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.11.13a 25/27] ERROR: modpost: "tasklist_lock"
 [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202511181007.iHxSV1IG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.11.13a
head:   38cc1fc7cc9d7c9ed5275c1e78256431da7721c5
commit: 8b6753ddeaa69d04d6ff8b3bee0bf81a0607d396 [25/27] rcutorture: Add a textbook-style trivial preemptible RCU
config: x86_64-randconfig-101-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181007.iHxSV1IG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181007.iHxSV1IG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181007.iHxSV1IG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tasklist_lock" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
