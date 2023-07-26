Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0458483
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690355595; x=1721891595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6soygdn33ZqjZmiTZwxXNdFQ2KAJftBi6g47xXLUTUU=;
  b=Gsbr1kTkTUfdD/Bnyj/C+lQ00tlSXiThlNX7XWLKkl3ntbcoPePAd5I+
   PQrS5V6Jx3euRB7o1+dMBqn2+PhCI2G8gjV68hQxUfl6/rMtrsixKtjZP
   mRAEMOBPA/P8DTiTLqHWZquqfzWWeaMBUGxt2nPjJTkoZx6plrp3rdN/Y
   fUSN3gOa9LBp19MDBw4wAF3VpZGGfJ1+PaJe9h+oUMTr9bMoSAdmvoVZb
   E1qxwRSy0rFtWCltINjXeOe9EMBZGK3h8wr6c+igsbkKBcCMadtsaG9Fz
   P1/GCpGeLm5qkcC4lZ+738X4ta9jHIPI8Q81FQFu41ydO1pHD9M/iAO4A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371547172"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371547172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 00:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869777529"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 00:13:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOYhs-0000lH-1b;
	Wed, 26 Jul 2023 07:13:12 +0000
Date: Wed, 26 Jul 2023 15:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 325/382]
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:837:45: warning:
 'ti_csi2rx_video_entity_ops' defined but not used
Message-ID: <202307261528.lN68T0dK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6f3ee6fcd1f316038e9cb9505c72a15b019f3c7d
commit: 8d22a2769b4e64ee3576ee74cbb0efc2a23c0117 [325/382] media: ti: j721e-csi2rx: separate out device and context
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307261528.lN68T0dK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261528.lN68T0dK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261528.lN68T0dK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:837:45: warning: 'ti_csi2rx_video_entity_ops' defined but not used [-Wunused-const-variable=]
     837 | static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ti_csi2rx_video_entity_ops +837 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

70f7e7ba6c6684 Pratyush Yadav 2023-04-20  836  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20 @837  static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  838  	.link_validate = ti_csi2rx_link_validate,
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  839  };
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  840  

:::::: The code at line 837 was first introduced by commit
:::::: 70f7e7ba6c66846ac3f73fcee04f2faf9836c1c6 media: ti: Add CSI2RX support for J721E

:::::: TO: Pratyush Yadav <p.yadav@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
