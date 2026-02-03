Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499CE233D69
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 23:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162606; cv=none; b=TPvS8EjEzCK3aEnl5NFOYY76QBbM3D1jyqe2uSC3J+N/UUH0Vsrmh6NPB7edHO7yZWv+iO5CgpPKWNIpkGMZ8iVrV+ScBd+k7Y9EGQEuTDTueECLRsUayHRkPe3HK4xVIOn+EUXp4A4hYCHkDp0PstdL3+Tutz76Cbf6Gfji+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162606; c=relaxed/simple;
	bh=lW/DhY9GFJrtPF9xoYO9z3EZ8dViSfffQZsDTDTwHX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLs8kOx7ar+IRCq7diIv3+nMUgG8+bAoXN106KUaIQc02oIPTELza+LbGsoRM7nrWXJLCoiVR/+IMEpKhXfOdnXzff3f46Y4Tb/0yAWkd6m1oVZM73zi9BjzxZTn+BL8poMRX1M8R7U59vmE30OC6Ev8lI6cyMLQzrfp/XEetEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGbgo84c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGbgo84c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770162606; x=1801698606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lW/DhY9GFJrtPF9xoYO9z3EZ8dViSfffQZsDTDTwHX4=;
  b=jGbgo84csyeW8TKLnQMPxcJctk46u+/RsvANcRgn0y9jhHkKM77M1JLc
   I0y8wkYkEMwAMHP/jQkpywTMARoeCAhJXPduouhuroFGkDYG2o8Bv8JZE
   n9OT9bWX2uQ0lE1cfhwaXrR4wLjT6XT38tiZMXlkHL55l5ftKSlVRcEea
   QfekK4+0bvlZtZ4Iynxboe2QidHMtk69pMTsNJ8XskXIgXrybVIwZ2FKu
   63RIktEHnwo+74OVfMggANZ9BTjjKVsNmvdk/G98sLWrlgCnbRVey5hEv
   ZjgEhzHdustYe4EHk8F4nKk221ne+9rJdxh+v9KwD6vbLPEj9ZwQwoKft
   w==;
X-CSE-ConnectionGUID: wmS7+0YBS5WPfusfvs9NaA==
X-CSE-MsgGUID: jWL9Y+8wTLuq4vLVGMPLjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82456184"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82456184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:50:05 -0800
X-CSE-ConnectionGUID: yE1z5WFmSNGWBzAM6FIyjA==
X-CSE-MsgGUID: 2HKzhuT3T+aSuWOHqvlnwg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 15:49:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQ9b-00000000hJ8-3lM2;
	Tue, 03 Feb 2026 23:49:55 +0000
Date: Wed, 4 Feb 2026 07:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, ypodemsk@redhat.com, hughd@google.com,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	lorenzo.stoakes@oracle.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, shy828301@gmail.com, riel@surriel.com,
	jannh@google.com, jgross@suse.com, seanjc@google.com,
	pbonzini@redhat.com
Subject: Re: [PATCH v4 1/3] mm: use targeted IPIs for TLB sync with lockless
 page table walkers
Message-ID: <202602040751.TGypHk92-lkp@intel.com>
References: <20260202074557.16544-2-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202074557.16544-2-lance.yang@linux.dev>

Hi Lance,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/core arnd-asm-generic/master linus/master v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lance-Yang/mm-use-targeted-IPIs-for-TLB-sync-with-lockless-page-table-walkers/20260202-154938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202074557.16544-2-lance.yang%40linux.dev
patch subject: [PATCH v4 1/3] mm: use targeted IPIs for TLB sync with lockless page table walkers
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260204/202602040751.TGypHk92-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040751.TGypHk92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040751.TGypHk92-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/events/core.o: in function `pt_walk_lockless_end':
>> core.c:(.text.pt_walk_lockless_end+0x368): undefined reference to `active_lockless_pt_walk_mm'
   arm-linux-gnueabi-ld: kernel/events/core.o: in function `pt_walk_lockless_start':
>> core.c:(.text.pt_walk_lockless_start+0x370): undefined reference to `active_lockless_pt_walk_mm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
