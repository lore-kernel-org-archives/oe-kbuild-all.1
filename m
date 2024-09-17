Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C814375D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726602756; cv=none; b=JJcQcxAwqtwmTYhahnSp1T+t9IVK2Ot7/MkDfGn/emlgU8SVzSYzKP/ynnO+iDZv8ZTvQiJZfjWj9Npja83bHaKFbgzBf5XpSj2dzaShyKbCa83ynKVo3MYG5z+3iatUsw9eembyeRyuK0x2bIYI0sq316lGkZay5y5GZRvhxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726602756; c=relaxed/simple;
	bh=uMAa5///7OUstZ1b7Ixo+t2olpjy7exkQUwI7YqpvOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9us0NmMUiVwH3JQbP/mt7VVwgoiUe8sqMK+Jg14jjL/87kCO2MTPEOwzqfhlEXvMJyP3b7/lgmKwuRgxVvT+zExUDWMEHypjpUwZiNYqKddmkwMo1XRcY0HNldsUsIQA1UmF7+l+n75utvHXWX2FjtQ8R0IbfKYnpiznpJlptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cld1hLjh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cld1hLjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726602755; x=1758138755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uMAa5///7OUstZ1b7Ixo+t2olpjy7exkQUwI7YqpvOc=;
  b=cld1hLjhgF2y1TSzJVRS9hYBM+Kclg+g3LrXy9Mk2zAILsUZIqPliO9R
   F1D2BfzyKoyUtpLDndC3F8YfoQwLjv/NlqnpNAGnjlT0hjIxxPtnwwJmb
   NhL+WTZ30wYJ0y6I7dtmnpzvx7NuE+8vaEHAeN4kwkVGaID3MooOuFHKu
   NtuZGBurrNgygiTqUfWbpiQ0B4VAlej0f8DZHBPT+8nLyXzyJPLtizcK4
   g+ybRgms75XD/wfxsiC9UkLCFbhVEMInoT0UJg1kZLMwZnytvwkHFvq20
   xrfxcn+IRJSBKbxDiYmsVC/CGJB07OucgUjIfLwjC6LD/PZyxIvQzw5zV
   w==;
X-CSE-ConnectionGUID: 6rdWUQ03TSK3Q9nMwfVoSg==
X-CSE-MsgGUID: VZozpjh0QUS3SpybEP3jHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25582510"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25582510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 12:52:35 -0700
X-CSE-ConnectionGUID: 5/7kjuLcS869eLpfBT9elA==
X-CSE-MsgGUID: AEvTTbQEQn6NhpBGRQUtTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73660218"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 12:52:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqeFT-000BUE-0l;
	Tue, 17 Sep 2024 19:52:31 +0000
Date: Wed, 18 Sep 2024 03:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] WIP: hazptr: Add hazptr test sample
Message-ID: <202409180356.Y4n5GeH0-lkp@intel.com>
References: <20240917143402.930114-5-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917143402.930114-5-boqun.feng@gmail.com>

Hi Boqun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240917]
[cannot apply to paulmck-rcu/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boqun-Feng/hazptr-Add-initial-implementation-of-hazard-pointers/20240917-223604
base:   linus/master
patch link:    https://lore.kernel.org/r/20240917143402.930114-5-boqun.feng%40gmail.com
patch subject: [RFC PATCH 4/4] WIP: hazptr: Add hazptr test sample
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180356.Y4n5GeH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180356.Y4n5GeH0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: samples/hazptr/Makefile: No such file or directory
>> make[4]: *** No rule to make target 'samples/hazptr/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'samples/hazptr/Makefile'.
   make[3]: *** [scripts/Makefile.clean:61: samples/hazptr] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [scripts/Makefile.clean:61: samples] Error 2
   make[2]: Target '__clean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
