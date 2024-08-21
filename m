Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7BF199949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232213; cv=none; b=PJIC+dwXRUCAan4Ta2lPUuYby8cWt0ru+0fp5tYZCJVkTgzFudzHnvqtlh1y1T6ZGN8s2n76h3Vv5jhPBPGFTndRP7anZcpfUkSU0jxRL+z1K1nUZuDAw87cVoQrtElI0dxBqquGH+luYqQNJG2qojlgQXbnrMVjWNqr7hn0jRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232213; c=relaxed/simple;
	bh=t/CSQvrauuMm+CtOl+ntlCgIHDDtGtHS2ZDMZbNdyCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSwoDdSMDEgiV+aXbS1NlncgrGgN0xYMQ77jSXnRlWOwfTuRjziAt8ymt7fIasIp1JkIAA6ENdR9HA+lfpNCNR6E6q2wm2pYnJ/LFxOx8Wk2XesLmbB4u3Q9VhAbR/bjvK3JKDXnTBLlJQ1/isFvgfPKDa/am1k3pCLjUhyh0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5cha/Ga; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5cha/Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724232211; x=1755768211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t/CSQvrauuMm+CtOl+ntlCgIHDDtGtHS2ZDMZbNdyCw=;
  b=I5cha/Gal0bT+6+Pr2RauEXlLXS3F/nxr/fFkor2X9HnEJ6+p+5D4Dxv
   cBnwM3vUZ7rltgqZ6ipf8JrpO9n6+LsW1sbr8lbw3UH8l10cr65gaduUL
   bYmM7sxFqygF2fACGuJwx7AmxdvYF7xnePAfqQCV7f2RdB1ZifaaKohux
   CYrNDfpztpHCzaspDDoso3UjlWnNCtSh8bDovIDaVgfRDdJWhWCh0Yw0k
   frCB4gPtMFWK010aYjHyNUbnXP87cZS2v8TRgs7xS7Zmg4U+GOGKxt8QZ
   vNAiq+UeRcywu7pz1sC7ruZ1W+72yjz15SM7REqVlT0CxUKLw585fbv3H
   Q==;
X-CSE-ConnectionGUID: VROjmrAaTsS4f1vZQxEWCg==
X-CSE-MsgGUID: TpXTRv2jQ+KSAJYzBipkmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40037662"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40037662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 02:23:31 -0700
X-CSE-ConnectionGUID: siL8DPxaQxKhLChs3QZt+g==
X-CSE-MsgGUID: RbN4J6lASDiEeCMso/RH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61570021"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2024 02:23:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sghYm-000B9u-35;
	Wed, 21 Aug 2024 09:23:20 +0000
Date: Wed, 21 Aug 2024 17:22:30 +0800
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
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <202408211702.1WVqlgTb-lkp@intel.com>
References: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_RP1-0-0 (https://download.01.org/0day-ci/archive/20240821/202408211702.1WVqlgTb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240821/202408211702.1WVqlgTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211702.1WVqlgTb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_RP1
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_RP1 [=y] && PINCTRL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
