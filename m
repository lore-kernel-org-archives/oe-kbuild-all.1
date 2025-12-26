Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C87E792
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766785423; cv=none; b=a2RU+A7tit1T/bQ1UTRyt4jBcekibS29FVcXF+iIjjsSAKzI9YrilckAchqA0cwsikCJ8E6zrnMMsPFOcku/9MLm6CUovv9w1OeB96eItm+mXvTN5grYvbx0nFdzjJ+Z/To5tqarQm0Jmg0G1bls06V/go58KryVVtl4qbFIsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766785423; c=relaxed/simple;
	bh=yaBbiOlM2mJ5kAmcTYx2T1ewtKKnpKOuNo+ruuQDG3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gm08q8rTJEhxx/0qkL9MG2nJmnELn0z+vpZB6D4jSh8T0WxFJ0ghJZBLQ65qhRlu6HqIpNodrtuOyUWsZQqWZNrw00pgB//rrAT4D2u17H89yry/Kg39YxE+Xf9hq4hyRY/caqO/aRfZ6WBJHw415JVohB5nv2WPGE59NQy6h9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJ26CE9u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJ26CE9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766785421; x=1798321421;
  h=date:from:to:cc:subject:message-id;
  bh=yaBbiOlM2mJ5kAmcTYx2T1ewtKKnpKOuNo+ruuQDG3g=;
  b=kJ26CE9uWrVv84/H/GwTC0ptbrm84tCU8o2p1U1a9nFkum5l5++0+rIb
   lzzbiNVUtCcY475DZpzSR+b09JmgpA5h4pIRpzYdA9J81AW9EJWwuwqYT
   dmLtnyoeEgQa3q0Shgmh+DWHL2iR93LpuoLi4V+ZD0XHqE73fnDeuXTgu
   FHBhQVnCT4Cs/ehhjks1BN/YASP9mcepsWO5BuXsB79lq5jbQt5vQcavY
   sGr2MyX04A3I+yjgItU/h85o7MdioerHrGygYqajzfeYTd0zGfsG4YJhp
   zfpKf0JG864KEptijjNFWYUHW5C/8S5f0YpPKOfNNieyXAGLm7Ckf6X80
   g==;
X-CSE-ConnectionGUID: X2Wtg3oMTX+RqENg8MlbjA==
X-CSE-MsgGUID: F1xIcgbJR327yok19SGmtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="67727380"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="67727380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 13:43:40 -0800
X-CSE-ConnectionGUID: Io7q014nQ6eerOxQ4bQqYw==
X-CSE-MsgGUID: 2dzTq5GiT0a8rD7mmqj6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="201376474"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Dec 2025 13:43:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZFay-000000005Mv-3ZRZ;
	Fri, 26 Dec 2025 21:43:36 +0000
Date: Sat, 27 Dec 2025 05:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 59/61]
 fs/bcachefs/snapshots/snapshot.c:378:7: warning: variable 'lock_dropped' set
 but not used
Message-ID: <202512270516.lXdVnAcY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ab7790c98aa3e45211fbe8dc5ea438beb07d7c63
commit: bf5772142c3fa1c4a98cd4956342e80b2f0e0c2f [59/61] bcachefs: Drop locks for printbuf allocation in snapshot_get_print()
config: nios2-randconfig-r071-20251227 (https://download.01.org/0day-ci/archive/20251227/202512270516.lXdVnAcY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270516.lXdVnAcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512270516.lXdVnAcY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/snapshots/snapshot.c: In function 'snapshot_get_print':
>> fs/bcachefs/snapshots/snapshot.c:378:7: warning: variable 'lock_dropped' set but not used [-Wunused-but-set-variable]
     bool lock_dropped = false;
          ^~~~~~~~~~~~


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
