Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247191F934
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691089813; x=1722625813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFMG8ftmLAiZggo0cqVH2dl4mxV7FYlPqpTl0u9JjYY=;
  b=E5iuASHjx4VFmx3V/EMiTzHWZMoU/4wvqiVP4PerINPvg4fQmMDqgUFT
   T5I/YZZkED/og1bjhh1xq1w3h/TUC3tUQo5/NkFWKrAlq0n1U3LtSAtYf
   NiJ/C3j8NDLomnNdqeMcKuV4R6xEZLJLhQNvcTtVTnwTNJ2+14oyzdWzC
   RmpGzj+LiTQqE0XiP2gvuCbeWnFRbH94EOhlrHTSs5/Yp4M9Nq6jOt/7y
   UamMYq6aNf+oQl3TvNLVhrLRPk109dsKSfQO8ABg4EYTiy9zm99j4Hz/J
   gj15YJYzlRI8QivjapnjcZ0ipL7wraiZ45XHGWocciyoUIP28fPdrOkc4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="372725002"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="372725002"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 12:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="764795597"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="764795597"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2023 12:09:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRdhh-0002Iq-18;
	Thu, 03 Aug 2023 19:09:45 +0000
Date: Fri, 4 Aug 2023 03:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:master 3/11] drivers/char/tpm/tpm-interface.c:284:5:
 error: conflicting types for 'tpm_pcr_read'; have 'int(struct tpm_chip *,
 u32,  struct tpm_digest *)' {aka 'int(struct tpm_chip *, unsigned int,
  struct tpm_digest *)'}
Message-ID: <202308040209.ouAY1FaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   2c6af65af490b1352a9feefa0eae5cf42f7021b3
commit: dc4782c1543a065f02c00a47aa03e336f9990ba8 [3/11] sysctl: set variable key_sysctls storage-class-specifier to static
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230804/202308040209.ouAY1FaL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040209.ouAY1FaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040209.ouAY1FaL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/tpm/tpm-interface.c:284:5: error: conflicting types for 'tpm_pcr_read'; have 'int(struct tpm_chip *, u32,  struct tpm_digest *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *)'}
     284 | int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |     ^~~~~~~~~~~~
   In file included from include/linux/tpm_eventlog.h:6,
                    from drivers/char/tpm/tpm-interface.c:28:
   include/linux/tpm.h:427:12: note: previous declaration of 'tpm_pcr_read' with type 'int(struct tpm_chip *, u32,  struct tpm_digest *, u32 *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *, unsigned int *)'}
     427 | extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |            ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from drivers/char/tpm/tpm-interface.c:22:
   drivers/char/tpm/tpm-interface.c:301:19: error: conflicting types for 'tpm_pcr_read'; have 'int(struct tpm_chip *, u32,  struct tpm_digest *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *)'}
     301 | EXPORT_SYMBOL_GPL(tpm_pcr_read);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/char/tpm/tpm-interface.c:301:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     301 | EXPORT_SYMBOL_GPL(tpm_pcr_read);
         | ^~~~~~~~~~~~~~~~~
   include/linux/tpm.h:427:12: note: previous declaration of 'tpm_pcr_read' with type 'int(struct tpm_chip *, u32,  struct tpm_digest *, u32 *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *, unsigned int *)'}
     427 | extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |            ^~~~~~~~~~~~
--
>> drivers/char/tpm/tpm2-cmd.c:161:5: error: conflicting types for 'tpm2_pcr_read'; have 'int(struct tpm_chip *, u32,  struct tpm_digest *, u16 *, u32 *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *, short unsigned int *, unsigned int *)'}
     161 | int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |     ^~~~~~~~~~~~~
   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   drivers/char/tpm/tpm.h:291:5: note: previous declaration of 'tpm2_pcr_read' with type 'int(struct tpm_chip *, u32,  struct tpm_digest *, u16 *)' {aka 'int(struct tpm_chip *, unsigned int,  struct tpm_digest *, short unsigned int *)'}
     291 | int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |     ^~~~~~~~~~~~~
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_init_bank_info':
>> drivers/char/tpm/tpm2-cmd.c:542:16: error: too few arguments to function 'tpm2_pcr_read'
     542 |         return tpm2_pcr_read(chip, 0, &digest, &bank->digest_size);
         |                ^~~~~~~~~~~~~
   drivers/char/tpm/tpm2-cmd.c:161:5: note: declared here
     161 | int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |     ^~~~~~~~~~~~~
   drivers/char/tpm/tpm2-cmd.c:543:1: error: control reaches end of non-void function [-Werror=return-type]
     543 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/char/tpm/tpm-sysfs.c: In function 'pcr_value_show':
>> drivers/char/tpm/tpm-sysfs.c:368:14: error: too few arguments to function 'tpm_pcr_read'
     368 |         rc = tpm_pcr_read(chip, ha->pcr, &digest);
         |              ^~~~~~~~~~~~
   In file included from drivers/char/tpm/tpm.h:27,
                    from drivers/char/tpm/tpm-sysfs.c:16:
   include/linux/tpm.h:427:12: note: declared here
     427 | extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
         |            ^~~~~~~~~~~~


vim +284 drivers/char/tpm/tpm-interface.c

954650efb79f99d drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2015-05-30  275  
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  276  /**
aad887f6641145f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  277   * tpm_pcr_read - read a PCR value from SHA1 bank
aad887f6641145f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  278   * @chip:	a &struct tpm_chip instance, %NULL for the default chip
aad887f6641145f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  279   * @pcr_idx:	the PCR to be retrieved
879b589210a9a0c drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  280   * @digest:	the PCR bank and buffer current PCR value is written to
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  281   *
aad887f6641145f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  282   * Return: same as with tpm_transmit_cmd()
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  283   */
879b589210a9a0c drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06 @284  int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0c drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  285  		 struct tpm_digest *digest)
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  286  {
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  287  	int rc;
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  288  
fc1d52b745bae61 drivers/char/tpm/tpm-interface.c Stefan Berger   2018-06-26  289  	chip = tpm_find_get_ops(chip);
aad887f6641145f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  290  	if (!chip)
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  291  		return -ENODEV;
d4a317563207163 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-19  292  
7a1d7e6dd76a207 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-12  293  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
879b589210a9a0c drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  294  		rc = tpm2_pcr_read(chip, pcr_idx, digest, NULL);
7a1d7e6dd76a207 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-12  295  	else
879b589210a9a0c drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  296  		rc = tpm1_pcr_read(chip, pcr_idx, digest->digest);
d4a317563207163 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-19  297  
4e26195f240d731 drivers/char/tpm/tpm-interface.c Jason Gunthorpe 2016-02-12  298  	tpm_put_ops(chip);
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  299  	return rc;
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  300  }
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  301  EXPORT_SYMBOL_GPL(tpm_pcr_read);
659aaf2bb5496a4 drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  302  

:::::: The code at line 284 was first introduced by commit
:::::: 879b589210a9a0c9f77d301aaf0ddee20f2c5052 tpm: retrieve digest size of unknown algorithms with PCR read

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
