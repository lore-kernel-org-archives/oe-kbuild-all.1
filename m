Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652153C097
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686177016; x=1717713016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=duIqZmSdWrWcs+5wStPAlPj19KmVGhs8xc+W4p7EuGA=;
  b=JIbSCuoRKRM269AQaF3Qh1mP7BeRv8VcmhV4wlbE3zpDGAqitr0zMMUf
   qS7k2tkR5gZ8lxILzX8swG7ER1Vdx+NRqWGwhKsIj3DsYxxOYrFzlLLes
   xKsSWxjqjNK0mQ1z7Q+MuMZsKHy9NdvQ4f3Ed41wmkUy6hx6R6t9jqAHF
   D/exwJKBgbRso4lGTxy5h7GLtx0TWBpovOhEKZYuqvNiothcVj2bdNQu+
   mnq2lRhsqHQIBpN2SbHaPP5klCa7BnATyr819275AxPCHuuv75ceforHo
   CU5yA4mNflLRO6kUyRxAp/pxUFSRs3wbhdnsBLMUDZAAnYvoj7bBnOoMa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="355983815"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="355983815"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 15:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="883960006"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="883960006"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 15:30:08 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q71fL-0006yB-37;
	Wed, 07 Jun 2023 22:30:07 +0000
Date: Thu, 8 Jun 2023 06:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3275/7747]
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:69:5-8: Unneeded variable:
 "ret". Return "  0" on line 83
Message-ID: <202306080610.S7geSwzf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abbd8bb42915d9ed06df11b430bf4ecb3d8ac5ad
commit: 6810bb390282bb75801832f31d088236503fee89 [3275/7747] drm/panel: Add Samsung S6D7AA0 panel controller driver
config: arm-randconfig-c031-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080610.S7geSwzf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080610.S7geSwzf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:69:5-8: Unneeded variable: "ret". Return "  0" on line 83

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
