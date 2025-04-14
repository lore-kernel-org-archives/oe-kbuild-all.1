Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FC1993B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646969; cv=none; b=SJswf8K/o4SajIrSeO5lJuMgg1QXYDIpxfFSkkHcgQ1C+R0P98BIFEZqqIsa8Kxt66miPKDqJnbItFw4cQTbwIbeKG23BDwtK91MkgbYbHQFCgpe/WRzCNJPcZgNR7HcKeaYG9R1L6vqer0jVAfA+ErsD0NDhWd+Aim1q+BAI9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646969; c=relaxed/simple;
	bh=efItUF9CD5cebxTPfZy7Fsxgkar8+YJHHozRFsxz+90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FeOQbjYbXCV6uJkdzaI9k/zQN/a81ePKgcJoGXHtmJnDteX2o1UDsUj9A4j/J4L2vzotjyw8Iiyh1anVH/HMmuOBqr9vk6Xg6eZ1UrEACprdtKrEpf5QF4ghBFCPjPi73099TV7i/lm17ujjoxmXZ2PUD5dksZKTyy+WoxwU2hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATXbSq1B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATXbSq1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744646968; x=1776182968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efItUF9CD5cebxTPfZy7Fsxgkar8+YJHHozRFsxz+90=;
  b=ATXbSq1Bzr7ZuncenmUKJcmNOkFK3Iqm3fqq2h9H3JihPpcnQ7Pvn/Mm
   /xe7WrEkAieX6WYO/Iy9Vi3ikFQGI9pcVfKEhmSPc31eblwD9mD+VQKRp
   T1mU5Ts/+0bvMXr9SCIE93CX7l+88BA85AbSFFqYYFO36spSHvgAKEUed
   k4kHKBiZj8ah9rc5R8n/d49DzvJWxgDtnzdZUH3znbhG1rZVAccpHhNuW
   9y8v4SoHFAh0KO9ZKmL61j9vhO03PGAmvP0gh1HZ0dxc4ZTS12qfFAS3a
   jAchdV+YHf6WKZjkFmnKg8Wd6f+zRA1N5ya2j/FGyilQcwv4CmwJqTCuy
   A==;
X-CSE-ConnectionGUID: j2th5joRRymjxZKin5UTTA==
X-CSE-MsgGUID: 9QBr5CJ3QH6G0qt4ctNrRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49930611"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49930611"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:09:27 -0700
X-CSE-ConnectionGUID: zJ9DHZGhRlipvokOfYSM0g==
X-CSE-MsgGUID: LFOIKYCaQDK6w6P3jbSCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134634142"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2025 09:09:26 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4MN9-000ER2-2r;
	Mon, 14 Apr 2025 16:09:23 +0000
Date: Tue, 15 Apr 2025 00:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core /6] drivers/misc/lkdtm/perms.o: warning:
 objtool: execute_location+0x0: Unknown annotation type: 167772160
Message-ID: <202504142336.9pVtkFgn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   b5a545bda294204895870f17e0546a3d9a8a3d84
commit: 121fb1768c4c335cbd8b6142ce62b3ccc4ab2f78 [/6] objtool: Validate kCFI calls
config: powerpc-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504142336.9pVtkFgn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504142336.9pVtkFgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504142336.9pVtkFgn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/perms.o: warning: objtool: execute_location+0x0: Unknown annotation type: 167772160

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
