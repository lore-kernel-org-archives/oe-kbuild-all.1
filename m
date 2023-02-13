Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9707EA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676256004; x=1707792004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQfSu64slhzkT4iXBDal1GAC0CiEPy75fDX18XpcE/E=;
  b=QW8v/GaqkovkaoCnfNeeukWrig5eIHW5rZXj5fAyVg42PN2VrEXG+e48
   l/306wpoiuh5vi6ZilWyNRSutazWZHSgpOQd674cSs8JWnHhMQRLRdA8T
   giWxwTE4q6gG2Kq73UyD8AlTNx0fMEXLLlDA0GwKXLOpkvNVUmQqIvfcm
   +7HRXhEzRQQxMju1+vPoYD+/IXfXpNlTdNHquTuv2ErutQIp8zkRQf6Gi
   3GEhpuz45qiuX5m3alz68FLhVx9o/Q58V4PdAI6sJIJpX4qxLrJruQqVY
   yIIRUGf9yXVFRANHXtsfkKgWqRjxmnHtXXEG34lrf7AA9rQw/UAT+HqGH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332099028"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="332099028"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 18:40:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="662027842"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="662027842"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 18:40:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pROl6-0007Un-2p;
	Mon, 13 Feb 2023 02:40:00 +0000
Date: Mon, 13 Feb 2023 10:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 10/11]
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:217:6: error: no previous prototype
 for function 'intel_pxp_tee_end_one_fw_session'
Message-ID: <202302131005.utqF5Yjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   7fdb454c609d08b40799b851e082110bcac615ad
commit: abd7d8e9a3be86fadf24b543e7bb6662399add0f [10/11] CHROMIUM: drm/i915/pxp: Mutisession version for Invalidate all PXP fw sessions during teardown
config: x86_64-randconfig-a001-20230213 (https://download.01.org/0day-ci/archive/20230213/202302131005.utqF5Yjs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout abd7d8e9a3be86fadf24b543e7bb6662399add0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131005.utqF5Yjs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:217:6: error: no previous prototype for function 'intel_pxp_tee_end_one_fw_session' [-Werror,-Wmissing-prototypes]
   void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
        ^
   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
   ^
   static 
   1 error generated.


vim +/intel_pxp_tee_end_one_fw_session +217 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c

   216	
 > 217	void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
   218	{
   219		struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
   220		struct pxp_inv_stream_key_in msg_in = {0};
   221		struct pxp_inv_stream_key_out msg_out = {0};
   222		int ret, trials = 0;
   223	
   224	try_again:
   225		memset(&msg_in, 0, sizeof(msg_in));
   226		memset(&msg_out, 0, sizeof(msg_out));
   227		msg_in.header.api_version = PXP_TEE_APIVER;
   228		msg_in.header.command_id = PXP_TEE_INVALIDATE_STREAM_KEY;
   229		msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
   230	
   231		msg_in.header.extdata = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
   232		msg_in.header.extdata |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
   233		msg_in.header.extdata |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
   234	
   235		ret = intel_pxp_tee_io_message(pxp,
   236					       &msg_in, sizeof(msg_in),
   237					       &msg_out, sizeof(msg_out),
   238					       NULL);
   239	
   240		/* Cleanup coherency between GT and Firmware is critical, so try again if it fails */
   241		if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
   242			goto try_again;
   243	
   244		if (ret)
   245			drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
   246				session_id, ret);
   247		else if (msg_out.header.status != 0x0 && is_alive)
   248			drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
   249				 session_id, msg_out.header.status);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
