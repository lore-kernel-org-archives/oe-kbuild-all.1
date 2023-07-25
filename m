Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C19187D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 02:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690253561; x=1721789561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2olh4scS2ZZu8Nrs5yJ0i9ejdihSgHCPVzsoVlUCGE=;
  b=TMoAk31/vefdL7+Y8qCEqKhwg0xMjYlXCOjB88xaSLS5pvRB+ZOzO8CC
   zA3+/sqCTCyBpSNN7U+ypql2g0DRKqQSCj6EBiC4e2Xd4DcMs9RnWEo9Y
   qA/Shymnpu6rT4f5TmIxtLGw0G+vnlP2E+fNEcBWmbLzRH/AD4mdxvT7f
   2KmFXCZ5dxXScR8fySczBEpiGBWuVgZO0B7dOzfnRklVrN6m0yeFxeVRK
   MVoDpznyhwdpBQcnjweUfayRjZH58x3cF4qTLc1V5GJXMCQRcxJInB7iQ
   QiOoAixNvJ+MPA1738E+/CWP2i/94wBwosjRngFyb5lIqfUWrZ4hOiuoq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="453980349"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="453980349"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 19:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703127688"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="703127688"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 19:52:37 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8A8-000AFM-10;
	Tue, 25 Jul 2023 02:52:36 +0000
Date: Tue, 25 Jul 2023 10:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 7623/9999] sound/core/pcm.c:127: Error:
 unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
Message-ID: <202307251035.DfuupfvV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 3c9534778d4cc2bd01e20d4dcffc55df0962aa12 [7623/9999] PCI/MSI: Protect msi_desc::masked for multi-MSI
config: riscv-randconfig-r014-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251035.DfuupfvV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251035.DfuupfvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251035.DfuupfvV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/pcm.c: Assembler messages:
   sound/core/pcm.c:107: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:107: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:170: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:170: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> sound/core/pcm.c:127: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
>> sound/core/pcm.c:127: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   sound/core/pcm.c:129: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   sound/core/pcm.c:129: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   sound/core/pcm.c:134: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:134: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:112: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/core/pcm.c:112: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +127 sound/core/pcm.c

