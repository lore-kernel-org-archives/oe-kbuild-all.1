Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E317D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 02:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679624697; x=1711160697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIPNTZlzh5OGxmX9tmbUszvS1T1/Vk7+KEQJMgIE3II=;
  b=JbNUBEmFBkk0BNfsFrXcvbnDHvwkjtRUQIv6S8k/rtrklWQLkdmMdxT1
   AJMhwQbshZ0AJutWSiXIYTKj9MEHhzpx3u5C1J+XZxQqv218uqMCmF5a9
   Du+pbZpCw7osYXlD8iBEs+P21swLHp/p2lNnARiYveQHwtytnA+E8h2r3
   1MA5Gurb8wEbqv3sN+jUGT54Zbp5QhLN6MoImbjq/7VKlpveyPnnPmHG8
   x/dEo+N+11IGcqpWZu4n8eFTZlZJ46ba4DfhQgn6snGtIfQSppKHagzuV
   BhRN67JlhdrqcSo5Wjk2rdPoqdCYHI241LYjaZNY82x2q9ZkKPJWrg8Tc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367418687"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="367418687"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 19:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="675973072"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="675973072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 19:24:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfX6s-000Eu2-0N;
	Fri, 24 Mar 2023 02:24:54 +0000
Date: Fri, 24 Mar 2023 10:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rakesh Ughreja <rakesh.a.ughreja@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Samaga Prasanna Krishna <samaga.krishna@intel.corp-partner.google.com>,
	Dylan Reid <dgreid@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 4150/9999]
 sound/core/hwdep.c:250:24: sparse: sparse: cast removes address space
 '<asn:1>' of expression
Message-ID: <202303241036.uxCux6vn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rakesh,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 5e22e52d8c7a5f750fdfae3120feecd6dc0fc430 [4150/9999] FROMGIT: ASoC: hdac_hda: add asoc extension for legacy HDA codec drivers
config: m68k-randconfig-s043-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241036.uxCux6vn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/5e22e52d8c7a5f750fdfae3120feecd6dc0fc430
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 5e22e52d8c7a5f750fdfae3120feecd6dc0fc430
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/devfreq/event/ fs/ net/bluetooth/ sound/core/ sound/pci/hda/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241036.uxCux6vn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/hwdep.c:250:24: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/core/hwdep.c:250:24: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/core/hwdep.c:250:24: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/core/hwdep.c:250:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got int [noderef] <asn:1> * @@
   sound/core/hwdep.c:250:24: sparse:     expected void *
   sound/core/hwdep.c:250:24: sparse:     got int [noderef] <asn:1> *
   sound/core/hwdep.c:280:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:280:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:280:29: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/core/hwdep.c:280:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got int [noderef] <asn:1> * @@
   sound/core/hwdep.c:280:29: sparse:     expected void const *
   sound/core/hwdep.c:280:29: sparse:     got int [noderef] <asn:1> *
   sound/core/hwdep.c:299:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:299:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:299:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:299:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got int [noderef] <asn:1> * @@
   sound/core/hwdep.c:299:29: sparse:     expected void *
   sound/core/hwdep.c:299:29: sparse:     got int [noderef] <asn:1> *
   sound/core/hwdep.c:309:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:309:29: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/core/hwdep.c:309:29: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/core/hwdep.c:309:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned int [noderef] <asn:1> * @@
   sound/core/hwdep.c:309:29: sparse:     expected void const *
   sound/core/hwdep.c:309:29: sparse:     got unsigned int [noderef] <asn:1> *
