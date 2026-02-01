Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE2748F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769920486; cv=none; b=Rze2XOmgBm8FPEBAptzW7z2NSntunWokIfvoBjsus1bKCxCqvnberEwJhJm9SVLFHoMbTtIshwL+6y3yCSzqhkiqjHG8LIGTBDLMIBpwC4cmjmErI9WRoY3kbI+wE5grRnEN1rnNXIviXgo7QJ/htWSIxUKkqHyrzu5Wge9U/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769920486; c=relaxed/simple;
	bh=Ly78l8r6OrPbDTJiGKWWCfFiJJ4Fmd6lhNx6/6Ew2d0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MN7PkTGRJfNQRE43mb57wB83zcqfUoSbHKqHmoL50x6UgMfuE0V0/YcOdLwBP4WEk6d3svvtgC1On7EJtTXeyhZQkO/PwSzswTfw/rEdoZbkVXz3wdBz3XiHhMQQUkysdt/J/imLJ2XPtqbrgFIOcmxcB2DGWPFAVXey5UnbO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0uJfY27; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0uJfY27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769920483; x=1801456483;
  h=date:from:to:cc:subject:message-id;
  bh=Ly78l8r6OrPbDTJiGKWWCfFiJJ4Fmd6lhNx6/6Ew2d0=;
  b=Z0uJfY27q3GOnXN08kmy1HHLHFb/T/YZ8IdYzAJIfJ+M4JYCC/GYuLzx
   Jzt6iFSYftN5RbzwWJAZrUa7rbfQUVG/QWRtZzfXcqzjKPn6JnEfCiBPY
   Hnc5+P+U86YqKNBiUi90aX0AwoYCqCSNyPR3RJ+khe0TpT05mCyGH8CUr
   fjF/SDCrb8Px3dwIXvzaz6I20gYNevQDVa3YHyILW/m94i5unp2OJWbMH
   VDSG4QwqsBs2rdcQohFTEzv5E3dY7+QiOuNbmwDI79orR73LGKg8g62LD
   tj7nuUrULjb5RuDTzx9rj6rOu4DcYWYYtWZgxG2HBt1zWCPDstUN33qEX
   A==;
X-CSE-ConnectionGUID: XTf3UMMiSyiEpLNrQYnd1Q==
X-CSE-MsgGUID: njN3f3fyS/+WY7X6fnTWWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71016201"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71016201"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 20:34:43 -0800
X-CSE-ConnectionGUID: +nQjz2tdSROeLL6u/rF59g==
X-CSE-MsgGUID: EIkv1fLXR3S8HV5KdrTYZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213283556"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2026 20:34:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmPAV-00000000eau-0feM;
	Sun, 01 Feb 2026 04:34:39 +0000
Date: Sun, 01 Feb 2026 12:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/vcam.c:951:8-15:
 WARNING opportunity for memdup_user
Message-ID: <202602011241.YycZovmA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   2c2a1f8e5241d2c364fb58d6aaa19ada98633d5d
commit: 69ae98db254acb129ae9aba03b71dcd557141221 [5/5] media: Virtual camera driver
config: xtensa-randconfig-r053-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011241.YycZovmA-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011241.YycZovmA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/vcam.c:951:8-15: WARNING opportunity for memdup_user
--
>> drivers/media/vcam.c:661:30-31: WARNING opportunity for swap()

vim +951 drivers/media/vcam.c

   922	
   923	static long vcam_ioctl_common(struct file *file, unsigned int cmd,
   924				      unsigned long arg)
   925	{
   926		void __user *argp = (void __user *)arg;
   927		void *karg;
   928		size_t size;
   929		long ret;
   930	
   931		switch (cmd) {
   932		case VCAM_IOC_QUEUE:
   933			size = sizeof(struct vcam_ioc_queue);
   934			break;
   935		case VCAM_IOC_DEQUEUE:
   936			size = sizeof(struct vcam_ioc_dequeue);
   937			break;
   938		case VCAM_IOC_STATUS:
   939			size = sizeof(__u64);
   940			break;
   941		case VCAM_IOC_WAIT:
   942			size = sizeof(struct vcam_ioc_wait);
   943			break;
   944		default:
   945			return -ENOTTY;
   946		}
   947	
   948		if (size > SZ_4K)
   949			return -ENOTTY;
   950	
 > 951		karg = kzalloc(size, GFP_KERNEL);
   952		if (!karg)
   953			return -ENOMEM;
   954	
   955		if (copy_from_user(karg, argp, size)) {
   956			ret = -EFAULT;
   957			goto out_free;
   958		}
   959	
   960		ret = vcam_output_ioctl_core(file, cmd, karg);
   961		if (ret)
   962			goto out_free;
   963	
   964		if (copy_to_user(argp, karg, size)) {
   965			ret = -EFAULT;
   966			goto out_free;
   967		}
   968	
   969		ret = 0;
   970	out_free:
   971		kfree(karg);
   972		return ret;
   973	}
   974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
