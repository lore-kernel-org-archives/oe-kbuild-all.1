Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB0380
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690683621; x=1722219621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VH9CXu3h3n38vv1k1UlkLcdjHE4ch4uF3Z8RpGbyTSE=;
  b=OQvqFuiiwNkAB9UZMfu5BGwxidU51TIuc895CGe4/JytlDbuqnpcwkgZ
   jDGoV+XslX6x0TOLUztvv9NfJtikR9pLI94cqT9TeINsHv2B10rTW7oMn
   eR4QbPt1oeftODjenrYS7PFZbH945t5dIcx9LjddKROYhJCyFZkW7igRw
   HdytNTKHdZYrGz4J1zY8LlJV1QTPvglgxVHlFsuITKjxb7V2eI1D/C8fY
   eKLmlgwhmtRU103KR5RhPee3KuHWvBEmGAC7MUq2vcxqAuLIc2wniQSkO
   35ku0dTZFQu2/2wqjOIKbMHv4w80Vg+VoiEQEB0oMbcv7Kjk1k7wXJSbo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="432614594"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="432614594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:20:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="797824800"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="797824800"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2023 19:20:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPw2Y-0004Nr-1M;
	Sun, 30 Jul 2023 02:20:15 +0000
Date: Sun, 30 Jul 2023 10:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 7/8] arm64: dts: ti: k3-am625-beagleplay: Add HDMI
 support
Message-ID: <202307301016.Yf3VYmhw-lkp@intel.com>
References: <20230728173438.12995-8-a-bhatia1@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728173438.12995-8-a-bhatia1@ti.com>

Hi Aradhya,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core krzk/for-next krzk-dt/for-next linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aradhya-Bhatia/arm64-dts-ti-k3-am62x-sk-common-Update-main-i2c1-frequency/20230729-013718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230728173438.12995-8-a-bhatia1%40ti.com
patch subject: [PATCH v3 7/8] arm64: dts: ti: k3-am625-beagleplay: Add HDMI support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230730/202307301016.Yf3VYmhw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301016.Yf3VYmhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301016.Yf3VYmhw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts:514.72-73 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
