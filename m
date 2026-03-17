Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A5318121
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786593; cv=none; b=q1HCCND43i6dKmoQKNHj696U2Zj80GRzictTVu0sQ3BJiHD2hzVyrkU/Eu0JCQUq/nW52xpq+15F0/4XFyqDYj0YaW37JbmV1T6UjD0Ovz+FQxQs0engJ3ufysU57O4Ix4zq4qlboizsHfrS8+qFP6J8r7XgrznV0/1NBQOGO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786593; c=relaxed/simple;
	bh=S70+Qu/+Xa5tSfl/OGUS9uIu0mvYQncdYiGK6r6lmsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FZHTL+XLgxje0lEjInTc0Q/WtArKlWFE9l+7fhjBjPexrvpKNK9IndjiFk1oQSgjEYWXqCMbenbXCczoAN5MwmcgLs3Py/OA7yCpjg71bYh0V2VPf2+BWMYuojMknxZMxI/z9EgB6A6T2/qDqa9kiStLPyviBXaDe2faWD1JnFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0ta6yXy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0ta6yXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773786592; x=1805322592;
  h=date:from:to:cc:subject:message-id;
  bh=S70+Qu/+Xa5tSfl/OGUS9uIu0mvYQncdYiGK6r6lmsY=;
  b=O0ta6yXyGeMtw2jWPBLYGfgH9EClL3NkWKIgTAQOdTenf5uJKxk0RO3V
   KvzvdzSM1vHnHl43MD3dwuejIOo32MqqbB4JTdLHxOTBtlcEVdP2kLTMQ
   SsEi6uhfs166j+cCrbhnfwRYsGVapnez5xU1wyRv9aZRdpApDxx+uaGLp
   8XqaUZs5BH0NiO+j4xQf/7IfEADGiq12vF9PVnYv1bPXQSBiR+766tXGF
   wEWO6R/DuEUAJIOmtzhK+Ui/w8MBYwNoNzKFS+sxlBu4nd6ZxiujgKgGD
   HSVom5pngAJbnrRzZTfhu6Uc8czi7dkQY5dxspgeiuPIF5KAqbI56tsRd
   A==;
X-CSE-ConnectionGUID: My2iwh9YSqqp+Q1XX4vQQA==
X-CSE-MsgGUID: Jm/mKa1cTb+GtBUtuO2S2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74750514"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74750514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:29:51 -0700
X-CSE-ConnectionGUID: UEfsFN3oQkOPU1vfF2HNrA==
X-CSE-MsgGUID: IxLRS/4MS4iFKtYn1LpKug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222385760"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2026 15:29:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cv5-00000000273-0td2;
	Tue, 17 Mar 2026 22:29:47 +0000
Date: Wed, 18 Mar 2026 06:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linux-next:master 6300/6828] fs/erofs/ishare.c:157:15:
 error: implicit declaration of function 'security_mmap_backing_file'
Message-ID: <202603180630.HWujluGX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 0e2baaf8fed0eba6ae83949b8bd317d808efd220 [6300/6828] lsm: add the security_mmap_backing_file() hook
config: i386-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180630.HWujluGX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180630.HWujluGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180630.HWujluGX-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/ishare.c: In function 'erofs_ishare_mmap':
>> fs/erofs/ishare.c:157:15: error: implicit declaration of function 'security_mmap_backing_file' [-Wimplicit-function-declaration]
     157 |         err = security_mmap_backing_file(vma, realfile, file);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/security_mmap_backing_file +157 fs/erofs/ishare.c

   149	
   150	static int erofs_ishare_mmap(struct file *file, struct vm_area_struct *vma)
   151	{
   152		struct file *realfile = file->private_data;
   153		int err;
   154	
   155		vma_set_file(vma, realfile);
   156	
 > 157		err = security_mmap_backing_file(vma, realfile, file);
   158		if (err)
   159			return err;
   160	
   161		return generic_file_readonly_mmap(file, vma);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
