Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FF1D2F55
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690047; cv=none; b=BfBAnb0BKERFsIhVNaBvH2ftigmns0ZJEZya7myFhWwiOgEZWdArgOfiItfgEIZiKrbMZ8cJPRIGLc591DrgDDwVfH3sVWoROhPm0zTndz3c41krJZ5T+iiYmnEnfP0fTooVQWwLSybOp52LLFfvgYlghxDF0aPnXOcjvO6526k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690047; c=relaxed/simple;
	bh=61aGSVZPC1vG2CQyYIB/Uh6oYM9vSjSP8KkrDXWCbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qj0QDLwfFacr4slmiX7/2KIctAjzudJx3OjoLT8PThjtp0SGfOV+OmAPiGClNH7jfN/m9qoP87ZvoCExBW0dW81FdpoS+Fg15IrqAqsnnFuf6RIoeUcbB2qH46iche7hOkFaBF8b5J2DHsdrAMgZzEd0SDfPa6HFEnGqrlgzZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKDf59X5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKDf59X5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728690045; x=1760226045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61aGSVZPC1vG2CQyYIB/Uh6oYM9vSjSP8KkrDXWCbNI=;
  b=OKDf59X55rT35EWxLm+jY6DA/BpFDIBZQK71XF3y4MBcGT4pUqoKwgIj
   mKNrBQ0FNdSxppHl2soC5Qu2Qt1c/yLRGrWPfH36SssKQMDEUIBoWbXlJ
   EGI/qrkSxTwsLo9f+VSvgDR+BjL/4J9tGnRHEvMEvea45MDiZuSK4+GsA
   OmfvUEqa7JWh7sEKxk+A/a2rVf96vxFxOpNIA0ykMuEbp40H1viCfNSWr
   sqizJpoFSiAFYB8E+iWXQ7Jv7GzDVS/q1UmBYQNMwiGAN2KoyD10etAkh
   i52GBTa41W+t1TOSrndaqA5AsdZiwaSV80lAAZF1dBs6VF+ReEqos+5fe
   Q==;
X-CSE-ConnectionGUID: NULRLaQuRJax41L11B+BXA==
X-CSE-MsgGUID: qVaz1nohSwacEbTT1u+zRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27549723"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="27549723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 16:40:44 -0700
X-CSE-ConnectionGUID: BC2BeQEMRC6Yh929VuyjZw==
X-CSE-MsgGUID: 62eh2BivSxmiurRZv2fXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="81666590"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2024 16:40:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szPFR-000CrD-14;
	Fri, 11 Oct 2024 23:40:41 +0000
Date: Sat, 12 Oct 2024 07:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 18542/30000]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202410120752.fnnQfG1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a008d597f5ebedde0d000d27364ddb38be189ae4
commit: d9a579535cd0f4623e627c3375781fb29c78692b [18542/30000] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241012/202410120752.fnnQfG1b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120752.fnnQfG1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120752.fnnQfG1b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
