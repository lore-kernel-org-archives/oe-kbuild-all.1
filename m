Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F018EBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730001434; cv=none; b=uK9wY9Nq063Jn2Wgo7RwoKl2YwNmw7uaz46uTe3lOMKgmpWjmZnGWJm05+7uozZamobGvc/2EeG2+MEkGpEmvhTUvq0Gfwi7euVlaj6SfP+937M9bWBX8itxzpV/g3MgcRoljA1yZz7goI/kK+evnpESEr7UBi28KZQxV+P7b/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730001434; c=relaxed/simple;
	bh=q52nGVNGdkfB+uEPE0Wwd77EFWGnDxzyDamLUO0DQVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqAsCRllWhE+zUADKjNTZ27ZAHcsSigD3kX6psAavWXO7AjlNLn7lKO3BsAZr5q5PqHpeqmekJvNgc2McH6FfI/odjMgXXQhJoUSqphUQud0vxKnSMB1OPjhDyPSSo1Dm7idNTBbvibADIiFfNwR2THx11cTWNYeIrARFCEMMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWD10jNV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWD10jNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730001432; x=1761537432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q52nGVNGdkfB+uEPE0Wwd77EFWGnDxzyDamLUO0DQVw=;
  b=bWD10jNV0MgxTPzolAc1Z4LLeWnSTCQS61iMl/qQW4V10xkZloGnxN6f
   Bmp/am3m5g6xR1VjNJvT4jiIcoAs4nRNsMpL6UUGDtflIFHkpwjUArA00
   nNdmMykBGRR0+3xjPDAXnwPDVm6KhaIHxJQ81I+LbKssQLC6VtSjGDFM3
   hCbhVAuH5ZY5fyd4TfNG50PwYpYvEEFX6+F8ISyCiPpJx6UXiFBVYwbh8
   76CtQYQEHcrjrCJ8ejMi4Ghr+g4ORtHyYt4RK635Vu7QEgz1BOzkv2x8m
   A3eydqBhWv8c9xKQIV/sZJX/sUBe+dHzJjb/pvQQcsNrobMw9+vr7nChY
   Q==;
X-CSE-ConnectionGUID: j+uKbjtLSIa6J0Z7+oDp2Q==
X-CSE-MsgGUID: tOhvCKJ8RyW07YnCHFdjmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29816153"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29816153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:57:09 -0700
X-CSE-ConnectionGUID: XgDdh/TmSX6htHwm5FftIg==
X-CSE-MsgGUID: DIcaJAjNSvei3v87YwBixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85244351"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 20:57:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uOn-000aLA-08;
	Sun, 27 Oct 2024 03:57:05 +0000
Date: Sun, 27 Oct 2024 11:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18534/30000]
 security/integrity/ima/ima_main.c:433:30: error: too few arguments to
 function 'ima_appraise_measurement'
Message-ID: <202410271136.UhOv1msf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [18534/30000] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-006-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271136.UhOv1msf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271136.UhOv1msf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271136.UhOv1msf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_main.c:30:
   security/integrity/ima/ima.h:381:51: warning: 'struct ima_digest' declared inside parameter list will not be visible outside of this definition or declaration
     381 |                                            struct ima_digest *found_digest)
         |                                                   ^~~~~~~~~~
   security/integrity/ima/ima_main.c: In function 'process_measurement':
