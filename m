Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E301AB52D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416403; cv=none; b=RqlrvVfrvOX0Vgz++7Jg9b5mToUBpMemmbrEKTJ09L96D7xBhBLHRkfxbvAs9v5tIRP1Tfv5U150m0CsjEaCUNiXlrxKb7G/U9vdfeuOvVRYbtYOl6PZBV9lMdJiKZZh+eDYpVwVzlfumeKDfEAdgmfGwxZOfMOR6+wMahkQYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416403; c=relaxed/simple;
	bh=anmcA43Z6X9bA8nYN7K6vQcowReJ6mNcLUxOHtr3AKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqrxVoNcK5XDJ6odhIsF+Fpzi/rOfRaAPoo84cIKmil8cRL0vs5zj/xcYispn2Z+mnw6cZZW+9rhXh4wC9sZmEcKYjFcaHt/shzhDujwoBgg1loyNpbyRAshTu4m025IjLxeJlptRyoVEr04pIHpOVEvRDCfts9Ik1IGN/HGI1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRVyMyoq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRVyMyoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748416402; x=1779952402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anmcA43Z6X9bA8nYN7K6vQcowReJ6mNcLUxOHtr3AKs=;
  b=YRVyMyoq1ee27PR7nk8gihU0ar4Z4AmokTC3BDu2J7gOd1Lx2nHSoTg/
   p7RliiTzSvkHN72dPXiLcPXQ5kobjh1zZMH66MbwA0KNcvWqd4sPxAf56
   Diqkuqr6lizNyVtRdg0QEV8W1jGKaOyTclZfLsfJaxsk++gWgcKtpJtuj
   bBJK4NmloiyqZgWOEd2sUf5iQ3HR+ZWWHQPMQGDNUzig9ocjDZeEn4E5o
   aL6FTYKVHXujWYho1FM28xzWcz3pccPMLSZASVsgFsm0OsTfrBdCXHNjX
   D98svq8Xd2ID+/VvIF8RSPTobh07KDn1gPooaJ61TuieDoT+WQvmVutxC
   g==;
X-CSE-ConnectionGUID: vF9J5DPOS6WMcQdXmJK2zw==
X-CSE-MsgGUID: GyMojZnYQh6YMR8PSTCaoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72962549"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="72962549"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:13:22 -0700
X-CSE-ConnectionGUID: GHjZIxGfTxC9ErrnVZMpdQ==
X-CSE-MsgGUID: T3QK2HKaQCqoEEI2xilg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="144129467"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2025 00:13:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKAyU-000VN5-2j;
	Wed, 28 May 2025 07:13:18 +0000
Date: Wed, 28 May 2025 15:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 325/325]
 fs/bcachefs/sb-errors.c:94:43: error: 'struct bch_sb_error_entry_cpu' has no
 member named 'last_error_done'; did you mean 'last_error_time'?
Message-ID: <202505281504.d4RHbWoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   cda75391a381aef32ba5fe01ec239ea1d5ac2c12
commit: cda75391a381aef32ba5fe01ec239ea1d5ac2c12 [325/325] bcachefs: sysfs.sb_errors
config: csky-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281504.d4RHbWoL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281504.d4RHbWoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281504.d4RHbWoL-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/sb-errors.c: In function 'bch2_fs_errors_to_text':
>> fs/bcachefs/sb-errors.c:94:43: error: 'struct bch_sb_error_entry_cpu' has no member named 'last_error_done'; did you mean 'last_error_time'?
      94 |                 bch2_prt_datetime(out, i->last_error_done);
         |                                           ^~~~~~~~~~~~~~~
         |                                           last_error_time


vim +94 fs/bcachefs/sb-errors.c

    80	
    81	void bch2_fs_errors_to_text(struct printbuf *out, struct bch_fs *c)
    82	{
    83		if (out->nr_tabstops <= 1)
    84			printbuf_tabstop_push(out, 16);
    85	
    86		guard(mutex)(&c->fsck_error_counts_lock);
    87	
    88		bch_sb_errors_cpu *e = &c->fsck_error_counts;
    89		darray_for_each(*e, i) {
    90			bch2_sb_error_id_to_text(out, i->id);
    91			prt_tab(out);
    92			prt_u64(out, i->nr);
    93			prt_tab(out);
  > 94			bch2_prt_datetime(out, i->last_error_done);
    95			prt_newline(out);
    96		}
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
