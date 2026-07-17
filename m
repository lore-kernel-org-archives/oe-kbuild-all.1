Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057C3A0E8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320449; cv=none; b=UvIBb9pfxJzAd4z1mQpm+67J9yQNoc1G8z0E5YC0llxjT6UHq8/7Nq0R2WXjBjInnoaPftukZR8CoWGY8dn3ObGD7sGBN1m7P2OYUfoczw95LSNxGpjTNMXSPQV/SFpo0hqE+KSqwk314O7wuxuPgSihW5f5qkiwtFALNQoRrBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320449; c=relaxed/simple;
	bh=C4Gefr3Uue7XdCDxV4VvWZ+DAuI+KWVFOKvqBoDgOGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gK8Ja+R/YBylsUO5lcCa50UCbYTlyIIVDlwsJRBtED92P0BT7DM8IhA5rHjLdllwIuivC8yxwGtUxL6Ph+Ytk00SRd2kcxcx9zvnMgrdQctiAd8twmlClRZu2ac8iAR5f1X4fr44NLHAcUrJ4+b1moxIv2THqWo7BG2oMgT+k74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nULYkGq/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nULYkGq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784320447; x=1815856447;
  h=date:from:to:cc:subject:message-id;
  bh=C4Gefr3Uue7XdCDxV4VvWZ+DAuI+KWVFOKvqBoDgOGk=;
  b=nULYkGq/YW9ABKhRBFkaWc2uSZmJyuKHpRKtaqcy8eKWodBAeaVAyxkd
   7P72e6c4MZHeTvYzWisf9H0hCXh+ABFyJZCz0CWsP6eDhgSu+PvaXtuy9
   IeQ7XSI/nLzgt6+uKNLvwDJARzu5wT7hTKhSykULl9F5ZCvP+IHPV1lGK
   rthaWlfGiTU46CI4UuAz5MzblP+Y8y5eTxByX6rciopUnz//SYysd64gj
   +VXL884mTgRnGqgd7h2liKVxRk6CI38OfKGzWuZeIJO/1E83lEBxoxc3b
   yZvVYINeRLnov/tFcfq02+1ZKjmECT4erTCK5xSW1ZM3eIJ326eWXRfjJ
   w==;
X-CSE-ConnectionGUID: jLMxPPKaQaKBr4dZptPdrA==
X-CSE-MsgGUID: vKtfQFCtSgWBNsjCIRlxaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85113905"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85113905"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:34:06 -0700
X-CSE-ConnectionGUID: NtyOqUriRzGNziPNLhm09A==
X-CSE-MsgGUID: FxWCKi6nSymbL3O9oiTANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260682453"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2026 13:34:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkpFy-00000000T9B-0GDo;
	Fri, 17 Jul 2026 20:34:02 +0000
Date: Sat, 18 Jul 2026 04:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Jul Lang <jullanggit@proton.me>
Subject: [koverstreet-bcachefs:pr/1073 18/19]
 fs/bcachefs/init/dev.c:865:13: warning: unused variable 'ret'
Message-ID: <202607180439.D3KeSBBj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   f7205707584bda883ae253f4c02d3ef7786d4db0
commit: c11fcc6b8b4ad911633c2f7ae6a5318982aff2c9 [18/19] merge
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607180439.D3KeSBBj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180439.D3KeSBBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180439.D3KeSBBj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/init/dev.c: In function '__bch2_dev_set_state':
>> fs/bcachefs/init/dev.c:865:13: warning: unused variable 'ret' [-Wunused-variable]
     865 |         int ret = 0;
         |             ^~~


vim +/ret +865 fs/bcachefs/init/dev.c

