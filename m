Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4E2C3242
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968595; cv=none; b=K1x12pxXvBHr9+74YUvBdLEJOxIQic1fIoV8kj/E5DqtFf3rJBCOvHFdTgCjoEqwzebM7y/BDKd6JBHr72/L/RbCKJz0zI7xfGrgnIfTjcVNLbuMfO5ahqnkDGo2SPyULOSXEmGG9yeprrBRCbt5Yl8vq1RV+R+IWKDYzKYgyrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968595; c=relaxed/simple;
	bh=LK20MzT/q1+6yfXE9/NVRHz2e11uNkdmKtpxSsIeMuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyFFA8Z8ztQr28wFVEDNYgZpbVng3I6L3rrDlFmGn3wyovWynFwxrIe5+BGUAdnQ8xoNXC1p4rUABbSMo1ATg/3vYZUOzdjkFsOs6GgRoliriCVcv9hlqITatTFABbrwibB10oks8rfQDbYWKFpCvnJcVEVF8aOy5aXrJ2+4J9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCK2/exO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCK2/exO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748968594; x=1780504594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LK20MzT/q1+6yfXE9/NVRHz2e11uNkdmKtpxSsIeMuc=;
  b=SCK2/exO4zY1tqyDaTKGZiIsujlwhW1LFHV4sRAj2rRcNKj8O1yYaiR8
   6SFQRj/Ln3UXsASdTN5W7qqgFaXNf8QXuiJKW6bPmOKK68jhPobERNuk1
   IP4PdYvS437HNupi+jrQUiSrT/5pcLV7I8PAMBmUIE2owjyCgip6/A7mq
   IQ9KuBrS3fJwSN6y+16b5uIZ5r0bSvdEi/Cduz+6fS1SEqQ3DRRFaEVH2
   VnJhptOsHjdf+wsHkZfg3qKM/ZbSWh8IJRr2cHxtWKrsR3lYi9FE361Ek
   LFW3Py5ydFctg+YXaAB95LjXpqQ3y+khBjC88RMg+j/eU0NZxzxB+EWCx
   w==;
X-CSE-ConnectionGUID: VcBinos3T6SFWf8akQCaQw==
X-CSE-MsgGUID: s+4/wWGDT+69VAMs8k+Zew==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573003"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="68573003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 09:36:33 -0700
X-CSE-ConnectionGUID: UfLiI6obSuK0595d5Xr+hA==
X-CSE-MsgGUID: Xq04WDozTDqgf1Pagh6hrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149796978"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2025 09:36:32 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMUcn-0001Xi-2k;
	Tue, 03 Jun 2025 16:36:29 +0000
Date: Wed, 4 Jun 2025 00:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 security/integrity/ima/ima_main.c:433:30: error: too few arguments to
 function 'ima_appraise_measurement'
