Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8451B4F0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 02:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855827; cv=none; b=dyNnv6PSadwW4vbjAfINWgdYM0PjNfq8atRSp/eGy4kvtIGJouN3Nwr9Luq/xJKdzxPa3JzwwMj+sEwaFH+SVlrtAXWelD09lB+LK8NLkRsV7bcuk3vtcILZzFYqR1fa6uIQ3VvswybLZ+eKTAuWysQD7asBVSoR/N3VieCD+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855827; c=relaxed/simple;
	bh=NxTCaZmDt9S8j9Hy9cdqH8ifbyprL0szl3G8oAm0Oqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svgXVLtuT+PUQHic3tqQtFgcXF12WN2vs7juen0l+aFhmMqh8VBRktHWpFYdQIMnq9oCl2nZj8FzIJdLJi8cTQzZd+Fo3fGk5VVh5K4zXa3kaGtPqlfHNBgmguoUK7cGjUcjtbRTRFhBPM6HZZtvMW0oYYejKJnT8g+SMOPuPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guPoGM+y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guPoGM+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744855825; x=1776391825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NxTCaZmDt9S8j9Hy9cdqH8ifbyprL0szl3G8oAm0Oqk=;
  b=guPoGM+ycUoeOi/MuMf20NiVAeKZnRhc4yJlNr19D8vtAGfo2yXki71S
   hMPnOSyigG1Ba9i/7RguSrkWOZGrEf8abbgeI1O5KlG8Fh0hOv8Kxra4P
   5tTupN5UQficUWxrmrIo1mNZBPUUR58IadwIkXPcWCpmGJ3b4uYP/z/3E
   kBXybhc/Pe+I4hGahTi+q6bO3FDgn2j6/vMrDDVAxTV7ltNmh8wNICsnn
   tT1SmvusgnUUhz15uLN8fDwvkD7UXmbxMe/5LFtDiDZRC2g2SkMyLKGv1
   FuJdtJGIhAwIfDeC6v8sXKAPhUFknAvHGElVmCaWbM3tW1O1c1hzeCUo8
   A==;
X-CSE-ConnectionGUID: Ckkr8yF4SP+0UnVOaMyPrQ==
X-CSE-MsgGUID: wa/aoxU/TreGW8lfaAKgCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63836581"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="63836581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 19:10:22 -0700
X-CSE-ConnectionGUID: 4QhI9oLKTQapLTm7XUntsQ==
X-CSE-MsgGUID: ozmrGJzDQ9aJ+e9uM+0BYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="135747923"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2025 19:10:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Ehm-000Kiq-2G;
	Thu, 17 Apr 2025 02:10:18 +0000
Date: Thu, 17 Apr 2025 10:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Pang <robertpang@google.com>, Coly Li <colyli@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-bcache@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Robert Pang <robertpang@google.com>,
	Mingzhe Zou <mingzhe.zou@easystack.cn>
Subject: Re: [PATCH v2 1/1] bcache: process fewer btree nodes in incremental
 GC cycles
Message-ID: <202504170950.T7aXwrDK-lkp@intel.com>
References: <20250415174145.346121-2-robertpang@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415174145.346121-2-robertpang@google.com>

Hi Robert,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc2 next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Pang/bcache-process-fewer-btree-nodes-in-incremental-GC-cycles/20250416-133615
base:   linus/master
patch link:    https://lore.kernel.org/r/20250415174145.346121-2-robertpang%40google.com
patch subject: [PATCH v2 1/1] bcache: process fewer btree nodes in incremental GC cycles
config: i386-buildonly-randconfig-004-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170950.T7aXwrDK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170950.T7aXwrDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170950.T7aXwrDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/md/bcache/btree.o: in function `btree_gc_recurse':
>> btree.c:(.text+0x4c82): undefined reference to `__udivdi3'
>> ld: btree.c:(.text+0x4c91): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
