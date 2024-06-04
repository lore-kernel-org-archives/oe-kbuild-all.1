Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EA142E63
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491035; cv=none; b=KfDgeB3Tm2aDNZNgacXq3y+UnlRyAX7nm1Wsv2J6uJYIFL4rWE3IFZLn45tKKxuVxBCCl++RKvRw+lyKPkQDtQYN92IEpDniZeJezcOqsjCe7wIHXtfzAe5UTJcWwWkFQ9AZuqWR5od2KXiyFN5AJc4ysGHHSMdU4Cia+cZl5t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491035; c=relaxed/simple;
	bh=jsePevRiIhDkdVXD80oV8Y9zSm3mcSPIVKYbBwvy7G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDk+0TughWtUWFYPALEMPQonH0Go1sJbos3kIKMwopqOg1DwOvY6gX+mOuufH4T3r1h0NVoebJzX8Zz5AHEpWaFKzXYV5cumwqJOLTFuvwp3jPkTPGWlANBddfEbuAyj1fRReLt5TJ/E/Sd2LahBmjBYqxcyqs627xklYjE1kY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqWoI9cj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqWoI9cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717491033; x=1749027033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jsePevRiIhDkdVXD80oV8Y9zSm3mcSPIVKYbBwvy7G0=;
  b=IqWoI9cjwhq3FUWxriqiF3RYvXfjiCAOOH9LEyuSNgtt2vbq9GWVvQGv
   qBL8ALuavJVS0w9M1AVuKX04SmH7oXWWXOskFMj2Tn9C9yuIvGOOvLJuL
   ofXteosDh+iyq/PxJi3VNoLHR9tZhp73KcbzpJB0v1Kwc/vfH7KEJhlpS
   pI9GM0RAEl01A0YnMc5v7IgviLAK/aFqHXo1L8th+t6cMVfoU/8u/p1cY
   gIWiYFF1QYfeHxPdZxLmDjQ8MbSnqqxNazyIc/vhRmsAUAYr5gLRVfauN
   m74rhn+JNRkGIXoqHJaVCcZnIrOjNftxN1+njkoGjiY5a2B35gXg7S5Zb
   A==;
X-CSE-ConnectionGUID: sGOpnfXQRWqzkc+TGCmsSA==
X-CSE-MsgGUID: 3G5nRq0MTRmU0nX8xrbAbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25422253"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25422253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 01:50:33 -0700
X-CSE-ConnectionGUID: muE7e3PGTp6QpkFk7l5Dpw==
X-CSE-MsgGUID: jJ+fMvi1R76uL0GyoUCxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37038342"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2024 01:50:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEPs9-000Myv-14;
	Tue, 04 Jun 2024 08:50:25 +0000
Date: Tue, 4 Jun 2024 16:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Moreno <amorenoz@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, aconole@redhat.com, echaudro@redhat.com,
	horms@kernel.org, i.maximets@ovn.org, dev@openvswitch.org,
	Adrian Moreno <amorenoz@redhat.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/9] net: openvswitch: store sampling
 probability in cb.
Message-ID: <202406041623.ycwsuP85-lkp@intel.com>
References: <20240603185647.2310748-7-amorenoz@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603185647.2310748-7-amorenoz@redhat.com>

Hi Adrian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-psample-add-user-cookie/20240604-030055
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240603185647.2310748-7-amorenoz%40redhat.com
patch subject: [PATCH net-next v2 6/9] net: openvswitch: store sampling probability in cb.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240604/202406041623.ycwsuP85-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041623.ycwsuP85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041623.ycwsuP85-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/openvswitch/actions.o: in function `do_execute_actions':
>> actions.c:(.text+0x214e): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
