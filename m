Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCB1A38DE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 03:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711251689; cv=none; b=caWht51IGPqAD4YZMYWPA2cCmAUVKIgmHebDrDOHBb5qqWeoJ387r1H7VTYdV1k0kZ5r7d9kdP0u94SEIRjeY2zav6rgfjDd/iHdzFNB5h4pJdsjxo3u46aFmfqQuXywpoQvCtkzSycyQNErlBbDGdTrtpq27CWYUF3aUOfNkUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711251689; c=relaxed/simple;
	bh=sARG1nYgC9jOzqujhig/U8slNRqCmYedjC+1Wyj6s8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jStWQQQVXfPcQ0xYrhPYGC2fEgII8Cz4DSRTPOu+qlHwrPsmDI/ExHap66vcT4mLKhslY7oJ1gnRY15HW/4MluwNLBxdpI8+L+vgHtGpdH/yzffCerF/efBgEFBIP0sUnbuTRXThmVRxPwIdkYmmU+hq2M1C/ZUpN6nCunI+jNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co3stTps; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co3stTps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711251687; x=1742787687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sARG1nYgC9jOzqujhig/U8slNRqCmYedjC+1Wyj6s8I=;
  b=co3stTpsqV+sSQAvx+ThXefyQkRfWjbjTzsfnPLGBJzEt5NszLPlbTm9
   P5luv4P4HR2eivcwbFjsrPtXksDdfEqsaIw2XEYUENnlttlMvtjMY/f+o
   TBAqZEjyKf11HLrSKfwbHy+QCZe8HcxsWHFCTKKc1W+lSIvrHTmCs3JxM
   yIbS5+DUlUPEcxyr01NjsXf2gCoXP+VsbQkDtRhOwsQF2mki0N6CfiFq7
   bLlCMUYsmjyJenYMrjLg9f9fQA/wbOF0LFhL+t2FbtXdmVc6TMguJHADz
   aTkcfHmKEFaDbNQ0ygHDqph0ZLKld5s+41oN8GUx7+4N+UsNjcH9wzVj8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="23725149"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="23725149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 20:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="38392199"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2024 20:41:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roEjb-000Ldj-00;
	Sun, 24 Mar 2024 03:41:23 +0000
Date: Sun, 24 Mar 2024 11:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 24/87] drivers/scsi/cxlflash/lunmgt.c:228:
 warning: Function parameter or struct member 'arg' not described in
 'cxlflash_manage_lun'
Message-ID: <202403241122.TYwX93xn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   467039adc3ec86566cc6403e5b1fbb9785d66df1
commit: 30b06c479d0f408c827ea71c4db2c2440c74dee7 [24/87] cxlflash: fix function pointer cast warnings
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240324/202403241122.TYwX93xn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241122.TYwX93xn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241122.TYwX93xn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/cxlflash/lunmgt.c:228: warning: Function parameter or struct member 'arg' not described in 'cxlflash_manage_lun'
>> drivers/scsi/cxlflash/lunmgt.c:228: warning: Excess function parameter 'manage' description in 'cxlflash_manage_lun'
--
>> drivers/scsi/cxlflash/vlun.c:1190: warning: Function parameter or struct member 'arg' not described in 'cxlflash_disk_clone'
>> drivers/scsi/cxlflash/vlun.c:1190: warning: Excess function parameter 'clone' description in 'cxlflash_disk_clone'
--
>> drivers/scsi/cxlflash/superpipe.c:1316: warning: Function parameter or struct member 'arg' not described in 'cxlflash_disk_attach'
>> drivers/scsi/cxlflash/superpipe.c:1316: warning: Excess function parameter 'attach' description in 'cxlflash_disk_attach'
>> drivers/scsi/cxlflash/superpipe.c:1650: warning: Function parameter or struct member 'arg' not described in 'cxlflash_afu_recover'
>> drivers/scsi/cxlflash/superpipe.c:1650: warning: Excess function parameter 'recover' description in 'cxlflash_afu_recover'
>> drivers/scsi/cxlflash/superpipe.c:1835: warning: Function parameter or struct member 'arg' not described in 'cxlflash_disk_verify'
>> drivers/scsi/cxlflash/superpipe.c:1835: warning: Excess function parameter 'verify' description in 'cxlflash_disk_verify'
--
>> drivers/scsi/cxlflash/main.c:3288: warning: Function parameter or struct member 'arg' not described in 'cxlflash_lun_provision'
>> drivers/scsi/cxlflash/main.c:3288: warning: Excess function parameter 'lunprov' description in 'cxlflash_lun_provision'
>> drivers/scsi/cxlflash/main.c:3382: warning: Function parameter or struct member 'arg' not described in 'cxlflash_afu_debug'
>> drivers/scsi/cxlflash/main.c:3382: warning: Excess function parameter 'afu_dbg' description in 'cxlflash_afu_debug'


vim +228 drivers/scsi/cxlflash/lunmgt.c

65be2c79acc3aa Matthew R. Ochs 2015-08-13  215  
65be2c79acc3aa Matthew R. Ochs 2015-08-13  216  /**
65be2c79acc3aa Matthew R. Ochs 2015-08-13  217   * cxlflash_manage_lun() - handles LUN management activities
65be2c79acc3aa Matthew R. Ochs 2015-08-13  218   * @sdev:	SCSI device associated with LUN.
65be2c79acc3aa Matthew R. Ochs 2015-08-13  219   * @manage:	Manage ioctl data structure.
65be2c79acc3aa Matthew R. Ochs 2015-08-13  220   *
65be2c79acc3aa Matthew R. Ochs 2015-08-13  221   * This routine is used to notify the driver about a LUN's WWID and associate
65be2c79acc3aa Matthew R. Ochs 2015-08-13  222   * SCSI devices (sdev) with a global LUN instance. Additionally it serves to
65be2c79acc3aa Matthew R. Ochs 2015-08-13  223   * change a LUN's operating mode: legacy or superpipe.
65be2c79acc3aa Matthew R. Ochs 2015-08-13  224   *
65be2c79acc3aa Matthew R. Ochs 2015-08-13  225   * Return: 0 on success, -errno on failure
65be2c79acc3aa Matthew R. Ochs 2015-08-13  226   */
30b06c479d0f40 Arnd Bergmann   2024-03-15  227  int cxlflash_manage_lun(struct scsi_device *sdev, void *arg)
65be2c79acc3aa Matthew R. Ochs 2015-08-13 @228  {

:::::: The code at line 228 was first introduced by commit
:::::: 65be2c79acc3aa0f9c0e8d4871f5a451d854465a cxlflash: Superpipe support

:::::: TO: Matthew R. Ochs <mrochs@linux.vnet.ibm.com>
:::::: CC: James Bottomley <JBottomley@Odin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
