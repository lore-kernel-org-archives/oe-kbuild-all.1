Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103C20E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686828419; x=1718364419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAmNAYYVgODwRO76eoGCuAczmjTlo6b/tutd4bTWGYY=;
  b=Ik7RHr7AnE+Zppe3f6yjRVNrBjpQMGCbOQ07WuOYDz1JKAV+YF69+zbH
   30/qEuiHqSnhrxF3ftVt2aLHOXqXHodSjVsbGWdKgBNyk9S8x2QS0lyzj
   OTwwE3lVbUJ0Cxl9Mo3lzPzmG57jZTQY5zi9m6a55fY9tQuZlj1S0xmKP
   Qgx+PsPv7kKbuFLikaty0Lfg6u6cI8iSk3Xs6keZORFom3N45RRKrmUuj
   BXw8OSjzxEckx9u3f6mVPEzmgc554hqcnH8Byey4eyfjVZ7RheVWwiFNy
   9eyTCFPqHtDq3z2FWsdrdxymkaFlTeAzmSkgu2vBhJMHZp01gIupnTtGe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422490673"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="422490673"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="662753307"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="662753307"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 04:26:53 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9l7t-0001oH-0V;
	Thu, 15 Jun 2023 11:26:53 +0000
Date: Thu, 15 Jun 2023 19:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 4020/30000]
 drivers/media/i2c/max9286.c:109:13: warning: variable 'ret' set but not used
Message-ID: <202306151950.3AbSwMaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Meng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84b0def7f5485c67cb173427c2009a55c6303842
commit: 41994ca1985584f12c52324f97effb3a8ae4a0c1 [4020/30000] media: i2c: add MAX9286/96705 SER/DES driver
config: microblaze-buildonly-randconfig-r006-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151950.3AbSwMaQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/41994ca1985584f12c52324f97effb3a8ae4a0c1
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_s
        git checkout 41994ca1985584f12c52324f97effb3a8ae4a0c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash M=drivers/media/i2c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151950.3AbSwMaQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/max9286.c: In function 'max96705_write_register':
   drivers/media/i2c/max9286.c:116:25: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     116 |                 if (val < 0)
         |                         ^
>> drivers/media/i2c/max9286.c:109:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     109 |         int ret;
         |             ^~~
   drivers/media/i2c/max9286.c: At top level:
>> drivers/media/i2c/max9286.c:839:4: warning: no previous prototype for 'get_output_link_order' [-Wmissing-prototypes]
     839 | u8 get_output_link_order(struct max9286 *max)
         |    ^~~~~~~~~~~~~~~~~~~~~
   microblaze-linux-ld: warning: drivers/media/i2c/.tmp_mc_max9286.o: missing .note.GNU-stack section implies executable stack
   microblaze-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker


vim +/ret +109 drivers/media/i2c/max9286.c

   104	
   105	/* Serializer register write */
   106	static int max96705_write_register(struct max9286 *max,
   107		unsigned int offset, u8 reg, u8 val)
   108	{
 > 109		int ret;
   110		int retry, timeout = 10;
   111		struct i2c_client *client = v4l2_get_subdevdata(&max->v4l2_sd);
   112	
   113		client->addr = S_ADDR_MAX96705 + offset;
   114		for (retry = 0; retry < timeout; retry++) {
   115			ret = i2c_smbus_write_byte_data(client, reg, val);
 > 116			if (val < 0)
   117				usleep_range(5000, 6000);
   118			else
   119				break;
   120		}
   121	
   122		client->addr = DS_ADDR_MAX9286;
   123		if (retry >= timeout) {
   124			dev_err(max->v4l2_sd.dev,
   125				"%s:write reg failed: reg=%2x\n", __func__, reg);
   126			return -EREMOTEIO;
   127		}
   128	
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
