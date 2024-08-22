Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB15249E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 04:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724300850; cv=none; b=PaEr6u8Nuh7xPgSreEPnCGqXSkWQcgAbuAMZ1DxjlwGiYRDNC1vGWCATxX14HBYQ1Xpv/4Ex+bbLcjyAoxsd+j+WwmLYeV+lZIBpVIxfxKTYpXPQ/90glbON5H4QXotrUOj1HMAHEOAzOdnh+2Pz1kyjGRIE5mzGCmN+T8plo90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724300850; c=relaxed/simple;
	bh=bS2UZsLXIeT5kCKffWMfllSFYTRAv5kB5LviESOUm0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RozRjry/6ilrSta5rgH0k9IERvMTJERXMGOq9rfTBSVM1rXAsgdo1+dBTMCk14n/1qICnGMi4Ti7K6p6n1KstceYaLOLhfaQruncWMxjaHNQYjXm7FvOA9luxdhjBuGuT6rsmiwckhFsiSsDQorWRclzgPEsvav0Tyt3ntgQySU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTX9yf4I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTX9yf4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724300848; x=1755836848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bS2UZsLXIeT5kCKffWMfllSFYTRAv5kB5LviESOUm0g=;
  b=UTX9yf4I/64EQpJxrJ0op6neBLUwohH8uJ144m0kLHqfUYjLk/acc3YK
   S9x82qT59iOePemdSvFQSvJNxSUr7n+M5SP7tBIn5vJGTx22FDKvDcPN/
   Qb9x0lZKc5fypo9Vzz38ZZlisRM9JlHZer93XOkPhem6k5+qq4XR1sX9H
   O4xk3AHYDccpEu2vOeX0/9IQbQX2d5j6t0nVOk+TXLkPkpBpDp2JyGfDO
   8l6fc34IINTTYbjcdCQDdkq/qU+d0usgF0Fe/kU3x72W391e1FtBIldNB
   dC+krN1mYJIhOan5ILeFmNLPwj1tYC5cYyLrVX3TQ8qDvPH6BAEqIhlkV
   Q==;
X-CSE-ConnectionGUID: Kc6rUGbDQOCHCEcPy5fa9Q==
X-CSE-MsgGUID: PT2bh/iMQ0uG2PTp3XOFhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22302291"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22302291"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 21:27:28 -0700
X-CSE-ConnectionGUID: h1zaeWdGQFa5atBTj94sfQ==
X-CSE-MsgGUID: Rt9fl1LmRgOfSCtglcAPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="65505721"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2024 21:27:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgzPw-000CN6-1s;
	Thu, 22 Aug 2024 04:27:24 +0000
Date: Thu, 22 Aug 2024 12:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: cs-amp-lib: Ignore empty UEFI calibration entries
Message-ID: <202408221128.PXFexliw-lkp@intel.com>
References: <20240821100221.99699-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821100221.99699-1-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Ignore-empty-UEFI-calibration-entries/20240821-192545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240821100221.99699-1-rf%40opensource.cirrus.com
patch subject: [PATCH] ASoC: cs-amp-lib: Ignore empty UEFI calibration entries
config: x86_64-buildonly-randconfig-003-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221128.PXFexliw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221128.PXFexliw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221128.PXFexliw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs-amp-lib-test.c:8:
   sound/soc/codecs/cs-amp-lib-test.c: In function 'cs_amp_lib_test_get_efi_cal_by_uid_test':
>> sound/soc/codecs/cs-amp-lib-test.c:224:50: error: subscripted value is neither array nor pointer nor vector
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |                                                  ^
   include/kunit/test.h:724:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:224:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |         ^~~~~~~~~~~~~~~
>> sound/soc/codecs/cs-amp-lib-test.c:224:50: error: subscripted value is neither array nor pointer nor vector
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |                                                  ^
   include/kunit/test.h:724:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:224:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:225:77: error: subscripted value is neither array nor pointer nor vector
     225 |                               priv->cal_blob->data[param->amp_index].calTime[0]);
         |                                                                             ^
   include/kunit/test.h:725:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:224:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:225:77: error: subscripted value is neither array nor pointer nor vector
     225 |                               priv->cal_blob->data[param->amp_index].calTime[0]);
         |                                                                             ^
   include/kunit/test.h:725:40: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:224:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:50: error: subscripted value is neither array nor pointer nor vector
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |                                                  ^
   include/kunit/test.h:724:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:50: error: subscripted value is neither array nor pointer nor vector
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |                                                  ^
   include/kunit/test.h:724:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:227:77: error: subscripted value is neither array nor pointer nor vector
     227 |                               priv->cal_blob->data[param->amp_index].calTime[1]);
         |                                                                             ^
   include/kunit/test.h:725:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |         ^~~~~~~~~~~~~~~
   sound/soc/codecs/cs-amp-lib-test.c:227:77: error: subscripted value is neither array nor pointer nor vector
     227 |                               priv->cal_blob->data[param->amp_index].calTime[1]);
         |                                                                             ^
   include/kunit/test.h:725:40: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)


