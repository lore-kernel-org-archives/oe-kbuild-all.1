Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0B1859
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evqtyslb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697304547; x=1728840547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFQ4e2ZoDg+aTa/GSDRj7tGJSO8m9RcADXhEhvm0iVE=;
  b=evqtyslbj8J6nkcd/EDveyN4Ug3iJ16lue8VMY8dmp1HY17Oc8G0CJ2D
   Zwjwfe6NWcbM5cyj55h1UmZnE3tCYdwGOiGKMmppD72sDEiESk+nZkl0Y
   KfmtwHyDSvaLiVxxEKy2G7tsimhpYSyJQw005BHs50dz3rZSCEKb9gGJ9
   gtghf4vkfxlw6i9tylPfQv2J9mW/eWI5HBehEsW5vPOE1xogxRcvqXDX5
   nXCvsGsXZ9Xmufu3isktk7R+tHdwcQsK6iA/GLltAUm+WerVUyKHOSuJa
   8AJ5/tGngF2VWSucyJluILHiIWiPOGCimpW2pvG7CLJGK90s11VdAqcMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389197963"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389197963"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 10:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="878866449"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="878866449"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Oct 2023 10:29:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qriRi-0006Rh-35;
	Sat, 14 Oct 2023 17:29:02 +0000
Date: Sun, 15 Oct 2023 01:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4146/15767]
 drivers/crypto/caam/caamkeygen.c:491: warning: Function parameter or member
 'arg' not described in 'send_output'
Message-ID: <202310150155.2BfMVMXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: b5178f6b5cebb24a61ab8acf1c1f040d415fd251 [4146/15767] MLK-24420-3 crypto: caam - add ioctl calls for black keys and blobs generation
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150155.2BfMVMXo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150155.2BfMVMXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150155.2BfMVMXo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/caamkeygen.c:491: warning: Function parameter or member 'arg' not described in 'send_output'


vim +491 drivers/crypto/caam/caamkeygen.c

   474	
   475	/**
   476	 * send_output       - Send the output data (tagged key and blob)
   477	 *                     from kernel to user-space.
   478	 *
   479	 * @key_crt          : Structure used to transfer data
   480	 *                     from user-space to kernel
   481	 * @info             : keyblob_info structure, which contains all
   482	 *                     the data obtained from CAAM that needs to
   483	 *                     be transferred to user-space
   484	 * @create_key_op    : Used to determine if it's a create or import operation
   485	 * @err              : Error code received from previous operations
   486	 *
   487	 * Return            : '0' on success, error code otherwise
   488	 */
   489	static int send_output(struct caam_keygen_cmd *key_crt, unsigned long arg,
   490			       struct keyblob_info *info, bool create_key_op, int err)
 > 491	{
   492		int ret = 0;
   493		char *msg;
   494	
   495		/* Free resource used on validate_input */
   496		kfree(info->key);
   497	
   498		if (err)
   499			return err;
   500	
   501		/* Check if there's enough space to copy black key to user */
   502		if (key_crt->black_key_len < info->black_key_len) {
   503			msg = "Not enough space for black key.\n";
   504			send_err_msg(msg, u64_to_user_ptr(key_crt->blob),
   505				     key_crt->blob_len);
   506			/* Send, to user, the necessary size for key */
   507			key_crt->black_key_len = info->black_key_len;
   508	
   509			ret = -EINVAL;
   510			goto exit;
   511		}
   512		key_crt->black_key_len = info->black_key_len;
   513	
   514		/* For key import, copy to user only the black key */
   515		if (copy_to_user(u64_to_user_ptr(key_crt->black_key),
   516				 info->black_key, info->black_key_len))
   517			return -EFAULT;
   518	
   519		/* For key creation, copy to user, also, the blob */
   520		if (create_key_op) {
   521			/* Check if there's enough space to copy blob user */
   522			if (key_crt->blob_len < info->blob_len) {
   523				msg = "Not enough space for blob key.\n";
   524				send_err_msg(msg, u64_to_user_ptr(key_crt->blob),
   525					     key_crt->blob_len);
   526				/* Send, to user, the necessary size for blob */
   527				key_crt->blob_len = info->blob_len;
   528	
   529				ret = -EINVAL;
   530				goto exit;
   531			}
   532	
   533			key_crt->blob_len = info->blob_len;
   534	
   535			if (copy_to_user(u64_to_user_ptr(key_crt->blob), info->blob,
   536					 info->blob_len))
   537				return -EFAULT;
   538		}
   539	
   540	exit:
   541		if (copy_to_user((void __user *)arg, key_crt,
   542				 sizeof(struct caam_keygen_cmd)))
   543			return -EFAULT;
   544	
   545		return ret;
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
