Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5483D171A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369447; cv=none; b=DrLzNYu4UK08QnILFE25/+0r9k3yI8VWOpXs4tJHVMZ1l4Z7ncj2axgHuaeLf8eXlgr2qidmt80fxM5ba9a8Doa/S+ehYy7dm3+fYuI4hKStXwLveueg5AGkFHt+zpAflVtBFJQX1hCPwI0dzEOrgZ2rz/5GHLIRr1jnzHiPGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369447; c=relaxed/simple;
	bh=DDGymy3/SK/GLGV1el1Pa+DEII1djNzvgVjHEhvhFb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REaReuknH+VXXctG7lwJnJS8pYxJ7a7ooFXWdC0MwbxVasGTKyuj17EJPVLMkhzw+vBzSXPu8+a4qLMhKL7GJ9EMCL8n+QsjIWp6+qaXw4jkyuIlZ0CnpnSf8409na/w29QIA734u7oY5sH8Leg/1XamU3lFDKzTKE2RuhB0BdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2GB/iI5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2GB/iI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779369446; x=1810905446;
  h=date:from:to:cc:subject:message-id;
  bh=DDGymy3/SK/GLGV1el1Pa+DEII1djNzvgVjHEhvhFb4=;
  b=i2GB/iI5/MR7UzlcItcFdafjQW4Xc/ycEnFoIKMzlMEITZuH/sUzxu+9
   +c6dNuLothm8t3wBZhFNObXWj+JiOvXMPHsYbaE6GxO336vGzoYbdbWEu
   vtFcBwjT3bAGybMITNGeS2vxpKKtSSHTO+15LmgX5odhi+b0Dt0BI/HhS
   yBbVbjkmk8EAywH0dUa4CtaeSNz193UkKrRsEHBZr0ZImD7RHfxD8tW9b
   6xSPdD2ywJuPyYck5/As/rDLcqfdzJwlzkn+03PIg5C0FCyz04AdnENhi
   f3X/vDQ2boeY3cAoJFbK6KvUxbcm6cheIwu/WjiADEMGK/3VQ7mtS8J7g
   g==;
X-CSE-ConnectionGUID: DWAKfrhQRFaTZto0KDfutA==
X-CSE-MsgGUID: xsfaj9WXQm6/kpbFUkVGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90861680"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90861680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:17:25 -0700
X-CSE-ConnectionGUID: x7oIJ1sOTqW2cwZjBA9/HQ==
X-CSE-MsgGUID: Scs3FvU+Tzq7xps0Ci7QOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="237922014"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 May 2026 06:17:24 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3H7-000000000LJ-44Hs;
	Thu, 21 May 2026 13:17:21 +0000
Date: Thu, 21 May 2026 21:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 264/1130]
 fs/proc/base.c:1090:1: warning: control reaches end of non-void function
Message-ID: <202605212145.PVQDByb8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: b8a1660e16020a9bce7c514779971652694d7eb3 [264/1130] [CHERRY-PICK] fs/binfmt_elf: Fix auxv parsing for compat ELF binaries in /proc/pid/auxv
config: x86_64-randconfig-003-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212145.PVQDByb8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212145.PVQDByb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212145.PVQDByb8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/base.c: In function 'auxv_read':
   fs/proc/base.c:1086:46: error: 'struct linux_binfmt' has no member named 'auxv_size'
    1086 |         if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
         |                                              ^~
   fs/proc/base.c:1089:50: error: 'struct linux_binfmt' has no member named 'auxv_size'
    1089 |                                        mm->binfmt->auxv_size(mm));
         |                                                  ^~
>> fs/proc/base.c:1090:1: warning: control reaches end of non-void function [-Wreturn-type]
    1090 | }
         | ^


vim +1090 fs/proc/base.c

c5317167854e01 Al Viro            2016-10-05  1080  
c5317167854e01 Al Viro            2016-10-05  1081  static ssize_t auxv_read(struct file *file, char __user *buf,
c5317167854e01 Al Viro            2016-10-05  1082  			size_t count, loff_t *ppos)
c5317167854e01 Al Viro            2016-10-05  1083  {
c5317167854e01 Al Viro            2016-10-05  1084  	struct mm_struct *mm = file->private_data;
06b2849d103f4a Leon Yu            2016-10-27  1085  
b8a1660e16020a Christian Ehrhardt 2025-06-11  1086  	if (!mm || !mm->binfmt || !mm->binfmt->auxv_size)
06b2849d103f4a Leon Yu            2016-10-27  1087  		return 0;
c5317167854e01 Al Viro            2016-10-05  1088  	return simple_read_from_buffer(buf, count, ppos, mm->saved_auxv,
b8a1660e16020a Christian Ehrhardt 2025-06-11  1089  				       mm->binfmt->auxv_size(mm));
c5317167854e01 Al Viro            2016-10-05 @1090  }
c5317167854e01 Al Viro            2016-10-05  1091  

:::::: The code at line 1090 was first introduced by commit
:::::: c5317167854e01dbb42d2291406ab8448d272868 proc: switch auxv to use of __mem_open()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
