Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8863A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678355542; x=1709891542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYmVndWvYsqeuPYUp1jFfbi0/DPDevKqO7et5ZeWcRs=;
  b=KUKXxqyIf66GvJhkt3c2PUWvT1jyxq9g7sJWkOcwltBkymFazq8Tq2zg
   bobK7wlAaohrFv5FgqqmGaEe9Exqyqcha4nYSypJ3UILwx35bLbcpoI5y
   yQ3I6c9jaG9gHZVvRQtY6mTEOJkoVn9WaDrsME/NIzK2Dt9eMs3Njej5o
   /EljJIS/h2TLqutyudviamVN7aa3UbjpX9ZDkHOmjRUBtU4SNspixZV/L
   qpFeYXtT3skLD7py4rX7cuSjuPZ25RMIUodlp7SMe+vmEcVckXouZpJcS
   +yGx+5x2LBsuLoYj1ZDbLTqQGciAj35p9caUj5+GZNV4SduHCtxGJb440
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335108064"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="335108064"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006666100"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="1006666100"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2023 01:52:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paCwd-0002rN-2p;
	Thu, 09 Mar 2023 09:52:19 +0000
Date: Thu, 9 Mar 2023 17:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: "MP, Sureshkumar" <sureshkumar.mp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.15/linux 3746/23027]
 drivers/iio/adc/ti-ads7142q1.c:156:13: warning: variable 'err' set but not
 used
Message-ID: <202303091715.E4firaOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sureshkumar,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2533aa36ba52e96057d68a4ab377a6293b91c1fc
commit: cffd430bb5a19172072aba6b50007eaba72f3e0b [3746/23027] ADS7142 TI ADC driver support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303091715.E4firaOX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/cffd430bb5a19172072aba6b50007eaba72f3e0b
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout cffd430bb5a19172072aba6b50007eaba72f3e0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/counter/ drivers/gpu/drm/bridge/ drivers/gpu/drm/mcde/ drivers/iio/adc/ drivers/media/i2c/ drivers/net/can/m_can/ drivers/pwm/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091715.E4firaOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/ti-ads7142q1.c: In function 'ads7142_read_raw':
>> drivers/iio/adc/ti-ads7142q1.c:156:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     156 |         int err;
         |             ^~~


vim +/err +156 drivers/iio/adc/ti-ads7142q1.c

   148	
   149	static int ads7142_read_raw(struct iio_dev *iio,
   150				    struct iio_chan_spec const *channel, int *value,
   151				    int *value2, long mask)
   152	{
   153		struct ads7142 *adc = iio_priv(iio);
   154		u8 adc_data[32];
   155		u8 data;
 > 156		int err;
   157	
   158		switch (mask) {
   159		case IIO_CHAN_INFO_AVERAGE_RAW:
   160			//mutex_lock(&priv->lock);
   161			/* Abort the present sequence */
   162			err = ads7142_reg_write(adc->i2c, ADS7142_REG_ABORT_SEQUENCE, ADS7142_VAL_ABORT_SEQUENCE);
   163			err = ads7142_reg_read(adc->i2c, ADS7142_REG_ABORT_SEQUENCE, &data);
   164	
   165			/* Perform Offset Calibration */
   166			err = ads7142_reg_write(adc->i2c, ADS7142_REG_OFFSET_CAL, ADS7142_VAL_TRIG_OFFCAL);
   167	
   168			/* Select Autonomous Mode with both Channels enabled */
   169			err = ads7142_reg_write(adc->i2c, ADS7142_REG_CHANNEL_INPUT_CFG, ADS7142_VAL_CHANNEL_INPUT_CFG_2_CHANNEL_SINGLE_ENDED);
   170	
   171			/* Select the operation mode of the device */
   172			err = ads7142_reg_write(adc->i2c, ADS7142_REG_OPMODE_SEL, ADS7142_VAL_OPMODE_SEL_AUTONOMOUS_MONITORING_MODE);
   173	
   174			/* Select the channel for auto sequencing */
   175			/* channel_0 -> bit 0 to be set and channel_1 -> bit 1 to be set */
   176			err = ads7142_reg_write(adc->i2c, ADS7142_REG_AUTO_SEQ_CHEN, (1 << channel->channel));
   177	
   178			/* Select the low power or high speed oscillator */
   179			err = ads7142_reg_write(adc->i2c, ADS7142_REG_OSC_SEL, ADS7142_VAL_OSC_SEL_HSZ_HSO);
   180	
   181			/* Set the minimum nCLK value for one conversion to maximize sampling speed */
   182			err = ads7142_reg_write(adc->i2c, ADS7142_REG_nCLK_SEL, 21);
   183	
   184			/* Select the Data Buffer output data Configuration */
   185			err = ads7142_reg_write(adc->i2c, ADS7142_REG_DOUT_FORMAT_CFG, ADS7142_VAL_DOUT_FORMAT_CFG_DOUT_FORMAT2);
   186	
   187			/* Select the Data Buffer opmode for Start Burst mode */
   188			err = ads7142_reg_write(adc->i2c, ADS7142_REG_DATA_BUFFER_OPMODE, ADS7142_VAL_DATA_BUFFER_STARTSTOP_CNTRL_STARTBURST);
   189	
   190			/* Set the SEQ_START Bit to begin the sampling sequence */
   191			err = ads7142_reg_write(adc->i2c, ADS7142_REG_START_SEQUENCE, ADS7142_VAL_START_SEQUENCE);
   192	
   193			msleep(500);
   194	
   195			/* read sampling raw data from internal data buffer */
   196			err = ads7142_data_buffer_read(adc->i2c, 32, adc_data);
   197	
   198			/* do average of raw data value */
   199			ads7142_raw_data_avg_value(adc_data, value);
   200			return IIO_VAL_INT;
   201	
   202		default:
   203			break;
   204	
   205		}
   206	
   207		return -EINVAL;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
