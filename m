Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1B214A94
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421304; cv=none; b=MsKKTBKNqdZng/7G4im+57D2eucrCweaSlD/5sxKfYLX7dWmrOV1RvGjkYAgHufgfAnAmGazZ4k2MZYw1ux1leDEYOftVaXdnVNiOzvLqGKrh+0XY53WfHcgoI3VuxFwCDd+HxoDSZcYsdlrx4kth3htlPCHJLItWEoafqKQ5Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421304; c=relaxed/simple;
	bh=wbf7ytDbOpFa9ZD1MPjc3wSqqLhVd37/WD3BjBDiUGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBXyzVua3nzHt7O0SZp7Tw5Egw5yAgoE0E0v7H1lUx3ZpmVbFVpK54Mkyj4hzvW9RvGdAzTiRqW1YLjkLliMh15CT28ei4W28+PuBArWFMBQT5VkJOs6+ZRxG5K00Sxp0ZainDj2sx7srKx8QzRk/PKF3yNsj0DNKm4SSrYpqrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8PFlb8R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8PFlb8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762421303; x=1793957303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbf7ytDbOpFa9ZD1MPjc3wSqqLhVd37/WD3BjBDiUGw=;
  b=K8PFlb8Rz9oj4R/qnx5zNlrrZNAabXAq6yER2PiYR+yiqCX/lvDZman0
   f9AHKmt26Wrkqa4a/pP9qt2VWCQ7KxOEa6B4mwO73vwuwyM6vZD9gafur
   aeLTinbH7JHZPC+UOyfQuOqp4wjhUEmTK8/pjmHWFEkFO8CZKr6X92Zwz
   9u+1EEQfhhhURqswstBF0PzhDwx3cmF5lct8rm+NdB6DSWp1rz6sQlx6S
   W7OGhRM9r5Z8lqlNE/ya6jc2bJWW3e4HBO9gXEKWeFwNEdwNi9I/MG4bJ
   inRu1b1B8JAJlKQBGBDsiqO0DDo1pZyYcIDCksmxFlAQi3spo/eGlqcJd
   A==;
X-CSE-ConnectionGUID: R/NxOu2HQR2fYA0OKsKSww==
X-CSE-MsgGUID: FlC6XvSjTY2vSHwrMIuYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64591154"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64591154"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:28:22 -0800
X-CSE-ConnectionGUID: KswzJpTBRZyh6w7Cd/sisA==
X-CSE-MsgGUID: YBdNx50BSYaFNQttrImmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="218471065"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2025 01:28:21 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGwHi-000Tia-2C;
	Thu, 06 Nov 2025 09:28:06 +0000
Date: Thu, 6 Nov 2025 17:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6747/6818] Warning:
 security/smack/smack_access.c:583 function parameter 'gfp' not described in
 'smk_import_allocated_label'
Message-ID: <202511061746.dPegBnNf-lkp@intel.com>
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
commit: e2b6c40d09c5967f33dbc4d8118889f205b2587d [6747/6818] Merge branch 'next' of https://github.com/cschaufler/smack-next
config: xtensa-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061746.dPegBnNf-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061746.dPegBnNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061746.dPegBnNf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_access.c:583 function parameter 'gfp' not described in 'smk_import_allocated_label'
>> Warning: security/smack/smack_access.c:583 expecting prototype for smk_import_valid_allocated_label(). Prototype was for smk_import_allocated_label() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
