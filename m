Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C810F4FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691494258; x=1723030258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=45kvPZtr/R+4xaMAVzoM0WCj2bbKgNwCdgaI3smr9CI=;
  b=Pj6+UhS4jVT72OuoqUnjapSSUJg/UKITUOnxffM20IhtFr81vmlq2bs9
   aV3G5XmpCKzReJ2WMsVpMSNx+jua7ofi7jgTUuyDEPvTQAPvOxGF4U0kk
   TVuK1b6A9/P7OZ0dWynCgM7TtWy4ZpAwB9KtxS6n1/VNE/UGtERAwwY43
   sZ34F/2tIEwxKfihi/XTZQltFCvwqOdKXOehjjTRFTUkjRXKsPNcrpAdq
   Ja+pX+TIadnqlxqGNaxG2aTLJsOAa5DM+Fuj0z0FohgwDbzsbjlgqRiRo
   R6a8dlcGV60OCOY4BwG2D9rMaPmq3egajGlAqlDS/69XNk0mOOK1ylrfE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369697379"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="369697379"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 04:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796698164"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="796698164"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Aug 2023 04:30:56 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTKvQ-0005Ja-0K;
	Tue, 08 Aug 2023 11:30:56 +0000
Date: Tue, 8 Aug 2023 19:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
Message-ID: <202308081956.p8FHCJY9-lkp@intel.com>
References: <20230801182132.1058707-8-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801182132.1058707-8-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230801182132.1058707-8-miquel.raynal%40bootlin.com
patch subject: [PATCH v7 7/7] nvmem: core: Expose cells through sysfs
config: x86_64-randconfig-x006-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081956.p8FHCJY9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081956.p8FHCJY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081956.p8FHCJY9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_try_matching_available_layout':
>> drivers/nvmem/core.c:2264:1: warning: label 'del_cells' defined but not used [-Wunused-label]
    2264 | del_cells:
         | ^~~~~~~~~


vim +/del_cells +2264 drivers/nvmem/core.c

  2261	
  2262		return 0;
  2263	
> 2264	del_cells:
  2265		nvmem_device_remove_all_cells(nvmem);
  2266	put_layout:
  2267		nvmem_layout_put(nvmem->layout);
  2268		return ret;
  2269	}
  2270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
