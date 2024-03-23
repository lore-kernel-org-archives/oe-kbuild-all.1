Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65D18EB4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711196642; cv=none; b=AKWqdRT9qFNfG3gx+BQUGGbtPvENaxvuXg5RLX7WsU74kQHReGZrCDBLXjiDXWtEsZHTWA7VFxELWj6fiDWBZZGH3BYz1U8BVcvSb1QfIQoGagvVHLqa+t5HZMXLdYEtOHBTxTKHcD2hx/8YHxoorTUyt4/xCYTZROrSHmnEh4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711196642; c=relaxed/simple;
	bh=Or9Lzp5sG6EIbvlpFOXgD90qSillSSiGjNFSYCYzDsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eL8tUqH2d5P+NWbJ8y4sxpUPmea2/noTMunQRPcpmJY3IUtvGDu+kSzs+QLe24g0NvF+qWR5E11XFelpe09sMJbmJVuEuxuG0ndjWxgQtTHY496tjx5pD0ZrWSdJfOAjheWEl/wFUUWIVKttkVl4e5AnAW2fGIdn61pNOECY4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFvzP+1D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFvzP+1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711196640; x=1742732640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Or9Lzp5sG6EIbvlpFOXgD90qSillSSiGjNFSYCYzDsw=;
  b=GFvzP+1DsnEukHNlXoz7vwpqILALQg+nOnrXhxsTSpf4gvtcUdmHlxQs
   zGQzT9UYQE9VjGzy8Nh3HLlBWI0xmhPx/IW1ysjiJrUYM9ZGmxChArvPU
   2kc8jqxyjxViWEGWVYaSpeD9mjfUwjkUdd/Mzb16BHSPzfG7Vly6a9RBY
   n6FYfd9dlnJ7PwSCX7p+eD3/GQKgKzC8kXcMdu9eQs1CTNHb+e20L76cA
   Vh1aWGW3DailBuhrBiceiPkff85wZGPxZjEnbz0NfEE9RLZe6Yq3XQXAo
   OyoUXIq3ZgMKsrxNhDxG4B0KY2UCwWjusHGmral7qxUYQ5AmZt7WM5RjW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="23697117"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="23697117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 05:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15840779"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2024 05:23:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro0Pk-000L9D-09;
	Sat, 23 Mar 2024 12:23:56 +0000
Date: Sat, 23 Mar 2024 20:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Adam Ford <aford173@gmail.com>
Subject: [pinchartl:nxp/v6.8/compulab 10/25] m68k-linux-ld:
 phy-fsl-samsung-hdmi.c:undefined reference to `devm_clk_register'
Message-ID: <202403232049.FmkOoYso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.8/compulab
head:   08ae23fed6a21e21d60ce3e2b6c2afdcf6a2b3f5
commit: 7e4e5d44716a9363783c32477d4cecdf39ea3c51 [10/25] phy: freescale: add Samsung HDMI PHY
config: m68k-randconfig-r113-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232049.FmkOoYso-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240323/202403232049.FmkOoYso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232049.FmkOoYso-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_remove':
   phy-fsl-samsung-hdmi.c:(.text+0x5a): undefined reference to `of_clk_del_provider'
   m68k-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_probe':
   phy-fsl-samsung-hdmi.c:(.text+0x16c): undefined reference to `__clk_get_name'
>> m68k-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x1a6): undefined reference to `devm_clk_register'
>> m68k-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x1d0): undefined reference to `of_clk_src_simple_get'
>> m68k-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x1d8): undefined reference to `of_clk_add_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
