Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21886FBF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711000298; cv=none; b=EyM0kyjLQgO9kgy/8minvIycLbCWQgBi5Wn1FBcUtHQEcNPXFSH1yTLSgGW3DajryoRrIGmwhqx6mNb9eVqQdV2Qdg0TORd086fHj/z8Vw3TjmRQHKxXAqjaCSowp3r1CyT20wGdiCZvw0qWeW3qhRO2jNHXPwsafaJeT2PHe3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711000298; c=relaxed/simple;
	bh=cfYlV9qQucR6sOmrEVOs0QYS9iqm4MVlBeVErMaF+zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NerxcOdfCjDA/Yk2EQ0CCPhA+ggwRZxT4Q0NZD9+LXhCy5WmZ/9q6yCA5xsi0PqJUvaPxSY5CnhM220zK558afi+4dc1v57HQsZicDHqy0o9TL+L7Dw34seQyKZc9GhjtbIJUfmU3zkmiD93RM2Jaq2MRGplPFzhJ68UIhkerOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inejo3hr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inejo3hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711000296; x=1742536296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfYlV9qQucR6sOmrEVOs0QYS9iqm4MVlBeVErMaF+zk=;
  b=inejo3hriAFH6clQx3rHi59f8daTqcKDIKdn75QLLAb12UaOB9VHrckm
   38LFGRit6x0SmHiIShJ4Hr05KDR5s3MCzqSCQeZOQboAAeZdvBMPE0i1D
   lGMMRrp5/BZmBnAZhq7SbkuA/jMp9YWuQNu+M0bwReaNKjRNSSn0u9HcD
   PY0DWuWviv8q4rPlJ8L0FXnpizBjocMDQNBcc5xRz7psmsRhS4hWGePey
   r1dGCfWrzwIFHLaqkyWIz5UBIlijEXOf17PUjM3zQd48OTtSRT1CEujIa
   BHouS0X6RZDbbsiUpwVE0UyD7RjGprPMz/4JZuwaO+dKy3CCxgW25z8ep
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9750983"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="9750983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 22:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="19095055"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2024 22:51:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnBKu-000JBn-06;
	Thu, 21 Mar 2024 05:51:32 +0000
Date: Thu, 21 Mar 2024 13:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:6.5-full-backport 123/167]
 fs/smb/client/readdir.c:68:35: error: implicit declaration of function
 'inode_get_ctime'; did you mean 'lease_get_mtime'?
Message-ID: <202403211354.70TikV6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git 6.5-full-backport
head:   9aa9166e03ff319eedbf774305097ad3c499dd7d
commit: 76c6d0a2e301319e29a9725ed3db0f39030e353b [123/167] smb: client: stop revalidating reparse points unnecessarily
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240321/202403211354.70TikV6V-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211354.70TikV6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211354.70TikV6V-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/readdir.c: In function 'reparse_inode_match':
>> fs/smb/client/readdir.c:68:35: error: implicit declaration of function 'inode_get_ctime'; did you mean 'lease_get_mtime'? [-Werror=implicit-function-declaration]
      68 |         struct timespec64 ctime = inode_get_ctime(inode);
         |                                   ^~~~~~~~~~~~~~~
         |                                   lease_get_mtime
>> fs/smb/client/readdir.c:68:35: error: invalid initializer
   cc1: some warnings being treated as errors


vim +68 fs/smb/client/readdir.c

    57	
    58	/*
    59	 * Match a reparse point inode if reparse tag and ctime haven't changed.
    60	 *
    61	 * Windows Server updates ctime of reparse points when their data have changed.
    62	 * The server doesn't allow changing reparse tags from existing reparse points,
    63	 * though it's worth checking.
    64	 */
    65	static inline bool reparse_inode_match(struct inode *inode,
    66					       struct cifs_fattr *fattr)
    67	{
  > 68		struct timespec64 ctime = inode_get_ctime(inode);
    69	
    70		return (CIFS_I(inode)->cifsAttrs & ATTR_REPARSE) &&
    71			CIFS_I(inode)->reparse_tag == fattr->cf_cifstag &&
    72			timespec64_equal(&ctime, &fattr->cf_ctime);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
