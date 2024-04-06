Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773D4C9F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712367796; cv=none; b=eh5GtmUn3I5xbRUvmT7zEQUCd0B1jpDAAb20D+Q70GTQVyhoHx8VgSjFZLGrs/i2U7fIX8PyCdZbE7FW1S+iJJ7Pmd6ZM71CVxXmbvOqH4Ed2GZ6544mW4KSYmc94zm2B2KYaaebYnsndDkbxBBi9l+jEiua2J3oSFEp1j9D6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712367796; c=relaxed/simple;
	bh=PXgBvBnqgQLVEWgucKJ9L4u/iHvD6Af+w4quLkoIric=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQWNUjQK1AtkqnTnopSv/CAn2GUGCzpZuSa2p9avIjhgUYyEj1gWH3pABQm73cV38XVE2cATAEFY2VtTBCtTlobt9CVa8gkCZywOmL00mt+UiBw9qsqI3GeLY+UPcByZD1c7cdrhNHMzNarLdUz0fJt9+H0kSWfA7NKTUNwaNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFR+UQOj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFR+UQOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712367795; x=1743903795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXgBvBnqgQLVEWgucKJ9L4u/iHvD6Af+w4quLkoIric=;
  b=kFR+UQOjHvgvtN8No2xaozNq2Tv0Y9wcHfSajVmyhdSv6HlkPyM8ruvb
   pMfqFvfZRaNHU0n5CnXmG+SUedyKJuiBm6fqqv+ItNTuKSpv8kl+hBpbA
   bzZxeCRih+8VzAs++cp4VKuepfBMLBk12fn0mRBbb0/+Gh5LA93f3Mu52
   R1a3yX1lKJCn+Xuq+RFEgdWTGqBNc9Z7DcEFp7lgBLCEr5VYYr98XfKeE
   xQSp3ePFtrS/0OXfQr33iLu8RTHOpApb0N+P2ohIcv2ILrBC6vO2EJc4K
   /31H4bXxxdOVLgN+vPVV/hxx2FM3t5rPc51N0v+6rjDhPSjlWNIU/MftA
   g==;
X-CSE-ConnectionGUID: Px9PCZKrSbyKVu6ZiFfdWg==
X-CSE-MsgGUID: QsI4Hd4uQ72NGDPPJE9qFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="8291072"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="8291072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 18:43:14 -0700
X-CSE-ConnectionGUID: SySY37TiRiGGZ613bIiLPA==
X-CSE-MsgGUID: 9EtVg/OOSwmSI8Ap9TKbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24079707"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Apr 2024 18:43:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsv5K-0002yK-1Q;
	Sat, 06 Apr 2024 01:43:10 +0000
Date: Sat, 6 Apr 2024 09:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 5/7] fs/f2fs/segment.c:5489 destroy_curseg() warn:
 inconsistent indenting
Message-ID: <202404060950.GKlnDiXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   8609ac2462ce93cc59da4a019568b1e3af48ea4d
commit: fca6dad53ebbef9b679b217887bda329aa963254 [5/7] f2fs: zone: don't block IO if there is remained open zone
config: sparc64-randconfig-r081-20240406 (https://download.01.org/0day-ci/archive/20240406/202404060950.GKlnDiXp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060950.GKlnDiXp-lkp@intel.com/

New smatch warnings:
fs/f2fs/segment.c:5489 destroy_curseg() warn: inconsistent indenting

Old smatch warnings:
fs/f2fs/segment.c:801 __remove_dirty_segment() warn: check sign expansion for '-1'
fs/f2fs/segment.c:4198 write_compacted_summaries() warn: variable dereferenced before check 'page' (see line 4181)

vim +5489 fs/f2fs/segment.c

  5475	
  5476	static void destroy_curseg(struct f2fs_sb_info *sbi)
  5477	{
  5478		struct curseg_info *array = SM_I(sbi)->curseg_array;
  5479		int i;
  5480	
  5481		if (!array)
  5482			return;
  5483		SM_I(sbi)->curseg_array = NULL;
  5484		for (i = 0; i < NR_CURSEG_TYPE; i++) {
  5485			kfree(array[i].sum_blk);
  5486			kfree(array[i].journal);
  5487	
  5488	#ifdef CONFIG_BLK_DEV_ZONED
> 5489		if (f2fs_sb_has_blkzoned(sbi)) {
  5490			enum page_type ptype = PAGE_TYPE(i);
  5491			enum temp_type temp = type_to_temp(i);
  5492	
  5493			if (sbi->write_io[ptype][temp].zone_openned) {
  5494				up(&sbi->available_open_zones);
  5495				sbi->write_io[ptype][temp].zone_openned = false;
  5496			}
  5497		}
  5498	#endif
  5499	
  5500		}
  5501		kfree(array);
  5502	}
  5503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
