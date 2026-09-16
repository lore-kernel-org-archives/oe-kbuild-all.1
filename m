Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CC463B87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554330; cv=none; b=RlqbQNJDRKjlF79xwk3dN9WNVbSyxyl7BaOZcr7tuJZHFjtE6LJgsYU4LVfeJRaBUm6C71Oh584GSZij1A4p3iz7kkTaj3+Sbv6RjmyuygmuQgpk/zPRxLiVb+r4RzYK2H95ieszYyRGTaLyKdB8spTNJQByup0KeJgQ1haK10I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554330; c=relaxed/simple;
	bh=hM2fJ2DeRTVuE5EFfMrgahhpFDgDIAIi7kMOi+rr+VM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fw+WAFNI3EMx5AsTyF9ilEXcYuvp0hzimR/yqgdTN0688cfghABajdes4vPBLfHL77eVj2LoyXIasZraudsnsRECuxpYhoqWrSbNWw4WVulyiAPfyISkNkBPy83NOxHHuwmOvBcpyW2lAbG2kIAka7r4EpTFwEBtmUaKWwFlgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUJ7mv2K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUJ7mv2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789554326; x=1821090326;
  h=date:from:to:cc:subject:message-id;
  bh=hM2fJ2DeRTVuE5EFfMrgahhpFDgDIAIi7kMOi+rr+VM=;
  b=fUJ7mv2K3ten1/uFFJSJPb2CNc14oZVpqypEExb9HVQThVlJB+c8ESw3
   sAC5rHoD8SktYkH+22vcl2zC7w51d901Bb1un3FN5ZjmrVTeOVWM9lmiX
   tmO1kcL8mVVj2k/0XrepZlTTUw38SUL9droMZeVmKdDoYRlgUVmKzQVTx
   0wTy1Ren55RUQH4zwnqLz77+t3qERtQjqL99O7LMT2SXGD/z9FSuntkIW
   teLi0+w76yUQdRfo2AHUWav5LS3S9k2aeWUPy3RzM3FAAdZw+lkNnUObd
   vWBkgYi0n5o1Zmf/q2uq+Xplyf6NffBZ3HwGkfdMAhTn+00u0Mk7weaOz
   Q==;
X-CSE-ConnectionGUID: XcLiumozQxu6MgpWbiEtNg==
X-CSE-MsgGUID: 96vUIGzgR4KRSHIhndz4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89946489"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89946489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:25:19 -0700
X-CSE-ConnectionGUID: be0O6ZGMRmuVlMxHhqIcMg==
X-CSE-MsgGUID: sNMtd35lTvmq9dczH3dn4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269603667"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2026 03:25:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6mpH-000000005sL-3YSj;
	Wed, 16 Sep 2026 10:25:15 +0000
Date: Wed, 16 Sep 2026 18:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 19/101]
 fs/bcachefs/util/util.c:807:9: sparse: sparse: restricted blk_opf_t degrades
 to integer
Message-ID: <202609161837.pgkwJSHR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 6caf75dbc37a5d4876a4b96f48e86a24c66c84fe [19/101] bcachefs: Improve bch2_bio_to_text()
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609161837.pgkwJSHR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161837.pgkwJSHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161837.pgkwJSHR-lkp@intel.com/

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
