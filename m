Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A592C9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691937942; x=1723473942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zsDPfkuD7g67ETx7TCV+frwrh/8cdwe6/5TOBZ3FrAo=;
  b=c6L2J8LzYf6j3WDQV+Jewk3wqxCA/gPseFjE6wWHhqNXHrjdzWFOgFNw
   gFC7oq17uK7NxItntdNpWFQmpNbPuBjr/MWYYf9SquvcXovLFVmxWkUPP
   OltZL9IzaK85qRMtqSuoP8m0lbNejcf3YHqvAlHEsvz6a4hzz8JB4zq12
   0664NG8Nqi8NnQkMrT/RjN5x+x3j0T8h6vlhbcNcaCeq3Ju2TxauTd9ax
   sezGNGgeKt7uVR0uSqCmCRF2qQFYPmilAcESFD6b9I+47CLdJccYtwqQ2
   7W7ijU2hOludYa2lQVulb4q2XE26agHb1SQvKKg7s9nxN7FE9nbHES3M4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356861353"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="356861353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 07:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="979718407"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="979718407"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Aug 2023 07:45:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVCLZ-00096u-0l;
	Sun, 13 Aug 2023 14:45:37 +0000
Date: Sun, 13 Aug 2023 22:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: verdin-am62: Add DSI display support
Message-ID: <202308132205.nYgQd2fC-lkp@intel.com>
References: <20230812191123.14779-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812191123.14779-1-francesco@dolcini.it>

Hi Francesco,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/arm64-dts-ti-verdin-am62-Add-DSI-display-support/20230813-031349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230812191123.14779-1-francesco%40dolcini.it
patch subject: [PATCH v1] arm64: dts: ti: verdin-am62: Add DSI display support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230813/202308132205.nYgQd2fC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308132205.nYgQd2fC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308132205.nYgQd2fC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi:803.1-5 Label or path dss not found
>> Error: arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi:809.1-11 Label or path dss_ports not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
