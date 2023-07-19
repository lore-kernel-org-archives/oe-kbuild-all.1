Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C841FDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 06:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689746978; x=1721282978;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HV6L3ADryKmQjsimI5zKifLjo88aMAaxa79JgD8oo7k=;
  b=QQ6iTVo0bScf9z13HyJAN8IDDs89zkQJ9+LSqc8xXeMP10FiyU1NC03t
   skoZ09yU0aXVyOkHZE9g5VFS5HdlFXzpyOTxt3JETPAb5Pb9m8e6ugtFW
   QnaAHon6S5WUlw95oYRJCrtsNl+kX821pgIr6kvSdhfPNZoAslF5bRwip
   ALPa0eUoTtH5ORoKqtLpKUSRjk9VY6vugJav6UUYnQHt32AiXC0XfCZP7
   cQ+6LsNZzrMJrgpWCbP5I6/scbaaV7qSVR+oDLQUiNw2g1lvPI830T2St
   OXSTNNg5jjKkrvdI8iXYJlVItCDRqEK3iqeyk0BmSLa9OW4HgzazP2cG2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452756881"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="452756881"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 23:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727193082"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727193082"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2023 23:09:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM0NR-0004Cf-33;
	Wed, 19 Jul 2023 06:09:33 +0000
Date: Wed, 19 Jul 2023 14:08:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-android-linux-6.1.y-cicd 308/1075] ld.lld: error: undefined
 symbol: phy_mipi_dphy_get_default_config_for_hsclk
Message-ID: <202307191453.rO0uaNrL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.1.y-cicd
head:   8f34b48aa6dc9472429ce75bd16614ea69c29f56
commit: 182a459d997df29c4093a626b691831e6f45bd84 [308/1075] TI: media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-r012-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191453.rO0uaNrL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191453.rO0uaNrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191453.rO0uaNrL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
   >>> referenced by cdns-csi2rx.c:224 (drivers/media/platform/cadence/cdns-csi2rx.c:224)
   >>>               drivers/media/platform/cadence/cdns-csi2rx.o:(csi2rx_resume) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
