Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D91EDA3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765414514; cv=none; b=eGFvVFh4x2hYJaIwBp318R4RnPW92HDCKBVEq9Qf8PXQI06/WlIkYy7Jrh3duHFl3UTLLT/x191v4OkiZCRwKhKru9itxqzjhx5+sEglUSTJvdQV+0NO3hRCJvM9pVmy6BUvScjAlswyI7SwGopKVr8t1H7bsFyarzINve1ovi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765414514; c=relaxed/simple;
	bh=DA0Ktvxh4z5TurcnQxVeMkU+hHujGZXPeMLeCeERQdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuktuUf/otumlF+B8/q0kGWGXrwtuiUbvpCyKHTs7aYklLSFAGGcXcqHN8iw0KDECeBiMQOlkv4rPsQjOHzD4vx8TIl/LJ6gREOnUG16uOq44n8+iD7hzhZcXYXZq+EZRr9Qey/vlWIlgmBZxSOySiFYgEpqPwOQcLSNmM2TIbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqkhuIg+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqkhuIg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765414513; x=1796950513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DA0Ktvxh4z5TurcnQxVeMkU+hHujGZXPeMLeCeERQdM=;
  b=DqkhuIg+b0hb/VQ59z7cEc8uC7/ixGg042fjjhrgN9+AB/sWmvmy4p4n
   Yjj9DzxzVOVbCOJtZVtqgajJW+H+8aSK808lncp27CTegm19qjizHU2WT
   GV/gOrC45IFTsMg5X0MjdvAniOnmGZDsI8g9UHOb9k+8vzGPMzqYdz4b5
   GXJMm5C0MEJ6aml92aQ8RxcsrwYl8pjjSIkoJjb4zLC4FGRSZLGrMB1Tx
   bsI7wwDyZ4ja0EuWll70fdoe2nGUHphdusaupE4gsmMqDp6Fmu3X2+02T
   L4vOle4wRewm8elp3EKuEcG334AmQqnbpXrtY0CKrfDb3hZuR/EYe4T0y
   w==;
X-CSE-ConnectionGUID: HatD0zNTSaWkZk48mRP/Ew==
X-CSE-MsgGUID: /VjWd2bSQNW54liQLmSlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90039981"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="90039981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 16:55:13 -0800
X-CSE-ConnectionGUID: DSTKVoNqQIK4IGehkfNcLg==
X-CSE-MsgGUID: LFYoOfNYTYq9M1sL3KYt0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227314158"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 16:55:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTUxY-000000003ud-3r0v;
	Thu, 11 Dec 2025 00:55:08 +0000
Date: Thu, 11 Dec 2025 08:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Christian Brauner <brauner@kernel.org>
Subject: fs/namespace.c:2867 may_change_propagation() warn: inconsistent
 indenting
Message-ID: <202512110853.cxVpnF0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: cffd0441872e7f6b1fce5e78fb1c99187a291330 use uniform permission checks for all mount propagation changes
date:   4 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110853.cxVpnF0V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110853.cxVpnF0V-lkp@intel.com/

New smatch warnings:
fs/namespace.c:2867 may_change_propagation() warn: inconsistent indenting

Old smatch warnings:
fs/namespace.c:3867 finish_automount() warn: inconsistent returns '&dentry->d_inode->i_rwsem'.

vim +2867 fs/namespace.c

  2861	
  2862	static int may_change_propagation(const struct mount *m)
  2863	{
  2864	        struct mnt_namespace *ns = m->mnt_ns;
  2865	
  2866		 // it must be mounted in some namespace
> 2867		 if (IS_ERR_OR_NULL(ns))         // is_mounted()
  2868			 return -EINVAL;
  2869		 // and the caller must be admin in userns of that namespace
  2870		 if (!ns_capable(ns->user_ns, CAP_SYS_ADMIN))
  2871			 return -EPERM;
  2872		 return 0;
  2873	}
  2874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
