Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0982ED3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 03:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676948862; x=1708484862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZGMuqzA5IAPPsQGI2LT3juBgdlHdt4lYTI8fkBA1FYI=;
  b=dh9zF47gmEYLiT2znTdo8xkN7+yFoUH9diiZkW6gI5UxeZZWmbTk39gF
   koJQRe+TroYc/IbMzy6S1S+Ie3O8JYzAa0W1unCy2JKRSjYkKn9cWh+yV
   98gu4qP6lJmS9PJizlD4YkbOBitTTutEyux0QtfiaOS133K+VfXuTbHbA
   tDXUoQo9p7MTMRUCiuGFjwpWeqyvW4XzGs8s/8l5DPtWJov0Y2oSBMUn8
   zPMGATREW/JIAEZEYu7uOklgvp/CsFzsbiLI0e8W9hYaRc95RZQ2DzrKO
   AHBMRJZphnQyVezbpdvY1JCS4gQTJBb1eAN18GyUnXfDPFUZ5j5db3R44
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332536998"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="332536998"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 19:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="917031060"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="917031060"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Feb 2023 19:07:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUJ0G-000EOj-11;
	Tue, 21 Feb 2023 03:07:40 +0000
Date: Tue, 21 Feb 2023 11:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 56/65]
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:212:6: error: no previous prototype
 for 'intel_pxp_tee_end_one_fw_session'
Message-ID: <202302211015.j2tqOqa2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   f5a64da05bfe8e8be64fe24c5590bc1f8eada156
commit: 5b63195fa9e6028cdef57d18f19853bad0d33d03 [56/65] CHROMIUM: drm/i915/pxp: Mutisession version for Invalidate all PXP fw sessions during teardown
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302211015.j2tqOqa2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 5b63195fa9e6028cdef57d18f19853bad0d33d03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211015.j2tqOqa2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:212:6: error: no previous prototype for 'intel_pxp_tee_end_one_fw_session' [-Werror=missing-prototypes]
     212 | void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_pxp_tee_end_one_fw_session +212 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c

   211	
 > 212	void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
   213	{
   214		struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
   215		struct pxp_inv_stream_key_in msg_in = {0};
   216		struct pxp_inv_stream_key_out msg_out = {0};
   217		int ret, trials = 0;
   218	
   219	try_again:
   220		memset(&msg_in, 0, sizeof(msg_in));
   221		memset(&msg_out, 0, sizeof(msg_out));
   222		msg_in.header.api_version = PXP_TEE_APIVER;
   223		msg_in.header.command_id = PXP_TEE_INVALIDATE_STREAM_KEY;
   224		msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
   225	
   226		msg_in.header.extdata = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
   227		msg_in.header.extdata |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
   228		msg_in.header.extdata |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
   229	
   230		ret = intel_pxp_tee_io_message(pxp,
   231					       &msg_in, sizeof(msg_in),
   232					       &msg_out, sizeof(msg_out),
   233					       NULL);
   234	
   235		/* Cleanup coherency between GT and Firmware is critical, so try again if it fails */
   236		if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
   237			goto try_again;
   238	
   239		if (ret)
   240			drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
   241				session_id, ret);
   242		else if (msg_out.header.status != 0x0 && is_alive)
   243			drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
   244				 session_id, msg_out.header.status);
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
