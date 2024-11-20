Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6117F5FEED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080596; cv=none; b=TOtgAcMsnx0NEL6GRGqZHd4ynKN/aTGMyDksIEL1vAZNujF0s/o3bg8jt2EvXjD9KHkJhCyMqyOuQCi/yzNhAVc2LuaL2CkW2DE12UxWILrSjTXgdit613pbe6eSY8WIPRZXrV8WlEZ/JOi67GcZcvMPojychNsJ0NrlhAe7228=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080596; c=relaxed/simple;
	bh=ozwYsDFoivCaOARgTtPQcJ3Xb4tg1vsqDK8If8Cla70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kp02DDL5oSiyT0Y+fzC/qbh5/3thLxV8kGjDOlplsrBuA46vhc2bqK7giRs1x7H1tW7mky02l/01GLJYzK5qkxUPvHbvwzgQ+iN9Em4Hxdc3r167GusktGeIwgz5cGf1ut+2E5+YiXzbTtjk6MxEOccmLNRpd0hD12r0dvQSkKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENjGB3U4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENjGB3U4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732080594; x=1763616594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ozwYsDFoivCaOARgTtPQcJ3Xb4tg1vsqDK8If8Cla70=;
  b=ENjGB3U4LJ2I87TjC4yUeHK9R09/u+0MDg9r9XiShLyjZ/S8ne6y7zbN
   kSoDCAa9BfvNXMklFxAEwgmTUMrTSSA2GJYFtAsMnzpCa/lN0Klr3lZcG
   h0wrhhwM+rQa5bRBE39qsyIQZKCznUkltzAR+mKIlGO8avL0SgpVA3/w3
   kiN0ALTGDfBchiOy5LtZn+2Tm17+pc4VtBG0tlGYuvgCZoWffCspdqM3O
   eHuA6AEGPtfKQmndcF3UM2KZXyXdQ+yDrrwg8gpsPQ12irya3HXohe5TX
   sIJDUBIzR3OI5HDnSNQlv6acIEcJDtLoH2eHd74fRjz1MyM+YDUJmBbTr
   Q==;
X-CSE-ConnectionGUID: KB2TNsk+SKOie2HejynjCQ==
X-CSE-MsgGUID: DIFC1OEYRxGsjZy0OfJpGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31978250"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31978250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 21:29:53 -0800
X-CSE-ConnectionGUID: TcKeIbmkQk2LHKSNuuwpmg==
X-CSE-MsgGUID: 3N9FUOezTvS/PXoTG728iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="89739637"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Nov 2024 21:29:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDdHh-0000V7-2F;
	Wed, 20 Nov 2024 05:29:49 +0000
Date: Wed, 20 Nov 2024 13:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] fs/ext4/inode.c:3585:24: sparse:
 sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be
 static?
Message-ID: <202411201344.6SAp7KFy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   76e29fd0dc6d0f5cf1dd449e526e6dba2d726379
commit: a38e9381cf2ba6f3300c716b1cff4551bec0fbdf [1474/1474] ext4: implement buffered read iomap path
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241120/202411201344.6SAp7KFy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201344.6SAp7KFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201344.6SAp7KFy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3585:24: sparse: sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?

vim +/ext4_iomap_buffered_read_ops +3585 fs/ext4/inode.c

  3584	
> 3585	const struct iomap_ops ext4_iomap_buffered_read_ops = {
  3586		.iomap_begin = ext4_iomap_buffered_io_begin,
  3587	};
  3588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
