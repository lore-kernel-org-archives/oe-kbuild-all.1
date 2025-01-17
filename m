Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D181FDE3A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115598; cv=none; b=Mb+L0uUYYsybGpadOItD3sWq2fn29ny1gp9ioIze0AGPLHYPEvvywOkU0c40u3p6MDhniIqIMNvOHt8sawcocNsMJa2AuuEzpPbkqgLimHCW5IINci+bIC1vBScbs//yvZq9Xm1bby2zAN0Xttb+XH815trcz31nGQibDjc2yDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115598; c=relaxed/simple;
	bh=DLRrKOUp9u7sPT49SGdZaxl1UKYfCm8vrUFE1vSBPIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qb+7FgWGpL+r3yIAcWQC3bUYW4fr7IunYugnFXRzRV3yz/z3cGgtqMcIXjRE9cl0aYzvZsoYY7xLgqIHlgtKxaI2KwfYBTirLB5EQULCC3upNd9aFuWLMEqbIG+tyoMs3tstGKyTTiSpLOlOMe0jb2kTFbTHTe0to6/isEeORPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp9AaJ3R; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp9AaJ3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737115598; x=1768651598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DLRrKOUp9u7sPT49SGdZaxl1UKYfCm8vrUFE1vSBPIE=;
  b=Fp9AaJ3R/KtddLRgbxWnJ7q00OQloJXzi6gzbAdeps+H9Jq5r14rCvTU
   BcPAwWz29kPl917qrexGdgqpUdNvnUx6NhEEYB8JiT8FlGDtfWnpFGYnt
   N3Z2I2HXSHYy1hXOHDajKahmMemClZzTId1bsn7vnnJVIoDJaNkLTlsGi
   akR0t7IH3znbxbc0aqlU4ptXK7aMdnk6xTAPSGKCHbkXXXGqXnY5DTFQ1
   hRLmAAs0OIp33EFuQ8fovTsnEduAl2Tf0/vehnStz3/OkubbMYx4p4lbE
   7IwYNUZgbg5ACHR8n8q38sRUVwtOzR3cHuxWbkz9d85gMETWImb7Be7D8
   g==;
X-CSE-ConnectionGUID: +Em0kHGPRpmJlIURN96bhg==
X-CSE-MsgGUID: 4IG1Sk51QUKSk27MsBmzFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37567404"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37567404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:06:37 -0800
X-CSE-ConnectionGUID: 4BtuMSxaQoKOP0bxr8WgHQ==
X-CSE-MsgGUID: a1W/BoZAS6G9ipHiyWRDpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106263069"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 04:06:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYl7P-000TAC-15;
	Fri, 17 Jan 2025 12:06:31 +0000
Date: Fri, 17 Jan 2025 20:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	herbert1_wu@pegatron.corp-partner.google.com,
	Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based
 Skitty
Message-ID: <202501171915.sG65nBFc-lkp@intel.com>
References: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>

Hi Geoffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 619f0b6fad524f08d493a98d55bac9ab8895e3a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Geoffrey-Chien/dt-bindings-arm-mediatek-Add-MT8186-Skitty-Chromebooks/20250115-154648
base:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
patch link:    https://lore.kernel.org/r/20250115-skitty_kernel-v1-2-6ef2086858ba%40pegatron.corp-partner.google.com
patch subject: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based Skitty
config: arm64-randconfig-r051-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171915.sG65nBFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171915.sG65nBFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171915.sG65nBFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts:48.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts:48.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts:49.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts:49.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
