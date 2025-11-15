Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA13B1E487
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763234266; cv=none; b=Nw3EaiJ8udnENyEkpH7THpBCnri+me2+pCuGtnBU0ffuI5nD8nTG9NwThtIrZvN7kLswdaXSfi09YCwz64/QzkJ6XDqqL/5wR+sy9RKeol+SvORprTW/drYhmKFxwJJ/oN6kbP/Nsp9pZOuY5R895r95ynigCM4WJEzlgsMSR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763234266; c=relaxed/simple;
	bh=g2cQvAh5yE0riC6ptYZvbRfMN4F57LIplor5QgtTtyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBJ+r2Kj2H6+0UHB2EFMPD01RuEeDyQubGL1PRnvrU8u8oi9sb8h12Ca8skdrp6iIQlrX2e5J31tavar3VhjYWedFGoYekFSEsgduKmFjaFHaofreQYGihnJ1paL57sFghGOKIDWAX8YiL9lrWea5S36l11sSA4ZFTbjGOyG564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/KhZQY0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/KhZQY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763234265; x=1794770265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2cQvAh5yE0riC6ptYZvbRfMN4F57LIplor5QgtTtyc=;
  b=M/KhZQY0xE9Ezs5KVN9xluf+3ur+0UXS2RmZCC+bY3Rs0f5IsUmR2zbA
   t9eruUOO0uGmkREnlPShIAaVbUPVLxiwkdNQREdQiNXXjr3KBvr7Qc1g/
   tAxJ9L8PV1bNxY26MeMNNHg/vw2FHGI1qUbKKliU/QTqmQIxHMQ87MkuB
   GbxUE70qiZMHh9p0ygIzi+ze7L3Jm8VJ+qx4XnhKQ4lhrZY8BcSu1+OO9
   Cm4rpLZkwAzRcmB31OJ4Uz7suva5U6AdlfwA+d/2RoD5WOZGUsqnqSTqN
   4OyNsFFy9IBcxTU9Lzsgh9D4qP9DF44C0xxeyWcsWq4iM38kIjypp+6eH
   Q==;
X-CSE-ConnectionGUID: yEY0L2PVQPqS78dr7mEfhA==
X-CSE-MsgGUID: x2KEps6rQnSWsOV8Hy9NJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="67901325"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="67901325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 11:17:44 -0800
X-CSE-ConnectionGUID: vZ7Av/DES0+tcAfOT2NYPw==
X-CSE-MsgGUID: GgUM64atTOib7FMy2Pg3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="194194212"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2025 11:17:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKLmG-0008CY-1E;
	Sat, 15 Nov 2025 19:17:40 +0000
Date: Sun, 16 Nov 2025 03:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huang Xiaojia <huangxiaojia2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3195/3195] fs/mfs/data.c:185:24: warning: default
 initialization of an object of type 'struct vm_area_struct' with const
 member leaves the object uninitialized
Message-ID: <202511160338.SRwmoKy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3abd440f300fe9312974a2d65499ca4ff872363a
commit: 693388489ac5689392e98cf86f58f115ffa9c9ce [3195/3195] mfs: Add basic data operation for MFS
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251116/202511160338.SRwmoKy5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160338.SRwmoKy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160338.SRwmoKy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mfs/data.c:185:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     185 |         struct vm_area_struct cvma, *vma, **vma_;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   fs/mfs/data.c:220:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     220 |         struct vm_area_struct cvma, *vma, **vma_;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   fs/mfs/data.c:214:12: warning: no previous prototype for function 'mfs_filemap_map_pages' [-Wmissing-prototypes]
     214 | vm_fault_t mfs_filemap_map_pages(struct vm_fault *vmf,
         |            ^
   fs/mfs/data.c:214:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     214 | vm_fault_t mfs_filemap_map_pages(struct vm_fault *vmf,
         | ^
         | static 
   3 warnings generated.


vim +185 fs/mfs/data.c

   179	
   180	static vm_fault_t mfs_filemap_fault(struct vm_fault *vmf)
   181	{
   182		struct file *cfile, *file = vmf->vma->vm_file;
   183		struct mfs_file_info *fi = file->private_data;
   184		const struct vm_operations_struct *cvm_ops;
 > 185		struct vm_area_struct cvma, *vma, **vma_;
   186		vm_fault_t ret;
   187	
   188		vma = vmf->vma;
   189		memcpy(&cvma, vma, sizeof(struct vm_area_struct));
   190		cfile = fi->cache;
   191		cvm_ops = fi->cache_vm_ops;
   192		cvma.vm_file = cfile;
   193	
   194		if (unlikely(!cvm_ops->fault))
   195			return VM_FAULT_SIGBUS;
   196	
   197		(void)get_file(cfile);
   198	
   199		/*
   200		 * Dealing fault in mfs will call cachefile's fault eventually,
   201		 * hence we will change vmf->vma->vm_file to cachefile.
   202		 * When faulting concurrently, changing vmf->vma->vm_file is
   203		 * visible to other threads. Hence we use cvma to narrow the
   204		 * visibility. vmf->vma is const, so we use **vma_ to change.
   205		 */
   206		vma_ = (struct vm_area_struct **)&vmf->vma;
   207		*vma_ = &cvma;
   208		ret = cvm_ops->fault(vmf);
   209		*vma_ = vma;
   210		fput(cfile);
   211		return ret;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
