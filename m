Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481631CD15
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733072196; cv=none; b=Ifs1xUus+GOa2y1iC4Df0x2qPvjOrT7JKQU5JERi/ARRkuO8jmLivL6ZWFiUbSgzzqaVcGjwmk1eQ8ccADI0nmM7EDe/dnzyImVlb029WvwYiF/i0bTuxIUxBSQXUxWMMz8/vLEJn3Yivmd1XnOIqtjOmilItEqj4pwqRRmrMqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733072196; c=relaxed/simple;
	bh=xuxdmsHGnwStZcU53apGCEwVHH/YA5/G7nzWhXhNKJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZl+62SzXAXOZnjXF/W56FgaWk5y2DLP+RRxMbSPuHSP0ombULfgp3S9LQt7f+te3Pj9GHpqVEgeKR3VOjhqQ19i3mTbeOiDGkMkxoTDyGSq3Vfo2YHNROBHihfcuRad2J+wAb9gXPUnqncRJSjzYJvqS9h/pDK89STClsW7iq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3aCzNjt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3aCzNjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733072194; x=1764608194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuxdmsHGnwStZcU53apGCEwVHH/YA5/G7nzWhXhNKJc=;
  b=R3aCzNjt+aYFDONaPa3fdWReF3QKWDWmPr66UJ3j0biRir5ZrTsOMMMJ
   bVC0387KGWt341HHxQTGdL8q6nJvyjg6J1kCDt91GTQfdPkAwa9GCCyv/
   rdn6NotH/jG2St+lk+WCMSTzr1N3IzwgBLzcKd4vsl8kTuu1UMj0gZr+F
   wau9wxglvzCFzsF9/iw956IClaBHpfXKXuPiRKh/Cdm06HUqSCoaT6y6g
   jwYkRnfIUIbEjUsnnWfbg9Wt8ZkHUKZE+1YIDi5rp01GLWbtmJYFHRgQZ
   3iFlf/1Qm313XvZZ1lBbsaBOUwtfCuhdarG0RFZn4sRxzbOhv67QZd1LO
   Q==;
X-CSE-ConnectionGUID: wFFR20wFRUeq9agL6oZg6w==
X-CSE-MsgGUID: aQzLxAMQRPC7+EVEShrlAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36100597"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="36100597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:56:34 -0800
X-CSE-ConnectionGUID: MbNn9o6CS1G/eLPuULP90A==
X-CSE-MsgGUID: SA3agrw4RvOH0zIFzsMKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92811828"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 08:56:32 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHnFG-0001hV-1J;
	Sun, 01 Dec 2024 16:56:30 +0000
Date: Mon, 2 Dec 2024 00:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 25/30] include/linux/of.h:1773:5:
 warning: "CONFIG_OF_RESOLVE" is not defined, evaluates to 0
Message-ID: <202412020002.hCJrP1Tw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   b21db3c3b59085d88243972fcb891a13ddd86b7a
commit: e8a03ab091c87d818bdaa61873dfd96c6f6df5da [25/30] of: resolver: Add helper to add to __symbols__
config: arc-axs103_defconfig (https://download.01.org/0day-ci/archive/20241202/202412020002.hCJrP1Tw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020002.hCJrP1Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020002.hCJrP1Tw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/logic_pio.c:11:
>> include/linux/of.h:1773:5: warning: "CONFIG_OF_RESOLVE" is not defined, evaluates to 0 [-Wundef]
    1773 | #if CONFIG_OF_RESOLVE
         |     ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
>> include/linux/of.h:1773:5: warning: "CONFIG_OF_RESOLVE" is not defined, evaluates to 0 [-Wundef]
    1773 | #if CONFIG_OF_RESOLVE
         |     ^~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +/CONFIG_OF_RESOLVE +1773 include/linux/of.h

  1772	
> 1773	#if CONFIG_OF_RESOLVE
  1774	int of_add_resolver_symbol(const char *name, const struct device *dev,
  1775				   const char *path);
  1776	#else
  1777	static inline int of_add_resolver_symbol(const char *name,
  1778						 const struct device *dev,
  1779						 const char *path)
  1780	{
  1781		return 0;
  1782	}
  1783	#endif
  1784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
