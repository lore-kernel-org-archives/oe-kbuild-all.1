Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F1CA42
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752546; cv=none; b=EcBo1PZjXgsZZYOFnTwsYq1/ExifNUaB1f8WeOy0JnXMc+OiJhgPvzTfv4QBYdpGNTN8WdLFdgMJ5+ZV6unr6SICBkjfWTRujcQ08nHOOQ0Vn3hTLQjXr7l344jjOIriOcHS6kySMqiZ8KliFOT9Vu2dNWJaemICJRRFyKWs2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752546; c=relaxed/simple;
	bh=rZeebIGoch4/Kn39203MCNFeUoVr1pcWa95GHzljauY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8999W/3tQbS2DMOVOVJOMsOkJHPUQLYEGhqQ6gVzhCSxckwfJ1aeALLrDdjPDxstLUnAQZ+EYLHKqWOi7bzxCgsJH00R07D8Axg3M0myAGpebkyYCFg4NfgsjtQVslwVtJFllVxPwIAyeysAUe6xhax+ALzgcCDZUEXjZWhENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbGrZqHe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbGrZqHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706752545; x=1738288545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZeebIGoch4/Kn39203MCNFeUoVr1pcWa95GHzljauY=;
  b=gbGrZqHeZF90xDUQ2lAw31oiDa0Tgkl1teIK7aBOhILCODj6H7eFKd2A
   h3ClpOvsBInpRvKXs/OC+OKNj2w6Y2dpJ51fY3G40pRh+54Q3cnNa3lft
   CI4yAJi8DCOLNZIpOQUcfPc2RxCZL7271uU1WQsclbYHLu+qrCHXD2Cxy
   +thn/Yg5ZIUm5yXnA4mCgo4aydPWfpdqBn9GP2tRxxNnbiOmGDRqlEiCM
   CmJTeFkK9Lx59oaRo4H9BPdvjNsm0cP86XiC7nY1WDSERazn7t8qpBbDx
   SKj2xWi6vmIj6iDCK5rgrMqaIod5R4O/mft4ECHKI91yQRJaAP9Tb5C1N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25243542"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="25243542"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 17:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="22968549"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 17:55:44 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVMIi-0002Ga-1R;
	Thu, 01 Feb 2024 01:55:40 +0000
Date: Thu, 1 Feb 2024 09:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2855/2894] make[5]: *** No rule to make target
 'arch/x86/crypto/sm4-zhaoxin-gmi.o', needed by 'arch/x86/crypto/'.
Message-ID: <202402010940.ilu0RnZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 3b77535a6245966041634eaabc6fe013f20688d8 [2855/2894] Add support for Zhaoxin GMI SM4 Block Cipher algorithm
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240201/202402010940.ilu0RnZ1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010940.ilu0RnZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010940.ilu0RnZ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[5]: *** No rule to make target 'arch/x86/crypto/sm3-zhaoxin-gmi.o', needed by 'arch/x86/crypto/'.
>> make[5]: *** No rule to make target 'arch/x86/crypto/sm4-zhaoxin-gmi.o', needed by 'arch/x86/crypto/'.
   make[5]: Target 'arch/x86/crypto/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
