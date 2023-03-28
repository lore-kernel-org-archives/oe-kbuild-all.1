Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867D8BFB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680018135; x=1711554135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7Dc257NEOJMhAqfms5At2NFhQkyHhktedAZR/Cilfk=;
  b=kzyaG/K1ifsyDEbrjDJqygS+Qw1ZoJfqDi4xgD73bBlYDTawn0dfiEf0
   yPc3URp/wfdUNNGFzuYbYGUO5tHbTEu0AHq05nYj0KXGhFmUMi7sR7yUg
   StB/UXGLoMy8cTrc77s5FIi6PbUkZqE4saI+4nZ2DOVT3SfxU4moaKyjl
   YkSAIHmI2KJcDOAdIRByhls/wWFqR21GCFkFnYmUUciRwTU8xFtpomOPP
   cWfvUNwor8LhZ8QE4qvw/aolUjEevA/6Wq0w4hD5DDyJNztSqbG8Azi/m
   GTKaNWdnOd0a9EThA7VSrEiF01tWUKvHcV8iPD6Mgai/DRfVVkxFrk/cY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339326997"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339326997"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 08:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="858139636"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="858139636"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 08:42:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phBSc-000IfH-0O;
	Tue, 28 Mar 2023 15:42:10 +0000
Date: Tue, 28 Mar 2023 23:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, arnd@arndb.de, schung@nuvoton.com,
	mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v6 06/12] dt-bindings: arm: Add initial bindings for
 Nuvoton platform
Message-ID: <202303282310.bOWEkwv1-lkp@intel.com>
References: <20230328021912.177301-7-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328021912.177301-7-ychuang570808@gmail.com>

Hi Jacky,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next linus/master pza/reset/next v6.3-rc4 next-20230328]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Huang/arm64-Kconfig-platforms-Add-config-for-Nuvoton-MA35-platform/20230328-102245
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230328021912.177301-7-ychuang570808%40gmail.com
patch subject: [PATCH v6 06/12] dt-bindings: arm: Add initial bindings for Nuvoton platform
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/d023e63cdc203398c5db3c81ca76d34d22e23fe5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jacky-Huang/arm64-Kconfig-platforms-Add-config-for-Nuvoton-MA35-platform/20230328-102245
        git checkout d023e63cdc203398c5db3c81ca76d34d22e23fe5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282310.bOWEkwv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/npcm/*

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
