Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C81349CE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 19:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376554; cv=none; b=O4EWhPLRJP0olKvfG+6yhGrT/9X54A6jVPM5aj3zHlaqleOZRRyaMSuhbuMGtN5d75JminTxi37XJkGpFyaeGs/FLGP8524s/0nG4Ng3v5tvFCWyKVHu6nu5r/ii6vZuV7JiONVytd43c3XidOHOuhio+6d73pfaSh4xUR0KQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376554; c=relaxed/simple;
	bh=iQRjad0JGum+Q5PPSG24p9vHsjSKlDA+D8/ErrhGtO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VD38q49AmSET5f9s0wNFZ8CvIIc3cmoXwEeXpU+PTZbrvLD+xoXDhJU/3PmwGnjF02DNkmKX/bhgwIj++KvgISarXwCPLol3sE0e+QMRIxq9htny7v+BYTuTt3J2PjKulanUN2PyrQUeooAf+J/oRJCaSbrbiECQTqDLM4rXjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt2TgIWh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt2TgIWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376552; x=1819912552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQRjad0JGum+Q5PPSG24p9vHsjSKlDA+D8/ErrhGtO0=;
  b=Yt2TgIWhBpWcQjMjlDKzRXQ0zCQWuVoxZhQxDm9q71EfJlkwcztFxhgF
   78gF9U6RapnFkh5GJ9W2vMYlMkPlzO3hAYS7cd1dc+foAMHbdKiGBOZam
   MydJ+F02Ph3UnQWRyYEP/eh7LvFkf93/8wBhxfRfU3Z2F3d4n6sATrRnB
   89t1sPMRmOwLI9B9PwBIiiTn83277ezR2RIyihoTdHgHGu/AYYkhJGFOS
   cOUD21Y9DTixt1jPnTkUgxOFTRZDaaFWgbbPLK9mXHThkYdWeSN2h7MA7
   +AurhDTNNmiagkGVe+z3fdZaXbiNUbqOMWaZK2euKv0F3dAwcOZC4UgXG
   w==;
X-CSE-ConnectionGUID: SXv36TR5SrqjMOHCELIXmg==
X-CSE-MsgGUID: zTBZrQhwSqWBKf8LHlBvPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88771641"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88771641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:15:52 -0700
X-CSE-ConnectionGUID: bed54NkoTjCaGydZzcb7Ow==
X-CSE-MsgGUID: noKPU8zKT2OtsLclstszKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265796980"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2026 12:15:50 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1qR1-000000003Di-3AIa;
	Wed, 02 Sep 2026 19:15:47 +0000
Date: Thu, 03 Sep 2026 03:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-3way-merge 46/49] lib/dynamic_debug.c:324:21:
 warning: left shift count >= width of type
Message-ID: <202609030332.F8d6YLpz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-3way-merge
head:   d0c943103cb664ad87f6e3202f62d82153394afe
commit: e059514f9039e7c044382a405883ff79624ccf00 [46/49] Merge branch 'dyndbg-sites' into wk-3way-merge-v2
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260903/202609030332.F8d6YLpz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030332.F8d6YLpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030332.F8d6YLpz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_site_tag_key':
>> lib/dynamic_debug.c:324:21: warning: left shift count >= width of type [-Wshift-count-overflow]
     324 |         return (tag << 60) | (addr & 0x0fffffffffffffffUL);
         |                     ^~


vim +324 lib/dynamic_debug.c

ca46b7e61ee9fa Jim Cromie 2025-11-18  321  
b04414c8244a39 Jim Cromie 2026-08-29  322  static inline unsigned long ddebug_site_tag_key(unsigned long addr, unsigned long tag)
55557b9dfc7361 Jim Cromie 2026-06-24  323  {
b04414c8244a39 Jim Cromie 2026-08-29 @324  	return (tag << 60) | (addr & 0x0fffffffffffffffUL);
b04414c8244a39 Jim Cromie 2026-08-29  325  }
55557b9dfc7361 Jim Cromie 2026-06-24  326  

:::::: The code at line 324 was first introduced by commit
:::::: b04414c8244a3978ec2ed15eddc6e6f396f7500b dyndbg: Migrate site maps to Bonsai Tree with range consolidation

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
