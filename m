Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86983128D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095937; cv=none; b=sHbf5mjcMPPUOrtjNLL0RhOh1TWdKA40jyvq/qX4QQ40ekxVcVMxgUe+FBhFcLAUdT57T4StENOTr3MO87U6AxMIsVK5rhPDU+Ny+HTW4CwpeCBWPTv+MtN1D6jGgc7S3Js/7zGv1pQ3bgUn/EsE0U3m8LOHSXx+4yvovMHg+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095937; c=relaxed/simple;
	bh=2Ekef7f3IlU4fOOpr0tPRrIEXDA+CJBRr+jq5lgO3ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6XHYm5zYTbbthHjKl9ayPqI/CeblvEnNmGc9w4rrW8i57iY8J+ZnITZvheE+8ZI2bUopf/7ygWQWv7UpAUCDgSJOz96LxsRuSXxMecynCdY0JUwSWBmhfwQwSeEwGemxaVHWYm1B72d87dEH/XBSPvYOjbYExzeBJBhmPWigYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkrfELBg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkrfELBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773095937; x=1804631937;
  h=date:from:to:cc:subject:message-id;
  bh=2Ekef7f3IlU4fOOpr0tPRrIEXDA+CJBRr+jq5lgO3ww=;
  b=EkrfELBgaKMg4+q0M3Hvvtma1VMfk3rGV6gm/EX5dDZ9orcTAw6S9Ue5
   gBHLHnJHHimzmJaCHLLzCGtY1yV9HJRN9ZqnNXsgb/nuYru3MUiK3XWsD
   tHdbEKKzQtGIVrNUxbaqRWV9MsUFFPUpbvoq2AT9MkullWcGjiXdq/cnj
   MAGBJlC4wa5P3pjPSZ9D2T9bCugG2zCpQcjkQY3tiuC/JZYkcJtF7OdCS
   Xsy6z1JgKOX1wMclO1CopzbyUaHTFL0hBS8Qh+QsnuSUCLAnPw3aKS9qi
   oYuruhM1fDHZom3JVOsAAJyHqzwLRA0unOO68Dlzls4Ga1b1c3/LGI082
   Q==;
X-CSE-ConnectionGUID: nuPmLAqZRL2lChYUeI5iOw==
X-CSE-MsgGUID: j59PkZfKTje6A79dYirWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85607121"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85607121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 15:38:57 -0700
X-CSE-ConnectionGUID: suC9erX5TSum3RvsXTHhHA==
X-CSE-MsgGUID: L1/DPe1wSIqvd8hC6dyhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219867495"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2026 15:38:54 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzjFS-000000000uy-3ul3;
	Mon, 09 Mar 2026 22:38:50 +0000
Date: Tue, 10 Mar 2026 06:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Jan Kara <jack@suse.cz>, Chuck Lever <chuck.lever@oracle.com>
Subject: [brauner-vfs:vfs.all 66/107] ERROR: modpost:
 "__aeabi_uldivmod" [fs/nilfs2/nilfs2.ko] undefined!
Message-ID: <202603100602.KPxiClIO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   521aad921ebdcd2d87e3862753fe6739ee3b24bc
commit: 0b2600f81cefcdfcda58d50df7be8fd48ada8ce2 [66/107] treewide: change inode->i_ino from unsigned long to u64
config: arm-randconfig-004-20260310 (https://download.01.org/0day-ci/archive/20260310/202603100602.KPxiClIO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100602.KPxiClIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100602.KPxiClIO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [fs/nilfs2/nilfs2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
