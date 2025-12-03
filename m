Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359C482EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764802120; cv=none; b=gutiOx7ktP1thnOEeONnpgJyIYj4kQc0FJ+E90JGujnLzCCYwrNTzVtfU/5yDd1Q8s2KcNz3IdEbWFNcSr5zOrSDdY0Wdo34s5VSOrFfHV4dzPlGuNTaYvTRP8SXybT+Gs2MSwBTeSBaCA5Gebp1aiDwXKx7jk8BYBTq4DYvK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764802120; c=relaxed/simple;
	bh=GHNG2d1M08sWXg046EKoyz5E9NwsTY+imy8927kKv5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mFS0wDeJw9l7k2xXHQuKsn2cEG5vKYUPJkZnTftP/dHRmmWbpT5f6jcu91Ls5psu9N2cJ+HjHbfNx71sA6n7nCGTL6UP6uHWG6KPaqx43PyRil9JyT+CnX56XRRcdC+GD4+YPyLoYXINcaIbs+P9oVcgpquOA2NFUYG4QS2Frto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VroXT2/H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VroXT2/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802119; x=1796338119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHNG2d1M08sWXg046EKoyz5E9NwsTY+imy8927kKv5M=;
  b=VroXT2/HmerA9vVs6m8oQiEgmz4ys5jWk4Dda9vDTyAe/aABG6Kl6F5Z
   /y3IsySawaAFX6MiFLsFshKgpAPHpdnbXueHbdxDowo16Kw23GFZlgzGK
   2PXCMXeWMNJ8i14pZ7BESAqR0ZjpWC0hoA+Y2yu7r/h5gnFVY4cOkC98s
   JvSP2Bnw9fPDKE9Jj8mTptSYzVJKGI4eE1JF037e+clrBwB4ZsV5cHKRu
   9q1WFwwvzvFIWkRRSK/EGe81ArtYUpGIdJ/2tbNLuiHw1OB4kxwwS8MPR
   aDd/iupaP+77UQBfjA5M9zaTLp0Z5yXulhDk25yY6A6sszHirDLTk1xz4
   A==;
X-CSE-ConnectionGUID: fONkSyJgQEaP+RlkphaYPA==
X-CSE-MsgGUID: NS54KD5SRZyVbRiUsQFWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84211207"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="84211207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:48:38 -0800
X-CSE-ConnectionGUID: 7hx4lJT7QZqzWWCWscr2bg==
X-CSE-MsgGUID: TBW/wAGoSVeNZabVwnLk8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194857819"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 14:48:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQveE-00000000DDl-0hO6;
	Wed, 03 Dec 2025 22:48:34 +0000
Date: Thu, 4 Dec 2025 06:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 464/1068]
 fs/bcachefs/journal/journal.c:47:37: sparse: sparse: cast to non-scalar
Message-ID: <202512040615.OlpGZiln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   92092a7729703f2285902b56aacaae199a3517eb
commit: 3d1f4469e2743eb10d5450c26d37cac439a002f1 [464/1068] bcachefs: move journal code to subdir
config: alpha-randconfig-r112-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040615.OlpGZiln-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040615.OlpGZiln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040615.OlpGZiln-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/journal.c:47:37: sparse: sparse: cast to non-scalar
>> fs/bcachefs/journal/journal.c:47:37: sparse: sparse: cast from non-scalar
   fs/bcachefs/journal/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1326:38: sparse: sparse: array of flexible structures
   fs/bcachefs/journal/journal.c:774:17: sparse: sparse: cast to non-scalar
   fs/bcachefs/journal/journal.c:774:17: sparse: sparse: cast from non-scalar
   fs/bcachefs/journal/journal.c:1726:13: sparse: sparse: cast to non-scalar
   fs/bcachefs/journal/journal.c:1726:13: sparse: sparse: cast from non-scalar
   fs/bcachefs/journal/journal.c:344:6: sparse: sparse: context imbalance in 'bch2_journal_halt' - wrong count at exit
   fs/bcachefs/journal/journal.c:370:6: sparse: sparse: context imbalance in 'bch2_journal_entry_close' - wrong count at exit
   fs/bcachefs/journal/journal.c:539:9: sparse: sparse: context imbalance in 'journal_write_work' - wrong count at exit
   fs/bcachefs/journal/journal.c:758:6: sparse: sparse: context imbalance in 'bch2_journal_entry_res_resize' - wrong count at exit
   fs/bcachefs/journal/journal.c: note: in included file (through fs/bcachefs/btree/update.h):
   fs/bcachefs/journal/journal.h:329:29: sparse: sparse: context imbalance in 'bch2_journal_flush_seq_async' - different lock contexts for basic block
   fs/bcachefs/journal/journal.c:932:6: sparse: sparse: context imbalance in 'bch2_journal_noflush_seq' - different lock contexts for basic block
   fs/bcachefs/journal/journal.h:329:29: sparse: sparse: context imbalance in '__bch2_journal_meta' - different lock contexts for basic block
   fs/bcachefs/journal/journal.c:1082:9: sparse: sparse: context imbalance in '__bch2_next_write_buffer_flush_journal_buf' - wrong count at exit
   fs/bcachefs/journal/journal.c:1212:9: sparse: sparse: context imbalance in 'bch2_set_nr_journal_buckets_iter' - different lock contexts for basic block
   fs/bcachefs/journal/journal.c:1409:13: sparse: sparse: context imbalance in 'bch2_journal_writing_to_device' - wrong count at exit
   fs/bcachefs/journal/journal.c:1554:6: sparse: sparse: context imbalance in 'bch2_journal_set_replay_done' - wrong count at exit
   fs/bcachefs/journal/journal.c:1816:6: sparse: sparse: context imbalance in 'bch2_journal_debug_to_text' - wrong count at exit

