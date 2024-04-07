Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237F3C082
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712531844; cv=none; b=LDXgVEf39cModdcqdWPUWxlZCR2y1RahylOFDVKjZjNex04KN11oGcn0NpyS5sXYRher8wNWu+uAy9wxaNAdzvOML5AwpMNOdRzLfE7fWaEZ1mWD/x5Iawk7/PUnsZjKXpEokAuY51U7ghk/Yzx+4HQNaqm9Ib1bHLe9SLU6PGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712531844; c=relaxed/simple;
	bh=Gq/KgWJZbZb+lwYx14jVdyFOShnEhU3Wd1Xz+bqAWKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6v5wd8Tk1zsKYT0gAd5ijzy+9QzIuCs1eajwHaPHxLx46gbZaYSExfEdNOXenXHOcOFM4pBiArfGdl0WlXMySfUG+HLvIjGMwEA6nATByFVcJzQFIVVbwqJOb5zaRLUiCQp7mq8yutHbSu+H9vToF1mtmpQXJV4EbLJtPkwZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MChVl+aV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MChVl+aV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712531841; x=1744067841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gq/KgWJZbZb+lwYx14jVdyFOShnEhU3Wd1Xz+bqAWKs=;
  b=MChVl+aVRBiOM2/3HGVL8WH67XEmcaZcErdUaLIDDeQrtVBXWrZkDSiA
   SaN7b7ggQXEn0Oe1yrJbULz872I1/msRxZSuvzNFA2qyw3IAFId1SIDwN
   79UGNWKhrERpfB3BdFVpIpG5m2994XI/GAxMJcMNDK2u9wKVIa1gwXBH8
   PIdgeWYkY6bQ5HkAfh8X3J73laxbLgJ73vlN4/TQij4Lb7oWPRzhGEtB4
   HdefTn7/sed+4Z9jq3eKp0fiKM6zbhHX6s9eXB2EFL+3XZJmTWcV7cddI
   7yTGb17MhOZYrcKFGjLHy1QJe5K6TJbY3qJI450hOioQJ2IJHEI1IG7Ra
   w==;
X-CSE-ConnectionGUID: xKZOlJRgS5KKJw/Lp0z7Dg==
X-CSE-MsgGUID: 7ShADnUkS7a0V6os0or70w==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11570720"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="11570720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 16:17:20 -0700
X-CSE-ConnectionGUID: 1mBsCsl/TAOv8nnsBsE/Kg==
X-CSE-MsgGUID: 3IqH7CNjQza1dqJT87hYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="20269375"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2024 16:17:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtblE-0004eI-37;
	Sun, 07 Apr 2024 23:17:16 +0000
Date: Mon, 8 Apr 2024 07:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 97/99] fs/bcachefs/btree_gc.c:590:5-8:
 Unneeded variable: "ret". Return "0" on line 608
Message-ID: <202404080707.wxVEtr4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   efbb47fc238f9ee4c06285f5934f118703e7577e
commit: 62b7bba5f9af1d544a9c65461184b5db0dcf1988 [97/99] bcachefs: bch2_check_allocations_early()
config: mips-randconfig-r062-20240408 (https://download.01.org/0day-ci/archive/20240408/202404080707.wxVEtr4P-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080707.wxVEtr4P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_gc.c:590:5-8: Unneeded variable: "ret". Return "0" on line 608

vim +590 fs/bcachefs/btree_gc.c

   587	
   588	static int mark_allocation_early(struct bch_fs *c, struct bkey_s_c k)
   589	{
 > 590		int ret = 0;
   591	
   592		BUG_ON(bch2_journal_seq_verify &&
   593		       k.k->version.lo > atomic64_read(&c->journal.seq));
   594	
   595		if (fsck_err_on(k.k->version.lo > atomic64_read(&c->key_version), c,
   596				bkey_version_in_future,
   597				"key version number higher than recorded: %llu > %llu",
   598				k.k->version.lo,
   599				atomic64_read(&c->key_version)))
   600			atomic64_set(&c->key_version, k.k->version.lo);
   601	
   602		struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
   603		bkey_for_each_ptr(ptrs, ptr) {
   604			struct bch_dev *ca = bch_dev_bkey_exists(c, ptr->dev);
   605			__set_bit(PTR_BUCKET_NR(ca, ptr), ca->buckets_nouse);
   606		}
   607	fsck_err:
 > 608		return ret;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
