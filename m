Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731625;
	b=YjJ9+KJGmm90ehFY9oa8H08tqfRrm72ndjC+MTmW12R+fnlQLeOzIy4QJERUkZN+cTYQ
	 Va6FDymHx51wzRs/z1T2lYTBu+GTW9WZYPqS/q9iPZaOKPQoLL65spcPVn3DBH02SLegf
	 xToVWSeGOrz4CFE4Sr+rnyJ4nIHWLA6zsRiFEIRxTcHC0DcaWC4auTMf7zO9iVkkGlVQT
	 o08hlE1gpld0QFtMX7xMlAZKxTGvPqVVDRVpPFIcMd7FMtqQkoswHJBxFicwBih0ah9Ch
	 TASrkXZzaGxSha6UbFRa+YX8REAUjWk6kQ6JVJoJE+urwbyAVqOGwu3KE4pqmoS4uIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731625;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ck6ORgH76T5ifAxkFAot3rYkf9ukxwOACm3G2RriBkE=;
	b=nclHgSGrZzPdtvvJpDtJs9oZQ7R0GEX1l5D7nRULvf1BV/hSkd64Q9ke92Yd9Gn+pgAd
	 wXZpelEqVhnujMOWFxWQTYkslk3cq3umz1/MxyCqc6rt8y5XvtLpt31sGfBZszYlvYDGM
	 bGCB0i9s1xsaM/mRiJl48XKFrtwfDzEloEodV0i0WByEa9DblzQjD9UHiB8RRg23TxrIl
	 RT9ohD7o+P0TaeZuSb9SMGLQYUDLsSDCCrKGwVRRBMXOpBxkjZoM6cYOVu2yiioJM777u
	 MHg234Vk/vPPjv/u+UrHpuQDBRCgsY6zK7peX6pRuIig+ZXKQV8M6RIoYYUzbSapI6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRIk4OQG;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE4606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 08:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRIk4OQG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794731625; x=1826267625;
  h=date:from:to:cc:subject:message-id;
  bh=UbWAu4rI+tARyvOjxK3RswyQbPw7vmwcnNuRlDE6Y2Y=;
  b=dRIk4OQGkaWPr3X/AyIBkSQiElXiE7kBpPaAKRFo7YrVc8WUzjMALW26
   9T4NIxRYvw+U5LdSqDOVtj6IGM8+MgndZsT8VGRc2MaJWA3h0QyBPOsn3
   1OOb52xMJNAe9F6Agoc9Ome8ZraFiGrHmbO4PUvDcxhoYKctpbBfjAKQX
   YfsUSw1lAOVI4PkicOVCk1SE+n9pxp9YM071vPHdFRSHi7BNmTKum+zjN
   qq1ez26dAg76Xj8O9YdWVXzSKGYFhzlEFTEbFmUp4Lm9cSkN/VCFvZIqW
   eqlMPNJkYiAP4F36JNB+x78UnySIgoNCpMUH7x7o+HMTf8/3u3Q6tWuCd
   Q==;
X-CSE-ConnectionGUID: YfPMnPHeQoG8cgdzURDJbA==
X-CSE-MsgGUID: 9gJWSdeyQ2+AXqhKE6ROMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3501413"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3501413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 00:33:45 -0800
X-CSE-ConnectionGUID: 0DY+Uu1oSHCXoz56Vk16oA==
X-CSE-MsgGUID: Njz1dP2+TvCE8ComovWMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9226441"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2026 00:33:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSVgC-0000000027K-1vlb;
	Sun, 15 Nov 2026 08:33:40 +0000
Date: Sun, 15 Nov 2026 09:33:12 +0100
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 37/125] mm/damon/core.c:1839:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202611150922.CN5lOX66-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   c6e08f98976018ef8823a44dfabbfa444fdc39da
commit: 0e9dffb2f36016e675b02bf66467ef5b4fc8ed63 [37/125] mm/damon/core: introduce DAMON_FILTER_TYPE_REPORT_MADE
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611150922.CN5lOX66-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150922.CN5lOX66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150922.CN5lOX66-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1839:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1839 |         default:
         |         ^
   mm/damon/core.c:1839:2: note: insert 'break;' to avoid fall-through
    1839 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +1839 mm/damon/core.c

9641c80162a114 SJ Park 2026-09-01  1820  
a76723d4b615bd SJ Park 2026-09-15  1821  static int damon_commit_filter(struct damon_filter *dst,
d0de4b29c722d9 SJ Park 2026-05-18  1822  		struct damon_filter *src)
d0de4b29c722d9 SJ Park 2026-05-18  1823  {
d0de4b29c722d9 SJ Park 2026-05-18  1824  	dst->type = src->type;
d0de4b29c722d9 SJ Park 2026-05-18  1825  	dst->matching = src->matching;
d0de4b29c722d9 SJ Park 2026-05-18  1826  	dst->allow = src->allow;
d9f23f2f822a59 SJ Park 2026-05-18  1827  	switch (dst->type) {
d9f23f2f822a59 SJ Park 2026-05-18  1828  	case DAMON_FILTER_TYPE_MEMCG:
d9f23f2f822a59 SJ Park 2026-05-18  1829  		dst->memcg_id = src->memcg_id;
d9f23f2f822a59 SJ Park 2026-05-18  1830  		break;
a76723d4b615bd SJ Park 2026-09-15  1831  	case DAMON_FILTER_TYPE_HUGEPAGE_SIZE:
a76723d4b615bd SJ Park 2026-09-15  1832  		if (src->range_max < src->range_min)
a76723d4b615bd SJ Park 2026-09-15  1833  			return -EINVAL;
a76723d4b615bd SJ Park 2026-09-15  1834  		dst->range_min = src->range_min;
a76723d4b615bd SJ Park 2026-09-15  1835  		dst->range_max = src->range_max;
a76723d4b615bd SJ Park 2026-09-15  1836  		break;
0e9dffb2f36016 SJ Park 2026-11-14  1837  	case DAMON_FILTER_TYPE_REPORT_MADE:
0e9dffb2f36016 SJ Park 2026-11-14  1838  		dst->report_type = src->report_type;
d9f23f2f822a59 SJ Park 2026-05-18 @1839  	default:
d9f23f2f822a59 SJ Park 2026-05-18  1840  		break;
d9f23f2f822a59 SJ Park 2026-05-18  1841  	}
a76723d4b615bd SJ Park 2026-09-15  1842  	return 0;
d0de4b29c722d9 SJ Park 2026-05-18  1843  }
d0de4b29c722d9 SJ Park 2026-05-18  1844  

:::::: The code at line 1839 was first introduced by commit
:::::: d9f23f2f822a59771fdc3cab648785d4f651e1b2 mm/damon/core: introduce DAMON_FILTER_TYPE_MEMCG

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
