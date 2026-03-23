Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5623D565E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294915; cv=none; b=MV33C+Mj7LLKEXcSzEBKv1TZNjqBgb3fDu+Zb40AFvFm69+PEHKRvbYQktwv8jjubWImAvbnsmSV3ndduPtFAZ/Iv+KlGD1kSwuLuyoB8ETjtD1+S6+5ICHV/TfDEY6kD/FRjqPNYpYW2z9ykMYf5wykH6jCtv9d/QYP0YFfFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294915; c=relaxed/simple;
	bh=LM05wbjrpsoR5OrU8ncOTUNZmoRcRVZ1mpaBKXqjCvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbsGibZUQS55NGx/eoootzcMR9BVIIQdHkq7PjEaY3+i/IGfGhcL+EW5XMiiOc0HIYCzYpJbjyY3oCANP3w+WNUup+vpGrJ2gA18C9nUszPWlYYPoBep+Rt9EmczA2x6JOoE4kAOBR80g6lY2tlQQq8GNITJP012egItp3ZYjPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/ADP4Gq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/ADP4Gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774294913; x=1805830913;
  h=date:from:to:cc:subject:message-id;
  bh=LM05wbjrpsoR5OrU8ncOTUNZmoRcRVZ1mpaBKXqjCvM=;
  b=i/ADP4Gq5IEEMM8qAEv0N6RQMoTVz/iy1ECZKveFZ4kBpUFDCYpMzfh6
   Dbz2t6RgGTeBiAWXWiwd5UT0tzSl4fMAUXIqlgV54yiiAu+0DPS0Bm6fe
   KKqMtlJigeVVGWyHVezotI5aHuT3XW7UDMtmIYhrUOi0IszKZG4RX9n8y
   YFhhiV4h+2K4/yADX+ONg371l5jkxw9yxl7rulPh+8uecTYgwGdw/n2TN
   m3fAB2qcHnEmP0gpBI6Fa0IzeweTTANQoENn4Tl37nLymASq0/i2mwlOe
   R3zzgnaoVJq1EsL/mawZTT4ec5f+m6kquMpCc+vtkMjI1KYEwvTm8kXrp
   g==;
X-CSE-ConnectionGUID: ZHzh+firQgaTY7lDLbs+Ww==
X-CSE-MsgGUID: QIwJtY64Rxe4usNmehvHnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97922557"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97922557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:41:53 -0700
X-CSE-ConnectionGUID: 0B/7nwQmTYqEGTNiquqZxg==
X-CSE-MsgGUID: +rTQKegQRM+IswuB3tHXAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="221272995"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2026 12:41:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4l9p-0000000037t-0Ypm;
	Mon, 23 Mar 2026 19:41:49 +0000
Date: Tue, 24 Mar 2026 03:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:setattr-cleanups 4/7] fs/proc/generic.c:118:12:
 error: static declaration of 'proc_setattr' follows non-static declaration
Message-ID: <202603240300.aLMjVjGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git setattr-cleanups
head:   e22469ce880a705f47908e2f012a7f0fdeab826b
commit: 4707860e38c28d3494ac29625cbb499f85fa4c85 [4/7] proc: rename proc_notify_change to proc_setattr
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603240300.aLMjVjGv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240300.aLMjVjGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240300.aLMjVjGv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/generic.c:118:12: error: static declaration of 'proc_setattr' follows non-static declaration
     118 | static int proc_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
         |            ^~~~~~~~~~~~
   In file included from fs/proc/generic.c:31:
   fs/proc/internal.h:260:12: note: previous declaration of 'proc_setattr' with type 'int(struct mnt_idmap *, struct dentry *, struct iattr *)'
     260 | extern int proc_setattr(struct mnt_idmap *, struct dentry *,
         |            ^~~~~~~~~~~~


vim +/proc_setattr +118 fs/proc/generic.c

   117	
 > 118	static int proc_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
   119			struct iattr *iattr)
   120	{
   121		struct inode *inode = d_inode(dentry);
   122		struct proc_dir_entry *de = PDE(inode);
   123		int error;
   124	
   125		error = setattr_prepare(&nop_mnt_idmap, dentry, iattr);
   126		if (error)
   127			return error;
   128	
   129		setattr_copy(&nop_mnt_idmap, inode, iattr);
   130	
   131		proc_set_user(de, inode->i_uid, inode->i_gid);
   132		de->mode = inode->i_mode;
   133		return 0;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
