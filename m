Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0B285C8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664731; cv=none; b=oPnmiCUAjOO/lkI6bV8VVa6uyt7/BjC1QK7hFKLoaoud07tkvLjqINm7GKxcRxiZzkW+EEsR30dtmNyNtHANmjB8WAt1VeIvriHejaPrIvZUOCAwyDaOe5P3RByXLmrEKb42FTSd1BQm9xb+Siuhxr0HWZmHbZuyDuIOMhmJL0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664731; c=relaxed/simple;
	bh=WcyqtDBPvckqUoLlonLyKLPrNJIKpdcdzDRcpucvRLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHbBBpHmukfls9YISSUT4pfIiMdIN/cTxMEuwiDbYAHDyWJnJ4Jb+e7cRT7SWOllSc/2MpFmLFkI946UzakjlvnZOs0nH1KcXQMMXhxxsmsL5xGz3pwCugz31JbcGXAvROrtsl8/nT3IS9wJ5tVf0TR7qyp1oZmS36ITskp2AHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4rn6Bfr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4rn6Bfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769664729; x=1801200729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcyqtDBPvckqUoLlonLyKLPrNJIKpdcdzDRcpucvRLQ=;
  b=f4rn6BfrsukR6FDUScAPQLKW1CqCe/hqaDDRqU5uCnHXUnRQATOZ3ilM
   GCXXpcT4kfYl/fEv5k0H1z52hJm10IRAL6uXNT8MNWqo3taKlufvlekOJ
   XoobkoctVGaesChiZiByY1ztPLf6J+gwnZL1A/phybtW4ZWE6zKqWxjUu
   Xz8RUu3jTg7NpiXAjr2y9TwfP01JtiN5PBmX8G/bpMeZluacpE4J9jPuS
   +5qK3rS+2/611CbMpGAa/7Fe2OBeeAzxY+Z5ZfefCW7drQjwwHW/TuFqt
   DBFcZm9yhYQmaBBRVlPjoCyZstoEX0lVwaOa2Q+COdMus6QgU1mcXkGtt
   g==;
X-CSE-ConnectionGUID: UqmC8gBcRjmHlZyuY/MyOQ==
X-CSE-MsgGUID: nA9MGMMNQnWiT9Dx6wUo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81207668"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="81207668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 21:32:09 -0800
X-CSE-ConnectionGUID: SOySpGpGTr601yFi04c44A==
X-CSE-MsgGUID: ZVMg/81jTPajsPDXEV6IJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208252959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 21:32:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlKdQ-00000000b88-3atC;
	Thu, 29 Jan 2026 05:32:04 +0000
Date: Thu, 29 Jan 2026 13:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC
 address across unconditional reset
Message-ID: <202601291317.HnJ22BU8-lkp@intel.com>
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/net-stmmac-Preserve-bootloader-MAC-address-across-unconditional-reset/20260127-012707
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260126172503.238724-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address across unconditional reset
config: hexagon-randconfig-r072-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291317.HnJ22BU8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291317.HnJ22BU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291317.HnJ22BU8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "stmmac_bus_clks_config" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
