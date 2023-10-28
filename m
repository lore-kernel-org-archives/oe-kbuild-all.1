Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AE1401B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9hgKk8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698515856; x=1730051856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFsLwf98b+T6tdG9kTHblQKkbRc6qOMueaSvpCDcCOk=;
  b=E9hgKk8AFzwRj60djqRvu/rur0wSIsnfO0JHNOy/Gi6PJ4ofHWTVgpBh
   9Oq20+wAa5ShV4AA0EZ6suz5lqkfYp8AAHp5J+JBj5463q9RhhQ6Hf/se
   apMolUCQrYLYDp8n6qdWX0kUCnKvqZX+VeoDm/hEbfw6O7xzEQwWs/j3Z
   0IQBUB0eWl0Gda8jMd7OEq41JVZuMoL6zOxKsBiZoGvci45CECOrAjhF0
   FbJSD3MmgZdkbonTgSFPz3DfeSY73IVNmQ2UIw6oR0yMqm55u42PFe7+0
   2nyMkYg/r+psJGeV8xiJ0Mr6oRDvznVGiWBHgMq9MHmwPKi7y125lhQl0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="387724759"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="387724759"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 10:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="7941199"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2023 10:57:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwnYx-000ByB-1P;
	Sat, 28 Oct 2023 17:57:31 +0000
Date: Sun, 29 Oct 2023 01:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 90/101] sound/pci/hda/cs35l41_hda.c:733:5:
 warning: no previous declaration for 'cs35l41_verify_id'
Message-ID: <202310290100.edUObACr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   a5901f27dcf13203e5b342b7e9439314a775bf32
commit: 881b7bce0c250386680b49b637455d31238a4b30 [90/101] ALSA: hda: cs35l41: Run boot process during resume callbacks
config: i386-buildonly-randconfig-003-20231028 (https://download.01.org/0day-ci/archive/20231029/202310290100.edUObACr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290100.edUObACr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290100.edUObACr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/cs35l41_hda.c:733:5: warning: no previous declaration for 'cs35l41_verify_id' [-Wmissing-declarations]
    int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
        ^~~~~~~~~~~~~~~~~


vim +/cs35l41_verify_id +733 sound/pci/hda/cs35l41_hda.c

   732	
 > 733	int cs35l41_verify_id(struct cs35l41_hda *cs35l41, unsigned int *regid, unsigned int *reg_revid)
   734	{
   735		unsigned int mtl_revid, chipid;
   736		int ret;
   737	
   738		ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, regid);
   739		if (ret) {
   740			dev_err_probe(cs35l41->dev, ret, "Get Device ID failed\n");
   741			return ret;
   742		}
   743	
   744		ret = regmap_read(cs35l41->regmap, CS35L41_REVID, reg_revid);
   745		if (ret) {
   746			dev_err_probe(cs35l41->dev, ret, "Get Revision ID failed\n");
   747			return ret;
   748		}
   749	
   750		mtl_revid = *reg_revid & CS35L41_MTLREVID_MASK;
   751	
   752		chipid = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
   753		if (*regid != chipid) {
   754			dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n", *regid, chipid);
   755			return -ENODEV;
   756		}
   757	
   758		return 0;
   759	}
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
