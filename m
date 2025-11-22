Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F51C5D59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820650; cv=none; b=aUM35wWLOPRtSayb9dDzIUeO482HiL+TKWmP1qu5A42WZwfw+i+YhkMcCP6+j4KTHDsli0evhzyRTZmRr+QjV7DyWzarxI6S4UiN1JsS6yuC2j00+IK62xHfBeEpUnXSguz9vmBWvmJrg79J14EQLfyrNzh+3iED+5r/6p5yt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820650; c=relaxed/simple;
	bh=aLZqxjCWA1QXGg33UV813YkGL386Tc56GaPG9Fzej2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSPURYSTYqKWT9/zs5MtnzCPWqfX1XWA/1GWh3PablOOuZIfy+vr3Y31jf7JxtJM4isstZt6QWbwhvjlMrSFIvGTU77WIKlLn+GaNr0ZhNhoTfnFv3JqMdsGFXaPrmKzhRO2TLHmDVrmLpfxIqOHFxoEjcZA/a1XKit12JZOFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLT0egG2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLT0egG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763820648; x=1795356648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLZqxjCWA1QXGg33UV813YkGL386Tc56GaPG9Fzej2A=;
  b=WLT0egG2wD6DYt46TmX6+ap3Aq0MLP5HxhvR5TlF3ZVRjEmsZxJJoQOi
   PXCml5mnBBlG41+bBhgTprlypMccUGu2xx1365u0sZw2LPYJinP4PoGYP
   n265cMc8txh0XoKdDAXzMk3BSCbOZQ2dcDUhNcZfIPtA21yFtR0APuas3
   r7IEHV7LWQuLa1nnM7zPPd6vBF3MOKZkIXnOcb/KKbfaz83eCKC1cpyNm
   QYreycVNC8JzLjpFa3EUDIeVNlPMj1debeelrTlcS//j0eHLiRoDKbpQq
   KNS4ScU2LvYJUm3Z5cRR5BbF4M/zGNKRbojxFhJLZ2sw3wg+ES9GpLSAC
   w==;
X-CSE-ConnectionGUID: b9RgtwqgRe++yiBqivytxw==
X-CSE-MsgGUID: eMNdJfnIR/eYOWq7GYvOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="66052256"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="66052256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:10:48 -0800
X-CSE-ConnectionGUID: YHh+J166RgGI1Q4/L9GfDA==
X-CSE-MsgGUID: Zi1Cfx2nS4WE51f/yD6meg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222877260"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 06:10:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMoK5-0007a1-0V;
	Sat, 22 Nov 2025 14:10:45 +0000
Date: Sat, 22 Nov 2025 22:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 54/63] fs/nfsd/xdr3.h:247:33: error: field
 'nattrs' has incomplete type
Message-ID: <202511222245.M4rqmEbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   9800773e205f87c3811bef2f1837a30e969c7687
commit: 10ec55d7aca3286d82f1228529656ab0b3c8a673 [54/63] NFSD: Use xdrgen XDR functions for NFSv3 SETATTR procedure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511222245.M4rqmEbb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222245.M4rqmEbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511222245.M4rqmEbb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfs2acl.c:13:
>> fs/nfsd/xdr3.h:247:33: error: field 'nattrs' has incomplete type
     247 |         struct nfsd_attrs       nattrs;
         |                                 ^~~~~~


vim +/nattrs +247 fs/nfsd/xdr3.h

   242	
   243	struct nfsd3_setattr3args {
   244		struct SETATTR3args	arg;
   245		struct svc_fh		fh;
   246		struct iattr		iattrs;
 > 247		struct nfsd_attrs	nattrs;
   248	};
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
