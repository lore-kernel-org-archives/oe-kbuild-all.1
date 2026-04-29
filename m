Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0518C933
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 04:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777438451; cv=none; b=A3gmRji/AhG+In8HcO7wRSfJVN3buKT1MotTVWBPuSH6fNnTb6rS8rf9qOjs3sRbS5ItMxcFEP4rxPnK5Flia83hDSfJgw6GusQiwPyooa7npXI2ltnLpIUEH8zv1wqW6/bYpgiNsZSHEd5U2omdPFa1vyvBSC7sUJi0xnBIVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777438451; c=relaxed/simple;
	bh=4fVydENGGkcresQU8WHCH5oO5PbSKY11aMHhhRntUWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k5bbGpVz9I9x2x+qfBhFKiWQdNbhyf9Rqt1Thn+bQD3v2nXd5QfB7+N1k9eomQLewycD5IMCmxVykvz+XsnSvP0kgYI0MhaND4opfgHKo93e6YcaJpZ5GzLjDj0HsKZBo74+r4xDm2E4QETPQDbxVy1qt+MwZPXzs4hCkV59cXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHLhINkB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHLhINkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777438449; x=1808974449;
  h=date:from:to:cc:subject:message-id;
  bh=4fVydENGGkcresQU8WHCH5oO5PbSKY11aMHhhRntUWo=;
  b=aHLhINkB3i/nbUXYh29Vpqx3iP+NU+Qxh5A1IOlnrXgc0r6gDgtAxyTI
   VQ+EJz5A/tzyTTWx0ycsFXqcIUteNvGKVwAr5GAObyAAYifonkvRyXuXf
   cpjbfXXChWy3Wqy4tYa0eQoNG7oS9t6VRoASCdjfiDuWiaJCuvvSZ2vJh
   FdAr8sRWYJhME4SschRscGNwI3V+thJlrbXgeDTjFjYdgKlIWhGnZj9oz
   GsW8bL4VyR06jKPUnf6cdNPr3UalQzcUMJvlgy2ZW+DVyK+y8WQGrC0TF
   sPrQI7IrDwKjZt49VDPPd6ukjsrNR5eQomT713cd7eL5tyo6idNK7AkUk
   A==;
X-CSE-ConnectionGUID: z6bAk8snTkqZpVn/83tZUQ==
X-CSE-MsgGUID: ZhI7hfxQSo+wdxNmFffEpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80933003"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="80933003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 21:54:08 -0700
X-CSE-ConnectionGUID: t86buG7KRDOfKWMPxqp2/g==
X-CSE-MsgGUID: rto5SXQDTdy1v0cLjxALFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="238127628"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2026 21:54:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHww0-00000000Acu-0jCU;
	Wed, 29 Apr 2026 04:54:04 +0000
Date: Wed, 29 Apr 2026 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 6/14] Warning:
 fs/bcachefs/btree/cache.c:1245 function parameter 'flags' not described in
 'bch2_btree_node_get'
Message-ID: <202604291259.InfD9HkO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   dad5f56c6956d94ac360687aaf038f547befe321
commit: fac287274531b22eddb29ac7e9f45434660cc2f4 [6/14] bcachefs: BTREE_ITER_nofill
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291259.InfD9HkO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291259.InfD9HkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291259.InfD9HkO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/btree/cache.c:1245 function parameter 'flags' not described in 'bch2_btree_node_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
