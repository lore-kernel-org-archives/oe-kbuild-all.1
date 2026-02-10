Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5A52264D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687433; cv=none; b=E6FRuf6eStJa1A9QoYTtxdj2RsLqTwEqUzWRaS/XidrVHexxT9HbbnsApiIZYKBezgudkVLjmD9t0450nHUSn+t5TSpO5mFa/Fu0Y0jv9fuK+1/3Hp9yK6ervF1MsVXza8QjjfYVoxRNidTUxk27c1qrqCCeu4Wa3sBjUzYSpVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687433; c=relaxed/simple;
	bh=1kfJT7f5n8WsXmLr0/vm1PwkD0pZ0BfcL/YtCWwIBx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mISjdiE+vFeQYiAa7tBgpD5fYryR0pq1o9LZIuaCsY4DYlyc+vb0mxeLd9rUiOO1bbiJ9MSWCTiV1zc9P/qiC4RoNzo/cllgaWXtabWN9urt8vt83PYNR2+VIT0p2vH4PJuEVby5HE6b53Wk5JhRgqYqWkCbGJ9VyWPkJGLyO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwLFfxv1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwLFfxv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770687432; x=1802223432;
  h=date:from:to:cc:subject:message-id;
  bh=1kfJT7f5n8WsXmLr0/vm1PwkD0pZ0BfcL/YtCWwIBx8=;
  b=MwLFfxv1A94ILJ+mnfWp05kwIkYcwd/GEPksFn1lpPsMpTk4xhxLqvxw
   FiDmpssf7rnvVqe9RYOPYQ6bqVnc0wtGtz04wW+v7dqIlYqrZTxLkMGK0
   d5/yp8Vt7+upusQfCFu7n/Q8Sy0IrpCpxl8QKsU9Nx5aIzEzzTgAvTdsM
   WMCPofISJJfvcqfuUh3JJJJDWnBdrcmB7s3YGS/drjy3WtDvX2oln0H0l
   BhrnGcIxDGQaX4V7kxvbT4azASNY2oLw6THHqGnAhwPVnecMUj3xL5OWK
   SahOUIDjsQWy2WGSwf//YknZ4x5Xqr91KsdbCJUCwIJTyyzmLG/nkJ9xr
   Q==;
X-CSE-ConnectionGUID: qsrYUBaqTiKJfbeo9XFiVg==
X-CSE-MsgGUID: onsD26QuTKS9OmgY7dK3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75433290"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75433290"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:37:11 -0800
X-CSE-ConnectionGUID: Fo+D7jWLRMqJvg2JJBmKGw==
X-CSE-MsgGUID: 9OMkQL9JTE2nDzbuDRRd4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210861068"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 17:37:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpcgd-00000000oUw-1aAB;
	Tue, 10 Feb 2026 01:37:07 +0000
Date: Tue, 10 Feb 2026 09:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 6/14] kernel/container.c:148:36:
 warning: 'container_proc_ops' defined but not used
Message-ID: <202602100913.K0fVq1Rf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   9977221e4d17485700c9229681297e628847d16b
commit: 067ba90233827a93e714333ba80f765a771ea934 [6/14] containers: Provide /proc/containers
config: parisc-randconfig-002-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100913.K0fVq1Rf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100913.K0fVq1Rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100913.K0fVq1Rf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/container.c: In function 'create_container':
   kernel/container.c:375:18: error: incompatible types when assigning to type 'seqcount_t' {aka 'struct seqcount'} from type 'seqcount_spinlock_t' {aka 'struct seqcount_spinlock'}
     375 |         c->seq = fs->seq.seqcount;
         |                  ^~
   kernel/container.c: At top level:
>> kernel/container.c:148:36: warning: 'container_proc_ops' defined but not used [-Wunused-const-variable=]
     148 | static const struct seq_operations container_proc_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/container_proc_ops +148 kernel/container.c

   147	
 > 148	static const struct seq_operations container_proc_ops = {
   149		.start	= container_proc_start,
   150		.next	= container_proc_next,
   151		.stop	= container_proc_stop,
   152		.show	= container_proc_show,
   153	};
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
