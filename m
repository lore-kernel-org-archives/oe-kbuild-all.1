Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC813AA2C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006816; cv=none; b=q7EXGNu6g26u/YHDKdJtsX4h6uuMoR1kY1+mz7bglhgzYkxNzESNqNsbIzPwA74XglBSt2Pk14g1S3aBeL8O1BUtUsBR1PlddWgz4s1XFwDViIMamjxn6rNfjmpXQfE+TrYTjKc8N9pGTisj2ai52bjb5AVbX9x3ZsqaQiqlqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006816; c=relaxed/simple;
	bh=S9U3sM9N5A0LiKw6Q3g4fEO8EPPuQt5Lh9IuVLH+CKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiobnTYDs4lV+fEChOeE3RF/SYNGL6SY0tHyQsrvUr+X0PiRROdNkmzgc1Epio1SMHy0lTxPEJAmFXGVdGgCo4hEabGCteHv5RvzqGR0mJoWrSUozRelP7hs4u6cqAYZfdL5MDDO77xKTM66+ATpPnY4OQ8mAKp48QncOmeHbhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4oKkR16; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4oKkR16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720006815; x=1751542815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9U3sM9N5A0LiKw6Q3g4fEO8EPPuQt5Lh9IuVLH+CKM=;
  b=I4oKkR16eYDZlgQ/I+//dtktuqFrqrJwy4/jYuw705nsFFK209y+txG8
   Gu/TbYPTa3m70sLqltP12L6m56b7eH3ZgcC3fInRVvJ4P+Hq23x3Q47Pw
   rV7PkYvy0dM1y+aShkL5SAx06/xn4ZzA2/0fT4wSNVch8Irt+3UrJGV0R
   9H+Rzp83ieGT2wneV3zRfgV774CH98ozx6EKkKEUwlPvSBn7rVyHF751U
   mlF7CYXwAd+u44sWBRut+9q+POr/iVGNMj3cXiwCTW/2ZTHTxzmp9pZOB
   OZfaA6CkdLrUQJiCEbn1Kccv+nz5PSq6wqrjUelpLO2y4VO4828YLIKEt
   w==;
X-CSE-ConnectionGUID: sV+8e+7DT8Se4ovrqwRc3A==
X-CSE-MsgGUID: VyylojKHQU25+1WpUq/8jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16884914"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="16884914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 04:40:14 -0700
X-CSE-ConnectionGUID: AkWT8IW8SJ28jeGL1Ftfmg==
X-CSE-MsgGUID: Y55JEonPSJqeOYx9X3Qd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46007675"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2024 04:40:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOyLI-000PfO-2w;
	Wed, 03 Jul 2024 11:40:08 +0000
Date: Wed, 3 Jul 2024 19:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leith Bade <leith@bade.nz>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, frank-w@public-files.de
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, didi.debian@cknow.org,
	Leith Bade <leith@bade.nz>
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt7986: add gpio-hog for boot
 mode switch on BPI-R3
Message-ID: <202407031954.bBLv9YRp-lkp@intel.com>
References: <20240627075856.2314804-3-leith@bade.nz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627075856.2314804-3-leith@bade.nz>

Hi Leith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leith-Bade/arm64-dts-mediatek-mt7986-fix-the-switch-reset-line-on-BPI-R3/20240628-001353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240627075856.2314804-3-leith%40bade.nz
patch subject: [PATCH 2/4] arm64: dts: mediatek: mt7986: add gpio-hog for boot mode switch on BPI-R3
config: arm64-randconfig-051-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031954.bBLv9YRp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031954.bBLv9YRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031954.bBLv9YRp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pinctrl@1001f000: 'boot-mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