f90c06a2b613ee Pawel MOLL          2008-07-30   97  
877211f5e1b119 Takashi Iwai        2005-11-17   98  static int snd_pcm_control_ioctl(struct snd_card *card,
877211f5e1b119 Takashi Iwai        2005-11-17   99  				 struct snd_ctl_file *control,
^1da177e4c3f41 Linus Torvalds      2005-04-16  100  				 unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds      2005-04-16  101  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  102  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  103  	case SNDRV_CTL_IOCTL_PCM_NEXT_DEVICE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  104  		{
^1da177e4c3f41 Linus Torvalds      2005-04-16  105  			int device;
^1da177e4c3f41 Linus Torvalds      2005-04-16  106  
^1da177e4c3f41 Linus Torvalds      2005-04-16 @107  			if (get_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds      2005-04-16  108  				return -EFAULT;
1a60d4c5a0c402 Ingo Molnar         2006-01-16  109  			mutex_lock(&register_mutex);
f90c06a2b613ee Pawel MOLL          2008-07-30  110  			device = snd_pcm_next(card, device);
1a60d4c5a0c402 Ingo Molnar         2006-01-16  111  			mutex_unlock(&register_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  112  			if (put_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds      2005-04-16  113  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  114  			return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  115  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  116  	case SNDRV_CTL_IOCTL_PCM_INFO:
^1da177e4c3f41 Linus Torvalds      2005-04-16  117  		{
877211f5e1b119 Takashi Iwai        2005-11-17  118  			struct snd_pcm_info __user *info;
^1da177e4c3f41 Linus Torvalds      2005-04-16  119  			unsigned int device, subdevice;
877211f5e1b119 Takashi Iwai        2005-11-17  120  			int stream;
877211f5e1b119 Takashi Iwai        2005-11-17  121  			struct snd_pcm *pcm;
877211f5e1b119 Takashi Iwai        2005-11-17  122  			struct snd_pcm_str *pstr;
877211f5e1b119 Takashi Iwai        2005-11-17  123  			struct snd_pcm_substream *substream;
f87135f56cb266 Clemens Ladisch     2005-11-20  124  			int err;
f87135f56cb266 Clemens Ladisch     2005-11-20  125  
877211f5e1b119 Takashi Iwai        2005-11-17  126  			info = (struct snd_pcm_info __user *)arg;
^1da177e4c3f41 Linus Torvalds      2005-04-16 @127  			if (get_user(device, &info->device))
^1da177e4c3f41 Linus Torvalds      2005-04-16  128  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  129  			if (get_user(stream, &info->stream))
^1da177e4c3f41 Linus Torvalds      2005-04-16  130  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  131  			if (stream < 0 || stream > 1)
^1da177e4c3f41 Linus Torvalds      2005-04-16  132  				return -EINVAL;
56971d62c7591e Gustavo A. R. Silva 2018-12-12  133  			stream = array_index_nospec(stream, 2);
^1da177e4c3f41 Linus Torvalds      2005-04-16  134  			if (get_user(subdevice, &info->subdevice))
^1da177e4c3f41 Linus Torvalds      2005-04-16  135  				return -EFAULT;
1a60d4c5a0c402 Ingo Molnar         2006-01-16  136  			mutex_lock(&register_mutex);
f90c06a2b613ee Pawel MOLL          2008-07-30  137  			pcm = snd_pcm_get(card, device);
f87135f56cb266 Clemens Ladisch     2005-11-20  138  			if (pcm == NULL) {
f87135f56cb266 Clemens Ladisch     2005-11-20  139  				err = -ENXIO;
f87135f56cb266 Clemens Ladisch     2005-11-20  140  				goto _error;
f87135f56cb266 Clemens Ladisch     2005-11-20  141  			}
f87135f56cb266 Clemens Ladisch     2005-11-20  142  			pstr = &pcm->streams[stream];
f87135f56cb266 Clemens Ladisch     2005-11-20  143  			if (pstr->substream_count == 0) {
f87135f56cb266 Clemens Ladisch     2005-11-20  144  				err = -ENOENT;
f87135f56cb266 Clemens Ladisch     2005-11-20  145  				goto _error;
f87135f56cb266 Clemens Ladisch     2005-11-20  146  			}
f87135f56cb266 Clemens Ladisch     2005-11-20  147  			if (subdevice >= pstr->substream_count) {
f87135f56cb266 Clemens Ladisch     2005-11-20  148  				err = -ENXIO;
f87135f56cb266 Clemens Ladisch     2005-11-20  149  				goto _error;
f87135f56cb266 Clemens Ladisch     2005-11-20  150  			}
f87135f56cb266 Clemens Ladisch     2005-11-20  151  			for (substream = pstr->substream; substream;
f87135f56cb266 Clemens Ladisch     2005-11-20  152  			     substream = substream->next)
^1da177e4c3f41 Linus Torvalds      2005-04-16  153  				if (substream->number == (int)subdevice)
^1da177e4c3f41 Linus Torvalds      2005-04-16  154  					break;
f87135f56cb266 Clemens Ladisch     2005-11-20  155  			if (substream == NULL) {
f87135f56cb266 Clemens Ladisch     2005-11-20  156  				err = -ENXIO;
f87135f56cb266 Clemens Ladisch     2005-11-20  157  				goto _error;
f87135f56cb266 Clemens Ladisch     2005-11-20  158  			}
362bca57f5d782 Robb Glasser        2017-12-05  159  			mutex_lock(&pcm->open_mutex);
f87135f56cb266 Clemens Ladisch     2005-11-20  160  			err = snd_pcm_info_user(substream, info);
362bca57f5d782 Robb Glasser        2017-12-05  161  			mutex_unlock(&pcm->open_mutex);
f87135f56cb266 Clemens Ladisch     2005-11-20  162  		_error:
1a60d4c5a0c402 Ingo Molnar         2006-01-16  163  			mutex_unlock(&register_mutex);
f87135f56cb266 Clemens Ladisch     2005-11-20  164  			return err;
^1da177e4c3f41 Linus Torvalds      2005-04-16  165  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  166  	case SNDRV_CTL_IOCTL_PCM_PREFER_SUBDEVICE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  167  		{
^1da177e4c3f41 Linus Torvalds      2005-04-16  168  			int val;
^1da177e4c3f41 Linus Torvalds      2005-04-16  169  			
^1da177e4c3f41 Linus Torvalds      2005-04-16  170  			if (get_user(val, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds      2005-04-16  171  				return -EFAULT;
23c18d4bfd73ee Takashi Iwai        2014-02-19  172  			control->preferred_subdevice[SND_CTL_SUBDEV_PCM] = val;
^1da177e4c3f41 Linus Torvalds      2005-04-16  173  			return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  174  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  175  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  176  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds      2005-04-16  177  }
21a3479a0b606d Jaroslav Kysela     2006-01-13  178  

:::::: The code at line 127 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
