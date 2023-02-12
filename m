Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B40A47
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676191723; x=1707727723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+xuMVX6qXSjj4eoBw3iBbn079ODqUnnzCEVxhbSoQw=;
  b=De8/5rO+6H5L9f+eB2x1RlMhVpauRX43kIMXa3Cfw8W3CH/xtVGQU205
   E8ABHDBqPjIjNNZRlFScsEpftwkXL5TLdn5Nq3NTINVYSiAxsrJrKkLWV
   fqyZlpJC5AVTeEuJSlokTmUNeV11F6J7FxNmEtbSZcpPIiJoBtrs25Ezq
   mNJ2IIX7wuI+zwvHZpSvGiOD5uuiYEvZl+ifBugOEj+QnnHpH420PYCBA
   1+H6Nwm38G7CUDzJsLt0CUKXqyKXIU0WRGEogNpFYceTxw3Nq6broBpjB
   txNk968zPP6IvRs1bYtODm/xRxdrN2uinKxel6YGiQUszZxy+8IiuIYae
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="311060420"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311060420"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 00:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811268759"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811268759"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 00:48:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR82K-0007A5-2E;
	Sun, 12 Feb 2023 08:48:40 +0000
Date: Sun, 12 Feb 2023 16:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 10/10]
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:217:6: error: no previous prototype
 for 'intel_pxp_tee_end_one_fw_session'
Message-ID: <202302121632.1rJoPJPM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   abd7d8e9a3be86fadf24b543e7bb6662399add0f
commit: abd7d8e9a3be86fadf24b543e7bb6662399add0f [10/10] CHROMIUM: drm/i915/pxp: Mutisession version for Invalidate all PXP fw sessions during teardown
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230212/202302121632.1rJoPJPM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout abd7d8e9a3be86fadf24b543e7bb6662399add0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121632.1rJoPJPM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:217:6: error: no previous prototype for 'intel_pxp_tee_end_one_fw_session' [-Werror=missing-prototypes]
     217 | void intel_pxp_tee_end_one_fw_session(struct intel_pxp *pxp, u32 session_id, bool is_alive)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
