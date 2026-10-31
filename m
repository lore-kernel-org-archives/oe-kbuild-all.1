Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483178;
	b=e5zC7vO9she8vrf2OlMNgb36icP/8pusKkjv9S6Dbfur7TBO0iB5eSqfGqow9qvX3Zaw
	 vU65Vugu/RsMtstqUiK7S025nnehWteuMkrxON+dvo4KgUTpum10SvB0ZaxmrHEASR8Og
	 Vq3HxrCjkPZigtwqNk5arH0JuiipcVpqKsT/ywRAE7VL38eKgX5AHVnpnytWFRyVEq1cL
	 +CDPHd3s5zVCI+KeS533ldWYpjriFHU0rmLZioDjt60Trq+ODKa7D7IR1N/Ipcj1m98vG
	 Izm1iC0TD1YgTAMeAPi0n9vpENCqwwqkfB/SY87lu7yOCITtxwnoe9zkPMoHHMM5TVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T1aA9hFI6XNlmM+TrrUkdz4DgrxLwArXZeQ16ac2gFY=;
	b=s/EYLCC7v7J/U1+MgEa7Zr9Z/VIximikDbY7l1ZhaKaG1GXg7LYGGenem2TqEcJONPW4
	 aClqOAdnmB18It75xxV4Xph2Ik4CNyUf4ASa6K1kPLVl+DIiIgfLE6e9JwNiNh6YzHR1o
	 7EfZjPfsjQZovWUIXbavw3LF6HhvBjiWvbFCemByiKev/rl6UJ6nqudJ0sEvAcZCHH+y2
	 TuvUjAPgVW6dksBMHj3R3781nMGyYzibcfGr1c+Q36Q5MwiIdmeL5/0Wslulm/eAoQGnS
	 paqPpjyZk68LY+shuYb30FmE9Bd5Gh09dVzroUQw+lXao3EkDBAbfboaYN1IM8oddww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLUBLwX0;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77BB606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 21:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PLUBLwX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793483177; x=1825019177;
  h=date:from:to:cc:subject:message-id;
  bh=7XDD5ih5UlgAlFaTf1+NQGWyhy374T26hG0ZRijg3pg=;
  b=PLUBLwX0oA8L96k699Skfs0/+sHYj9/uHCcr6KgPcVj2UDrv+FDFApnk
   8Ukt/Jlh51uzPbd07H2PAC66AfFx6V4KM7gO1rSa/OB4Jovm+garCsfp+
   WnlnW/dohPlM+OBoHQvFqN2U1tPu8hoCgeIuf6IFbr8WSZGBUe7u14VpW
   pM3HbcSTz8XTCrkKSGea1xN3SESXB1z95Jkuf0AV8reLdQQKGIcdmxS3r
   pNTiN8H6LJMLY7bckFiPLD/p5rr1d+tv45oL+LazyZ+o9138kxaFzAblS
   KDaewtIGNbLoGZFTZ09/BB/Kj6LgcOSMCcUXVnr5sEE7vgY2fsYgcGQiM
   w==;
X-CSE-ConnectionGUID: 9++INrh/S+OiTnkecI17jw==
X-CSE-MsgGUID: GHDOY+BvRVm3Xi1lo8tuBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2319844"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2319844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 14:46:16 -0700
X-CSE-ConnectionGUID: 4oFq/moHSBuk2zfD+uAX3A==
X-CSE-MsgGUID: PtYbZcuSTZWH2KkwVsIX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5849846"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Oct 2026 14:46:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNGtt-0000000068d-1T8e;
	Sat, 31 Oct 2026 21:46:09 +0000
Date: Sat, 31 Oct 2026 22:45:27 +0100
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>
Subject: [ceph-client:testing 35/47] fs/ceph/crypto.c:187:17: sparse:
 sparse: non size-preserving pointer to integer cast
Message-ID: <202610312244.cykVgFEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/ceph/ceph-client.git testing
head:   3f007b9f327745c94aec312a28973b28f6a51fc4
commit: 88d679bc66688124f73a2e30617c12a14bb5aeff [35/47] ceph: convert remaining helper paths to BLOG logging
config: m68k-randconfig-r2300-20261031 (https://download.01.org/0day-ci/archive/20261031/202610312244.cykVgFEJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610312244.cykVgFEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610312244.cykVgFEJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/crypto.c:187:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:200:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:210:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:210:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:281:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:498:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:509:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:586:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:586:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:586:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/crypto.c:610:17: sparse: sparse: non size-preserving integer to pointer cast

vim +187 fs/ceph/crypto.c

   154	
   155	/*
   156	 * User-created snapshots can't start with '_'.  Snapshots that start with this
   157	 * character are special (hint: there aren't real snapshots) and use the
   158	 * following format:
   159	 *
   160	 *   _<SNAPSHOT-NAME>_<INODE-NUMBER>
   161	 *
   162	 * where:
   163	 *  - <SNAPSHOT-NAME> - the real snapshot name that may need to be decrypted,
   164	 *  - <INODE-NUMBER> - the inode number (in decimal) for the actual snapshot
   165	 *
   166	 * This function parses these snapshot names and returns the inode
   167	 * <INODE-NUMBER>.  'name_len' will also bet set with the <SNAPSHOT-NAME>
   168	 * length.
   169	 */
   170	static struct inode *parse_longname(const struct inode *parent,
   171					    const char *name, int *name_len)
   172	{
   173		struct ceph_client *cl = ceph_inode_to_client(parent);
   174		struct inode *dir = NULL;
   175		struct ceph_vino vino = { .snap = CEPH_NOSNAP };
   176		char *name_end, *inode_number;
   177		int ret = -EIO;
   178		/* Snapshot name must start with an underscore */
   179		if (*name_len <= 0 || name[0] != '_')
   180			return ERR_PTR(-EIO);
   181		/* Skip initial '_' and NUL-terminate */
   182		char *str __free(kfree) = kmemdup_nul(name + 1, *name_len - 1, GFP_KERNEL);
   183		if (!str)
   184			return ERR_PTR(-ENOMEM);
   185		name_end = strrchr(str, '_');
   186		if (!name_end) {
 > 187			boutc(cl, "failed to parse long snapshot name: %s\n", str);
   188			return ERR_PTR(-EIO);
   189		}
   190		*name_len = (name_end - str);
   191		if (*name_len <= 0) {
   192			pr_err_client(cl, "failed to parse long snapshot name\n");
   193			return ERR_PTR(-EIO);
   194		}
   195	
   196		/* Get the inode number */
   197		inode_number = name_end + 1;
   198		ret = kstrtou64(inode_number, 10, &vino.ino);
   199		if (ret) {
   200			boutc(cl, "failed to parse inode number: %s\n", str);
   201			return ERR_PTR(ret);
   202		}
   203	
   204		/* And finally the inode */
   205		dir = ceph_find_inode(parent->i_sb, vino);
   206		if (!dir) {
   207			/* This can happen if we're not mounting cephfs on the root */
   208			dir = ceph_get_inode(parent->i_sb, vino, NULL);
   209			if (IS_ERR(dir))
   210				boutc(cl, "can't find inode %s (_%s)\n", inode_number, str);
   211		}
   212		return dir;
   213	}
   214	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
