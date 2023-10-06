Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807F37CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auL+M+Jx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696618109; x=1728154109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6DtPNARE1Y4VHrd4i4gh4MDRtNvn2j6lY4pwXD5O0o=;
  b=auL+M+JxJUHOr2bytpZL6OnW+fAcnql5d7AFG9Rv4aOc3b4hkcu1JuHm
   1I8uUQDxHTu+utt/omm24uSl/eYrXLJWjVZ+ZVQDnhcDwyXFOjSOkjX6d
   McRoONiNaJUJtw3am76rSzUl4KciYx9LzhJEEFVYorBd4YMUkG0X0tWW3
   bbdT9NOEB+317XGlyuaNhcaoV9jFbDkCv3mlYdQTSRjE49HcScuFqeb4W
   L4V7jigo/cr8WXqG3fF0TSiNTz/1yTlV8ck1bIVTPFf5Le7/vKCIQcVME
   a4BTcZqlucqKs60VbI85ZdJwtG878x3o5aGSrsCjY4037xGuM1WbY19DR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="414806016"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="414806016"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 11:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="895984360"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="895984360"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2023 11:46:55 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qops9-0003Xt-16;
	Fri, 06 Oct 2023 18:48:25 +0000
Date: Sat, 7 Oct 2023 02:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 7/7] nvmem: core: Expose cells through sysfs
Message-ID: <202310070203.rNhXeE2Q-lkp@intel.com>
References: <20231005155907.2701706-8-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155907.2701706-8-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/of-device-Export-of_device_make_bus_id/20231006-000111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231005155907.2701706-8-miquel.raynal%40bootlin.com
patch subject: [PATCH v12 7/7] nvmem: core: Expose cells through sysfs
config: m68k-m5208evb_defconfig (https://download.01.org/0day-ci/archive/20231007/202310070203.rNhXeE2Q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070203.rNhXeE2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070203.rNhXeE2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvmem/core.c:22:
   drivers/nvmem/internals.h: In function 'nvmem_destroy_layout':
   drivers/nvmem/internals.h:55:47: error: no return statement in function returning non-void [-Werror=return-type]
      55 | static inline int nvmem_destroy_layout(struct nvmem_device *nvmem) { }
         |                                               ^~~~~~~~~~~~
   drivers/nvmem/core.c: In function 'nvmem_register':
>> drivers/nvmem/core.c:1045:1: warning: label 'err_remove_dev' defined but not used [-Wunused-label]
    1045 | err_remove_dev:
         | ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/err_remove_dev +1045 drivers/nvmem/core.c

  1040	
  1041		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
  1042	
  1043		return nvmem;
  1044	
> 1045	err_remove_dev:
  1046		device_del(&nvmem->dev);
  1047	err_destroy_layout:
  1048		nvmem_destroy_layout(nvmem);
  1049	err_remove_cells:
  1050		nvmem_device_remove_all_cells(nvmem);
  1051		if (config->compat)
  1052			nvmem_sysfs_remove_compat(nvmem, config);
  1053	err_put_device:
  1054		put_device(&nvmem->dev);
  1055	
  1056		return ERR_PTR(rval);
  1057	}
  1058	EXPORT_SYMBOL_GPL(nvmem_register);
  1059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
