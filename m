Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2011C01
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728186531; cv=none; b=lVRY7+B5XtOpXiVv0ZrXyzb9t0OMUvZ7IuAf4QrGJaeHhI2gNCVgZrtlLg+zdmOut5WeKFHYOEMnZ9WHabyDDqXkH/EmRhG320gBZmDbtxR8xkPCA9usQS6wphqHe+07X/A3GpL+miO1QoDgS/ncOWZF13L8zPnYOpS5Tz0GTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728186531; c=relaxed/simple;
	bh=kBPPX9MGf4P+cymEwkGpU9kZ67vbSc3+GYbCTcFPqP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmgWBbwa8W8cX7IUEOen/yTZd99CokfCu5WGoeLmo8j0oOL5YfYJUSezTTsPpPjftf8RtNthgrY+13SKZp4ZgLv7VFJhBivCvk2Trul+XJAWac6/RUT0n/5gNEaPq3B/bufMyuGeXJJdGY9AAwfppFTU28DGSdkLsD4sLx40ruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLdlbBy3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLdlbBy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728186526; x=1759722526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBPPX9MGf4P+cymEwkGpU9kZ67vbSc3+GYbCTcFPqP8=;
  b=TLdlbBy3+cg/1MMp8z/O0VYpa496fsyVT6Bse3m5Dghu5s74lu/hlwVV
   MoCsF9Ggb6sUn+dYopmuIN2Vbh9mnr2FAhgqFx/0UqMOMUU9fhfYIjBKZ
   I6KEkQw8k1pqITDNk/zLrznaS9wh49qI3xIUdi3xu4RQHEELoXhHD/flH
   W1fMXd+80UKNAmWVfnng09Wq5pfugHgiQKEkkY8wA3rSwg23qjp1UUGCn
   +cOpXG09DOP/Ux6Yco4zwSnKtHcwSkWDMcoF/zNhgCeRJ16XhlTvnVXX2
   MAJ+i4TIo6L5LHahSFKqdDPaq4DfVWcX6mDRXaSGS74rmWcuMdyQqnKHI
   w==;
X-CSE-ConnectionGUID: YlTo+6HyQZulonmUiAtVYg==
X-CSE-MsgGUID: syfwDI8FQTagB4gMqwjUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38754410"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38754410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 20:48:45 -0700
X-CSE-ConnectionGUID: hwCBjiNUTSSPFC5kqfOMrg==
X-CSE-MsgGUID: LS+BtdqWRzyMU7YXF59rsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="105949497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2024 20:48:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxIGA-0003aM-1m;
	Sun, 06 Oct 2024 03:48:42 +0000
Date: Sun, 6 Oct 2024 11:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3143/16788]
 ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202410061127.c3gXca18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f1fcb1c8a2f7ad2ec43d55871b3771768884c5d3 [3143/16788] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410061127.c3gXca18-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061127.c3gXca18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061127.c3gXca18-lkp@intel.com/

Note: the freescale-fslc/6.6-2.0.x-imx HEAD ac32ba5fe66266329914d2020570364afe217bec builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17,
                    from <command-line>:
   usr/include/linux/videodev2.h:2477:41: error: field 'timestamp' has incomplete type
    2477 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~
>> ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
      22 | //ctrls & extension ctrls definitions
         | ^
   ./usr/include/linux/imx_vpu.h:22:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/imx_vpu.h:111:9: warning: extra tokens at end of #endif directive [-Wendif-labels]
     111 | #endif  //#ifndef __LINUX_IMX_VPU_H
         |         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
