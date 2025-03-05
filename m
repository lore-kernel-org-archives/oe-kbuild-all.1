Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08A19ABA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 17:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741194801; cv=none; b=NanodaTsAXA24KEKyCsXzGtRJFNt0NZj6KYOGeI1xbg/cMTABbc3Vh2InV5CVkDDVxDixfOmDTjrYFHBKVIoxa0WahlYrdHzPdzbyX/eEgLUcer1EPWzYH+P9JqXfwu2H0AmDSAxgxAUUjZaCPSPCn8lZA3icKenGbe3CWhTa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741194801; c=relaxed/simple;
	bh=/FRsVPcWYshzIJlWkEQR7nspZsvkMq5f/xjb/gPflc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M30LRASug2+3HX6OoWv6hohkHJgyfKaQ3EInay5JdiZOoCk1ctwzdeZ/ptrRmrIJspc1z9mPShuTN8ASqnZnM/1l24uO/Cx4Vue6cB1KEVHxCSAqYd9fGaafai+CbbY58o/hg7CUx0KSssW8g2LxLxg3/U3yuHv8pULYDK0EjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQ1DUZJw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQ1DUZJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741194799; x=1772730799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FRsVPcWYshzIJlWkEQR7nspZsvkMq5f/xjb/gPflc8=;
  b=GQ1DUZJwjiWwc4q0BSnlAkauhZQbf1UavrFPMRtM1VdrNXSLYjcVxUVa
   YcgqHQLc7bOPvWNFfeDpN0brQLZcLzZ4dPD825cJ1UYHUeGHoU9NXvTIi
   8DeJI8D4H2sr+ozcdSWghoCO1g6gEJMQsph402hfWPKcXDG5J6mLVl0l7
   yzs61y/AUxLHJyXJDBK1CqFXH0c+l2ytP8rQfRN1+euq2l84UYJ2TYNMo
   fzwYGD5ZvD3NQcdAIlakXKZ6gZPzng9dwluopzwVH0yX8hJ+T1pwm8M6s
   usDF9L3x4S6h1Bz6gWIMkSOFexqQ2YrNDgIqRbpFiJKngkm7MIjjZop1a
   Q==;
X-CSE-ConnectionGUID: qFqDwjd4Q8OkbbiAA/i3zw==
X-CSE-MsgGUID: IlnLRBaDS8Ox68EG32Wraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53582233"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="53582233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 09:13:18 -0800
X-CSE-ConnectionGUID: 17jggO0yS3SFRA7/BU4e/A==
X-CSE-MsgGUID: owFNWFWSROeZGA6HfX2iVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="119254412"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2025 09:13:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpsIx-000LI6-1y;
	Wed, 05 Mar 2025 17:13:11 +0000
Date: Thu, 6 Mar 2025 01:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
	andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202503060042.qiMGnPlW-lkp@intel.com>
References: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-geni-se-Add-firmware-name-property-for-firmware-loading/20250303-204936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250303124349.3474185-7-quic_vdadhani%40quicinc.com
patch subject: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503060042.qiMGnPlW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060042.qiMGnPlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060042.qiMGnPlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/qcom-geni-se.c:19:
>> include/linux/soc/qcom/qup-fw-load.h:148:9: warning: "out_be32" redefined
     148 | #define out_be32(a, v) writel_relaxed(v, a)
         |         ^~~~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/soc/qcom/qcom-geni-se.c:11:
   arch/m68k/include/asm/raw_io.h:32:9: note: this is the location of the previous definition
      32 | #define out_be32(addr,l) (void)((*(__force volatile u32 *) (unsigned long)(addr)) = (l))
         |         ^~~~~~~~
>> include/linux/soc/qcom/qup-fw-load.h:149:9: warning: "in_be32" redefined
     149 | #define in_be32(a) readl_relaxed(a)
         |         ^~~~~~~
   arch/m68k/include/asm/raw_io.h:23:9: note: this is the location of the previous definition
      23 | #define in_be32(addr) \
         |         ^~~~~~~


vim +/out_be32 +148 include/linux/soc/qcom/qup-fw-load.h

   147	
 > 148	#define out_be32(a, v) writel_relaxed(v, a)
 > 149	#define in_be32(a) readl_relaxed(a)
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
