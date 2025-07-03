Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985B1853
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506573; cv=none; b=g3gl9ASsboXZ+FgmbAtYz5fc/n4Qums4zTWxt0MQ5YdDlmAR0/Vwp6EDJQsM30+ITHNZiGhWGN3f8TUp16dyb2rjiQSrC8eMMoAMtqIr7vXWQWL+m+Kodll4wQycScCNrnGiakDr5V99nPR7IHbgg+GojKquc10pCeA0DIY1NdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506573; c=relaxed/simple;
	bh=SpyeaT+E7sbBh6ToSHwP1rTRL1w7uOtHFF2oKYTurMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKewUSNHuLkw7B4KToEo3NudtzIUg+nYk3uxOd10HyGLP1mE+RtL7XrXShJG8LW4yIoFM+oSdB/T1PaC+fWxMKRAKl2c+cVgvhMhYYq0uyaNiknELNk5rQJDdWivKsQc8MxS/TSzqOO8+x0bKN1KdTsnQk6/rzTia2aDsJGf188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ0Bqdj4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ0Bqdj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751506571; x=1783042571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpyeaT+E7sbBh6ToSHwP1rTRL1w7uOtHFF2oKYTurMU=;
  b=CZ0Bqdj4sPBuEBqsiKvaIKNpIgNaIAwn0BXPgWCbNBO3dq0scdCqPyC9
   1LMzBACDtdzvRkMRxMF8kGaepTDXo82/fGc0BWa96ymsznmK1BLKLXYlx
   tIkaD9iJ7+pBALOWjlJaZyczSSDYb8qhqrlFgstIHNwU3bTSx45GqwCoK
   QArhSpkLZdOM9d/WCGEwpINSDSVqeRCf+xuEcGNCqZx+VaN5r2btvy/Ad
   N+0gDwPUzdS7uQkwyPXIhyfyVm4vbQwntlm2atCX3CGDT+2j3YGCZpFQi
   tNQCsHcaESV6RnfGOue9KquLNO+5rXF6I7VO3qgWC/Lj0EVsiTDfpeumD
   Q==;
X-CSE-ConnectionGUID: ACvkAbLgTK+vb++HQFV5Cw==
X-CSE-MsgGUID: Y5yHHa0gS2CVTzSAaKScqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57628802"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="57628802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:36:11 -0700
X-CSE-ConnectionGUID: XrS6WyOIRPenflTW9ar4zQ==
X-CSE-MsgGUID: PeVXNVYRS1CJ5v7hO+M5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="185168610"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2025 18:36:10 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX8rv-0000Np-1S;
	Thu, 03 Jul 2025 01:36:07 +0000
Date: Thu, 3 Jul 2025 03:35:23 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 fs/ocfs2/dlm/dlmcommon.h:709:9: warning: 'BITS_TO_BYTES' macro redefined
Message-ID: <202507030301.JSR1Dol1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 8f44df8094e0d4dcd28122eab732820e5c639ccd [1605/1605] net/netlink: fix NETLINK_LIST_MEMBERSHIPS length report
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030301.JSR1Dol1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030301.JSR1Dol1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030301.JSR1Dol1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ocfs2/dlm/dlmdomain.c:43:
>> fs/ocfs2/dlm/dlmcommon.h:709:9: warning: 'BITS_TO_BYTES' macro redefined [-Wmacro-redefined]
     709 | #define BITS_TO_BYTES(bits) (((bits)+BITS_PER_BYTE-1)/BITS_PER_BYTE)
         |         ^
   include/linux/bitops.h:9:9: note: previous definition is here
       9 | #define BITS_TO_BYTES(nr)       DIV_ROUND_UP(nr, BITS_PER_TYPE(char))
         |         ^
   1 warning generated.
--
   In file included from fs/ocfs2/dlm/dlmthread.c:48:
>> fs/ocfs2/dlm/dlmcommon.h:709:9: warning: 'BITS_TO_BYTES' macro redefined [-Wmacro-redefined]
     709 | #define BITS_TO_BYTES(bits) (((bits)+BITS_PER_BYTE-1)/BITS_PER_BYTE)
         |         ^
   include/linux/bitops.h:9:9: note: previous definition is here
       9 | #define BITS_TO_BYTES(nr)       DIV_ROUND_UP(nr, BITS_PER_TYPE(char))
         |         ^
   fs/ocfs2/dlm/dlmthread.c:534:18: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
     534 |         if ((res->owner == dlm->node_num)) {
         |              ~~~~~~~~~~~^~~~~~~~~~~~~~~~
   fs/ocfs2/dlm/dlmthread.c:534:18: note: remove extraneous parentheses around the comparison to silence this warning
     534 |         if ((res->owner == dlm->node_num)) {
         |             ~           ^               ~
   fs/ocfs2/dlm/dlmthread.c:534:18: note: use '=' to turn this equality comparison into an assignment
     534 |         if ((res->owner == dlm->node_num)) {
         |                         ^~
         |                         =
   2 warnings generated.


vim +/BITS_TO_BYTES +709 fs/ocfs2/dlm/dlmcommon.h

6714d8e86bf443 Kurt Hackel   2005-12-15  706  
6714d8e86bf443 Kurt Hackel   2005-12-15  707  
1faf289454b9ee Srinivas Eeda 2007-01-29  708  #define BITS_PER_BYTE 8
1faf289454b9ee Srinivas Eeda 2007-01-29 @709  #define BITS_TO_BYTES(bits) (((bits)+BITS_PER_BYTE-1)/BITS_PER_BYTE)
1faf289454b9ee Srinivas Eeda 2007-01-29  710  

:::::: The code at line 709 was first introduced by commit
:::::: 1faf289454b9eeb6e463da3eee47f7009668370d ocfs2_dlm: disallow a domain join if node maps mismatch

:::::: TO: Srinivas Eeda <srinivas.eeda@oracle.com>
:::::: CC: Mark Fasheh <mark.fasheh@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
