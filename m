Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537ADF64
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 21:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695592007; x=1727128007;
  h=date:from:cc:subject:message-id:mime-version;
  bh=asnm3wrs2aRsVMkPTfbkXf9SWiS6KRPS/38Apiw5KQE=;
  b=N8XwbIfAb4fg9bGLmocqrOfHWsrEyJk9xpBhhXhP/mdN4RMYv585/fJr
   hzTDbUKxmN90aQB/T+uuXTxT2WhSntkBazGSRYCo9b1f3nCtO93vgIXF4
   JbfT9eCPasFsP1EImtoN9XxcTqePTsywzLBNIm2DCb0fvaDyydXB1EODn
   6TGEoCbFTfs8MENB5nueJUO0GEPCaYp+g9gvie/7opHisTbyjl3XVJPza
   QUfE1ymVOXcOWiQL9Ty9rqjqOw1XjtxzlpzuGZo/oiB47/1ivkfv7cK/j
   HHnICRjjrgR2JkVJtu4CY56ZL0b7SGFJ7bdjkMCOEuK18Aw/tRNZMZIAf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380002901"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="380002901"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 14:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783256328"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="783256328"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Sep 2023 14:46:45 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkWw7-0000V8-00
	for oe-kbuild-all@lists.linux.dev;
	Sun, 24 Sep 2023 21:46:43 +0000
Date: Mon, 25 Sep 2023 05:45:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 5248/30000] drivers/tee/tee_core.c:538:
 Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
