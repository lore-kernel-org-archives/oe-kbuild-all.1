Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C183064AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352590; cv=none; b=tbuPFAsnyTdFbXuQpqenlwsMqUOKCs1YNv3GHw7AKeWkEQBG3la1USygHNUv2TY2c8Vm6ucQSyA5UGfljwZF9wAaS81a7oUXuTGZsCzw4Lmwe0cA/CcaZIfI0MIiRUrpgLcjiL80T3qF1cKmloyHAixYC6OzIA6cQQvv1bJdk3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352590; c=relaxed/simple;
	bh=00PnmHWjlNRoNpmmySEu2GIgGEewfsoOFPxP82drIZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G1PBZxL5xS4RlS3IIIjVnjMdlLChv9xg7pRH2Hm94L5ONvZZxNtOTUp1QeNOuMa+pxU9f7QaS06ulCAsRKuorcAgTVSoP8yyEVEzQQtp74wSRpsp1wLIX0ug8nmSJeJoTydXY8PiWz/m7ZyhSlQqVciflmgVRRkwgV7/6H3lTOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOkZuTQV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOkZuTQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779352590; x=1810888590;
  h=date:from:to:cc:subject:message-id;
  bh=00PnmHWjlNRoNpmmySEu2GIgGEewfsoOFPxP82drIZg=;
  b=kOkZuTQVR2sa07HyX/EfEn51nJ0KXN8VwjcJrQF0fpnW2Ar/osqLzf86
   WJNUh/wqfPhCJl/ldz68w5xcaW1eVR/JRuhkj9WuFy22z3mzMI7NB7ZZR
   36YuRpMK8En19ZJ151n/cfn3jCMgwjdvxMWsNtEr4febCYyrmeTYKF1fv
   2aLxG3l6ZtN3sfQGm6xeAFVJqGPTG1ZOJG95wJwk/xAMeSGymlD6s7RbM
   65y1hG+No+w2GdVyMBhQgDkdeqnLfTRH7bOKv/tdp0oA4d0rjOkgwkA56
   EDAnuXy30zZj24vATXyyizZu2ob/B/3CPJI37Q4m5hm0TDR7GZGAPAMJX
   A==;
X-CSE-ConnectionGUID: VLaTE0uoTXGaFWPkWOC38w==
X-CSE-MsgGUID: LO6ovyVIRKeUGO+tOerDXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91659521"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91659521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:36:29 -0700
X-CSE-ConnectionGUID: MpPdOqp3RXGRd5XFrEvlPA==
X-CSE-MsgGUID: HhhTLXLTRvWatpRWzbVtIA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 01:36:28 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPytF-000000004fW-3FJ2;
	Thu, 21 May 2026 08:36:25 +0000
Date: Thu, 21 May 2026 16:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 264/1130]
 fs/proc/base.c:1086:46: error: 'struct linux_binfmt' has no member named
 'auxv_size'
Message-ID: <202605211619.36I9SmU2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b8a1660e16020a9bce7c514779971652694d7eb3 [264/1130] [CHERRY-PICK] fs/binfmt_elf: Fix auxv parsing for compat ELF binaries in /proc/pid/auxv
config: parisc-randconfig-r073-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211619.36I9SmU2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211619.36I9SmU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211619.36I9SmU2-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/base.c: In function 'auxv_read':
>> fs/proc/base.c:1086:46: error: 'struct linux_binfmt' has no member named 'auxv_size'
    1086 |         if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
         |                                              ^~
   fs/proc/base.c:1089:50: error: 'struct linux_binfmt' has no member named 'auxv_size'
    1089 |                                        mm->binfmt->auxv_size(mm));
         |                                                  ^~


vim +1086 fs/proc/base.c

  1080	
  1081	static ssize_t auxv_read(struct file *file, char __user *buf,
  1082				size_t count, loff_t *ppos)
  1083	{
  1084		struct mm_struct *mm = file->private_data;
  1085	
> 1086		if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
  1087			return 0;
  1088		return simple_read_from_buffer(buf, count, ppos, mm->saved_auxv,
  1089					       mm->binfmt->auxv_size(mm));
  1090	}
  1091	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
