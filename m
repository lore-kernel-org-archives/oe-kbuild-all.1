Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E71E4B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712415521; cv=none; b=RM8jgSS41Op7H0evvMv7HqrXF6K14jENQcqOYD2CH1YQ/wDHuyO0Z9IK3cWrKg4bW807JK2A315cIqJI0g5SmKijZvVw0Jax0on8s8BjDHSna6OyWNzapAPJ7PitRb4yPktGZVtzD53IpuPCsywlk05b825yaYlbG+W+PZPD32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712415521; c=relaxed/simple;
	bh=LmcY27IojgReAEn2UX/VAImpbOckuTt2gHweR/Cya4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6RPWh4rvKbnDlzi5Rhpcj1JgkjZ0ADjTheHoVMTvU3PllRLxJ60Pr8I49h7YpZ2iQYGtYkSGp0cmUkVbnhXOVvm2mT0xtx12GOIG6dw/UtJv2MkGGmTBqoR3NTGyuFAa1477plfUW/JQ4c6SfSEby2rc1YB8Zlnj32mk8Ch0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBO2RSmP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBO2RSmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712415519; x=1743951519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmcY27IojgReAEn2UX/VAImpbOckuTt2gHweR/Cya4Q=;
  b=XBO2RSmPNWk9XHpKn/yyydK1Qeen27eXppubliY+4tSC4HR1ITVA3FEw
   aHPwjjKnAw9GpeCTqWYASqEHFxz6JtsdEOMZyXb7v89HP8AN3UbEB2/w0
   CZc85pwaDkZLEgtzrFJNL+wp0hwmg9JhvlpQePAICGIkiwvfwS7Ke8066
   BK8pbxSvDz68eb3XJlvosbNalZRQTwhstBksE+TEczgfoUyzhQjIpcpso
   UZdk1fDccGzhAzgp2esdT6qeTFJDwRs3Rs3ExJ3UmWXMdcCt5rX55EdM+
   PbA7+meriZ58guBXfIjHrbhSTr+hG1J7Hfy2gIcosEFBqVVVS++x2Lobd
   w==;
X-CSE-ConnectionGUID: FQbB+MSbRkyS8OZ98gYk5w==
X-CSE-MsgGUID: EQV3LmMSQSSbch6FJR4Ctg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="33137080"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="33137080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 07:58:38 -0700
X-CSE-ConnectionGUID: gR6k1i2PThyVqnHx0RmhlA==
X-CSE-MsgGUID: pkKqukuQRDOnfMUR9ZdH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="19881602"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Apr 2024 07:58:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt7V5-0003aW-03;
	Sat, 06 Apr 2024 14:58:35 +0000
Date: Sat, 6 Apr 2024 22:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/105] drivers/char/apm-emulation.c:207:24:
 error: implicit declaration of function 'iov_iter_count'
Message-ID: <202404062219.pb096Kaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   941c541566a6784beff5ef54ed880c606e3a6225
commit: c2c25f7dd4b3215699ae7d42d9c48bb73b0e62a2 [8/105] char: convert drivers to use ->read_iter() and ->write_iter()
config: arm-randconfig-r123-20240406 (https://download.01.org/0day-ci/archive/20240406/202404062219.pb096Kaf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240406/202404062219.pb096Kaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404062219.pb096Kaf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/apm-emulation.c: In function 'apm_read':
>> drivers/char/apm-emulation.c:207:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     207 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> drivers/char/apm-emulation.c:223:22: error: implicit declaration of function 'copy_to_iter_full' [-Werror=implicit-function-declaration]
     223 |                 if (!copy_to_iter_full(&event, sizeof(event), to))
         |                      ^~~~~~~~~~~~~~~~~
   drivers/char/apm-emulation.c: At top level:
   drivers/char/apm-emulation.c:144:19: warning: 'driver_version' defined but not used [-Wunused-const-variable=]
     144 | static const char driver_version[] = "1.13";    /* no spaces */
         |                   ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iov_iter_count +207 drivers/char/apm-emulation.c

   202	
   203	static ssize_t apm_read(struct kiocb *iocb, struct iov_iter *to)
   204	{
   205		struct file *fp = iocb->ki_filp;
   206		struct apm_user *as = fp->private_data;
 > 207		size_t count = iov_iter_count(to);
   208		apm_event_t event;
   209		int i = count, ret = 0;
   210	
   211		if (count < sizeof(apm_event_t))
   212			return -EINVAL;
   213	
   214		if (queue_empty(&as->queue) && fp->f_flags & O_NONBLOCK)
   215			return -EAGAIN;
   216	
   217		wait_event_interruptible(apm_waitqueue, !queue_empty(&as->queue));
   218	
   219		while ((i >= sizeof(event)) && !queue_empty(&as->queue)) {
   220			event = queue_get_event(&as->queue);
   221	
   222			ret = -EFAULT;
 > 223			if (!copy_to_iter_full(&event, sizeof(event), to))
   224				break;
   225	
   226			mutex_lock(&state_lock);
   227			if (as->suspend_state == SUSPEND_PENDING &&
   228			    (event == APM_SYS_SUSPEND || event == APM_USER_SUSPEND))
   229				as->suspend_state = SUSPEND_READ;
   230			mutex_unlock(&state_lock);
   231	
   232			i -= sizeof(event);
   233		}
   234	
   235		if (i < count)
   236			ret = count - i;
   237	
   238		return ret;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