--
>> sound/pci/hda/hda_hwdep.c:39:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/pci/hda/hda_hwdep.c:39:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/pci/hda/hda_hwdep.c:39:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/pci/hda/hda_hwdep.c:39:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned int [noderef] <asn:1> * @@
   sound/pci/hda/hda_hwdep.c:39:13: sparse:     expected void const *
   sound/pci/hda/hda_hwdep.c:39:13: sparse:     got unsigned int [noderef] <asn:1> *
   sound/pci/hda/hda_hwdep.c:43:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:43:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:43:13: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/pci/hda/hda_hwdep.c:43:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned int [noderef] <asn:1> * @@
   sound/pci/hda/hda_hwdep.c:43:13: sparse:     expected void *
   sound/pci/hda/hda_hwdep.c:43:13: sparse:     got unsigned int [noderef] <asn:1> *
   sound/pci/hda/hda_hwdep.c:53:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:53:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:53:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:53:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned int [noderef] <asn:1> * @@
   sound/pci/hda/hda_hwdep.c:53:13: sparse:     expected void const *
   sound/pci/hda/hda_hwdep.c:53:13: sparse:     got unsigned int [noderef] <asn:1> *
   sound/pci/hda/hda_hwdep.c:65:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:65:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:65:13: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:65:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned int [noderef] <asn:1> * @@
   sound/pci/hda/hda_hwdep.c:65:13: sparse:     expected void *
   sound/pci/hda/hda_hwdep.c:65:13: sparse:     got unsigned int [noderef] <asn:1> *
   sound/pci/hda/hda_hwdep.c:81:24: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:81:24: sparse: sparse: cast removes address space '<asn:1>' of expression
   sound/pci/hda/hda_hwdep.c:81:24: sparse: sparse: cast removes address space '<asn:1>' of expression
>> sound/pci/hda/hda_hwdep.c:81:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got int [noderef] <asn:1> * @@
   sound/pci/hda/hda_hwdep.c:81:24: sparse:     expected void *
   sound/pci/hda/hda_hwdep.c:81:24: sparse:     got int [noderef] <asn:1> *

