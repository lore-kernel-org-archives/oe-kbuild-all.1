Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25F166F07
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900219; cv=none; b=TwH/H2g47ujvByHqI+40KaoZiIkog1fPH9+GuT/cFggegkuVgX3F+WumlohnJGlrRvtn15XjfNQjKrx+0filSlBwI2lkeDrInRy4Aw37xC4ciooVC4ug0eiycJI3Vsy+4lr36X4p3ZQ85Qp4pC2oOC/QaSBdMJu6ivfz0NKvqJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900219; c=relaxed/simple;
	bh=SPDkgjp1iESRpLEN0olg4YNX8g5J0heZpCZbWFhRj84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTA5N2ALd2j/pTLChCIDxSRogndRk7OujMPAW3WbXxdqknufL2GhMHpgxZ543vTM4B6kB9AoeZeB1omf7UfbwqGW3WA4o32IYsTh6GW0CChdxH5SmnDh18rSOUj2UeXPzuE97YY6GZvhi+qtwxBXbWX3wT3QMuraysY/SfUmvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBFJWmB2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBFJWmB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725900218; x=1757436218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SPDkgjp1iESRpLEN0olg4YNX8g5J0heZpCZbWFhRj84=;
  b=kBFJWmB2PyYPeo3Py0e4Pv8yDaFLPWphORlIZ00+oTzyGJtvefi7njsp
   rfeP4/guvITlR256RQyZC70SZl+WmT4xOPAMcbfm4ZaHWdySFx3pL2eWd
   JeFFSUjWQ/l6Zi0+lcNhzjNYdc0T9ADsSCNbUQm8iSGj4z/PyURb2JHAs
   b8gk7PHx/00+mk05t3qG/vEB6BJdMxo0skDJwIZpy5QwDnuqjimL+TVHR
   n/RiTeSv1KhvLDtuhxTN9dp3iAuw9WA9ITXVTXP/sihZTTeD01o4rV/HK
   tDvdxyVk/a2F5KST5a8pk8a7vflBn0FMfmYGsBSH1u8TKUF9dOJEDL5y2
   g==;
X-CSE-ConnectionGUID: FQIzCcC4SSaOZMr4kLMUFw==
X-CSE-MsgGUID: TocHvi+rToi6wAEjR9PBJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35989344"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35989344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:43:37 -0700
X-CSE-ConnectionGUID: DWYCUyg7QCmuCnaxSp+y9A==
X-CSE-MsgGUID: m8k4tGKdSOWS4YW9oVOxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71139328"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2024 09:43:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhUB-000EzC-31;
	Mon, 09 Sep 2024 16:43:31 +0000
Date: Tue, 10 Sep 2024 00:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
Message-ID: <202409100033.EPfBtwfK-lkp@intel.com>
References: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on 487b1b32e317b85c2948eb4013f3e089a0433d49]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/reset-amlogic-convert-driver-to-regmap/20240906-213857
base:   487b1b32e317b85c2948eb4013f3e089a0433d49
patch link:    https://lore.kernel.org/r/20240906-meson-rst-aux-v4-9-08824c3d108b%40baylibre.com
patch subject: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
config: parisc-randconfig-r123-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100033.EPfBtwfK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o: in function `meson_reset_aux_probe':
>> (.text+0xc): undefined reference to `meson_reset_controller_register'
>> hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x88): undefined reference to `meson_reset_toggle_ops'
   hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x9c): undefined reference to `meson_reset_toggle_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