Message-ID: <202309250523.YeWTmOLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 90169c0955b2b89ef84a478549d16b24be977cd1 [5248/30000] UPSTREAM: security: Implement Clang's stack initialization
config: riscv-randconfig-r006-20230807 (https://download.01.org/0day-ci/archive/20230925/202309250523.YeWTmOLc-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250523.YeWTmOLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250523.YeWTmOLc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tee/tee_core.c: Assembler messages:
   drivers/tee/tee_core.c:276: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:276: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:277: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:277: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:278: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:283: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:283: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/tee/tee_core.c:337: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:337: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:338: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:338: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:339: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:339: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:407: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:407: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:408: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:408: Error: unrecognized opcode `csrc sstatus,s1', extension `zicsr' required
   drivers/tee/tee_core.c:618: Error: unrecognized opcode `csrs sstatus,s0', extension `zicsr' required
   drivers/tee/tee_core.c:618: Error: unrecognized opcode `csrc sstatus,s0', extension `zicsr' required
   drivers/tee/tee_core.c:619: Error: unrecognized opcode `csrs sstatus,s0', extension `zicsr' required
   drivers/tee/tee_core.c:619: Error: unrecognized opcode `csrc sstatus,s0', extension `zicsr' required
   drivers/tee/tee_core.c:520: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tee/tee_core.c:520: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> drivers/tee/tee_core.c:538: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
>> drivers/tee/tee_core.c:538: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required
   drivers/tee/tee_core.c:539: Error: unrecognized opcode `csrs sstatus,s4', extension `zicsr' required
   drivers/tee/tee_core.c:539: Error: unrecognized opcode `csrc sstatus,s4', extension `zicsr' required


vim +538 drivers/tee/tee_core.c

967c9cca2cc5056 Jens Wiklander 2015-03-11  498  
967c9cca2cc5056 Jens Wiklander 2015-03-11  499  static int tee_ioctl_supp_recv(struct tee_context *ctx,
967c9cca2cc5056 Jens Wiklander 2015-03-11  500  			       struct tee_ioctl_buf_data __user *ubuf)
967c9cca2cc5056 Jens Wiklander 2015-03-11  501  {
967c9cca2cc5056 Jens Wiklander 2015-03-11  502  	int rc;
967c9cca2cc5056 Jens Wiklander 2015-03-11  503  	struct tee_ioctl_buf_data buf;
967c9cca2cc5056 Jens Wiklander 2015-03-11  504  	struct tee_iocl_supp_recv_arg __user *uarg;
967c9cca2cc5056 Jens Wiklander 2015-03-11  505  	struct tee_param *params;
967c9cca2cc5056 Jens Wiklander 2015-03-11  506  	u32 num_params;
967c9cca2cc5056 Jens Wiklander 2015-03-11  507  	u32 func;
967c9cca2cc5056 Jens Wiklander 2015-03-11  508  
967c9cca2cc5056 Jens Wiklander 2015-03-11  509  	if (!ctx->teedev->desc->ops->supp_recv)
967c9cca2cc5056 Jens Wiklander 2015-03-11  510  		return -EINVAL;
967c9cca2cc5056 Jens Wiklander 2015-03-11  511  
967c9cca2cc5056 Jens Wiklander 2015-03-11  512  	if (copy_from_user(&buf, ubuf, sizeof(buf)))
967c9cca2cc5056 Jens Wiklander 2015-03-11  513  		return -EFAULT;
967c9cca2cc5056 Jens Wiklander 2015-03-11  514  
967c9cca2cc5056 Jens Wiklander 2015-03-11  515  	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
967c9cca2cc5056 Jens Wiklander 2015-03-11  516  	    buf.buf_len < sizeof(struct tee_iocl_supp_recv_arg))
967c9cca2cc5056 Jens Wiklander 2015-03-11  517  		return -EINVAL;
967c9cca2cc5056 Jens Wiklander 2015-03-11  518  
967c9cca2cc5056 Jens Wiklander 2015-03-11  519  	uarg = u64_to_user_ptr(buf.buf_ptr);
967c9cca2cc5056 Jens Wiklander 2015-03-11  520  	if (get_user(num_params, &uarg->num_params))
967c9cca2cc5056 Jens Wiklander 2015-03-11  521  		return -EFAULT;
967c9cca2cc5056 Jens Wiklander 2015-03-11  522  
967c9cca2cc5056 Jens Wiklander 2015-03-11  523  	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) != buf.buf_len)
967c9cca2cc5056 Jens Wiklander 2015-03-11  524  		return -EINVAL;
967c9cca2cc5056 Jens Wiklander 2015-03-11  525  
967c9cca2cc5056 Jens Wiklander 2015-03-11  526  	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
967c9cca2cc5056 Jens Wiklander 2015-03-11  527  	if (!params)
967c9cca2cc5056 Jens Wiklander 2015-03-11  528  		return -ENOMEM;
967c9cca2cc5056 Jens Wiklander 2015-03-11  529  
f2aa97240c84b8f Jens Wiklander 2016-12-23  530  	rc = params_from_user(ctx, params, num_params, uarg->params);
f2aa97240c84b8f Jens Wiklander 2016-12-23  531  	if (rc)
f2aa97240c84b8f Jens Wiklander 2016-12-23  532  		goto out;
f2aa97240c84b8f Jens Wiklander 2016-12-23  533  
967c9cca2cc5056 Jens Wiklander 2015-03-11  534  	rc = ctx->teedev->desc->ops->supp_recv(ctx, &func, &num_params, params);
967c9cca2cc5056 Jens Wiklander 2015-03-11  535  	if (rc)
967c9cca2cc5056 Jens Wiklander 2015-03-11  536  		goto out;
967c9cca2cc5056 Jens Wiklander 2015-03-11  537  
967c9cca2cc5056 Jens Wiklander 2015-03-11 @538  	if (put_user(func, &uarg->func) ||
967c9cca2cc5056 Jens Wiklander 2015-03-11  539  	    put_user(num_params, &uarg->num_params)) {
967c9cca2cc5056 Jens Wiklander 2015-03-11  540  		rc = -EFAULT;
967c9cca2cc5056 Jens Wiklander 2015-03-11  541  		goto out;
967c9cca2cc5056 Jens Wiklander 2015-03-11  542  	}
967c9cca2cc5056 Jens Wiklander 2015-03-11  543  
967c9cca2cc5056 Jens Wiklander 2015-03-11  544  	rc = params_to_supp(ctx, uarg->params, num_params, params);
967c9cca2cc5056 Jens Wiklander 2015-03-11  545  out:
967c9cca2cc5056 Jens Wiklander 2015-03-11  546  	kfree(params);
967c9cca2cc5056 Jens Wiklander 2015-03-11  547  	return rc;
967c9cca2cc5056 Jens Wiklander 2015-03-11  548  }
967c9cca2cc5056 Jens Wiklander 2015-03-11  549  

:::::: The code at line 538 was first introduced by commit
:::::: 967c9cca2cc50569efc65945325c173cecba83bd tee: generic TEE subsystem

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
