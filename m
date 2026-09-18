Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F437E2FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730786; cv=none; b=TZrTsA3+OVX5KI5XpkTJOh68g9EYzEDeuFSyWiJy5k2VnOA8I2mY4Ojptjctv4CN7+oL32wQQKG4+NXtM6FnGVjeJpfSdtU4V5t3fpOJVyi2uSFhAp7TG/exHPsTKcQRSuOvXhC4rdqu4RLjIbewLTWX5ZDYS2w7czZp/KFCEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730786; c=relaxed/simple;
	bh=NebaDxsq5ynTt87keVX2kjzq0sd327B4eHRB2dK2YZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gevRXZUAV3tg0wgck9/nOp98LkXi63pQq2q3iPpl+zv2QGjALrwpPXCffb+xgJGQwd0F0N5Oczy+a9mfsjhyDh3EB/ZUKvifiWFKaPnrxRTQouEIwIiUmU2wOOUCz31s7FPDHXlUc+3lxKjPEvqJ69rHpYA5IL4dfESvu/GNtA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy2IztZh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy2IztZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789730781; x=1821266781;
  h=date:from:to:cc:subject:message-id;
  bh=NebaDxsq5ynTt87keVX2kjzq0sd327B4eHRB2dK2YZ8=;
  b=Oy2IztZh+IDz+wqnr6FaZps2EP+Yy+fE+acqGtlxRTRCWfQGPC1Q5+jO
   i/7T13gz+0rRrchEi2dGCpcJk+Knzz0u0zy0jFJBkohGoypLcUOGilRbz
   OdL3dM0UzgHuPw0SOUBhqgdQuR2cTbCPuoa4pGFUkgr0+tL5iNc/9OYsq
   3EHRbTPvJgv8h0hFYiJPF4KvF9q8v2p0bPWw5LVxKl2nHcZ93d6BP5a+z
   DofNkceb9QPyc5PiRv1D6hWZUyYKOkB9biJsOv1tLK+bF93lpZl0Go6M2
   urZJp902H/KB2AYH+IhZXK5UfSHB9p0gytHWW4/5Tf7DGB6MgJ4Dorm+V
   g==;
X-CSE-ConnectionGUID: Hk74unl2SyKYqiFIqJCAQg==
X-CSE-MsgGUID: W3TtoJy5SeyJdzwsl09sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="90096894"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="90096894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:26:19 -0700
X-CSE-ConnectionGUID: fAtG7AWhTCi3YMUIo9WPGg==
X-CSE-MsgGUID: EA3tqYvdSSydeGArNQIPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="297829607"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2026 04:26:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7WjO-000000009hI-3UJa;
	Fri, 18 Sep 2026 11:26:14 +0000
Date: Fri, 18 Sep 2026 19:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>
Subject: fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol
 'bpf_real_data_inode' was not declared. Should it be static?
Message-ID: <202609181925.AkvGgS6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 3f8c65b06fafc3f779abda5f7b81707411d05d4c bpf: have bpf_real_data_inode() take a struct file
date:   3 months ago
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181925.AkvGgS6u-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181925.AkvGgS6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f8c65b06faf ("bpf: have bpf_real_data_inode() take a struct file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181925.AkvGgS6u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be static?

vim +/bpf_real_data_inode +377 fs/bpf_fs_kfuncs.c

   361	
   362	/**
   363	 * bpf_real_data_inode - get the real inode hosting a file's data
   364	 * @file: file to resolve
   365	 *
   366	 * Resolve @file to the inode that hosts its data. For a regular file on a
   367	 * union/overlay filesystem this is the underlying (upper or lower) inode that
   368	 * stores the data, not the overlay inode.
   369	 *
   370	 * Data resolution only applies to regular files. For a non-regular file (e.g.
   371	 * a device node, fifo or socket) on a union/overlay filesystem the overlay
   372	 * inode itself is returned; for any file on a non-union filesystem the inode
   373	 * attached to @file is returned.
   374	 *
   375	 * Return: The inode hosting @file's data, or NULL.
   376	 */
 > 377	__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
   378	{
   379		return d_real_inode(file_dentry(file));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
