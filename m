Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8825A2BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976288; cv=none; b=ropfjIqtbVUUmadeGfLWyYpMOfsJ3EIYgccVNJI7Cx9mkjmtPPCWMGRnsr4uwbtqu5BhKdDtLMVxLCrRuGLM7oPSX7D1eD0GotAA5xet3Ga2hezOhTtaBcWnm+xBLuQqi6U8GDS7RZkSBmjKuJmYR5+PtDk7jdaqJO4B11zYBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976288; c=relaxed/simple;
	bh=nnkq7RUW+O221kUXhqaHwDtALI4iMz0QBRIeg4lfdEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rf8LMgtXUYYPl04vjDEZjVTVLkJdiG7KNacxodXXuNisXATc8dIhqZNQWK5gRut+NU476DUifHKPKN2cWydyNs8Re1cI1EKdAk9tDaLc2Apb0BiwwLM75qfK+vd1/u/oTYM12+wj659QyrlIpMMH6RbIDuQWWZO7l8vddA1rL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipp5JzZv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipp5JzZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770976285; x=1802512285;
  h=date:from:to:cc:subject:message-id;
  bh=nnkq7RUW+O221kUXhqaHwDtALI4iMz0QBRIeg4lfdEg=;
  b=ipp5JzZvrAbMrKPH3NCTYwv+hC7ISpJidI3SjLnAaCCFUdxW6lzepQRQ
   9MSy6ntDtKY9Ah0nPbjY2JvpxG3988qxN0DrIZKikQQgJe/7MMyX0DsnG
   Hwr/aClEy1nFNvsFtK1wicesZmnVvpUjKiRMoquAjoMGteForrYkWj4eY
   LaSmVLz85Isi1r7vSbL6RG7BPgtkXo3RJKPMZ4wJ13X18Th9o9N41Mg6E
   WKTEOrbu0kJhrsmUxROEPA0SPv1ZvsTQUR9rml6H8cTD0Xb9jUuujEZJl
   jKvy++Y4NqhODfFFvJkfgvRI501zoQda2tjZpCQq/FTobwoZ87rRAwv0m
   w==;
X-CSE-ConnectionGUID: Nr7QlcDSTU+oe66L2ixcTA==
X-CSE-MsgGUID: +RVvXln6SBm18Ov4ynYfcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="76005237"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="76005237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:51:24 -0800
X-CSE-ConnectionGUID: yN4ObeaPQwuhl7Lbc2Zvxg==
X-CSE-MsgGUID: Y21oRwj7SZ2Sl3I+95Pl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211784966"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:51:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqppZ-00000000vHW-1v9C;
	Fri, 13 Feb 2026 09:51:21 +0000
Date: Fri, 13 Feb 2026 17:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/binfmt_elf.c:2162:19:
 error: 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202602131700.kReBBh38-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f79a8f9ddb6e174b3279f3a3925edc2357efb0fa
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-072-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131700.kReBBh38-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131700.kReBBh38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131700.kReBBh38-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
