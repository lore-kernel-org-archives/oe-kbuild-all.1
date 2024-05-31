Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC451178CEA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717176793; cv=none; b=omJ33dWxvswd5NgpdmG4JnBmVwpYYA/T5DnNbCkgt9GRD8b6X59eDHDpM6ZcGWoCt63pvaOkmqwx2rebQlTQCsf+TjLCHQNROIofHOEleMevBtn31IKUPHnfrmvFGYVhUfe5Woby8s2TwAi91lsJ+rWvuwmUX4Lcc8syCFusjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717176793; c=relaxed/simple;
	bh=Iz2IxoSLx0mYAaS6/wqJ6kAq9yl19RcojIN+J4H87qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skiZXlVYNk317ZSiqdDBIsCA6P8JhhIYF6Kb1vNUMXLoT2RcoCTCmFz4OPc3CJ0rjx2k1acHgyIAzBlXFh1pd3sgQNaAeCK9x4OLp1JWovUUdn8wtXYX3ePzANI3OI2zVoaTAD5+vvUIcUuiJiCDPoTxOrU4bis8dd+hN8z7uMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqCIp0zW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqCIp0zW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717176792; x=1748712792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iz2IxoSLx0mYAaS6/wqJ6kAq9yl19RcojIN+J4H87qQ=;
  b=fqCIp0zW0MRY8CWMWdSSrP5a/hfynqcb0YRFeeEQxlYuRkDwQPGRcOfh
   ClKS0Cd+UeZ81rs8YCyqRD/sL+IIs83E16v+6twcx9Dg/T6l4x/nXVCyi
   HJ45jAGSDAGHqJDXFo3Fh4norITXREpvWsA9OuQzrEsq27tsdot71nV6j
   g8Qei0shhNIIglyetSWqSB6AWvu4bcv2Z3BbGiK7JpQEYvAB2EXu99UB4
   8+N0DEe8HMtfFxf+snGlN5SJxxYnJn/bZtlA4VnWplrNMHAxrQlQZZzAU
   CFxhtnCOZP2ypGNX6mzCQbsAKgyOvvCC2tI6JMnxAPZqOuK3bHeikSOmn
   A==;
X-CSE-ConnectionGUID: pzTPqzBBTeO3REgk/3GIZQ==
X-CSE-MsgGUID: 0p/tx69BSE6PuBwzQnYw3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17530208"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="17530208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:33:11 -0700
X-CSE-ConnectionGUID: pDrSoQvMQwWM8ryj8Cs1Zw==
X-CSE-MsgGUID: d1uYIgx1QQatUG41TXGXkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36810105"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 May 2024 10:33:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD67j-000Ha1-0v;
	Fri, 31 May 2024 17:33:03 +0000
Date: Sat, 1 Jun 2024 01:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 3/3] dst_cache: let rt_uncached cope with
 dst_cache cleanup
Message-ID: <202406010139.PSZGIJkQ-lkp@intel.com>
References: <cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni@redhat.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/ipv6-use-a-new-flag-to-indicate-elevated-refcount/20240531-012716
base:   net-next/main
patch link:    https://lore.kernel.org/r/cd710487a34149654a5ff73a8c0df9b1d3fc73a9.1717087015.git.pabeni%40redhat.com
patch subject: [PATCH net-next 3/3] dst_cache: let rt_uncached cope with dst_cache cleanup
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240601/202406010139.PSZGIJkQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010139.PSZGIJkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010139.PSZGIJkQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/core/dst_cache.o: in function `dst_cache_set_ip6':
>> dst_cache.c:(.text+0x21e): undefined reference to `rt6_uncached_list_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
