Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D4F1F779C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731501679; cv=none; b=to3bgVZ1J6XCJ8IQbCDBdtx4Loycd58SdSaTrkvLJl+jAjiFdzOUWRILgnog20eZqzeIRhVi3DWEiZXzRuuQQqgsHaldnat+HY6+yS0JmV2NfWgFgbpthrjJcq1Ph7+CqB1tWgk+pFVm5XExbExdpzOnm6bSlKiTiWuKj04es6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731501679; c=relaxed/simple;
	bh=KSSfOuMGhC3q5EI6IsrxUQ2ucDor056uF8lEBcPjaj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtTHL0ajHSsqDx7CR7qBD1sCBo+7QZrE5PmGlafS19nWexTmw+e6OOWeRzAExbxWR2VZZutWOUp+vWo9dVbJC/Nt6/d+4eYrME9OHPVYRREmddGacfaS9otg73/ehdBUu+RthVSCT5da/d9NIKkRmjALCo//BDf1Jw97N8Kd+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjqiNsBz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjqiNsBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731501675; x=1763037675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSSfOuMGhC3q5EI6IsrxUQ2ucDor056uF8lEBcPjaj8=;
  b=EjqiNsBzojOsfon087FECCA70N3iXnC8jnIN8WcHHTHmJV2HaJgNjmiX
   fj/pBcCkvDvCkcyQDPWI+XH4Fe7+aMr1XWD7TqNwNl6lcuCZFK/Nc9tqO
   XApX/jxJaeSStMoimwcycOVOoJDGeVnbWM6gIHgQiJUomz9OcIaqH6+IE
   vfC9xDJmzAe3PdSI9JnzGWOie3d8Y3jQhrYf2/BI6eMSMoMSv7n3XrXFo
   HpwNwzrQYcDjbqQNs+hElAYH25XKTI7GgO4HYoIy29gsn3fHk+pWCxGhX
   igLo+/EujFW7+CbUsJDoOIgq0Hq1WANAUUqHUZOslTmxpBucBskAcsX4i
   Q==;
X-CSE-ConnectionGUID: fyVQDi16QwO1I16ck/XWLw==
X-CSE-MsgGUID: vCW9aaZwTJ+G86glrO+ahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30784414"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30784414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 04:41:12 -0800
X-CSE-ConnectionGUID: HcuAhA75Q7qx83V038xdXg==
X-CSE-MsgGUID: LHFSecGRTuq7im81N8SCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87431170"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2024 04:41:11 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBCgG-0000Np-31;
	Wed, 13 Nov 2024 12:41:08 +0000
Date: Wed, 13 Nov 2024 20:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Chao <liuchao173@huawei.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lixiaokeng@huawei.com, caihe@huawei.com
Subject: Re: [PATCH] Add interface to trigger backtrace on specified CPUs
Message-ID: <202411132038.ZTErSl6v-lkp@intel.com>
References: <20241112125609.1406586-1-liuchao173@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112125609.1406586-1-liuchao173@huawei.com>

Hi Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Chao/Add-interface-to-trigger-backtrace-on-specified-CPUs/20241112-210050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241112125609.1406586-1-liuchao173%40huawei.com
patch subject: [PATCH] Add interface to trigger backtrace on specified CPUs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241113/202411132038.ZTErSl6v-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132038.ZTErSl6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132038.ZTErSl6v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/backtrace.c:29:19: error: 'no_llseek' undeclared here (not in a function); did you mean 'noop_llseek'?
      29 |         .llseek = no_llseek,
         |                   ^~~~~~~~~
         |                   noop_llseek


vim +29 kernel/backtrace.c

    25	
    26	static const struct file_operations backtrace_fops = {
    27		.owner  = THIS_MODULE,
    28		.write  = backtrace_write,
  > 29		.llseek = no_llseek,
    30	};
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
