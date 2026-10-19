Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305A2BEC34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370465; cv=none; b=nwQLfRY8iHNQkE4qFWe4BuO/8xfTo/A/3FYvoT2uLZG0HutqlJC7HWwanHIYPtxtGgyQRnL7SrxIDIfh+TZBk4U3jXRs+r30CdQ1JCEYYDeX+EmbexZOsBNa4VIWurGOgC33cuso4r4w3fWnpnf70BNY8p4htek1KVzNHs5s7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370465; c=relaxed/simple;
	bh=5zhJ5NMXLjrIa+G6bXb8sUT9hYFNQuLDKUlR9OpQduU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwgZtbuk5nolid0glqZINCxbv9X847vKwdQqKMZGeL2cHS8n6SlUxbL9PPI3WtVCR3VCWOM52s0XgWuGwuFj6Q4REfHdLtQcST3bzulqEEaYnY6ApPMRwb+2kTdDDfvS5fc9W6cDuhVKqGSoiph6+MT/1iasE0e3NJNKcuTkMpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGC2j5lm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGC2j5lm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792370463; x=1823906463;
  h=date:from:to:cc:subject:message-id;
  bh=5zhJ5NMXLjrIa+G6bXb8sUT9hYFNQuLDKUlR9OpQduU=;
  b=EGC2j5lmIWmnCaeYsa3mW8XiyA3pIE6SDZnYsV/nW+tijz/cWjUm9edE
   J6+hnVyCJpiwGPr3c3OONVo89RFIojpbvD1rj1iOIinCn8sUQ6mGepJO/
   V2dv6gpeLVanaWpkFSDiuRznsjsvVApc7gdmQCCxUOEtd67rHmd7vIjS9
   8BN7/qFU1CGVn+cJepxp1Aqes/y2AtCcTOx33u/oOcreH0OSMSZlcMWYD
   +4XMnoHZScwYooeFT4xA1nn/AGitojNlM+YKaZLJQEjc80bURXAPpLooq
   EMFmWfBw3DyOcWopSej0oVy0cUYgiO4IEe+F7gOHkSYIHPb8H6fqs2Bo3
   g==;
X-CSE-ConnectionGUID: GDosurWlT9msF0rThcsQqg==
X-CSE-MsgGUID: 5Al1eea6R3ykHXpg3AsfEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="945217"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="945217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 17:41:02 -0700
X-CSE-ConnectionGUID: wtMEOuvFTfaVKo0AD6lSKg==
X-CSE-MsgGUID: R6R4OYPSTNC4bfHI9sut4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2280236"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2026 17:41:01 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIbQw-000000005Ol-3fI8;
	Mon, 19 Oct 2026 00:40:58 +0000
Date: Mon, 19 Oct 2026 02:40:10 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/336]
 security/integrity/evm/evm_main.c:788: warning: Excess function parameter
 'idmap' description in 'evm_inode_setattr'
Message-ID: <202610190221.fgYCgYEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roberto,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: b050ade6e05b5a54606230f8d5630774359d371f [0/336] evm: Complete description of evm_inode_setattr()
config: i386-randconfig-2301-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190221.fgYCgYEa-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190221.fgYCgYEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190221.fgYCgYEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/integrity/evm/evm_main.c:335: warning: Excess function parameter 'inode' description in 'evm_read_protected_xattrs'
   security/integrity/evm/evm_main.c:407: warning: Function parameter or member 'iint' not described in 'evm_verifyxattr'
   security/integrity/evm/evm_main.c:788: warning: Function parameter or member 'mnt_userns' not described in 'evm_inode_setattr'
>> security/integrity/evm/evm_main.c:788: warning: Excess function parameter 'idmap' description in 'evm_inode_setattr'


vim +788 security/integrity/evm/evm_main.c

