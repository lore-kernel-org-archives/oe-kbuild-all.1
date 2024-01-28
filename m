Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFF28E34
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706462079; cv=none; b=MbLgKJb8Yoa9vrgT+1se/KbXfJF7lchpKZO56UWEAr25GujgUVimFZof4Qxqh+G4tnq4ka7FIUWnjH+S9A5DrWaOy9ggm4ZgwWy4ILvJ3FziHqxgfRVKmpoYuET1+qA4x+AxytIhvzOMREZizf2KykdRTtI7IfaZ0cZOqOQ93QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706462079; c=relaxed/simple;
	bh=C5011YRx37DIAExco4jOOjW8hAKPCKfdir5IVBVST6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eC83GNR5xkMTM4EOkb5rSj4GK9D0VwxG5PD/TN6IkmkPuZ6ofiFRLBOHjJ7aBdlO6GKm1D8hnnpMXa0EWmQTtr/x8KEUFP1Ao3uPa5ScAC8VXeql7zoURc2THlih5lNj8WizC7oQhmxsixxg3xnXU2NmsgMyHXH6VDrmIvkmX0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuXsAdvg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuXsAdvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706462078; x=1737998078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5011YRx37DIAExco4jOOjW8hAKPCKfdir5IVBVST6Y=;
  b=LuXsAdvgVBiqum1/rXru7NtABIhWrppEMkN4iV/jWVadBxnTZkZd5sun
   a7rmw8PH7Vvw3gwGOdQXUX3ooU/+truMwOABtprn2MZq8E1hkParBRN5c
   r8ZZnU41WqI/8Ba6aMU1BPLlj3/1lO+b8G4AwBHxTX4lpWwMVkg1pHrxi
   ePa2WT1sDiw/0UPQPrna/zc6eMWkfYavhtmQGW3+EcUhbUC8ZXBjKWhgx
   hxYvAMsyg5i7LCmAfIfiO4R0ClPTMcYES3g55UVJvxGycIsm3K8R33aiN
   7c0K9/0L/Vg2S0+E+5he5KvR20L8yiBTUbBM136f3cEDgjwSPKCOLz97b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16148924"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16148924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118722399"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1118722399"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 09:14:34 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU8jo-0003b0-1j;
	Sun, 28 Jan 2024 17:14:32 +0000
Date: Mon, 29 Jan 2024 01:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 22/22] fs/bcachefs/journal_io.c:47:40:
 sparse: sparse: cast to restricted __le64
Message-ID: <202401290128.wkQlPlll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ee0f73c71a22bf7b92bb08b11cfb765d8b0caa83
commit: ee0f73c71a22bf7b92bb08b11cfb765d8b0caa83 [22/22] bcachefs: jset_entry_datetime
config: x86_64-randconfig-121-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290128.wkQlPlll-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290128.wkQlPlll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290128.wkQlPlll-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal_io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1414:38: sparse: sparse: array of flexible structures
   fs/bcachefs/journal_io.c: note: in included file:
   fs/bcachefs/bcachefs.h:1013:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/journal_io.c:47:40: sparse: sparse: cast to restricted __le64
   fs/bcachefs/journal_io.c:793:32: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/journal_io.c:1836:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] seconds @@     got restricted __le64 [usertype] @@
   fs/bcachefs/journal_io.c:1836:25: sparse:     expected unsigned long long [usertype] seconds
   fs/bcachefs/journal_io.c:1836:25: sparse:     got restricted __le64 [usertype]

vim +47 fs/bcachefs/journal_io.c

    35	
    36	static void bch2_journal_replay_to_text(struct printbuf *out, struct bch_fs *c,
    37						struct journal_replay *j)
    38	{
    39		prt_printf(out, "seq %llu ", le64_to_cpu(j->j.seq));
    40	
    41		bch2_journal_ptrs_to_text(out, c, j);
    42	
    43		struct jset_entry *entry;
    44		for_each_jset_entry_type(entry, &j->j, BCH_JSET_ENTRY_datetime) {
    45			struct jset_entry_datetime *datetime =
    46				container_of(entry, struct jset_entry_datetime, entry);
  > 47			bch2_prt_datetime(out, le64_to_cpu(datetime->seconds));
    48			break;
    49		}
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
