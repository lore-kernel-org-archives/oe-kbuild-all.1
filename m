Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF2D279
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkc9Br46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698730076; x=1730266076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjNs/VpCrH6GXWz3qWFWwOGDlnVS+5Tq1sgAvlWbdU8=;
  b=Wkc9Br46Bh6z3f/emcWtjZyYdSpjvGrGGTNfrFr+ANmb5eo/vn759jXU
   SADRh3JVuILo3v/WImY4HWpi1JI4EUyda10xq7aWlFkCYwK5vaGHyJsd1
   HD0MoJbk9XiNSOlawt+sbZ9Cfg250TBEvFSnEVqcD1PaNEZhIcY8FouZV
   b8n1SZbFJODDMaWBbZRHVgtEJ4bkQx0ZFAYl1bIZ9PO1VUbUEvC8Dr9vY
   RTdeQAEfDh0lhw6eCK2c7Dk85eZqkP9wGj3bucN2CbFQ/jBDfi9TI7Vo/
   jtJBFqOxWkGxRqv2oywPIyCN2SdeVGjG5PuY+AydkIPwTs4Ul35JUcgbx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454685299"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="454685299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 22:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8203705"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2023 22:27:52 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxhI5-000Dqd-1i;
	Tue, 31 Oct 2023 05:27:49 +0000
Date: Tue, 31 Oct 2023 13:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sdw/add-rw-debugfs-support 21/26]
 sound/pci/hda/patch_hdmi.c:4648:6: error: redefinition of
 'snd_hda_device_is_hdmi'
Message-ID: <202310311348.zvHI24jb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/add-rw-debugfs-support
head:   2c350273f5f3b3f47df642297fbcd83e7216613e
commit: 5762a2e74908f4cbb7955140b0175539171aaee1 [21/26] ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
config: arc-randconfig-002-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311348.zvHI24jb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311348.zvHI24jb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311348.zvHI24jb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/hda/patch_hdmi.c:4648:6: error: redefinition of 'snd_hda_device_is_hdmi'
    4648 | bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/pci/hda/patch_hdmi.c:29:
   include/sound/hdaudio.h:165:20: note: previous definition of 'snd_hda_device_is_hdmi' with type 'bool(struct hdac_device *)' {aka '_Bool(struct hdac_device *)'}
     165 | static inline bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/snd_hda_device_is_hdmi +4648 sound/pci/hda/patch_hdmi.c

  4647	
> 4648	bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
  4649	{
  4650		int i;
  4651	
  4652		for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
  4653			if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
  4654				return true;
  4655		}
  4656	
  4657		return false;
  4658	}
  4659	EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
  4660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
