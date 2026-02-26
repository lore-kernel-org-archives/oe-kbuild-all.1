Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006215E97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772132976; cv=none; b=ende/k/r9GfqAgKmaf+p4q0fLlY0AgEb4+h5zIGIzOxk9m0cE1suM4/rUV+QHjcGNkbkHHTaLKFJALBwRMWtI0tsyWHXhGx1EckY/w0GFCphtTQZ49cyYAmKw79sS3rpofHiHRBZHPGgxDU3LrAq3eJPC8IKYUJ9G2VciXla51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772132976; c=relaxed/simple;
	bh=waTxAv7QSzIF769INnxnT6JVoYsn7CECocI09PclOOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KWlZHQwbX5X6wnFTzdDeIEduEqhikQyRwgr7mq+onTGLr84u2IJ48DyR3a4i9DcM51tEQ+6Ou2dQ585Uut9HpmFxTAzsJqg4wUe/Ccg1kdka7IxJwflIzUiibVIZ8i0EHKOa+sd0jxAoYieI0XtZYRDfB9UbIA3NjlL1/mKhsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQYuVgCO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQYuVgCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772132975; x=1803668975;
  h=date:from:to:cc:subject:message-id;
  bh=waTxAv7QSzIF769INnxnT6JVoYsn7CECocI09PclOOQ=;
  b=KQYuVgCOMa0lN0cnnnIOabaZgXavOH2JVOLTRH3YadXMURhfnfaGx+/L
   o21Kn19baOpNffzFfmum5HT6JUWTnWGjECDugbk0uhW+dpucHrk5E4OFE
   Tzwsh5VQuZ7jSmPCqIt6QTjRtMHJIzXK2TeiuDK0FNyMdYxKVxtV7Vecc
   vsjESJLjm1idLzElptVUnnXKHlSksL3qsjvwtGRXR0ROv2htABAJlL8cH
   Kpvs9B0C/X+xUTEh9TZ7p7k/vYcTogO+cSCRhn5JaHmtK1QtrZqAitFqq
   4cE+Z3wz2wilDNlGYi3EM9LElpshe06G0Paa0B/RTnf+t+EXgya/Iop5B
   w==;
X-CSE-ConnectionGUID: 2ySLYwDjSRKtRALc/hwU8w==
X-CSE-MsgGUID: imFNg5IGQ9ShnwVflz5wqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73251227"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73251227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:09:34 -0800
X-CSE-ConnectionGUID: G3icROpRSwGIVCOCdQgChA==
X-CSE-MsgGUID: 1z2C6VYDRCaalvJujyQZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221169119"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2026 11:09:33 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgjq-000000009n7-1oYK;
	Thu, 26 Feb 2026 19:09:30 +0000
Date: Fri, 27 Feb 2026 03:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 1426/2633]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:434:9: sparse:
 sparse: static assertion failed: "DMUB command size mismatch"
