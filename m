Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9F3101D4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011935; cv=none; b=Z0wundl0xrAF7komaebdpjsiX9tvARbpTBJpVX7zdxHk3XI5KsArlKpseHErvr+RJNwVxSArMAlLj5h8Tw9IVCnYtako1wJgHrpwjy7hnDlI2r18YKYtXHmWrnK8Vipi7Fh6m5AAt24jPGdGMQBXOpM1WYq+WplvBeCkc7Hwmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011935; c=relaxed/simple;
	bh=gAebViEJyoDl+QALDxEhXLAYl+FkOEBgv8Up/m6CYrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kkpTZlvO+NL3PlrTkmaXCq5/yx7Ty5kSjQlnkufl0IUf/unsaRXUwn160mNuHiTwHZGOvCMMPs2+VY31DJ+wKOx3HxSk5pm9EOjNf71nazFlO8HxKevj5NhGkRGQa9JshE3coWFuGBNIq0PEPoA7P2eAQrm20NP1htenDoRW6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N623dNkT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N623dNkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767011933; x=1798547933;
  h=date:from:to:cc:subject:message-id;
  bh=gAebViEJyoDl+QALDxEhXLAYl+FkOEBgv8Up/m6CYrA=;
  b=N623dNkTOPzqgYXOavNXh8XUNpaPqZ/32/qAWdkVN8Yir1yHXsxrdhCr
   8bV06L4Ykoeg2ETASDZ7gwNViLOBflmxa9c8pRXqTCvkOTm4dsDDMvv03
   49oIg5hLl7KB7rYiBD+vctH9OPmPcZf77fVC/o4chTSHcj609LKDBx8XE
   vKjNXkGWyo3PxPLp7nDsfcmepC2UzKk8pg1K29rnLETWqee792qzR5lCv
   y818RkYosWomGlcO3vaQDNJiESkngnQIApGKjNe/LFgNK55QZS1E7xNe4
   zinnG7WGU2MXv8nIKXHBTJXV1jtqvqymlb4rHnLeSoCJIS1+UCDr6dF44
   w==;
X-CSE-ConnectionGUID: Jn9qMP/cSwKSZ7DsLzWHNw==
X-CSE-MsgGUID: HU7R2q+dQQWjqc94kpReuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91275579"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="91275579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:38:52 -0800
X-CSE-ConnectionGUID: kYFQbkVcQ4CEr4GztsE7QA==
X-CSE-MsgGUID: Yjl/QJSGSJqDefRMaRsg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205813906"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 04:38:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaCWO-000000007Dy-0qbK;
	Mon, 29 Dec 2025 12:38:48 +0000
Date: Mon, 29 Dec 2025 20:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/12]
 fs/f2fs/checkpoint.c:949:undefined reference to `__udivdi3'
Message-ID: <202512300150.w0XUmjgx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   38316221f39afd9be305c1a9d7de368ac7d10a74
commit: c9ba65c570f4537bc2afbb66eebe7f04022bf71f [1/12] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: xtensa-randconfig-002-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300150.w0XUmjgx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300150.w0XUmjgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300150.w0XUmjgx-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: fs/f2fs/checkpoint.o: in function `f2fs_checkpoint_chksum':
>> fs/f2fs/checkpoint.c:949:(.text+0x8c): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/f2fs/checkpoint.o: in function `trace_lock_elapsed_time_end':
   fs/f2fs/checkpoint.c:66:(.text+0x178): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/f2fs/checkpoint.o: in function `f2fs_down_read_trylock_trace':
   fs/f2fs/checkpoint.c:102:(.text+0x1d08): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/f2fs/checkpoint.o: in function `trace_lock_elapsed_time_end':
   fs/f2fs/checkpoint.c:66:(.text+0x1dfc): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +949 fs/f2fs/checkpoint.c

127e670abfa7fa Jaegeuk Kim  2012-11-02  936  
d005af3b6756e5 Eric Biggers 2025-05-12  937  static __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *ckpt)
d7eb8f1cdfaefc Chao Yu      2019-04-22  938  {
d7eb8f1cdfaefc Chao Yu      2019-04-22  939  	unsigned int chksum_ofs = le32_to_cpu(ckpt->checksum_offset);
d7eb8f1cdfaefc Chao Yu      2019-04-22  940  	__u32 chksum;
d7eb8f1cdfaefc Chao Yu      2019-04-22  941  
d005af3b6756e5 Eric Biggers 2025-05-12  942  	chksum = f2fs_crc32(ckpt, chksum_ofs);
d7eb8f1cdfaefc Chao Yu      2019-04-22  943  	if (chksum_ofs < CP_CHKSUM_OFFSET) {
d7eb8f1cdfaefc Chao Yu      2019-04-22  944  		chksum_ofs += sizeof(chksum);
d005af3b6756e5 Eric Biggers 2025-05-12  945  		chksum = f2fs_chksum(chksum, (__u8 *)ckpt + chksum_ofs,
d7eb8f1cdfaefc Chao Yu      2019-04-22  946  				     F2FS_BLKSIZE - chksum_ofs);
d7eb8f1cdfaefc Chao Yu      2019-04-22  947  	}
d7eb8f1cdfaefc Chao Yu      2019-04-22  948  	return chksum;
d7eb8f1cdfaefc Chao Yu      2019-04-22 @949  }
d7eb8f1cdfaefc Chao Yu      2019-04-22  950  

:::::: The code at line 949 was first introduced by commit
:::::: d7eb8f1cdfaefcd41b716ef0ed1745b43c6c4fc9 f2fs: allow unfixed f2fs_checkpoint.checksum_offset

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
