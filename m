Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D96E2DE704
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645208; cv=none; b=IUAWb9DNxvlZuwvd76LW9+gRE32AUYOOo+oCgGNqqtcof9wi3yfU3RDCKjoV2f7JOS9gUioq97RuxDFSCEQxK/A8VFLumoMGG9Sd7y7B5nOAos847/YnS5vNb0YmipJtD9ZQCGrI2UotrN2Y3uZa9fjn0UNjg1gKldr/s+oPprE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645208; c=relaxed/simple;
	bh=HhG6laIO2KPNq+xjvOitKuIK0eJaWfB9ZcHDD5Icm5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WhAx97VDxySIj5FiMz8T7s9rkSSRRwqv5H8OnlMzO1zGaMTeLltneGTSc+jh0Kr/iJsg/pdlRfo9MqOcPP1o9peOK6K965HBre0aMEedFDnGiStbKBM7iAONph0G9UIB+7DNZ9ApqB8EFD1p0JabVL1BRvBJn6weJw2DV43l8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/b2QxUR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/b2QxUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765645206; x=1797181206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhG6laIO2KPNq+xjvOitKuIK0eJaWfB9ZcHDD5Icm5Q=;
  b=l/b2QxURJr9BPw2X8VBm9wq00ayTBPFD0NxrN0PflXy3q6e+E4FjLCGO
   hwnoiVcKNNCHTrXaV5hmTW7x0uKPZ0c9xu0GWO+cUeINZiykd5h5GxPT9
   BgVBjAo64bfdvVSaH6OP62U6tW8s2NvzBRwAEvLiKsra6H8ewAD19mFny
   FIHVJ9yI0E0dl0cJOY40M79imsYUsR9p8P+2ZDiTAxTq10dysPGMhiK+M
   k1TYLg/KOWCMd+e+RS2EVkrncWYUfCb9phLipf9uusaUgr56iHHPjmO96
   Qr2l/taIOWgdnk7obC0Wx2/uAyFQlP70gdoXtMhou3cRcgw3BvjmzcfS8
   Q==;
X-CSE-ConnectionGUID: Bjr2hwxXRAWmsyL83U5SBw==
X-CSE-MsgGUID: mSDRJVg1T6edTVFvv7vujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66789661"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66789661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:00:05 -0800
X-CSE-ConnectionGUID: VQOKQc6uSrmsRZXIGvxeqA==
X-CSE-MsgGUID: IeDbWnbLQlS5dw0MQ8icqQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 09:00:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSyQ-000000007xB-2Hx3;
	Sat, 13 Dec 2025 17:00:02 +0000
Date: Sun, 14 Dec 2025 00:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 security/integrity/evm/evm_main.c:788: warning: Excess function parameter
 'idmap' description in 'evm_inode_setattr'
Message-ID: <202512140046.iwnXiU82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roberto,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6f1c2f8fd8c80fa50c9be0270d8474d6fa7412f2
commit: b050ade6e05b5a54606230f8d5630774359d371f [2/2] evm: Complete description of evm_inode_setattr()
config: x86_64-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140046.iwnXiU82-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140046.iwnXiU82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140046.iwnXiU82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/integrity/evm/evm_main.c:335: warning: Excess function parameter 'inode' description in 'evm_read_protected_xattrs'
   security/integrity/evm/evm_main.c:407: warning: Function parameter or member 'iint' not described in 'evm_verifyxattr'
   security/integrity/evm/evm_main.c:788: warning: Function parameter or member 'mnt_userns' not described in 'evm_inode_setattr'
>> security/integrity/evm/evm_main.c:788: warning: Excess function parameter 'idmap' description in 'evm_inode_setattr'


vim +788 security/integrity/evm/evm_main.c