bf25974be5b42c Kent Overstreet 2025-10-04  860  
bf25974be5b42c Kent Overstreet 2025-10-04  861  int __bch2_dev_set_state(struct bch_fs *c, struct bch_dev *ca,
bf25974be5b42c Kent Overstreet 2025-10-04  862  			 enum bch_member_state new_state, int flags,
bf25974be5b42c Kent Overstreet 2025-10-04  863  			 struct printbuf *err)
bf25974be5b42c Kent Overstreet 2025-10-04  864  {
bf25974be5b42c Kent Overstreet 2025-10-04 @865  	int ret = 0;
bf25974be5b42c Kent Overstreet 2025-10-04  866  
336a9d7cd005d5 Kent Overstreet 2026-05-08  867  	bool was_rw = ca->mi.state == BCH_MEMBER_STATE_rw;
1b06db5b722966 Kent Overstreet 2025-12-30  868  	bool do_reconcile_scan =
1b06db5b722966 Kent Overstreet 2025-12-30  869  		new_state == BCH_MEMBER_STATE_rw ||
1b06db5b722966 Kent Overstreet 2025-12-30  870  		new_state == BCH_MEMBER_STATE_evacuating;
1b06db5b722966 Kent Overstreet 2025-12-30  871  
1b06db5b722966 Kent Overstreet 2025-12-30  872  	struct reconcile_scan s = new_state == BCH_MEMBER_STATE_rw
1b06db5b722966 Kent Overstreet 2025-12-30  873  		? (struct reconcile_scan) { .type = RECONCILE_SCAN_pending }
1b06db5b722966 Kent Overstreet 2025-12-30  874  		: (struct reconcile_scan) { .type = RECONCILE_SCAN_device, .dev = ca->dev_idx };
1b06db5b722966 Kent Overstreet 2025-12-30  875  
1b06db5b722966 Kent Overstreet 2025-12-30  876  	if (ca->mi.state == new_state) {
1b06db5b722966 Kent Overstreet 2025-12-30  877  		if (new_state == BCH_MEMBER_STATE_evacuating)
1b06db5b722966 Kent Overstreet 2025-12-30  878  			return bch2_set_reconcile_needs_scan(c, s, true);
bf25974be5b42c Kent Overstreet 2025-10-04  879  		return 0;
1b06db5b722966 Kent Overstreet 2025-12-30  880  	}
bf25974be5b42c Kent Overstreet 2025-10-04  881  
bf25974be5b42c Kent Overstreet 2025-10-04  882  	if (!bch2_dev_state_allowed(c, ca, new_state, flags, err))
bf25974be5b42c Kent Overstreet 2025-10-04  883  		return bch_err_throw(c, device_state_not_allowed);
bf25974be5b42c Kent Overstreet 2025-10-04  884  
bf25974be5b42c Kent Overstreet 2025-10-04  885  	if (new_state != BCH_MEMBER_STATE_rw)
bf25974be5b42c Kent Overstreet 2025-10-04  886  		__bch2_dev_read_only(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  887  
ee3d225f30a142 Kent Overstreet 2025-11-23  888  	bch_notice_dev(ca, "%s", bch2_member_states[new_state]);
bf25974be5b42c Kent Overstreet 2025-10-04  889  
581f7e27bc9728 Kent Overstreet 2025-11-12  890  	if (do_reconcile_scan)
581f7e27bc9728 Kent Overstreet 2025-11-12  891  		try(bch2_set_reconcile_needs_scan(c, s, false));
7ee28fc7955287 Kent Overstreet 2025-08-23  892  
bf25974be5b42c Kent Overstreet 2025-10-04  893  	scoped_guard(mutex, &c->sb_lock) {
bf25974be5b42c Kent Overstreet 2025-10-04  894  		struct bch_member *m = bch2_members_v2_get_mut(c->disk_sb.sb, ca->dev_idx);
bf25974be5b42c Kent Overstreet 2025-10-04  895  		SET_BCH_MEMBER_STATE(m, new_state);
bf25974be5b42c Kent Overstreet 2025-10-04  896  		bch2_write_super(c);
bf25974be5b42c Kent Overstreet 2025-10-04  897  	}
bf25974be5b42c Kent Overstreet 2025-10-04  898  
70c107dddc3792 Kent Overstreet 2026-02-08  899  	if (new_state == BCH_MEMBER_STATE_rw && bch2_dev_is_online(ca))
bf25974be5b42c Kent Overstreet 2025-10-04  900  		__bch2_dev_read_write(c, ca);
bf25974be5b42c Kent Overstreet 2025-10-04  901  
c25cbe6eb98d73 Kent Overstreet 2026-05-03  902  	/*
336a9d7cd005d5 Kent Overstreet 2026-05-08  903  	 * Any RW transition (in or out) changes the EC widening target (RW
336a9d7cd005d5 Kent Overstreet 2026-05-08  904  	 * members) for this disk_label; queue a stripes scan so can_widen is
336a9d7cd005d5 Kent Overstreet 2026-05-08  905  	 * refreshed. Must come after the SB write above so the scan, which
336a9d7cd005d5 Kent Overstreet 2026-05-08  906  	 * reads ca->mi.state, sees the new state.
336a9d7cd005d5 Kent Overstreet 2026-05-08  907  	 *
336a9d7cd005d5 Kent Overstreet 2026-05-08  908  	 * Going-RW grows the target so newly-widenable stripes can be picked
336a9d7cd005d5 Kent Overstreet 2026-05-08  909  	 * up; going-from-RW shrinks it, and while get_old_stripe demotes
336a9d7cd005d5 Kent Overstreet 2026-05-08  910  	 * lazily on the reuse path, fsck and the canonical can_widen value
336a9d7cd005d5 Kent Overstreet 2026-05-08  911  	 * still need the scan to converge.
c25cbe6eb98d73 Kent Overstreet 2026-05-03  912  	 */
336a9d7cd005d5 Kent Overstreet 2026-05-08  913  	if (new_state == BCH_MEMBER_STATE_rw || was_rw)
c25cbe6eb98d73 Kent Overstreet 2026-05-03  914  		try(bch2_set_reconcile_needs_scan(c,
c25cbe6eb98d73 Kent Overstreet 2026-05-03  915  			(struct reconcile_scan) { .type = RECONCILE_SCAN_stripes }, false));
c25cbe6eb98d73 Kent Overstreet 2026-05-03  916  
581f7e27bc9728 Kent Overstreet 2025-11-12  917  	if (do_reconcile_scan)
581f7e27bc9728 Kent Overstreet 2025-11-12  918  		try(bch2_set_reconcile_needs_scan(c, s, true));
bf25974be5b42c Kent Overstreet 2025-10-04  919  
5d0734b50a4d9a Jul Lang        2026-07-14  920  	return 0;
bf25974be5b42c Kent Overstreet 2025-10-04  921  }
bf25974be5b42c Kent Overstreet 2025-10-04  922  

:::::: The code at line 865 was first introduced by commit
:::::: bf25974be5b42c0341a7f17cb7e6e835d80b41e6 bcachefs: split out init/dev.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
