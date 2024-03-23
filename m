Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35F7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 00:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711154447; cv=none; b=mVdOEs+9q6kRBAX0JY+tMnl/REko/rt5DACewm2wLG2fhfrn3q7C7tNBfjOFalNKvcen1XDK4Gaw1XG/I2Ca6ux18pgf4bmZV1X5/l/SkOFWg4r6LrpEVbAbcvfvsJ3nqRRnjCSIR3gGLgELwvPXsGYwsViOX6phuHtveT5NvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711154447; c=relaxed/simple;
	bh=TMLMeIR2wFKEbZXyxM3Yr7f7JSgBWdqwLpI7pPNqE3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeNdYyMobJGO4TxpBC7TLJn9f6RggZUzH+uEWHSaYfHpLUCPc2BpPXZ2d0QDsxnfL0MBlrRSvLlcHktKSbutJ//puWD3vkukhH9VCZ0ki4/haVKghctFn0cjceQt/Ad11vsDKe/pVh0A/scp/h54W6krxyJUJmWL3bLo6Nm177c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByZi4Kk3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByZi4Kk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711154444; x=1742690444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMLMeIR2wFKEbZXyxM3Yr7f7JSgBWdqwLpI7pPNqE3I=;
  b=ByZi4Kk3QEFC7BGfiRxoYU3ix5Fi3H03IOfsI2Q0Ufd6cXSAKTkcPqXP
   HaANjep5wAe9DVK+S8OH7nDYWhoaF1rFDMdHPwmaSNwqc4wav+s8btCxx
   QRs/o/Uf7jUWXlD2oZLt71ZQkP4mZyquwrRx2B4om15w3aU6VtYB/WMN9
   G6Pi0v25hGbEt1qym55AoCwiHiM6ujoseumCjJHDStfIv89zCYqf4ROfJ
   IYSeJN2Mtqf1wGxt1hIGy1WtPbCzCdpCwxrMzK4XAxr9ExMCpO+nHCwVX
   yDjUznwuFNlDhfHhIRxd39QRiXF2nH8jNC8+dZKQOTmeW0S1LVOvoa7M/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="23676183"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="23676183"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 17:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="15103185"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Mar 2024 17:40:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnpRA-000KkN-1k;
	Sat, 23 Mar 2024 00:40:40 +0000
Date: Sat, 23 Mar 2024 08:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3947/6857]
 drivers/crypto/montage/tsse/tsse_ipc.c:18: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202403230839.j7ODqH5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1b4212c630731d88b07d5b6e28ecaff1a76d3839
commit: 7795623241fe9eb57352a09b27d06b5d4ff07071 [3947/6857] add firmware update function for Mont-TSSE
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240323/202403230839.j7ODqH5Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230839.j7ODqH5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230839.j7ODqH5Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/montage/tsse/tsse_ipc.c:18: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Create ipc_msg and read message from BAR.
   drivers/crypto/montage/tsse/tsse_ipc.c:83: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable main2host interrupt, cleanup interrupt set value in host2main and main2host.
--
>> drivers/crypto/montage/tsse/tsse_fw_service.c:55: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get version information from firmware
   drivers/crypto/montage/tsse/tsse_fw_service.c:106: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Firmware service to handle IPC message from mainCPU.
   drivers/crypto/montage/tsse/tsse_fw_service.c:155: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Load firmware from /lib/firmware
--
>> drivers/crypto/montage/tsse/tsse_dev_drv.c:118: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function will be called when user writes string to /sys/bus/pci/devices/.../tsse_image_load.


vim +18 drivers/crypto/montage/tsse/tsse_ipc.c

    16	
    17	/**
  > 18	 * Create ipc_msg and read message from BAR.
    19	 * Return the pointer to ipc_msg, the caller is responsible for free it.
    20	*/
    21	static struct ipc_msg *get_msginf(void __iomem *d2h)
    22	{
    23		uint32_t u_len = 0;
    24		struct ipc_msg *msg = NULL;
    25	
    26		uint8_t *device_msg_data = NULL;
    27		struct ipc_header *ipc_info = (struct ipc_header *)d2h;
    28	
    29		// The memory layout in d2h should at least contains:
    30		// ipc_header, msg_info and fw_load (message body)
    31		if (ipc_info->i_len < sizeof(struct ipc_header) +
    32			sizeof(struct msg_info) + sizeof(struct fw_load)) {
    33			pr_info("%s(): msg format error\n", __func__);
    34			return NULL;
    35		}
    36		u_len = ipc_info->i_len - sizeof(struct ipc_header);
    37		msg = (struct ipc_msg *)(kzalloc(sizeof(struct ipc_msg) + u_len,
    38						      GFP_ATOMIC));
    39		if (!msg) {
    40			pr_info("%s(): ipc_msg kzalloc failed\n", __func__);
    41			return NULL;
    42		}
    43	
    44		msg->header.inst_id = ipc_info->inst_id;
    45		msg->header.tgid = ipc_info->tgid;
    46		msg->header.i_len = ipc_info->i_len;
    47	
    48		device_msg_data = (uint8_t *)(d2h + sizeof(struct ipc_header));
    49		memcpy_fromio((uint8_t *)msg->i_data, device_msg_data, u_len);
    50	
    51		return msg;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
