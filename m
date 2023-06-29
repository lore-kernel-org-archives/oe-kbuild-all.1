Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449B13AC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688061362; x=1719597362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tAe8b3Y2N2c/CF0N5VJ0ZeJJ8Xk+NpiLktx+rX7DAW0=;
  b=W/Z4KR5Y7w2+oAvfovLC8g9MwXKDVVqqShVjRrgySB3aH8KRJk9SVet1
   PUS6pVVtAUfek/8Sx8ah2nEtZ+k9ntE4m2kuAS9xSlF4p9ilKkER7ouFm
   XrECGvdktgjhEf90GaGOHTufY+E/1NplkLwpA871mjNxKfXzyuF+N/ddd
   vZdP0nOgJ7H29mqKzBncZZQP0AOtFTYUQPEHtI8K+VkxVhqpn6jqyI3x7
   zaYuVwuM5cb/6EMzuGlHoMzWQwJoQOBbu6oBNgu/erZy/KjMJtr2vejUT
   vyB9tBPewnSQE5xpcKWYjuhAeRNM3AdTpJkFEyVbJEU2JiZzHlWhc1Sg7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392906211"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="392906211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 10:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="862013530"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="862013530"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 10:55:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEvri-000EJ9-1y;
	Thu, 29 Jun 2023 17:55:34 +0000
Date: Fri, 30 Jun 2023 01:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/3] ASoC: rt5677: Use agnostic
 irq_domain_create_linear()
Message-ID: <202306300102.yMAJ3kZt-lkp@intel.com>
References: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.4 next-20230629]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-rt5677-Use-agnostic-irq_domain_create_linear/20230629-184911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230629104603.88612-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/3] ASoC: rt5677: Use agnostic irq_domain_create_linear()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230630/202306300102.yMAJ3kZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300102.yMAJ3kZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300102.yMAJ3kZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/acpi.h:16,
                    from sound/soc/codecs/rt5677.c:9:
   sound/soc/codecs/rt5677.c: In function 'rt5677_init_irq':
>> include/linux/property.h:38:18: error: '_Generic' selector of type 'struct device' is not compatible with any association
      38 |         _Generic((dev),                                                 \
         |                  ^
   sound/soc/codecs/rt5677.c:5542:51: note: in expansion of macro 'dev_fwnode'
    5542 |         rt5677->domain = irq_domain_create_linear(dev_fwnode(i2c->dev),
         |                                                   ^~~~~~~~~~


vim +38 include/linux/property.h

1b9863c6aa56d9 Suthikulpanit, Suravee 2015-10-28  34  
b295d484b97081 Andy Shevchenko        2022-10-04  35  const struct fwnode_handle *__dev_fwnode_const(const struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  36  struct fwnode_handle *__dev_fwnode(struct device *dev);
b295d484b97081 Andy Shevchenko        2022-10-04  37  #define dev_fwnode(dev)							\
b295d484b97081 Andy Shevchenko        2022-10-04 @38  	_Generic((dev),							\
b295d484b97081 Andy Shevchenko        2022-10-04  39  		 const struct device *: __dev_fwnode_const,	\
b295d484b97081 Andy Shevchenko        2022-10-04  40  		 struct device *: __dev_fwnode)(dev)
e44bb0cbdc8868 Sakari Ailus           2017-03-28  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
