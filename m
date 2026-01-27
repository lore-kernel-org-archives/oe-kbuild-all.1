Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5C2D879F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553645; cv=none; b=Wr3uK3LgMrWva2oHaRfSlSuIGP1hBYd7QA7H8bTzDFmN68lv7qZo4gHlwPh5xD6M/icqHEFshDVyMqFsSntoH1uIoSKv0plPx0lv5Mdg+2F2LkfbysjVeBM/4lysvuAujaUXCmR1yDwX7RzUb8wzZgJx6jyfgL4AtDNYwTrK89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553645; c=relaxed/simple;
	bh=MEFOxXki0Uv0P03UmTcYESmgWJwsyvB6uMC5uLpNQcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbsRUcu4J2bqyFdviKVxV3JX+C9G5cFsxsoLQxhq0IuO00UgwQuHmlxZk3q6p/P0Ry9eRMWHyN3q0H8WEsOt3rK79Hv54x+WvkPwLxuOBXbXkmL8eD6hQT9sqV8BRCe7wkfa7wFss0jPsYqEepdfRpHWKbNMTl0IoCbE6F3C8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmws1IbU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmws1IbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769553644; x=1801089644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MEFOxXki0Uv0P03UmTcYESmgWJwsyvB6uMC5uLpNQcE=;
  b=lmws1IbUoWyodE/HZNz0viaFKYc7G7nE+PcerhCpd1vsHdNY4+6AOMcr
   m9w2SyNCTHrRVBDIldJl/upvMPqRqe9JBA01jLdtEKnpSqaBcic65rvMa
   he0imJ7B+CVhUHuLRfzs5RkI7ZSVlQYbx/ZCB4rHUz24DoURRTDTiHtu0
   6lZGe5PU9KJFdEFSuEnYsOaKBOCv3MIq/zCxmAbIckqNswsIlo7NtJ91i
   HlH7joGijR7fPtlvHnL2oTsLvdP9fnKQce5TMCHYHYzcYHWlikCWHhbiV
   MXBl5vdlBfdrE7k89RE24tY1nTSOn8WRm1owOica/9VpAHG+app/IEFKX
   A==;
X-CSE-ConnectionGUID: q+nb3w/oTPC53yt4aDASWQ==
X-CSE-MsgGUID: kymxa8UyQUK19IkPI2eUYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70664113"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70664113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:40:43 -0800
X-CSE-ConnectionGUID: mpm2fxUhROWryPnocDabaA==
X-CSE-MsgGUID: CpIU7pX/ShmTp/KCy5X9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212559882"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2026 14:40:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrjh-000000001wn-433Q;
	Tue, 27 Jan 2026 22:40:37 +0000
Date: Tue, 27 Jan 2026 23:40:35 +0100
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
Message-ID: <202601272303.aRgAbudZ-lkp@intel.com>
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
config: openrisc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_IWLEGACY-0-0 (https://download.01.org/0day-ci/archive/20260127/202601272303.aRgAbudZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601272303.aRgAbudZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272303.aRgAbudZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - TI_FPC202 [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=y]=y [=y] || LEDS_CLASS [=y]=MAC80211 [=y])
     - IWLEGACY [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
