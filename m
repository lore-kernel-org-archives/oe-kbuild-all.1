Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E136E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675053229; x=1706589229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVMIPet7+WhLkaHyE2x0Lf1QphK6Qcwn7f6bJhEQ3rc=;
  b=XjJXxeXllVDM1YdZ8n3iBWFPE4YghkSwcfqMleJvDbDW67AnOHSnweF/
   atDay5piBdMnTvH9EfMlayUxdG+p/8wA8FO0qhMAaNtPrFAjmB8nxIznv
   oneX5YAO5fKegtM3EA8pKCWsU4bB0ImOf6STleLsXfgIwmUwOqSNEHIER
   ddzZdUBeO3C6EFYmFJ/LB5JgNKhfFU7hM0HYVANj1wi4fXfh/mfwMKfO5
   7vaeZEd0KXLtClQ8jdT055k0BPxqAXUgh24CTCSJnryVbKw7RWMs0wbu5
   ha4Ulguc8ezdMXIxYjTd631dlLf/mX0b/hElXwll/gWb04uR/HYskS86I
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="329591612"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="329591612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 20:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="837843236"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="837843236"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2023 20:33:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMLrV-0003Ni-2W;
	Mon, 30 Jan 2023 04:33:45 +0000
Date: Mon, 30 Jan 2023 12:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:sc8280xp-next-20230127 6/70]
 drivers/soc/qcom/pmic_glink_altmode.c:234:16: error: implicit declaration of
 function 'FIELD_GET'; did you mean 'FOLL_GET'?
Message-ID: <202301301227.GM39wlby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux sc8280xp-next-20230127
head:   f2025fa35c5b0b3ced14ce6890abe904b7e798e1
commit: 9aefcf65e8c99f8e8f8ec34a4cf4afa5829b24a2 [6/70] soc: qcom: pmic_glink: Introduce altmode support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230130/202301301227.GM39wlby-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/9aefcf65e8c99f8e8f8ec34a4cf4afa5829b24a2
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev sc8280xp-next-20230127
        git checkout 9aefcf65e8c99f8e8f8ec34a4cf4afa5829b24a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/soc/qcom/pmic_glink_altmode.c: In function 'pmic_glink_altmode_sc8180xp_notify':
>> drivers/soc/qcom/pmic_glink_altmode.c:234:16: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     234 |         port = FIELD_GET(SC8180X_PORT_MASK, notification);
         |                ^~~~~~~~~
         |                FOLL_GET
   drivers/soc/qcom/pmic_glink_altmode.c:222:13: warning: variable 'svid' set but not used [-Wunused-but-set-variable]
     222 |         u16 svid;
         |             ^~~~
   cc1: some warnings being treated as errors


vim +234 drivers/soc/qcom/pmic_glink_altmode.c

   212	
   213	static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmode,
   214						       const void *data, size_t len)
   215	{
   216		struct pmic_glink_altmode_port *alt_port;
   217		const struct usbc_sc8180x_notify *msg;
   218		u32 notification;
   219		u8 orientation;
   220		u8 hpd_state;
   221		u8 hpd_irq;
   222		u16 svid;
   223		u8 port;
   224		u8 mode;
   225		u8 mux;
   226	
   227		if (len != sizeof(*msg)) {
   228			dev_warn(altmode->dev, "invalid length of USBC_NOTIFY indication: %zd\n", len);
   229			return;
   230		}
   231	
   232		msg = data;
   233		notification = le32_to_cpu(msg->notification);
 > 234		port = FIELD_GET(SC8180X_PORT_MASK, notification);
   235		orientation = FIELD_GET(SC8180X_ORIENTATION_MASK, notification);
   236		mux = FIELD_GET(SC8180X_MUX_MASK, notification);
   237		mode = FIELD_GET(SC8180X_MODE_MASK, notification);
   238		hpd_state = FIELD_GET(SC8180X_HPD_STATE_MASK, notification);
   239		hpd_irq = FIELD_GET(SC8180X_HPD_IRQ_MASK, notification);
   240	
   241		svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
   242	
   243		if (!altmode->ports[port].altmode) {
   244			dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
   245			return;
   246		}
   247	
   248		alt_port = &altmode->ports[port];
   249		alt_port->orientation = pmic_glink_altmode_orientation(orientation);
   250		alt_port->svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
   251		alt_port->mode = mode;
   252		alt_port->hpd_state = hpd_state;
   253		alt_port->hpd_irq = hpd_irq;
   254		schedule_work(&alt_port->work);
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
