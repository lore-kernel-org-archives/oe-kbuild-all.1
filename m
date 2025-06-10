Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203661A8401
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545390; cv=none; b=LkWU5OdkcGclvDsw4IctX80Upg+Yf7zB++0W8qPv2WFOaYeqg3vUmVJo0mjCaloB0lkyU2/LqNRjQpuGqtSRJJakDPHleuhh4Dyug7ZyCKA10uWuhI03se4LhnfTeO/wmfdnQTfIWeJRPrikGuhMv481XFltPfJNhxSpT7yVbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545390; c=relaxed/simple;
	bh=8W5IjGiwIT2bccpkghb3hDyV7lU4ODVskwbQCmkmxKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYHVl2zV6A81kUpll8LnJrPdE9TZu4epcN05K2lLX9KeA1sUBFeE8jKA/SF4PIDLjMR102JRJ6DKb3kGvNEBqi7YKGPIUJU1AoA9soHajEEnBKtqQtP7w3l6r6RovqBEQFOktpbPlK6EYp4zZLeeKY3CYbLRO5PIcwTdwXPeANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRb/vSmb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRb/vSmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545389; x=1781081389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8W5IjGiwIT2bccpkghb3hDyV7lU4ODVskwbQCmkmxKE=;
  b=cRb/vSmbC7MzRDKePpM7+ukh54zvdXrHeFnePGCaZZ92FvPROoiNW5gK
   fuNgYbL23M69FsBMqfNRkIhBdco6+j9XwqWMETl7qRVtNIz3CcRzWRmOk
   ACPn5re28a2XOfgl/ZbKlGt0MnwFaSpb6rtDWrc2pNmJMEdty4d65aDFF
   PPoAEf8hikTw7VUXGLMKrOVk+2aHgZ3LFF5bQ+pI+z4+fllEjeE9H52/7
   OYR7ExHuSx6tcnJE2qaTtCL/U5l1AMEn4G6Ss7zM+dYNIhm1AO0MMD+/l
   34bdQbBoUcI6zD1Z6Wj+JnnU9xXRl2WVFXQv5m3BqRVcC+zN9dhmryP3c
   Q==;
X-CSE-ConnectionGUID: iN6x8rkJSxW7VGP+M8FN1Q==
X-CSE-MsgGUID: MzPqqSF5TMSwHdG/+pRFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77045672"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77045672"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:49:48 -0700
X-CSE-ConnectionGUID: qdHXeNmgSO+Ifk0xPk5OAg==
X-CSE-MsgGUID: GGRTpL3hQb2W0U4VIzVg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147709704"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 01:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOufx-000808-20;
	Tue, 10 Jun 2025 08:49:45 +0000
Date: Tue, 10 Jun 2025 16:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 962/1237]
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22
 (fcs,fusb302): 'connector' is a required property
Message-ID: <202506101656.WXufYKsj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b27cc623e01be9de1580eaa913508b237a7a9673
commit: 49760b9f60528393cca3ea35c4d0719f84215a48 [962/1237] arm64: dts: rockchip: add overlay for RockPro64 screen
config: arm64-randconfig-051-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101656.WXufYKsj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101656.WXufYKsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101656.WXufYKsj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
