Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6863AA195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867658; cv=none; b=pBRBS8Fj3QBLkL/xyX/omZLhtVxrzIKqiyjtKcr25Y708tPSUF1VgNrhh7X22tThDTYWXAqS5N6FtNbkFUBLwu3EFrLycXhOsx3USwu9GWgHa8fyF8ryp8xM2Xvc1vwx3Ag2wYeNEe/XONMDT9za2UGm10HT1hcp06X0r/JFG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867658; c=relaxed/simple;
	bh=DB7XFQrWL6hgncRoQhmVKpPuNtL1uCOXgoLF9lRQsIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+1sd9Ci3EksTQDc6dIawW6vsG/HSMLiWb7Cm3ft9neNE3wKWHu0RhQ8+y6Tro683bBLWxWtKMiLwCrQFmuoQjgkCmxf57vURhyMfG3me8Cqo7rj+nXK+5l3RzeIqHR8yPDiUdDPzOaFcsNFIkeRFRq3+Vz0DHVmX/gBYup/mSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cu48ReoI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cu48ReoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762867657; x=1794403657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DB7XFQrWL6hgncRoQhmVKpPuNtL1uCOXgoLF9lRQsIU=;
  b=cu48ReoIy673T5xkGiY1t5iPhdNC+MyKoRvl08LFHkF4G4/7dzr+iLrQ
   VbQ6BVSIsrGFXMcj/2O/NFbPkZM8XnNt+L4HTGX+jGCyflo/Ha68EkGip
   gCZF/wgkbhPDFbDhM013mWXisJunUqc97YVz5RzfDZxobuXjXcXnACRE9
   bkLrqrhD+0V9soJwL1AdRgC+NJrXzSDA+4dHxpLlV5sPzkDEhifC7yYPO
   /cxY0+2XCHnD0E+Opp0us5LE0NvfRLpcTfT4Qeqyq/JM4rkINnkpDCMjB
   crY2Wn43vVw/LXDLKGmqLF1fJA7OvVOA2po/lWlsEB2h9W2aIEeYbQsKi
   A==;
X-CSE-ConnectionGUID: 30HX+iMbQty3+Vcs4LRbtQ==
X-CSE-MsgGUID: /7Dgioi+SDme55daxofBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64845524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64845524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 05:27:37 -0800
X-CSE-ConnectionGUID: aqLCC0GXSyG3l6yniGjOZw==
X-CSE-MsgGUID: vGthdjGsRbCbimjXpLCk+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="219613804"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2025 05:27:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIoPF-0003Ax-1f;
	Tue, 11 Nov 2025 13:27:33 +0000
Date: Tue, 11 Nov 2025 21:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7388/7613] fs/nfs/localio.c:861:17: warning:
 variable 'status' set but not used
Message-ID: <202511112148.Feewnhdp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2666975a8905776d306bee01c5d98a0395bda1c9
commit: 28223614d8701e59d0cc3c94aae3cafa61eb934a [7388/7613] Merge branch 'vfs.all' of https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
config: x86_64-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511112148.Feewnhdp-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511112148.Feewnhdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511112148.Feewnhdp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/localio.c: In function 'nfs_local_call_write':
>> fs/nfs/localio.c:861:17: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     861 |         ssize_t status;
         |                 ^~~~~~


vim +/status +861 fs/nfs/localio.c

bff3c841f7bde5 Christian Brauner 2025-11-03  854  
bff3c841f7bde5 Christian Brauner 2025-11-03  855  static void nfs_local_call_write(struct work_struct *work)
bff3c841f7bde5 Christian Brauner 2025-11-03  856  {
bff3c841f7bde5 Christian Brauner 2025-11-03  857  	struct nfs_local_kiocb *iocb =
bff3c841f7bde5 Christian Brauner 2025-11-03  858  		container_of(work, struct nfs_local_kiocb, work);
bff3c841f7bde5 Christian Brauner 2025-11-03  859  	struct file *filp = iocb->kiocb.ki_filp;
bff3c841f7bde5 Christian Brauner 2025-11-03  860  	unsigned long old_flags = current->flags;
bff3c841f7bde5 Christian Brauner 2025-11-03 @861  	ssize_t status;
bff3c841f7bde5 Christian Brauner 2025-11-03  862  
bff3c841f7bde5 Christian Brauner 2025-11-03  863  	current->flags |= PF_LOCAL_THROTTLE | PF_MEMALLOC_NOIO;
bff3c841f7bde5 Christian Brauner 2025-11-03  864  
bff3c841f7bde5 Christian Brauner 2025-11-03  865  	scoped_with_creds(filp->f_cred)
bff3c841f7bde5 Christian Brauner 2025-11-03  866  		status = do_nfs_local_call_write(iocb, filp);
bff3c841f7bde5 Christian Brauner 2025-11-03  867  
992203a1fba51b Scott Mayhew      2025-08-07  868  	current->flags = old_flags;
b9f5dd57f4a529 Trond Myklebust   2024-09-05  869  }
b9f5dd57f4a529 Trond Myklebust   2024-09-05  870  

:::::: The code at line 861 was first introduced by commit
:::::: bff3c841f7bde5604b26e8ea755728b8e329c6d5 nfs: use credential guards in nfs_local_call_write()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
