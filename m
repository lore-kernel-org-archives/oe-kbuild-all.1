Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C972F39B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328801; cv=none; b=nygCPgLzritzM2UwVf5svCsuJZvO088ZUpVXydmgoIRs5kzUPTQ5w/tThd+NC3SlR+yBXvylre10kqNT2kSIrwF4ux+gnEYaMBiozFU3yPLlD+zEXiAG+2QvgcP0cTDlh4oSS1ueFkgIKjH78LrBgZB42y+RjWqa/KKgJEI81Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328801; c=relaxed/simple;
	bh=QaBdO6q4zyKgCi2gmQUP5Iigsz6zT1mytoZuMRU/pdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/yYKmiVg9Demj3F45wrKkzSwpJVZv8bLJPwRCJjJK1AQ7bX4fwdIQph/rfZzmTjxWPuhjGYmotwCZYhpnr8EjQC+MSTqla8EfDJmCu34xtsFAg2e75O0RSTX9hwCyMES8P5EqgLT2LbRFjdoKHofkRXFmJANbgN+MuTjIKrQAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIYl8Mct; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIYl8Mct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771328799; x=1802864799;
  h=date:from:to:cc:subject:message-id;
  bh=QaBdO6q4zyKgCi2gmQUP5Iigsz6zT1mytoZuMRU/pdM=;
  b=nIYl8MctAa4mS3cNqoLcEcgcMwT8qCELDAMFgekfK226qJcZFp/HOJA2
   zu2Q8tb8xBaAg9strWwf7G6Z1b7rYjlD97r3x1VsdvF4/OggFcdvfFB8U
   LcfD4g5ZnETvyKO/5nofoPdDF7nwxE4zkhcBex/6uh4SwYJzKnZF5QcRE
   GZFa/0JvTQ/RitUegzpxeT1wpOckLgOfjbwiNJqQyKE+E+urDGbhDhhEV
   Oxg2zdQX3SjCkIhQndzFUOBqR/+swk/IoiEqCNUhlrSPXjg57HTvtT2JC
   jRCPYiP12fl7P6LjrHKjQnc6hICls20fcy7Vbfga25PCd8xEhx7AuyVMg
   Q==;
X-CSE-ConnectionGUID: 2CZXSqWOR2WAM6CE9yaM7w==
X-CSE-MsgGUID: dWNzAJ4UQHqBJA514QyBxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76248671"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76248671"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 03:46:38 -0800
X-CSE-ConnectionGUID: cONFQEECR4S08rnsMnwVsQ==
X-CSE-MsgGUID: froAPvmyTYuZE4VUwiWZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213098390"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2026 03:46:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsJXH-000000010tq-0J1l;
	Tue, 17 Feb 2026 11:46:35 +0000
Date: Tue, 17 Feb 2026 19:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 8/24] Warning:
 lib/raid/xor-core.c:76 expecting prototype for xor_register(). Prototype was
 for xor_force() instead
Message-ID: <202602171916.BS1vw88r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   eb7f59de015dce21199b34b5923bf0622c333915
commit: fbba2ba3b0f39e9998d7e8e7adf7cdbec144b78f [8/24] xor: remove macro abuse for XOR implementation registrations
config: arc-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171916.BS1vw88r-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171916.BS1vw88r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171916.BS1vw88r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/raid/xor-core.c:76 expecting prototype for xor_register(). Prototype was for xor_force() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
