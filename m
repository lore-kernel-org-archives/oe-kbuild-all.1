Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C01D014D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726324207; cv=none; b=bUiRyjdWYAeKvez2S0SRgZ/IMtNujAOS9mbFldRaHkuAynOrIzTviOpDN/scB36xkwdKq6vzfpWwZyCzSOnf6reOlsx/UPn/K4PRixymByqqp7O4vQdLIVW42uKjo/Zvej625qw/AlJoBKTkYeZ+Ys6b8jUUul5aEDSckVrSris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726324207; c=relaxed/simple;
	bh=ozQkrzLjdzG1Ci6P3bBpwo5lfrwCKL4A70+cXWZSqHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E13xlhmL2ftJ/RGxnhrvpOVJ9Mlu24TqLANqk6cBqd2Q48tXgVzCpdilF4I6hQczTVosUYaLIqRVY9Wz+RK6wJR05s5w48eRoLk+83PFPomuX3dYYdZCCB5degV9EsH29lnPnk7UOR8l5/ktdN3lg/aoEveCGcZbGqz9n5MOK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+dFQSQr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+dFQSQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726324205; x=1757860205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozQkrzLjdzG1Ci6P3bBpwo5lfrwCKL4A70+cXWZSqHw=;
  b=O+dFQSQrXOxzRmM4WI0dU8EHTu2K5+7Bf2Mi9I4RpbXPnwGRDLnWZPy0
   PmlESjuIlz+7TITRV4FbaVOG2jqrzhMT5aJuG0hGL9mEeOeHvpnyTcOU+
   Rd7ZjsomhN+H83uiZTwtsocvzdiot09TDy4YVLVK+19Ab0o/scDG19Fpt
   XGfXvsnj1xxkM85NlCOkES2ZhMXv9ks2sf5t2iYtbhRwELW+6SPyT6HNM
   5LHQwrvkWPB4y2ADbRlpOQVeNHYzFdQrgF6IqGvaxoQB2rEfk1aqj2s2x
   fqV7pUHIfzmZTnQHyPz4CaU+TNoci87gC1BzNryDtNc2/PDOcNxAXAuuZ
   w==;
X-CSE-ConnectionGUID: B99OcjMRSoq/8otpM5SmaQ==
X-CSE-MsgGUID: gGXR3kqyR/SDRqcBQCt5rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25312581"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25312581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:30:05 -0700
X-CSE-ConnectionGUID: v9TBN+AXRV+jNFfzuQ6a8w==
X-CSE-MsgGUID: m8DDTMFJRrGAxDLGjbLK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="91682814"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2024 07:30:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spTmj-0007qI-28;
	Sat, 14 Sep 2024 14:30:01 +0000
Date: Sat, 14 Sep 2024 22:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/5] ext4: add aligned allocation hint in mballoc
Message-ID: <202409142251.Q4HzDzGM-lkp@intel.com>
References: <3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/ext4-add-aligned-allocation-hint-in-mballoc/20240911-170427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin%40linux.ibm.com
patch subject: [RFC 1/5] ext4: add aligned allocation hint in mballoc
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409142251.Q4HzDzGM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142251.Q4HzDzGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142251.Q4HzDzGM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/ext4/mballoc.o: in function `ext4_mb_regular_allocator':
>> mballoc.c:(.text+0xde5c): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
