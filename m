Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99818831
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680892382; x=1712428382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6Rsy8KIsIxzZklVaFd61JBwvQtgs6ViK3ZVBEc8ttI=;
  b=PH5mW9neSjs+bw+eKeXgQmdcnPc/v2ADxpKVBtmBMfslMm/Cd3hShxey
   88lQrhuBazXvpEpVpVuk6wKipymPeZuSfAfbhAoH8HGETYM8RzJYMB0Qn
   dSdvX2WkiAOiw90gAaKbzlchcnky+dysk0A9+xFI3tG0BX1bwYfNW9Ldu
   6e3rFiSFi7ohnhmiEGaQ+nwFwK8I84fxRd0/LvsdH+AyWdFkWEcKNCy8/
   s7lGUwmcF2KDxD4hmZI1Nkza0WddOk2oIG6w4qKNFOyA8IIvzlsI+YfIo
   CEwXDoVukGLyaRSA9Zjn+kxmMUkpwByrOiuAzExu4zSUTmJj8ptAYZCRU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405866276"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="405866276"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752115536"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752115536"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2023 11:32:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqtO-000Sn9-14;
	Fri, 07 Apr 2023 18:32:58 +0000
Date: Sat, 8 Apr 2023 02:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 20967/22735]
 drivers/media/i2c/ov2312.c:206:44: warning: variable 'routing' set but not
 used
Message-ID: <202304080213.tG0q2FGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jai,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   e6bb059e69c106b73bfe2a10e729dbe5a5820916
commit: 29a91ea625ab96f02f66b5533af1847edc3483af [20967/22735] media: i2c: ov2312: add Omnivison OV2312 driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080213.tG0q2FGi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 29a91ea625ab96f02f66b5533af1847edc3483af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080213.tG0q2FGi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov2312.c: In function 'ov2312_get_frame_desc':
>> drivers/media/i2c/ov2312.c:206:44: warning: variable 'routing' set but not used [-Wunused-but-set-variable]
     206 |         const struct v4l2_subdev_krouting *routing;
         |                                            ^~~~~~~


vim +/routing +206 drivers/media/i2c/ov2312.c

   200	
   201	static int ov2312_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
   202					 struct v4l2_mbus_frame_desc *fd)
   203	{
   204		struct v4l2_subdev_state *state;
   205		struct v4l2_mbus_framefmt *fmt;
 > 206		const struct v4l2_subdev_krouting *routing;
   207		u32 bpp;
   208		int ret = 0;
   209		unsigned int i;
   210	
   211		if (pad != 0)
   212			return -EINVAL;
   213	
   214		state = v4l2_subdev_lock_active_state(sd);
   215		routing = &state->routing;
   216	
   217		fmt = v4l2_state_get_stream_format(state, 0, 0);
   218		if (!fmt) {
   219			ret = -EPIPE;
   220			goto out;
   221		}
   222	
   223		memset(fd, 0, sizeof(*fd));
   224	
   225		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
   226	
   227		/* pixel stream - 2 virtual channels */
   228	
   229		bpp = 10;
   230	
   231		for (i = 0; i < 2; ++i) {
   232			fd->entry[fd->num_entries].stream = i;
   233	
   234			fd->entry[fd->num_entries].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
   235			fd->entry[fd->num_entries].length = fmt->width * fmt->height * bpp / 8;
   236			fd->entry[fd->num_entries].pixelcode = fmt->code;
   237			fd->entry[fd->num_entries].bus.csi2.vc = i;
   238			fd->entry[fd->num_entries].bus.csi2.dt = 0x2b; /* RAW10 */
   239	
   240			fd->num_entries++;
   241		}
   242	
   243	out:
   244		v4l2_subdev_unlock_state(state);
   245	
   246		return ret;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
