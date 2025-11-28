Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558C2E63C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 00:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764288889; cv=none; b=VbSRtRFCuxnu+RLV8rsR+3qzMq4ox2f/Byp+B6kle7yCnPJk39ASOWVk88V0qFLu70GWUmPDkbnMmnH7BhRrUxiARX4PWsBsH8LhaCnf7S+hM1eCe5Pl4uA+dP7eFvlfTRZmo2es3D3mwDGoyuZDJmpC/AsxKUX9nGiqwrH/TAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764288889; c=relaxed/simple;
	bh=1gwUlNhQ148Ga4ZlgKpMShe68HlVmrJGqsI0mEqkfak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcEUUgoQJFxZq3gp5QpwBiqvxjr+pZ4j+tYKcCpeBL9TLNOiYvxSI5WJMCzWOICIWQeNizpe8VQlmNgyF4FKd7MZ7QejFnXvWvOBzaJwBih7sRcA+TMg0jFu5YLFsvNrEK617Ibe7Zybyyq0ZCSatGF35X3m9m+cXniiumUWmW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbyMnlU0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbyMnlU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764288888; x=1795824888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gwUlNhQ148Ga4ZlgKpMShe68HlVmrJGqsI0mEqkfak=;
  b=NbyMnlU0hTgavVuUlBu7ji/BphwXy50FQQGBfBZm2eJQ13t8LgAppPi3
   PI0+vpG51wuj5Y6OAfE05hLbtXBnj+Vp898eXFATtXdlbtLKOhjmBwoD2
   yC+s/YWK8iOHneXYgMSBRtACUXzO/1vv61QaDITMc7Wtqr4H5HFesqZjE
   lce3ZT9ItJeVQ9u97SUx2L1xNaORoOxFPh05TvpyvmQ+WtiggsPR+a5lS
   uoGGC4pC6BOo1rrOqXvpvyddybqQISoHAdhWtvF8eoCKkZKlKYNtY/0/M
   /V13C4IIvekUT8TVNRNO4A7BmkWGDExVWMEuok9A8IM8+7EtEPUJp81SS
   g==;
X-CSE-ConnectionGUID: OWofZRyXQ7mMtPdLqaGUlw==
X-CSE-MsgGUID: umNqCG0IQfur0P3U23wVBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66275840"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66275840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 16:14:47 -0800
X-CSE-ConnectionGUID: uM7jlM0+SJGxYrD3/o4bxg==
X-CSE-MsgGUID: +t6ZFY/bRUGPqVdNcRWrIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="194136268"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2025 16:14:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOm8J-000000005rh-34I7;
	Fri, 28 Nov 2025 00:14:43 +0000
Date: Fri, 28 Nov 2025 08:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH can-next v8 16/17] can: raw: instantly reject unsupported
 CAN frames
Message-ID: <202511280842.djCQ0N0O-lkp@intel.com>
References: <20251126-canxl-v8-16-e7e3eb74f889@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-canxl-v8-16-e7e3eb74f889@pengutronix.de>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Kleine-Budde/can-dev-can_get_ctrlmode_str-use-capitalized-ctrlmode-strings/20251126-182121
base:   ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0
patch link:    https://lore.kernel.org/r/20251126-canxl-v8-16-e7e3eb74f889%40pengutronix.de
patch subject: [PATCH can-next v8 16/17] can: raw: instantly reject unsupported CAN frames
config: x86_64-randconfig-005-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280842.djCQ0N0O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280842.djCQ0N0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280842.djCQ0N0O-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "safe_candev_priv" [net/can/can-raw.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
