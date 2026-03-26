Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801A3A16A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550334; cv=none; b=eBDWxmsdiy0wiiK3KbmTMcJFrAx9OIDiu2CfblSjYdb6apDjcnqi2bE+U7DnjF0XSK5uR+6CzzY4FV+UlBKdU5Ymxjvh/4+ZtVaa2Yqk22FBqrjsvlyhv36zToVsUJGh1+fLCDsQ2SWnYJmT0RLtIippk5YCfjAChgVnKAtamts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550334; c=relaxed/simple;
	bh=fmZAcbaT+/19hoVN7rvIYbpCCIDmxAQk0btDVLQeTxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A/Va75APM0WA2Lz2Z+L9y0VeP4BL8tqVcfHnPbfNbzieiEZmfQAWbdySdeACW1GM1NEk6IjPOJO3CvhWrTBkl816IO4KvS3qJOzR1205QLf4egadG+Q4bGLdNorKV2kD8PZdVLuSNiXE0IoqMylvxY8oOgsO+QFNXB9zLUXS3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcjeLAM2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcjeLAM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774550334; x=1806086334;
  h=date:from:to:cc:subject:message-id;
  bh=fmZAcbaT+/19hoVN7rvIYbpCCIDmxAQk0btDVLQeTxg=;
  b=DcjeLAM2uZ07dg37U+QpyOzARoQ6P4mYSdvQAIcDfSw0aaHZLt2ETPxR
   Jppt4ZYef8TAVVrT0fCe3YjcPTuaA0NZggMzD0SPcJwB+ahSU96JpRtMb
   9DlronNXbmNik3jgNBVgldXJTrWprBpHjToG46i9FvHhPrPTY6Ic6Xgv8
   UqdgYpuKXU9Tc1bYCQ8F0pevhwzxLlMokSSvDIinN6ZC2djd8OEswi1iy
   Oal2DWC0AeRfbYC79PwJmLy6Z9R65Z8pXeFv7ftOqYkna+JerFbjk7y23
   VzrEr+/fBPBd8I9HzZ5cSPdJXPOviF+lEdP3eQL2yHdiaxNcsm+zKK7V/
   A==;
X-CSE-ConnectionGUID: Lqw7Bj07RJ2LBIBQj9VXvA==
X-CSE-MsgGUID: V9/QoobbS9eddi8UZpnvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75505927"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75505927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:38:53 -0700
X-CSE-ConnectionGUID: tFDysXkwR2i/Y9cBkg+feA==
X-CSE-MsgGUID: E5khP6HWQ/6HSeiB2sxH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225345125"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2026 11:38:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5pbU-000000009Cr-3Mx7;
	Thu, 26 Mar 2026 18:38:48 +0000
Date: Fri, 27 Mar 2026 02:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/virt/gunyah/rsc_mgr.c:106: warning: Excess struct member 'ret'
 description in 'gunyah_rm_message'
Message-ID: <202603270230.vjo9GINA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d73a8ddf419e5ee819fff624cf35bfedd85b5609
commit: 4c11c572f413d00b06538a5b8c1ab6c5267232ea [1/1] FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270230.vjo9GINA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270230.vjo9GINA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270230.vjo9GINA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/rsc_mgr.c:106: warning: Excess struct member 'ret' description in 'gunyah_rm_message'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +106 drivers/virt/gunyah/rsc_mgr.c

    74	
    75	/**
    76	 * struct gunyah_rm_message - Represents a complete message from resource manager
    77	 * @payload: Combined payload of all the fragments (msg headers stripped off).
    78	 * @size: Size of the payload received so far.
    79	 * @msg_id: Message ID from the header.
    80	 * @type: RM_RPC_TYPE_REPLY or RM_RPC_TYPE_NOTIF.
    81	 * @num_fragments: total number of fragments expected to be received.
    82	 * @fragments_received: fragments received so far.
    83	 * @reply: Fields used for request/reply sequences
    84	 */
    85	struct gunyah_rm_message {
    86		void *payload;
    87		size_t size;
    88		u32 msg_id;
    89		u8 type;
    90	
    91		u8 num_fragments;
    92		u8 fragments_received;
    93	
    94		/**
    95		 * @ret: Linux return code, there was an error processing message
    96		 * @seq: Sequence ID for the main message.
    97		 * @rm_error: For request/reply sequences with standard replies
    98		 * @seq_done: Signals caller that the RM reply has been received
    99		 */
   100		struct {
   101			int ret;
   102			u16 seq;
   103			enum gunyah_rm_error rm_error;
   104			struct completion seq_done;
   105		} reply;
 > 106	};
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
