Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF67362
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 00:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693959857; x=1725495857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEcnnXCOXSI2R3EmnBU9y8xXrLZTTgc5ym7M+Ek5UfE=;
  b=YO5BNsz6QuJX/DHFs2RUEsfmQ4Na4KfwoT4XBYmD2CzLgovjAFHpv5K9
   f0rCTzlYExEQhUSeLS5l2O4yH2suJX9yD7BMOQ9OM5AzJl2DjYczBn4QF
   UZzid/1HiKOO9lGLrGODVupsOwqgeS0nhC1I3djz3e7PwC0v6biVeuEz7
   M3FEx9qLnj8nTUcVTU4lw7W+mLWdBJTWKBOWaZJLVmfo3XpvyfmKdj4V7
   nhzcuosl5Jxl8XZLBKfmcpJDLVKyXsHhJVyzujVdxmkFjt44O1xXQ/HdS
   SM1DZQSP+4fe+vf6h6s8P3aHUnFbpAmjOv+6y66bCDauHQ6x6f9QpnXa7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="440911333"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="440911333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 17:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806813180"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="806813180"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2023 17:24:16 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdgL8-0002G2-01;
	Wed, 06 Sep 2023 00:24:14 +0000
Date: Wed, 6 Sep 2023 08:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/6] ARM: DTS: omap4-panda-common: enable aess, add
 phandles for aess and mcbsp1/2/3
Message-ID: <202309060812.XiuQr2In-lkp@intel.com>
References: <070fc6758feb53d2b66372d38924d96ad2822b64.1693918215.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <070fc6758feb53d2b66372d38924d96ad2822b64.1693918215.git.hns@goldelico.com>

Hi Nikolaus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on tmlind-omap/for-next linus/master v6.5 next-20230905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/ARM-DTS-omap5-l4-abe-we-do-not-need-separate-target-modules-for-dmem-cmem-smem/20230906-000110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/070fc6758feb53d2b66372d38924d96ad2822b64.1693918215.git.hns%40goldelico.com
patch subject: [RFC 6/6] ARM: DTS: omap4-panda-common: enable aess, add phandles for aess and mcbsp1/2/3
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230906/202309060812.XiuQr2In-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060812.XiuQr2In-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060812.XiuQr2In-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi:84.3-29: ERROR (duplicate_property_names): /sound:ti,mclk-freq: Duplicate property name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
