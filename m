Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F8EAF4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezFMDDP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705255019; x=1736791019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ID3kepXHnofoPF6B5crNYdhuA09anNeH3/7AMOAOC+o=;
  b=ezFMDDP5JNliLKrWhUhQnsGrd203E11YRJX6ovYNEy/cuL9hcWus88p8
   Ps/oLxVsTYr8ZSW4IJR8VypoeaP01bVUSXEtdXcDuKwnn3LWiIZjF4nQ9
   asIkPstHWglQccvAsYhb8Cm6rj6s2hsuJE8rinxYFsgCZYermrQ2EgW1U
   ATjZZ7GXTUPA/itQvfmNgdHOSitr76kwy2Mode2Bw/ANbO+WiHO+7xPef
   xg7xW1afbnVJQeyKn7Kd2w9UmpRDQQg3TMRMn9TYiIRxJJBBP2stWXu5r
   Ko+Ptsf0O8CsM6uK4x6MuRxNFXoq+w2Nfuo0nmJrXBCIj51s/EZohFiBf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403245933"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="403245933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 09:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="25251351"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2024 09:56:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP4j9-000Bj3-1I;
	Sun, 14 Jan 2024 17:56:55 +0000
Date: Mon, 15 Jan 2024 01:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25979/30000]
 security/integrity/ima/ima_main.c:440:29: error: too few arguments to
 function call, expected 8, have 7
Message-ID: <202401150100.fTXUPpqq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [25979/30000] ima: Add macros to isolate the IMA digest list
config: x86_64-randconfig-012-20240114 (https://download.01.org/0day-ci/archive/20240115/202401150100.fTXUPpqq-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150100.fTXUPpqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150100.fTXUPpqq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_main.c:30:
   security/integrity/ima/ima.h:381:16: warning: declaration of 'struct ima_digest' will not be visible outside of this function [-Wvisibility]
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^
>> security/integrity/ima/ima_main.c:440:29: error: too few arguments to function call, expected 8, have 7
     433 |                         rc = ima_appraise_measurement(func, iint, file,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~
     434 |                                               pathname, xattr_value,
     435 | #ifdef CONFIG_IMA_DIGEST_LIST
     436 |                                               xattr_len, modsig,
     437 |                                               ima_digest_allow(found_digest,
     438 |                                                                IMA_APPRAISE));
     439 | #else
     440 |                                               xattr_len, modsig);
         |                                                                ^
   security/integrity/ima/ima.h:373:19: note: 'ima_appraise_measurement' declared here
     373 | static inline int ima_appraise_measurement(enum ima_hooks func,
         |                   ^                        ~~~~~~~~~~~~~~~~~~~~
     374 |                                            struct integrity_iint_cache *iint,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     375 |                                            struct file *file,
         |                                            ~~~~~~~~~~~~~~~~~~
     376 |                                            const unsigned char *filename,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     377 |                                            struct evm_ima_xattr_data *xattr_value,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     378 |                                            int xattr_len,
         |                                            ~~~~~~~~~~~~~~
     379 | #ifndef CONFIG_IMA_DIGEST_LIST
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     380 |                                            const struct modsig *modsig,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     381 |                                            struct ima_digest *found_digest)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +440 security/integrity/ima/ima_main.c

   427	
   428		if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
   429			rc = ima_check_blacklist(iint, modsig, pcr);
   430			if (rc != -EPERM) {
   431				inode_lock(inode);
   432	
   433				rc = ima_appraise_measurement(func, iint, file,
   434						      pathname, xattr_value,
   435	#ifdef CONFIG_IMA_DIGEST_LIST
   436						      xattr_len, modsig,
   437						      ima_digest_allow(found_digest,
   438								       IMA_APPRAISE));
   439	#else
 > 440						      xattr_len, modsig);
   441	#endif
   442				inode_unlock(inode);
   443			}
   444			if (!rc)
   445				rc = mmap_violation_check(func, file, &pathbuf,
   446							  &pathname, filename);
   447		}
   448		if (action & IMA_AUDIT)
   449			ima_audit_measurement(iint, pathname);
   450	
   451		if ((file->f_flags & O_DIRECT) && (iint->flags & IMA_PERMIT_DIRECTIO))
   452			rc = 0;
   453	out_locked:
   454		if ((mask & MAY_WRITE) && test_bit(IMA_DIGSIG, &iint->atomic_flags) &&
   455		     !(iint->flags & IMA_NEW_FILE))
   456			rc = -EACCES;
   457		mutex_unlock(&iint->mutex);
   458		kfree(xattr_value);
   459		ima_free_modsig(modsig);
   460	out:
   461		if (pathbuf)
   462			__putname(pathbuf);
   463		if (must_appraise) {
   464			if (rc && (ima_appraise & IMA_APPRAISE_ENFORCE))
   465				return -EACCES;
   466			if (file->f_mode & FMODE_WRITE)
   467				set_bit(IMA_UPDATE_XATTR, &iint->atomic_flags);
   468		}
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
