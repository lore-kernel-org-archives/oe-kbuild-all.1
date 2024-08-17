Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09C3716D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723873293; cv=none; b=YV0k59fQSonbGLM7JjRCodc81qCo0L9zdrYAwCXxAE0fQGsss7SI9z4nGBF9ZwRoySSc20kMM/WGx0PTDkEbJEIuMvTnST3N7Ynf5qN3tY7h0qZQcz6mAEGWxEbB8+X8Pjq9qHNsHq6BOLE3w6/pA6tJCd6ykJ23MDr8rU2hFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723873293; c=relaxed/simple;
	bh=UT3TEXjAnt6juaSW5v7iJywRiqzsU/IKcktZg/tIjHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRSCJgmPKES/+X1fFH/z2mijv1NdPC4TFo0a4c8Ndk2EVP63DG3IR5KMi+citrtpAc+QoZFSPTKgyNdHF3UcuVCH1gNNdvs4NPtT3NUCmIZxtBUZ9BVYqqjdzj8HJAoS0h1nY83rmnjNkbg8uKAarWpETpukav2+xD0M0U1eg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6gxn1E2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6gxn1E2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723873292; x=1755409292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UT3TEXjAnt6juaSW5v7iJywRiqzsU/IKcktZg/tIjHE=;
  b=F6gxn1E2RLO47GqstEah8YgNy3xnuBb4r2KUH5sdGixYPn94JtdAu1uh
   DnGcECE5fzNYYoF2Ov2iSHpE6OoIjCYsZKO3R4zEJgg3VmxcELy9w/3JE
   ojcqJ1SJ75l1mAyDDy7DxiFJVYtrBA0AGj8/7jyUpmgVNkthpPyTUVpDb
   ooORNY6u2Oqhw1NbhqlFP8mz2vx4kfsLWKOkC+VLOMHryvJmzapfv0n7F
   6BP+MUQhjGA2yxt6sRC63sR23d7j+BXy78i5Yjq4Oxn+Kk/DR0AvOVMLq
   Ecp5JOKQT6bhB+LAnCd5lEnMGzCDUzvSdjldL3J0Zbm6FAPVU3iCoD5oP
   A==;
X-CSE-ConnectionGUID: mkMtkCHdTnSUp0LEdNTQww==
X-CSE-MsgGUID: TU9Z6KTBTKi6o8vSHPTF3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33586383"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="33586383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 22:41:31 -0700
X-CSE-ConnectionGUID: iTH+5IiAQmidIYMfmvrviw==
X-CSE-MsgGUID: W28H85x6Tz2caN/vW2hXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="64761382"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Aug 2024 22:41:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfCBp-0007DG-1w;
	Sat, 17 Aug 2024 05:41:25 +0000
Date: Sat, 17 Aug 2024 13:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO linename
 typo
Message-ID: <202408171324.4kdqlh1v-lkp@intel.com>
References: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/ARM-dts-aspeed-yosemite4-Revise-i2c-mux-devices/20240816-173326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240816092417.3651434-29-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO linename typo
config: arm-randconfig-001-20240817 (https://download.01.org/0day-ci/archive/20240817/202408171324.4kdqlh1v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171324.4kdqlh1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171324.4kdqlh1v-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1721.1-6 Label or path i3c0 not found
   Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1764.1-6 Label or path i3c1 not found
>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:1833.1-7 Label or path jtag1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
