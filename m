Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D13C2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769491678; cv=none; b=mMFzA8stLBaUxreStgm0HRtSuTgmI7c2yTq8WhFumpZ3TZLjJNthR1m5oiuY6RW1lkeD5gHx9lOMIS0KuYqd8Q+mW83YJJDUzcCCzqUZ6AMwn1KE725S51L7BVWVeLzlFJhteEGWqxNV4hWSr8dSMwdLNfh9qi05zTkw0+hx7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769491678; c=relaxed/simple;
	bh=WyBI7H7xraEBoOvgSfwCSRiCNNyY2i4Dj1AZuujIJcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W/8EmMGhLO+K7Va6VKC/VS/o8nPYSiNMFZExY6PS5rgJ0CYfwbLCfBpWc7koHqX6xNPaKfJOjpsvboqf9Nsa2DDN7hflfcDCQXiSHNz3wLmrQ9OYzoCnxyGO8c8YwAb8zxnitSj3lOlURjadYRbS63n0YfT6Git8HpTUc7BnhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuCcs1N6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuCcs1N6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769491677; x=1801027677;
  h=date:from:to:cc:subject:message-id;
  bh=WyBI7H7xraEBoOvgSfwCSRiCNNyY2i4Dj1AZuujIJcc=;
  b=TuCcs1N6Bl5nW5CuWQ6NJvH8HsVsdnLZFCGf+lxosVp1lCQ/LITWJGXu
   EaZsFwB7qAu95RXbp3IChLoKvNNcPgumaOdJ0AJPs/iKMnUqzrNVjh3+X
   nH6oeR7Q7gx6b2sjSeyKDpoIfuN/Xx/cJC9LqhfXx8HHkoaSIxtbxvrM5
   TdQ8m3OAtLT38waaGLVkGDNlrl12F1RnU61I8k/ht+yTrRHI3JWFBJ4gg
   xol91BuOKB7urK1BunvZN51XxhrGRLd36zQfNyNpQo46LZqBs8Ftqt6Gk
   p278B1PYKxIBxzYDSFdV9DJE3AICmqZ0pG8yJTDuc5c4FmmH7J/jNbuHX
   g==;
X-CSE-ConnectionGUID: BXdVbSQlS9SSdrVmlAhKwg==
X-CSE-MsgGUID: JIo9k3bYQAmoYKyx+TnOrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81311139"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81311139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:27:56 -0800
X-CSE-ConnectionGUID: vdRLbhnCTAKxpOG2il+a9Q==
X-CSE-MsgGUID: 0Aowh2ufRfizN3xoBf2cdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208239768"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 21:27:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkbcG-00000000Y1Y-1e2g;
	Tue, 27 Jan 2026 05:27:52 +0000
Date: Tue, 27 Jan 2026 13:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 57/271]
 fs/bcachefs/snapshots/snapshot.c:378:14: warning: variable 'lock_dropped' set
 but not used
Message-ID: <202601271339.Cv9qjHen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   75aace6c0e384d8fdc16837afd0e987be3e52b1e
commit: 54998105f6ef5d0c64d7986fd6f670d2b4f3bef4 [57/271] bcachefs: Drop locks for printbuf allocation in snapshot_get_print()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601271339.Cv9qjHen-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271339.Cv9qjHen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271339.Cv9qjHen-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/snapshots/snapshot.c: In function 'snapshot_get_print':
>> fs/bcachefs/snapshots/snapshot.c:378:14: warning: variable 'lock_dropped' set but not used [-Wunused-but-set-variable]
     378 |         bool lock_dropped = false;
         |              ^~~~~~~~~~~~


vim +/lock_dropped +378 fs/bcachefs/snapshots/snapshot.c

   330	
   331	static int snapshot_get_print(struct printbuf *out, struct btree_trans *trans, u32 id)
   332	{
   333		prt_printf(out, "%u \t", id);
   334	
   335		struct bch_snapshot s;
   336		int ret = bch2_snapshot_lookup(trans, id, &s);
   337		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   338			return ret;
   339	
   340		if (ret) {
   341			prt_str(out, bch2_err_str(ret));
   342		} else {
   343			if (BCH_SNAPSHOT_DELETED(&s))
   344				prt_str(out, "deleted ");
   345			if (BCH_SNAPSHOT_NO_KEYS(&s))
   346				prt_str(out, "no_keys ");
   347			if (BCH_SNAPSHOT_WILL_DELETE(&s))
   348				prt_str(out, "will_delete ");
   349			if (BCH_SNAPSHOT_SUBVOL(&s))
   350				prt_printf(out, "subvol %u", le32_to_cpu(s.subvol));
   351	
   352			prt_tab(out);
   353	
   354			if (s.subvol) {
   355				struct bch_subvolume subvol;
   356				ret = bch2_subvolume_get(trans, le32_to_cpu(s.subvol), false, &subvol);
   357				if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   358					return ret;
   359	
   360				if (ret)
   361					prt_str(out, bch2_err_str(ret));
   362				else
   363					try(bch2_inum_to_path(trans, (subvol_inum)
   364						{ le32_to_cpu(s.subvol), le64_to_cpu(subvol.inode) }, out));
   365			}
   366	
   367			prt_tab(out);
   368	
   369			u64 v[1] = { 0 };
   370			try(bch2_fs_accounting_read_key2(trans, v, snapshot, id));
   371	
   372			prt_human_readable_u64(out, v[0] << 9);
   373			prt_tab_rjust(out);
   374		}
   375	
   376		prt_newline(out);
   377	
 > 378		bool lock_dropped = false;
   379		allocate_dropping_locks_norelock(trans, lock_dropped,
   380				!bch2_printbuf_make_room_gfp(out, 1024, _gfp));
   381		return 0;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
