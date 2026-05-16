Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE3405C4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778897351; cv=none; b=uPGcXjxd6G8Y5qAxOANI8ytAE1u2ua+qBvr8GTvUrv+8NfckGdfWhL3/ACEX8e7nAQidGXQOXW/RVq6OsPL49A5AbbTOQYnRCOC81DnzEXTz0GpDOgkPDRe6hVam8QFLXUK7RTqdtDfCWJnpi3NqnuMikfnX48Skn9Zmg+0bYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778897351; c=relaxed/simple;
	bh=bG25b9jupPPWbaO+jbcH2njrSCcHiVfvAxtG4JLkGks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2Mpvnh1kXEqrSWVqFEAxSc4Di2NKXfnjZDmRASuLUqyqJ12E3arZIQGmTqzv2i9C3ldJ2QY1wq2IVjnFvjEiX/Zqg6Gn3ZxYstcoKv6J9B4arFxblfuRFgzszxO4+lhV0SnFNGfvgJkH9vTaWPreB09Umq6Z2t5lSzazZfUbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx4IAPn1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx4IAPn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778897350; x=1810433350;
  h=date:from:to:cc:subject:message-id;
  bh=bG25b9jupPPWbaO+jbcH2njrSCcHiVfvAxtG4JLkGks=;
  b=Bx4IAPn14VNMzG3xmuEQPXhZ/TUN9Y7l6cddWsJeCGD20F3uoT8A5vbZ
   7fHEX/LNzXgnbnr2ETZK15aqdpPCQWWSM0k3KYFOaweJJIVOGp6DbZARL
   ReZjEFIsP00PyD7H0lO5o1jzehJqEYH8pd+U3bu4LryufH8YqnHd4PG1C
   IdFugttQmNKbckrTCtwRb+9m4h3rd8imSBEU7oE38t9JMx7EPXjgpXWYU
   IksLtglTYwnwwKsNw3+x9sv5hTMUCcFLInzON2+P4jIaIc+KGmqca8UFV
   fXcP6M2hnUZDRlzPR1weSHvv2yoVlYHy5iHYZEa9g39gJ3KFFjxg7YTAq
   g==;
X-CSE-ConnectionGUID: qLg27akvQG6Du/f9dxOjJg==
X-CSE-MsgGUID: I24wkhYyQECKDkuiM2ww5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97283241"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="97283241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:09:10 -0700
X-CSE-ConnectionGUID: eTUQOJuSR96KQ0mwVsqBxw==
X-CSE-MsgGUID: NHG058ViSauT0m6jG7w1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="240687786"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 19:09:08 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO4Sg-000000000Md-1VsC;
	Sat, 16 May 2026 02:09:06 +0000
Date: Sat, 16 May 2026 10:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 19/101]
 fs/bcachefs/util/util.c:807:9: sparse: sparse: restricted blk_opf_t degrades
 to integer
Message-ID: <202605161026.uTfuDuF7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 6caf75dbc37a5d4876a4b96f48e86a24c66c84fe [19/101] bcachefs: Improve bch2_bio_to_text()
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260516/202605161026.uTfuDuF7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161026.uTfuDuF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161026.uTfuDuF7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/util/util.c:807:9: sparse: sparse: restricted blk_opf_t degrades to integer
   fs/bcachefs/util/util.c:808:9: sparse: sparse: restricted blk_opf_t degrades to integer

vim +807 fs/bcachefs/util/util.c

   794	
   795	void bch2_bio_to_text(struct printbuf *out, struct bio *bio)
   796	{
   797		if (!out->nr_tabstops)
   798			printbuf_tabstop_push(out, 24);
   799	
   800		prt_printf(out, "bi_bdev:\t");
   801		if (bio->bi_bdev)
   802			prt_bdevname(out, bio->bi_bdev);
   803		else
   804			prt_str(out, "(null|");
   805		prt_newline(out);
   806	
 > 807		prt_printf(out, "bi_opf:\t%s ", bch2_request_op_strs[bio_op(bio)]);
   808		prt_bitflags(out, bch2_request_flag_strs, bio->bi_opf >> REQ_OP_BITS);
   809		prt_newline(out);
   810	
   811		prt_str(out, "bi_flags:\t");
   812		prt_bitflags(out, bch2_bio_flag_strs, bio->bi_flags);
   813		prt_newline(out);
   814	
   815		prt_printf(out, "bi_status:\t%u\n", bio->bi_status);
   816	
   817		prt_printf(out, "bi_iter.bi_sector\t%llu\n",	(u64) bio->bi_iter.bi_sector);
   818		prt_printf(out, "bi_iter.bi_size\t%u\n",	bio->bi_iter.bi_size);
   819		prt_printf(out, "bi_iter.bi_idx\t%u\n",		bio->bi_iter.bi_idx);
   820		prt_printf(out, "bi_iter.bi_bvec_done\t%u\n",	bio->bi_iter.bi_bvec_done);
   821	
   822		prt_printf(out, "bi_remaining:\t%u\n",		atomic_read(&bio->__bi_remaining));
   823		prt_printf(out, "bi_end_io:\t%ps\n",		bio->bi_end_io);
   824	
   825		prt_printf(out, "bi_vcnt\t%u\n",		bio->bi_vcnt);
   826		prt_printf(out, "bi_max_vecs\t%u\n",		bio->bi_max_vecs);
   827	}
   828	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
