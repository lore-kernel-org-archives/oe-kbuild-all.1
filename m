Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3D1885AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316697; cv=none; b=NUKGivzL69d5L9Q0hTQYdgDDpqxasVdbli16oLy8tOFiMNY93DKQlwy98cnZ8QAZ/9dWpb93Rvpt8UZYIbIJNbvNDH3gweaV/KTWDOqvce4tsut5YvOa5SzDGuszyuc+67rpt3mn0VjKFFHC1/bFjZ5kaTLt/zSRpAr4AkkAhDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316697; c=relaxed/simple;
	bh=jKZeSOFo3hX4tNHue/e8gW9L4HxSV3fTzIZ+jTzNLaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqRrQ2VMtQyOgYLmNhOIYRMY23wHP6lGHzrgrczD6rfaOVGG4e80u8BAsnIdlUR5d0qd4rnxJYzPvegcLe+o3jsviXAB5QQ9kDl+VsNvsFVjTx8dbBHWlH1fWN89tZQ7Naj6fq/byS42DpMAEd77XrrZSxBKAIq0fXuRrG64mpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuHq4DmN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuHq4DmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735316696; x=1766852696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKZeSOFo3hX4tNHue/e8gW9L4HxSV3fTzIZ+jTzNLaw=;
  b=KuHq4DmNbINWTQ/gchFP+UwDDxJVbAUqllps5hCIxih5GBvKzAOWQcuI
   eQAp/aqPJk8fouJpAF3imoBkqIJPHyFlSniOgxo/DEq0ZNnBzobBbNt1Q
   h5MJOTV/YZlI2pF4+k3UkeMrXxzBpXLrYar7XnJP2TZk+CZJhjjIrTGWq
   hTQPQbD5gpc3X/uiN0Z35rNa8/6XDSncz6OOjxmUwZCCxtn4c3PTnj5BL
   qCw34eR5DRNgOpi+2rsi14+1ZeXOImryxMic0QXXwyshBq4TNx4I1619B
   bm4+lUcPx8cuft/x829BSxm06s2TBFbdLt744hH+I8h81RYJD3GHYiz2p
   w==;
X-CSE-ConnectionGUID: rOf6flXlTlOXGkBl90nFLA==
X-CSE-MsgGUID: PNpT0pZSR1+Z/KDr+1oPjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46716186"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46716186"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 08:24:55 -0800
X-CSE-ConnectionGUID: flM2wj8BRhaP76MJJChftA==
X-CSE-MsgGUID: iYFHf83jRVCjJ5nE1tPYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100661675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 08:24:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRD8t-0003KO-1j;
	Fri, 27 Dec 2024 16:24:51 +0000
Date: Sat, 28 Dec 2024 00:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 48/48] fs/smb/client/link.c:574:33: warning: variable
 'server' set but not used
Message-ID: <202412280014.YyJshwRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   817f8d87b6285eee3ee97e25a32f2405cd5819a0
commit: 817f8d87b6285eee3ee97e25a32f2405cd5819a0 [48/48] cifs: Add support for creating reparse points over SMB1
config: loongarch-randconfig-001-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280014.YyJshwRE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280014.YyJshwRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280014.YyJshwRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/link.c: In function 'cifs_symlink':
>> fs/smb/client/link.c:574:33: warning: variable 'server' set but not used [-Wunused-but-set-variable]
     574 |         struct TCP_Server_Info *server;
         |                                 ^~~~~~


vim +/server +574 fs/smb/client/link.c

^1da177e4c3f415 fs/cifs/link.c       Linus Torvalds    2005-04-16  566  
^1da177e4c3f415 fs/cifs/link.c       Linus Torvalds    2005-04-16  567  int
7a77db95511c39b fs/cifs/link.c       Christian Brauner 2023-01-13  568  cifs_symlink(struct mnt_idmap *idmap, struct inode *inode,
549c7297717c32e fs/cifs/link.c       Christian Brauner 2021-01-21  569  	     struct dentry *direntry, const char *symname)
^1da177e4c3f415 fs/cifs/link.c       Linus Torvalds    2005-04-16  570  {
^1da177e4c3f415 fs/cifs/link.c       Linus Torvalds    2005-04-16  571  	int rc = -EOPNOTSUPP;
6d5786a34d98bff fs/cifs/link.c       Pavel Shilovsky   2012-06-20  572  	unsigned int xid;
7ffec372458d163 fs/cifs/link.c       Jeff Layton       2010-09-29  573  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
514d793e27a310e fs/smb/client/link.c Paulo Alcantara   2023-11-25 @574  	struct TCP_Server_Info *server;

:::::: The code at line 574 was first introduced by commit
:::::: 514d793e27a310eb26b112c1f8f1a160472907e5 smb: client: allow creating symlinks via reparse points

:::::: TO: Paulo Alcantara <pc@manguebit.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
