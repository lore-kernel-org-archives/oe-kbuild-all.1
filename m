Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E417E907
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721221096; cv=none; b=Aq0wLvLPxdgJrD8WVe3kZ6KW0ev+7GS1nZeqHBysHmYid3l1ENEX+wc48KKzn9IJxI4RdEoIZesEwenbyd3YeBWqUc8RUFOpSmaGoImCehj9mxgahn1N2nIFNRHP8V0Bv/MHyUVxQyS7qMfIpyy0aGRolbfNKmv5EeyZB9dvA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721221096; c=relaxed/simple;
	bh=33wyDcxHEa5XlfGov2fLsWvGufNPb1PjreU9Vq10fsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTXMuCw4nb1E7K9cgMgvAZhTNgwWeRjcjR+MxOafNfv4vBlpYSxuech7vj3ft2tW8/WdkW1wPP4zZRG4CjEKK/J1WKufjjuVuNrZTrVlgUxZnC8QVNxTNuQZQuHrIw0CjFbKe87jU3YHWx9RpLctNQErFsuRPjGwHU2YgpAxbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvptwFG3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvptwFG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721221094; x=1752757094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33wyDcxHEa5XlfGov2fLsWvGufNPb1PjreU9Vq10fsQ=;
  b=gvptwFG3xB2BQ3S4CXbisTSn5LNAk3edF9+95pUqNBjHicRuhbGm4Zos
   1iGjBKt/WEiUV77d7ECvKn1+rsAn9tGgTBiSWQmQX4uzTtQcHe0EvzaJw
   Fj3ISaP4ejkkTp0p0AvaA32wT1Om5fhfOih6RRmE1poagKq78MQldTKZx
   ZDE6oY1DGewRfJHsboPR8FSZ1XUjwlMo4MvxyP0I/25OZv5AOi2oouN+J
   dJo4UjL5l5XWw7OyIO81bzzOmYfgEPF6ftkCpM/DqulnwsHpXcjLM/ckL
   PaN8B4vg2n69ct+GBEjzItGwjMDCuNohbsVG413LDPhIAdZ6vIB3W/Iiu
   Q==;
X-CSE-ConnectionGUID: FvFhx+qYQnWvL4dmsmyf1w==
X-CSE-MsgGUID: fdvE/XB8QlKf4YujK+thZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18855647"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18855647"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 05:58:13 -0700
X-CSE-ConnectionGUID: 9dGpMu9tT9aPzNfecRb1Ag==
X-CSE-MsgGUID: 6fbgRfXXTGSLEeD5uGQZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50276266"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2024 05:58:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU4EU-000gLG-1n;
	Wed, 17 Jul 2024 12:58:10 +0000
Date: Wed, 17 Jul 2024 20:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 127/129] fs/bcachefs/btree_iter.h:38:18:
 warning: unused variable 'idx'
Message-ID: <202407172020.86bCXnde-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9d089bb2428fdbcfc5a2f00e7968d2b697c8bb20
commit: bc47374601095a64f77eb477f04b83bebef79b22 [127/129] bcachefs: Add check for btree_path ref overflow
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240717/202407172020.86bCXnde-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172020.86bCXnde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172020.86bCXnde-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.h:5,
                    from fs/bcachefs/xattr.h:5,
                    from fs/bcachefs/acl.c:6:
   fs/bcachefs/btree_iter.h: In function '__btree_path_put':
>> fs/bcachefs/btree_iter.h:38:18: warning: unused variable 'idx' [-Wunused-variable]
      38 |         unsigned idx = path - trans->paths;
         |                  ^~~


vim +/idx +38 fs/bcachefs/btree_iter.h

    35	
    36	static inline bool __btree_path_put(struct btree_trans *trans, struct btree_path *path, bool intent)
    37	{
  > 38		unsigned idx = path - trans->paths;
    39	
    40		EBUG_ON(!test_bit(idx, trans->paths_allocated));
    41		EBUG_ON(!path->ref);
    42		EBUG_ON(!path->intent_ref && intent);
    43	
    44		path->intent_ref -= intent;
    45		return --path->ref == 0;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
