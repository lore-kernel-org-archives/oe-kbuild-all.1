Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772DDA31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 06:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676961111; x=1708497111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hYUCXryiM4L3qab7cv2qTNgu2EnjgadpYPHNseM+KU=;
  b=DcFVUI74kh8W+KUGnRq4L/VPMNayOVHPxTu/ERnQZY8m2wqf/YTFVJEc
   El+Ce8KxNK4SXal87DIx0bN8YoAIeZqU3Cud51pUhs9NHveRb5rJs4GD9
   Y98Rki+drQ3twOOI5mqwZowJYHil/RkfDMkZJtqZDXeqphfLcLCj7SnKT
   pdFsHUqNQICXJ+02Z9DSRO1Q8I//CKOtSwP5XLZeJ53krIbvt5bDRzNyH
   MD5tdllrymDYl7+a9wxHeIAgW1uRhB/BF4etgOX666Z12xMTlELO8hjlQ
   MtJ5eUGkm3KgcVQ7lzjWciRNtm5X7HEbsFzJkZxyO8CxfW1GS44BM4Dlz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332563875"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="332563875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 22:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="703923205"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="703923205"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Feb 2023 22:31:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUMBn-000EWM-2Q;
	Tue, 21 Feb 2023 06:31:47 +0000
Date: Tue, 21 Feb 2023 14:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, damien.lemoal@opensource.wdc.com
Cc: oe-kbuild-all@lists.linux.dev, s.shtylyov@omp.ru,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ata: pata_macio: Use of_property_present() helper
Message-ID: <202302211458.tgO9izcv-lkp@intel.com>
References: <20230221023634.87925-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221023634.87925-1-yang.lee@linux.alibaba.com>

Hi Yang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20230220]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Li/ata-pata_macio-Use-of_property_present-helper/20230221-103834
patch link:    https://lore.kernel.org/r/20230221023634.87925-1-yang.lee%40linux.alibaba.com
patch subject: [PATCH -next] ata: pata_macio: Use of_property_present() helper
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302211458.tgO9izcv-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/257ef88e819f378a5925cd9a44857f4591d860e9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yang-Li/ata-pata_macio-Use-of_property_present-helper/20230221-103834
        git checkout 257ef88e819f378a5925cd9a44857f4591d860e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211458.tgO9izcv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/pata_macio.c: In function 'pata_macio_cable_detect':
>> drivers/ata/pata_macio.c:482:37: error: incompatible types when initializing type 'const char *' using type 'bool' {aka '_Bool'}
     482 |                 const char *cable = of_property_present(priv->node, "cable-type");
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_macio.c:484:37: error: incompatible types when initializing type 'const char *' using type 'bool' {aka '_Bool'}
     484 |                 const char *model = of_property_present(root, "model");
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_macio.c: In function 'pata_macio_invariants':
>> drivers/ata/pata_macio.c:975:16: error: incompatible types when assigning to type 'const int *' from type 'bool' {aka '_Bool'}
     975 |         bidp = of_property_present(priv->node, "AAPL,bus-id");
         |                ^~~~~~~~~~~~~~~~~~~


vim +482 drivers/ata/pata_macio.c

   472	
   473	static int pata_macio_cable_detect(struct ata_port *ap)
   474	{
   475		struct pata_macio_priv *priv = ap->private_data;
   476	
   477		/* Get cable type from device-tree */
   478		if (priv->kind == controller_kl_ata4 ||
   479		    priv->kind == controller_un_ata6 ||
   480		    priv->kind == controller_k2_ata6 ||
   481		    priv->kind == controller_sh_ata6) {
 > 482			const char *cable = of_property_present(priv->node, "cable-type");
   483			struct device_node *root = of_find_node_by_path("/");
   484			const char *model = of_property_present(root, "model");
   485	
   486			of_node_put(root);
   487	
   488			if (cable && !strncmp(cable, "80-", 3)) {
   489				/* Some drives fail to detect 80c cable in PowerBook
   490				 * These machine use proprietary short IDE cable
   491				 * anyway
   492				 */
   493				if (!strncmp(model, "PowerBook", 9))
   494					return ATA_CBL_PATA40_SHORT;
   495				else
   496					return ATA_CBL_PATA80;
   497			}
   498		}
   499	
   500		/* G5's seem to have incorrect cable type in device-tree.
   501		 * Let's assume they always have a 80 conductor cable, this seem to
   502		 * be always the case unless the user mucked around
   503		 */
   504		if (of_device_is_compatible(priv->node, "K2-UATA") ||
   505		    of_device_is_compatible(priv->node, "shasta-ata"))
   506			return ATA_CBL_PATA80;
   507	
   508		/* Anything else is 40 connectors */
   509		return ATA_CBL_PATA40;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
