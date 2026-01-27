Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6726E2E62AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553885; cv=none; b=utEEQGWQGAlGvf0zoRO5XSIOt59qg/gE5z4woUBYJdIsL+owIq0byPbMd32jK5pLp17v2e/B83cZq3YMDPo3xm1uxFjNHfVz8XaKby3pYXP4ecTzXmJ75NygfGcXgH77UpqfEQHOhifLHumRUwSFdDhtqwFEqrKmgVb6aW4apiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553885; c=relaxed/simple;
	bh=4DIQisyolzP2xRqRZ6cjmhFkRHluutEZ1iwbaimqbPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTYmszCAv8iG2O+RzoWOwUZ34je5tPlNzmlj064wWua34ZbaV+klZtKLrwYp0tl5EKGWD0QMA7/EqSxLDfCc9oJjQtbOsjvplp/JqOM0SE57KGQqigq8uthJItLxL6Sj2GilFwQaaTVIN5xFBmJc+fQRgxxapVvyJFV/R2wc5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zt7eRwpN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zt7eRwpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769553884; x=1801089884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4DIQisyolzP2xRqRZ6cjmhFkRHluutEZ1iwbaimqbPs=;
  b=Zt7eRwpNf0L5+zpZGGLEw/NcCRoq4QEp5gjzee7oan91xa8et6Ntl5yK
   w4mFeT5Wme2b5p+5qa1raRXVeEw5/EqD2gSiJQ9Nr9LkZzhnqEILjEPj5
   GM0qUWTwv+KIvduD0T2E9UdWinn+XVkTUgq9TVVKT1g/J5Z6JTkBA4Zbx
   eFclgPvl4QUArEHEtnTYA+/hgzKhadkBxb57JmQQvv4tTDeFIEJ52HdwN
   TQhPkZpGkTb65gMiAETgNgkYR+KK2unvErRMWdOVNB0wOatIDRLxPtef/
   yt0T7S06IXZSDrPKu5/KhL33C1aZl8CssZKbUoMzkt7Nf6hixblQwOl+7
   Q==;
X-CSE-ConnectionGUID: X6vey6djQvGDt16V9snQ5w==
X-CSE-MsgGUID: WwkNDErMSbG2wSkdONxEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81868119"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81868119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:44:43 -0800
X-CSE-ConnectionGUID: /T0oKQ7mTQ2kqvSSa5htKA==
X-CSE-MsgGUID: fi5RBX0VS2ShvBUsJ3rHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207891658"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Jan 2026 14:44:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrna-000000001wv-0EaL;
	Tue, 27 Jan 2026 22:44:38 +0000
Date: Tue, 27 Jan 2026 23:43:50 +0100
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
Message-ID: <202601272325.jkhZORKJ-lkp@intel.com>
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
config: nios2-kismet-CONFIG_LEDS_CLASS-CONFIG_TI_FPC202-0-0 (https://download.01.org/0day-ci/archive/20260127/202601272325.jkhZORKJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601272325.jkhZORKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272325.jkhZORKJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by TI_FPC202
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - TI_FPC202 [=y] && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
