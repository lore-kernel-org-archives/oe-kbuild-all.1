Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E41CF92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710539069; cv=none; b=Br84PXvCmWYgQQkCx9Eg0oZZh4nI6uy13sXrMKD8DcZPfScF4KKfqJS9TqcDOj5lVjMG0sNvzIJftHPDSTmJOuegI2NzF3JEF3BJIFDzU4WHBxLkHEcwWCTa4Z3wFkmHesJZaZwhaoZBSf43C11kRvT7f/RuycSr/MAIDYd43po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710539069; c=relaxed/simple;
	bh=Vc68BX9M37hBcSzBZecsWwCYOHNZgEWJfCZ8h1c56y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URF4dN7lqr2Xch4smIiJGW3oxfZ1Lk0H22OIK9jOgcI3dQ9olO92QR1Vxo5aqYiMVuEhNgpcU4YrH4xfertNHiotVH1ov094Jdz4E1CQ08NaOg6yJQz/FQhblPM/821gQZshMNft548Z7TwxqYxJN80HqxOrFePhSJaXUahbwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSwoDIdH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSwoDIdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710539066; x=1742075066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vc68BX9M37hBcSzBZecsWwCYOHNZgEWJfCZ8h1c56y8=;
  b=jSwoDIdHisXQWtK8l13SzxsqAUCtEgAd8DNft7XUTL96sYKNuBbFSfD2
   LNaKQtRoWhQf8vW9WJoaIiT7ZL2ZDpj0nfwoHuD7cTyPovqkT+6tkXw8f
   yPt1Th5K7+X9RqZgPoCXnDCbvHMgoQ/+we23XG/29O0MjofIgwYKupsgL
   ULgfwOreG5nRBndKNoNopyjD0qYpEVlCWlcXwk3sm1EA82lb0Q2gUWIYr
   HUuTEGnuoolYhmzpD5Sdt5f8NMuRFz8TWw0yhYqBioGa9EVTuPpzP27nL
   Jo7i0j/Kvxohy+oSKVvk9o2rr0ulyBzzH9i/Zr88ufLrqYjwxZ28c6MOc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16077961"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="16077961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 14:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="35935716"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2024 14:44:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlFLh-000EpN-1t;
	Fri, 15 Mar 2024 21:44:21 +0000
Date: Sat, 16 Mar 2024 05:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Antoine Tenart <atenart@kernel.org>, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, edumazet@google.com
Cc: oe-kbuild-all@lists.linux.dev, Antoine Tenart <atenart@kernel.org>,
	steffen.klassert@secunet.com, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/4] udp: do not accept non-tunnel GSO skbs landing
 in a tunnel
Message-ID: <202403160550.1TZ0mDSX-lkp@intel.com>
References: <20240315151722.119628-2-atenart@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315151722.119628-2-atenart@kernel.org>

Hi Antoine,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoine-Tenart/udp-do-not-accept-non-tunnel-GSO-skbs-landing-in-a-tunnel/20240315-232048
base:   net/main
patch link:    https://lore.kernel.org/r/20240315151722.119628-2-atenart%40kernel.org
patch subject: [PATCH net 1/4] udp: do not accept non-tunnel GSO skbs landing in a tunnel
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20240316/202403160550.1TZ0mDSX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160550.1TZ0mDSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160550.1TZ0mDSX-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/ipv4/udp.o: in function `raw_atomic_read':
   include/linux/atomic/atomic-arch-fallback.h:457:(.text+0x4b28): undefined reference to `udpv6_encap_needed_key'
>> nios2-linux-ld: include/linux/atomic/atomic-arch-fallback.h:457:(.text+0x4b2c): undefined reference to `udpv6_encap_needed_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
