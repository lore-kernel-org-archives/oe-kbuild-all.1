Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847E1624C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766030975; cv=none; b=qDTh1XzQTCjRJpBSHhDLIzE+kOUB0N2cyMch77NfDiEGAv9qVHFN5sr/pGzgFk94zPUhp1BsKmmDxkwsSQTYvWxxWghiiJTHXVy1XixjWLWXo7mqeuOoB6hyuYqgEMUEfhnGW9rhkECkO0AcXwo8KTSNLHiNhg+EdszdakVM3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766030975; c=relaxed/simple;
	bh=tJkCuwOfxYUjMxDDkqvIyEhjJkliVI57A/fzaq+jpaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nInz27HwdzvZqiJrj5f4QWl6epuvDePkYsIoFBPd/0y1a1BWGI41SaLIKuiUWy2+P4pwxaCAu3MmZy/nsmgRzf9EP/E03z8j09RptT84zaPytr8je7BtN1O32bhXVqYCZeI+Io5wnIwhrYonPw8qpPT0mkqp5wAUNWUAHs49VmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfcnLiAI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfcnLiAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766030973; x=1797566973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJkCuwOfxYUjMxDDkqvIyEhjJkliVI57A/fzaq+jpaw=;
  b=dfcnLiAIJArrBiyR68UvtmIR+kWzxDTxCMhzA0uypQN2v2dDDzIAZo5x
   iChaVH4TLWSVhZP/ZpXaI9HFOkFLwoYEXNHLcvfl75xBn/TBI8ecMskAd
   0ciqwT+f8lwMFAAfDqGVsaUgMh6SyFsCiDC17IOwkUFaA0c78khSMn1ry
   9NuOd6tTNw3zh5LL54IRyiBq1PScBMRX9I4swyEz5YZGyZNEa10100dZ4
   PWgjSa+OZZEn75siefbuWelm0ilOE/sCrXTTMvg72tcb4uCXpddEOHbHx
   ju1jVkF98RLk/8tfRWbn4HSjgBm4HgEwo09foyE3OgHMUizGXeqiHruQB
   w==;
X-CSE-ConnectionGUID: tQ7oMe5EQHiBUWUGbdZjFQ==
X-CSE-MsgGUID: IB4NlyLLSuKov3Cv1yrnDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67860530"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67860530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:09:32 -0800
X-CSE-ConnectionGUID: dWv3GRtpSpSye6GFNzdoaw==
X-CSE-MsgGUID: sHUxOq1JQsmr2fsGimCglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="199295407"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2025 20:09:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW5KS-000000001Yx-3Bk9;
	Thu, 18 Dec 2025 04:09:28 +0000
Date: Thu, 18 Dec 2025 12:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>
Subject: fs/overlayfs/dir.c:588:13: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512181104.Dj73SWGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: f37b334728814b14745e15d46f9eab73750b67ec ovl: add ovl_override_creator_creds cred guard
date:   4 weeks ago
config: x86_64-randconfig-121-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181104.Dj73SWGl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181104.Dj73SWGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181104.Dj73SWGl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/dir.c:588:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/overlayfs/dir.c:588:13: sparse:    struct cred const [noderef] __rcu *
   fs/overlayfs/dir.c:588:13: sparse:    struct cred const *

vim +588 fs/overlayfs/dir.c

   583	
   584	static const struct cred *ovl_override_creator_creds(struct dentry *dentry, struct inode *inode, umode_t mode)
   585	{
   586		int err;
   587	
 > 588		if (WARN_ON_ONCE(current->cred != ovl_creds(dentry->d_sb)))
   589			return ERR_PTR(-EINVAL);
   590	
   591		CLASS(prepare_creds, override_cred)();
   592		if (!override_cred)
   593			return ERR_PTR(-ENOMEM);
   594	
   595		override_cred->fsuid = inode->i_uid;
   596		override_cred->fsgid = inode->i_gid;
   597	
   598		err = security_dentry_create_files_as(dentry, mode, &dentry->d_name,
   599						      current->cred, override_cred);
   600		if (err)
   601			return ERR_PTR(err);
   602	
   603		return override_creds(no_free_ptr(override_cred));
   604	}
   605	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