vim +47 fs/bcachefs/journal/journal.c

e6fab655e6f59d fs/bcachefs/journal.c Kent Overstreet 2024-01-31  44  
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  45  static void bch2_journal_buf_to_text(struct printbuf *out, struct journal *j, u64 seq)
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  46  {
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15 @47  	union journal_res_state s = READ_ONCE(j->reservations);
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  48  	unsigned i = seq & JOURNAL_BUF_MASK;
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  49  	struct journal_buf *buf = j->buf + i;
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  50  
7423330e30ab91 fs/bcachefs/journal.c Kent Overstreet 2024-04-10  51  	prt_printf(out, "seq:\t%llu\n", seq);
1f6a66d990e636 fs/bcachefs/journal.c Kent Overstreet 2025-09-02  52  	guard(printbuf_indent)(out);
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  53  
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  54  	if (!buf->write_started)
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  55  		prt_printf(out, "refcount:\t%u\n", journal_state_count(s, i & JOURNAL_STATE_BUF_MASK));
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  56  
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  57  	struct closure *cl = &buf->io;
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  58  	int r = atomic_read(&cl->remaining);
898bda5b72a72a fs/bcachefs/journal.c Kent Overstreet 2025-01-23  59  	prt_printf(out, "io:\t%pS r %i\n", cl->fn, r & CLOSURE_REMAINING_MASK);
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  60  
35282ce9e82f6e fs/bcachefs/journal.c Kent Overstreet 2025-02-05  61  	if (buf->data) {
7423330e30ab91 fs/bcachefs/journal.c Kent Overstreet 2024-04-10  62  		prt_printf(out, "size:\t");
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  63  		prt_human_readable_u64(out, vstruct_bytes(buf->data));
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  64  		prt_newline(out);
35282ce9e82f6e fs/bcachefs/journal.c Kent Overstreet 2025-02-05  65  	}
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  66  
e1e50a63308f5f fs/bcachefs/journal.c Kent Overstreet 2025-03-18  67  	prt_printf(out, "expires:\t%li jiffies\n", buf->expires - jiffies);
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  68  
7423330e30ab91 fs/bcachefs/journal.c Kent Overstreet 2024-04-10  69  	prt_printf(out, "flags:\t");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  70  	if (buf->noflush)
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  71  		prt_str(out, "noflush ");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  72  	if (buf->must_flush)
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  73  		prt_str(out, "must_flush ");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  74  	if (buf->separate_flush)
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  75  		prt_str(out, "separate_flush ");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  76  	if (buf->need_flush_to_write_buffer)
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  77  		prt_str(out, "need_flush_to_write_buffer ");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  78  	if (buf->write_started)
5e105fb806c622 fs/bcachefs/journal.c Kent Overstreet 2024-03-08  79  		prt_str(out, "write_started ");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  80  	if (buf->write_allocated)
b25fd02ab4edb0 fs/bcachefs/journal.c Kent Overstreet 2024-04-19  81  		prt_str(out, "write_allocated ");
916abefd437be8 fs/bcachefs/journal.c Kent Overstreet 2024-01-31  82  	if (buf->write_done)
b25fd02ab4edb0 fs/bcachefs/journal.c Kent Overstreet 2024-04-19  83  		prt_str(out, "write_done");
06d493fee43be6 fs/bcachefs/journal.c Kent Overstreet 2024-02-17  84  	prt_newline(out);
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  85  }
e6a2566f7a009b fs/bcachefs/journal.c Kent Overstreet 2024-01-15  86  

:::::: The code at line 47 was first introduced by commit
:::::: e6a2566f7a009b644fd84a43a6c1e3a53bb0bf00 bcachefs: Better journal tracepoints

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
