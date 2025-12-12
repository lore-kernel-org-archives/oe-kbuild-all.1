Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506C041C71
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765508700; cv=none; b=UpihouImEkGGl44n0y+fWwtsmEOrKtScQCDxNaAvO56JhLyvoQNrCtMEMAoZwo9y9DALyIz4YiIAb/H3oCB+1kmqVVxnz4d5y9Mt86/LEC418WZcGWqUD7KDBdJi2VlMChai6x4bmSqo43Rtl8NgHnK4OJR0TgCdC5R6VDm2bMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765508700; c=relaxed/simple;
	bh=vqCWzLJLVirfSs94ax/UoTD0J2vkct+opucvYzzotm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzAN8T/7K+OzMpRL7j9Wsp9tZ7sT72c3vZunpQ2mCclnVd2PGT8bAKb8vI7EBCx5fc4tilN1NkDkSfBPy8dahASTXE/XpVbQ1333TONbGGdwng56MT2CXSadSkC53N4U2XtE8FPvgv6a/EM5gX99d8LsE4+5gFIvOMxXfqWjSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auNVw4Hj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auNVw4Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765508697; x=1797044697;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vqCWzLJLVirfSs94ax/UoTD0J2vkct+opucvYzzotm0=;
  b=auNVw4HjcBLnrLEygLFBuDWZb2Vp0n5QDrbrur3B6iPDxW/14gu6CY/J
   aSezP6lXiVpk90a4fQQgEHLemVm3G3Z0FkTGFfGLGeOVK2co8hi31J9TH
   AywfPfs3WmHsV5gsP+f332pjRdIESUAMu82CyE1piNZo0ISQ1ccbXYMYG
   3DV34pbpHaqWTgbyvl4sjrC/OovgbcuSHe/2wwFwAOv+D7pttuIBHMXH/
   AcjhYAuiIpXCOnkEDozThIBi47CZkCx26uQNieHfLwK1JCcsA3D8dj7AY
   ImhwUJcuAxscmxzE7Fl3KBr4BJEb75EXKz40NC7eJrdTbMxEWKrvQxBuv
   w==;
X-CSE-ConnectionGUID: guh3sXwaRSWWHmarpzONJA==
X-CSE-MsgGUID: r0yiv5xZRGOoRs51jw8sGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84908215"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="84908215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:04:56 -0800
X-CSE-ConnectionGUID: TLJnnZEiR1mPcscmc+EyHQ==
X-CSE-MsgGUID: fiyzsaJRSue6f4dSHobbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197233628"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 19:04:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtSg-000000001HQ-0HZy;
	Fri, 12 Dec 2025 03:04:54 +0000
Date: Fri, 12 Dec 2025 04:04:17 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhanglei <zhanglei48@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 Documentation/scsi/hisi_raid.rst:15: WARNING: Title underline too short.
Message-ID: <202512120447.PMljStGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: fd8c1a2ddc2f28838e4a6a8be6a7d6dc95a678d3 [3534/3534] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512120447.PMljStGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120447.PMljStGs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   KASLR for Freescale BookE32
   ------------------------- [docutils]
>> Documentation/scsi/hisi_raid.rst:15: WARNING: Title underline too short.
--
   hisi_raid host attributes
   ------------------------ [docutils]
   Documentation/scsi/hisi_raid.rst:34: ERROR: Unexpected indentation. [docutils]
>> Documentation/scsi/hisi_raid.rst:42: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/scsi/hisi_raid.rst:54: WARNING: Title underline too short.


vim +15 Documentation/scsi/hisi_raid.rst

    13	
    14	hisi_raid specific entries in /sys
  > 15	=================================
    16	
    17	hisi_raid host attributes
    18	------------------------
    19	  - /sys/class/scsi_host/host*/csts_pp
    20	  - /sys/class/scsi_host/host*/csts_shst
    21	  - /sys/class/scsi_host/host*/csts_cfs
    22	  - /sys/class/scsi_host/host*/csts_rdy
    23	  - /sys/class/scsi_host/host*/fw_version
    24	
    25	  The host csts_pp attribute is a read only attribute. This attribute
    26	  indicates whether the controller is processing commands. If this attribute
    27	  is set to ‘1’, then the controller is processing commands normally. If
    28	  this attribute is cleared to ‘0’, then the controller has temporarily stopped
    29	  processing commands in order to handle an event (e.g., firmware activation).
    30	
    31	  The host csts_shst attribute is a read only attribute. This attribute
    32	  indicates status of shutdown processing.The shutdown status values are defined
    33	  as:
  > 34	        ======     ==============================
    35	        Value      Definition
    36	        ======     ==============================
    37	        00b        Normal operation
    38	        01b        Shutdown processing occurring
    39	        10b        Shutdown processing complete
    40	        11b        Reserved
    41	        ======     ==============================
  > 42	  The host csts_cfs attribute is a read only attribute. This attribute is set to
    43	  ’1’ when a fatal controller error occurred that could not be communicated in the
    44	  appropriate Completion Queue. This bit is cleared to ‘0’ when a fatal controller
    45	  error has not occurred.
    46	
    47	  The host csts_rdy attribute is a read only attribute. This attribute is set to
    48	  ‘1’ when the controller is ready to process submission queue entries.
    49	
    50	  The fw_version attribute is read-only and will return the driver version and the
    51	  controller firmware version.
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
