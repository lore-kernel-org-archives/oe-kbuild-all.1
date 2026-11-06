Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962635;
	b=lmw8WukCXF5iyNfaRsVl6082lUT9Aek0T6wQO5q1/tjzQgo1m2Rea0Ju2iYy0YeadSTi
	 LtYVVboi3XkI9OJlnS8ghLgk5mSEcGXJHm946kLKY1wmm8pko1Zru9and0ntppw/sseiu
	 7AaJ5QVKEdQk9IOJpaNo96m0tAJ/zZl+FMGKFCYDPxBR8iO0w/8vqa8l+FOlngDrLEPjI
	 lS1JBX6zslMdB4nKuxKI6Kbh4xWRptWsn2NiLFdelUjFk6otq3ty4ZY5jO+UoiUnv42k+
	 qx30bY6IFDAgDHz/+augRGaRMDikU5qNZ8PTxqBoX4b7FdXTunk3VjGEyHRT8B29uVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962635;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8dneATz/Bl9L85operGV2c45jS1bFP2HuPltALunju0=;
	b=5WcgDJDxW3yFzvLuD6DqRLe/D+zFMHgpu11NuLSOw9gyBd9A4BZSIKRaPDMv+Ip6cS7I
	 ACYXPA2Z3GTLPu06ww5X5nQA2EH1O1V3ccvS7Fgh+F//CDijNincxBxF9XRBrbCxhc0GS
	 LxeZdJYzSGd/Py2orA+nvMAUr9rIowJmp7Se0NR664qh1veuA2yKTCiDydrfhsdyFi+N0
	 71D3CHUbQa1tXnqfjYPA+BgPZb6kRbctz4jHAWN7DWN0Hz/Y/xzXmXDDHeak+xNVJfUvm
	 4lZjE6NOgrNSOnbWbGFCGTUc2F49GFdbYZHZh9HEYHMKJQRxVx83OmDOQXAWcv6/l4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T1yE3W7R;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E79606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 10:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E79606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T1yE3W7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793962634; x=1825498634;
  h=date:from:to:cc:subject:message-id;
  bh=aPuXM3xkDhXcMkidGu0Jx4Krbu4QqxWOL4rEiqvFptQ=;
  b=T1yE3W7RmQlbvO6W8TR9zUyS1X2bY/lt+bUkGF9I0LY2zVxNfjFxLYks
   IP9q4bZdZuJ786Ybxu9W8H2eZJrLjZ/uwd01Akn735h0fem9M57ayweKW
   KOrJIgWFjhnlk95azZUoAiz0pcW5nZnp25sOXkABePsAS/CPLA9eK294h
   rtEAuzhK5VWujsZpSl+7XY1wvjuYGWzVmE3/TIYdltF5o79ESVzMKhGg2
   Ye2HAQE2UZ2MArdr4C5dtqp96B2v0KdQkYvW2HL/Vi3CvVEAFFyG3exux
   mv9FdawrbYGhm34/d+oZk7lmIKqxar63x+s6wkkcFMFeSHmQ1W1J/Vlua
   A==;
X-CSE-ConnectionGUID: 4dzxq691ReK3G2N6B/JSmw==
X-CSE-MsgGUID: DlPGID56QuKTDtOlBMJERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2788021"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2788021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 02:57:13 -0800
X-CSE-ConnectionGUID: DCld3Ig0RK6LGo8MaZQlZQ==
X-CSE-MsgGUID: X0S421JyT3+LsTTOv3dDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7366680"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 02:57:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHd7-00000000p5H-119Z;
	Fri, 06 Nov 2026 10:57:09 +0000
Date: Fri, 06 Nov 2026 18:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-nvhe-s1pie 2/2]
 arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: arm64/pgtable-hwdef.h:
 No such file or directory
Message-ID: <202611061816.5SbIibbC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-nvhe-s1pie
head:   321d8d9bb036f451a784d12db6eea0c1ed701194
commit: 321d8d9bb036f451a784d12db6eea0c1ed701194 [2/2] KVM: arm64: Enable S1PIE for hVHE
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611061816.5SbIibbC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061816.5SbIibbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061816.5SbIibbC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/arm64/kvm_emulate.h:11,
                    from arch/s390/kvm/arm64/handle_exit.c:6:
>> arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: arm64/pgtable-hwdef.h: No such file or directory
      15 | #include <asm/pgtable-hwdef.h>
         |          ^~~~~~~~~~~~~~~~~~~~~  
   compilation terminated.


vim +15 arch/arm64/include/asm/kvm_arm.h

    10	
    11	#include <linux/const.h>
    12	#include <linux/bits.h>
    13	#include <linux/types.h>
    14	#include <asm/esr.h>
  > 15	#include <asm/pgtable-hwdef.h>
    16	#include <asm/sysreg.h>
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
