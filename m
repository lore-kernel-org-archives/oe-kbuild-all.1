Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E61106
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5gFqzIj"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696474065; x=1728010065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uuYcl2gwLwNMbRIgiECQYyuCFC72W2y1aLHEVrLtUcU=;
  b=K5gFqzIjao6N4Z/TGatOTJWNiGttRsU0qXD/2V+gGkjIKaXoT3ZA5FKs
   5lK6Sqot/i9omWLSPuzw05+VKXfgGbtTKJ63Kv5wwgbN1BbJpcNvKiFFw
   MCW0tM0bjp3LZEgScfX/4TE4WvOE8AW3ySs4kwAw1hilcWoLDEW8BWS+X
   nS1R/s/KhcC+1vebJvLW3pbLRjRl1KDc6czIE0Y0nxtnSCmuHbLen1e+W
   4IN5sesNxCkB7ptrRqERSjbhE8O+RNsF+AXpjTgc/MS/gwuD7nw1S6BaX
   L8cTi32uzQBrH215E6o8meH6LOq1uW3InOWyR3CVXuYTP3ci8BDqdxeVS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368447637"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="368447637"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 19:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925417762"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="925417762"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Oct 2023 19:47:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoEOn-000Ku5-2k;
	Thu, 05 Oct 2023 02:47:37 +0000
Date: Thu, 5 Oct 2023 10:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Michael Walle <michael@walle.cc>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robert.marko@sartura.hr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v11 3/7] nvmem: Move of_nvmem_layout_get_container() in
 another header
Message-ID: <202310051011.axjCaPag-lkp@intel.com>
References: <20231004222236.411248-4-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004222236.411248-4-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.6-rc4 next-20231004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/of-device-Export-of_device_make_bus_id/20231005-062417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231004222236.411248-4-miquel.raynal%40bootlin.com
patch subject: [PATCH v11 3/7] nvmem: Move of_nvmem_layout_get_container() in another header
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231005/202310051011.axjCaPag-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051011.axjCaPag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051011.axjCaPag-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/rtc.h:18,
                    from include/linux/efi.h:20,
                    from arch/x86/kernel/asm-offsets_32.c:6,
                    from arch/x86/kernel/asm-offsets.c:29:
>> include/linux/nvmem-provider.h:256:1: error: expected identifier or '(' before '{' token
     256 | {
         | ^
>> include/linux/nvmem-provider.h:255:35: warning: 'of_nvmem_layout_get_container' declared 'static' but never defined [-Wunused-function]
     255 | static inline struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +256 include/linux/nvmem-provider.h

   254	
 > 255	static inline struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem);
 > 256	{
   257		return NULL;
   258	}
   259	#endif /* CONFIG_NVMEM */
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
