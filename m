Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933C17BA9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397636; cv=none; b=rkajKys3s26tSOPC+F2wrNttYkc4dzVCUQtrN+Xq6bL/727D8rZwUU8cBS2RNyznvxD+8z49n4Bop+j0HA89F2zM6tV1518nKd3flt2WaKRJ1Gum8yI9Rjr2Mo79o0MaSoaZvLviz0f9JPMWpO48ir/c5LER0v01FG+qba9ajj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397636; c=relaxed/simple;
	bh=pvN0p+DGLPd0Jv8Ajj0UrwmaFg16jau7XeSrqTbjbFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXX2KnnVRaOQ5r0tQFVhowuMQgBTKWUSYjn2mC9hcyxOjnUjJKjXzSEKKDGYig3K0bH5fGIRRYHswsPy+LRDo7CGM6vCscFCDCs+SIYNc4EDqL2FqzX+OI8Yc99SjjeOx2ijwbPPX7qytF6nQqOgVg0rnxUQNytgd07viUnkxgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd31e4YG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd31e4YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754397634; x=1785933634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvN0p+DGLPd0Jv8Ajj0UrwmaFg16jau7XeSrqTbjbFg=;
  b=Jd31e4YGfBIeC6pfO9oHDZQ6CP5P4+LOtRJ8W4k7l7+1dgh7mr+wxkxD
   NgXkMRsatuXs9jKRpwRa8MT7oMytYwa8hlKlm+t8tRwQcWHts4VMM+V8H
   LWe1aVDyl6lYNzf7bFB+/2hi/saJCIHybRkVnEzWJXXs3RzwQs+nbBuCu
   8ZEH5np47gR0GKrgJpdaoZYwg1QiDt4zTOhE8GISXbBZAmmuhl1fVUn8i
   SSLb4Sv+PkmnXIRnlpUOS84vXLzlaH0MTHKa7uWiS4N18yKXXXoWqXc57
   +QQvmmXgvnSBoYH8V/Y/2CVMuhKR3Lfp+2qOpUig2yeeZc7kbIUjpEdMu
   g==;
X-CSE-ConnectionGUID: UF86+sWBTTSoR5lDf834kw==
X-CSE-MsgGUID: 3MTc7xp0Sd6sJYy0++DmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74149419"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="74149419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 05:40:34 -0700
X-CSE-ConnectionGUID: 2MMsNlhKT8WCkM8VEdi31g==
X-CSE-MsgGUID: irbseD7qQg6aLHRMFHOUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195318700"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2025 05:40:33 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujGxy-00020N-2h;
	Tue, 05 Aug 2025 12:40:30 +0000
Date: Tue, 5 Aug 2025 14:40:04 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 26/26] fs/nfsd/nfs4state.c:1054:28: warning:
 'nfsd_refstr_from_qstr' defined but not used
Message-ID: <202508051446.wydhCF99-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   4e05ff4e8e6879032361c40f33178eee80d85dfe
commit: 4e05ff4e8e6879032361c40f33178eee80d85dfe [26/26] nfsd: add data structures for handling CB_NOTIFY to directory delegation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250805/202508051446.wydhCF99-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051446.wydhCF99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051446.wydhCF99-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:1054:28: warning: 'nfsd_refstr_from_qstr' defined but not used [-Wunused-function]
    1054 | static struct nfsd_refstr *nfsd_refstr_from_qstr(struct qstr *q)
         |                            ^~~~~~~~~~~~~~~~~~~~~


vim +/nfsd_refstr_from_qstr +1054 fs/nfsd/nfs4state.c

  1052	
  1053	
> 1054	static struct nfsd_refstr *nfsd_refstr_from_qstr(struct qstr *q)
  1055	{
  1056		struct nfsd_refstr *nr;
  1057	
  1058		nr = kmalloc(sizeof(*nr) + q->len + 1, GFP_KERNEL);
  1059		if (nr) {
  1060			memcpy(&nr->nr_str, q->name, q->len);
  1061			nr->nr_str[q->len + 1] = '\0';
  1062		}
  1063		return nr;
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
