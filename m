Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E9D645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712124796; cv=none; b=sPOh9uOlhUlpLe6MN9uJmrseBWlx+eua++MgaUBNSLALxmCYDhDFTDZ2b9OO67eaqAxb4ywINm5LZKEWTzMDu5N/15QtMxtYrYgsIryAgKao3oGYY9VpEmlrpBXwR0Tkkg4wBRvpnbPtC3fWPWv35zfF2DlrLCBv8yCzwZfNsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712124796; c=relaxed/simple;
	bh=1FPucQYrDlyZ7pjv1PGAu5Ws3Ka3qwb/ZRwZgUI7uO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHtgjvxsvTMvT1lirhQNOdywhBIk9hStB+2RKQvd96MzuKKJfOeesrWVzBjvOfIP2zJQ+gZ1QJw0/NYa1Br4bImIDr7nSlhZwu+ZaIgpJya6Q4E/2oOF+k88JYnTRCj+1XnnrtfrOESrIv7Y+IPSTcZv1rFsAPEHfAXHZeN0ltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyS+uzgM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyS+uzgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712124795; x=1743660795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1FPucQYrDlyZ7pjv1PGAu5Ws3Ka3qwb/ZRwZgUI7uO4=;
  b=UyS+uzgMlXlcsbCGXkYLsqN8y97f6iJuZ2Wn6/uYh93uTKAsoVln8Ezo
   HwZg0xgWAfgIW1IV/CJQNkXBJH3atFkxnX73O20uytUbzQSuYtfUOy4dP
   mU7kXfUcb9kwpwvpd3wq5dIzwJ2t2KTq3SXTvdqhC21o7oRIWlFHNqOIv
   WjyFfZ5ThASrIKcaoz9ua05zmMnM/yJwTlyYKDxw4+Q2yUpXkIfY+bUQc
   ntThmqW/xGTogDatH/SAasDR6YDyltXcR2+rrdF67yjllqPCh+GBy/zg6
   d8cMQDmpCInlmzizEGIlaxB4/ydJBbGjGwAY8yJydCTnQvEC2g/RPNrrk
   w==;
X-CSE-ConnectionGUID: dtlgVEHeQe2+t3ogPKwdFg==
X-CSE-MsgGUID: fYAieRlJQRKdu9Jn9Sq/6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11155744"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="11155744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 23:13:14 -0700
X-CSE-ConnectionGUID: 7pS0GBJ9RmK5kOXC/vO6EA==
X-CSE-MsgGUID: ubGqlZVRTAuXMEwi129tSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22789087"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 23:13:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrtrz-0001ur-0s;
	Wed, 03 Apr 2024 06:13:11 +0000
Date: Wed, 3 Apr 2024 14:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 45/51] arch/powerpc/kernel/pci-common.c:110:18:
 error: implicit declaration of function 'find_and_set_bit_wrap'; did you
 mean 'find_next_bit_wrap'?
Message-ID: <202404031404.TRvwGwNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: 5e675d809976b6cb445c342444bfb97c1a334469 [45/51] arch/powerpc/kernel/pci-common.c
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404031404.TRvwGwNW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031404.TRvwGwNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031404.TRvwGwNW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/pci-common.c: In function 'get_phb_number':
>> arch/powerpc/kernel/pci-common.c:110:18: error: implicit declaration of function 'find_and_set_bit_wrap'; did you mean 'find_next_bit_wrap'? [-Werror=implicit-function-declaration]
     110 |         phb_id = find_and_set_bit_wrap(phb_bitmap, MAX_PHBS, phb_id);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  find_next_bit_wrap
   cc1: some warnings being treated as errors


vim +110 arch/powerpc/kernel/pci-common.c

    70	
    71	static int get_phb_number(struct device_node *dn)
    72	{
    73		int ret, phb_id = 0;
    74		u64 prop;
    75	
    76		/*
    77		 * Try fixed PHB numbering first, by checking archs and reading
    78		 * the respective device-tree properties. Firstly, try reading
    79		 * standard "linux,pci-domain", then try reading "ibm,opal-phbid"
    80		 * (only present in powernv OPAL environment), then try device-tree
    81		 * alias and as the last try to use lower bits of "reg" property.
    82		 */
    83		ret = of_get_pci_domain_nr(dn);
    84		if (ret >= 0) {
    85			prop = ret;
    86			ret = 0;
    87		}
    88		if (ret)
    89			ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
    90	
    91		if (ret) {
    92			ret = of_alias_get_id(dn, "pci");
    93			if (ret >= 0) {
    94				prop = ret;
    95				ret = 0;
    96			}
    97		}
    98		if (ret) {
    99			u32 prop_32;
   100			ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
   101			prop = prop_32;
   102		} else {
   103			phb_id = (int)(prop & (MAX_PHBS - 1));
   104		}
   105	
   106		/*
   107		 * We need to be sure to not use the same PHB number twice.
   108		 * If that happens then fallback to dynamic PHB numbering.
   109		 */
 > 110		phb_id = find_and_set_bit_wrap(phb_bitmap, MAX_PHBS, phb_id);
   111	
   112		BUG_ON(phb_id >= MAX_PHBS);
   113		return phb_id;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
