Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453D2F744C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121995; cv=none; b=G1utHHsm582fIlEOy2tD5w1BqeyTmNs2mCYwMZZUKoJJtg4Uw5MEU+GbYFBuPAsWH/f4RWTAXNnQYiOpMWGtX7gqHfVmc4zCEAFFMXGsaHmSg8pcBEHL5nVTo5g8/1ll1kuuGoOcLbadCRR18RWANqDvobCXW/JzL0fy6Bm/mnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121995; c=relaxed/simple;
	bh=UV9xsjec40FwPaNcp6rmrkjtg2J9glzAqDwe8dSpDJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2T3lvIkh5JMRJEpfEXnQ5mgHKFgoCqlqIAtc8c+o5FfRNVAtEFakeiWV6dA91xQqPM+cr3DevDqtsKJFc7PhR5vaVs9XoB/OuCAmqq5xrXK3rkY8gl0MDq+NCgduUNA8e4NOK8MdIR9J4B6IgPbX6eidfUDFrSlAH4LIviqN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3zU1zZ7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3zU1zZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763121994; x=1794657994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UV9xsjec40FwPaNcp6rmrkjtg2J9glzAqDwe8dSpDJY=;
  b=W3zU1zZ7PntXaR6y8OILAlA3N0DUcrQVmkO94HjIGUSFgCfGaHe9qg85
   Bcwz/38rl5Ob21bS1Ae+gtyXXx/rxngxjiYJ9YDXLWScNOL3VV7711PAY
   zQkWcoiCUzMCdet/XU/bpclCUmR5auVC12XAcvPVUFezkLKcJmCXLWE3X
   fSuco5OyC3RNPadqPl7Jt0AvSLQAj9aEv7WZO+7m4mXJue96TR9ghJoVS
   4wTBGo+S0RFUPOX6wWA8KM0JKiPptJlW+tdfCvTkecd6kuql8QIdq0B+e
   ymxOCH8A/odI5KfvdfZ0C3EYXSOaU/kKq56RJBAubv3PL+rqbeJkbMP2d
   Q==;
X-CSE-ConnectionGUID: oxjmb65mR9mzmgB3TJX7aQ==
X-CSE-MsgGUID: yDsb1DXuRZCEs9j5UrOlew==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52781318"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="52781318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:06:33 -0800
X-CSE-ConnectionGUID: fxFYRIE1QZmjo8QGiRpoow==
X-CSE-MsgGUID: OJG/2+hqTXu9mOIJcZVYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189594320"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2025 04:06:32 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJsZR-0006Yb-2j;
	Fri, 14 Nov 2025 12:06:29 +0000
Date: Fri, 14 Nov 2025 20:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 719/875]
 fs/bcachefs/data/extents_sb.c:44:54-55: Unneeded semicolon
Message-ID: <202511142003.1dEzNDyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: 170e790c993f2dc5503d5edf6c7e211f47c320ab [719/875] bcachefs: bcachefs_metadata_version_sb_field_extent_type_u64s
config: um-randconfig-r061-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142003.1dEzNDyp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142003.1dEzNDyp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/extents_sb.c:44:54-55: Unneeded semicolon

vim +44 fs/bcachefs/data/extents_sb.c

    33	
    34	void bch2_sb_extent_type_u64s_to_cpu(struct bch_fs *c)
    35	{
    36		struct bch_sb_field_extent_type_u64s *e = bch2_sb_field_get(c->disk_sb.sb, extent_type_u64s);
    37	
    38		for (unsigned i = 0; i < bch2_sb_extent_type_u64s_nr_entries(e) && e->d[i]; i++) {
    39			c->extent_type_u64s[i] = e->d[i];
    40			c->extent_types_known = i + 1;
    41		}
    42	
    43		for (unsigned i = 0; i < BCH_EXTENT_ENTRY_MAX; i++)
  > 44			c->extent_type_u64s[i] = extent_entry_u64s_known(i);;
    45	
    46		c->extent_types_known = max(c->extent_types_known, BCH_EXTENT_ENTRY_MAX);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
