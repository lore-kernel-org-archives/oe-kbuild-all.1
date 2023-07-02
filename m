Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEEA2116
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688321627; x=1719857627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=If1nxiVi0J0l0aK2VOknfYaZ1n8vkCyShR2rBjYmeXQ=;
  b=RdOH1JJVwjtbVyJ/99bsD5RfS5Zv5HDfI30a19p4KbUTYiSP3upArf5A
   +Q2jw7nP0nJCg5fm+61O2vFcfEyoBVeu+bfut6xT4VVg7adUVcIAkg+TS
   o/MVbaCOpfY8CZJuPGPEHRM07Xks9cRkut0mNSKfA0v5STs6GbUNi4ulX
   WPmxdjZ02NFzasPNA11n4rgsmaVH3ihnnFFnNHj3ADtjWc58BTXHyuNz4
   i4GhoTiAZeMRHPLqxeRZcYesx9duqiP3mFAuq9NX75rbfrDn9wd6yo+cJ
   FXDaINHSH1neJYP+fgIosAkhS+ScG8v/x0p9QIeKcp2MoWWwJbm9BMwTl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449103555"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="449103555"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 11:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695574196"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="695574196"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jul 2023 11:13:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG1Zw-000Go3-0g;
	Sun, 02 Jul 2023 18:13:44 +0000
Date: Mon, 3 Jul 2023 02:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [jmondi:tmp/ov2680 9/29] drivers/media/i2c/ov2680.c:24:10: fatal
 error: media/v4l2-cci.h: No such file or directory
Message-ID: <202307030241.9WTVVnTZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git tmp/ov2680
head:   225bc92c21983173d3c13a0db0b83e466bd03753
commit: a92430c91d2bc5db479b35b6983cc71bdf5c180b [9/29] media: ov2680: Convert to new CCI register access helpers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230703/202307030241.9WTVVnTZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030241.9WTVVnTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030241.9WTVVnTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov2680.c:24:10: fatal error: media/v4l2-cci.h: No such file or directory
      24 | #include <media/v4l2-cci.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +24 drivers/media/i2c/ov2680.c

    23	
  > 24	#include <media/v4l2-cci.h>
    25	#include <media/v4l2-common.h>
    26	#include <media/v4l2-ctrls.h>
    27	#include <media/v4l2-subdev.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
