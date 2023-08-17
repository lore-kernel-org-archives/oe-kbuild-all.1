Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B980D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692261666; x=1723797666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOjfctoipjTWJOT7tBl+vaTK40MFGCKSgc9hIlTEVXo=;
  b=IcPa1llq/41565rgvY2cAkVBQRGClkWMR4ClTHKaBPOnJI2G9TDBYy/S
   +K/xOO+DF01Z91khzX/l2bEhsXhZMtxO/UoyqGPl2CAjZABGdsfdRpL9i
   t19QNARr8VTPQCZiD3b2qpHpBlmQCfbkkhAE2pELiy7V0jML5VSDcmB59
   b01ZSoFqdlyZIOCKU7KBCTOwqmGhoPlgwgLxuKHH9+s6F1meFhEPo7Ao5
   yB2204ehAmjCngsowIuraQS9xEjJzD/KigXUo5SS2cGEeoWX8P+Zmf4Wh
   4btL1+SwgSLGNsvrSwVv4YTmy4VQ0PC29tBc6/R4FnrMaOfq11dsFPodY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352341272"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="352341272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824546427"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="824546427"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 01:41:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWYYv-0000xZ-2w;
	Thu, 17 Aug 2023 08:41:01 +0000
Date: Thu, 17 Aug 2023 16:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Mimi Zohar <zohar@linux.ibm.com>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 7217/8698]
 security/integrity/evm/evm_main.c:788: warning: Excess function parameter
 'idmap' description in 'evm_inode_setattr'
Message-ID: <202308171609.UbzF2zEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: b050ade6e05b5a54606230f8d5630774359d371f [7217/8698] evm: Complete description of evm_inode_setattr()
config: i386-randconfig-i012-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171609.UbzF2zEG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171609.UbzF2zEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171609.UbzF2zEG-lkp@intel.com/

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
