Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63120CA49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0xQufJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703973036; x=1735509036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eQjg/62xh3B0s4HwNtrWJF3LogenBC5AML0xPKEQtk=;
  b=U0xQufJ5y7++qYEW3erjzpUuNKxgR7iKJHC6EX4YruQ4ptAE46DCi17j
   Lbza0iVMiNbK8ttUFp8/D6IuJC7p2UP/RwQwqeWWRzAAfyRZlyaJSe9mP
   h8OShhOM9jTyG1I0IsQxfsI/M5IFtPkff+DhElyqIFZ/zU46B/7+R/MaT
   O9EJBs5Eg3iwtfe+IO72ohy8Os8GSerawNXfPIaJZI4yqoPMg7CWPCp/K
   t/iVnlIyq5K79Issjeo78IE60PQlXuVDmg0aYhoi75q6rCPmLqq9W3A7B
   fZ14hT5iAcqijWG99InpncE+sEla4bkffaIdTxPI3Vi+xLAXtMhhQUHt9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="4032581"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="4032581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 13:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="1026174812"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="1026174812"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Dec 2023 13:50:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJhDn-000ImH-1k;
	Sat, 30 Dec 2023 21:50:19 +0000
Date: Sun, 31 Dec 2023 05:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 198/214]
 fs/bcachefs/sb-downgrade.c:58:54: sparse: sparse: restricted __le16 degrades
 to integer
Message-ID: <202312310507.XywSQhQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   5d371342dab1c5d532c10fbc00f60e83e24a3338
commit: ff5363e2d31881ea21c465036f913b0b09d9a4f7 [198/214] bcachefs: bch_sb_field_downgrade
config: i386-randconfig-062-20231231 (https://download.01.org/0day-ci/archive/20231231/202312310507.XywSQhQz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310507.XywSQhQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310507.XywSQhQz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb-downgrade.c: note: in included file:
   fs/bcachefs/bcachefs.h:1020:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb-downgrade.c:58:54: sparse: sparse: restricted __le16 degrades to integer

vim +58 fs/bcachefs/sb-downgrade.c

    49	
    50	int bch2_sb_downgrade_update(struct bch_fs *c)
    51	{
    52		DARRAY(struct bch_sb_field_downgrade_entry) table = {};
    53		int ret = 0;
    54	
    55		for (const struct bch2_metadata_version *i = bch2_metadata_versions;
    56		     i->version;
    57		     i++)
  > 58			if (BCH_VERSION_MINOR(i->version) == BCH_VERSION_MINOR(c->disk_sb.sb->version) &&
    59			    i->downgrade_passes) {
    60				struct bch_sb_field_downgrade_entry n = {};
    61				SET_BCH_SB_DOWNGRADE_VERSION(&n, BCH_VERSION_MINOR(i->version));
    62				SET_BCH_SB_DOWNGRADE_PASSES(&n,
    63					bch2_recovery_passes_to_stable(i->downgrade_passes));
    64				ret = darray_push(&table, n);
    65				if (ret)
    66					goto out;
    67			}
    68	
    69		struct bch_sb_field_downgrade *d = bch2_sb_field_get(c->disk_sb.sb, downgrade);
    70		if (bch2_sb_field_nr_entries(d) > table.nr)
    71			goto out;
    72	
    73		d = bch2_sb_field_resize(&c->disk_sb, downgrade,
    74					 bch2_sb_field_downgrade_u64s(table.nr));
    75		if (!d) {
    76			ret = -BCH_ERR_ENOSPC_sb_downgrade;
    77			goto out;
    78		}
    79	
    80		memcpy(d->entries, table.data, sizeof(table.data[0]) * table.nr);
    81	out:
    82		darray_exit(&table);
    83		return ret;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
