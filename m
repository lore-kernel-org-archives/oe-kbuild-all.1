Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B408620E026
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211618; cv=none; b=BymNVFEF26rXHJ+s4uv/xxTUiTxFOPfS7V5Ghls7eNUy7EZy7zXZvM+oxJUIYIU8ilu3h3gZHGiJbnoDr7G1jb1TfgOAJ+VvVAS4D8gxGyO3YaF2vZ0Cuzj/SPxqAd7lqMBIO63hb9BE2oYAzzPZsKz+1hF6PiGDgQXH2rYCM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211618; c=relaxed/simple;
	bh=E113uNSb16MB86qrdvlYNRv48Iz3TkaXU9ksK1YN2L8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVOAl64OxxPrFUnNjXHT2JhRWlDwbzNUw+dk1ILliAl3D5SdwLDTUt4qd7Ms2ilCJZIB0fvuzfeVtTNKLfyuHHJJTADvYE5Lqqm0g3xA0O/rIg1pjDegCsRE9JREyCAHTacjLccxUq4tM2T6NiVFf20iKk2d9Ks7y3XaE/Xr4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcpysqga; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcpysqga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747211617; x=1778747617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E113uNSb16MB86qrdvlYNRv48Iz3TkaXU9ksK1YN2L8=;
  b=ZcpysqgaG4v/eY85nBZDtK10Bqq+ZUMD1tfa8Q8YuZbJtCbrSHvG045K
   Sr0jToeIsbIPaWYMNbfy+Dk2ROdEev6Qag8skX1ktX/4Q0MjJhEjEHStf
   vIT5jGAevRskYiCUPwduvPMS4IajBabeL+qk6jIWmjD5wGgnqYkjG+0TK
   9mKSyQAlweMOV8zRKh/JbNtFn15U97WBzv/NpiHwL0PAkewr9BWwbuV4L
   lq7B8PvD16YzB0H4Oa/8hxoX9+5T+s/wh4pFZ2Z4USMsNjGDzwy31d5vb
   83AsU1EJxDozCNUvYQkfqbOzzv+H+pb5v9S9RcQJcSh6OaLk72+cfAYD6
   A==;
X-CSE-ConnectionGUID: GVgxYSB+SMGZC+3aKdQ6YA==
X-CSE-MsgGUID: Ucs/Rz5zQi2OI/U6IKHlWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48963821"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48963821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:33:37 -0700
X-CSE-ConnectionGUID: sdHszVIuTrml36fzGZpetA==
X-CSE-MsgGUID: tAA+L45DTAK1m7Tl/HG08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142730421"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2025 01:33:36 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF7YS-00017q-2r;
	Wed, 14 May 2025 08:33:32 +0000
Date: Wed, 14 May 2025 16:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-02 0/1]
 arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling
 call from callable instruction with modified stack frame
Message-ID: <202505141654.oqnncrmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-02
head:   30a9c932ac88484e9976b647a161971cc850ad41
commit: 7e44e7065263c3baf287e7ff267a610cccde7544 [0/1] x86/xen: add central hypercall functions
config: x86_64-buildonly-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141654.oqnncrmb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141654.oqnncrmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141654.oqnncrmb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
