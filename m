Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3947B73478
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 04:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726202918; cv=none; b=c8Za7hvms+KtDP9tlEwrU6KhzQD4mob0iUvR0/9CeMyUa/+uizfBmcv08+9Tpih0TzE/M76fAsr8Li/mzAFkWTNmeHJXR3q4h9N4n+pOV5dpPrw4J3LfVlkfIe7AXjlKFHncKFc7UkJuHyoQSefKuZAtkOFYIagNQFLnVDiLOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726202918; c=relaxed/simple;
	bh=EISpKepX2HAw7xzs0pM0iS1jcMFXqMZM+R5eTFJuL1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H62jR0N0cwjvgeCtLPjh9BhPadik97VU7YEhRvS4bGQHFefPfzus84x5jINEeOGVii2eMTA+2SElpJ+SXvSC8OTMEPxIdAVfaPzF04bFqb+aqmj4JGcuWpHlaeaRZT3b1v4TeXxxH1HCgNUoaFAc+YyzX9E+rUvZYaysDZ9O/Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPLlK6Rx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPLlK6Rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726202916; x=1757738916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EISpKepX2HAw7xzs0pM0iS1jcMFXqMZM+R5eTFJuL1k=;
  b=SPLlK6RxJr1NAtvnSNyRM5+hnZn94XkqwcPMh7DqX9RASp2tCnv5MTsi
   xLvvX5ccUrPodlGDSlo7ZjSbBOW7WemOw/rS/YF5p7+fqT7X+M/wHA6mZ
   BnhGf5Eux02vUmhHP58sNQT/p7BKWUtR3rj33pAwn6oQFFGm3U0SdV7uB
   d3+3Id7501arv+z5oDoND4Cj39csMfnI7HzGfoWOEMdvUVzlLBAIqpRcJ
   egl7ZFQ0SHrkXDEURQss7bp+TOSYAe3l9lz9G0jU7MWNy22WJWF1i/COl
   6JyjBx6FNc3vyVJPeDdz8SHlflJ5taUZG7erf0ls9MjUAvF5hT1U8ma41
   g==;
X-CSE-ConnectionGUID: J9hJ8yx9SkymKt4sdHkKYg==
X-CSE-MsgGUID: vvmsLAADSQKJtwO4Vz49GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25214655"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25214655"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:48:36 -0700
X-CSE-ConnectionGUID: BcT+NMoUR1+QO9cKbZQyRA==
X-CSE-MsgGUID: 3wleqyR0Qg2SIENp5zaGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="91191691"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2024 21:48:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soyES-00061g-0u;
	Fri, 13 Sep 2024 04:48:32 +0000
Date: Fri, 13 Sep 2024 12:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19146/30000]
 security/integrity/ima/ima_main.c:440:29: error: too few arguments to
 function call, expected 8, have 7
Message-ID: <202409131250.EMUg1KnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [19146/30000] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131250.EMUg1KnI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131250.EMUg1KnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131250.EMUg1KnI-lkp@intel.com/

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
