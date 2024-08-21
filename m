Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA601531F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245722; cv=none; b=QwsXhc829ORwUMuhee3lmyhB+O53Tx3lSAfVsovC1URRKMzP2OYQhmtD5iaRxC/ujkCc8llHrp2NyZj4L6hGCrKZvsPVSOv+0U2IFq8jJJ0S8JGvfNHaapwUOiJUsqMg3TWWqvHOvbN+JwEHHn/tHtuWaf66YScDZ50rXk0VIxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245722; c=relaxed/simple;
	bh=HxD5PKFw4t2INAVoKOQOIEkGPgNXjHSau3NtdeM2Psc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBFvPGyBIMY+X8fNic3reSqsFObbWVCiDPIuDN9dnsVWiTSuqL9wa80Hk95P79amOxlwMk/3djAZeGJ4iNvC4k+/BEu9TSn//k6MLVfr+gbo/OIdJv/hPB+WkuaLSNi91w9I3mJKsgRsv/rGdO6LWHwo7gvF6Tb5uZi0Qq3aBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBs+rwVY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBs+rwVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724245720; x=1755781720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HxD5PKFw4t2INAVoKOQOIEkGPgNXjHSau3NtdeM2Psc=;
  b=BBs+rwVYeIseKk7Fg9l+J9wkurwAJOD4dwA6lzGN3hFB9tba+PD7oKZC
   V87WJnWHuZvCV3ilXDm134REFgPCuA88Y7mDKy1NjzrkgbmuumySgVJ6Z
   kvpawHo2MTrOK4KJ8KYo82CD0mrlpL8kUBsHozNHc02JKuD1eovuGnMUR
   /+dmcVuCbHXXuBUGT0xAU8cS95LSxUMqkvMpucWypFXMvx30XZnuFybpO
   059DcIUL3ccK4JzDCfiWZ7MZPJ55CrQUG2NbL1DJgSfqzbpykrf2e+1o6
   8F2oqIlQqoKEm6GZtiFokj1ZTiT/nyaHb29OCSWzgDTcO0aMyV6ipRsN4
   w==;
X-CSE-ConnectionGUID: DyBsWuDjSVmlcgvqXzqClQ==
X-CSE-MsgGUID: zCD9s4/vSgeQjnyLvu69DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26356364"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26356364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 06:08:39 -0700
X-CSE-ConnectionGUID: u9ZtNQ84SJSBThVsNTEQ8w==
X-CSE-MsgGUID: prRA43ncRvC/UokwmIRIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65295730"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2024 06:08:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgl4f-000BNS-2Z;
	Wed, 21 Aug 2024 13:08:29 +0000
Date: Wed, 21 Aug 2024 21:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <202408212017.eN5JVu0P-lkp@intel.com>
References: <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
config: sparc-kismet-CONFIG_PCI_DYNAMIC_OF_NODES-CONFIG_MISC_RP1-0-0 (https://download.01.org/0day-ci/archive/20240821/202408212017.eN5JVu0P-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240821/202408212017.eN5JVu0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212017.eN5JVu0P-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by MISC_RP1
   WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
     Depends on [n]: PCI [=y] && OF_IRQ [=n]
     Selected by [y]:
     - MISC_RP1 [=y] && PCI [=y] && PCI_QUIRKS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
