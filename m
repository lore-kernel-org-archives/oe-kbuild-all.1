Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C85173
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733962179; cv=none; b=UFnbMVJaJrk3BxKDiVk3ep1aOcy2+2GJCJfW0CHlg91ppUxM1z7b5pmMsg9XDVVf3MzhKZadiet7l3a/vBI61dbTTmDoQN8eQw0FQquTUfQy82bcBlVal2Qe0d1L+kIJH2g2Ee65iqO0CFgcm1CkVR82e/AFU9cJ+xxFkjC/Z/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733962179; c=relaxed/simple;
	bh=GLoi1vIQJUyrAhgznEGUkF/KZ7Xqu2siO4ry8WCFdDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQabT+uuh+snpR06rkDMn8zCR83N2yTnsiu6piFUUq1h2GqQmbT1cwEZENykV9uQw+6VqloDmHUkIQ0zxZqa3nrJ5xN2FJL+F2GnGREKQFF7MkBzkUkvOnW4/bYgu7600IIY/HYguCpUo3Om+K1ooKdbY/kdZMtvE5U1+HnrvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqUNTk/o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqUNTk/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733962177; x=1765498177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GLoi1vIQJUyrAhgznEGUkF/KZ7Xqu2siO4ry8WCFdDo=;
  b=VqUNTk/oYIP+ObYOT8XXfqpH1NgYP4GfbiJiVIFzfOyrddS38u9XfQhF
   jeWAAx7QuRqHlwxKgNFxuHaumLZKjYblLHwCwxN/XZSOvp4vaADToPi5E
   7yfY/eAGCLszC1KLfVPzVDJi+XGjwy52e0et+w4RzUc+xrjPBjW0v/top
   tKkcLERdQMnL2WD5DcIGPOFAStKePyf0jta8FBq8nlQgi0UmpLpxsZY6V
   3vxOJOXaOhS2ulMl/dpbe1zWBa10oydD8/beEYy3hYqslOmweiPiI2pZ+
   a4G8AXtGa92e7rFsGVTlE0LgKwBGBALv0sBLokZfZNS91uTwkkCCJ0ptc
   A==;
X-CSE-ConnectionGUID: Z8AI1N19Q2uDOM9S3GtP9A==
X-CSE-MsgGUID: jE5F5iu0TsaqCyaFSW4Gfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34506442"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34506442"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 16:09:37 -0800
X-CSE-ConnectionGUID: SUTqjpRfRNKitiiqhCLl/Q==
X-CSE-MsgGUID: FFnLgN/bSySdXVvojj7pbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96091314"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2024 16:09:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLWlo-0007Eb-2y;
	Thu, 12 Dec 2024 00:09:32 +0000
Date: Thu, 12 Dec 2024 08:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Message-ID: <202412120746.uvo9F6FW-lkp@intel.com>
References: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>

Hi Xianwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 171aa289a6fe65faffeb92a1fda283c055435a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241211-144931
base:   171aa289a6fe65faffeb92a1fda283c055435a62
patch link:    https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-2-410727335119%40amlogic.com
patch subject: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120746.uvo9F6FW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120746.uvo9F6FW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120746.uvo9F6FW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_PULLEN' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_PULL' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_DIR' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_OUT' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_IN' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'REG_DS' not described in enum 'aml_reg_type'
>> drivers/pinctrl/pinctrl-amlogic.c:42: warning: Enum value 'NUM_REG' not described in enum 'aml_reg_type'


vim +42 drivers/pinctrl/pinctrl-amlogic.c

    28	
    29	#define gpio_chip_to_bank(chip) \
    30			container_of(chip, struct aml_gpio_bank, gpio_chip)
    31	/**
    32	 * enum aml_reg_type - type of registers encoded in @aml_reg_desc
    33	 */
    34	enum aml_reg_type {
    35		REG_PULLEN,
    36		REG_PULL,
    37		REG_DIR,
    38		REG_OUT,
    39		REG_IN,
    40		REG_DS,
    41		NUM_REG,
  > 42	};
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
