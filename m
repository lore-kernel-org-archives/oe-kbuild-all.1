Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79403A83B1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 23:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555181; cv=none; b=kT/t5LVLlowzn6nl2aiH6i9kHuXoh5pnMQY3K+lbf15Hhc6GTkVH8FTe6tYo+1b/xIxsJ1o+/0V9xpyq1FJGbUBlkWiLgFFhu6plselRL12aghu0Z2SgS8GJhn2ymlbiSJHXmqO5c3SYTV9iTaYGB47RDkkXMGAvF45/Rga78tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555181; c=relaxed/simple;
	bh=YTbOht0GGiEgOnTcscFLbpFVYsnnbbmNhIYPGGkleow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OsbpUu2JJBCdHDTuPkIDF+h9MoRP/8NmRcaYpGnFnpwwfYGq3jEMt65m8vVrjatpWQVu22u1CUEp1hjI5yEoExz735zh0NxITz8A/ufiCasUPOin8xmhVKtW1KfZ3t9TPUu3E/Ipxc/XF+0HOVSF+A48MQlwdqqiprmGJbsGmA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmqIutvI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmqIutvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783555178; x=1815091178;
  h=date:from:to:cc:subject:message-id;
  bh=YTbOht0GGiEgOnTcscFLbpFVYsnnbbmNhIYPGGkleow=;
  b=PmqIutvIXFWtRmosY5PNUg8d5jK0DemF9L25EZxYygY3tsUHAZWgZGqW
   kqYobarQOrW+eIXXMhoW6OuEUkFFoYkKUhnQwr1QTgtNadjEvjibfjJfR
   Q4Xrr/sTpv+1PiViMbQreSLeDoQyz4uDATREcJZDz8ictNJoI1wGRKUdL
   /LnPg4n+13ZEhZdtttCf1ynZ4w0c5m1tKFvKRRjGyBpsNCEqMvg/Afnb6
   h007qiZSvwAVxk9CfuxkPIvBqzCG4fSTQA4STcDXOdOj2n7+rFNYlQrBQ
   YrpJSbYkIxRziPzhDkEgDrC81kB0XZIweNZ4xceK1EBS8srOEMDviIwiq
   w==;
X-CSE-ConnectionGUID: ttmy4NXLQzmLSCrualW3kg==
X-CSE-MsgGUID: RQrD4dRQTo2n9Zr5Y1o0AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88054928"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88054928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 16:59:38 -0700
X-CSE-ConnectionGUID: dz4zzV77R5GaK2UgQO8nlw==
X-CSE-MsgGUID: K+PfalLiT9Gpye+ArnMUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259323278"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 16:59:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whcAt-00000000Gzc-1vmr;
	Wed, 08 Jul 2026 23:59:31 +0000
Date: Thu, 09 Jul 2026 07:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/192 6/6] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202607090755.ZWPwMTKG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/192
head:   442be472436b2a1112b636884afd0423584c868a
commit: 6b2b80bea5a43ca60e91bbe199124e5c2b136ad2 [6/6] net: dsa: wire flash_update devlink callback to drivers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607090755.ZWPwMTKG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090755.ZWPwMTKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090755.ZWPwMTKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
