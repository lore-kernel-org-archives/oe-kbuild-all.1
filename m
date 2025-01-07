Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824B8C1E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252072; cv=none; b=oe2/GJVvcZddMTsNYKzr3PbsWK5EBSF+AzN85JCnBuOsk1NSp+Io+PMakwgXVOO36hQu2ScDh12s+9o2SKOptSAgOBmCQfGc+D0yk8oUv081pvAXztNHALL0XBGYIh9LQyy/DrhFEUvFfaCZrMn/22R5FrT686iowk+8nW7t9O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252072; c=relaxed/simple;
	bh=sOjRLXmx9DwpHsaj4hBp+o1af/Z2x3VoAOtvH64iEPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPs+EWo+pkE4HewV8XrwUKBp/zam31fxUl1u9DjeVLskc5zRwLiNOM+Q3/OKTElGeSP/01q5BM95HUAnEvn8GEIzYsiQ0T8d+/J1MhzFwenLbgPdRrxiiJEiM0GIwzVN48iBPe3SIVMH9xF+6kZKKnzPLk0ClCHZpYHLdmFKrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMTN6d5P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMTN6d5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736252069; x=1767788069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOjRLXmx9DwpHsaj4hBp+o1af/Z2x3VoAOtvH64iEPM=;
  b=dMTN6d5PHIfA2hhKs2tJNhNa9Q6LmWh1tyBR5RDAy6RxAVVpixz+0xRL
   MMAKCv+sOYM2wl++rryVGCUSG9y93Yd9K3ARxafVzrkA3vML875x2Jy1V
   F0oCuPHKQ/yiLDxRHrohu5L1QER6h+p/F4UB8u3693n6zk5+jgiL2zejv
   SilJ4t4wEmZJVMr3yOc23ojwuynNbJ31zaxk+DhN0KzJj1bKXnPke0LQr
   cQJ0AMh5pa7wK+LhgLHMQkoGY0oRf6xd1W3Q48H2x0aCsfFnvHKNRDJJa
   JiRgdGLXzatq//px6q52Jy84mLOKi2ck1sc3OE2xVe6Dzt7wKOVpuIK7i
   Q==;
X-CSE-ConnectionGUID: 97PYK+zUQt+bZZEqaKf5fQ==
X-CSE-MsgGUID: kuQVtHbTRdGJQYe/kZUxNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47849007"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47849007"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 04:14:29 -0800
X-CSE-ConnectionGUID: yW4RGLmTTXy61NOBWnF4hw==
X-CSE-MsgGUID: vKKEcXHORhWA1kgEwQYSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="103262954"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jan 2025 04:14:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV8TZ-000EeZ-2G;
	Tue, 07 Jan 2025 12:14:25 +0000
Date: Tue, 7 Jan 2025 20:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] fs/file_table.c:331:5-29:
 WARNING: atomic_dec_and_test variation before object free at line 346.
Message-ID: <202501072019.eYFsUuDi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: b81c7169d761934a461fd1ef5a4b2876c30e84ca [1347/1347] fs: remove fget_many and fput_many interface
config: x86_64-randconfig-101-20250107 (https://download.01.org/0day-ci/archive/20250107/202501072019.eYFsUuDi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072019.eYFsUuDi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/file_table.c:331:5-29: WARNING: atomic_dec_and_test variation before object free at line 346.

vim +331 fs/file_table.c

   328	
   329	void fput(struct file *file)
   330	{
 > 331		if (atomic_long_dec_and_test(&file->f_count)) {
   332			struct task_struct *task = current;
   333	
   334			if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
   335				init_task_work(&file->f_u.fu_rcuhead, ____fput);
   336				if (!task_work_add(task, &file->f_u.fu_rcuhead, TWA_RESUME))
   337					return;
   338				/*
   339				 * After this task has run exit_task_work(),
   340				 * task_work_add() will fail.  Fall through to delayed
   341				 * fput to avoid leaking *file.
   342				 */
   343			}
   344	
   345			if (llist_add(&file->f_u.fu_llist, &delayed_fput_list))
 > 346				schedule_delayed_work(&delayed_fput_work, 1);
   347		}
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
