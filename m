Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017E22CBC0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637873; cv=none; b=nVvRWAMaw/DIHwbVfMfcdU1XUYTntiS34ab3X74jqcpaVh4VlQq+RVbh9PaluLBTzJEmGduGNfA4VEpAA+0Gf7APxVv1djU0TRcI4w6DTyhKYZkKePlgt8vR8G0D3HYZkthTJyS1NIxaALC73xFTOqqOFPOdOC0D8sMC4TLzpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637873; c=relaxed/simple;
	bh=HhOdplBIkA/ft5NKDjtV7tJqt/aQdDWqc4MiAsApGpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVVMITomfOhnZv2tfGfiIfBryc5J9XqJisx94GW9YGspz7jEZmDacy/J5WdQhXdODRfm/C+U+oHdIuN4nF4PuL7H/IsNHMcYz1PsxRZLNf6zWD2fZRIZGoWvoW10iTtNgw4qjZeHS7nBjiOyMSQxaI9XRYOr9ig/RCxuTilzZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFXxLuBy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFXxLuBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637872; x=1797173872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhOdplBIkA/ft5NKDjtV7tJqt/aQdDWqc4MiAsApGpY=;
  b=VFXxLuByrue6gqX4i9vrEAViQo7KtUdf985/QabrmKQ29M010XGtEdK8
   gWxxGF+l+W6cKYQ5y7wx7O7HmFcfQGYRb9Azm6w1sCLBYrxf8FgugpPlF
   zYnX4pAMCuqSCtbtW73e/NwiHb/7AxPy2Uz0rrC7Eq26EN8zBb+dSVviQ
   jukLAX8cRKkBwfTF9c/tEJ7a1bGbMT5H/bQmCA55qQvqwYQhgKPklrl5i
   gtNmlas+yCP3UkaQyNYS6pINFojKrB8DwtpwwiGvd2cu+BAgDVwanuF8P
   gZ2vgRM+VHXNLWlNG0OyrAeInxzUYXPBpzUux5uByvPPkTtydY8Ob5WS2
   w==;
X-CSE-ConnectionGUID: 6gs6ZjRDTvq/DvMXYBARDw==
X-CSE-MsgGUID: go0FZtSlRlOXPH6r/Hv+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78317176"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78317176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:57:51 -0800
X-CSE-ConnectionGUID: BNADU3Z7TduJ3uLuWCEAiw==
X-CSE-MsgGUID: lr1jKQvRTximtkxscgJuqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196400318"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Dec 2025 06:57:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUR47-000000007ld-0eLW;
	Sat, 13 Dec 2025 14:57:47 +0000
Date: Sat, 13 Dec 2025 22:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/virt/gunyah/rsc_mgr.c:106: warning: Excess struct member 'ret'
 description in 'gunyah_rm_message'
Message-ID: <202512132237.a5BtrngB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 4c11c572f413d00b06538a5b8c1ab6c5267232ea [18/18] FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132237.a5BtrngB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132237.a5BtrngB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132237.a5BtrngB-lkp@intel.com/

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
