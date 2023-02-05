Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955533C1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675620513; x=1707156513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNukrZj6U/6LY9h817cBXYMS1+KF8BsGSZVNAEL/6G0=;
  b=iNZPbeazgxn5AcwSlMWKnIfehBVmUnJFpoFDfo9CbMbrGkviMVYP3M9D
   Wkf2Dg9yfmTeeM3XMnKOskKpUXqnfRDfRS8TURHn5SvIlmdajmv/8eKHb
   R+p1niB9PXzrqYZd8kkVul0sX92I2Lm/sbsmVyGFqHRBR6TVSXV/LtBCq
   q7uYTUXtwkfuSQ9sdGcZGZkqujfN1tXwDdLfNTY4nRt9/1i/jWC3TdIPW
   l4t3ywmcjE7feFFFTgSonilEAuCBM+XuXu2st2QhHGTSzpGeJHDM2MjGn
   TxqMsovaQHl8SF+JBbQjmhUMXCl8/fR0Ql2Ko/B4hAsoOm/NRtBLVAY80
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="331206775"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="331206775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698634242"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698634242"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 10:08:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOjRB-00028o-2F;
	Sun, 05 Feb 2023 18:08:25 +0000
Date: Mon, 6 Feb 2023 02:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [jic23-iio:testing 3/5] drivers/iio/proximity/sx_common.c:437:55:
 error: implicit declaration of function 'acpi_device_hid'; did you mean
 'dmi_device_id'?
Message-ID: <202302060132.vAIoV9ew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   1693e893f058e96fdaccbdb4bb42970811ac9ec6
commit: fef38680d38d39f6f574db2c77df3de215f08e7d [3/5] iio: proximity: sx_common: Add old register mapping
config: arc-randconfig-r043-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060132.vAIoV9ew-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=fef38680d38d39f6f574db2c77df3de215f08e7d
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout fef38680d38d39f6f574db2c77df3de215f08e7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/iio/proximity/sx_common.c: In function 'sx_common_get_raw_register_config':
>> drivers/iio/proximity/sx_common.c:437:55: error: implicit declaration of function 'acpi_device_hid'; did you mean 'dmi_device_id'? [-Werror=implicit-function-declaration]
     437 |         snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
         |                                                       ^~~~~~~~~~~~~~~
         |                                                       dmi_device_id
>> drivers/iio/proximity/sx_common.c:437:44: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     437 |         snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
         |                                           ~^          ~~~~~~~~~~~~~~~~~~~~~
         |                                            |          |
         |                                            char *     int
         |                                           %d
   cc1: some warnings being treated as errors


vim +437 drivers/iio/proximity/sx_common.c

   426	
   427	void sx_common_get_raw_register_config(struct device *dev,
   428					       struct sx_common_reg_default *reg_def)
   429	{
   430		struct acpi_device *adev = ACPI_COMPANION(dev);
   431		u32 raw = 0, ret;
   432		char prop[80];
   433	
   434		if (!reg_def->property || !adev)
   435			return;
   436	
 > 437		snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
   438		ret = device_property_read_u32(dev, prop, &raw);
   439		if (ret)
   440			return;
   441	
   442		reg_def->def = raw;
   443	}
   444	EXPORT_SYMBOL_NS_GPL(sx_common_get_raw_register_config, SEMTECH_PROX);
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
