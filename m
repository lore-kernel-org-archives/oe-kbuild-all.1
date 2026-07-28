Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A68473C91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269703; cv=none; b=oJQwj69q0LOZT4YwAEN1lbUuTXpuu8TLvjVFDqaVNY5Ulwk7GElZmu5nUYIuRp1sJyKdESyOf5hwB1s+smTK1eBhoT9tpFoEZ5FibJu7g6alklzmPWU+0PxJtluo5RZbOKkXrpMy/2koMDB/utxZNf5Lty00Q+M/fIbGqiqETTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269703; c=relaxed/simple;
	bh=U9xbLbzN6icy6/r3+baQzRZV9tU5OH+3v6fp2mO7lxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j7Fwb5w4yAcT6NOuH/LjtcSNlCGCGCWbbVqKn4CPCIX/R7tvMBYKmtoNdtWyG20rlHkEpl38NKYMk37YkKuxQwmpCUqfcFnzkRkBQgAGsPxvYEIxq8siN/o+LslxEzHFgFiS2878Zn1MdDBQaYz39H0cQwQL/IC3OYu5Gsq1+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSS3GKt5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSS3GKt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785269701; x=1816805701;
  h=date:from:to:cc:subject:message-id;
  bh=U9xbLbzN6icy6/r3+baQzRZV9tU5OH+3v6fp2mO7lxU=;
  b=KSS3GKt5imLIYgKCLzwLaV18Ur3A9lhIMnaGO1SYQi7ummRlUUDqQ4JK
   ziEsGHmTqTPKAk6/ryaaXftpgnFXpQAqhun57+rOJkgYIizWSiF89vGSG
   LesBu+q57lu3XOWgbnRyv/ge1ADg2NFZdpo4A14cFg7QMG10/k9SHWRFp
   qdI/TNTxQd1fCGA38Y3jfSwqa33KDVemIXOGo/apuCMK62zzMzugewwPy
   nu/OVCigPhZFC61ZyVsJKOOcxEmbrhvILjxVO1ZU08q7pXQuY6AzsMoof
   m1tYxcvV5Pzknv9YUMkK3jx3eVtYJAgIlqLGa/KvU26erpZYppNu474sl
   A==;
X-CSE-ConnectionGUID: bc6HK8hURuKDChLuLcqWEw==
X-CSE-MsgGUID: 2F40lxlXTxyu3efJusau9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103409429"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="103409429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:15:00 -0700
X-CSE-ConnectionGUID: /lRwT2swRu+AMnAW3zvY7A==
X-CSE-MsgGUID: 6vOw3e8wRVKssKJlPX42cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="259869133"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Jul 2026 13:15:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wooCS-00000000ekN-3Hf1;
	Tue, 28 Jul 2026 20:14:53 +0000
Date: Wed, 29 Jul 2026 04:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 52/62] fs/xfs/xfs_rtcsum.c:67:undefined
 reference to `crc64_nvme'
Message-ID: <202607290449.Hx0zH3cA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   18cbb272aa91aeb23eb1284cb2ea278e932a5272
commit: 1319f7ba751b3fc086d1e1e9b81aca6ceb2b4bfc [52/62] xfs: core RT data checksum support
config: x86_64-randconfig-016-20260728 (https://download.01.org/0day-ci/archive/20260729/202607290449.Hx0zH3cA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290449.Hx0zH3cA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290449.Hx0zH3cA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_rtcsum.o: in function `xfs_csum_gen':
>> fs/xfs/xfs_rtcsum.c:67:(.text+0x4d2): undefined reference to `crc64_nvme'
>> ld: fs/xfs/xfs_rtcsum.c:67:(.text+0xca2): undefined reference to `crc64_nvme'


vim +67 fs/xfs/xfs_rtcsum.c

    56	
    57	static __always_inline void
    58	xfs_csum_gen(
    59		struct xfs_mount	*mp,
    60		void			*data,
    61		unsigned int		len,
    62		union xfs_csum		*csum)
    63	{
    64		if (mp->m_sb.sb_rtcsum == XFS_CSUM_TYPE_CRC32C)
    65			csum->crc32c = crc32c(csum->crc32c, data, len);
    66		else
  > 67			csum->crc64 = crc64_nvme(csum->crc64, data, len);
    68	}
    69	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
