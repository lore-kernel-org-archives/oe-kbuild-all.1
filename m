Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F5329E5A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252722; cv=none; b=O8+JvYkEsnPUE0aN+t4xn6nRMmo2ehSL9XP8SHv0yPmA90jktuoipptVcPjPEqrdWY+jSNoeAX06Srrv/nyxEqf6Esqny4V9h3fqN2fyXKK5V9vEhzyV7PFwjRL5fOY3+QdVKuCiKGkPy3QD79QR/HmPlioNS1zQ0a0FrNNS3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252722; c=relaxed/simple;
	bh=dZYM/HEP/qug6JNwtkL8AxNvo2e8wrkDNIlcwoGP6mE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9SF9Mn8V3hXMjnsnCM/Rn4+TkUZlR/gA8gQA7/4SZRFZSTDIY54h+xVZKg3Cz+zQ/uVz/T1li1kmD6Pcfjy1WmIIuex8AcFp/HEdbFsB9MKO8N0cHwbqd+HrHZWxZPXxR7KRhBYKaPCLFvI5QafXVFIIXPMb7u+Alc2+tgaaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxSEDu5S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxSEDu5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776252721; x=1807788721;
  h=date:from:to:cc:subject:message-id;
  bh=dZYM/HEP/qug6JNwtkL8AxNvo2e8wrkDNIlcwoGP6mE=;
  b=OxSEDu5SWa1svJ1d5rgi2oQn2OGOPb0SAvvn7PWIuNC42qjw4uBP4SNf
   PDenPBHqG9XTAyigxO3d2vc5wrMYgfZSl7aclbbT/k0lVzxgh9gbSr8Ci
   yXsUbCQ85IhYa9+zgSeUIt/ysEF+eYZHHs7BUabQKvPy+c1hpnIyavjZP
   OflYAB1+R3VqYxJUwfb4rCqXdh7SYeOxcIPoWgR7SXbi+/njCKUaFips1
   SN7RSeE+fnfopzZvg5Rka78+ZUXL0AUb3tstx1YilCupDYj4OYikO4TsE
   k1yQFYrxPDu9vwLt+oSzKVOfhCHjKkFk/O7kZr+0rIt++SYDx+hN+xCrA
   Q==;
X-CSE-ConnectionGUID: mQWN4hkQTK6kmmk9eRAVbg==
X-CSE-MsgGUID: mQeBxR1GShGtr18m3v7P2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99867486"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99867486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 04:32:00 -0700
X-CSE-ConnectionGUID: ehhDixfNSbSUjmPKaHJD0Q==
X-CSE-MsgGUID: V8mc9QiPSXabP37b+uWoZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227214126"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2026 04:31:59 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCyTM-000000000RX-49mQ;
	Wed, 15 Apr 2026 11:31:56 +0000
Date: Wed, 15 Apr 2026 19:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd 3/12] mm/mprotect.c:659:27: error: 'PAGE_NONE'
 undeclared; did you mean 'PAGE_U_NONE'?
Message-ID: <202604151954.YJwa73XS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd
head:   bfa1e12c7a014c9ce5d1ae4b8b43dcb8e3d62965
commit: 871fdd0aefe33cdad832ec2005b7b8f5a1059033 [3/12] userfaultfd: implement UFFDIO_DEACTIVATE ioctl
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260415/202604151954.YJwa73XS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151954.YJwa73XS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151954.YJwa73XS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mprotect.c: In function 'change_protection':
>> mm/mprotect.c:659:27: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_U_NONE'?
     659 |                 newprot = PAGE_NONE;
         |                           ^~~~~~~~~
         |                           PAGE_U_NONE
   mm/mprotect.c:659:27: note: each undeclared identifier is reported only once for each function it appears in


vim +659 mm/mprotect.c

   657	
   658		if (cp_flags & MM_CP_UFFD_DEACTIVATE)
 > 659			newprot = PAGE_NONE;
   660	
   661		if (is_vm_hugetlb_page(vma))
   662			pages = hugetlb_change_protection(vma, start, end, newprot,
   663							  cp_flags);
   664		else
   665			pages = change_protection_range(tlb, vma, start, end, newprot,
   666							cp_flags);
   667	
   668		return pages;
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
