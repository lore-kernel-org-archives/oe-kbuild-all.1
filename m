Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246048F60
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675368592; x=1706904592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EdGFswneWv/1WxwuBCK/pyMs4jxFBv++s6r7X4nvUeI=;
  b=Jv8UovDnhO7rZQikamlrfzJ3u1O/NgO9En10QrreC1PmP1LUNzBQJG6N
   /ng/p1T/utvyfXDoItRQJUGk3+SotQuQqVzloW7jE24D3jnBsG76X+gXp
   q0O5mkw2d30Y0pmmIY2Sn2yKDSWvG886nfugqzZN8F5Plq/D5XzTMA2yb
   tW4iG//l1z2jBhqcm0HUzwb4xi392j/Eqa+oWclv/uQsmKhc9tHwlCG+I
   E7AJSwYT3wIUiRhH12JKDvJmBviSXYRoKygt6lAwXAUdKnjxcKH9yBhWc
   W1mWquuK7D3ntGNBEqAFHB/3yId+WiqzUL9Gkg0a57a+FDlf3i2UlCRQ/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308899349"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308899349"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 12:09:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994239335"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="994239335"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 12:09:47 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNftz-0006oI-0G;
	Thu, 02 Feb 2023 20:09:47 +0000
Date: Fri, 3 Feb 2023 04:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, robh+dt@kernel.org,
	broonie@kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca,
	jarkko@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, thierry.reding@gmail.com,
	jonathanh@nvidia.com, skomatineni@nvidia.com, ldewangan@nvidia.com,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: Re: [PATCH 2/4] tpm: tegra: Support SPI tpm wait state detect
Message-ID: <202302030428.MRyuAj03-lkp@intel.com>
References: <20230202161750.21210-3-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202161750.21210-3-kyarlagadda@nvidia.com>

Hi Krishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus broonie-spi/for-next robh/for-next linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/dt-bindings-tpm-Add-compatible-for-Tegra-TPM/20230203-002113
patch link:    https://lore.kernel.org/r/20230202161750.21210-3-kyarlagadda%40nvidia.com
patch subject: [PATCH 2/4] tpm: tegra: Support SPI tpm wait state detect
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302030428.MRyuAj03-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a454b022e5273e483b968f1998e0b177e71fcb2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krishna-Yarlagadda/dt-bindings-tpm-Add-compatible-for-Tegra-TPM/20230203-002113
        git checkout 9a454b022e5273e483b968f1998e0b177e71fcb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tis_spi_tegra.c:23:5: warning: no previous prototype for 'tpm_tis_spi_tegra_transfer' [-Wmissing-prototypes]
      23 | int tpm_tis_spi_tegra_transfer(struct tpm_tis_data *data, u32 addr, u16 len,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/tpm_tis_spi_tegra_transfer +23 drivers/char/tpm/tpm_tis_spi_tegra.c

    22	
  > 23	int tpm_tis_spi_tegra_transfer(struct tpm_tis_data *data, u32 addr, u16 len,
    24				       u8 *in, const u8 *out)
    25	{
    26		struct tpm_tis_spi_phy *phy = to_tpm_tis_spi_phy(data);
    27		int ret = 0;
    28		struct spi_message m;
    29		struct spi_transfer spi_xfer[3];
    30		u8 transfer_len;
    31	
    32		spi_bus_lock(phy->spi_device->master);
    33	
    34		while (len) {
    35			transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
    36	
    37			spi_message_init(&m);
    38			phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
    39			phy->iobuf[1] = 0xd4;
    40			phy->iobuf[2] = addr >> 8;
    41			phy->iobuf[3] = addr;
    42	
    43			memset(&spi_xfer, 0, sizeof(spi_xfer));
    44	
    45			spi_xfer[0].tx_buf = phy->iobuf;
    46			spi_xfer[0].len = 1;
    47			spi_message_add_tail(&spi_xfer[0], &m);
    48	
    49			spi_xfer[1].tx_buf = phy->iobuf + 1;
    50			spi_xfer[1].len = 3;
    51			spi_message_add_tail(&spi_xfer[1], &m);
    52	
    53			if (out) {
    54				spi_xfer[2].tx_buf = &phy->iobuf[4];
    55				spi_xfer[2].rx_buf = NULL;
    56				memcpy(&phy->iobuf[4], out, transfer_len);
    57				out += transfer_len;
    58			}
    59			if (in) {
    60				spi_xfer[2].tx_buf = NULL;
    61				spi_xfer[2].rx_buf = &phy->iobuf[4];
    62			}
    63			spi_xfer[2].len = transfer_len;
    64			spi_message_add_tail(&spi_xfer[2], &m);
    65	
    66			reinit_completion(&phy->ready);
    67			ret = spi_sync_locked(phy->spi_device, &m);
    68			if (ret < 0)
    69				goto exit;
    70	
    71			if (in) {
    72				memcpy(in, &phy->iobuf[4], transfer_len);
    73				in += transfer_len;
    74			}
    75	
    76			len -= transfer_len;
    77		}
    78	
    79	exit:
    80		spi_bus_unlock(phy->spi_device->master);
    81		return ret;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
