Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641B8F6E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725500722; cv=none; b=icN11OVCC04MpkSIUZJUefN+ivEZxqB0HYAKb7VyPDxtbiMkqYEfUXSuYocbzEOBfJ30q/QDvhX0UfQBvgFZu0XY7uGo72lVJxzrZnOEb5vhbF3sA0rgmQt+Js3w8EFRRgSD3FTzOY1BTm7neKpQOr9PWVQq0R6ozCYETFWhmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725500722; c=relaxed/simple;
	bh=F+485MBdfdbS3Ebd0eJMTvH3SywNcQPEg6fAC9X4FmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvZYkPupMtgW0kjRIzx2b45Ix5aL6QVd414nanUGYqxqG27YnP83L+OqUDAJcwkXrE1aDjfxhjBlrK/wU9EGJqtXKj7xJ5D0zRjc7YP3ujzqM4ySuaC06kqflmINAGrCbBWA5Eh/4/qcYVcG5VxkH3xzpYI0zCXSKSACnN8jBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXnPDc30; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXnPDc30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725500720; x=1757036720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+485MBdfdbS3Ebd0eJMTvH3SywNcQPEg6fAC9X4FmI=;
  b=CXnPDc30IlJ2fz7ZhrLMAd2k/6VWvcp6I0s7v9x9EPaxb0icaODumOvJ
   cpJkb6cGuuCy6+gMXGuUP5yaUEuG03n4I6iuEewLsvc3abOQ2CiZtNxsZ
   1XGT7MVt+J8IZkhGTjlZIlup8vCKGU3r3qPz9rBIQyiPaQRMb5pU2Imx7
   JdUUJygo/tfubvy0Nu0sYxB+rdbS6OVqPyRSLtimGfpBFtD1y+bsNCmXm
   wHL830Pqy2KrOpIv1frA0eFIjhUITIqgX7gFCZ3pQ+9oGM72USgQbcKko
   BXJzgF0lFISYd96+nxUqPb1bG7wwhSoDiezpvLkA+qHofNDPAmnOkZGbQ
   g==;
X-CSE-ConnectionGUID: 328UHyFKRQOqsR29uk47PQ==
X-CSE-MsgGUID: YlIXn3LqSX6RFTmhROreHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34795305"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="34795305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 18:45:19 -0700
X-CSE-ConnectionGUID: v4gfml03SkOZiMGeZELrKg==
X-CSE-MsgGUID: 12Jk1h9iQwGDBWOVkIpPmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="70262559"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2024 18:45:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm1Yi-0008mv-1W;
	Thu, 05 Sep 2024 01:45:16 +0000
Date: Thu, 5 Sep 2024 09:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/8] openat2: add CHECK_FIELDS flag to usize argument
Message-ID: <202409050953.ufxyN6ku-lkp@intel.com>
References: <20240902-extensible-structs-check_fields-v1-4-545e93ede2f2@cyphar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-extensible-structs-check_fields-v1-4-545e93ede2f2@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/uaccess-add-copy_struct_to_user-helper/20240902-151229
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240902-extensible-structs-check_fields-v1-4-545e93ede2f2%40cyphar.com
patch subject: [PATCH RFC 4/8] openat2: add CHECK_FIELDS flag to usize argument
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240905/202409050953.ufxyN6ku-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050953.ufxyN6ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050953.ufxyN6ku-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/open.c: In function '__do_sys_openat2':
>> fs/open.c:1473:32: error: 'EEXTSYS_NOOP' undeclared (first use in this function)
    1473 |                 return err ?: -EEXTSYS_NOOP;
         |                                ^~~~~~~~~~~~
   fs/open.c:1473:32: note: each undeclared identifier is reported only once for each function it appears in


vim +/EEXTSYS_NOOP +1473 fs/open.c

  1449	
  1450	SYSCALL_DEFINE4(openat2, int, dfd, const char __user *, filename,
  1451			struct open_how __user *, how, size_t, usize)
  1452	{
  1453		int err;
  1454		struct open_how tmp;
  1455	
  1456		BUILD_BUG_ON(sizeof(struct open_how) < OPEN_HOW_SIZE_VER0);
  1457		BUILD_BUG_ON(sizeof(struct open_how) != OPEN_HOW_SIZE_LATEST);
  1458	
  1459		if (unlikely(usize < OPEN_HOW_SIZE_VER0))
  1460			return -EINVAL;
  1461	
  1462		if (unlikely(usize & CHECK_FIELDS)) {
  1463			usize &= ~CHECK_FIELDS;
  1464	
  1465			memset(&tmp, 0, sizeof(tmp));
  1466			tmp = (struct open_how) {
  1467				.flags = VALID_OPEN_FLAGS,
  1468				.mode = S_IALLUGO,
  1469				.resolve = VALID_RESOLVE_FLAGS,
  1470			};
  1471	
  1472			err = copy_struct_to_user(how, usize, &tmp, sizeof(tmp), NULL);
> 1473			return err ?: -EEXTSYS_NOOP;
  1474		}
  1475	
  1476		if (unlikely(usize > PAGE_SIZE))
  1477			return -E2BIG;
  1478	
  1479		err = copy_struct_from_user(&tmp, sizeof(tmp), how, usize);
  1480		if (err)
  1481			return err;
  1482	
  1483		audit_openat2_how(&tmp);
  1484	
  1485		/* O_LARGEFILE is only allowed for non-O_PATH. */
  1486		if (!(tmp.flags & O_PATH) && force_o_largefile())
  1487			tmp.flags |= O_LARGEFILE;
  1488	
  1489		return do_sys_openat2(dfd, filename, &tmp);
  1490	}
  1491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
