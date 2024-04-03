Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2617C73
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712176335; cv=none; b=fZ/IBpNJJ+IyQJk3ywnOKygTqcpwl6tEh9n8CyR4ZgwD5uQtlLXFyRo9VbsFhf1kv8eFIoClM5BNiaJ2AT8Mvk7pAmFFJGv5vUrhxu+PPt/hPsyfk7OtKt5yZDc7COgvE18EKNvao9nqgVQuB9v8nvlIzM/2N2n+gmXxi+Kgras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712176335; c=relaxed/simple;
	bh=3OYhtstL2z+bP1gP3JW62xuIW+V66XZsANF5KdNbqMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUEXibp+291kewCp7jQeBwa+vB6vB5Yc9myWQYqw4QeoDI9DwJYCqjcQoVLvM0SIp2RWUT08OzqEQSgFl5Aio7ewTrH4DpN1NBTkNYIUlpTBcwPgbtlj4rYMc22ouPEDCEnu+kF3oA8Wug68VtP1O7LW8d4SfmCdXL4Klkfd2jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHcvjhZ7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHcvjhZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712176334; x=1743712334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OYhtstL2z+bP1gP3JW62xuIW+V66XZsANF5KdNbqMA=;
  b=aHcvjhZ7cy+vKf72/tbUhjxcgYehgzhUPXHldXaZl2cgj17L0WEKp2a8
   Uclz9KMI96dHqYsFYSUWQvqeb84nDYVbddmhPNw8nJsFahswMcPbuEuEJ
   yWKTpHHI40AB7hw6jH1AgPxFRyXqmYFpU82zXWMtMmZIPO8KCNxu2X/pH
   AdBEp8jM3VX0LxVD/pBqOO2g4J21PVCgSYdpLYWobMMl30fbZoRsnkFFF
   PFfELhkbxbnzzhV9ZMK3oSr2P7SyJrUj3YOcpsU7OZloy8Hmac45Ne4EK
   bv7iEefyn62yM2YM38eKd/sMEw5EcdRy2Cz2Ac+FG1RwwsSU9XJvlcd0c
   A==;
X-CSE-ConnectionGUID: sYT9HlQkRHycmkNUvaUo2g==
X-CSE-MsgGUID: bwY52oOtTA+ljzVM655ofA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11211840"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="11211840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 13:32:13 -0700
X-CSE-ConnectionGUID: 5SNMhQm+Rcy5DNTMbgfydg==
X-CSE-MsgGUID: GI4Z0O0ZQNKth0S7mddjxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="23203993"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2024 13:32:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs7HF-0000Ck-2L;
	Wed, 03 Apr 2024 20:32:09 +0000
Date: Thu, 4 Apr 2024 04:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-debug 4/4] arch/x86/coco/core.c:23:8: error:
 implicit declaration of function 'get_option'
Message-ID: <202404040400.3SlssY2K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-debug
head:   90df00c4e488a8b5b6c837995706f3e101d75e9c
commit: 90df00c4e488a8b5b6c837995706f3e101d75e9c [4/4] x86/tdx: Add option to override prot values
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240404/202404040400.3SlssY2K-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040400.3SlssY2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040400.3SlssY2K-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/core.c: In function 'x86_cc_attr_override_setup':
>> arch/x86/coco/core.c:23:8: error: implicit declaration of function 'get_option' [-Werror=implicit-function-declaration]
      23 |        get_option(&arg, &x86_cc_attr_override);
         |        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_option +23 arch/x86/coco/core.c

    20	
    21	static int __init x86_cc_attr_override_setup(char *arg)
    22	{
  > 23	       get_option(&arg, &x86_cc_attr_override);
    24	
    25	       return 1;
    26	}
    27	__setup("x86_cc_attr_override=", x86_cc_attr_override_setup);
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
