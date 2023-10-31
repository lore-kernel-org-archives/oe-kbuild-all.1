Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A321199CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pg6KWm8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698750552; x=1730286552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qvrwnc35erdZoVBiQV02YhA2bWWfgE0gKFuh2GpCkNs=;
  b=Pg6KWm8vGQmce6AIILBEAPTw1nXIJltRzwsNna1WBIYS12kkMY/mdh/G
   0cPqt50JpFQjfZvxDveSUeStZD36VnIkDYvdNhZkj9JOHV6V65q2Zl/8M
   3fkPE0ygLmU7L49Z0/nT1QUJ0mTRXn8Wj6/SKC/UtNL50z4C2NW6Bpfcg
   nZTyKIbDG4g/fHxiiyHXXT9qnXUV214Lq1mc7I9J2GdUFY2S+Y9NxOoDE
   fu+ud0k6kJMu7LGVB+0Y52CJ1rNI9djumlSZ1k1LX6dreWoGgbAOQKJnc
   QH0pNn7AwN2ykPbzAgX7ksl1EhJIKBxNOep13Jl1JBEMeJH0dcL1icZo9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373316756"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="373316756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 04:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8298958"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2023 04:09:08 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxmcL-00007a-1t;
	Tue, 31 Oct 2023 11:09:05 +0000
Date: Tue, 31 Oct 2023 19:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kevin-lu@ti.com, shenghao-ding@ti.com, baojun.xu@ti.com,
	peeyush@ti.com, navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Message-ID: <202310311857.BgEnJVnO-lkp@intel.com>
References: <20231028092409.96813-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028092409.96813-1-baojun.xu@ti.com>

Hi Baojun,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6 next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ASoC-tas2783-Add-source-files-for-tas2783-driver/20231028-172643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231028092409.96813-1-baojun.xu%40ti.com
patch subject: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310311857.BgEnJVnO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311857.BgEnJVnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311857.BgEnJVnO-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/soc/codecs/tas2783-sdw.o: in function `tas2783_calibration.isra.0':
   tas2783-sdw.c:(.text+0xd48): undefined reference to `efi'
>> nios2-linux-ld: tas2783-sdw.c:(.text+0xd50): undefined reference to `efi'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
