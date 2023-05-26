Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560682911B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685139836; x=1716675836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GndFMQjP0uPAgMf7AaCTKyD5Wi3ITKXHGl4CfOc4QlU=;
  b=YC4a1ctbQwZbMq648tOHM23ZPjseII3S5tj9bkF5yqgVUZefljSMNDBg
   PF/t22N7r3XBFjMaEt8z/x959GMnedwwjkceP8hzNs8f3Z5WsFvZQxYIV
   qkxDLQjMz0tjP4lwy8MEuAYSEDi7p6WOf2vJwsMHhqZvdqyriOFwKN+Yf
   L8NUY9xYU8AU3HF9SZGl+gHli8xp42zLfLDxjUyKjdSpiQQozY+IGMMix
   Jva8HdTEH1xi8lWa/xVk8DVriPqEhyEEN+gSkKt6/NVSuUU4+7x53osXX
   n0VjOK2m9Ids7fokRxB1A6+o1+SzXOGzO9x5GrnRfSf5CTzvr9BPBkOE5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354335311"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="354335311"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 15:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879685101"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="879685101"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 15:23:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2fqb-000JdW-1Z;
	Fri, 26 May 2023 22:23:45 +0000
Date: Sat, 27 May 2023 06:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 129/133] sound/hda/hdac_device.c:610:27:
 error: implicit declaration of function 'pm_runtime_get_if_active'; did you
 mean 'pm_runtime_set_active'?
Message-ID: <202305270628.mqDzL00S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   71d004ed850be4b0a0539d2c22a0b44685482711
commit: ec704eef8c6272b7762992abf04ef490fdcf75a8 [129/133] ALSA: hda: Fix unhandled register update during auto-suspend period
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230527/202305270628.mqDzL00S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=ec704eef8c6272b7762992abf04ef490fdcf75a8
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout ec704eef8c6272b7762992abf04ef490fdcf75a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/hda/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270628.mqDzL00S-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/hda/hdac_device.c: In function 'snd_hdac_keep_power_up':
>> sound/hda/hdac_device.c:610:27: error: implicit declaration of function 'pm_runtime_get_if_active'; did you mean 'pm_runtime_set_active'? [-Werror=implicit-function-declaration]
     610 |                 int ret = pm_runtime_get_if_active(&codec->dev, true);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           pm_runtime_set_active
   cc1: some warnings being treated as errors


vim +610 sound/hda/hdac_device.c

   602	
   603	/* like snd_hdac_power_up_pm(), but only increment the pm count when
   604	 * already powered up.  Returns -1 if not powered up, 1 if incremented
   605	 * or 0 if unchanged.  Only used in hdac_regmap.c
   606	 */
   607	int snd_hdac_keep_power_up(struct hdac_device *codec)
   608	{
   609		if (!atomic_inc_not_zero(&codec->in_pm)) {
 > 610			int ret = pm_runtime_get_if_active(&codec->dev, true);
   611			if (!ret)
   612				return -1;
   613			if (ret < 0)
   614				return 0;
   615		}
   616		return 1;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
