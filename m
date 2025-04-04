Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776615B54A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743745911; cv=none; b=u+edC3srjrWEZNgCIQBuKyXBaxDS8Sg6/1kADMIwE7hcZDLtx7+xgs7hAoZjDIrs199WuZ9f4nenboKYSkwVH3SRVOy0JFQF/tgDXqtOVT29zNLfgQqyWcKQEFUUZeiMInuZj906f59goOauExM/BcQQuXUXxaOVWnJA5sQ0Zps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743745911; c=relaxed/simple;
	bh=duAYRq244lKghXLjwlUPtR96qqOm7CqC4g55tLgHcK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg+oEkwyjL9IN3mPBDe4xnTiCbo3GE/ZIoHcVUXTJ6UlUYDyGK3wLqvWdEPvBNpTsDT7QQZGSenntYJGHb1q1rW8QHTTuadzij1LEe/E71oZhOACbgUCWVCu16tk0gwQdfP+vM5BUUBkJG85bGvzpaChZXwmf3sj/SIfD2JDKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMlXbCGP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMlXbCGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743745909; x=1775281909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=duAYRq244lKghXLjwlUPtR96qqOm7CqC4g55tLgHcK8=;
  b=SMlXbCGPqsUrLySXhR+WYCM/yf7kaNp6eqw8Dq8arIKOt97VJLuuYWQt
   lwuTtsVDngPqAJCz28h7FxbfpZoZMyLtt4edMyUm87pvAopmREAzsT1eQ
   X/uHpjO8SGcb73G1aT9hjZTE3Z/BCqjN8OwADS5UL1Y4HuTxtkjHP9AIO
   ls88fpp84+SbmP1rwjECF9k6C1TUIagfR0vW+ZnEK3nYR8276uNEyLjEh
   nI2MXpdkLqdW8tqDwc8rqs+/Qz7Hzo+YlQJHGwfT/0xPC/obMRLHkVPL/
   ygI3kJ9Ef/tUrkJXGlS/LCclV4UDc39cfZOhqX4f1xUapA6fOSp8ghL+4
   g==;
X-CSE-ConnectionGUID: /PMzRUveTlK5+Ve1zRHgUA==
X-CSE-MsgGUID: 6fmfC41cRv2Pc/JbbOjUdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="49036176"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="49036176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 22:51:49 -0700
X-CSE-ConnectionGUID: EPim8gilRX2xDSLhfsQhCw==
X-CSE-MsgGUID: j56jmjC5TESUcP4qGnnCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127025444"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 22:51:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Zxv-00011n-2A;
	Fri, 04 Apr 2025 05:51:43 +0000
Date: Fri, 4 Apr 2025 13:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sukrut Bellary <sbellary@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <202504041306.Dxlb0inM-lkp@intel.com>
References: <20250404014500.2789830-3-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-3-sbellary@baylibre.com>

Hi Sukrut,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.14 next-20250403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sukrut-Bellary/dt-bindings-clock-ti-Convert-to-yaml/20250404-094647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250404014500.2789830-3-sbellary%40baylibre.com
patch subject: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
reproduce: (https://download.01.org/0day-ci/archive/20250404/202504041306.Dxlb0inM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041306.Dxlb0inM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
   Warning: Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
   Warning: Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
>> Warning: Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
