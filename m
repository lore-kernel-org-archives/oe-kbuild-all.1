Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94507F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717814043; cv=none; b=So3fsU5drcUeDSBdrHMN+ha6YzgqzHXcnENlcl2GBzuQ3hK5W7IFiEykjZdFoX83Ie6b1RqKEQJI7zvY+dl0D2tMGn7mC4M4Sdo6H2SeZaOK+FCHqBjwCheOapWWueJjgTlfbtzaoXTjKC2hBExgX3ZgTc/0BVcg1ZXvWCeLsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717814043; c=relaxed/simple;
	bh=yjC1st67kFZX1IwX8jGisQJ7psZ2kmimZuVUSyVl/zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cACi+IDFEpCUW8Wbp7ddA1BBOXkPLWibgM7EuPBK4KAVnoLX4uxd1WP3tL13k3IUGlCsrSgTWj/HG3DVA0q8LyJXCT/abFAlxi3+JVu1Q6GYRcaQv53eiXXkIkbhghYviV7KIZzH8Rv7tJxfNyCs9Y3NZrwUSa2cAH5VWOzPYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1jaR51k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1jaR51k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717814042; x=1749350042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjC1st67kFZX1IwX8jGisQJ7psZ2kmimZuVUSyVl/zo=;
  b=f1jaR51kE4m5Ti0a/gzoHgmo68geIUsWc8fNH9FS+G7G5RKdpczTswxb
   qDMJihgqEcAKNPxHTgDb9aCEOscDLo9GS6EQfBxqG0N/DQSoJhHTl+FRA
   TFtEN9rvBXHfbdtwa9YJj9dtuTyNrcaaswBJD2zkGovky1nL97k1UNuz3
   H0yVJg6MJD3eP/baJsAcB1/VbRZ+2/6FFJ33Mi7P1/dvbYrt71dwZnSFp
   /fYUn+t26nuoi6GN2S65qkIrEwoHWFYhKFuFD6rV1bh0BtJ7TYMUlPOd1
   pEzqX/IkYl77haWSn8xI6bPIuLuOAXaDAGPSpOY3/mXI88pXXYOUWEXvk
   g==;
X-CSE-ConnectionGUID: K+Z/Ve7tT1icHQyxAjxS2w==
X-CSE-MsgGUID: Q5I6xNAJTQmNiRwY7d1H5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25967972"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25967972"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 19:34:02 -0700
X-CSE-ConnectionGUID: 0W5UauNKQbC3Wk6LPA+ahg==
X-CSE-MsgGUID: tikyV/vwRNa4Y6D3bG3HeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39177271"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 19:34:00 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFlu1-0000rU-39;
	Sat, 08 Jun 2024 02:33:57 +0000
Date: Sat, 8 Jun 2024 10:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 7/7] fs/namei.c:413:30: warning: too many
 arguments for format
Message-ID: <202406081211.T4F1ALqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   a082d0efc42d3018dd74fdc60c2bd07f87f3603a
commit: ff782da8592fd382cf9399c9436c71905220a7c1 [7/7] NFSD: Layout operations need to operation on files and nothing else
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081211.T4F1ALqS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081211.T4F1ALqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081211.T4F1ALqS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namei.c: In function 'generic_permission':
>> fs/namei.c:413:30: warning: too many arguments for format [-Wformat-extra-args]
     413 |                 trace_printk("dir mask=0x08x\n", mask);
         |                              ^~~~~~~~~~~~~~~~~~
>> fs/namei.c:415:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     415 |                 if (!(mask & MAY_WRITE))
         |                    ^
   fs/namei.c:433:22: warning: too many arguments for format [-Wformat-extra-args]
     433 |         trace_printk("file mask=0x08x\n", mask);
         |                      ^~~~~~~~~~~~~~~~~~~
   fs/namei.c:434:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     434 |         if (mask == MAY_READ)
         |            ^
   fs/namei.c:445:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     445 |         if (!(mask & MAY_EXEC) || (inode->i_mode & S_IXUGO))
         |            ^


vim +413 fs/namei.c

   376	
   377	/**
   378	 * generic_permission -  check for access rights on a Posix-like filesystem
   379	 * @idmap:	idmap of the mount the inode was found from
   380	 * @inode:	inode to check access rights for
   381	 * @mask:	right to check for (%MAY_READ, %MAY_WRITE, %MAY_EXEC,
   382	 *		%MAY_NOT_BLOCK ...)
   383	 *
   384	 * Used to check for read/write/execute permissions on a file.
   385	 * We use "fsuid" for this, letting us set arbitrary permissions
   386	 * for filesystem access without changing the "normal" uids which
   387	 * are used for other things.
   388	 *
   389	 * generic_permission is rcu-walk aware. It returns -ECHILD in case an rcu-walk
   390	 * request cannot be satisfied (eg. requires blocking or too much complexity).
   391	 * It would then be called again in ref-walk mode.
   392	 *
   393	 * If the inode has been found through an idmapped mount the idmap of
   394	 * the vfsmount must be passed through @idmap. This function will then take
   395	 * care to map the inode according to @idmap before checking permissions.
   396	 * On non-idmapped mounts or if permission checking is to be performed on the
   397	 * raw inode simply pass @nop_mnt_idmap.
   398	 */
   399	int generic_permission(struct mnt_idmap *idmap, struct inode *inode,
   400			       int mask)
   401	{
   402		int ret;
   403	
   404		/*
   405		 * Do the basic permission checks.
   406		 */
   407		ret = acl_permission_check(idmap, inode, mask);
   408		trace_printk("acl_permission_check returns %d\n", ret);
   409		if (ret != -EACCES)
   410			return ret;
   411	
   412		if (S_ISDIR(inode->i_mode)) {
 > 413			trace_printk("dir mask=0x08x\n", mask);
   414			/* DACs are overridable for directories */
 > 415			if (!(mask & MAY_WRITE))
   416				if (capable_wrt_inode_uidgid(idmap, inode,
   417							     CAP_DAC_READ_SEARCH))
   418					return 0;
   419				else
   420					trace_printk("capable_wrt_inode_uidgid (dir read search) returns non-zero\n");
   421			if (capable_wrt_inode_uidgid(idmap, inode,
   422						     CAP_DAC_OVERRIDE))
   423				return 0;
   424			else
   425				trace_printk("capable_wrt_inode_uidgid (dir override) returns non-zero\n");
   426			return -EACCES;
   427		}
   428	
   429		/*
   430		 * Searching includes executable on directories, else just read.
   431		 */
   432		mask &= MAY_READ | MAY_WRITE | MAY_EXEC;
   433		trace_printk("file mask=0x08x\n", mask);
   434		if (mask == MAY_READ)
   435			if (capable_wrt_inode_uidgid(idmap, inode,
   436						     CAP_DAC_READ_SEARCH))
   437				return 0;
   438			else
   439				trace_printk("capable_wrt_inode_uidgid (file read search) returns non-zero\n");
   440		/*
   441		 * Read/write DACs are always overridable.
   442		 * Executable DACs are overridable when there is
   443		 * at least one exec bit set.
   444		 */
   445		if (!(mask & MAY_EXEC) || (inode->i_mode & S_IXUGO))
   446			if (capable_wrt_inode_uidgid(idmap, inode,
   447						     CAP_DAC_OVERRIDE))
   448				return 0;
   449			else
   450				trace_printk("capable_wrt_inode_uidgid (file override) returns non-zero\n");
   451	
   452		return -EACCES;
   453	}
   454	EXPORT_SYMBOL(generic_permission);
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