1886ab01a3fb98e Roberto Sassu     2021-05-14  776  
817b54aa45db034 Mimi Zohar        2011-05-13  777  /**
817b54aa45db034 Mimi Zohar        2011-05-13  778   * evm_inode_setattr - prevent updating an invalid EVM extended attribute
b050ade6e05b5a5 Roberto Sassu     2023-03-06  779   * @idmap: idmap of the mount
817b54aa45db034 Mimi Zohar        2011-05-13  780   * @dentry: pointer to the affected dentry
b050ade6e05b5a5 Roberto Sassu     2023-03-06  781   * @attr: iattr structure containing the new file attributes
50b977481fce90a Matthew Garrett   2017-11-07  782   *
50b977481fce90a Matthew Garrett   2017-11-07  783   * Permit update of file attributes when files have a valid EVM signature,
50b977481fce90a Matthew Garrett   2017-11-07  784   * except in the case of them having an immutable portable signature.
817b54aa45db034 Mimi Zohar        2011-05-13  785   */
0e363cf3fa598c6 Christian Brauner 2022-06-21  786  int evm_inode_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
0e363cf3fa598c6 Christian Brauner 2022-06-21  787  		      struct iattr *attr)
817b54aa45db034 Mimi Zohar        2011-05-13 @788  {
817b54aa45db034 Mimi Zohar        2011-05-13  789  	unsigned int ia_valid = attr->ia_valid;
817b54aa45db034 Mimi Zohar        2011-05-13  790  	enum integrity_status evm_status;
817b54aa45db034 Mimi Zohar        2011-05-13  791  
ae1ba1676b88e6c Matthew Garrett   2017-11-07  792  	/* Policy permits modification of the protected attrs even though
ae1ba1676b88e6c Matthew Garrett   2017-11-07  793  	 * there's no HMAC key loaded
ae1ba1676b88e6c Matthew Garrett   2017-11-07  794  	 */
ae1ba1676b88e6c Matthew Garrett   2017-11-07  795  	if (evm_initialized & EVM_ALLOW_METADATA_WRITES)
ae1ba1676b88e6c Matthew Garrett   2017-11-07  796  		return 0;
ae1ba1676b88e6c Matthew Garrett   2017-11-07  797  
a924ce0b35875ef Mimi Zohar        2011-08-11  798  	if (!(ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID)))
817b54aa45db034 Mimi Zohar        2011-05-13  799  		return 0;
817b54aa45db034 Mimi Zohar        2011-05-13  800  	evm_status = evm_verify_current_integrity(dentry);
cdef685be5b4ae5 Roberto Sassu     2021-05-14  801  	/*
cdef685be5b4ae5 Roberto Sassu     2021-05-14  802  	 * Writing attrs is safe for portable signatures, as portable signatures
cdef685be5b4ae5 Roberto Sassu     2021-05-14  803  	 * are immutable and can never be updated.
cdef685be5b4ae5 Roberto Sassu     2021-05-14  804  	 */
566be59ab86c0e0 Mimi Zohar        2011-08-22  805  	if ((evm_status == INTEGRITY_PASS) ||
4a804b8a4572dfc Roberto Sassu     2021-05-20  806  	    (evm_status == INTEGRITY_NOXATTRS) ||
cdef685be5b4ae5 Roberto Sassu     2021-05-14  807  	    (evm_status == INTEGRITY_FAIL_IMMUTABLE) ||
4a804b8a4572dfc Roberto Sassu     2021-05-20  808  	    (evm_hmac_disabled() && (evm_status == INTEGRITY_NOLABEL ||
4a804b8a4572dfc Roberto Sassu     2021-05-20  809  	     evm_status == INTEGRITY_UNKNOWN)))
566be59ab86c0e0 Mimi Zohar        2011-08-22  810  		return 0;
1886ab01a3fb98e Roberto Sassu     2021-05-14  811  
1886ab01a3fb98e Roberto Sassu     2021-05-14  812  	if (evm_status == INTEGRITY_PASS_IMMUTABLE &&
0e363cf3fa598c6 Christian Brauner 2022-06-21  813  	    !evm_attr_change(mnt_userns, dentry, attr))
1886ab01a3fb98e Roberto Sassu     2021-05-14  814  		return 0;
1886ab01a3fb98e Roberto Sassu     2021-05-14  815  
c6f493d631c4d40 David Howells     2015-03-17  816  	integrity_audit_msg(AUDIT_INTEGRITY_METADATA, d_backing_inode(dentry),
9b97b6cdd420cd6 Mimi Zohar        2013-02-21  817  			    dentry->d_name.name, "appraise_metadata",
9b97b6cdd420cd6 Mimi Zohar        2013-02-21  818  			    integrity_status_msg[evm_status], -EPERM, 0);
566be59ab86c0e0 Mimi Zohar        2011-08-22  819  	return -EPERM;
817b54aa45db034 Mimi Zohar        2011-05-13  820  }
817b54aa45db034 Mimi Zohar        2011-05-13  821  

:::::: The code at line 788 was first introduced by commit
:::::: 817b54aa45db03437c6d09a7693fc6926eb8e822 evm: add evm_inode_setattr to prevent updating an invalid security.evm

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
