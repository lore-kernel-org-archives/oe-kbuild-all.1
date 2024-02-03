Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9DB5FEEC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706991690; cv=none; b=txaAPL1e2zw7CqUUyvHyDWmnC+xy1fOeyL+Mz3EHci13SpEXgf/UB/X+BdS1IOF/S7uDZiUWwiBBhD2jLlI87sqLLrLl+esqQksnBWpX1SvgiszDu9cbBHLtrHGSDkSOMk0wvtyy3PSmadytadgmAE6aJ6KhmZpMBO5p5D1ze/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706991690; c=relaxed/simple;
	bh=nH5KB4/QBHz4raDctgfX6JDlfh/1P5owQV7T/OMueJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLDhEYSz5a01xVFIo2/jNrGhlfuIMjhcZO8xGBQmweQwTKfQjFDtZguuf9T5Gv4K4U63DbYjx0WGTUAoJ9ZtmQOdO3K3jQ24dLmRLEGGSRrsRPB9RwJXK2g6NVMNlRzkD2iR1022Wom+i4SVs6OZQAESiaq/+xrkViMM1foHXIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU7Kt1Ct; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU7Kt1Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706991689; x=1738527689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nH5KB4/QBHz4raDctgfX6JDlfh/1P5owQV7T/OMueJY=;
  b=LU7Kt1CtnBMCBiKyc0WH2wKrOpQvwvZyWUTFr2f5FJvt+gzr+jdyys62
   NyqYOKkG9OaS9TC1p7JH3HXf7Zq0j+NLaYetZAyoDPL+vwKFyvFkTIaQ3
   k9bL9roduzKwpG/Dy3vCmtk07uX/d/c+5v3vAFC11o/a5pcyMbuWhlgWg
   DHpMtoRUs9hTv3xuQ305RY7gOPVvO8RJdSy6R8W8q147b1RJf7lG2qslH
   F9wRJklSoJaNU1ZxTb5NhhBzC7lvyoO2m5dI70TdzjIaIwyRDMbn5PNzY
   omX2Zzfrtz/fGPh+gjH1lHNLgd/WwDrNFAPybddKnEeiLL8q4X7sSEe8q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="493138"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="493138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 12:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823506907"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="823506907"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2024 12:21:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWMVw-0005Yu-2Y;
	Sat, 03 Feb 2024 20:21:24 +0000
Date: Sun, 4 Feb 2024 04:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1521/21614] sas_expander.c:undefined
 reference to `ata_dev_same_device'
Message-ID: <202402040404.cVMr60Jp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bc2c7cbdcbc5c8e5bbe65d3542ec2fccbc61492
commit: d856ec500c97835c591ffacc005f514509f1a931 [1521/21614] scsi: libsas: check if the same sata device when flutter
config: x86_64-buildonly-randconfig-005-20240202 (https://download.01.org/0day-ci/archive/20240204/202402040404.cVMr60Jp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040404.cVMr60Jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040404.cVMr60Jp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/scsi/libsas/sas_expander.o: in function `sas_rediscover_dev':
>> sas_expander.c:(.text.unlikely+0x1a26): undefined reference to `ata_dev_same_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
