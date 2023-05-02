Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E1622
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683023603; x=1714559603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjmFOFCQElte7wpPb4geFbfte6KiNN1TzHhEdZpVTvs=;
  b=kBaGDRTEojPR7ZTSNsm4+PRkYkBZbGkITIuaVyQkSVxDsIp9ua+Vg89c
   GIaG49S3K0k3IFqYTvIv7cjP8BaReebb1ezUbWh7jTNq8FuKNwwrqK1SX
   JAgpwqQac/EE0pcsj+H4CT8VBH/EG5BeAIWiMf57jftjrZlZTlx+CldrR
   ejY3R6/bSDbcWdcv3xiqNsmGTKorsEC9NkRYfYunALG4O/47Jog85a2aJ
   kHRvd/9R1KQ8rrus5TazDAZXa7DFHWEEip6032RrnfOUZfOrZjbE+12/L
   S7MbQQ0hM/U8q3JiyChgjck8YlQllTIvKDPwTWLLOekq9v3oogae6ZDnV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413805465"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="413805465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 03:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726702165"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="726702165"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 May 2023 03:33:21 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptnJx-0000zQ-0O;
	Tue, 02 May 2023 10:33:21 +0000
Date: Tue, 2 May 2023 18:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3997: WARNING:
 Literal block expected; none found.
Message-ID: <202305021822.4U6XOvGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   865fdb08197e657c59e74a35fa32362b12397f58
commit: 4d421eebe1465d94b95867dd025385dc3d661f9b ALSA: docs: writing-an-alsa-driver.rst: polishing
date:   11 days ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d421eebe1465d94b95867dd025385dc3d661f9b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4d421eebe1465d94b95867dd025385dc3d661f9b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021822.4U6XOvGf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3997: WARNING: Literal block expected; none found.
>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4009: WARNING: Unexpected indentation.

vim +3997 Documentation/sound/kernel-api/writing-an-alsa-driver.rst

7ddedebb03b7ec Takashi Iwai       2016-09-29  3994  
4d421eebe1465d Oswald Buddenhagen 2023-04-21  3995     Suppose you have a file xyz.c. Add the following two lines::
7ddedebb03b7ec Takashi Iwai       2016-09-29  3996  
7ddedebb03b7ec Takashi Iwai       2016-09-29 @3997    snd-xyz-objs := xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3998    obj-$(CONFIG_SND_XYZ) += snd-xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3999  
7ddedebb03b7ec Takashi Iwai       2016-09-29  4000  2. Create the Kconfig entry
7ddedebb03b7ec Takashi Iwai       2016-09-29  4001  
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4002     Add the new entry of Kconfig for your xyz driver::
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4003  
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4004    config SND_XYZ
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4005      tristate "Foobar XYZ"
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4006      depends on SND
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4007      select SND_PCM
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4008      help
4d421eebe1465d Oswald Buddenhagen 2023-04-21 @4009        Say Y here to include support for Foobar XYZ soundcard.
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4010        To compile this driver as a module, choose M here:
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4011        the module will be called snd-xyz.
4d421eebe1465d Oswald Buddenhagen 2023-04-21  4012  

:::::: The code at line 3997 was first introduced by commit
:::::: 7ddedebb03b7ec030c528ebacdd43e45373476e3 ALSA: doc: ReSTize writing-an-alsa-driver document

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
