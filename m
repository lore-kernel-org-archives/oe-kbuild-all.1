Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BAC19539F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774757237; cv=none; b=rIwTmYLMByszmAQbPb/VR/wLCBDPjQykaQsOMfIGIoojrv9L2q/zcC14MGtWNyae6927XjlN5U604O6qWISLV4UzZovTW7nyxuQu7Wg2F+W7MfQV1E0IEc3wU7A5TxDLCJ3OTPGxe5U/c4MJ4a5WPjQRDwSVmwcT//qVURgBqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774757237; c=relaxed/simple;
	bh=gWeKNb1ClJWFYIkENDXGlY3FE8uiAbU0wSsHJ5klDlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxTYHAmUMYPtaQivKesxABrGa8ENOkIC2KWKUxNH8Gi9jLMwdK/wLjn8YCijHaQPvtZS/x7t+vTwIpC0+imu3qgbfa3jAq2eVzfX6bAcMNH4zMf+ODYonfrz//1H/5+dZh3q9anb1MEUqYpcZQSMG2BF8hqPHvRGGaywwf0VEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be3ny/VC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be3ny/VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774757235; x=1806293235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gWeKNb1ClJWFYIkENDXGlY3FE8uiAbU0wSsHJ5klDlo=;
  b=Be3ny/VCFP3bMBQUTDYXwN3Hxs/O/Mmj3lTuznyRNwTH9vPLhOmOnRry
   lySMZqcvlPV8kPHRd9OB1u7ASpiOb2orbkYNc8alcO/uUWkymjvMDPN8e
   ww/iv/ViOk1F5O4+I8NvihDLkbJlzO0UArlBP8ENg59JK7pl/YNyqeazR
   Yd3G35/9pY5+AdLts1dci3ZgyCs6q7GrznPskaDMzfCqgNd1Cw1AM52y8
   HEnGpmK89xp5oNyAWffAdHWCeicTxeFj2seK8fEgkAVxWdx53FL2KF98b
   kXeMOMvk6fqzr7mzk7w84+aVqC8Ns3hAxJv+EGhsUZNlRpDFW9amiiqYY
   Q==;
X-CSE-ConnectionGUID: RD0xrz/2QxmtmJpiXHJzjg==
X-CSE-MsgGUID: 03BtuATKSvGEEsVW3ioOBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86401904"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="86401904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 21:07:15 -0700
X-CSE-ConnectionGUID: umSWqpfZQ5q0kWaT3+XgLg==
X-CSE-MsgGUID: kVj6EjhKT2OqCKxbc+mZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="221306879"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2026 21:07:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6hQc-000000007pF-0XGX;
	Sun, 29 Mar 2026 04:07:10 +0000
Date: Sun, 29 Mar 2026 06:06:41 +0200
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH v1 net-next] tun: Ignore tun in netdev_lock_pos().
Message-ID: <202603290603.7d9NDw4e-lkp@intel.com>
References: <20260327213441.3781433-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327213441.3781433-1-kuniyu@google.com>

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/tun-Ignore-tun-in-netdev_lock_pos/20260328-220059
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260327213441.3781433-1-kuniyu%40google.com
patch subject: [PATCH v1 net-next] tun: Ignore tun in netdev_lock_pos().
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260329/202603290603.7d9NDw4e-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290603.7d9NDw4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290603.7d9NDw4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: net/core/dev.o: in function `netdev_lock_pos':
   net/core/dev.c:540:(.text+0x86a6): undefined reference to `tun_link_ops'
>> s390x-linux-gnu-ld: net/core/dev.c:540:(.text+0x2b5ac): undefined reference to `tun_link_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
