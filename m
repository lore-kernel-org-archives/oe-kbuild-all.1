Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A723B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755910989; cv=none; b=ChLfF/eLIf2GTBDTO01BoNaWpmuhT7rtMrqJFvGzZhT/Bi8BCD9ethYWtFB/QcwGRi0C9BWVc6YKppj3sNCVorugMAyLRUJIbsw8ZAJ9clqXoNKjbyYjOJFvXTR05aQrhBPCYALX8MoeuIFjfPTvweb88yEtVpf15TZpVVbjrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755910989; c=relaxed/simple;
	bh=SYHpZAOrx2n3KFZ9ZFcdH5x8F0RDA01iXoWEQyIRLIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAnozY80586kF808PfH+bLv2FATJXCmFd7ksFgTrzGl136iVjTMUps+rfwAYUe8SybfY99do2kLSUc0z1Cp/JpZ0aeC4kLTWakK4ZTcUknZPCYiukeh2r9WW0u3cPjHB6r/eeoADfvThWQ6TPzS8LQOH/9AEn26dfHCYLk22Q3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8+iz4Br; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8+iz4Br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755910988; x=1787446988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYHpZAOrx2n3KFZ9ZFcdH5x8F0RDA01iXoWEQyIRLIk=;
  b=i8+iz4BrvQyXub+WKAn5TbG66wLRsa8WpWzg5k0ngrkARanR5Z64qe5A
   nrZR1iCnc2PakAwIAiZKNv5vF/y3SU0WXRMm7eThRBq08cGNOSTY3oNgH
   gTXuuRYie1WJyqshGL297Go6z1YRVUQu1YOC6UnlVzgRo26MnEMZNRee4
   27qggyPi5llTSLfC4y7dFH73uS2kj2ZY2ELS1r6d3HW6gIjGgvlQWTfl8
   u01QamxIBCyj1+XSDhorEKLZkjVdIIYCnXu3bO+wZGhHhtJenlEqaIvZ5
   bMNi57PKlU0tfoOVxwU6yE2lrpSDtAmoHFOUr3aSDvTdDCCviTT2r0hXu
   Q==;
X-CSE-ConnectionGUID: zV25oqjaTFaakauDEmoyBQ==
X-CSE-MsgGUID: R9Fn3eowTUiNt48+e8pk9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69589119"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69589119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 18:03:07 -0700
X-CSE-ConnectionGUID: 4kJQxGcHQX2ma13xJew+xA==
X-CSE-MsgGUID: PUoT9+G6Rxm4fVOq6jYzRA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 18:03:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upceu-000Lz3-0X;
	Sat, 23 Aug 2025 01:03:04 +0000
Date: Sat, 23 Aug 2025 09:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-dev 3/3] drivers/net/netkit.c:170:13: warning:
 'netkit_queue_valid' defined but not used
Message-ID: <202508230958.6amvuxyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-dev
head:   3cd920f2d19d20676a20cdc480e5645e8d2e4f51
commit: 3cd920f2d19d20676a20cdc480e5645e8d2e4f51 [3/3] netkit: Add option for lower device binding
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250823/202508230958.6amvuxyV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230958.6amvuxyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230958.6amvuxyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/netkit.c:170:13: warning: 'netkit_queue_valid' defined but not used [-Wunused-function]
     170 | static bool netkit_queue_valid(struct net_device *dev, u32 queue_id)
         |             ^~~~~~~~~~~~~~~~~~


vim +/netkit_queue_valid +170 drivers/net/netkit.c

   169	
 > 170	static bool netkit_queue_valid(struct net_device *dev, u32 queue_id)
   171	{
   172		struct netkit *nk = netkit_priv(dev);
   173	
   174		return queue_id >= nk->lower->queue_id_from &&
   175		       queue_id <= nk->lower->queue_id_to;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
