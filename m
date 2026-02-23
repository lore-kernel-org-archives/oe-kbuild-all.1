Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D130FC29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 16:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863954; cv=none; b=UGm6OhJ7MQcHRZTtnfMWK/ffbFX4pWecqbXiO8aXahuG3WuILh1VY9kogwDAkLf/cXFW2eah8GozducQP3YHZ2nFA/g0c+fG6Z9dSZTm1NC3JM1fDntVnbdsJe9Q1Fb6WRQD4wFyfbd/YVXEhpJK/sKz+RDZCVrTI1rBP03EukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863954; c=relaxed/simple;
	bh=lQbCE8iP2PPNj+4Oj/v389X8pDgDFTe0TUUwpg7dmkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RDmonj0lf2N64hELRlqnXikbB3RKQ/mBt3G6KiAP8FJ6ZvHMbdOgsLvApoqgNoprwR+W5GP/WqSnIJmXQClgEPdwAr8/mKiLgZ7zXLQlZ6qFiwAXm1ZBRytrq08PPpq4HLvdQhrTwn2HQ1KMTpXPqveTvm/gCNjgiIpnP2332Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0W3J6We; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0W3J6We"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771863951; x=1803399951;
  h=date:from:to:cc:subject:message-id;
  bh=lQbCE8iP2PPNj+4Oj/v389X8pDgDFTe0TUUwpg7dmkA=;
  b=D0W3J6We7TfwfCvCZjCmEENjobLZyOOFeGj8M/BZZVk2e8ApQoYFzQta
   1rfwWemyG+Nh4JOMHiGvD6h1Z86fvMab7L30z71dMygPZzQlwIUX9LA9v
   THldOBKnFlZsUIWyElqv6nHoxWIF1FC8NLX/A5kUDTkOF3fFqIa54QrAY
   +Q7YKoScVeZWrDLw3VRbH78lPuAjla6i8BNq+/3flXogeLBu3/UulICOQ
   rJxgPhvkKgXs8E1RPdjHm2Qcl5H/SzL70eO2X35Cq6jlctSbjt/UX7z66
   635/lo3Ya/uso+3T1vFIDm9rFDt9pvcxCa3esu3MwvxwncBeo/ro+jmbO
   Q==;
X-CSE-ConnectionGUID: 7702CVVaTpSuvS1N3WFKXw==
X-CSE-MsgGUID: xwZyAL9AQUadwNpmiE5YFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72072961"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72072961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:25:51 -0800
X-CSE-ConnectionGUID: TeDGioI7QASvT8UPmZYbgA==
X-CSE-MsgGUID: uZtVP7mWTvekcxDgYw+FFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="213532504"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 08:25:48 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuYkO-000000000WR-1YA4;
	Mon, 23 Feb 2026 16:25:30 +0000
Date: Tue, 24 Feb 2026 00:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd+guestmemfd/v1 12/15] mm/memory.c:5340:28: error:
 'const struct vm_operations_struct' has no member named 'uffd_ops'
Message-ID: <202602240004.Sop2OCIr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1
head:   ea5af993d28d129d273453041a5ad6b3a1a9e31a
commit: 40ced64186624690248a72f77202a245eb1717e3 [12/15] mm: generalize handling of userfaults in __do_fault()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602240004.Sop2OCIr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240004.Sop2OCIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240004.Sop2OCIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__do_userfault':
>> mm/memory.c:5340:28: error: 'const struct vm_operations_struct' has no member named 'uffd_ops'
    5340 |         folio = vma->vm_ops->uffd_ops->get_folio_noalloc(inode, vmf->pgoff);
         |                            ^~


vim +5340 mm/memory.c

  5330	
  5331	static vm_fault_t __do_userfault(struct vm_fault *vmf)
  5332	{
  5333		struct vm_area_struct *vma = vmf->vma;
  5334		struct inode *inode = file_inode(vma->vm_file);
  5335		struct folio *folio;
  5336	
  5337		if (!(userfaultfd_missing(vma) || userfaultfd_minor(vma)))
  5338			return 0;
  5339	
> 5340		folio = vma->vm_ops->uffd_ops->get_folio_noalloc(inode, vmf->pgoff);
  5341		if (!IS_ERR_OR_NULL(folio)) {
  5342			/*
  5343			 * TODO: provide a flag for get_folio_noalloc() to avoid
  5344			 * locking (or even the extra reference?)
  5345			 */
  5346			folio_unlock(folio);
  5347			folio_put(folio);
  5348			if (userfaultfd_minor(vma))
  5349				return handle_userfault(vmf, VM_UFFD_MINOR);
  5350		} else {
  5351			if (userfaultfd_missing(vma))
  5352				return handle_userfault(vmf, VM_UFFD_MISSING);
  5353		}
  5354	
  5355		return 0;
  5356	}
  5357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
