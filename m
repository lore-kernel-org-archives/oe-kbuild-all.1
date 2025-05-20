Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0F254AE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765033; cv=none; b=tS2yxOsQ5KiAw+DnDXgBK8eFugZJns+mC3RVO/x7dHSk6hv92/auqkJT7RP5bsD4y4/jKP2SaqijCBhlbaa+DyEktv+89RCjbxa/tj1bbn3wn3arKofB/P/YQuvlbqdnCIw4wEY04bH2VubVoCIDMmK8m3aXzv9euSioG22OBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765033; c=relaxed/simple;
	bh=c5oRJ7NmwVR68weSM3h49ukC6CGYggxc1REYINVeYdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ND9adhHaz54hFwxDfpCNlL4lziClIJc8oA2KF31ev+XrzECX9T2H5txMH82w8DB8RcuvPRxy7UVjGCMaWbevCtYIf3OLYS09X1Tl54DPrKtSvDsBypBDdW00k1srddw/p8I7STG33BdfEbD1e+fZZZXx4OTWaJfY/lo3TS+urAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTqHFPzI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTqHFPzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747765031; x=1779301031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5oRJ7NmwVR68weSM3h49ukC6CGYggxc1REYINVeYdo=;
  b=BTqHFPzIH4wlkPvvPe3ya52nu/IoQckIm0mX+98qArhEiXGBcu4VwLaM
   N2XakhFWJfx53zj00hB8GceABU0ME4FPNuNb0wJ5sFjmNeFCyeBOW8Yhf
   sdRC3nRGS9jvfZktAEM5qZVU/HLTatl25lxT6eViAixMJ9SdO9hllWK56
   yHCheK0ytw97Zke4iEV9vvdIQoT228UdYS3nO9mwaf8SIDwMB+rR0AfVg
   LvHiWh+auLiayRqsD/VNIr3FYcI09W3VosOa5lICj2hUimClp697c/LAD
   B2hQDI/4+Xretxz//hblrVcKqAq55b9N+u+fokIWVyyJW40EfLiV2pRNH
   g==;
X-CSE-ConnectionGUID: CmoIafXHTf6++N1r7qXkGQ==
X-CSE-MsgGUID: VQaYyyGjQj+tNR7MdoSLIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52341647"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52341647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:17:10 -0700
X-CSE-ConnectionGUID: z39kGaTPR1iRGJNBnPx/gQ==
X-CSE-MsgGUID: XWllaLcfRKCnyzTrSQtDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139651486"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2025 11:17:09 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHRWV-00010h-0k;
	Tue, 20 May 2025 18:17:07 +0000
Date: Wed, 21 May 2025 02:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 0/1]
 fs/smb/client/cifsroot.c:83:12: warning: no previous prototype for
 'cifs_root_data'
Message-ID: <202505210240.xsXlPtv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   563a3050191027317f4c6206c4c69da9e9fc699e
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/1] smb: move client and server files to common directory fs/smb
config: x86_64-buildonly-randconfig-2001-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210240.xsXlPtv5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210240.xsXlPtv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210240.xsXlPtv5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifsroot.c:83:12: warning: no previous prototype for 'cifs_root_data' [-Wmissing-prototypes]
      83 | int __init cifs_root_data(char **dev, char **opts)
         |            ^~~~~~~~~~~~~~


vim +/cifs_root_data +83 fs/smb/client/cifsroot.c

8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16  82) 
8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16 @83) int __init cifs_root_data(char **dev, char **opts)

:::::: The code at line 83 was first introduced by commit
:::::: 8eecd1c2e5bc73d33f3a544751305679dbf88eb4 cifs: Add support for root file systems

:::::: TO: Paulo Alcantara (SUSE) <paulo@paulo.ac>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