>> security/integrity/ima/ima_main.c:433:30: error: too few arguments to function 'ima_appraise_measurement'
     433 |                         rc = ima_appraise_measurement(func, iint, file,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima.h:373:19: note: declared here
     373 | static inline int ima_appraise_measurement(enum ima_hooks func,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ima_appraise_measurement +433 security/integrity/ima/ima_main.c

31604143977fc2b Roberto Sassu         2021-03-03  427  
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  428  	if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
8b4670bcc857ed9 Zhang Tianxing        2021-12-29  429  		rc = ima_check_blacklist(iint, modsig, pcr);
273df864cf7466f Nayna Jain            2019-10-30  430  		if (rc != -EPERM) {
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  431  			inode_lock(inode);
e94df9b790f7ed9 Zhou Shuiqing         2023-09-06  432  
273df864cf7466f Nayna Jain            2019-10-30 @433  			rc = ima_appraise_measurement(func, iint, file,
273df864cf7466f Nayna Jain            2019-10-30  434  					      pathname, xattr_value,
e94df9b790f7ed9 Zhou Shuiqing         2023-09-06  435  #ifdef CONFIG_IMA_DIGEST_LIST
a44c2ae6cac55bd Roberto Sassu         2021-03-03  436  					      xattr_len, modsig,
a44c2ae6cac55bd Roberto Sassu         2021-03-03  437  					      ima_digest_allow(found_digest,
a44c2ae6cac55bd Roberto Sassu         2021-03-03  438  							       IMA_APPRAISE));
e94df9b790f7ed9 Zhou Shuiqing         2023-09-06  439  #else
e94df9b790f7ed9 Zhou Shuiqing         2023-09-06  440  					      xattr_len, modsig);
e94df9b790f7ed9 Zhou Shuiqing         2023-09-06  441  #endif
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  442  			inode_unlock(inode);
273df864cf7466f Nayna Jain            2019-10-30  443  		}
2cd4737bc850225 Mimi Zohar            2019-04-30  444  		if (!rc)
2cd4737bc850225 Mimi Zohar            2019-04-30  445  			rc = mmap_violation_check(func, file, &pathbuf,
2cd4737bc850225 Mimi Zohar            2019-04-30  446  						  &pathname, filename);
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  447  	}
e7c568e0fd0cf6d Peter Moody           2012-06-14  448  	if (action & IMA_AUDIT)
ea1046d4c57ee6e Dmitry Kasatkin       2012-09-04  449  		ima_audit_measurement(iint, pathname);
f7a859ff7395c0f Roberto Sassu         2014-09-12  450  
f3cc6b25dcc5616 Mimi Zohar            2017-06-17  451  	if ((file->f_flags & O_DIRECT) && (iint->flags & IMA_PERMIT_DIRECTIO))
f3cc6b25dcc5616 Mimi Zohar            2017-06-17  452  		rc = 0;
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  453  out_locked:
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  454  	if ((mask & MAY_WRITE) && test_bit(IMA_DIGSIG, &iint->atomic_flags) &&
05d1a717ec0430c Mimi Zohar            2016-02-29  455  	     !(iint->flags & IMA_NEW_FILE))
a175b8bb29ebbad Dmitry Kasatkin       2012-09-27  456  		rc = -EACCES;
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  457  	mutex_unlock(&iint->mutex);
f7a859ff7395c0f Roberto Sassu         2014-09-12  458  	kfree(xattr_value);
39b07096364a42c Thiago Jung Bauermann 2019-06-27  459  	ima_free_modsig(modsig);
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  460  out:
456f5fd3f6017f1 Dmitry Kasatkin       2014-10-01  461  	if (pathbuf)
456f5fd3f6017f1 Dmitry Kasatkin       2014-10-01  462  		__putname(pathbuf);
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  463  	if (must_appraise) {
581fd05ad98600a Zhang Tianxing        2021-12-29  464  		if (rc && (ima_appraise & IMA_APPRAISE_ENFORCE))
750943a30714b7e Dmitry Kasatkin       2012-09-27  465  			return -EACCES;
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  466  		if (file->f_mode & FMODE_WRITE)
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  467  			set_bit(IMA_UPDATE_XATTR, &iint->atomic_flags);
0d73a55208e94fc Dmitry Kasatkin       2017-12-05  468  	}
750943a30714b7e Dmitry Kasatkin       2012-09-27  469  	return 0;
3323eec921efd81 Mimi Zohar            2009-02-04  470  }
3323eec921efd81 Mimi Zohar            2009-02-04  471  

:::::: The code at line 433 was first introduced by commit
:::::: 273df864cf7466fb170b8dcc1abd672cd08ad8d3 ima: Check against blacklisted hashes for files with modsig

:::::: TO: Nayna Jain <nayna@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
