Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7262312B83
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717390952; cv=none; b=Opy/n+BfAxWbpiUhZdNpSrDRJMTrsumaYvShSAeI9SCwdgqFPXSulbyIIwllLoxbIXYb/Z/4nfry/vgQIWfeH4k4AFlPit9WCfjXxqoSwS+oX9HLALJV3OxyItMZiGVxHIkIMxn6wvnHvsTXK05zmRr0La+VWhUmxxocZzuX24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717390952; c=relaxed/simple;
	bh=1Fr9Sl2is++bpBC0wQsophdAvq5buYyphOzE+izRyJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTc2IBNT7WImUkdNsMXVnXnyZGukwM99zn9tUjnSoMVCNsWYrQmmN3BNHibUWMeAf6B1wkvJIaUmuM5zNNOtQJU+RUUlDXW6IoERfBoLza+6Y2IiHPvWUnZXAhv1ejYETPCTG/ZIBVzPmTTcKJ/nuJZr7GobsWBAPSAs/j1JIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoYjFjkp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoYjFjkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717390951; x=1748926951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Fr9Sl2is++bpBC0wQsophdAvq5buYyphOzE+izRyJM=;
  b=XoYjFjkpO4h/uET9HeV8iNIILOeDEmZEHuCRoDxbyexnoZ2hNZknWG/Q
   ZKfy2yqHkaFS9mt+cUo3Qa8/k3ZRkFnAkVcNXNLIDVoTySQIJzF9kbTVs
   Yz8U1H1ILBlzppaDizjKdAtMpHlTZ06DLVhoa5aSJhSrXrrijR8Dc9cnJ
   /URByb87CwcoL0zabbmTTUJFbuG+AYZQeLpifw5+5o8OAC131/h91nvd/
   +dQRi8+c49yn8NLxRlHK6BZVznVICdervWNcSKXm0jarstNNGXGtiwQl5
   8QgD9uLE0QFd/Cjsfhv/eav/f7pWsNTMKsAKQZ1lmog/v5Fj3Q1pdzPEp
   A==;
X-CSE-ConnectionGUID: VmOySCEISSyzWrMv7sEO+g==
X-CSE-MsgGUID: vtNxR3YeQDOqSipWGTNafg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13736994"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13736994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 22:02:30 -0700
X-CSE-ConnectionGUID: MX9VQkVgT0CdSdrKfY91oA==
X-CSE-MsgGUID: LgS2Y4VSQy22/QDsmgMUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="59928722"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2024 22:02:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDzpg-000L2b-0T;
	Mon, 03 Jun 2024 05:02:16 +0000
Date: Mon, 3 Jun 2024 13:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] darray: lift from bcachefs
Message-ID: <202406031215.Diw8Tr5W-lkp@intel.com>
References: <20240603003306.2030491-2-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603003306.2030491-2-kent.overstreet@linux.dev>

Hi Kent,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.10-rc2]
[cannot apply to akpm-mm/mm-nonmm-unstable tip/x86/asm akpm-mm/mm-everything next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/darray-lift-from-bcachefs/20240603-083536
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20240603003306.2030491-2-kent.overstreet%40linux.dev
patch subject: [PATCH 1/5] darray: lift from bcachefs
config: i386-buildonly-randconfig-004-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031215.Diw8Tr5W-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031215.Diw8Tr5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031215.Diw8Tr5W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:461,
                    from fs/bcachefs/reflink.c:2:
>> fs/bcachefs/btree_node_scan_types.h:5:10: fatal error: darray.h: No such file or directory
       5 | #include "darray.h"
         |          ^~~~~~~~~~
   compilation terminated.


vim +5 fs/bcachefs/btree_node_scan_types.h

4409b8081d1624 Kent Overstreet 2024-03-11  4  
4409b8081d1624 Kent Overstreet 2024-03-11 @5  #include "darray.h"
4409b8081d1624 Kent Overstreet 2024-03-11  6  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
