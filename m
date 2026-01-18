Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7678331A6F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768748702; cv=none; b=TzwcIAAycdA2wn6ubNuVWlne7owIKvSTijJgmPiHamzvCznkUlWt96PZ9zlkIoRNTBYFKsAIBoNFy4Jpd+dUKuh8XSBTwQ3sKiJC4mWiQFGZFSbCiwmsTm+twY6OwxRodOrWM1l84Bq9bbmM1K06wxQ0VxtjJ8sgvkr/9hVaVAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768748702; c=relaxed/simple;
	bh=1qV0yBlRUVkH0mKqNrrg4bEFyj4s6pQa3MRiu3cbcpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EUYS+diaDMOhQ3WiySCyJc4bAa+GbcdH95gpksJ8AuE7rMBztMxbJhiQGIVs24KaCT4iJKvFE1fFco14VwaIwGNHq+pfwghFIziyoWmnmDOI9cDowv+wutsQ5wek8sAAdmGAqGGXh5sg8ECX8kwtdvJXEiUIiLvq5btx76vewoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdUCO9F8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdUCO9F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768748701; x=1800284701;
  h=date:from:to:cc:subject:message-id;
  bh=1qV0yBlRUVkH0mKqNrrg4bEFyj4s6pQa3MRiu3cbcpc=;
  b=jdUCO9F8sWT3cQ+zTm2tqOxUlzcS8ZxjwLjFJE3p5heCEfHABceOL61p
   HrNlwrpLfJLCNOs/v+GYMOcK6dOP3Yps3JyifEoTS2u1bqTF6A61bk4Bt
   NGiCdX++1SLhgd9MTxLpZI7wwV9SFW4oU8C1Qx4NkrNoaPps7Ei9KGXE2
   26BpvZYfNNzO0mWxvwFCpLqk97zIrmOhiy6xndR1p3rXOTUFScE0rRXK8
   bD5npZeN8KdTCPYb4HxpfndDCjRIu9IOk5OpBYYhxU3tpx6MSau5XUoJA
   kCB9HNr0LrhLRxXdiu1ikPTt+BBxnk7PYXik39AuG2fFDKP2pXNalYj9F
   A==;
X-CSE-ConnectionGUID: VASPS8zWSvSRHdpLQOhYKw==
X-CSE-MsgGUID: eGLvjIypQ7mNw0PHO/d5EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80701922"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80701922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 07:04:59 -0800
X-CSE-ConnectionGUID: fKRgpqtXSjOvWExADb+Dow==
X-CSE-MsgGUID: OIPAFjaoS+2dI3AJlz5plA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="243216544"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 07:04:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhUKk-00000000N1m-2tGW;
	Sun, 18 Jan 2026 15:04:54 +0000
Date: Sun, 18 Jan 2026 23:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>
Subject: fs/overlayfs/dir.c:588:13: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202601182248.liv5wrSK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: f37b334728814b14745e15d46f9eab73750b67ec ovl: add ovl_override_creator_creds cred guard
date:   9 weeks ago
config: i386-randconfig-061-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182248.liv5wrSK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182248.liv5wrSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182248.liv5wrSK-lkp@intel.com/

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
