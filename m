Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750418C2C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689083527; x=1720619527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMqlk/uzUyUIEp+/lMO6qxV1EsHkBQWLFjRCdoLRpN4=;
  b=XrBBb7QL2ERFkpjPRfW70j1jtjn0GwvrB5NelIFCZmo6Wt4U6/15FeHQ
   FHetveX1WO6p32Pfyne0+7UZqCJmuFn1E7CZpvBGtRlSaxiqYTGhuVmiM
   Gj2KkDPh0ZY8nTGwCc9ZwMy24TccljZnb7a861cmrD+z/4dOI3H5mn3kt
   aSqfX8/QvWCyWt4bAzGYuss23ScpzfbwcVKHerAzpZzgnmAH+FnOvWNWl
   dOKdKrloamiH5b42pfKhhE6FnluJNpKqq4qsvjYKYfUpVCWwWuTDJm3zR
   KrqmcsITxL2BTyO+kpsNomF6hdRg5davYHJ1jOaZUswMKrbHzhC/GJOWP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364659526"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="364659526"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 06:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724441587"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="724441587"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 06:52:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJDmd-0004qF-0o;
	Tue, 11 Jul 2023 13:52:03 +0000
Date: Tue, 11 Jul 2023 21:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_s 3778/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Message-ID: <202307112109.JFKojOmi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramesh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [3778/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: i386-randconfig-i013-20230711 (https://download.01.org/0day-ci/archive/20230711/202307112109.JFKojOmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112109.JFKojOmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112109.JFKojOmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113	
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] = {
   116		{ .max =  11, .key = BTN_0 },
   117		{ .max =  28, .key = BTN_1 },
   118		{ .max =  54, .key = BTN_2 },
   119		{ .max = 100, .key = BTN_3 },
   120		{ .max = 186, .key = BTN_4 },
   121		{ .max = 430, .key = BTN_5 },
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