vim +224 sound/soc/codecs/cs-amp-lib-test.c

177862317a98ad Richard Fitzgerald 2024-03-04  199  
177862317a98ad Richard Fitzgerald 2024-03-04  200  /* Get cal data block for a given amp, matched by target UID. */
177862317a98ad Richard Fitzgerald 2024-03-04  201  static void cs_amp_lib_test_get_efi_cal_by_uid_test(struct kunit *test)
177862317a98ad Richard Fitzgerald 2024-03-04  202  {
177862317a98ad Richard Fitzgerald 2024-03-04  203  	struct cs_amp_lib_test_priv *priv = test->priv;
177862317a98ad Richard Fitzgerald 2024-03-04  204  	const struct cs_amp_lib_test_param *param = test->param_value;
177862317a98ad Richard Fitzgerald 2024-03-04  205  	struct cirrus_amp_cal_data result_data;
177862317a98ad Richard Fitzgerald 2024-03-04  206  	u64 target_uid;
177862317a98ad Richard Fitzgerald 2024-03-04  207  	int ret;
177862317a98ad Richard Fitzgerald 2024-03-04  208  
177862317a98ad Richard Fitzgerald 2024-03-04  209  	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
177862317a98ad Richard Fitzgerald 2024-03-04  210  
177862317a98ad Richard Fitzgerald 2024-03-04  211  	/* Redirect calls to get EFI data */
177862317a98ad Richard Fitzgerald 2024-03-04  212  	kunit_activate_static_stub(test,
177862317a98ad Richard Fitzgerald 2024-03-04  213  				   cs_amp_test_hooks->get_efi_variable,
177862317a98ad Richard Fitzgerald 2024-03-04  214  				   cs_amp_lib_test_get_efi_variable);
177862317a98ad Richard Fitzgerald 2024-03-04  215  
177862317a98ad Richard Fitzgerald 2024-03-04  216  	target_uid = cs_amp_lib_test_get_target_uid(test);
177862317a98ad Richard Fitzgerald 2024-03-04  217  	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid, -1, &result_data);
177862317a98ad Richard Fitzgerald 2024-03-04  218  	KUNIT_EXPECT_EQ(test, ret, 0);
177862317a98ad Richard Fitzgerald 2024-03-04  219  
177862317a98ad Richard Fitzgerald 2024-03-04  220  	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
177862317a98ad Richard Fitzgerald 2024-03-04  221  
177862317a98ad Richard Fitzgerald 2024-03-04  222  	KUNIT_EXPECT_EQ(test, result_data.calTarget[0], target_uid & 0xFFFFFFFFULL);
177862317a98ad Richard Fitzgerald 2024-03-04  223  	KUNIT_EXPECT_EQ(test, result_data.calTarget[1], target_uid >> 32);
177862317a98ad Richard Fitzgerald 2024-03-04 @224  	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
177862317a98ad Richard Fitzgerald 2024-03-04  225  			      priv->cal_blob->data[param->amp_index].calTime[0]);
177862317a98ad Richard Fitzgerald 2024-03-04  226  	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
177862317a98ad Richard Fitzgerald 2024-03-04  227  			      priv->cal_blob->data[param->amp_index].calTime[1]);
177862317a98ad Richard Fitzgerald 2024-03-04  228  	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
177862317a98ad Richard Fitzgerald 2024-03-04  229  			      priv->cal_blob->data[param->amp_index].calAmbient);
177862317a98ad Richard Fitzgerald 2024-03-04  230  	KUNIT_EXPECT_EQ(test, result_data.calStatus,
177862317a98ad Richard Fitzgerald 2024-03-04  231  			      priv->cal_blob->data[param->amp_index].calStatus);
177862317a98ad Richard Fitzgerald 2024-03-04  232  	KUNIT_EXPECT_EQ(test, result_data.calR,
177862317a98ad Richard Fitzgerald 2024-03-04  233  			      priv->cal_blob->data[param->amp_index].calR);
177862317a98ad Richard Fitzgerald 2024-03-04  234  }
177862317a98ad Richard Fitzgerald 2024-03-04  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
