Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D71C26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684226785; x=1715762785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QL+tBUOtTekpizs4IA8GnqHOaksmnf7OGlafEadIZKE=;
  b=LOoFH+hLor5XbQbC9N5U5qBvAiP0TSMESvqika2C8MmbIDRKO/65CWMT
   vEiQakUcuAZXv65N613n2pRD/ZBBqxKLn7wFIUWO1jXd2QPKtcKtyJ8D/
   5BFh8UocBHgBbg0KrgcBIiH8j64o4uJFYydzp0+JQKkVxMYJioOnwgzGi
   9DSnfAI2W2QVrZpxVK/LAufX1m4x5QZYrH/sHEGnT4qVZFGi3KQhE8Qte
   T3MIdAcA5+vEOH1IeP3PyKZKdCNCbpdvbpVsii9NOJrWRSy2ML0Q6u0cd
   cdU0IgF4rusc3BK2Xn9BWtJwBE3p07lxQK1Ly+Ts7wOPJrTOz3daiIb7d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="351454168"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="351454168"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 01:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="704312325"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="704312325"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 May 2023 01:46:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyqJq-0007H4-1m;
	Tue, 16 May 2023 08:46:06 +0000
Date: Tue, 16 May 2023 16:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Brad Larson <blarson@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
	adrian.hunter@intel.com, alcooperx@gmail.com,
	andy.shevchenko@gmail.com, arnd@arndb.de, blarson@amd.com,
	brendan.higgins@linux.dev, briannorris@chromium.org,
	catalin.marinas@arm.com, conor+dt@kernel.org, davidgow@google.com,
	gsomlo@gmail.com, gerg@linux-m68k.org, hal.feng@starfivetech.com,
	hasegawa-hitomi@fujitsu.com, j.neuschaefer@gmx.net, joel@jms.id.au,
	kernel@esmil.dk, krzk@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org, lee.jones@linaro.org, broonie@kernel.org,
	p.zabel@pengutronix.de, rdunlap@infradead.org, robh+dt@kernel.org,
	samuel@sholland.org
Subject: Re: [PATCH v14 8/8] soc: amd: Add support for AMD Pensando SoC
 Controller
Message-ID: <202305161642.PZQ4S8o2-lkp@intel.com>
References: <20230515181606.65953-9-blarson@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515181606.65953-9-blarson@amd.com>

Hi Brad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e922ba281a8d84f640d8c8e18a385d032c19e185]

url:    https://github.com/intel-lab-lkp/linux/commits/Brad-Larson/dt-bindings-arm-add-AMD-Pensando-boards/20230516-032312
base:   e922ba281a8d84f640d8c8e18a385d032c19e185
patch link:    https://lore.kernel.org/r/20230515181606.65953-9-blarson%40amd.com
patch subject: [PATCH v14 8/8] soc: amd: Add support for AMD Pensando SoC Controller
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230516/202305161642.PZQ4S8o2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/48a90df35083d2f3788e171ff0af01ddc8cd871b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Brad-Larson/dt-bindings-arm-add-AMD-Pensando-boards/20230516-032312
        git checkout 48a90df35083d2f3788e171ff0af01ddc8cd871b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/amd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161642.PZQ4S8o2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/amd/pensando-ctrl.c: In function 'penctrl_ioctl':
>> drivers/soc/amd/pensando-ctrl.c:91:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      91 |         if (copy_from_user(tx_buf, (void __user *)msg->tx_buf, msg->len)) {
         |                                    ^
   drivers/soc/amd/pensando-ctrl.c:114:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     114 |         if (copy_to_user((void __user *)msg->rx_buf, rx_buf, msg->len))
         |                          ^


vim +91 drivers/soc/amd/pensando-ctrl.c

    34	
    35	static long
    36	penctrl_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
    37	{
    38		void __user *in_arg = (void __user *)arg;
    39		struct penctrl_device *penctrl;
    40		u8 tx_buf[PENCTRL_MAX_MSG_LEN];
    41		u8 rx_buf[PENCTRL_MAX_MSG_LEN];
    42		struct spi_transfer t[2] = {};
    43		struct penctrl_spi_xfer *msg;
    44		struct spi_device *spi;
    45		unsigned int num_msgs;
    46		struct spi_message m;
    47		u32 size;
    48		int ret;
    49	
    50		/* Check for a valid command */
    51		if (_IOC_TYPE(cmd) != PENCTRL_IOC_MAGIC)
    52			return -ENOTTY;
    53	
    54		if (_IOC_NR(cmd) > PENCTRL_IOC_MAXNR)
    55			return -ENOTTY;
    56	
    57		if (((_IOC_DIR(cmd) & _IOC_READ)) && !access_ok(in_arg, _IOC_SIZE(cmd)))
    58			return -EFAULT;
    59	
    60		if (((_IOC_DIR(cmd) & _IOC_WRITE)) && !access_ok(in_arg, _IOC_SIZE(cmd)))
    61			return -EFAULT;
    62	
    63		/* Get a reference to the SPI device */
    64		penctrl = filp->private_data;
    65		if (!penctrl)
    66			return -ESHUTDOWN;
    67	
    68		spi = spi_dev_get(penctrl->spi);
    69		if (!spi)
    70			return -ESHUTDOWN;
    71	
    72		/* Verify and prepare SPI message */
    73		size = _IOC_SIZE(cmd);
    74		num_msgs = size / sizeof(struct penctrl_spi_xfer);
    75		if (num_msgs > 2 || size == 0 || size % sizeof(struct penctrl_spi_xfer)) {
    76			ret = -EINVAL;
    77			goto out_unlock;
    78		}
    79		msg = memdup_user((struct penctrl_spi_xfer *)arg, size);
    80		if (IS_ERR(msg)) {
    81			ret = PTR_ERR(msg);
    82			goto out_unlock;
    83		}
    84		if (msg->len > PENCTRL_MAX_MSG_LEN) {
    85			ret = -EINVAL;
    86			goto out_unlock;
    87		}
    88	
    89		t[0].tx_buf = tx_buf;
    90		t[0].len = msg->len;
  > 91		if (copy_from_user(tx_buf, (void __user *)msg->tx_buf, msg->len)) {
    92			ret = -EFAULT;
    93			goto out_unlock;
    94		}
    95		if (num_msgs > 1) {
    96			msg++;
    97			if (msg->len > PENCTRL_MAX_MSG_LEN) {
    98				ret = -EINVAL;
    99				goto out_unlock;
   100			}
   101			t[1].rx_buf = rx_buf;
   102			t[1].len = msg->len;
   103		}
   104		spi_message_init_with_transfers(&m, t, num_msgs);
   105	
   106		/* Perform the transfer */
   107		mutex_lock(&spi_lock);
   108		ret = spi_sync(spi, &m);
   109		mutex_unlock(&spi_lock);
   110	
   111		if (ret || (num_msgs == 1))
   112			goto out_unlock;
   113	
   114		if (copy_to_user((void __user *)msg->rx_buf, rx_buf, msg->len))
   115			ret = -EFAULT;
   116	
   117	out_unlock:
   118		spi_dev_put(spi);
   119		return ret;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
