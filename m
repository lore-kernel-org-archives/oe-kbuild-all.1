Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9B209F59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295766; cv=none; b=u9bIGu7MnhQ0s7E/KU83/2IinZwe91sZ/FZRFHFMNAR5bt1xKbrc3adRZ3muo7HQ1yyH50KkVxodm6oOEISUutIGAcCNuja00xp88wjEw+2rE+mo500cB5it1GtZQQ3RGcmwXBhTXNYBetBlmzhpuWkK53SMm0b+J8ErU253f8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295766; c=relaxed/simple;
	bh=rCXxlbxqlIFkgaqSOQvo88FjPUW9pxV6uB6MqfAqg3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEs+buksJaAB50UK6/2CuBIp/s1Nv0Abm/no1ufqFD3i77Cay2VgwWLqIUFUcT4EU8JL7FZXNMtEvjIAdpkGMj4QNEBE1rJ45+qYlezMw4g7AfC/EmPScWjj/vx18r+rkIibmKIa9sNI09O3jFgMD1P1rAE+vA9PJ5IqpHnS/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mL9rlHjg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mL9rlHjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295764; x=1773831764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rCXxlbxqlIFkgaqSOQvo88FjPUW9pxV6uB6MqfAqg3w=;
  b=mL9rlHjgim5uSvwSsQpcodjCW3AGF5HOC6tgFFB1Q/mqZdMKnSXQZLyY
   eSE67IwQ8T7xNpv413dOqkO6vMlvBumaqn45L8zNC9cQiJmd+n6ARqeBH
   cPiasTF0qpLOoWMeqHQ2dDGownhWO8HpToP05Z8X/5bVoD3yVb3o+g1d9
   bHpmq3hp1JwLydZcYMAYcDde9gNolc9d3f273OumVG5iwQlOqbOOnAyqZ
   8ipy5V+Qw/LWqXIefmPwrz/cbiRAlX5xCLIpRPsGXXoRyF3VCnmihT3yo
   94wwWnqrL+rArIIlnMDvpWBo+okVM25wiehbqQE+N5vE91ZRHP52sGbQo
   Q==;
X-CSE-ConnectionGUID: D0fpqJ3aR1a7Q6xYi9erIg==
X-CSE-MsgGUID: 6R+H3lQWRHmaAoIkM44Sjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43566080"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43566080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 04:02:41 -0700
X-CSE-ConnectionGUID: 5mXd6NAZRI2TLtm/srFYhg==
X-CSE-MsgGUID: akDTqNWxSQKZYop10V1KOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122730918"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2025 04:02:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuUiS-000Dgf-2q;
	Tue, 18 Mar 2025 11:02:36 +0000
Date: Tue, 18 Mar 2025 19:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 63/65] WARNING: modpost: vmlinux
 (.gnu.linkonce.prop.__dyndbg_descriptors): unexpected non-allocatable
 section.
Message-ID: <202503181851.vBZo5lPK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   ad63ebc0b5699b5e64f4f96e8c56cf6e8353f6dc
commit: 456774fd77ef30cd5513a1a883bcd42c4bccf664 [63/65] dyndbg: (RFC, POC) use HEADERED_SECTION on __dyndbg_descriptors
config: xtensa-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181851.vBZo5lPK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181851.vBZo5lPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181851.vBZo5lPK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: __do_trace_initcall_level+0x30 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
>> WARNING: modpost: vmlinux (.gnu.linkonce.prop.__dyndbg_descriptors): unexpected non-allocatable section.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
