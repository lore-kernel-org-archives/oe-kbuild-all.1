Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7DA49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695172499; x=1726708499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e84ndM+mWDSR3mlT24f79uElG6QgsqBXmb3T4+cNEaI=;
  b=gpY6Td252a24AG7i5ZBdOrjAM+/07EtDH1uMWovH+ZjOobhF9vo2H7nR
   AaGVmE2VbOsGSXcKChGauymWJa96/soejsM/QLtUW5FhOfoJbVfSc1DVr
   BBrBj6LdcCf6KTDKggzi7qbl+LT28L+glcjRXaN4hlLHzYwzxCiSKU8l+
   Lr/2U/Lxu6NX07TrpxPJjnSvOxHpeo2Kwco2cAkaySzLC9lz7V+XTJ2ff
   zJZ//TBdFo5vt7dJRDKMry5rMwnCIRm2RJAPu96ayx+IyeebtDtUKCwD6
   77ta1/Pv9lEXDF2ERdpyJRUHUCsuhJ0l6MMjo3KJ7iPhKSPa+4DCy3lzw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466411196"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466411196"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 18:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920081827"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="920081827"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2023 18:14:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qilnm-000880-1j;
	Wed, 20 Sep 2023 01:14:51 +0000
Date: Wed, 20 Sep 2023 09:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/34] kernel/power/user.c:365:6: warning:
 no previous prototype for 'reinit_bio'
Message-ID: <202309200957.QxePvPF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9fbb1d9f46a35f7b0842dc52236cd88dc741b182
commit: 9fbb1d9f46a35f7b0842dc52236cd88dc741b182 [34/34] CHROMIUM: hibernate: Reload image in stack local bios.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230920/202309200957.QxePvPF8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200957.QxePvPF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200957.QxePvPF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/user.c:365:6: warning: no previous prototype for 'reinit_bio' [-Wmissing-prototypes]
     365 | void reinit_bio(struct bio* bio, struct bio_vec* bio_vec, unsigned short max_vecs,
         |      ^~~~~~~~~~


vim +/reinit_bio +365 kernel/power/user.c

   364	
 > 365	void reinit_bio(struct bio* bio, struct bio_vec* bio_vec, unsigned short max_vecs,
   366			unsigned long sector, struct block_device* bdev, unsigned long op) {
   367		bio_init(bio, bio_vec, max_vecs);
   368		bio_set_dev(bio, bdev);
   369		bio->bi_iter.bi_sector = sector;
   370		bio->bi_opf = op | REQ_IDLE;
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
