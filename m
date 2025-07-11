Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7B2C08BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238114; cv=none; b=V92pSr4AaMvRMUiARs+RtJ1jS2Ew4o++b4Qo3Ag4DjIgqqOAa8pPv02gj/Tq+nPXoJYXTaKK+0qU0/w+fQxQyGPi8ZceuHA8ynl9YpRfqei93F8CaRy2Fp798BYxEhYPA2saQ0yJ/tFasQFDnx3xKM28xDXbU7yddnF+F2NDjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238114; c=relaxed/simple;
	bh=S7S78l4v222Q4IGIJjEUnEsZH89aUnWzpOVZ4kXzKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWDiJNs67aKsBqnrt1XNSgrIc2GqvOZrnfUhCloYCSq+md8UBkQW4boDZjqJ2BnovzQPShd2aDRjYp96PC4DtBsVmKsH9Wav0f9Al7OVvqUxYeMxl8Qv1lSKAyv8Z9moSRolZ6/JjDAfyMpSN3NwPAMEFgfwhAGFxaoQsooDBkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuphRwMD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuphRwMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752238111; x=1783774111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7S78l4v222Q4IGIJjEUnEsZH89aUnWzpOVZ4kXzKvs=;
  b=cuphRwMD4Jx3TA0HuxCVHAkEKJzv9PfBlkx3nUVAsDkbx4Qkqi+K7yzW
   pmtZ4GHsjfolcEy5Ocbf1Y3feEoFkh86DYNWCawEN8xKJLVsdelDbeXjZ
   oXtVsD/P0P/pV5kFRB1ILxsc7ul2raWGb9fIvuMm4sCxXa7+3oBxiuFLh
   Vr4nFa0yEhERtSaavdJgXY1fdcM+frZYTYKBFC4NsavbM3D+DMXN8hyhJ
   dkMYQE3jkOv0zXTwgko4s9HL2aET1ntlPpX7b/O2Y3aNjiQjiVB9I+9eI
   RleJDnfMFh0ou6/zxeYq0Kb2g6zG0+xhrXUr/O5AlB4By31wQRgnIuoa8
   A==;
X-CSE-ConnectionGUID: ySctq87zRuCVbyHu0mewiw==
X-CSE-MsgGUID: s55lrVgDQ4yajMoLneRuwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54664525"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54664525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:48:30 -0700
X-CSE-ConnectionGUID: u+4H4nOUQ2uflIFrEbnxjQ==
X-CSE-MsgGUID: 95GDk8pzTUSSAk2fohjHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156922090"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jul 2025 05:48:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaDAw-0006MB-2L;
	Fri, 11 Jul 2025 12:48:26 +0000
Date: Fri, 11 Jul 2025 20:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ibrahim Jirdeh <ibrahimjirdeh@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, jack@suse.cz, amir73il@gmail.com,
	josef@toxicpanda.com, lesha@meta.com, linux-fsdevel@vger.kernel.org,
	sargun@meta.com
Subject: Re: [PATCH v3 3/3] fanotify: introduce event response identifier
Message-ID: <202507112012.xU84okDN-lkp@intel.com>
References: <20250711023604.593885-4-ibrahimjirdeh@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711023604.593885-4-ibrahimjirdeh@meta.com>

Hi Ibrahim,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ibrahim-Jirdeh/fanotify-add-support-for-a-variable-length-permission-event/20250711-103820
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20250711023604.593885-4-ibrahimjirdeh%40meta.com
patch subject: [PATCH v3 3/3] fanotify: introduce event response identifier
config: csky-randconfig-002-20250711 (https://download.01.org/0day-ci/archive/20250711/202507112012.xU84okDN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507112012.xU84okDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507112012.xU84okDN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fdinfo.c:8:
   fs/notify/fanotify/fanotify.h: In function 'fanotify_is_valid_response_id':
>> include/linux/fanotify.h:9:19: error: 'struct fsnotify_group' has no member named 'fanotify_data'; did you mean 'inotify_data'?
       9 |         ((group)->fanotify_data.flags & (flag))
         |                   ^~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.h:566:13: note: in expansion of macro 'FAN_GROUP_FLAG'
     566 |         if (FAN_GROUP_FLAG(group, FAN_REPORT_RESPONSE_ID))
         |             ^~~~~~~~~~~~~~


vim +9 include/linux/fanotify.h

ff0b16a9850e8a Eric Paris     2009-12-17   7  
96a71f21ef1fcc Amir Goldstein 2018-09-21   8  #define FAN_GROUP_FLAG(group, flag) \
96a71f21ef1fcc Amir Goldstein 2018-09-21  @9  	((group)->fanotify_data.flags & (flag))
96a71f21ef1fcc Amir Goldstein 2018-09-21  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
