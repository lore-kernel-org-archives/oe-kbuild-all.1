Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD23E38D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 03:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690599827; x=1722135827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjQOS3XFGaDh1fpc6G40y8BuVdNhHmr5hs8f9YDCtpE=;
  b=mHyfTk8rpWsPS43LAC4dlpSND+ign/Ltu5m0za75fxSSy5/mtZGPqX6r
   r5ABpRFWXkwdob1dNu2W0F8fFdyye+n6t7fFySr1MoNx7YEJB+a+B9NXw
   APvFSFM5rpuAaJazGVFABfToWqr+N0men1hjPhHRnKvsw+GZrjSL+gmU+
   sA3ZWaole/LuTz6KUatgBrWSCiQ0FDXtha6x6szKUTalaJf4JZGrAI7ZR
   8FIu8p4XbBsaB7/72rCxLTLC4bXnLvyfvQrrnSvYMIoRR403zMx8uClK4
   UJmjMAwHQ7o+j5Xxt/x33IcpVW1IHlatFLKhBUap7TlWSU7TjtYjsdUaz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353629907"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="353629907"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 20:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="730965537"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="730965537"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 20:03:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPaF7-0003md-0g;
	Sat, 29 Jul 2023 03:03:45 +0000
Date: Sat, 29 Jul 2023 11:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-sockptr 18/26]
 drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: warning:
 'snd_solo_pcm_copy' defined but not used
Message-ID: <202307291119.03yget13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/pcm-sockptr
head:   3fffa74b00add561981357c76375e1829059d4e5
commit: 79cf0bf97368998dd44c1863d6f54057846b68c9 [18/26] media: solo6x10: Convert to generic PCM copy ops
config: i386-buildonly-randconfig-r004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291119.03yget13-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291119.03yget13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291119.03yget13-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/solo6x10/solo6x10-g723.c:242:10: error: 'const struct snd_pcm_ops' has no member named 'copye'; did you mean 'copy'?
     242 |         .copye = snd_solo_pcm_copy_user,
         |          ^~~~~
         |          copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: error: 'snd_solo_pcm_copy_user' undeclared here (not in a function); did you mean 'snd_solo_pcm_copy'?
     242 |         .copye = snd_solo_pcm_copy_user,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
         |                  snd_solo_pcm_copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
   drivers/media/pci/solo6x10/solo6x10-g723.c:242:18: note: (near initialization for 'snd_solo_pcm_ops')
>> drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: warning: 'snd_solo_pcm_copy' defined but not used [-Wunused-function]
     207 | static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
         |            ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/snd_solo_pcm_copy +207 drivers/media/pci/solo6x10/solo6x10-g723.c

   206	
 > 207	static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
   208				     unsigned long pos, sockptr_t dst,
   209				     unsigned long count)
   210	{
   211		struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
   212		struct solo_dev *solo_dev = solo_pcm->solo_dev;
   213		unsigned int off = 0;
   214		int err, i;
   215	
   216		for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
   217			int page = (pos / G723_FRAMES_PER_PAGE) + i;
   218	
   219			err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
   220					     SOLO_G723_EXT_ADDR(solo_dev) +
   221					     (page * G723_PERIOD_BLOCK) +
   222					     (ss->number * G723_PERIOD_BYTES),
   223					     G723_PERIOD_BYTES, 0, 0);
   224			if (err)
   225				return err;
   226	
   227			if (copy_to_sockptr_offset(dst, off,
   228						   solo_pcm->g723_buf, G723_PERIOD_BYTES))
   229				return -EFAULT;
   230			off += G723_PERIOD_BYTES;
   231		}
   232	
   233		return 0;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