vim +250 sound/core/hwdep.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  242  
d9a98de218ce18 Takashi Iwai    2005-11-17  243  static long snd_hwdep_ioctl(struct file * file, unsigned int cmd,
d9a98de218ce18 Takashi Iwai    2005-11-17  244  			    unsigned long arg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  245  {
d9a98de218ce18 Takashi Iwai    2005-11-17  246  	struct snd_hwdep *hw = file->private_data;
^1da177e4c3f41 Linus Torvalds  2005-04-16  247  	void __user *argp = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds  2005-04-16  248  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  249  	case SNDRV_HWDEP_IOCTL_PVERSION:
^1da177e4c3f41 Linus Torvalds  2005-04-16 @250  		return put_user(SNDRV_HWDEP_VERSION, (int __user *)argp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  251  	case SNDRV_HWDEP_IOCTL_INFO:
^1da177e4c3f41 Linus Torvalds  2005-04-16  252  		return snd_hwdep_info(hw, argp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  253  	case SNDRV_HWDEP_IOCTL_DSP_STATUS:
^1da177e4c3f41 Linus Torvalds  2005-04-16  254  		return snd_hwdep_dsp_status(hw, argp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  255  	case SNDRV_HWDEP_IOCTL_DSP_LOAD:
^1da177e4c3f41 Linus Torvalds  2005-04-16  256  		return snd_hwdep_dsp_load(hw, argp);
^1da177e4c3f41 Linus Torvalds  2005-04-16  257  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  258  	if (hw->ops.ioctl)
^1da177e4c3f41 Linus Torvalds  2005-04-16  259  		return hw->ops.ioctl(hw, file, cmd, arg);
^1da177e4c3f41 Linus Torvalds  2005-04-16  260  	return -ENOTTY;
^1da177e4c3f41 Linus Torvalds  2005-04-16  261  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  262  
^1da177e4c3f41 Linus Torvalds  2005-04-16  263  static int snd_hwdep_mmap(struct file * file, struct vm_area_struct * vma)
^1da177e4c3f41 Linus Torvalds  2005-04-16  264  {
d9a98de218ce18 Takashi Iwai    2005-11-17  265  	struct snd_hwdep *hw = file->private_data;
^1da177e4c3f41 Linus Torvalds  2005-04-16  266  	if (hw->ops.mmap)
^1da177e4c3f41 Linus Torvalds  2005-04-16  267  		return hw->ops.mmap(hw, file, vma);
^1da177e4c3f41 Linus Torvalds  2005-04-16  268  	return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  269  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  270  
d9a98de218ce18 Takashi Iwai    2005-11-17  271  static int snd_hwdep_control_ioctl(struct snd_card *card,
d9a98de218ce18 Takashi Iwai    2005-11-17  272  				   struct snd_ctl_file * control,
^1da177e4c3f41 Linus Torvalds  2005-04-16  273  				   unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  274  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  275  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  276  	case SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE:
^1da177e4c3f41 Linus Torvalds  2005-04-16  277  		{
^1da177e4c3f41 Linus Torvalds  2005-04-16  278  			int device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  279  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @280  			if (get_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  281  				return -EFAULT;
1a60d4c5a0c402 Ingo Molnar     2006-01-16  282  			mutex_lock(&register_mutex);
f7b2bb8549e352 Dan Carpenter   2011-10-28  283  
f7b2bb8549e352 Dan Carpenter   2011-10-28  284  			if (device < 0)
f7b2bb8549e352 Dan Carpenter   2011-10-28  285  				device = 0;
f7b2bb8549e352 Dan Carpenter   2011-10-28  286  			else if (device < SNDRV_MINOR_HWDEPS)
f7b2bb8549e352 Dan Carpenter   2011-10-28  287  				device++;
f7b2bb8549e352 Dan Carpenter   2011-10-28  288  			else
f7b2bb8549e352 Dan Carpenter   2011-10-28  289  				device = SNDRV_MINOR_HWDEPS;
f7b2bb8549e352 Dan Carpenter   2011-10-28  290  
^1da177e4c3f41 Linus Torvalds  2005-04-16  291  			while (device < SNDRV_MINOR_HWDEPS) {
f87135f56cb266 Clemens Ladisch 2005-11-20  292  				if (snd_hwdep_search(card, device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  293  					break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  294  				device++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  295  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  296  			if (device >= SNDRV_MINOR_HWDEPS)
^1da177e4c3f41 Linus Torvalds  2005-04-16  297  				device = -1;
1a60d4c5a0c402 Ingo Molnar     2006-01-16  298  			mutex_unlock(&register_mutex);
^1da177e4c3f41 Linus Torvalds  2005-04-16  299  			if (put_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  300  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  301  			return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  302  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  303  	case SNDRV_CTL_IOCTL_HWDEP_INFO:
^1da177e4c3f41 Linus Torvalds  2005-04-16  304  		{
d9a98de218ce18 Takashi Iwai    2005-11-17  305  			struct snd_hwdep_info __user *info = (struct snd_hwdep_info __user *)arg;
f87135f56cb266 Clemens Ladisch 2005-11-20  306  			int device, err;
d9a98de218ce18 Takashi Iwai    2005-11-17  307  			struct snd_hwdep *hwdep;
^1da177e4c3f41 Linus Torvalds  2005-04-16  308  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @309  			if (get_user(device, &info->device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  310  				return -EFAULT;
1a60d4c5a0c402 Ingo Molnar     2006-01-16  311  			mutex_lock(&register_mutex);
f87135f56cb266 Clemens Ladisch 2005-11-20  312  			hwdep = snd_hwdep_search(card, device);
f87135f56cb266 Clemens Ladisch 2005-11-20  313  			if (hwdep)
f87135f56cb266 Clemens Ladisch 2005-11-20  314  				err = snd_hwdep_info(hwdep, info);
f87135f56cb266 Clemens Ladisch 2005-11-20  315  			else
f87135f56cb266 Clemens Ladisch 2005-11-20  316  				err = -ENXIO;
1a60d4c5a0c402 Ingo Molnar     2006-01-16  317  			mutex_unlock(&register_mutex);
f87135f56cb266 Clemens Ladisch 2005-11-20  318  			return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  319  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  320  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  321  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds  2005-04-16  322  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  323  

:::::: The code at line 250 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
