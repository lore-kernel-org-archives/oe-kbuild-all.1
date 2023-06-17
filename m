Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6391117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687022325; x=1718558325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0+MiT40f7rM7h8fcaaQQJW8h2NtZlvBOu6olaTnF+lA=;
  b=MYU87ASN7OWBM29agQeDpN9l6Xd+/9LshOkaQZTzWuuQOGQ8teR5nTPG
   HREOrdqDupSjxzzULIbs5wbaRHq2ykuvMdQX5ERxAahqjgAYJxrR8M2aH
   +dKhFHyE+1ofBmoC+VP1NVnOTDbkl6enQG0ghl/1dYm0kBmqCmfZ1DFR5
   vTU+2QhzwPstEYGLGMgNwU8+5Eh/NXhP9C/kn4SV7Ihn2u0B9opbjH4hS
   JPewQw+1W4YYhnhieUo9WXOBThEWJNCL2Lx9/NVPi/EK0RNKoPTO2U5Hy
   i/QfdKb1yhukZIQOk0mjo5TpmhYXL8/KUWAv0QHpDC6lb9pTm0QXDORTb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425352970"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="425352970"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 10:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="887451041"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="887451041"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jun 2023 10:18:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAZZT-0002y4-2W;
	Sat, 17 Jun 2023 17:18:43 +0000
Date: Sun, 18 Jun 2023 01:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 4/4] arm64: dts: rockchip: rk3588: add PCIe2 support
Message-ID: <202306180135.Z7xeXQW4-lkp@intel.com>
References: <20230616170022.76107-5-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616170022.76107-5-sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus rockchip/for-next linus/master v6.4-rc6 next-20230616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-PCI-dwc-rockchip-Fix-interrupt-names-issue/20230617-010332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230616170022.76107-5-sebastian.reichel%40collabora.com
patch subject: [PATCH v1 4/4] arm64: dts: rockchip: rk3588: add PCIe2 support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230618/202306180135.Z7xeXQW4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180135.Z7xeXQW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180135.Z7xeXQW4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588s.dtsi:1146.25-26 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
