Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C73A268
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 23:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716593452; cv=none; b=B5SrQ4PovyonSYAeg2rURkPIrJ1YEI5fqaGPBmA92arKcViCrS/ApbdU+w8ePLEky1hJHBkboTgGy7FsXDBKyqHIH1fKOv596aKzfFS93cAjfbE1bhVtySkAsp1qhfNKPp7nki1K3OyaNZ9ahyMupSQBLiWR1hVIPcGi6Joe9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716593452; c=relaxed/simple;
	bh=6VLY/zIV6NIXkFqOUeexisNeycdgx+BdE1r/WZfZSDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rm2r4y8oVs5qjD7gAhvdsUJk8iP+PFYLArID6SqAeyAEv1RHYPUcTrpYLt++M6V1qAYsbZ8vTL24+j2adoav2pisb7N+EzPCBG+jVQo1vjbRAdYXM4fOFHckoeabhobdDBk847icDoch+WctmpEsYJs6BcPlEy+kU+XVs7i1iDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wsz9CF66; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wsz9CF66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716593451; x=1748129451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6VLY/zIV6NIXkFqOUeexisNeycdgx+BdE1r/WZfZSDk=;
  b=Wsz9CF667hXax1bunnammxQ9kBVFJbUj4Uwl4EtRQk2mzvN1KKNh0peS
   Wxo/bGQ5/cg2IqLIwhTs3U6AF/B4N/EG68ZTRKADTZ5EPwe1ZFhGygNSm
   7i/tKp0rIRCZ9E4A6EcakKEB/VHGnfopcn5IpxX4XAjxVZrwvaofNqJWA
   Q7edYBbJhz+zuvOfNoQypWQrFyt/EveFHiNq92ZeZvjP0vZqT1OTbT6OX
   LDXNfdtP9jRe5dNrtniI5+hWScIyDd/GrD5WzpJfNVO6f5Zmp750WyYCN
   8MbhN/CsqzkXeYCDuhEO2Z6f5IpSiVoZdf27SdisU/NNM3/VZxoay/+sy
   g==;
X-CSE-ConnectionGUID: KshIubgPTLa2TvQRxzLKrg==
X-CSE-MsgGUID: SbR3p4rWTC2Bfe80g08nzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="35506306"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="35506306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 16:30:51 -0700
X-CSE-ConnectionGUID: bQ26E/umSmanYtxAogmjQQ==
X-CSE-MsgGUID: NAOZphGGQB+q8isKMZlpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="57385659"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 May 2024 16:30:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAeN4-00060l-2F;
	Fri, 24 May 2024 23:30:46 +0000
Date: Sat, 25 May 2024 07:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 21/23] fs/bcachefs/btree_io.c:541:33:
 warning: format '%zu' expects argument of type 'size_t', but argument 3 has
 type 'long unsigned int'
Message-ID: <202405250757.U8G0SdUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   254510a1c2691db5fdaccbafe0e1872fd7a2e4e6
commit: ab2c3aaf4521ab863cb8efebf4139add2ccf58ae [21/23] bcachefs: Plumb bkey into __btree_err()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240525/202405250757.U8G0SdUV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250757.U8G0SdUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250757.U8G0SdUV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/vstructs.h:5,
                    from fs/bcachefs/bcachefs_format.h:80,
                    from fs/bcachefs/bcachefs.h:207,
                    from fs/bcachefs/btree_io.c:3:
   fs/bcachefs/btree_io.c: In function 'btree_err_msg':
>> fs/bcachefs/btree_io.c:541:33: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'long unsigned int' [-Wformat=]
     541 |                 prt_printf(out, " bset byte offset %zu",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
     542 |                            (unsigned long)(void *)k -
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     long unsigned int
     543 |                            ((unsigned long)(void *)i & ~511UL));
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:192:63: note: in definition of macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/btree_io.c:541:54: note: format string is defined here
     541 |                 prt_printf(out, " bset byte offset %zu",
         |                                                    ~~^
         |                                                      |
         |                                                      unsigned int
         |                                                    %lu


vim +541 fs/bcachefs/btree_io.c

   519	
   520	static void btree_err_msg(struct printbuf *out, struct bch_fs *c,
   521				  struct bch_dev *ca,
   522				  struct btree *b, struct bset *i, struct bkey_packed *k,
   523				  unsigned offset, int write)
   524	{
   525		prt_printf(out, bch2_log_msg(c, "%s"),
   526			   write == READ
   527			   ? "error validating btree node "
   528			   : "corrupt btree node before write ");
   529		if (ca)
   530			prt_printf(out, "on %s ", ca->name);
   531		prt_printf(out, "at btree ");
   532		bch2_btree_pos_to_text(out, c, b);
   533	
   534		printbuf_indent_add(out, 2);
   535	
   536		prt_printf(out, "\nnode offset %u/%u",
   537			   b->written, btree_ptr_sectors_written(&b->key));
   538		if (i)
   539			prt_printf(out, " bset u64s %u", le16_to_cpu(i->u64s));
   540		if (k)
 > 541			prt_printf(out, " bset byte offset %zu",
   542				   (unsigned long)(void *)k -
   543				   ((unsigned long)(void *)i & ~511UL));
   544		prt_str(out, ": ");
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
