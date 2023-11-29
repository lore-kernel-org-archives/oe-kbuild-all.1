Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF22B9DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSUqOVVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701293820; x=1732829820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLU1k6y6sm/wPZrO87BsYm0Z74/pEG2wqk9VwuYYsek=;
  b=NSUqOVVSMN5wiBBvZn2b3dvqp/qB839zMm93EzVq2BJdlyKtvRRQjaIF
   Rsm9IeUDZNE6KaezIzAZdJicEpBu+legu52BF6S1NvHoTomDt9KM4HrhD
   zfke82nOG5s1DM/vUaiLfbNGgMembs21ozwq4MmghKId8J02RZByQmc+1
   7Ehfgq8GV7bzu2wsE+ZX3OKcDB9iqwMV59znkJ+ryhWOV5sEjqA0FMhqM
   2ULfWRPk5OgyDR3IbzBZ+AOeSDAkwh4R/Bl/6BxNQVsJPWTG8SbvtYgks
   Vkwv19h7MNIb/2Y0HoWk3lig2zlWpuNelr9gCmcTBD6RbbSw3YYEc/V2J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="212741"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="212741"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 13:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839568520"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="839568520"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 13:36:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8SEn-0000rE-1O;
	Wed, 29 Nov 2023 21:36:53 +0000
Date: Thu, 30 Nov 2023 05:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Shannon Nelson <snelson@pensando.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/pensando/ionic/ionic_lif.c:37:11: warning: '%s'
 directive output may be truncated writing up to 31 bytes into a region of
 size 25
Message-ID: <202311300201.lO8v7mKU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 1d062b7b6f6408fd43f447f90338cfade4168170 ionic: Add basic adminq support
date:   4 years, 3 months ago
config: x86_64-randconfig-014-20230906 (https://download.01.org/0day-ci/archive/20231130/202311300201.lO8v7mKU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300201.lO8v7mKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300201.lO8v7mKU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/pensando/ionic/ionic_lif.c: In function 'ionic_lifs_init':
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:37:11: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 25 [-Wformat-truncation=]
       "%s-%s-%s", IONIC_DRV_NAME, name, q->name);
              ^~
   drivers/net/ethernet/pensando/ionic/ionic_lif.c:36:2: note: 'snprintf' output 8 or more bytes (assuming 39) into a destination of size 32
     snprintf(intr->name, sizeof(intr->name),
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "%s-%s-%s", IONIC_DRV_NAME, name, q->name);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +37 drivers/net/ethernet/pensando/ionic/ionic_lif.c

    23	
    24	static int ionic_request_irq(struct ionic_lif *lif, struct ionic_qcq *qcq)
    25	{
    26		struct ionic_intr_info *intr = &qcq->intr;
    27		struct device *dev = lif->ionic->dev;
    28		struct ionic_queue *q = &qcq->q;
    29		const char *name;
    30	
    31		if (lif->registered)
    32			name = lif->netdev->name;
    33		else
    34			name = dev_name(dev);
    35	
    36		snprintf(intr->name, sizeof(intr->name),
  > 37			 "%s-%s-%s", IONIC_DRV_NAME, name, q->name);
    38	
    39		return devm_request_irq(dev, intr->vector, ionic_isr,
    40					0, intr->name, &qcq->napi);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
