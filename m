Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40A17580
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708755039; cv=none; b=urftcUgce3FBsWgRmPeOb2MH42thYXa3aEQpitWzFXK9M7doxe6gxRrkYGE//QCQTTAyLgZCWgdeQTUSQsbQ8B6rvAWegIFWwRLHgbqBLT3/wc7t86E00Y3n6CtKTCAEpliZvJp98YmojVRbISLYDhnOkNPSZsXfWA+NWWzXeCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708755039; c=relaxed/simple;
	bh=56HbaGKzBxQd/Q0wv5H0kGQuuGlQgnPdYfoQiNESNZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SnhqAJu25vubyfXhLWjpWQ47zNAkf8IP/G4F8deSozE1Jzk9UvqCfjB6HCGhdfiLjXnUGdgsC1GrlFNggq5MRgCVMvJvy4oEGZxzNmisIP/gvAyNzKrNAd8Kezp7RZrADEUkto6ddO3CakES8gsrW47bRlO+CwEa4poMF525q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m18uTfGw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m18uTfGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708755037; x=1740291037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56HbaGKzBxQd/Q0wv5H0kGQuuGlQgnPdYfoQiNESNZc=;
  b=m18uTfGwOg29ufcVi9/qkG+t2qNyrxtolYy4FckJQNIPG/BnnKMPbajY
   yruLBFIlRYG/f+37buxxHcOxI4eK5nAXFMdCDSslpHutRMIRmLVjoWv8J
   6/gRGhQkb7XK8nWjDmqhgSNfAFpkBmEllQkBWaPJSV0Z4j4Phmy5cjA0e
   BRrlexT8t6SxPEFS2kWyoYYaXJDxEDzKD+MprOBfT9Ptn3xXrAu1OrjpP
   NoPBYa8YzibR7NydzXc9IjaoIwKGhbkBmkIORAPHlZ7Jp1K45PtIZN+7D
   OonCVMMER5Wl1EHhOEJfbIM14+u2vldHZA0qY0ECOi7IOgA/wqzl6kaE2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2941530"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2941530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 22:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6132139"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2024 22:10:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdlF2-0008Hk-2X;
	Sat, 24 Feb 2024 06:10:32 +0000
Date: Sat, 24 Feb 2024 14:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3267/3388]
 security/integrity/ima/ima_appraise.c:188:16: warning: no previous prototype
 for 'ima_get_hash_algo'
Message-ID: <202402241446.c26kZvcP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0e6ac87df9e5122747ac5d9e7da9a45555f16374
commit: b3fef06570ef2b61dd7181e5c1d128bfcbf6b2ef [3267/3388] ima: Add parser of compact digest list
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241446.c26kZvcP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241446.c26kZvcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241446.c26kZvcP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_appraise.c:188:16: warning: no previous prototype for 'ima_get_hash_algo' [-Wmissing-prototypes]
     188 | enum hash_algo ima_get_hash_algo(const struct evm_ima_xattr_data *xattr_value,
         |                ^~~~~~~~~~~~~~~~~


vim +/ima_get_hash_algo +188 security/integrity/ima/ima_appraise.c

d79d72e02485c0 Mimi Zohar            2012-12-03  187  
50f742dd91474e THOBY Simon           2021-08-16 @188  enum hash_algo ima_get_hash_algo(const struct evm_ima_xattr_data *xattr_value,
1525b06d99b117 Dmitry Kasatkin       2014-10-30  189  				 int xattr_len)
d3634d0f426bde Dmitry Kasatkin       2013-04-25  190  {
d3634d0f426bde Dmitry Kasatkin       2013-04-25  191  	struct signature_v2_hdr *sig;
b4bfec7f4a8642 Seth Forshee          2016-08-01  192  	enum hash_algo ret;
d3634d0f426bde Dmitry Kasatkin       2013-04-25  193  
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  194  	if (!xattr_value || xattr_len < 2)
1525b06d99b117 Dmitry Kasatkin       2014-10-30  195  		/* return default hash algo */
1525b06d99b117 Dmitry Kasatkin       2014-10-30  196  		return ima_hash_algo;
d3634d0f426bde Dmitry Kasatkin       2013-04-25  197  
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  198  	switch (xattr_value->type) {
398c42e2c46c88 Mimi Zohar            2021-11-24  199  	case IMA_VERITY_DIGSIG:
398c42e2c46c88 Mimi Zohar            2021-11-24  200  		sig = (typeof(sig))xattr_value;
398c42e2c46c88 Mimi Zohar            2021-11-24  201  		if (sig->version != 3 || xattr_len <= sizeof(*sig) ||
398c42e2c46c88 Mimi Zohar            2021-11-24  202  		    sig->hash_algo >= HASH_ALGO__LAST)
398c42e2c46c88 Mimi Zohar            2021-11-24  203  			return ima_hash_algo;
398c42e2c46c88 Mimi Zohar            2021-11-24  204  		return sig->hash_algo;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  205  	case EVM_IMA_XATTR_DIGSIG:
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  206  		sig = (typeof(sig))xattr_value;
cb181da161963e THOBY Simon           2021-08-22  207  		if (sig->version != 2 || xattr_len <= sizeof(*sig)
cb181da161963e THOBY Simon           2021-08-22  208  		    || sig->hash_algo >= HASH_ALGO__LAST)
1525b06d99b117 Dmitry Kasatkin       2014-10-30  209  			return ima_hash_algo;
1525b06d99b117 Dmitry Kasatkin       2014-10-30  210  		return sig->hash_algo;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  211  	case IMA_XATTR_DIGEST_NG:
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  212  		/* first byte contains algorithm id */
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  213  		ret = xattr_value->data[0];
b4bfec7f4a8642 Seth Forshee          2016-08-01  214  		if (ret < HASH_ALGO__LAST)
b4bfec7f4a8642 Seth Forshee          2016-08-01  215  			return ret;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  216  		break;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  217  	case IMA_XATTR_DIGEST:
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  218  		/* this is for backward compatibility */
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  219  		if (xattr_len == 21) {
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  220  			unsigned int zero = 0;
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  221  			if (!memcmp(&xattr_value->data[16], &zero, 4))
1525b06d99b117 Dmitry Kasatkin       2014-10-30  222  				return HASH_ALGO_MD5;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  223  			else
1525b06d99b117 Dmitry Kasatkin       2014-10-30  224  				return HASH_ALGO_SHA1;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  225  		} else if (xattr_len == 17)
1525b06d99b117 Dmitry Kasatkin       2014-10-30  226  			return HASH_ALGO_MD5;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  227  		break;
3ea7a56067e663 Dmitry Kasatkin       2013-08-12  228  	}
1525b06d99b117 Dmitry Kasatkin       2014-10-30  229  
1525b06d99b117 Dmitry Kasatkin       2014-10-30  230  	/* return default hash algo */
1525b06d99b117 Dmitry Kasatkin       2014-10-30  231  	return ima_hash_algo;
d3634d0f426bde Dmitry Kasatkin       2013-04-25  232  }
d3634d0f426bde Dmitry Kasatkin       2013-04-25  233  

:::::: The code at line 188 was first introduced by commit
:::::: 50f742dd91474e7f4954bf88d094eede59783883 IMA: block writes of the security.ima xattr with unsupported algorithms

:::::: TO: THOBY Simon <Simon.THOBY@viveris.fr>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
