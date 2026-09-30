Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BA851B17E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791390; cv=none; b=tJYFgcPT+pkhnpEY5FaitdmB6mIO10vc0dsDOUSu89rajYZh+2p0X5TMBmfA8WSvEy3nwjOVVLT1ZUrWFSr0RP5kuve4ZrDf1SQlupegEauWgnPrU2yPHTTpOydZTw1icpdimH8BgqFDYU5Y1Cd0wRAyy0EEzanGsBVlWJkPug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791390; c=relaxed/simple;
	bh=s5McnjQZvk/hYC3PO6FKH5rbyWd/9QQUfZQXYanC8nQ=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBB899uz5ixTE26V+FyVemO4FeY0dLguTWsHHRcyLbFy6guA7n+C/P3FHkQGDLIbKzlc14OBBywC8QY2FeHI9mt2T0otz+3PaOipuM9hPvqeFYBaIHkDMQOS/5iHuBjr48neH3ccpT57CXXjiGlHugPPG2mgzFCZ3sXsuKh7rGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPUbmu78; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPUbmu78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790791388; x=1822327388;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=s5McnjQZvk/hYC3PO6FKH5rbyWd/9QQUfZQXYanC8nQ=;
  b=cPUbmu78T1ecZ4RDr6L3NpKf59+RyXkQHbdqDlF0nJ0aamwlDRHGyF61
   5PxTM4kz25UZ72suTm7wl1sTatPEfYci2kwoslPyiIKmhKHERx3zI1EoF
   3bsCBzW0Ofwx3pl4zbCqRIbc5vavMYY2aaK4CR6Dq67Jcvxi3ptsW9802
   TIa63F+yTybY6gaH8ly5uXucDPFaH3g2gk/lVqh73czBDvnQKrLrRSnvq
   qQZrQSUFVehARLTdXSM3X29n5x41mMjqK377yk16ciL5ahGsjGZZoIryP
   mqM27cHtqXDl5q2XoZVrnyOov4B4Xz0+nVKLI1Cj4PKBXNaiHaF0eo6cc
   w==;
X-CSE-ConnectionGUID: O6RCPQ6oTaawZboNg36BHA==
X-CSE-MsgGUID: 6SF9xpCiRkCblcH/m8ARAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90670151"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90670151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:03:04 -0700
X-CSE-ConnectionGUID: +YmXu2ORSou4oN/J1VwD2A==
X-CSE-MsgGUID: /An3tz2nT8avmuNczpiM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="313694384"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2026 11:03:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBydw-00000000QzG-46zU
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 18:03:00 +0000
Date: Thu, 1 Oct 2026 02:02:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: tcp: Add TCP ROCCET congestion control module.
Message-ID: <202610010120.teosc4lh-lkp@intel.com>
References: <202610010120.teosc4lh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610010120.teosc4lh-lkp@intel.com>

Hi Tim,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Fuechsel/tcp-Add-TCP-ROCCET-congestion-control-module/20260928-171154
base:   
patch link:    https://lore.kernel.org/r/202610010120.teosc4lh-lkp%40intel.com
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20261001/202610010120.teosc4lh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010120.teosc4lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010120.teosc4lh-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/ipv4/tcp_roccet.o: in function `roccet_control':
>> .tmp_gl_tcp_roccet.o:(.text+0x23dc): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