Message-ID: <202602270250.nso29Dzu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roman,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d6661873f6b54c75195780a40d66bad3d482d8f
commit: 083a1638330951dd57be201fc53a4b86e3115960 [1426/2633] drm/amd/display: Enable dcn42 DMUB
config: arc-randconfig-r122-20260225 (https://download.01.org/0day-ci/archive/20260227/202602270250.nso29Dzu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270250.nso29Dzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270250.nso29Dzu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:434:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c:510:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"

vim +434 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn42.c

7c4757c20e9f1b Roman Li 2026-02-02  427  
7c4757c20e9f1b Roman Li 2026-02-02  428  void dmub_dcn42_send_reg_inbox0_cmd_msg(struct dmub_srv *dmub,
7c4757c20e9f1b Roman Li 2026-02-02  429  		union dmub_rb_cmd *cmd)
7c4757c20e9f1b Roman Li 2026-02-02  430  {
7c4757c20e9f1b Roman Li 2026-02-02  431  	uint32_t *dwords = (uint32_t *)cmd;
7c4757c20e9f1b Roman Li 2026-02-02  432  	int32_t payload_size_bytes = cmd->cmd_common.header.payload_bytes;
7c4757c20e9f1b Roman Li 2026-02-02  433  	uint32_t msg_index;
7c4757c20e9f1b Roman Li 2026-02-02 @434  	static_assert(sizeof(*cmd) == 64, "DMUB command size mismatch");
7c4757c20e9f1b Roman Li 2026-02-02  435  
7c4757c20e9f1b Roman Li 2026-02-02  436  	/* read remaining data based on payload size */
7c4757c20e9f1b Roman Li 2026-02-02  437  	for (msg_index = 0; msg_index < 15; msg_index++) {
7c4757c20e9f1b Roman Li 2026-02-02  438  		if (payload_size_bytes <= msg_index * 4) {
7c4757c20e9f1b Roman Li 2026-02-02  439  			break;
7c4757c20e9f1b Roman Li 2026-02-02  440  		}
7c4757c20e9f1b Roman Li 2026-02-02  441  
7c4757c20e9f1b Roman Li 2026-02-02  442  		switch (msg_index) {
7c4757c20e9f1b Roman Li 2026-02-02  443  		case 0:
7c4757c20e9f1b Roman Li 2026-02-02  444  			REG_WRITE(DMCUB_REG_INBOX0_MSG0, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  445  			break;
7c4757c20e9f1b Roman Li 2026-02-02  446  		case 1:
7c4757c20e9f1b Roman Li 2026-02-02  447  			REG_WRITE(DMCUB_REG_INBOX0_MSG1, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  448  			break;
7c4757c20e9f1b Roman Li 2026-02-02  449  		case 2:
7c4757c20e9f1b Roman Li 2026-02-02  450  			REG_WRITE(DMCUB_REG_INBOX0_MSG2, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  451  			break;
7c4757c20e9f1b Roman Li 2026-02-02  452  		case 3:
7c4757c20e9f1b Roman Li 2026-02-02  453  			REG_WRITE(DMCUB_REG_INBOX0_MSG3, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  454  			break;
7c4757c20e9f1b Roman Li 2026-02-02  455  		case 4:
7c4757c20e9f1b Roman Li 2026-02-02  456  			REG_WRITE(DMCUB_REG_INBOX0_MSG4, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  457  			break;
7c4757c20e9f1b Roman Li 2026-02-02  458  		case 5:
7c4757c20e9f1b Roman Li 2026-02-02  459  			REG_WRITE(DMCUB_REG_INBOX0_MSG5, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  460  			break;
7c4757c20e9f1b Roman Li 2026-02-02  461  		case 6:
7c4757c20e9f1b Roman Li 2026-02-02  462  			REG_WRITE(DMCUB_REG_INBOX0_MSG6, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  463  			break;
7c4757c20e9f1b Roman Li 2026-02-02  464  		case 7:
7c4757c20e9f1b Roman Li 2026-02-02  465  			REG_WRITE(DMCUB_REG_INBOX0_MSG7, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  466  			break;
7c4757c20e9f1b Roman Li 2026-02-02  467  		case 8:
7c4757c20e9f1b Roman Li 2026-02-02  468  			REG_WRITE(DMCUB_REG_INBOX0_MSG8, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  469  			break;
7c4757c20e9f1b Roman Li 2026-02-02  470  		case 9:
7c4757c20e9f1b Roman Li 2026-02-02  471  			REG_WRITE(DMCUB_REG_INBOX0_MSG9, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  472  			break;
7c4757c20e9f1b Roman Li 2026-02-02  473  		case 10:
7c4757c20e9f1b Roman Li 2026-02-02  474  			REG_WRITE(DMCUB_REG_INBOX0_MSG10, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  475  			break;
7c4757c20e9f1b Roman Li 2026-02-02  476  		case 11:
7c4757c20e9f1b Roman Li 2026-02-02  477  			REG_WRITE(DMCUB_REG_INBOX0_MSG11, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  478  			break;
7c4757c20e9f1b Roman Li 2026-02-02  479  		case 12:
7c4757c20e9f1b Roman Li 2026-02-02  480  			REG_WRITE(DMCUB_REG_INBOX0_MSG12, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  481  			break;
7c4757c20e9f1b Roman Li 2026-02-02  482  		case 13:
7c4757c20e9f1b Roman Li 2026-02-02  483  			REG_WRITE(DMCUB_REG_INBOX0_MSG13, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  484  			break;
7c4757c20e9f1b Roman Li 2026-02-02  485  		case 14:
7c4757c20e9f1b Roman Li 2026-02-02  486  			REG_WRITE(DMCUB_REG_INBOX0_MSG14, dwords[msg_index + 1]);
7c4757c20e9f1b Roman Li 2026-02-02  487  			break;
7c4757c20e9f1b Roman Li 2026-02-02  488  		}
7c4757c20e9f1b Roman Li 2026-02-02  489  	}
7c4757c20e9f1b Roman Li 2026-02-02  490  
7c4757c20e9f1b Roman Li 2026-02-02  491  	/* writing to INBOX RDY register will trigger DMUB REG INBOX0 RDY
7c4757c20e9f1b Roman Li 2026-02-02  492  	 * interrupt.
7c4757c20e9f1b Roman Li 2026-02-02  493  	 */
7c4757c20e9f1b Roman Li 2026-02-02  494  	REG_WRITE(DMCUB_REG_INBOX0_RDY, dwords[0]);
7c4757c20e9f1b Roman Li 2026-02-02  495  }
7c4757c20e9f1b Roman Li 2026-02-02  496  

:::::: The code at line 434 was first introduced by commit
:::::: 7c4757c20e9f1b74a42a23ae450610c140e1224f drm/amd/display: Add DMUB support for dcn42

:::::: TO: Roman Li <Roman.Li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
