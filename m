Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1050DDD2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 06:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716790150; cv=none; b=DQhMHg1k2H4M58WCAnCMn+pyOxyJZUUzD6DuSo7cBaDCJnymliBwRi7RqLyHKYhaBrr3wF0O2K5wIqvuQLRagULg6dwEE5im0flTt2EAkKWYwqYdWkjUWk7G+xcK47SaPn/rY8ZrkI7N/YlQzM5RYyICr6cB5TuEi8EbJN6rNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716790150; c=relaxed/simple;
	bh=6uXW9w0odkbdNQb/TdNwTlT1sm6mmhloZgZxko+OIVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWsADTd8Sb5HXGWcw/Gxarx9TaBnBaBb2aG+O+TBcY/iNbnmJNL4yv/yS4hiGDTgT1qvelDa4BOryo5QDR81yn/a9ByYiZZQrVnjzUfdFkADaZIfwwjILYBUnMeg/5SNyeqHnXlJSuT63qz1m7lI/tFIfSp+U2CeEUTy+VAtVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmCCHQa9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmCCHQa9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716790148; x=1748326148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uXW9w0odkbdNQb/TdNwTlT1sm6mmhloZgZxko+OIVc=;
  b=fmCCHQa964P8Aq6oOw+LsUJcqE5kuBHE/tGNoLTbAxYxq9rfKuBThPGi
   XuHf9Kjj4ArlF72LSu8f1lcVK080zKFDgr+oR/ALX1zWW67fvy8mMz5dt
   Ei1FjJm4i4FiHzzbxAxAsdylvDQNEwOcHYPWTJnXGEmIgFtenv4oZR+AE
   jXBbeM0zTyUs5WAjlkpLD5vRe1eqe1+c6vj2UEMm9+a7UjH56bQ9RHS39
   7EfwM2ZNv1EeKIOLoPQOfb2FRJVhfZKmbK/Sch6cn+6szS2hBAOy69g67
   lDboKlEGUinF1o9rxXoD4Hg4yujOVX0dP6Iho12r6TzubcwyFXLRacYbX
   A==;
X-CSE-ConnectionGUID: 2BVrDDUmSkiZLYYZg1UwQQ==
X-CSE-MsgGUID: BYLBex7rSd+01VvMJZm/DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16923247"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="16923247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 23:09:08 -0700
X-CSE-ConnectionGUID: oc7s/GGFTFKyGJehrTPkzw==
X-CSE-MsgGUID: PQtuAB3HRIq1efInmlD4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39618403"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2024 23:09:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBTXc-0009VV-1j;
	Mon, 27 May 2024 06:09:04 +0000
Date: Mon, 27 May 2024 14:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22493/22517] fs/f2fs/recovery.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202405271432.kcc9oFuL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f42e95af1cee01b2f0bdda393eccc5b3c583952
commit: 21d0fe9fd291eec496a4c174924ea645ed5d7b9e [22493/22517] f2fs: fix to avoid racing on fsync_entry_slab by multi filesystem instances
config: x86_64-buildonly-randconfig-001-20240527 (https://download.01.org/0day-ci/archive/20240527/202405271432.kcc9oFuL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271432.kcc9oFuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271432.kcc9oFuL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/recovery.c:12:
   In file included from include/linux/f2fs_fs.h:14:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/f2fs/recovery.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
