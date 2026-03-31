Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D6188CC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774926601; cv=none; b=RVpoURuYilgfG+EMUFJrLC+5zEMFtSA2adxPFtT8gcEoJmck0qVsSXF4GqUuQKq1BMMR80pwN9l/47rBHj6g8wj3x3StGpEZBPcWw1l5BhneWzCtq07Vl6LWpnI6ETgcumvhej7/n8Xz9/fhrvm4CyfdRu42zQTqo6rMiNmT9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774926601; c=relaxed/simple;
	bh=V8nxtE9JwCHJAMv46vVmyWk7MzE/mduRjtPDVoCEyqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dek9paOakbT/IdbBo32JGeV1JwY46KQ8K2QV8yozthB8WaxTGqktQ3ipUbEsLxhwJzarZzs9dkA5jBqtqzgA54V3sLxhpGJ0v1FxrH43eceN3oDNERpUl/0XMVV/VvnXCD2IQq8V6fFARxbu8sEBnrn+uKYhNg1qIxc6P++8UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W87VcSnT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W87VcSnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774926600; x=1806462600;
  h=date:from:to:cc:subject:message-id;
  bh=V8nxtE9JwCHJAMv46vVmyWk7MzE/mduRjtPDVoCEyqI=;
  b=W87VcSnTySqm3WqSCYmMCVt6lOfr0Zxa1pw80OwaRzbT1Z7xPYcIz5i0
   TcTbJXzsX4IP+Yz7ioOQ8seVH2aLm2Ehle07wfRLGOPh6sLCwy43Y8CHr
   m4Q0tBcIFeqLPtlrFf5F8pwi0o0DjU1zCkfGMSmMViBIUQp8QDFQ8bX0T
   KyEJA1iD8uK3R7MxqE9MatVP1OllP6ObAZp6nlkfuZN3NuTaawTOT8Xpv
   hwPOh1zJQHjKAUTYYdZTEBkSiyIJ4gw6KkuC9NCamkKGEGniWfQ/Gy0Bv
   GKLAcbYPaxlDomt5mVQK9DCmHVvMXKvLvTpbq7Y9qAxOyaS3+NK2uEjrx
   A==;
X-CSE-ConnectionGUID: ApbLWBP1Sgm/td5eahFGzQ==
X-CSE-MsgGUID: 11nLmZvJQWiGs0Cmh+nCOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75824829"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75824829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 20:09:57 -0700
X-CSE-ConnectionGUID: LL+8c0bORl6BBxSrMaqYxQ==
X-CSE-MsgGUID: jEY4skrbSh+AU2Z6azRNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226197598"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2026 20:09:55 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7PUG-0000000025R-2MZp;
	Tue, 31 Mar 2026 03:09:52 +0000
Date: Tue, 31 Mar 2026 11:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x54 (section: .text) -> map_page.isra.0 (section: .init.text)
Message-ID: <202603311113.tGA7BZuT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   7 months ago
config: openrisc-randconfig-r113-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311113.tGA7BZuT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311113.tGA7BZuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311113.tGA7BZuT-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x54 (section: .text) -> map_page.isra.0 (section: .init.text)
ERROR: modpost: "__mulsi3" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/preemptirq_delay_test.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/nls/nls_euc-jp.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/exfat/exfat.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/autofs/autofs4.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/nilfs2/nilfs2.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/gfs2/gfs2.ko] undefined!
ERROR: modpost: "__mulsi3" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "__mulsi3" [crypto/hctr2.ko] undefined!
WARNING: modpost: suppressed 446 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
