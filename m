Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4DE36F415
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566748; cv=none; b=ZN8qPbkjGoNyILS9paPIxVQtJ0SdOysydY5xyNHoQA6IRckyBKQybRPGNiaoRjTbvV2cDb3PFE8F12bQpltmziru0Q7oMBOFyAupOxhmoiZnIHtkgfywilK0PWmASdbz1UUf/IH5K5zT0lmvaPc3UamTgHL7msireQ+s/ODxVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566748; c=relaxed/simple;
	bh=uR9r+yD2lYB7D9g5liMKvdIFfDAiCPXV2ByD1xbMgwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m/JpKiQcVASOL5AgrCpAJvLHC9jVPifOZ30N9G8mAi/Q4FIldf1oFIF/0EomRdi2LMTfXSOddWwtcZ355Kktr4CKQU2jtKcdWSezG+6mckBUQl34/iUh30Zi+sBQBPbZZKSTYMNx6soAzZD7N7pZo9x3HIHqWcs4j9iyy3g9bPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU0hyYvC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU0hyYvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786566747; x=1818102747;
  h=date:from:to:cc:subject:message-id;
  bh=uR9r+yD2lYB7D9g5liMKvdIFfDAiCPXV2ByD1xbMgwQ=;
  b=bU0hyYvCKQL/PbfN1OmBUZi/ME96HGcKSCo+/l47TUurAN/H9DD5av08
   fNVg1WIv3yNiz9A3c3vVujbCPb4SmQs4Euy1tRcKc7xPpCklXpb/zuWWE
   Jp52pZuLL/+uOBVciR0+xX/d8dHDrenWaYLlIrjD+d5e3BbUcWLoU8Jg8
   LMrBM8UClBbBsoxFoYXLAwBNMPCJpjv8uldubv+KWo5SL3DaJZOOcIvz3
   gAHGmixKDQJ61QBFX2BkPHF2AR/L/SOo5rs2tgpxBp5AcnLTYyqkbFw79
   P8KahwbEegzga5yPV6jRkZwIZuzH62IJ9uWDiVdiFYE5AULjirxSRQ67X
   Q==;
X-CSE-ConnectionGUID: JLhd1Z5RRWapx+JFG1G3ow==
X-CSE-MsgGUID: bd3iT3XfT8e4nBV3AEUHCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87150433"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87150433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:32:27 -0700
X-CSE-ConnectionGUID: DgiL2DRXSw2L8RAnJxHPng==
X-CSE-MsgGUID: oWbiFgKzR7iLEjUXra/CSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263788546"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 13:32:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFcd-00000000RcC-21OY;
	Wed, 12 Aug 2026 20:32:23 +0000
Date: Thu, 13 Aug 2026 04:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 194/194] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202608130426.ufWJDh4T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   a95b0dd9ff78c9cef7f526f740079a3a051f234a
commit: 73c42009f10f5520df17771b92df87cd4a313058 [194/194] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130426.ufWJDh4T-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130426.ufWJDh4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130426.ufWJDh4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
