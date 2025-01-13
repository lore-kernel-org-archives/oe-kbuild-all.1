Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97E240253;
	Mon, 13 Jan 2025 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781968; cv=none; b=Mg0WyBS6f4eZxVtlRp6435d+kjmTqIA4bvJjlnkOIMe+sMZ62av4dn9Pke2/cOT1hecx7/E/yNNbtfk0qFVT7D+jRAqseJQL59jdi8PvbixedlIzz9GV34mPSkjsp/K4Y1SArCTSlBCHXqOHnLckNgiswtHnPJa5zCA6SjUGJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781968; c=relaxed/simple;
	bh=73D5EHe/Vgj6koGgSYdh+Yle0nMTbNBUnceSww4jyq8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cTY3YLu7rzY3LHYS+ie03sJ2G2iqXuQIZBHLrqFeTO7ZuPLTME7fJteqkgmLb2hm796UValICHgycZq4jo1G/gPV+Pwx9BMqXKe60WAUgNQo+9lh4yk2ETcCKyS1x8YAnblm64AYDZk6BNAa8R5VgsbF3bQxCQbmMBTHlpZNk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfOQiOLm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfOQiOLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB2EC4CEE4;
	Mon, 13 Jan 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781968;
	bh=73D5EHe/Vgj6koGgSYdh+Yle0nMTbNBUnceSww4jyq8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MfOQiOLmtiZszoCJizUkuHWAr8UTK+MHfQ3OoJuleUWBGRwrxuvTwDO21wUuejKwv
	 E+kSW4GzY4BC+LN46kbEibK3lWFSOE64/RWOsqisuGcjdNXREKmQpK0qbN3Z5RT1k4
	 O8UDuFXX9hkxXoAjiP90toBFuHiCPoeiAJiHQP/PIwDoOXNm+ongQ5FNElp30dXT+3
	 NmLqCJ/5TW1aXlU7fueGswJlbZ2kQ0UPYwdrumrc9gMU8V2osUGKKTCltO1dBg+bIu
	 g2czujMlqzvSAV4QOOgzcSK+F2xtkr9DiFKaH1qnvgIFJOucT+UlG1yepKOsV6QzP0
	 RXtCEpVA3AAOg==
Date: Mon, 13 Jan 2025 09:26:07 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, "Kirill A. Korinsky" <kirill@korins.ky>, 
 oe-kbuild-all@lists.linux.dev
To: kernel test robot <lkp@intel.com>
In-Reply-To: <202501122343.SKoJXYQa-lkp@intel.com>
References: <871px910m1.wl-kirill@korins.ky>
 <202501122343.SKoJXYQa-lkp@intel.com>
Message-Id: <173678160118.2153260.16967853026754163149.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add HONOR MagicBook Art 14
 devicetree


On Mon, 13 Jan 2025 00:03:47 +0800, kernel test robot wrote:
> Hi Kirill,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20250110]
> [cannot apply to robh/for-next v6.13-rc6 v6.13-rc5 v6.13-rc4 linus/master v6.13-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Korinsky/arm64-dts-qcom-x1e80100-add-HONOR-MagicBook-Art-14-devicetree/20250112-061420
> base:   next-20250110
> patch link:    https://lore.kernel.org/r/871px910m1.wl-kirill%40korins.ky
> patch subject: [PATCH] arm64: dts: qcom: x1e80100: add HONOR MagicBook Art 14 devicetree
> config: arm64-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501122343.SKoJXYQa-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122343.SKoJXYQa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501122343.SKoJXYQa-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts:1093.1-12 Label or path ufs_mem_hc not found
> >> Error: arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts:1102.1-13 Label or path ufs_mem_phy not found
>    FATAL ERROR: Syntax error parsing input tree
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 202501122343.SKoJXYQa-lkp@intel.com:

arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']





