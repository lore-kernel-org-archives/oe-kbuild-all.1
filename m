Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE11487C1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178255; cv=none; b=gK0njmVTMz0sXWzbTQmkBxqBWgPN3uXJR1sRu4GsrLUaNxwyqltQtx6eRjuJhDuGkV8+gbhIo3k1m7ytUvEGge1EMT8slh00JG+lGTf4Wjvp1iar15D4qimMvQxuevsfgxDonVSeItXh07GRCoiBmiInpqIEajbQI3XnkFM51fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178255; c=relaxed/simple;
	bh=4kjIsMkisVWOOrAn29QfTJ9XNkfHii7d/nQS0eygjQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFocoMQOYuIDcqSDAjkuLuQgQQQyRryC15HoSpxODrTkYMjGL2oDS+5as96j/y5/MDHRsp+Nu2W3S070leDzGy17A7Qfv/JtrDHX2J61GlkD2x0nR0TtDCDxbqotyEoa/uLgpJCWwsRZ6QW4o9U6km2CbtfYh5HsQZ3LWiblLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl5aEj9I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl5aEj9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720178253; x=1751714253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kjIsMkisVWOOrAn29QfTJ9XNkfHii7d/nQS0eygjQk=;
  b=Hl5aEj9IaAgMgpKSr5UDh8q01pZNQ0/cahVWUPEwSy+0RuIiArXyzUto
   NEmyHoxQ03zJy5ucZR6TfHH7JOnJobwgVBd3ouEnGTnP576csrcugKBcT
   8GI7BKk9TEzhLqhfvLRq2lRtdS1SN/IGxbm1ihIEtRe8IdkasmmoWm+TS
   LWawgBOyIT3uJfromzhgffLOrXiI76Gwp+jNgXDF5Kp9Fc8vbTzYgNgnY
   Hc4wE31FFRuggEERzxuZQ+hAknzRpa5fn0mmURQv+GWnE4+XU3XNzRYqa
   caRWEqEpgnnzm37JbmaosRRkxjiUfdKlRIygWF16BzJVQAYHQupwEA7fj
   w==;
X-CSE-ConnectionGUID: v66Kq6z8QIKhLbSlciniNg==
X-CSE-MsgGUID: scUmXxgmToyj5+Y0AJxHtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17188937"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17188937"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 04:17:33 -0700
X-CSE-ConnectionGUID: AFFlLE3ARoaxWAjU3cY83w==
X-CSE-MsgGUID: gHPq2jGyTImu2FkZuFuPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46825818"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2024 04:17:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPgwT-000SJA-2J;
	Fri, 05 Jul 2024 11:17:29 +0000
Date: Fri, 5 Jul 2024 19:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Matthew Auld <matthew.auld@intel.com>
Subject: [drm-xe:drm-xe-next 6/7] drivers/gpu/drm/xe/xe_pt.c:931:73: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202407051904.cZVyDRlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   c55f79f317ab428ae6d005965bc07e37496f209f
commit: a708f6501c692551e3d4ea618c44021f436730d9 [6/7] drm/xe: Update PT layer with better error handling
config: openrisc-randconfig-r123-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051904.cZVyDRlA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407051904.cZVyDRlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051904.cZVyDRlA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_pt.c:931:73: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/xe/xe_pt.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +931 drivers/gpu/drm/xe/xe_pt.c

   906	
   907	static void xe_pt_abort_bind(struct xe_vma *vma,
   908				     struct xe_vm_pgtable_update *entries,
   909				     u32 num_entries, bool rebind)
   910	{
   911		int i, j;
   912	
   913		xe_pt_commit_locks_assert(vma);
   914	
   915		for (i = num_entries - 1; i >= 0; --i) {
   916			struct xe_pt *pt = entries[i].pt;
   917			struct xe_pt_dir *pt_dir;
   918	
   919			if (!rebind)
   920				pt->num_live -= entries[i].qwords;
   921	
   922			if (!pt->level)
   923				continue;
   924	
   925			pt_dir = as_xe_pt_dir(pt);
   926			for (j = 0; j < entries[i].qwords; j++) {
   927				u32 j_ = j + entries[i].ofs;
   928				struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
   929				struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
   930	
 > 931				pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
   932				xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
   933			}
   934		}
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
