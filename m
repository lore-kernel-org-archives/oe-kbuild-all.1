Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75341A0728
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154855; cv=none; b=o6tzmbxxLWJ1X840pQlzVKvSlpdV/VFcYv/MkhAscdvzthei0TYtlumF8etY1ZxXddimWZg3p8TGVQP3MoKIlKrNtumPfIByiSzFscuthv62/SmTG3YDuiurmSWVLY8yz3HViDT/hk1pgyDnw66HTUL1s4KW9fGHT24jBd63Tfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154855; c=relaxed/simple;
	bh=SGbO8WM7QRpDDKP8wCXtXYrqIi1RJAbSBJRTJ2uVESw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNFU4oTkVlwLT5vAT9VB1lHDR6/wtr94MnSOes/MtXS2tAOhWmfyIG/sDdtnvjkjWaf6K3ojwLYalB3ZU/4ql7/uqATem6Qwi8ZPsC60srDsULu0/uHrFsdMquTV5sPXnMNGpDt1qS6DLhVbPIpd5UPenK8LCfRSmGyMy8EiHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+MIy2ER; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+MIy2ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721154854; x=1752690854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGbO8WM7QRpDDKP8wCXtXYrqIi1RJAbSBJRTJ2uVESw=;
  b=J+MIy2ER0tia01bnBqlA1JVDyTfutxdSZAWS1GaOMb+M2UANZvKEX7Sd
   TMpdxVWtTOLgPHtZQcCzQw0DdIqjkiAG9XAIsSco8K0GCOGTrSAhrSEHB
   F/TtTPJHxlz3fcOZDY4YvsVC0+BDmepIprbs8CHv19+XlWSwY/v2mW/Gj
   UC8ERY9QJUmyESbtrTMjYm9bmgA9hKVq8fyoCBtVW0j0ESLKKF4h07KEr
   opE8o5dI4is+gX+fCVX717+/hDwcH6dPTK4kwTkD7rYc7NvUJhC66XReW
   M15Mq1ILDft1GwAJ6UV4qQnU99X0583wxRZzILiIak8MPY7clnRa2vF6u
   w==;
X-CSE-ConnectionGUID: aHCkb3h4Sjy0wR66yR6Hkw==
X-CSE-MsgGUID: PkxIpRCNRfq4vn+Za9UdtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="30030782"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="30030782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 11:34:13 -0700
X-CSE-ConnectionGUID: F967STIhR3m9Xr8HKZYo8Q==
X-CSE-MsgGUID: NEd8ZzBtR+ioHXToV3JExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="81168490"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2024 11:34:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTn06-000fXS-0i;
	Tue, 16 Jul 2024 18:34:10 +0000
Date: Wed, 17 Jul 2024 02:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] phy: mvebu-cp110-utmi: add support for
 armada-380 utmi phys
Message-ID: <202407170204.XbJgeGfG-lkp@intel.com>
References: <20240715-a38x-utmi-phy-v1-1-d57250f53cf2@solid-run.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-a38x-utmi-phy-v1-1-d57250f53cf2@solid-run.com>

Hi Josua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-mvebu-cp110-utmi-add-support-for-armada-380-utmi-phys/20240716-014931
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240715-a38x-utmi-phy-v1-1-d57250f53cf2%40solid-run.com
patch subject: [PATCH RFC 1/2] phy: mvebu-cp110-utmi: add support for armada-380 utmi phys
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407170204.XbJgeGfG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170204.XbJgeGfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170204.XbJgeGfG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/marvell/phy-mvebu-cp110-utmi.c:112: warning: Function parameter or struct member 'regs' not described in 'mvebu_cp110_utmi_port'


vim +112 drivers/phy/marvell/phy-mvebu-cp110-utmi.c

2fc989f74b8dac Konstantin Porotchkin 2021-03-07   99  
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  100  /**
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  101   * struct mvebu_cp110_utmi_port - PHY port data
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  102   *
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  103   * @priv: PHY driver data
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  104   * @id: PHY port ID
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  105   * @dr_mode: PHY connection: USB_DR_MODE_HOST or USB_DR_MODE_PERIPHERAL
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  106   */
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  107  struct mvebu_cp110_utmi_port {
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  108  	struct mvebu_cp110_utmi *priv;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  109  	u32 id;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  110  	enum usb_dr_mode dr_mode;
56ee14beb72b1d Josua Mayer           2024-07-15  111  	void __iomem *regs;
2fc989f74b8dac Konstantin Porotchkin 2021-03-07 @112  };
2fc989f74b8dac Konstantin Porotchkin 2021-03-07  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
