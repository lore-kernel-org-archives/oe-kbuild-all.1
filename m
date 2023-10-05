Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08456AA3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfMuUmGq"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696494340; x=1728030340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zqJwU4dVi5etdviVMLZ9xCVCGN1GcyZWLjzWkRCQokk=;
  b=MfMuUmGqSyrhneea4KovrZOXH8dSjzMgzxQR2o+cI5iTwLzGVS5cOs1V
   2ZS5CoUBJvJ/mGVFFrtLeWKiAKz79zqrXPxmCeNK1piGmsNg53vS6v/M1
   xYOLL9eoRIC0xPOlLn2hoy5WcTzUlkLZxTpN3BIDxhhpYVI+0Hz44/fEP
   EGBrlyjmVtwpTgniF5YxUX9fKMqAhybM7MDckZ7RZbKRsyb6ANGbusLnW
   q4SQkgLxuNjor4VthbDnCIqDZhemgBcPy7B5iXgK3dZhr5J2c1L0Y3ZMf
   k3FvgHQhQRyDSiSvrM5o+wtw7ch2NjDFUVZP4unS0tKqW2Y65Lk69d2zY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383342458"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383342458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 01:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786874179"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="786874179"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 01:25:35 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoJfp-000LCC-0S;
	Thu, 05 Oct 2023 08:25:33 +0000
Date: Thu, 5 Oct 2023 16:24:36 +0800
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
Subject: Re: [PATCH v11 5/7] nvmem: core: Rework layouts to become regular
 devices
Message-ID: <202310051638.C8Yz2WIY-lkp@intel.com>
References: <20231004222236.411248-6-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004222236.411248-6-miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/of-device-Export-of_device_make_bus_id/20231005-062417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231004222236.411248-6-miquel.raynal%40bootlin.com
patch subject: [PATCH v11 5/7] nvmem: core: Rework layouts to become regular devices
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231005/202310051638.C8Yz2WIY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051638.C8Yz2WIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051638.C8Yz2WIY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/layouts.c:19:5: warning: "CONFIG_OF" is not defined, evaluates to 0 [-Wundef]
      19 | #if CONFIG_OF
         |     ^~~~~~~~~


vim +/CONFIG_OF +19 drivers/nvmem/layouts.c

    18	
  > 19	#if CONFIG_OF
    20	static int nvmem_layout_bus_match(struct device *dev, struct device_driver *drv)
    21	{
    22		return of_driver_match_device(dev, drv);
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
