Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571E0388
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 23:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676676279; x=1708212279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZUE9AgFs+DqhpJMiN0CzoVq4O/40fHfTVNsHzu4iig=;
  b=DIieGUxRpEnte7t1pjyoi1k7cpk5sK0W/dqg5i/+EbfVLFCvRpFUSais
   Y80y2Er9M7HhbrUivUEsMTjJ76MVDSWuyP1BBvodpKiHTjpwrKabOhu+0
   Pw9u/2gJPPETpy34XJhTMSZaQWxX1wdeqUqno0224grJl9VMkz5+zm12J
   7+STS4XVYfk6h37PXTOLQtT7l+x5bgGYa0fAy2Ky9eHNEx4xBcxCdq6ut
   HoIRKzoRd/IzZvGJx0QfZPVC4In2DIM/F0w8U733rsmxMP4Cs1LmicSnE
   j+bCAlbinBVroPngupdEYn6R5szMTu+CMtJXwPXapu/wljX25hLBW3qpY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329832587"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="329832587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 15:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759548074"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="759548074"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 15:24:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTA5l-000Bu1-06;
	Fri, 17 Feb 2023 23:24:37 +0000
Date: Sat, 18 Feb 2023 07:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 505/584]
 drivers/soc/qcom/pmic_glink_altmode.c:223:13: warning: variable 'svid' set
 but not used
Message-ID: <202302180713.0qDNN7Wj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   e1df0b14d2e3085d5ff5a1c7474b47840640da92
commit: ea722b86d01bb419209fa6328c43f61d5df52b4a [505/584] soc: qcom: pmic_glink: Introduce altmode support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302180713.0qDNN7Wj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/ea722b86d01bb419209fa6328c43f61d5df52b4a
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout ea722b86d01bb419209fa6328c43f61d5df52b4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/endpoint/functions/ drivers/phy/qualcomm/ drivers/power/supply/ drivers/soc/qcom/ drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180713.0qDNN7Wj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/pmic_glink_altmode.c: In function 'pmic_glink_altmode_sc8180xp_notify':
>> drivers/soc/qcom/pmic_glink_altmode.c:223:13: warning: variable 'svid' set but not used [-Wunused-but-set-variable]
     223 |         u16 svid;
         |             ^~~~


vim +/svid +223 drivers/soc/qcom/pmic_glink_altmode.c

   213	
   214	static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmode,
   215						       const void *data, size_t len)
   216	{
   217		struct pmic_glink_altmode_port *alt_port;
   218		const struct usbc_sc8180x_notify *msg;
   219		u32 notification;
   220		u8 orientation;
   221		u8 hpd_state;
   222		u8 hpd_irq;
 > 223		u16 svid;
   224		u8 port;
   225		u8 mode;
   226		u8 mux;
   227	
   228		if (len != sizeof(*msg)) {
   229			dev_warn(altmode->dev, "invalid length of USBC_NOTIFY indication: %zd\n", len);
   230			return;
   231		}
   232	
   233		msg = data;
   234		notification = le32_to_cpu(msg->notification);
   235		port = FIELD_GET(SC8180X_PORT_MASK, notification);
   236		orientation = FIELD_GET(SC8180X_ORIENTATION_MASK, notification);
   237		mux = FIELD_GET(SC8180X_MUX_MASK, notification);
   238		mode = FIELD_GET(SC8180X_MODE_MASK, notification);
   239		hpd_state = FIELD_GET(SC8180X_HPD_STATE_MASK, notification);
   240		hpd_irq = FIELD_GET(SC8180X_HPD_IRQ_MASK, notification);
   241	
   242		svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
   243	
   244		if (!altmode->ports[port].altmode) {
   245			dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
   246			return;
   247		}
   248	
   249		alt_port = &altmode->ports[port];
   250		alt_port->orientation = pmic_glink_altmode_orientation(orientation);
   251		alt_port->svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
   252		alt_port->mode = mode;
   253		alt_port->hpd_state = hpd_state;
   254		alt_port->hpd_irq = hpd_irq;
   255		schedule_work(&alt_port->work);
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
