Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6123BCF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079472; cv=none; b=gYbQIaj+cDXU59kVfiZQQ2ONbjEn+wJpfeoqyOh8v7yfC9R63hwmGIHvJtXzYm6rQHpt70EuYr8tGEv2FDxBNExs7YSNW90Lz85Zf2tMiiZCt5FGPamEaWOBbzraJD7hosOv8iFcDf3Oehax9CWXhnxmf7b5Uq8DdYEQdCXNyGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079472; c=relaxed/simple;
	bh=A6ZqXIe5yjcvmITjd4vZekADB5MgqQd03qLsiOqeYLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I523tYe3PHMDk13xVADt+HTimZ1f6U/quwmP4UdUx2HDwrYGbr8BnHqfaTKoyCNxkj4onUGSieS+akCj+ECvZp0LBiusHGVXgc4mATZ9gwxm/rIDqQDO0qEKdFEWTzMwtIiwKaFXZLwehT8zo2L6fudkmiYXRqE2TISwoFaCVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbBXWL5i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbBXWL5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774079471; x=1805615471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A6ZqXIe5yjcvmITjd4vZekADB5MgqQd03qLsiOqeYLc=;
  b=cbBXWL5iaDX8G1RBca0SrGDSrkNOcSAJ2agYj/slGe6tZoZMalQweSXA
   m6Yt496jIPimjk97PuSRf8I8G77x53/mSXLVFWN+4MgT42IAeDMlUoLQn
   Kbxprbh5V9WpnwAhj20u/dYU7PGcax43bElU63p85g2lRLT6PFHPRVAqv
   v9I3ucUrA5p2PhTL6hEuBrMOWME/0hQyUmdE6iI3pZyB/J05PjRGUCTYl
   7v0PWFf0YKq1YQYV08nZ39KyHXUL5f1aNTedAKEiyfkKlM9bb8YqSSbxi
   0/AjzjpFEzcSoVCd+sJq5J5G3T/CQNzCY3N1rn/A0dcP/T+xy/cblqHWZ
   g==;
X-CSE-ConnectionGUID: 2PxaGZgeRFG8zY7id6DLnA==
X-CSE-MsgGUID: 17MBb5UjQx+GfL7qVkeZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74180465"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="74180465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 00:51:03 -0700
X-CSE-ConnectionGUID: bFpfV+WuSMKUX2rsUGB63A==
X-CSE-MsgGUID: 72RVPk4IQrWz7/ayOGgabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="225367803"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2026 00:51:03 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3r6q-000000000S1-1y22;
	Sat, 21 Mar 2026 07:51:00 +0000
Date: Sat, 21 Mar 2026 15:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sourav Panda <souravpanda@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [LSF/MM/BPF TOPIC][RFC PATCH 2/2] mm/hugetlb: skip hugetlb
 shrinking for proactive reclaim
Message-ID: <202603211551.cdC8kobz-lkp@intel.com>
References: <20260318234126.3216529-3-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318234126.3216529-3-souravpanda@google.com>

Hi Sourav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourav-Panda/mm-add-hugepage-shrinker-for-frozen-memory/20260319-080721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260318234126.3216529-3-souravpanda%40google.com
patch subject: [LSF/MM/BPF TOPIC][RFC PATCH 2/2] mm/hugetlb: skip hugetlb shrinking for proactive reclaim
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260321/202603211551.cdC8kobz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211551.cdC8kobz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211551.cdC8kobz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/shrinker.c:620 function parameter 'proactive' not described in 'shrink_slab'
>> Warning: mm/shrinker.c:620 function parameter 'proactive' not described in 'shrink_slab'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
