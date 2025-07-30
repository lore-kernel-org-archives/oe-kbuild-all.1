Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F6154426
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849749; cv=none; b=AzAY3ph+016SWv8oYEHLcV72TIS7ZYn/U1qdnTiXkw6Q56wfjsg5Byj7nK2j6zjebN51hM0eLEACrbu+K/sbQ/jIn4quFzVz6HD+dLvO3S6i+vTylKIKUJlPDMC+Gq5T04iRnuQGDDG31+TSIiYj3MJXq/sXO2LNLI6V0nlIiCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849749; c=relaxed/simple;
	bh=3EiB7OSB+3cJRVasLhpxJCsaDKVA/T//PGBNkleDFbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/eqeKhGgr2b5oIfAPDoaZ5g4UZL6Yp7JIahXwNHBtngZXbVBtZfsrQQUihOnt7iiw4iUKgtzmCAiwL81MqOWGbreIPgW39cwj2VxBqAQ/OsstWuBD1kDH6EyoYCpYay76eRcAX2ymg4TcYih3I4ddOPlOro5ed6QypRVCWGyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIFmR3QQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIFmR3QQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753849748; x=1785385748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3EiB7OSB+3cJRVasLhpxJCsaDKVA/T//PGBNkleDFbI=;
  b=jIFmR3QQoTjoL5EhYfbHyLA/10efmUsYYTF3S4dXkMgxLHSkEbQRe7CT
   QhNJpLEjOvsC+3VpgGkzD7Z7mW7vobvZEtdxnEMKuCrvdsUB7mkMA3gfX
   evQyQ6feJhANnCs8LmNxi2GKla3AQ/k3yVK8lQgEUIYomxStZylE3dzfU
   Cyal4KYmAXqgf/Sl9EDi3KYYQq9buDheosNAkwhsHNqyBVb6S5SqNfUEo
   nsffEUIbUb3luYZFsOdXYXF4NlT3Qhuf1eWuE5KcNByFeEAQWCAnPjBOt
   rXzoLgJRpI66KmQv+ej7Mtu9V2EUD6/RsK0X8yrU9nOcH5pU/u2ET5yvZ
   A==;
X-CSE-ConnectionGUID: 9fi7YQuARWi9DLUftUAggg==
X-CSE-MsgGUID: Mhd4nbfbQyq7id2nGO51iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="78690630"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="78690630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 21:29:08 -0700
X-CSE-ConnectionGUID: mFdcyujsRweRih0Oy7+o3A==
X-CSE-MsgGUID: A5SarBjCSa+nuhvs+PvCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167084820"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 21:29:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugyR6-00021I-0m;
	Wed, 30 Jul 2025 04:29:04 +0000
Date: Wed, 30 Jul 2025 12:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] fs: add the interface to query user write streams
Message-ID: <202507301220.RYskgxEV-lkp@intel.com>
References: <20250729145135.12463-3-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729145135.12463-3-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 66639db858112bf6b0f76677f7517643d586e575]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/fs-add-a-new-user_write_streams-callback/20250729-225440
base:   66639db858112bf6b0f76677f7517643d586e575
patch link:    https://lore.kernel.org/r/20250729145135.12463-3-joshi.k%40samsung.com
patch subject: [RFC PATCH 2/5] fs: add the interface to query user write streams
config: x86_64-buildonly-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301220.RYskgxEV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301220.RYskgxEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301220.RYskgxEV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/fcntl.o: in function `vfs_user_write_streams':
>> fs/fcntl.c:403: undefined reference to `I_BDEV'


vim +403 fs/fcntl.c

   397	
   398	static u8 vfs_user_write_streams(struct inode *inode)
   399	{
   400		struct super_block *sb;
   401	
   402		if (S_ISBLK(inode->i_mode))
 > 403			return bdev_max_write_streams(I_BDEV(inode));
   404	
   405		sb = inode->i_sb;
   406		/* If available, use per-mount/fs policy */
   407		if (sb->s_op && sb->s_op->user_write_streams)
   408			return sb->s_op->user_write_streams(sb);
   409		/* otherwise, fallback to queue limit */
   410		if (sb->s_bdev)
   411			return bdev_max_write_streams(sb->s_bdev);
   412		return 0;
   413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
