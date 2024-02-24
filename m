Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B412905
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 05:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708753622; cv=none; b=jXbr7IDyWvUGgtzVAXqujqjJbrfIbWDT6p80bRsu4yvZOQOw2/MUc2sgl7G+hsN8+bgd0AskmmCly0sTl/L9gT4m5TgUVmT9POgTpjKjXWXTgW6Gp7TDpLvafjvn8QJ8jVI6+t7mEmSvsOqEl4zpLvKUcZxylTNWVxoqmv6fSks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708753622; c=relaxed/simple;
	bh=RPHchmXR2wER/Z0Z89q0aP2wJXqpff5KULzC0JRpvcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uohtCl9qWkbqZ8wXGHyBgE4bUgAkQrMfaaQLlihlu1kQOSORalIqVveNSC1d4Z4d62NbcTTUuQmH00lP9z4ARWp8fayNdX4joFmCYcIbDySQqL2qdcIkEIW59a0khpUPFgBK9q31wBK0bEwchr6W50yf4sTSLzFyfMeMMtcsWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJHd0ZfT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJHd0ZfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708753620; x=1740289620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPHchmXR2wER/Z0Z89q0aP2wJXqpff5KULzC0JRpvcw=;
  b=XJHd0ZfTAVHD2GtF5h/wuCRL6GThC5oXzjsIJ34eYZW5AZDyoQlbtuVr
   5jXXhD3sz77GRoAw15/9R+YOdf+AXbSaW4xa1gxfaqXlTL3Oi/eTIK3Ka
   tXKaOsBGV2H0cKsgv6IUrPEFe1pb905wzRaxD9ZJNVhzWt95uaniYajGL
   SjEyv4LFDWpKhMPpXMf5KN9k82YE0jfjQKGOTO1/0OKEBKDGotBPW5Erx
   RGF9jzeiT1LUHKlaRjkl3SB6kOBqYGXKyGoZeqnFRnMfQuHxYVy/TSVIi
   PUI1vee7cRgfSAUMvblwFx1ouhuEtwQM71HVBr3iIeUWY54MFIFnjJB0l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="14502306"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="14502306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 21:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="36903247"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2024 21:46:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdksB-0008GK-23;
	Sat, 24 Feb 2024 05:46:55 +0000
Date: Sat, 24 Feb 2024 13:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3267/3388]
 security/integrity/ima/ima_appraise.c:188:16: warning: no previous prototype
 for function 'ima_get_hash_algo'
Message-ID: <202402241300.uvUkIofs-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240224/202402241300.uvUkIofs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241300.uvUkIofs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241300.uvUkIofs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_appraise.c:188:16: warning: no previous prototype for function 'ima_get_hash_algo' [-Wmissing-prototypes]
     188 | enum hash_algo ima_get_hash_algo(const struct evm_ima_xattr_data *xattr_value,
         |                ^
   security/integrity/ima/ima_appraise.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     188 | enum hash_algo ima_get_hash_algo(const struct evm_ima_xattr_data *xattr_value,
         | ^
         | static 
   1 warning generated.


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
