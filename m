Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF61C2EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680169971; x=1711705971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=egdGxeVhZIVdSsv8G/WnZGpCHCkvcyJiVot8h8dNSFM=;
  b=meParp5fqhrHZ2fZn+p/13jd/EL57Ar7jarmYlu6XAlzNFD1XLuHyXXo
   G/Oz3K6zNCjfep+Rwmceg/qN7g3dJArZcd44e4ZlBlptY4kTyKaZKQmze
   E2sWimMpwfS+J0IfvddOrdeHV5QABTqkbiHeZbcsKLxT0AutlTcP/VsMK
   km728saPmCucAdcTQIlJwc39v0AoxtKp+esUvjtouTyuXOWLQkAlFl+z3
   pY1a62V67dhTmVPi16/W2lBU66LSsnZOboIJl2n8LMSL6pWCXo34yaKhV
   rqz/J5gOu6UXoPjfeDfrJMyBqddxoOYzhILeP3xzVnnrQrHN/o8ogaTVD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342734696"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="342734696"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 02:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="678130008"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678130008"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 02:52:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phoxZ-000Ki4-2G;
	Thu, 30 Mar 2023 09:52:45 +0000
Date: Thu, 30 Mar 2023 17:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 7406/7844] sound/pci/ymfpci/ymfpci_main.c:2259:9:
 error: implicit declaration of function 'snd_ac97_suspend'; did you mean
 'snd_ac97_reset'?
Message-ID: <202303301712.i4ddVa9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: 081364d7039395d5759dda17f6904d7e99d39f4b [7406/7844] ALSA: ymfpci: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
config: microblaze-buildonly-randconfig-r001-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301712.i4ddVa9j-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=081364d7039395d5759dda17f6904d7e99d39f4b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 081364d7039395d5759dda17f6904d7e99d39f4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash sound/pci/ymfpci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301712.i4ddVa9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/ymfpci/ymfpci_main.c: In function 'snd_ymfpci_suspend':
>> sound/pci/ymfpci/ymfpci_main.c:2259:9: error: implicit declaration of function 'snd_ac97_suspend'; did you mean 'snd_ac97_reset'? [-Werror=implicit-function-declaration]
    2259 |         snd_ac97_suspend(chip->ac97);
         |         ^~~~~~~~~~~~~~~~
         |         snd_ac97_reset
   sound/pci/ymfpci/ymfpci_main.c: In function 'snd_ymfpci_resume':
>> sound/pci/ymfpci/ymfpci_main.c:2288:9: error: implicit declaration of function 'snd_ac97_resume'; did you mean 'snd_ac97_reset'? [-Werror=implicit-function-declaration]
    2288 |         snd_ac97_resume(chip->ac97);
         |         ^~~~~~~~~~~~~~~
         |         snd_ac97_reset
   cc1: some warnings being treated as errors


vim +2259 sound/pci/ymfpci/ymfpci_main.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2251  
68cb2b55927885 Takashi Iwai   2012-07-02  2252  static int snd_ymfpci_suspend(struct device *dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2253  {
68cb2b55927885 Takashi Iwai   2012-07-02  2254  	struct snd_card *card = dev_get_drvdata(dev);
ded462356886e5 Takashi Iwai   2005-11-17  2255  	struct snd_ymfpci *chip = card->private_data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2256  	unsigned int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2257  	
ded462356886e5 Takashi Iwai   2005-11-17  2258  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2259  	snd_ac97_suspend(chip->ac97);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2260  	for (i = 0; i < YDSXGR_NUM_SAVED_REGS; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2261  		chip->saved_regs[i] = snd_ymfpci_readl(chip, saved_regs_index[i]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2262  	chip->saved_ydsxgr_mode = snd_ymfpci_readl(chip, YDSXGR_MODE);
28aa165cc52fa6 Takashi Iwai   2012-03-13  2263  	pci_read_config_word(chip->pci, PCIR_DSXG_LEGACY,
28aa165cc52fa6 Takashi Iwai   2012-03-13  2264  			     &chip->saved_dsxg_legacy);
28aa165cc52fa6 Takashi Iwai   2012-03-13  2265  	pci_read_config_word(chip->pci, PCIR_DSXG_ELEGACY,
28aa165cc52fa6 Takashi Iwai   2012-03-13  2266  			     &chip->saved_dsxg_elegacy);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2267  	snd_ymfpci_writel(chip, YDSXGR_NATIVEDACOUTVOL, 0);
4a3b6983232cd2 Takashi Iwai   2008-06-25  2268  	snd_ymfpci_writel(chip, YDSXGR_BUF441OUTVOL, 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2269  	snd_ymfpci_disable_dsp(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2270  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2271  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2272  
68cb2b55927885 Takashi Iwai   2012-07-02  2273  static int snd_ymfpci_resume(struct device *dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2274  {
68cb2b55927885 Takashi Iwai   2012-07-02  2275  	struct pci_dev *pci = to_pci_dev(dev);
68cb2b55927885 Takashi Iwai   2012-07-02  2276  	struct snd_card *card = dev_get_drvdata(dev);
ded462356886e5 Takashi Iwai   2005-11-17  2277  	struct snd_ymfpci *chip = card->private_data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2278  	unsigned int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2279  
ded462356886e5 Takashi Iwai   2005-11-17  2280  	snd_ymfpci_aclink_reset(pci);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2281  	snd_ymfpci_codec_ready(chip, 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2282  	snd_ymfpci_download_image(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2283  	udelay(100);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2284  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2285  	for (i = 0; i < YDSXGR_NUM_SAVED_REGS; i++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2286  		snd_ymfpci_writel(chip, saved_regs_index[i], chip->saved_regs[i]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2287  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2288  	snd_ac97_resume(chip->ac97);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2289  
28aa165cc52fa6 Takashi Iwai   2012-03-13  2290  	pci_write_config_word(chip->pci, PCIR_DSXG_LEGACY,
28aa165cc52fa6 Takashi Iwai   2012-03-13  2291  			      chip->saved_dsxg_legacy);
28aa165cc52fa6 Takashi Iwai   2012-03-13  2292  	pci_write_config_word(chip->pci, PCIR_DSXG_ELEGACY,
28aa165cc52fa6 Takashi Iwai   2012-03-13  2293  			      chip->saved_dsxg_elegacy);
28aa165cc52fa6 Takashi Iwai   2012-03-13  2294  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2295  	/* start hw again */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2296  	if (chip->start_count > 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2297  		spin_lock_irq(&chip->reg_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2298  		snd_ymfpci_writel(chip, YDSXGR_MODE, chip->saved_ydsxgr_mode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2299  		chip->active_bank = snd_ymfpci_readl(chip, YDSXGR_CTRLSELECT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2300  		spin_unlock_irq(&chip->reg_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2301  	}
ded462356886e5 Takashi Iwai   2005-11-17  2302  	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2303  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2304  }
68cb2b55927885 Takashi Iwai   2012-07-02  2305  

:::::: The code at line 2259 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