Message-ID: <202506040040.nqyD44bt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [2882/2882] ima: Add macros to isolate the IMA digest list
config: x86_64-buildonly-randconfig-2001-20250502 (https://download.01.org/0day-ci/archive/20250604/202506040040.nqyD44bt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040040.nqyD44bt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040040.nqyD44bt-lkp@intel.com/

Note: the openeuler/OLK-5.10 HEAD b5ec139da1a4916dfc9644ee3d9426dbd6f23c13 builds fine.
      It only hurts bisectability.

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

31604143977fc2 Roberto Sassu         2021-03-03  427  
0d73a55208e94f Dmitry Kasatkin       2017-12-05  428  	if (rc == 0 && (action & IMA_APPRAISE_SUBMASK)) {
8b4670bcc857ed Zhang Tianxing        2021-12-29  429  		rc = ima_check_blacklist(iint, modsig, pcr);
273df864cf7466 Nayna Jain            2019-10-30  430  		if (rc != -EPERM) {
0d73a55208e94f Dmitry Kasatkin       2017-12-05  431  			inode_lock(inode);
e94df9b790f7ed Zhou Shuiqing         2023-09-06  432  
273df864cf7466 Nayna Jain            2019-10-30 @433  			rc = ima_appraise_measurement(func, iint, file,
273df864cf7466 Nayna Jain            2019-10-30  434  					      pathname, xattr_value,
e94df9b790f7ed Zhou Shuiqing         2023-09-06  435  #ifdef CONFIG_IMA_DIGEST_LIST
a44c2ae6cac55b Roberto Sassu         2021-03-03  436  					      xattr_len, modsig,
a44c2ae6cac55b Roberto Sassu         2021-03-03  437  					      ima_digest_allow(found_digest,
a44c2ae6cac55b Roberto Sassu         2021-03-03  438  							       IMA_APPRAISE));
e94df9b790f7ed Zhou Shuiqing         2023-09-06  439  #else
e94df9b790f7ed Zhou Shuiqing         2023-09-06  440  					      xattr_len, modsig);
e94df9b790f7ed Zhou Shuiqing         2023-09-06  441  #endif
0d73a55208e94f Dmitry Kasatkin       2017-12-05  442  			inode_unlock(inode);
273df864cf7466 Nayna Jain            2019-10-30  443  		}
2cd4737bc85022 Mimi Zohar            2019-04-30  444  		if (!rc)
2cd4737bc85022 Mimi Zohar            2019-04-30  445  			rc = mmap_violation_check(func, file, &pathbuf,
2cd4737bc85022 Mimi Zohar            2019-04-30  446  						  &pathname, filename);
0d73a55208e94f Dmitry Kasatkin       2017-12-05  447  	}
e7c568e0fd0cf6 Peter Moody           2012-06-14  448  	if (action & IMA_AUDIT)
ea1046d4c57ee6 Dmitry Kasatkin       2012-09-04  449  		ima_audit_measurement(iint, pathname);
f7a859ff7395c0 Roberto Sassu         2014-09-12  450  
f3cc6b25dcc561 Mimi Zohar            2017-06-17  451  	if ((file->f_flags & O_DIRECT) && (iint->flags & IMA_PERMIT_DIRECTIO))
f3cc6b25dcc561 Mimi Zohar            2017-06-17  452  		rc = 0;
0d73a55208e94f Dmitry Kasatkin       2017-12-05  453  out_locked:
0d73a55208e94f Dmitry Kasatkin       2017-12-05  454  	if ((mask & MAY_WRITE) && test_bit(IMA_DIGSIG, &iint->atomic_flags) &&
05d1a717ec0430 Mimi Zohar            2016-02-29  455  	     !(iint->flags & IMA_NEW_FILE))
a175b8bb29ebba Dmitry Kasatkin       2012-09-27  456  		rc = -EACCES;
0d73a55208e94f Dmitry Kasatkin       2017-12-05  457  	mutex_unlock(&iint->mutex);
f7a859ff7395c0 Roberto Sassu         2014-09-12  458  	kfree(xattr_value);
39b07096364a42 Thiago Jung Bauermann 2019-06-27  459  	ima_free_modsig(modsig);
0d73a55208e94f Dmitry Kasatkin       2017-12-05  460  out:
456f5fd3f6017f Dmitry Kasatkin       2014-10-01  461  	if (pathbuf)
456f5fd3f6017f Dmitry Kasatkin       2014-10-01  462  		__putname(pathbuf);
0d73a55208e94f Dmitry Kasatkin       2017-12-05  463  	if (must_appraise) {
581fd05ad98600 Zhang Tianxing        2021-12-29  464  		if (rc && (ima_appraise & IMA_APPRAISE_ENFORCE))
750943a30714b7 Dmitry Kasatkin       2012-09-27  465  			return -EACCES;
0d73a55208e94f Dmitry Kasatkin       2017-12-05  466  		if (file->f_mode & FMODE_WRITE)
0d73a55208e94f Dmitry Kasatkin       2017-12-05  467  			set_bit(IMA_UPDATE_XATTR, &iint->atomic_flags);
0d73a55208e94f Dmitry Kasatkin       2017-12-05  468  	}
750943a30714b7 Dmitry Kasatkin       2012-09-27  469  	return 0;
3323eec921efd8 Mimi Zohar            2009-02-04  470  }
3323eec921efd8 Mimi Zohar            2009-02-04  471  

:::::: The code at line 433 was first introduced by commit
:::::: 273df864cf7466fb170b8dcc1abd672cd08ad8d3 ima: Check against blacklisted hashes for files with modsig

:::::: TO: Nayna Jain <nayna@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
