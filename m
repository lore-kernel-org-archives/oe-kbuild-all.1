Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876613B7AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737172281; cv=none; b=khYSHNMCBUyJre70sd6BqC2b9McZzQCtuXvzxg+tpFXPwM4nEJ8PMRYMDv1WqB9DOVt+eMGCUgZM+bQnMiJQKc/G6U3/CsLSu/3/ZE4FfHSZ02A++lzkKnMrCdwQ48slviXnr/iZ4TmEuzGASBBr5ARYxtESgfwrRPpBTebGSIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737172281; c=relaxed/simple;
	bh=yeq4IXBcBZnTsUE8pk6nO8SgpaKvxASMp+nrzb3hWhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WC68lD+pJJIq361lT2s1dLwPDAnhxEXS78Nj/TGEEwfwq6yEde6xjn97lg7yuO80eazbrleCUXdBfb5uEVAqBM6aMfftWcWc6mFtyucCcr1/NKsJY63zaB5ljxDXN9WJmSwcOqVXpuoU3irNu83oJSTUaXndmv8GGGy5Lex6vnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlVUgQn3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlVUgQn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737172280; x=1768708280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeq4IXBcBZnTsUE8pk6nO8SgpaKvxASMp+nrzb3hWhY=;
  b=mlVUgQn34mY1tj5X0MqRQD0+8GVLhjRKpPCnD9xyH7imTaI1iNtRa06X
   zVvv38tML3VEJD5Kf0s2Z0jqU39GDemVL4i6NjGKd+/pT0bjJF0m8uo6n
   ZHdTjUyGCqG2Z8m2NVJmc8A1kA+DxHxoAT+RHOfjF1/23OExZ4f0bzJKM
   99/sDsPXAwJ2yluDN2xPIE+S+FgA+irQRrQsAq7x8KZBSClEiRYiiwnib
   HhyR6x4h1rl+KgIRAAk68zh7NUkk0iOlujU40BbzsxqFBTtX7sFw0m4Kv
   lvdKoBYZZWEe3IcDpzaw4pH5IOHBo9L7fbL9e+oWba9aByel1gi8h6doG
   w==;
X-CSE-ConnectionGUID: abYstJxWQ8yeXxT+PsKngw==
X-CSE-MsgGUID: os8NHHlfQ1G375PkqUdu3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48113112"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48113112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:51:20 -0800
X-CSE-ConnectionGUID: 8dmvt1VHSwqcx8wVnA9J8A==
X-CSE-MsgGUID: TP+sh+qYTWCb0l5GsEVfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106444005"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 19:51:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzrd-000U3v-34;
	Sat, 18 Jan 2025 03:51:13 +0000
Date: Sat, 18 Jan 2025 11:50:47 +0800
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
Message-ID: <202501181109.qPUuOK1v-lkp@intel.com>
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
config: arm64-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181109.qPUuOK1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181109.qPUuOK1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181109.qPUuOK1v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts:49.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts:48.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts:48.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts:49.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
