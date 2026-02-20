Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2287322A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568289; cv=none; b=uYfBqt/kVc7yHsUj8EeDX+zzniwHiNkW32aoto/g0qmHy8qEaEeTc1YB+rIkOsVbo66xp/Atme+AyFK6NIK7GOgT+4Iec08rrgwontGkFugkkv0QmnFd5ksCOoJfGmVpju1tay7xac0WTUj0SQLUfytZF2Chsd/RMc/k49XRcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568289; c=relaxed/simple;
	bh=mZnZx8EnhGB8nR1tC/rsTKQ187O7k8yDgpkPcZK8kHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI9PbrjIr13zZzm8HMh8228SNRp1C+kXo7aXOQVMZk2cO9/+MqNaz+PJhigIntghBOBcfQTEi+OEcv98o4chUrPeFjpF6NXyFjeJr0RmzzItBJJ06t+4SSZphun9Excl+nQgy5VqpsY8F+5JnWb98EbXk9U6nxioJQ37LDTvVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZN52lPt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZN52lPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771568285; x=1803104285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mZnZx8EnhGB8nR1tC/rsTKQ187O7k8yDgpkPcZK8kHM=;
  b=PZN52lPty72ABe6Gzivcva6yYivIjJ2UT4vCd04GhCxFe6B2uEId3/L/
   MJaMe329GBn95q/FzZ6JABjqpvaeg6mKgPA6VI2/ImEgRP0xbwp+bLNIb
   /bexiHWFu4KF6hhr/wB5c6nSbGp6ethkzDKFNHiNgnSjPTrtIBhsTNZtD
   pq4bSTTRLeGbR2qKlN/Fqt39qIhj4ZEClpqd5723OWLS1yR1rFWOCPT7Y
   kp6UdSuAMxyH4qrKaYSAkHWMgRIZk+s//H9ZFuM3xMx5gOZK+I7dIUJwh
   Q6YpAIvom/7aZBxVrsEWd2s/dcwXb9E15bhpuGPcaQPpo6syPANaxGkJM
   g==;
X-CSE-ConnectionGUID: rRJ12wkWQoqqxTjrV/6oMg==
X-CSE-MsgGUID: VovwpyC3SVirL7zkAgAB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60236583"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="60236583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 22:18:05 -0800
X-CSE-ConnectionGUID: zpQLEjETQB+EvLNDYDduEQ==
X-CSE-MsgGUID: eg4a2n0bQS641+Y7zSycFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212918155"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 22:18:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtJpv-000000013s4-1vP8;
	Fri, 20 Feb 2026 06:17:59 +0000
Date: Fri, 20 Feb 2026 14:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ivecera@redhat.com,
	Petr Oros <poros@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
	piotr.kwapulinski@intel.com
Subject: Re: [PATCH iwl-net v2] ice: fix missing dpll notification for SW pins
Message-ID: <202602201417.eTuOe57F-lkp@intel.com>
References: <20260219131500.2271897-1-poros@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219131500.2271897-1-poros@redhat.com>

Hi Petr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Oros/ice-fix-missing-dpll-notification-for-SW-pins/20260219-211758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20260219131500.2271897-1-poros%40redhat.com
patch subject: [PATCH iwl-net v2] ice: fix missing dpll notification for SW pins
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260220/202602201417.eTuOe57F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201417.eTuOe57F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201417.eTuOe57F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/ice_dpll.c:2625 function parameter 'p' not described in 'ice_dpll_sw_pin_needs_notify'
>> Warning: drivers/net/ethernet/intel/ice/ice_dpll.c:2625 function parameter 'active' not described in 'ice_dpll_sw_pin_needs_notify'
>> Warning: drivers/net/ethernet/intel/ice/ice_dpll.c:2625 function parameter 'old' not described in 'ice_dpll_sw_pin_needs_notify'
>> Warning: drivers/net/ethernet/intel/ice/ice_dpll.c:2625 expecting prototype for ice_dpll_notify_changes(). Prototype was for ice_dpll_sw_pin_needs_notify() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
