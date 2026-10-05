Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566D547073
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161893; cv=none; b=qM/Qspbe15SE/N7BT6+sXitEQGj4anyDT2/ojyhVnalnaJJ+przuI+FvDPwH7OwhJE3ExZc08fjfPCEaapsSeigqHKy9U2QHHxD2Gd6xoqNJjpmk0EIMbe96xtKg5d74ctEr1M74L8epkFmIfVSD5Ke3W3QXpQDuaFXjZsEkh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161893; c=relaxed/simple;
	bh=JeYbh+Qd0C5dLl3iJdr0/zzU0QiphK5t+eNB5TL/V+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H9KjLKtCuZUndCX0PAx9oIx3emDX3ya7t0qrHFSXyqEek/c+NgZEaGaHTbJEG/eOv0Yi3xCixqNJqI0l0wmqWY+kUZd90/k7JVLDBTl6FxgLAu6OkpVRSXHDTK/phGcNxds7QDExdK2lShAFOZJ0T1I5qDATy94VhMafK6IBNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3SrPczb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3SrPczb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791161892; x=1822697892;
  h=date:from:to:cc:subject:message-id;
  bh=JeYbh+Qd0C5dLl3iJdr0/zzU0QiphK5t+eNB5TL/V+Q=;
  b=Q3SrPczbunASnRimiNUM8mcYuGSTJ8clsr8r3vUtmfT4EoWxwK62SsD2
   c3wT8fZo5Xto1UsezNaKgUmn9PTyy8dDZYNPbid9WwfYv1g4TLacRoIDO
   9wv2taCFpanP3vRq/F2YQndd0P45n/Y/CZZ+IduGp/Knp4UJE1C4iLF7k
   ec4qPLK3CeUgNGbppXS8jvk3NGTqYgUTFfNGk5zgVRjHqLKJUdq/QrlpL
   JEi5Vl0y58gC4obcMWqVwWnN5as48DmoSGjX1D1nDZtY37jUPcvIqOhUq
   yLIjqodXofzmVA/l2/UaD+0U3nA3oarlQ7fow0yzn9OXU2Id59lrFWF1U
   A==;
X-CSE-ConnectionGUID: XNaPGCYoTQWjRZPOYAQ00g==
X-CSE-MsgGUID: dpWkZ0V3SRq9SxLdraR1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="108208512"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="108208512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 17:58:11 -0700
X-CSE-ConnectionGUID: LTGX4+IsRGOLbDmXJGMx+g==
X-CSE-MsgGUID: goImnDXrQgK5egEFBJ2+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="306199467"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2026 17:58:10 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDX1r-000000000VH-3Iha;
	Mon, 05 Oct 2026 00:58:07 +0000
Date: Mon, 05 Oct 2026 02:57:10 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.all 356/378] fs/nullfs.c:55:14: error: use
 of undeclared identifier 'nullfs_nolease'; did you mean 'nullfs_nolock'?
Message-ID: <202610050233.4otV9Kjb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   4852668f27dd07a38b753c3ad673ffb0bc3c00ec
commit: 580de1b24ab7a3e0cb73db6c341bf40d7f683797 [356/378] nullfs: add an empty immutable regular file
config: i386-randconfig-r2307-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050233.4otV9Kjb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050233.4otV9Kjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050233.4otV9Kjb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nullfs.c:55:14: error: use of undeclared identifier 'nullfs_nolease'; did you mean 'nullfs_nolock'?
      55 |         .setlease       = nullfs_nolease,
         |                           ^~~~~~~~~~~~~~
         |                           nullfs_nolock
   fs/nullfs.c:26:12: note: 'nullfs_nolock' declared here
      26 | static int nullfs_nolock(struct file *file, int cmd, struct file_lock *fl)
         |            ^
>> fs/nullfs.c:55:14: error: incompatible function pointer types initializing 'int (*)(struct file *, int, struct file_lease **, void **)' with an expression of type 'int (struct file *, int, struct file_lock *)' [-Wincompatible-function-pointer-types]
      55 |         .setlease       = nullfs_nolease,
         |                           ^~~~~~~~~~~~~~
   2 errors generated.


vim +55 fs/nullfs.c

    47	
    48	/* an empty regular file, with the same refusals as the directory */
    49	static const struct file_operations nullfs_file_operations = {
    50		.llseek		= generic_file_llseek,
    51		.read_iter	= nullfs_file_read_iter,
    52		.fsync		= noop_fsync,
    53		.lock		= nullfs_nolock,
    54		.flock		= nullfs_nolock,
  > 55		.setlease	= nullfs_nolease,
    56	};
    57	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
