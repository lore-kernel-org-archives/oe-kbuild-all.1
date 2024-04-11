Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA631D4F15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849997; cv=none; b=rZS30Ehwd7m+Lt2deXu7ngJb68+aEw9D28SVz/4/1yIKDvncrSR8n6BUx2iw5PwWiWQz2sM0UOOAKrpgXc2duNmfZXqdjc1BqoRcFceSs7PYilGl+DAJ8HcxXJLVvXOtPsMjgwJATAJaKqRdY3jyvYFpkLKJ6wOtaajYFGQoFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849997; c=relaxed/simple;
	bh=f1tTWHRKvdi+XerOrlBQdTqw+H6C2UWLbmuSZCk8ots=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syX7SeT8BvI8FCsB6GmSL9JwrIOifie9yt/z9bmveQV/8h6Hu/FbHYXvVMExKdMC4/nGo45rEGtj6ASvOk3tBIEpazKWDSRYZ0+/czFZvUBonl6hhaQI15IOwzb40LhzoABiPTXZ8qncEfrAhJctQzdyy2JHpRK+UgNtXe+xmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdHwFXUL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdHwFXUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712849996; x=1744385996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1tTWHRKvdi+XerOrlBQdTqw+H6C2UWLbmuSZCk8ots=;
  b=HdHwFXULP3jUtqCbTKEo7xWkdIw9BPtQi6or4h/wTCtmnxqlrDet4agB
   hwz2/Ze/MDco02/aaJs9qzu6Du266gVPV4j2vODcM4hsEbx53cQ/qhuqE
   gl2CsPCGwQRjvMT+DX0hYARCoz4dbgU5uNNHo1cV+XxUSGsgtNnRvsZrk
   Lmtz5Jhx9vFBPS01urxn+4W3sO4pPCE2toSiJ5fCoGuCRHzdueipKN2QA
   BJquGSwhshPESyAog5bhg34ZPSo1XFw5CVlglP7wkcjl+ROOrBULrnLeK
   /+ppQ5X3IaIts+r9Pzw4kukAEcAT84ITGh+UrYsPnT6xRpBdXgW0oKRJk
   Q==;
X-CSE-ConnectionGUID: pj9f1pqoSv+nhidY1buTlQ==
X-CSE-MsgGUID: bs55LN95T724v3B02HU0Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18826329"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18826329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 08:39:55 -0700
X-CSE-ConnectionGUID: PE3fu7mzRgq3QZnLBV/dTw==
X-CSE-MsgGUID: fLdgK8+MSZuUcZ2vpCY3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20898547"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2024 08:39:52 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruwWj-0008kD-29;
	Thu, 11 Apr 2024 15:39:49 +0000
Date: Thu, 11 Apr 2024 23:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4791/4792]
 drivers/crypto/ccp/hygon/csv-dev.c:20:5: warning: no previous prototype for
 'csv_cmd_buffer_len'
Message-ID: <202404112324.66z7D4NX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: 09eee6b2d3f275c81b00d30a60b940a033afd6c0 [4791/4792] crypto: ccp: Implement CSV_HGSC_CERT_IMPORT ioctl command
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404112324.66z7D4NX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112324.66z7D4NX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112324.66z7D4NX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:20:5: warning: no previous prototype for 'csv_cmd_buffer_len' [-Wmissing-prototypes]
      20 | int csv_cmd_buffer_len(int cmd)
         |     ^~~~~~~~~~~~~~~~~~


vim +/csv_cmd_buffer_len +20 drivers/crypto/ccp/hygon/csv-dev.c

    19	
  > 20	int csv_cmd_buffer_len(int cmd)
    21	{
    22		switch (cmd) {
    23		case CSV_CMD_HGSC_CERT_IMPORT:		return sizeof(struct csv_data_hgsc_cert_import);
    24		default:				return 0;
    25		}
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
