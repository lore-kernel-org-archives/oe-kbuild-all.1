Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C61E2DAFB8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760385581; cv=none; b=rGa5q+46R0cL0d6wy0ZKPWVPeTr0cY4lyF4r9JURyX4i46/WZeoaA2dpLufGUYkAFYNw7atNVfBZqU22+XMXKPnKnE+0uVID8xkauPVm05nglymZQLUGVLJoHpdQ9ERvBbbWggOT6MH9gRQYe0aWQzNuT0jo7+wrYBxOMq3HXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760385581; c=relaxed/simple;
	bh=X1ZNzE6xAvST6sv7myFQ8E5nFxpuIlKBScXNiddyFEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxV8A6699KF5emrhfb7udbcr982hDJ/4CTh6blnw8V78PR8Dtu2C9WFQp3NeSRvr3abkgqMQ4cK8p6HuEBd75PCkdzB8dowKX2kTt7cRvHzX1a86FeGMlj0UqO9ZPH+OMWyT3LpFajm4tL8GSU4WH7mVyTeusuhZrOZwuWdJyI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3qNYcgE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3qNYcgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760385580; x=1791921580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1ZNzE6xAvST6sv7myFQ8E5nFxpuIlKBScXNiddyFEk=;
  b=X3qNYcgEADKTHUVns20O7Rv/cdcPJvL8vDK2jwsUqx8Y68i+lj2Q2lzJ
   krJXUJAjyFX/A+qsKNBBxJ/UDpl06UBSsSqGsStZzOgPdfqIY6Ry3k7bw
   enVv3rT1urM7CWLoKU+p7Dw9RvJLEmg0HZe6Ohijj7zJLPDQmrAADN3Ux
   nqVSjwpYvKZ8WEbvuD9vaet1OzWAw8Vdxv3nIb7atd7xJaHo/n63hWyCz
   71PaoJhfHlsPjGuoCemb9IKmuhDjElfm/W9kZcQNomhfRC/8a3PalN48h
   s1IlKM9kkLX43Ygo0NgdZQe8WAbnWNsjUaos2bqvzfWQjwXOExPGVshpf
   A==;
X-CSE-ConnectionGUID: v9b41CppQ5Gqk9E77FiD8A==
X-CSE-MsgGUID: 4jYhfR2eRYmnLZ6sOVq3hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62634465"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="62634465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 12:59:37 -0700
X-CSE-ConnectionGUID: jHy6c5HsRhWu8L1OpqRpNA==
X-CSE-MsgGUID: ul/ZPYLjSqC87kdTx42GTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="181702719"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Oct 2025 12:59:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Ohg-00020z-2w;
	Mon, 13 Oct 2025 19:59:32 +0000
Date: Tue, 14 Oct 2025 03:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uml-remove-32bit-pseudo-vdso 1/12] make[4]:
 *** No rule to make target 'usr/init', needed by 'usr/initramfs_data.cpio'.
Message-ID: <202510140352.9136LO46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uml-remove-32bit-pseudo-vdso
head:   de3e88ecf53901519765f2d06b52b8984a90da9e
commit: ce3cebd9b432705476c979f05d48fe90bec1b1a0 [1/12] testing
config: riscv-randconfig-002-20251014 (https://download.01.org/0day-ci/archive/20251014/202510140352.9136LO46-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140352.9136LO46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140352.9136LO46-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'usr/init', needed by 'usr/initramfs_data.cpio'.
   make[4]: Target 'usr/' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
