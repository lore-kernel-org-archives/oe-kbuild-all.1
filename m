Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554716FD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682119232; x=1713655232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+aOGfveR5QxLDNBV2uv6FM0FuGsHyyWTmz3hqDhOUGw=;
  b=SgOUZrNE5fbWDY6subNApa7JYYZXG6iupfp0Q3OHchmGhAZOkcjFvbhv
   0q/gmxoZRjZhgWJQCnNC6d2rF6vFTvoy3o45iJzRhfHvIUCUtepFAuDWf
   juoVSx60i9sD9Ifs7wuQyCfWWxjr/UeVolgjJ/y1xTA3qtt01ztHo+R2c
   EJFVsv3Nzs/jNQRGjBag5g1IQKAmEeFQIjQCDruHMFJo5Hpp0XyOLzeOW
   9MIzxOpsBnvMQj74r8EW8o5RLMa7ea0fGf9HAiCeA/fyxcmoL8yuYs8cl
   hrP42JW9wkcO4ZSUDJ11InWZ4Sos1xXnoNaAfyS4Q331i+1LvEdJZlQDD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326430845"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="326430845"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 16:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669868629"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="669868629"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2023 16:20:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq03H-000gvK-0A;
	Fri, 21 Apr 2023 23:20:27 +0000
Date: Sat, 22 Apr 2023 07:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mehdi Djait <mehdi.djait.k@gmail.com>, jic23@kernel.org,
	mazziesaccount@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
	andriy.shevchenko@linux.intel.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Mehdi Djait <mehdi.djait.k@gmail.com>
Subject: Re: [PATCH v2 5/5] iio: accel: Add support for Kionix/ROHM
 KX132-1211 accelerometer
Message-ID: <202304220729.FCofPRvH-lkp@intel.com>
References: <cef09595632a40eff8a0864fea2e0eb6653930a5.1682019544.git.mehdi.djait.k@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cef09595632a40eff8a0864fea2e0eb6653930a5.1682019544.git.mehdi.djait.k@gmail.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on next-20230421]
[cannot apply to linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-iio-Add-KX132-1211-accelerometer/20230421-042531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/cef09595632a40eff8a0864fea2e0eb6653930a5.1682019544.git.mehdi.djait.k%40gmail.com
patch subject: [PATCH v2 5/5] iio: accel: Add support for Kionix/ROHM KX132-1211 accelerometer
config: mips-randconfig-s031-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220729.FCofPRvH-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/38837f58c549d688da8cb7cfb1aea0bd65a12548
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mehdi-Djait/dt-bindings-iio-Add-KX132-1211-accelerometer/20230421-042531
        git checkout 38837f58c549d688da8cb7cfb1aea0bd65a12548
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220729.FCofPRvH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/accel/kionix-kx022a.c:698:20: sparse: sparse: invalid assignment: &=
>> drivers/iio/accel/kionix-kx022a.c:698:20: sparse:    left side has type restricted __le16
>> drivers/iio/accel/kionix-kx022a.c:698:20: sparse:    right side has type unsigned short

vim +698 drivers/iio/accel/kionix-kx022a.c

   684	
   685	static int kx132_get_fifo_bytes(struct kx022a_data *data)
   686	{
   687		struct device *dev = regmap_get_device(data->regmap);
   688		__le16 buf_status;
   689		int ret, fifo_bytes;
   690	
   691		ret = regmap_bulk_read(data->regmap, data->chip_info->buf_status1,
   692				       &buf_status, sizeof(buf_status));
   693		if (ret) {
   694			dev_err(dev, "Error reading buffer status\n");
   695			return ret;
   696		}
   697	
 > 698		buf_status &= data->chip_info->buf_smp_lvl_mask;
   699		fifo_bytes = le16_to_cpu(buf_status);
   700	
   701		return fifo_bytes;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
