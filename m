Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740041A238C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 00:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560304; cv=none; b=HPwGv88SJvwwmIC2OmZfiYzOHLQobvEfxEmNOFBUHVVPR5cGTCmgr0P7v+vxPwQ/TOMbASLL4JHx9ElPeXgE7RKZFhv5caTSI9e3zUMPNRbbYi1iHo6QWXrslGN6GICtoBC1MCX4CgoOcED38QvotcpPV2UWpcXrvgxeJSjJViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560304; c=relaxed/simple;
	bh=Tiw/EOrYwH8Y6t6NaJEyTlwqUXtWs6umlmGrrdrcwdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPDLKr6k7YDzgBTb1W82kvrPqNUSOTBOwbKQ758Zg15s/WBK92uYK70lwGoayDYE3r7QdaMp8hFCpe6CAfPjHFZneJ9jQGuXrxHBBjtLlYsqstbAD0rfgyCiAZaZzNkGEzlJUUeeUUMgVRT8HN/xX5GhjizOtkIPvtub2eWgTFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS+YHLR4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS+YHLR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769560304; x=1801096304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tiw/EOrYwH8Y6t6NaJEyTlwqUXtWs6umlmGrrdrcwdw=;
  b=FS+YHLR4ib0ei6N9ZO9YH6Uq2GNORXqVH0BT5mg5OF3d28KB9eRFl0NZ
   sgbEEPQvebIPtuze1vWqp4WKymES1HRn6ikcSp0YFqyuMeHcRRejM5B6C
   hbC0vprEeDH5gy4At7xh20Lg6HLaMay+YJNgoSbJRepfczDm0+Irl8qtJ
   5AEM0m2QxkUvpsRbulgW8xtTPpwfNYvals9KXz2RqXft41UJLgWDXnk/H
   UxeMLXmuW194y7JfqFDdcREtG3wdC8SZjOS72QxErp6bUQwQ8KPrTrboQ
   rml16cl8tz/fEbGSsFUAQ7Iu04n2YsNWwTK+ZVzp2DWeKTXK8Tg92+IvB
   w==;
X-CSE-ConnectionGUID: ds3KQhndRkSBjhkd950zuQ==
X-CSE-MsgGUID: 6SusEPFnQ1WWUslUbcz+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73358499"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73358499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:31:43 -0800
X-CSE-ConnectionGUID: yad6J91uS2u81M+B0sb+uA==
X-CSE-MsgGUID: C9/9Rd1aTmWhYJ4Gaaa8Og==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 16:31:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vktT8-000000001xN-23Ms;
	Wed, 28 Jan 2026 00:31:38 +0000
Date: Wed, 28 Jan 2026 01:30:38 +0100
From: kernel test robot <lkp@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH 2/2] misc: ti_fpc202: Support special-purpose GPIO lines
 with LED features
Message-ID: <202601280105.Lu065wxA-lkp@intel.com>
References: <20260127-fpc202-leds-v1-2-ebd0cfb9f9a1@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-fpc202-leds-v1-2-ebd0cfb9f9a1@bootlin.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a8a6d9b4da001a84dd715d92f034d2bf777199c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/dt-bindings-misc-Describe-FPC202-LED-features/20260127-215935
base:   a8a6d9b4da001a84dd715d92f034d2bf777199c8
patch link:    https://lore.kernel.org/r/20260127-fpc202-leds-v1-2-ebd0cfb9f9a1%40bootlin.com
patch subject: [PATCH 2/2] misc: ti_fpc202: Support special-purpose GPIO lines with LED features
config: i386-kismet-CONFIG_LEDS_GPIO-CONFIG_MERAKI_MX100-0-0 (https://download.01.org/0day-ci/archive/20260128/202601280105.Lu065wxA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601280105.Lu065wxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280105.Lu065wxA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_GPIO when selected by MERAKI_MX100
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - TI_FPC202 [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_GPIO
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - MERAKI_MX100 [=y] && X86_PLATFORM_DEVICES [=y] && GPIOLIB [=y] && GPIO_ICH [=y] && LEDS_CLASS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
