Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8C79EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677525239; x=1709061239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bFxKwsbZZbuFlDG085y5IiNDapl56NSDvTOzTCBiIw=;
  b=i+B0qbmgobobXu37s8l4gUcqyi0l7kVpC5tVGrrQqlHLwUuX4qqntIo+
   SXhakwacZLB20xwbnOKBAJTJzJOXTIrmG5j/8i9578B/9MeZEJvVNWdrf
   vWTV8sek2zUS55XitaTIEw/a4iIYrj3uuaMPtwiuKRbPaRI6EQfpIaYVH
   aC6eeBKaQpKVJloKHYWWHwi4Ob5w1tlhcssY2CmN2CwI7QjmtF+cN2OOK
   6U7g63modaKhpdK9oZ1kVBj+dsbJAwcatjUlmuPYnlgJmHW7/qQ+yedLF
   qdMg+v2ExMxEDIgCgaLZN1vVSeOYmMaTHsWkL/NGT8nyiZViiY6vw5OGn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332667241"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="332667241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 11:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673836859"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="673836859"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Feb 2023 11:13:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWiwd-0004hv-2N;
	Mon, 27 Feb 2023 19:13:55 +0000
Date: Tue, 28 Feb 2023 03:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 20967/22727]
 drivers/media/i2c/ov2312.c:206:44: warning: variable 'routing' set but not
 used
Message-ID: <202302280351.Jy95eapb-lkp@intel.com>
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
head:   d14fbab5ccb21ffeb010ce57792c56a1308ed314
commit: 29a91ea625ab96f02f66b5533af1847edc3483af [20967/22727] media: i2c: ov2312: add Omnivison OV2312 driver
config: h8300-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280351.Jy95eapb-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 29a91ea625ab96f02f66b5533af1847edc3483af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/char/tpm/ drivers/dma/ drivers/media/dvb-frontends/ drivers/media/i2c/ drivers/media/platform/chips-media/wave5/ drivers/media/rc/ drivers/mmc/core/ drivers/net/ethernet/cadence/ drivers/usb/dwc2/ drivers/usb/misc/sisusbvga/ drivers/usb/storage/ drivers/w1/ fs/cifs/ fs/jfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280351.Jy95eapb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/delay.h:22,
                    from drivers/media/i2c/ov2312.c:8:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/page.h:93:51: warning: ordered comparison of pointer with null pointer [-Wextra]
      93 | #define virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
         |                                                   ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   drivers/media/i2c/ov2312.c: In function 'ov2312_get_frame_desc':
>> drivers/media/i2c/ov2312.c:206:44: warning: variable 'routing' set but not used [-Wunused-but-set-variable]
     206 |         const struct v4l2_subdev_krouting *routing;
         |                                            ^~~~~~~
   drivers/media/i2c/ov2312.c: At top level:
   drivers/media/i2c/ov2312.c:485:12: warning: 'ov2312_suspend' defined but not used [-Wunused-function]
     485 | static int ov2312_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~
   drivers/media/i2c/ov2312.c:476:12: warning: 'ov2312_resume' defined but not used [-Wunused-function]
     476 | static int ov2312_resume(struct device *dev)
         |            ^~~~~~~~~~~~~


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
