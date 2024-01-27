Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C831F922
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706396408; cv=none; b=BsDurk6czIwTLpHutmWHGPvS8pTCQTZflT76fwE5HJX5by2JiDZvqvD3+6U0fj2Qmr9UQF15FSzJLxsSt/9TQ2DWg4SWyBoqa/MTjwueLjCrw+rvZvZIDFU3S0FMeZ8AEvYqk4aPwXZ9PK5Ux8zVcv33l+Ob4p1pZWRNVcVGwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706396408; c=relaxed/simple;
	bh=nS7w60VYknLQVmyGdVe48pCs+8xLFp0YcDrl9DsIfAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0yMoyBMgj34SR04+8HovXcdIgK/c7CDqCkI/3A8fprP7N5P4gJEWIUFI9cSh5SqU6R0wE5hRe5yaQVRqgB6gfyC8vZBmVJ2aoE+eHO/hLlxFUs79J/CbJwJRWzHBO+BiSqKKWDzlCr0C99Z6mkwqNaYcZomPLWfUlheCQdmpmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYAbn7Xh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYAbn7Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706396406; x=1737932406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nS7w60VYknLQVmyGdVe48pCs+8xLFp0YcDrl9DsIfAQ=;
  b=kYAbn7Xh+6FVJcpOqCAj7qHo924I7RiL+M9U22sQ5aEFO0khXExGfCO+
   uSplT+iWjhLIsnyST0Usw5hOYjJYTPx5GwnrhB0BP4+xtTNkdwS8DJ86A
   fbsJQeF87HA3Ytgk4r3VgSy/fy0cRyYRocRv2qTUNxsGXabpedzuOEbKM
   4zWZC/nBjaIk0TOjO8gd5j+R0eY1ZfquXcD8UqjWiG8seK+wIunzIs8sN
   IRkpRkeHGlnhSFII36RaoYat/8Brka8F5sZduIB+Jf5ddJHd2pE7Q0H0b
   noIgzgsx7aBJjLvvdxKurC0rlOY6qZC6ngZfP+oeY9TcnnduQwgn/tiIY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1654832"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1654832"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29419309"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2024 15:00:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTrec-0002pk-10;
	Sat, 27 Jan 2024 23:00:02 +0000
Date: Sun, 28 Jan 2024 06:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [netfilter-nf-next:testing 8/9] kismet: WARNING: unmet direct
 dependencies detected for IP6_NF_IPTABLES_LEGACY when selected by IP_NF_NAT
Message-ID: <202401280639.UllnB3ie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   bce197d1b01d778a734ee15b19a48ebc2b41390a
commit: 3076d3576759db157092ee7db5a9087d2ef01b00 [8/9] netfilter: xtables: allow xtables-nft only builds
config: alpha-kismet-CONFIG_IP6_NF_IPTABLES_LEGACY-CONFIG_IP_NF_NAT-0-0 (https://download.01.org/0day-ci/archive/20240128/202401280639.UllnB3ie-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240128/202401280639.UllnB3ie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280639.UllnB3ie-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY when selected by IP_NF_NAT
   
   WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY
     Depends on [n]: NET [=y] && INET [=y] && IPV6 [=n] && NETFILTER [=y]
     Selected by [y]:
     - IP_NF_NAT [=y] && NET [=y] && INET [=y] && NETFILTER [=y] && IP_NF_IPTABLES [=y] && NF_CONNTRACK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
