Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416AF4EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9meCwC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697925448; x=1729461448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PvYzwW6uB4lL31uSP8cLsvzMAE4tblgr2vcKqW2Ty0=;
  b=H9meCwC7HSMj+WdPvnSADzo5TLEXaOtUHbmMFHQZ5kEYNbotXLtDkcO9
   nolABbZSggoaP7P11DY9w5VZ2UjdCDSmFUG/U4f9qGMzRu2uC42fPRCjN
   LZp0P0pDGxKDkAw1tVJ4BSzvexq/hAfz83BXjeeKaRjtRNwvhgPNApaPU
   aeOZzEv+FPiT2/0wzVigWtsAB4oIb1Sb9O/BNwiJNhQK710nGtIw3BaHj
   Z9OfBbHdVIu6ML6MGJlEsLAR3PxYuk62FaoGMsoPNp85toKM9Ba4skZtd
   P7z3BID5hu+bBqTXHQB7BzdDrbbfS6bJ2Pv9yE6DD7c0xOnt99KJ0+WT3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8223121"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8223121"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 14:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="848424141"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="848424141"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2023 14:57:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quJyF-0005Gq-1t;
	Sat, 21 Oct 2023 21:57:23 +0000
Date: Sun, 22 Oct 2023 05:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:revert/pr4620 2/14]
 sound/pci/hda/patch_hdmi.c:4648:6: error: redefinition of
 'snd_hda_device_is_hdmi'
Message-ID: <202310220545.jBpb5FYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound revert/pr4620
head:   cfd32457555717766d8d51257e28b11854f37338
commit: f3eac85ed41b0ebd6ae01763417c753b2523c7d9 [2/14] ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
config: i386-randconfig-063-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220545.jBpb5FYY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220545.jBpb5FYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220545.jBpb5FYY-lkp@intel.com/

Note: the plbossart-sound/revert/pr4620 HEAD cfd32457555717766d8d51257e28b11854f37338 builds fine.
      It only hurts bisectability.

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
