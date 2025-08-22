Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E9256C8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879250; cv=none; b=grYPFzf538mnFobONzJ7GlQWwfah8fc8h3G0FYZS3PmGNj3N6R4XFVG81Nqa8a5jtAyvtPhilHwYzJYKWG7YXz21upakbg69t9miMAabboLTDRr4/cNwAWVgfNHJp5+EiFdPFaTKxUnPD3EU9jeB4OBsv3FGibVo9HZd85p6McI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879250; c=relaxed/simple;
	bh=GueKRakR1lgK5kCiVLoEhTS6vtmEaPTZSFNhGC/qKp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T8E91L9FQAncagDyMvgXIol4reIm2LvPpFh+0Bl0NW7Ok1PhL3i8BuQPHkxlXtsp3uhndbM8PffEOzWKY4CEYoEeLZDvIjrowZIozurmWGtUweuGSzNrFhlNKKov4lYxVEM75Ra++Tbylmcy4Zk+WF1UhmHTuBn15CumK2yAetU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HP5i9lul; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HP5i9lul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755879248; x=1787415248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GueKRakR1lgK5kCiVLoEhTS6vtmEaPTZSFNhGC/qKp0=;
  b=HP5i9lulYP2gnaoLo2NbFufwLahlVYFWtMVjWRbU/0vqHE72p5Iq3OIT
   qyp1SltmtqA3qvKkw/MEN7Wr4YWjFpTSZuPL6VQwCLjn8HX1j2XPS/rhr
   yRjsR2eeSwMeb5iQOYLaER8DcT4pyGkKAY4FMmsNYHeIzeneMp5qXivpn
   p6B80fQfJ4wsteQxjN4OH/eSDYdLd3Et+slg0JcHe4BtJwTWcN0WIU1oo
   sFNKsv2J7kI6s6YxtA9d4w4SuqFwQjc2+oJsuKFyIpETGzzAW43oamrTN
   ZN+cOM7I6uP2ICQgQ5RxSL8UQLfEK9xIvvxzZYjEJ9PvvW248GzSQsO5t
   Q==;
X-CSE-ConnectionGUID: h4JwdGAbQRe5dOUt5Sni9A==
X-CSE-MsgGUID: 9NXj/p3WQ+uE/uzXWvP5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58287721"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58287721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 09:14:07 -0700
X-CSE-ConnectionGUID: PKSGq7JPQY22M9l5sXhFfQ==
X-CSE-MsgGUID: hXKrfTJUSBmLZOMGAPO6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169109546"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2025 09:14:06 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upUOy-0001xP-0V;
	Fri, 22 Aug 2025 16:14:04 +0000
Date: Fri, 22 Aug 2025 18:13:14 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuiqing <zhoushuiqing2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3135/3135]
 security/integrity/ima/ima_main.c:440:29: error: too few arguments to
 function call, expected 8, have 7
Message-ID: <202508221858.3uN60Sil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c329d5096a9b894ce070ec7a1ee9f250dc5867d3
commit: e94df9b790f7ed9025c9321f16a77044f66b14a5 [3135/3135] ima: Add macros to isolate the IMA digest list
config: x86_64-randconfig-2002-20250820 (https://download.01.org/0day-ci/archive/20250822/202508221858.3uN60Sil-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221858.3uN60Sil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221858.3uN60Sil-lkp@intel.com/

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
