Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A61CAAD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXgPxhYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697465832; x=1729001832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sr/NFE3p7vY2U5QajXibpVrl6wIdVxW2WUxzSiB9Xb4=;
  b=HXgPxhYCcM457BaFxILD9zWFg++N6Fs7gsVlvRJZd71MbaUM8sSZ1Uof
   SPIvZS9nXe0rzWx0YJ6LweXe8umHNEnpneOzvW5c3qvWQod63zHP+cPT5
   /dgvRoQX3SkJXiSvdvSxSSJu5G9JnXVGn95RXLIfZZjlyRjas4NJxS2zB
   2L+z0nc8A9MtgpzgKxLK4QEHzwcymR0oyCpWKzU7e1PyFZ3R5oAVRMocx
   zM4G9bukq5gCs/qSHxUMIcxB2e7SHqK3G8QuPshgNehx6xSa3KvBnZiQ+
   Eehq9mcKmvJDrVqAQj9GAMtllHUZlcuqR7AH9J2DtTzuZjrpw5lrS7HJu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="452016767"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="452016767"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 07:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="826031861"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="826031861"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 07:15:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsONP-0008Pn-28;
	Mon, 16 Oct 2023 14:15:23 +0000
Date: Mon, 16 Oct 2023 22:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [matthias-bgg:v6.6-next/dts64.2 7/19]
 arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error:
 dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
Message-ID: <202310162249.WBktvf2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.6-next/dts64.2
head:   976868a021ee654f4cf6eb6a2f40f95c78c04093
commit: 39da9a394be05ea5ab1e08131916354e176ddd7d [7/19] arm64: dts: mediatek: add power domain support for mt8365 SoC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310162249.WBktvf2B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/mediatek/mt8365-evk.dts:14:
>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
      12 | #include <dt-bindings/power/mediatek,mt8365-power.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 arch/arm64/boot/dts/mediatek/mt8365.dtsi

  > 12	#include <dt-bindings/power/mediatek,mt8365-power.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
