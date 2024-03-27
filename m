Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1701CFA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 01:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711504454; cv=none; b=rZpgV0OFXej9kX2VbAT6OyG3pHw7osFc9LPl5lfLDufcs5WgjxXimZJWRlxPEaIAa5MV5N7i79JnQeRiAO691Bj9l3XMHIJ8LW40qnk/VH1PEFP1BfQPvuZWv+0rlBrSyHZfJxpdMFlXysyIxmvmge/bMxwy8/GA+5WilxtHxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711504454; c=relaxed/simple;
	bh=I3YHEAo5W5gsMoWBEaUrT9UzKmOTcix6uvnm/EdwiRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOumfDJRHjW6SQ1sRdGp3YiymnfXHDYfs3rwzm+eQHbNE1pEdCHrQaESc8Zte951KuFcKzFPiOe0JZWETE99laMx6Fz9gYSf2QrpxKb6/CmjXpFGZpWUv+WtwbngYMLuu7WCQlsnbL/SKH98mW8tXmfn8wcLWB5nJ9IN1vaixJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk1yZ5qR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk1yZ5qR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711504451; x=1743040451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3YHEAo5W5gsMoWBEaUrT9UzKmOTcix6uvnm/EdwiRw=;
  b=Lk1yZ5qRY167Peg+lefDJGw7CTWocixg/JPXNMriMzeFwjvWxwxf8Gu2
   meqFB/dOGm/fEjIa5TSEHeee4Ogdp4pF1nJN+5Jhv7DJzyXbY/YU6VzUb
   EZky/iZLV++kb9ehqzIBKRd/igilG7m2Hk9w+ogeTtVciPWVSwF6N+D+5
   NZs8WZPlbKRqwF/E6kvzirm1pam6wcISA0FfEVnW1hhZ7LPMjUCF/VSiZ
   /vsJjBcr+lDFn3zeu50162Rmt1RooZwOcWHE2dSvQSzkXER1MtHuGSP53
   94VjZehLTW2x6v8+2QT9Pm3bWfHNR801U1AQU9dtzX0VOi0542FoQX+8j
   Q==;
X-CSE-ConnectionGUID: q3YC8SqeThCMoIr3cyTSfQ==
X-CSE-MsgGUID: XnF4FV8QTGusEddrL7N67w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24028514"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="24028514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 18:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20802889"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2024 18:54:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpIUQ-0000cc-0f;
	Wed, 27 Mar 2024 01:54:06 +0000
Date: Wed, 27 Mar 2024 09:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/7] mm/page_alloc.c: remove unneeded codes in !NUMA
 version of build_zonelists()
Message-ID: <202403270916.8ARzkyqB-lkp@intel.com>
References: <20240326061134.1055295-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326061134.1055295-5-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-move-array-mem_section-init-code-out-of-memory_present/20240326-141458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240326061134.1055295-5-bhe%40redhat.com
patch subject: [PATCH 4/7] mm/page_alloc.c: remove unneeded codes in !NUMA version of build_zonelists()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240327/202403270916.8ARzkyqB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270916.8ARzkyqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270916.8ARzkyqB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c: In function 'build_zonelists':
>> mm/page_alloc.c:5324:19: warning: variable 'local_node' set but not used [-Wunused-but-set-variable]
    5324 |         int node, local_node;
         |                   ^~~~~~~~~~
>> mm/page_alloc.c:5324:13: warning: unused variable 'node' [-Wunused-variable]
    5324 |         int node, local_node;
         |             ^~~~


vim +/local_node +5324 mm/page_alloc.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  5321  
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5322  static void build_zonelists(pg_data_t *pgdat)
^1da177e4c3f41 Linus Torvalds    2005-04-16  5323  {
19655d3487001d Christoph Lameter 2006-09-25 @5324  	int node, local_node;
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5325  	struct zoneref *zonerefs;
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5326  	int nr_zones;
^1da177e4c3f41 Linus Torvalds    2005-04-16  5327  
^1da177e4c3f41 Linus Torvalds    2005-04-16  5328  	local_node = pgdat->node_id;
^1da177e4c3f41 Linus Torvalds    2005-04-16  5329  
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5330  	zonerefs = pgdat->node_zonelists[ZONELIST_FALLBACK]._zonerefs;
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5331  	nr_zones = build_zonerefs_node(pgdat, zonerefs);
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5332  	zonerefs += nr_zones;
^1da177e4c3f41 Linus Torvalds    2005-04-16  5333  
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5334  	zonerefs->zone = NULL;
9d3be21bf9c0b8 Michal Hocko      2017-09-06  5335  	zonerefs->zone_idx = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  5336  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  5337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
