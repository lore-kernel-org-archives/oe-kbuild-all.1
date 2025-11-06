Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344D274B2B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762413760; cv=none; b=g3PnA40Yv3ipzAEnRZDBFWIgEWPrdZxTc59fnspMhhqofvi79tsd/hp5wJGNo4XtU2naOAXDlsEd5wPLKA1Iw4K8TVeFdUlfplBoQo8HVJ86b4TuP9tE29Vmb0bZ1WprXfiFgt0Q//VPLYTP8DmN+rpqHE8VZyAHL4HXeuua4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762413760; c=relaxed/simple;
	bh=KaXB+jIMksQFC2teV41bZKhHDnW3c7eaf0GleUwPvsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhDO+HEr9fvM7htJiAS5rCN8q3I4abe/Gzexy7/Dirgt5ASfRo3+JpsqXHYREfPdwe/sB0oOSql102nZMpWKwwXVXKxHBGkWE9UAia3G+A7trH32ui1sc1gJ4trGgJG+wNM4bcZmXAKcpphz61bKDgMYPo3e0HNcFf0NP/Lh7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcREtsSf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcREtsSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762413758; x=1793949758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaXB+jIMksQFC2teV41bZKhHDnW3c7eaf0GleUwPvsU=;
  b=WcREtsSfmBADUcSx8puqCjYdKnyq1p76pj085HJ0U6v323VhIVMO0GqP
   tAE5rE7I3DD1qi1Za/DosPrvf4WAxcMIC3cdtYhc03f3j/47fJP5eaQ5H
   VFMA/nZZZV3fqsUbR6+PmRFMQ7nHwOPwTcdptF4YQYgtDnhI3NZIX8YKn
   +vRhU6wGmC2qd6UkHCuJ640KTK2RTCiOr9KSlx5CJbOLYakNI49lUNMvx
   /XAZhlvcH9wL3lBXRn3/TSM7GtWf0htGVDvOm7U9wa7PF8ZB/JyRhrAHD
   bJyopocrSaXs0oKs9bfqZluQ7zijPewu2JBHUC+bXOLqCTsmr5rBpVw/X
   Q==;
X-CSE-ConnectionGUID: kT3y4GXPSvGZtQrzir61VQ==
X-CSE-MsgGUID: Sl885BtFTOu6SHSeoZohLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64639845"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64639845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:22:37 -0800
X-CSE-ConnectionGUID: XJoQoEqPQYeCOWEAVIT6sg==
X-CSE-MsgGUID: mlsWngrUTeCq189xBqJlkw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2025 23:22:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGuKI-000Tbe-2T;
	Thu, 06 Nov 2025 07:22:34 +0000
Date: Thu, 6 Nov 2025 15:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6703/6818] Warning: kernel/nstree.c:353 expecting
 prototype for ns_tree_gen_id(). Prototype was for __ns_tree_gen_id() instead
Message-ID: <202511061542.0LO7xKs8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
commit: 0d0f6cd98c646b34bd754e062f3350c14651c91f [6703/6818] Merge branch 'docs-next' of git://git.lwn.net/linux.git
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511061542.0LO7xKs8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061542.0LO7xKs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061542.0LO7xKs8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/nstree.c:325 function parameter 'ns_tree' not described in '__ns_tree_adjoined_rcu'
   Warning: kernel/nstree.c:325 expecting prototype for ns_tree_adjoined_rcu(). Prototype was for __ns_tree_adjoined_rcu() instead
>> Warning: kernel/nstree.c:353 expecting prototype for ns_tree_gen_id(). Prototype was for __ns_tree_gen_id() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
