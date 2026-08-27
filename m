Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230D37F737
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 02:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796822; cv=none; b=UVo8QfUpwxkFdAbDTzCxpw29z18JdOBpFqHI3sr+blX3Zy/7By7OEMLHN1xCg0bz+b8+YcXBWgD97a5c5k00kciQpDIAiclSEWZpVJCEOFPJfKxITuzfwnjtClUIjjFpWq6O70+yNIhVbOY2TPIuoUCFgTOZNXvMck2VkfatAlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796822; c=relaxed/simple;
	bh=2dHuMFPXfD1BNusSwxSfZh7oqwqE7AQ6aS6PJWfkRa8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tbzOtM+uuQ/VbZlrNf1SzJmOx6ElXS8jvQ6XiEmehQYhwcFIrnaDDMisDz1e1VLvqt6b7hG0qW2EilXAW7KdQ+xiD1XBLgMzAoJbFzEMtJ2FhE4n+2I1ltbGSRFBcqDS2Z/G/i0pBDnvMEbGx8jkR27S4XlkZBNeHvCE9ZbyHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqfjh0fG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqfjh0fG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787796820; x=1819332820;
  h=date:from:to:cc:subject:message-id;
  bh=2dHuMFPXfD1BNusSwxSfZh7oqwqE7AQ6aS6PJWfkRa8=;
  b=kqfjh0fG+eJIgv5/JKv98T/E1P3DRYLsCjrHAp9lcRqfaH9Q9ZdWESWF
   aVJTcpQvBZ80pG91uCtcitmJwfJm5UdOEFckQmlyDOesZhzvjjRrN1pv2
   8Uxkn/UVoFcyAJqEQnCWDI9ZAcBkMxSGnVW9E9LixRspr+G0sLGJiRKBo
   bO6gvchLqO9CV2NbVZ84MhJxUaew9t2ty2IWQid0f9zs1AyjHiOOB8qNi
   dXGoMk2DXq3YWYTRK0n1u8ZjBTuSTcsqgci8daP/c/9vtyqRfib6cg/kb
   /VlYjZLb4ElHqeIeRlIPPHqce+yzUgmN7sOKJLpD/J6CdITUaNXshEHxg
   g==;
X-CSE-ConnectionGUID: CwDczj3kQ6SpfuwPFo+F8g==
X-CSE-MsgGUID: vOhQpfNhRRSNujyGLOq+Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88055519"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88055519"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 19:13:40 -0700
X-CSE-ConnectionGUID: 5fVJWfU4QEWAaBHC0OCgxQ==
X-CSE-MsgGUID: 7ajzokWeTYmldH7ndiSujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271539409"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 19:13:39 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzPcW-000000008nF-1DUn;
	Thu, 27 Aug 2026 02:13:36 +0000
Date: Thu, 27 Aug 2026 10:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:1881 expecting
 prototype for ibmvfc_relogin(). Prototype was for ibmvfc_scsi_relogin()
 instead
Message-ID: <202608271026.iMLmrwz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: e0fca728a89f14c2edd3e9f5343d0f019d8f50dd scsi: ibmvfc: delete NVMe/FC targets as well as SCSI
date:   4 weeks ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260827/202608271026.iMLmrwz4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271026.iMLmrwz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e0fca728a89f ("scsi: ibmvfc: delete NVMe/FC targets as well as SCSI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271026.iMLmrwz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:1881 expecting prototype for ibmvfc_relogin(). Prototype was for ibmvfc_scsi_relogin() instead
   Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4976 function parameter 'protocol' not described in 'ibmvfc_alloc_target'
   Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4976 function parameter 'protocol' not described in 'ibmvfc_alloc_target'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
