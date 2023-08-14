Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7D15A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691978203; x=1723514203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+QMvzi81yh+mFu9IZknTHoIchA90XpBkgqOg23VMWs=;
  b=i248xEe0NoK/E0wi4l11X22Mje6dtH7+5l3fPQVlENHkTBUZZ171tVAw
   +ANz25Ozt/a/w8xkZIi/zCnK7QJaxikVbUVdePhm+ZSVlRPElXMwm2f2Y
   PbDgs87bATOXVImRQlSWZhzLdhuvANPbDYPT6/KrA2JFan5P4y8BY8zTr
   6WShV7lmzcG/gOatM47lln+ARg8L5GnZ/Ma9HSuufCWnfJT8lHp7GgkC8
   PoxaBl8bDzxNhJ6tMmJ9e8KhBYE3ca+8CEOA1xKUTZDSr8sChffW51Y7i
   p2jPLBbZXACvq6ZQqteS8594VeasggbtKkKZR7kC1q9GnpvAzyyXGBOaV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="351544228"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="351544228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 18:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="733290602"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="733290602"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Aug 2023 18:56:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVMou-0009JE-1P;
	Mon, 14 Aug 2023 01:56:36 +0000
Date: Mon, 14 Aug 2023 09:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, perex@perex.cz,
	tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
	zhangyiqun@phytium.com.cn, peter.ujfalusi@linux.intel.com,
	broonie@kernel.org, chenhuacai@kernel.org,
	cezary.rojewski@intel.com, siyanteng@loongson.cn,
	amadeuszx.slawinski@linux.intel.com, evan.quan@amd.com,
	jasontao@glenfly.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, mkumard@nvidia.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, CobeChen@zhaoxin.com, TimGuo@zhaoxin.com,
	LeoLiu-oc@zhaoxin.com
Subject: Re: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec
 Vendor IDs
Message-ID: <202308140952.khPgynBT-lkp@intel.com>
References: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230809]
[cannot apply to tiwai-sound/for-linus linus/master v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-W-Wang-oc/ALSA-hda-Zhaoxin-Add-HDAC-PCI-IDs-and-HDMI-Codec-Vendor-IDs/20230731-140118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230731055932.4336-1-TonyWWang-oc%40zhaoxin.com
patch subject: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec Vendor IDs
config: mips-randconfig-r073-20230814 (https://download.01.org/0day-ci/archive/20230814/202308140952.khPgynBT-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140952.khPgynBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308140952.khPgynBT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/pci/hda/hda_controller.c:1051:38: sparse: sparse: cast removes address space '__iomem' of expression
>> sound/pci/hda/hda_controller.c:1051:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got char * @@
   sound/pci/hda/hda_controller.c:1051:66: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/hda/hda_controller.c:1051:66: sparse:     got char *
   sound/pci/hda/hda_controller.c:1053:44: sparse: sparse: cast removes address space '__iomem' of expression
   sound/pci/hda/hda_controller.c:1053:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got char * @@
   sound/pci/hda/hda_controller.c:1053:72: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/hda/hda_controller.c:1053:72: sparse:     got char *

vim +1051 sound/pci/hda/hda_controller.c

  1046	
  1047	static void azx_rirb_zxdelay(struct azx *chip, int enable)
  1048	{
  1049		if (chip->remap_diu_addr) {
  1050			if (!enable)
> 1051				writel(0x0, (char *)chip->remap_diu_addr + 0x490a8);
  1052			else
  1053				writel(0x1000000, (char *)chip->remap_diu_addr + 0x490a8);
  1054		}
  1055	}
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
