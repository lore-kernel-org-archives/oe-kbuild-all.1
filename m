Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937421D5143
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735218863; cv=none; b=o4n+zuZWE9cVFtfND/p2Abw0G7AFBnFNQ1NmDdyl2LcPd4dsNPS3iLMe0WY6ulzs15mY6sje4qmWkmluF3ZGY6WWSlMbcFSlN2HIQmM4SCngYy8QZ7pCUzcVa6b8cIiVAmGGEeRU9p51A7BrXtm+uvUMcHQTvvc0rBa38sfPGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735218863; c=relaxed/simple;
	bh=Oe02r+DdfCXuXoCIAtatNkcP9IHe1BXCGTCm8vVE8hY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5+1/qd2LOICMNn4yXNmZvgLlElkEX/G4eEk8b6THaAJuE/FW/sgquOuUnss/Q32cjMTVG2+jNlTXigRR7VxJVAsBf5bNt4V5t2O7QHo0mXsw89XY894n25hfjqW0lXqlGLgilB9a6tgyqAfL7gMERyBXiHPex9iJ0f+CyR2tdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fti7O+3x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fti7O+3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735218861; x=1766754861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oe02r+DdfCXuXoCIAtatNkcP9IHe1BXCGTCm8vVE8hY=;
  b=Fti7O+3xS13rVZI4l1H8SR5KqU5gSA/ajzgZ0OWYBqI/zWyeRsfUJYSr
   53OyZx2+kmOnZOlgZOyMfvxIOZm7cH5ucTYyeAb9SDVm6edzHc4/B4BMO
   +l0wtIgL2RqseveYdpWGBovh+OxdkV/ySzLY05ogzSC9EqtB858beIyzX
   o18Hl2azZfLHqT9SS8CGY6k46BXjCRmKcQVaahVsK7oTrIx5osvmpFhWR
   CTSIlDTPeFyigxipptBiaep/ox7ZMoscRvx4bAqFVmZLyOFbP8UQl7668
   sF5Rq+ikCXQiRwx73wuL/kIB9+7GRajMUoiw5+HhaBI9jaS1016yEIHzr
   g==;
X-CSE-ConnectionGUID: CUWlBoajTsijvVae4CVG9A==
X-CSE-MsgGUID: zbWQID+DQDO1OwGTjjKS3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35773081"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35773081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 05:14:18 -0800
X-CSE-ConnectionGUID: 1NtUEck3S6+LZEVKx0VaYQ==
X-CSE-MsgGUID: w6CoDlsRT42xrXpmmDF1Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100399437"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Dec 2024 05:14:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQngs-0002ag-1X;
	Thu, 26 Dec 2024 13:14:14 +0000
Date: Thu, 26 Dec 2024 21:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1632/5236] fs/bcachefs/btree_trans_commit.o:
 warning: objtool: bch2_trans_commit_write_locked.isra.0+0xf54: return with
 modified stack frame
Message-ID: <202412262110.z2qHvawz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: e398d6fb0f5aace9f5d181fab0b9dfb7c1025938 [1632/5236] bcachefs: bch2_trans_verify_not_unlocked_or_in_restart()
config: loongarch-randconfig-r052-20241225 (https://download.01.org/0day-ci/archive/20241226/202412262110.z2qHvawz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262110.z2qHvawz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412262110.z2qHvawz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: bch2_trans_commit_write_locked.isra.0+0xf54: return with modified stack frame
   fs/bcachefs/btree_trans_commit.o: warning: objtool: do_bch2_trans_commit.isra.0+0x230: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16
   fs/bcachefs/btree_trans_commit.o: warning: objtool: __bch2_trans_commit+0x48: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
