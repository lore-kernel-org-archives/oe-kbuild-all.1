Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A728BF3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688514670; x=1720050670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yOJZwC6ZGS8jgQ00X6oteNFAI9yaGaJLLGDjLHczns=;
  b=AjKriwaXrw2i8og+PQ70eYpZh0EgL/wk4Svkij5zyGs9EHRBFgBy06Lr
   I1FptYtJg3Gz40IboGqsGb3fuZb0Icm+crH3OIuuL1Srv573Ic6RKvyLG
   gW5ZpjhZlsQAsn8MdnLUdGBNDfgNnzG0n3/iT15oBfPM9VoDy83ihcrQo
   UPcmgnQ5p5lI8PFNt/izXm77NHqBhScoiqDJVYv2jz3kayoo488PYs554
   vcGNBzsgCyCRIDDHb4YMFudWFBZ/yj7G6VlI/dHRc61UOYPltVlGt/KdT
   SawxCvsRhuERANQcA53jhb9HYuxLFYCKulVmshMmeXpUgKWONJVS76AnC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348001261"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="348001261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 16:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="722197933"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="722197933"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2023 16:51:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGpnV-000IeP-1E;
	Tue, 04 Jul 2023 23:51:05 +0000
Date: Wed, 5 Jul 2023 07:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: pca995x: Add support for PCA995X chips
Message-ID: <202307050723.zYRb9qWz-lkp@intel.com>
References: <20230704202843.91867-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704202843.91867-2-marex@denx.de>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on krzk-dt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/leds-pca995x-Add-support-for-PCA995X-chips/20230705-043046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20230704202843.91867-2-marex%40denx.de
patch subject: [PATCH 2/2] leds: pca995x: Add support for PCA995X chips
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307050723.zYRb9qWz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050723.zYRb9qWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050723.zYRb9qWz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-pca995x.c:190:18: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Werror=incompatible-pointer-types]
     190 |         .probe = pca995x_probe,
         |                  ^~~~~~~~~~~~~
   drivers/leds/leds-pca995x.c:190:18: note: (near initialization for 'pca995x_driver.<anonymous>.probe')
   cc1: some warnings being treated as errors


vim +190 drivers/leds/leds-pca995x.c

   183	
   184	static struct i2c_driver pca995x_driver = {
   185		.driver = {
   186			.name = "leds-pca995x",
   187			.owner = THIS_MODULE,
   188			.of_match_table = of_match_ptr(pca995x_of_match),
   189		},
 > 190		.probe = pca995x_probe,
   191		.id_table = pca995x_id,
   192	};
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
