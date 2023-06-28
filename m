Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C18BFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687945074; x=1719481074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bMH1H2qgHMXVW7BeCJJ/EQn7XjdejMnvVsBOxaBiSus=;
  b=gohdjFrzKEyyqgk088JM64B6mcP0Qz6LhbEWT8t7R9tDN+vNoQJlC7q1
   lT/XdagwP8iAurTPYFW7K/bs2bQt59DYmzkWAnirEwpXqK1saH73Hbut7
   3NJ8XygP4gmEHW3qEw9f683TPcIQuL2KGMgFp3C93+d5KUMV0CzF8FtOK
   xvRdHY5A+S3zV+K5c2rvbxcXIzZjz92OWCjip3QNTPMHYmarTDUaY4Es9
   pQH0Et8DsrdUuaSFuBLVjGkKsD8+eleIggg418UtsQ4xAUDHDHLQLi8mI
   uD4aM/QB7/tlUK0oLEOS09daFkaw8nVLXQkRQ2wPruSS8OokgUbXMHb0m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341384719"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="341384719"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 02:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="786986658"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="786986658"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 02:37:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qERc6-000DAF-0G;
	Wed, 28 Jun 2023 09:37:26 +0000
Date: Wed, 28 Jun 2023 17:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, martin.hecht@avnet.eu,
	michael.roeder@avnet.eu, linuxfancy@googlegroups.com,
	hdegoede@redhat.com, Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] media: i2c: Add support for alvium camera
Message-ID: <202306281747.eCVPev24-lkp@intel.com>
References: <20230620122225.58862-4-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620122225.58862-4-tomm.merciai@gmail.com>

Hi Tommaso,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on robh/for-next linus/master v6.4 next-20230627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/dt-bindings-vendor-prefixes-Add-prefix-alliedvision/20230620-202420
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230620122225.58862-4-tomm.merciai%40gmail.com
patch subject: [PATCH v7 3/3] media: i2c: Add support for alvium camera
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230628/202306281747.eCVPev24-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281747.eCVPev24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281747.eCVPev24-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/alvium-csi2.c:23:
>> drivers/media/i2c/alvium-csi2.h:15:10: fatal error: media/v4l2-cci.h: No such file or directory
      15 | #include <media/v4l2-cci.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/media/i2c/alvium-csi2.h

    12	
    13	#include <linux/kernel.h>
    14	#include <linux/regulator/consumer.h>
  > 15	#include <media/v4l2-cci.h>
    16	#include <media/v4l2-common.h>
    17	#include <media/v4l2-ctrls.h>
    18	#include <media/v4l2-fwnode.h>
    19	#include <media/v4l2-subdev.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
