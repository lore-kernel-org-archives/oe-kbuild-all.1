Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AE2AE8D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 20:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756241202; cv=none; b=REq6b7jwHJKam+c2uK5ePyBN9AwfTG5ysEK5MPDVW01AeUQ2E8eCN35uWR3LidmCXQtcNLlxYzbZSc+04WSE/vmzqpIi/KshguM2fGYFpqonqMUoBfEcxVhRWgWo0BhV0mSyU9CJHunLGKgN/xXB59XGawbwDv3UIMPkxmfe94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756241202; c=relaxed/simple;
	bh=tW012G47WCN3IUd7ZSGfoSpISetyXwyJBv9i49L7FQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBkUIKehiuv2/Xwjo+fAsTLL58/mJ2iL7O7az3RDSiGFKy0JPL/viPxHpD4iTXv+b12TOIvFHFlrkH298YVPPkMXnXyQKbubOxTeiyURuPvVBsyne3JssJ8jjt/h+TdYKCHepgeYatZdx5K//o+nSh9l3KVKAOennJeGjXrtcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9cOITm5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9cOITm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756241201; x=1787777201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tW012G47WCN3IUd7ZSGfoSpISetyXwyJBv9i49L7FQY=;
  b=O9cOITm5YxO/h6wad3vQK15jXHvmu9j4PxQVgKZ7jTa6yw0gNu/nqkF3
   2bCxr3HaDmmztmVJL1NRQh4ompWYNUBVNc5/l4sQJROsqzKd+RH26Ogkj
   mb32sWFPV/TG23glWHEUTPPDrUUp4Ret3WBDXKafqO2xbHdFiu1syDJee
   PD5CJg5JtaHxzsZ2WYqjQHau9pUDjnCzaxtaP25wGQFESp+VuRRNdRE9I
   Wrjs2/y4/T9j2rQLSzKbyeV6vZpimLH8jWkvoqGI/vsy1l1CieRIBzdIl
   eA7AhM2fIIdrGGYiAiWWLKqOLjmGibFZ8GkptlN1XWOPWtRcc08QNqvGA
   w==;
X-CSE-ConnectionGUID: MnwJvLcpQduwsesGdKucKA==
X-CSE-MsgGUID: kedNZwdCTV+xSUOVQ5/0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58424427"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58424427"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 13:46:41 -0700
X-CSE-ConnectionGUID: Yw+9Oyj+R3a0zYm/g5NoiQ==
X-CSE-MsgGUID: UsX6CXFdRtqplo6aB0nZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169847489"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2025 13:46:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur0YU-000SNb-2l;
	Tue, 26 Aug 2025 20:46:19 +0000
Date: Wed, 27 Aug 2025 04:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v2 34/35] Warning:
 kernel/kthread.c:872 function parameter 'mask' not described in
 'kthread_affine_preferred'
Message-ID: <202508270421.Sv91XzI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   6bcb15d1aebd50828a313a2ec927dea9d0ab9b8f
commit: 66bc53cba4db887c64e6f15e206dd91db10fc1f8 [34/35] kthread: Document kthread_affine_preferred()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250827/202508270421.Sv91XzI8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270421.Sv91XzI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270421.Sv91XzI8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/kthread.c:872 function parameter 'mask' not described in 'kthread_affine_preferred'
   Warning: kernel/kthread.c:927 function parameter 'mask' not described in 'kthread_affine_preferred_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
