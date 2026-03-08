Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F92556E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929231; cv=none; b=bSoPF1S9ZXdzvHlapzXlAvwog/WIfau2Y7H8YFM2VaafyEVbUkn0l7VwT0J6ue6EEpRoazHtuYK/gEI3IlTGmYpfc53OMPzgjRuFX82UCWQ/fimMVguM27KVRuuEefOHjINSoKOXXA2nFZrts3uHpqEWTcZ4dLvtl1Q3Oq3F1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929231; c=relaxed/simple;
	bh=D0rOCoCwxTOZdR1AhGhqKCwKtR18CtaFGkAYeolEVnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EsKkgLwszKS3mCtY3Vh3sA3zNHKueFztJa+rgvvpSNUpQEAH5F7lTKPGaMoZZ3I3t47xUkZExfaEaMuai3CmfjPUfRIpymBzLWSDeSsrsWFimdDPQVsOR5I/ZRjrcT0WHMhvPqlKABf83q9NvIspm1+4pvxllH2mRZz9PmWDz3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wwet0l7U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wwet0l7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772929231; x=1804465231;
  h=date:from:to:cc:subject:message-id;
  bh=D0rOCoCwxTOZdR1AhGhqKCwKtR18CtaFGkAYeolEVnY=;
  b=Wwet0l7UXbLAud4pu//C1ExE+5VrgrcoVb9xYf3tvqCKFl/pwMh9YTi7
   JOnLa1ud4DbsXrcPjU6lM2wx8gOs0wjHUb71zD7sMQnGLvo5AzfFMfF/m
   +lKiFm1v+cVE2C0eX7vQuA7hwhlgTQktLAr3xOn8qQMT6P2SWc75N9QEN
   Nd4udqWZHvaL6/0gOxCCeVgC3wWUI424h5mjy6adelLQvk1FI4akgFU9u
   PyTnPp9+1R3a+SSpvxW2b/vOqb/UJ3dAwsumhPA5GaJpnawv5ABhM3Q7G
   uweT3JZND/+ltU/gBufiLCevXu7ZJNj3hvZD09jw5K+gooPa6eWKSHHwO
   w==;
X-CSE-ConnectionGUID: AfHCyz0mSxyWpFqYIhVKEA==
X-CSE-MsgGUID: RXQfgGMORG6i84V5osbVrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74189169"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="74189169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 16:20:31 -0800
X-CSE-ConnectionGUID: CA8TthWNSZGh723bJosJYg==
X-CSE-MsgGUID: Q3eBqsk+RnuXvgEUekmMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="245489689"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2026 16:20:28 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz1sg-000000002kv-0u4P;
	Sun, 08 Mar 2026 00:20:26 +0000
Date: Sun, 08 Mar 2026 08:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 57/332]
 fs/bcachefs/snapshots/snapshot.c:378:14: warning: variable 'lock_dropped' set
 but not used
Message-ID: <202603080856.oBA6bBjF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 54998105f6ef5d0c64d7986fd6f670d2b4f3bef4 [57/332] bcachefs: Drop locks for printbuf allocation in snapshot_get_print()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603080856.oBA6bBjF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080856.oBA6bBjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080856.oBA6bBjF-lkp@intel.com/

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
