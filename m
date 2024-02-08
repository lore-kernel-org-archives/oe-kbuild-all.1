Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9A6F07F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707392684; cv=none; b=blTvGFZ6D6qU2UBTDiqx2l6AFJ0TTCAvHpF2E9OSMAeEgvPYdUKk3ExzNgI6BILXE7SC/tQKwAFg6b8S6Q25VJdi/kEAdto+XUjsyz5UNZI1QvlIKwxSLTwUZfbiALeXMZN9w8GYfnc7waqq0QX/lzISgQOBieDZP+7+SEv035o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707392684; c=relaxed/simple;
	bh=lOAHdzmr0PQEFArj3ZMdD8eohr+lx+Fn2fqPWHWmXY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwtawKdsIJbYVhvZoU5st1wAFuiy9GSHx1GgC8Fq+5isXQQVJ/d2zoMfYJmDNCTisHA+V5EdcFvee2mwAbqqmpIVvt0jXw/RhoI1lCGij2w0GpoaDq5kpptRRLdhIwvtYvE353Y05uqDkLlE0Cg1+rnk7eHlGY1eHsJAtgR7KJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e71uCRZX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e71uCRZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707392683; x=1738928683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lOAHdzmr0PQEFArj3ZMdD8eohr+lx+Fn2fqPWHWmXY8=;
  b=e71uCRZXR5N1D0p9RblEGct5c3HU/Ifh2D3al0Gw5yDPO1EUTuiulapK
   b4g+8Hpo4qZjGB+TCp6r41PB7deyufpgjF4AMVGP2qd+JRxiDX0GW3Zxy
   70Dmh1x4KUs2XatgIG9/Z/UxLRs5rgkJYcVOVUS8xOr/GF2EuocH7Nn1a
   4HzAqW5rmatNJ8lI5AOgsbyiRq2LqfzqXX7nQAxFs2WDLIguTwCcugykR
   +MLXl7PiK1ce2uM5iGvvtOiNjKBK15nAXRIAgZMwAteboxmFvMiux3JLC
   VaaM8K0mhgRjekeO6326wzy4q6mVbAHzB4jWZzoV34QtkmvZeriAc2oWB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4182259"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="4182259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 03:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="32445696"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2024 03:44:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY2pZ-0003i4-0u;
	Thu, 08 Feb 2024 11:44:37 +0000
Date: Thu, 8 Feb 2024 19:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 10/13] net: add netdev_set_operstate() helper
Message-ID: <202402081918.OLyGaea3-lkp@intel.com>
References: <20240207142629.3456570-11-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207142629.3456570-11-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-annotate-data-races-around-dev-name_assign_type/20240207-222903
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240207142629.3456570-11-edumazet%40google.com
patch subject: [PATCH net-next 10/13] net: add netdev_set_operstate() helper
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240208/202402081918.OLyGaea3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081918.OLyGaea3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081918.OLyGaea3-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: net/core/rtnetlink.o: in function `set_operstate':
>> rtnetlink.c:(.text+0x1220): undefined reference to `__cmpxchg_called_with_bad_pointer'
   sh4-linux-ld: net/core/rtnetlink.o: in function `netdev_set_operstate':
   rtnetlink.c:(.text+0x17a0): undefined reference to `__cmpxchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
