Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021266311B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796951; cv=none; b=JGgaLYItoQhK6iTmshtNs6ZATd3zCaB/33rutWXjU1nT/8fP1shp5qLoJ+c8jamF6y0v3XgqYEVypWy/kXq5pHFf5DsYK6APjtJu+nm/oaQYNB/+9/5avLQq4UeZCsNXcJsLzD82qvS0kzt24rlh9GmS+JaiV2o4/F1ztTX9fVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796951; c=relaxed/simple;
	bh=wPLZ9ZPwlR/NEMqQ9rg1gHY9xXCIjyxYQ73kX3U5HHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfVuabKKcQMjQQRSSmYhjqVmwNuJKJbK1xAZ6T5ZRp7upccY+QDztpkCj4n1bkz+7w3b+BzYlHghR/6ULBn/7IKcSjGVStaSKwSRFv2Wfl7kmgxgFbTKTmleHYS99xP5Hydpe7vfGNpLBPQ3vv+OyFRa8WoXT0sz2dJybFip8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1Jp8Zz7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1Jp8Zz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709796950; x=1741332950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPLZ9ZPwlR/NEMqQ9rg1gHY9xXCIjyxYQ73kX3U5HHY=;
  b=W1Jp8Zz7gkDc7LkPzRG9rnVk1krZuXTWIMQ6dh1tGoQWfLYFY1KwmC45
   b+pRQheF9AuScOBDMxXIMDKrWzzkjG7HgrNnGGW+piZESZ7bByDUUf92B
   t07AziaZbP5+nf/snqYd2LbjBgnKCrbA2io2sqU6Kjr+d2GHq6b0Qo3cD
   56Uf9PssZcT+48IxeT6aV/nXSV16tSrUJiqOrgMvwt37WZtLL3lJix6DG
   MA/KPp4SlJ3+0DrShfo+UkzkFLtmKxT8fvtvQrhR5ch6I/qRLXq6N2P2t
   Z1RbiPHtzG9Yg9HyoffJEkX+rNa9EJw+gtGFDn3NYkOVPRFsBeNFWMtZd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4334668"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4334668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 23:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="10189891"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2024 23:35:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri8I6-0004x3-0o;
	Thu, 07 Mar 2024 07:35:46 +0000
Date: Thu, 7 Mar 2024 15:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] arm64: dts: freescale: Add device tree for Compulab
 SB-UCM-iMX8MPLUS
Message-ID: <202403071500.52BSi2J4-lkp@intel.com>
References: <20240305004222.622-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004222.622-5-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next linus/master v6.8-rc7]
[cannot apply to abelloni/rtc-next next-20240306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/dt-bindings-arm-fsl-Add-Compulab-SB-UCM-iMX8MPLUS-carrier-board/20240305-084428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240305004222.622-5-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH 4/4] arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240307/202403071500.52BSi2J4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071500.52BSi2J4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071500.52BSi2J4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:68.1-10 Label or path hdmi_pvi not found
>> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:72.1-9 Label or path hdmi_tx not found
>> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:86.1-13 Label or path hdmi_tx_phy not found
>> Error: arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts:208.1-8 Label or path lcdif3 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
