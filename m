Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EAB3AA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 22:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687473115; x=1719009115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SDXJENEeL/bpt6xMsVy0rg9NPjTbCICx2LYe2RbgEZ0=;
  b=SOzllwE1S7ROkF6M+gtZT+CcL8KXgA7FFci4uoi6qK7ydEfnjgOAiDC4
   XYrFd/uiHmBWtJjRH47mSn6D+i+pkEIO3f3Go26er4Qg/Sjk4RlZaX5cB
   Dda8TIhwTCUN1/yCe6tu5GQCKjLIcyfsIyopZznGL9fcfdQMMn8NRaVqn
   19qj60EAOcoPjcm3UK01bY0P2KzWz6vwlWD0DYsw+tB5ESbhCcpGZ6pIH
   Wtlj1lgg0u/Ldjbk5yvAIDyCASG/Do7JH68IK6dR3LOZL1xcl36Sn/YV1
   xK8G8HkfhW9mmJuy0VOmyxEBWxy3q+Qvm+qrzhIgX3XZSQxicOuD2Rbzz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390494728"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="390494728"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 15:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="961750214"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="961750214"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 15:31:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCSqB-0007nH-0c;
	Thu, 22 Jun 2023 22:31:47 +0000
Date: Fri, 23 Jun 2023 06:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] ASoC: amd: acp: add acp i2s master clock
 generation for rembrandt platform
Message-ID: <202306230648.6X3y3ujR-lkp@intel.com>
References: <20230622152406.3709231-7-Syed.SabaKareem@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622152406.3709231-7-Syed.SabaKareem@amd.com>

Hi Syed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-remove-acp-poweroff-function/20230622-233145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230622152406.3709231-7-Syed.SabaKareem%40amd.com
patch subject: [PATCH 04/12] ASoC: amd: acp: add acp i2s master clock generation for rembrandt platform
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230648.6X3y3ujR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230648.6X3y3ujR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230648.6X3y3ujR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-rembrandt.c:169:5: warning: no previous prototype for 'acp6x_master_clock_generate' [-Wmissing-prototypes]
     169 | int acp6x_master_clock_generate(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/acp6x_master_clock_generate +169 sound/soc/amd/acp/acp-rembrandt.c

   168	
 > 169	int acp6x_master_clock_generate(struct device *dev)
   170	{
   171		int data = 0;
   172		struct pci_dev *smn_dev;
   173	
   174		smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, HOST_BRIDGE_ID, NULL);
   175		if (!smn_dev) {
   176			dev_err(dev, "Failed to get host bridge device\n");
   177			return -ENODEV;
   178		}
   179	
   180		smn_write(smn_dev, MP1_C2PMSG_93, 0);
   181		smn_write(smn_dev, MP1_C2PMSG_85, 0xC4);
   182		smn_write(smn_dev, MP1_C2PMSG_69, 0x4);
   183		read_poll_timeout(smn_read, data, data, DELAY_US,
   184				  ACP_TIMEOUT, false, smn_dev, MP1_C2PMSG_93);
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