1886ab01a3fb98 Roberto Sassu     2021-05-14  776  
817b54aa45db03 Mimi Zohar        2011-05-13  777  /**
817b54aa45db03 Mimi Zohar        2011-05-13  778   * evm_inode_setattr - prevent updating an invalid EVM extended attribute
b050ade6e05b5a Roberto Sassu     2023-03-06  779   * @idmap: idmap of the mount
817b54aa45db03 Mimi Zohar        2011-05-13  780   * @dentry: pointer to the affected dentry
b050ade6e05b5a Roberto Sassu     2023-03-06  781   * @attr: iattr structure containing the new file attributes
50b977481fce90 Matthew Garrett   2017-11-07  782   *
50b977481fce90 Matthew Garrett   2017-11-07  783   * Permit update of file attributes when files have a valid EVM signature,
50b977481fce90 Matthew Garrett   2017-11-07  784   * except in the case of them having an immutable portable signature.
817b54aa45db03 Mimi Zohar        2011-05-13  785   */
0e363cf3fa598c Christian Brauner 2022-06-21  786  int evm_inode_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
0e363cf3fa598c Christian Brauner 2022-06-21  787  		      struct iattr *attr)
817b54aa45db03 Mimi Zohar        2011-05-13 @788  {
817b54aa45db03 Mimi Zohar        2011-05-13  789  	unsigned int ia_valid = attr->ia_valid;
817b54aa45db03 Mimi Zohar        2011-05-13  790  	enum integrity_status evm_status;
817b54aa45db03 Mimi Zohar        2011-05-13  791  
ae1ba1676b88e6 Matthew Garrett   2017-11-07  792  	/* Policy permits modification of the protected attrs even though
ae1ba1676b88e6 Matthew Garrett   2017-11-07  793  	 * there's no HMAC key loaded
ae1ba1676b88e6 Matthew Garrett   2017-11-07  794  	 */
ae1ba1676b88e6 Matthew Garrett   2017-11-07  795  	if (evm_initialized & EVM_ALLOW_METADATA_WRITES)
ae1ba1676b88e6 Matthew Garrett   2017-11-07  796  		return 0;
ae1ba1676b88e6 Matthew Garrett   2017-11-07  797  
a924ce0b35875e Mimi Zohar        2011-08-11  798  	if (!(ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID)))
817b54aa45db03 Mimi Zohar        2011-05-13  799  		return 0;
817b54aa45db03 Mimi Zohar        2011-05-13  800  	evm_status = evm_verify_current_integrity(dentry);
cdef685be5b4ae Roberto Sassu     2021-05-14  801  	/*
cdef685be5b4ae Roberto Sassu     2021-05-14  802  	 * Writing attrs is safe for portable signatures, as portable signatures
cdef685be5b4ae Roberto Sassu     2021-05-14  803  	 * are immutable and can never be updated.
cdef685be5b4ae Roberto Sassu     2021-05-14  804  	 */
566be59ab86c0e Mimi Zohar        2011-08-22  805  	if ((evm_status == INTEGRITY_PASS) ||
4a804b8a4572df Roberto Sassu     2021-05-20  806  	    (evm_status == INTEGRITY_NOXATTRS) ||
cdef685be5b4ae Roberto Sassu     2021-05-14  807  	    (evm_status == INTEGRITY_FAIL_IMMUTABLE) ||
4a804b8a4572df Roberto Sassu     2021-05-20  808  	    (evm_hmac_disabled() && (evm_status == INTEGRITY_NOLABEL ||
4a804b8a4572df Roberto Sassu     2021-05-20  809  	     evm_status == INTEGRITY_UNKNOWN)))
566be59ab86c0e Mimi Zohar        2011-08-22  810  		return 0;
1886ab01a3fb98 Roberto Sassu     2021-05-14  811  
1886ab01a3fb98 Roberto Sassu     2021-05-14  812  	if (evm_status == INTEGRITY_PASS_IMMUTABLE &&
0e363cf3fa598c Christian Brauner 2022-06-21  813  	    !evm_attr_change(mnt_userns, dentry, attr))
1886ab01a3fb98 Roberto Sassu     2021-05-14  814  		return 0;
1886ab01a3fb98 Roberto Sassu     2021-05-14  815  
c6f493d631c4d4 David Howells     2015-03-17  816  	integrity_audit_msg(AUDIT_INTEGRITY_METADATA, d_backing_inode(dentry),
9b97b6cdd420cd Mimi Zohar        2013-02-21  817  			    dentry->d_name.name, "appraise_metadata",
9b97b6cdd420cd Mimi Zohar        2013-02-21  818  			    integrity_status_msg[evm_status], -EPERM, 0);
566be59ab86c0e Mimi Zohar        2011-08-22  819  	return -EPERM;
817b54aa45db03 Mimi Zohar        2011-05-13  820  }
817b54aa45db03 Mimi Zohar        2011-05-13  821  

:::::: The code at line 788 was first introduced by commit
:::::: 817b54aa45db03437c6d09a7693fc6926eb8e822 evm: add evm_inode_setattr to prevent updating an invalid security.evm

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
