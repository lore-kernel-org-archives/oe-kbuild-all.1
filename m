Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17F6D1AB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261171; cv=none; b=jqApmN8wiB3jhtdPzHlnDz/E1SI1tSMHeWZW04BlOHcBRDH7gCPOKELqpQFGtrw6BsqbwEpJLdl7WG3rqxUo1tvI1DqfGNpPkgiLme12egeGX98DHG99N176DIouqqF2CyYJ5dtZk+pOp0y7/Z1DTauQIdyO2IhEqRbyCrMS8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261171; c=relaxed/simple;
	bh=9uc+F3XPWJTwYNhLlaOAOeLp2BODwwBuBGNjtT6YJb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMjsLKps/WGdYW27npqEb2xoVlaIiK3PMhxInxU7SuGXXE8Uw/sBaoQJlaLqL01M0biFc/p6P6U7v1+DSoy/4SENsjdZuwoXFKEjL79XImJDKIC9VXtPzCAV4sFolI86k03Jy0mSqgtHVeLRutA47a+fjQi+EmOFo54WtQZMFKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCV53RzK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCV53RzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712261169; x=1743797169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9uc+F3XPWJTwYNhLlaOAOeLp2BODwwBuBGNjtT6YJb8=;
  b=HCV53RzKYI+2K9KT16a3JRtVx7MWoiXEJV1s1Rbz5YfU/3WzETbeO28Q
   rmTPH24k71v9cGC5C4TDkoqd/76rbccOrqsLKVry8INV45twdeb/C73PH
   6CTWFSgR/W/Y9U2Wfda933QRWSGI1EkQF35H6BjefVTyxb7WwCB1rML/M
   9DyHTaAAMwbtPXkqKtP5AaZ7hL94GnPVgm3aX7BgPBKotkhLpD8AfQ2C2
   11QXyizkem45FjcGpWG2nKTTOLjTMjC9+rmpkNhYS1oASvtKdUNgjN2Zc
   oLMjEaFgdBvEDUJ6Nnh1IrrdlXjEhH/LKMwdMhLjr6KHPU7jOeyzwEkQ9
   g==;
X-CSE-ConnectionGUID: D0wEkhrcTLKzF8KbTMEZMw==
X-CSE-MsgGUID: 1jxBtmPkTbmc/2E9CnUVZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="30039559"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="30039559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 13:06:09 -0700
X-CSE-ConnectionGUID: YaUXfASCQGiOWVHajBKi0g==
X-CSE-MsgGUID: cAksSFqTSJ+UDUpNNtfJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23601683"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2024 13:06:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsTLZ-0001TA-24;
	Thu, 04 Apr 2024 20:06:05 +0000
Date: Fri, 5 Apr 2024 04:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest 6/8]
 drivers/virt/coco/tdx-guest/tdx-guest.c:89: warning: Function parameter or
 struct member 'hdr' not described in 'att_service_req'
Message-ID: <202404050410.Al3W0Wft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   e0c511fe981d8b05dd0a945acc1e8d7f4fba3a59
commit: 2203fdee94ff07f81261eb34978778fdb953e15c [6/8] virt: coco: tdx-guest: Add service quote support
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240405/202404050410.Al3W0Wft-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050410.Al3W0Wft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050410.Al3W0Wft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tdx-guest/tdx-guest.c:89: warning: Function parameter or struct member 'hdr' not described in 'att_service_req'


vim +89 drivers/virt/coco/tdx-guest/tdx-guest.c

    66	
    67	/**
    68	 * struct att_service_req - Attestation Service command buffer
    69	 * hdr: Command buffer header.
    70	 * @version: Command version (default is 0).
    71	 * @cmd: Command ID.
    72	 * @rsvd: Reserved for future use.
    73	 * @len: Length of the report data.
    74	 * @data: Report data used in Quote generation
    75	 */
    76	struct att_service_req
    77	{
    78		/* Command buffer header */
    79		struct tdx_service_req_hdr hdr;
    80	
    81		/* Command data */
    82		u8 version;
    83		u8 cmd;
    84		u16 rsvd;
    85	
    86		/* Report data */
    87		u32 len;
    88		u8 data[];
  > 89	} __packed;
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
