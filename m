Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2820134AC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJP3RnAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704636700; x=1736172700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JABXZp+FvNEiI9FTBN+Ep9UkV7m/6QN5IJ/Vy+c2eWY=;
  b=HJP3RnAIpSn9FVMcDzuI/gPOeNtMvGjnUBKBOb9tFixT7AQNeV2c6sQ+
   9ZiU0rLGr8NvcRKiFK2xqaO6UfN4NS/AcKrv17X69RRjrUH+i/6YtI34g
   Cv3YEtVi9gT9QATtxChnJizyiRItVcEJYukDqol4JFgyLpm6wPu4Htscn
   iLy05pK63BRRFlyFtEOxlWdMQmgWTIaDs2AJMlKXXOlXBZXsM0ZnCYWOh
   u6COhl/XodrT/1fCndmJ8G+j3w5aA20WVJpOwQU41icHsjecYSPrlb4nk
   dwWG1R9PJZonH39PU8CuCgZ6cNQevQRbL34lMy4avOh41XaGU4bOqoviV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="4493552"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="4493552"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 06:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="15674934"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jan 2024 06:11:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMTsG-0003qF-1U;
	Sun, 07 Jan 2024 14:11:36 +0000
Date: Sun, 7 Jan 2024 22:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 11897/12662]
 sound/pci/hda/tas2781_hda_i2c.c:433:30: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202401072137.Oc7pQgRW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: c3ca4458cc2f719b1652abaa8d2fbf7f3d4311cb [11897/12662] ALSA: hda/tas2781: add TAS2563 support for 14ARB7
config: x86_64-randconfig-122-20240107 (https://download.01.org/0day-ci/archive/20240107/202401072137.Oc7pQgRW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401072137.Oc7pQgRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401072137.Oc7pQgRW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/tas2781_hda_i2c.c:433:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int data @@     got restricted __be32 [usertype] @@
   sound/pci/hda/tas2781_hda_i2c.c:433:30: sparse:     expected unsigned int data
   sound/pci/hda/tas2781_hda_i2c.c:433:30: sparse:     got restricted __be32 [usertype]

vim +433 sound/pci/hda/tas2781_hda_i2c.c

   424	
   425	static void tas2563_apply_calib(struct tasdevice_priv *tas_priv)
   426	{
   427		unsigned int data;
   428		int offset = 0;
   429		int ret;
   430	
   431		for (int i = 0; i < tas_priv->ndev; i++) {
   432			for (int j = 0; j < TAS2563_CAL_N; ++j) {
 > 433				data = cpu_to_be32(
   434					*(uint32_t *)&tas_priv->cali_data.data[offset]);
   435				ret = tasdevice_dev_bulk_write(tas_priv, i, cal_regs[j],
   436					(unsigned char *)&data, TAS2563_CAL_DATA_SIZE);
   437				if (ret)
   438					dev_err(tas_priv->dev,
   439						"Error writing calib regs\n");
   440				offset += TAS2563_CAL_DATA_SIZE;
   441			}
   442		}
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
