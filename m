Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A48C09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680199810; x=1711735810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSu2jHvSM1exq/wgtpv4Dq3HuBMeiETTN8t+UC8bBQU=;
  b=IXD+56Y71I6P9NI4v7bM9Qj+VH+iykhXCJIahMj12tabs2fkMDc7Y0S9
   vpaKsOe569b7n7H2wpCvifgWhMcBSTZjFq7LZjq7LR9zqdZIX/+5bvTzc
   98/2u8IgNAkju3Dl94QirdsvtWbax1UmCfolugewJ882IPdiUyKHGlscr
   G1FOSBVMOOTCyKifaTxVh98HYfILUWPUSkH4Pp4eF3xlzTuSJlmUA7McK
   f82fAt4oqOLTpEA9Pdp33keQnqPt32YxrzG0A6uXIU5e7NBUBNkzEmvZu
   A9llUoo7/ZWKfQYd6/IuTp5O+loWDHpHh+H9NCXBVcDixwaO3x4hAVPG6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342893416"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="342893416"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 11:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828414987"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="828414987"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2023 11:10:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phwip-000L4W-2o;
	Thu, 30 Mar 2023 18:10:03 +0000
Date: Fri, 31 Mar 2023 02:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/17]
 drivers/media/platform/camx/cam_req_mgr/cam_req_mgr_util.c:254:7: warning:
 no previous prototype for 'cam_get_priv'
Message-ID: <202303310240.139komEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   11c541feae11f4306338a0a209a2b83c0d27755e
commit: ab7279033763b9f28c8386f218c2dc53adc9a80d [16/17] CHROMIUM: msm: camera: core: validation of session/device/link handle
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230331/202303310240.139komEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout ab7279033763b9f28c8386f218c2dc53adc9a80d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/camx/cam_req_mgr/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310240.139komEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/camx/cam_req_mgr/cam_req_mgr_util.c:254:7: warning: no previous prototype for 'cam_get_priv' [-Wmissing-prototypes]
     254 | void *cam_get_priv(int32_t dev_hdl, int handle_type)
         |       ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_VIDEO
   Depends on [n]: ACPI [=y] && X86 && BACKLIGHT_CLASS_DEVICE [=y] && INPUT [=y] && (ACPI_WMI [=n] || !X86)
   Selected by [y]:
   - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n]) && ACPI [=y]
   - DRM_AMDGPU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && ACPI [=y]


vim +/cam_get_priv +254 drivers/media/platform/camx/cam_req_mgr/cam_req_mgr_util.c

   253	
 > 254	void *cam_get_priv(int32_t dev_hdl, int handle_type)
   255	{
   256		int idx;
   257		int type;
   258		void *priv;
   259	
   260		spin_lock_bh(&hdl_tbl_lock);
   261		if (!hdl_tbl) {
   262			CAM_ERR_RATE_LIMIT(CAM_CRM, "Hdl tbl is NULL");
   263			goto device_priv_fail;
   264		}
   265	
   266		idx = CAM_REQ_MGR_GET_HDL_IDX(dev_hdl);
   267		if (idx >= CAM_REQ_MGR_MAX_HANDLES) {
   268			CAM_ERR_RATE_LIMIT(CAM_CRM, "Invalid idx");
   269			goto device_priv_fail;
   270		}
   271	
   272		if (hdl_tbl->hdl[idx].state != HDL_ACTIVE) {
   273			CAM_ERR_RATE_LIMIT(CAM_CRM, "Invalid state");
   274			goto device_priv_fail;
   275		}
   276	
   277		type = CAM_REQ_MGR_GET_HDL_TYPE(dev_hdl);
   278		if (type != handle_type) {
   279			CAM_ERR_RATE_LIMIT(CAM_CRM, "Invalid type");
   280			goto device_priv_fail;
   281		}
   282	
   283		if (hdl_tbl->hdl[idx].hdl_value != dev_hdl) {
   284			CAM_ERR_RATE_LIMIT(CAM_CRM, "Invalid hdl");
   285			goto device_priv_fail;
   286		}
   287	
   288		priv = hdl_tbl->hdl[idx].priv;
   289		spin_unlock_bh(&hdl_tbl_lock);
   290	
   291		return priv;
   292	
   293	device_priv_fail:
   294		spin_unlock_bh(&hdl_tbl_lock);
   295		return NULL;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
