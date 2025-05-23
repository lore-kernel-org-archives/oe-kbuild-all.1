Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41F1A315A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 20:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031091; cv=none; b=GgHO4VTULoAhku91CATYVRxRjgUc/U72fTvhL6gVbGXizwdVNm7IkGwaPjm2nKmrF1lOxGXORiJk+qk1MAeQATa4CRdIBKZJ71lquvy+7CvjZoLFnzjtiVUMWFhlBGVfonREAanxi/BZdX1ZzBNgnK965DqcBY3C8Xr7FOAgaI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031091; c=relaxed/simple;
	bh=o5TjSBuQPwQAIzqWNa4Khau4OownchyyujvMj+OMFcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQxhXxgpfg2Un5oJJCB+ZyLi0Ptd1fIuO8v9zP8NnLeJD5ZS8HULu76lpRt7k+R6/tb6ay1fGjoq7nhffuQc93uDVLE6e5+PFgw5PaJB6baXEFBFS6XGN0/lq52yv78fGh7BrP36GjvkOoxzkGyd3uwKR+5h7prrR/mhJBIYgCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+V2TgdV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+V2TgdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748031090; x=1779567090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5TjSBuQPwQAIzqWNa4Khau4OownchyyujvMj+OMFcI=;
  b=e+V2TgdVO7ihXB4C9Himuie0o6zshViePG4BVqPX3WOQb3POC0sI+GdR
   2q+fRK5WjNouSWE167y3UzQ0IT6zoxjSYwd4Xw5eOv7rxi4zsh/u07pmV
   i9nYPS0+gVZkGYUKP4qRqaL8sO6w4GUx+BR4CTKENYsz3NpOvIgSbFKus
   +DOciwZxb3Mxw7sT62PSaYWJvpmouEUX3l7wbET4NDpFcjcjQXNMsp6fI
   OEMollH14W0wM/vbFSPVIhK+50CUkovISx4QvaZ/f8G2RD/BFYifUiteW
   0jt9go75UQRtZVPz7sUfwkPwCbqdSvsKTnZF5bR7KgK11KrV5sDhsM1E+
   A==;
X-CSE-ConnectionGUID: pXmmDvkxTiOd9WhMJXS+pA==
X-CSE-MsgGUID: iC90b5AuSs2TfM3Hwlu8HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49349595"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="49349595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 13:11:29 -0700
X-CSE-ConnectionGUID: D9C6SkvLT7OUU6QOddh1iQ==
X-CSE-MsgGUID: IiJRYd8WQQeHpq7wteab1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="142301565"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 May 2025 13:11:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIYjm-000Qhc-03;
	Fri, 23 May 2025 20:11:26 +0000
Date: Sat, 24 May 2025 04:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20250522/clang-kstack-erase 12/15] WARNING: modpost:
 vmlinux: section mismatch in reference: smp_init+0xa (section: .text) ->
 up_late_init (section: .init.text)
Message-ID: <202505240443.rDnkyUm9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20250522/clang-kstack-erase
head:   681194c2c1e885a1eeaff640c0b3bcc071fea17d
commit: 18d9b0483506c238adfd8e7799daeb2f5303efb4 [12/15] init.h: Disable sanitizer coverage for __init and __head
config: x86_64-randconfig-078-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240443.rDnkyUm9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240443.rDnkyUm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240443.rDnkyUm9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: smp_init+0xa (section: .text) -> up_late_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: x86_numa_init+0xe (section: .text) -> memblock (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: x86_numa_init+0x19 (section: .text) -> memblock_set_node (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: deserialize_bitmap+0x1ba (section: .text) -> __memblock_reserve (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: deserialize_bitmap+0x1c7 (section: .text) -> memblock_reserved_mark_noinit (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
