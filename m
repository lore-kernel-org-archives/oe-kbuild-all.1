Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE11B94D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707131367; cv=none; b=TY3yEwybcmVwWtj4kgT7t92V7PTlqAvQ2SzSQY9VF1cxuirgP1v7al4PtcyR5fossB//CCZ54/y20kYydvi+jbM+fBNt/DE/azTls86lUmSfeghaLz9YotG2amRmiykTWWsq0C0GDz2YnJIni79FsgTOyzq2jH3Sn1W2LC7P3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707131367; c=relaxed/simple;
	bh=i0UJ2Z9E9wjzsPJU6TeKvRQGUdhBbIKtWz3wlWTMnxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asyDzvzI1TTq5cZdIoLuidJs0FURfag1YC/yBvtPAqv3+5vI0ZT29uDTemKoiQkf7gim/BhcWTMKL97Wm0Y9J6vaRd5DvVnVQpvDMRrHPyMfpi+uGKA7dJpgSc9njRuPgt5I2RpZqNoAXdZoEVf/QnuIaSaGFLmLwYM5w8GGFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9FFNzOO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9FFNzOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707131366; x=1738667366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0UJ2Z9E9wjzsPJU6TeKvRQGUdhBbIKtWz3wlWTMnxc=;
  b=H9FFNzOOUTpqj+eABm3ncdVYlgmyn3PUonnMP+UeV6Gy/T2Ji1gMH3ne
   ak8q+lToRQ6fuk273J84bWev2bsC/6eJ2fN+vGmmD59CIAVob8hG/jjx1
   RycBDtT8fK1PzP52Ux+ii8dfwSSBaJ855s5tmFyqqAm3WFpwpZ17TiW4Z
   tMpfOXSmZSQH19JO5UzB6zoXBQcr+S9zvAXE+IkzXMdBGaHju67B1C2n9
   Jnf7b2akJ75KQlftWcFYyKAYsoPbSqWIRRKybJ7yRHUdsb5QgxQHp7Cxx
   EsmFFiU8SddT31EMAEYveWq34nmUzy8Zcq0RL5P7fsJjY3QCJLVdtM+Va
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="655548"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="655548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 03:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="691097"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2024 03:09:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWwqn-0000Q4-25;
	Mon, 05 Feb 2024 11:09:21 +0000
Date: Mon, 5 Feb 2024 19:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 44/45]
 fs/bcachefs/btree_journal_iter.c:451:3-9: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202402051819.WApO40lU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fc34b5c145f0dffd6216bf51c12d5a25c17608c4
commit: b8328288ce5de15fa8498a3d1a2f1c04acae875b [44/45] bcachefs: kill kvpmalloc()
config: x86_64-randconfig-102-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051819.WApO40lU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051819.WApO40lU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_journal_iter.c:451:3-9: WARNING: NULL check before some freeing functions is not needed.

vim +451 fs/bcachefs/btree_journal_iter.c

   443	
   444	void bch2_journal_entries_free(struct bch_fs *c)
   445	{
   446		struct journal_replay **i;
   447		struct genradix_iter iter;
   448	
   449		genradix_for_each(&c->journal_entries, iter, i)
   450			if (*i)
 > 451				kvfree(*i);
   452		genradix_free(&c->journal_entries);
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
