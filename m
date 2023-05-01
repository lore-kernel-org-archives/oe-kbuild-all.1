Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B333E6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682968996; x=1714504996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5tYuDz4kkaMu+KA03E+HlGcXYll/odsRHgiRK6oeaw=;
  b=mggk0AJXkPNO+H84cvAe9LjG0m4S07u2oiRGZY6w7g4B126B2Mm0W+no
   DdTM+YMp+6A5goeSjmz3erF9qyNJsyQdvKTJ0j3IDRjijp+F/76q3+nrX
   1fGLXdDMmXCXN4xWmu3ro/arOHbdJDSm7eV2D+asAfWbI/I/a+mqjFcYU
   ZxHT1Cmsr0QVGhjBJEmSGsFHCyXOYd1zWUUquK0MLFRZ1Ko0fHMbJolNP
   B8jmO3UcGmayaK8t0808r1Ej6giGjfHxGoT0uHp7bYGlgpc9pC1vxpQCy
   VjIgwuHVo82o2ZEjw9aVDJNluxelauBr+E366JyQOI5AuNnT/pp5xNAkx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="350296417"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="350296417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 12:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="942155710"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="942155710"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 12:23:12 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptZ79-0000av-17;
	Mon, 01 May 2023 19:23:11 +0000
Date: Tue, 2 May 2023 03:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 31/34]
 drivers/media/platform/camx/cam_req_mgr/cam_req_mgr_util.c:254:7: warning:
 no previous prototype for 'cam_get_priv'
Message-ID: <202305020347.0HdZYBx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   df1763b3ed579f5520f5fc1b2808b0e3d77b0e01
commit: b89b98635fbdfa2e5dc8de747b44f8fb30fa248e [31/34] CHROMIUM: msm: camera: core: validation of session/device/link handle
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230502/202305020347.0HdZYBx5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout b89b98635fbdfa2e5dc8de747b44f8fb30fa248e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/camx/cam_req_mgr/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020347.0HdZYBx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/camx/cam_req_mgr/cam_req_mgr_util.c:254:7: warning: no previous prototype for 'cam_get_priv' [-Wmissing-prototypes]
     254 | void *cam_get_priv(int32_t dev_hdl, int handle_type)
         |       ^~~~~~~~~~~~


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
