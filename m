Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E872D480E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761683407; cv=none; b=UcfBeYrZbywgMB/fJvf8A8Zwgvz8VPEtj4JyNqpemjnSe2m998stAVzdvLsMd1Pn9S0zWyOyx+n7iA6s4dI+y0iRjPtl3/A+MXhCrzhEi89Ooz0L9LRwpV6fSHL9lSBCa2La5wvCpgVCmKAvcGxik3dgl9jUJaAd7jl7rUJed0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761683407; c=relaxed/simple;
	bh=htPWLU9ruxkFQc5kWOd8u1qo6wpGp5XI89LIpSchg7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNXbZgCzwfFya61H89eP+O+zYuRDG8ERbwqAs+5V2mXpwFEWV6/seNpB53cV2kABq1ODjUTtvc3SFTfaQg7sQLACnGfFP6agXuJjMTq66lZhCwYM187ExoQFd91F6bXMyJepaBXicFzARkg7IYekJfLh19S1z70obKCePIEGG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kj6WjXgI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kj6WjXgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761683407; x=1793219407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htPWLU9ruxkFQc5kWOd8u1qo6wpGp5XI89LIpSchg7s=;
  b=kj6WjXgIF0t1+uJEu2DPVfp0P6GejeEz4MowRs9Gmc60E0JZOj0sH5s4
   8UtQk9RlKW05YdaNAhpZ2TpTTVrq+SG4gJ8qq7brT4wyGs6wUeB7mF/ck
   VTxpTmqylh82OdTSJKKOpWKJmCkpdXx3Kc4jfyp4WJPbL/jYisvuVCdJp
   65Y8zpiu+3BTgDG6aLcIMVzncln9I/xJy9mAGqABL5T+XzCqd3mALV4GI
   bKHW0EiDd6R5JW/6Yon8IZ/2RN0VbxxEIbCAGbeIo1FUvuMTcrSTvDPs7
   CW0Ig/EO3ZduyKBXSzA5tCzdeQxYtQZw4Hz3FskwWESXlHCnXH+uXS+2E
   g==;
X-CSE-ConnectionGUID: m63l+soiSimQi5lksz50fw==
X-CSE-MsgGUID: OAarxv7kRFOqQtkcpJr8UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67634399"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67634399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 13:30:06 -0700
X-CSE-ConnectionGUID: a+Ou98cPR1asPzSaqz58OQ==
X-CSE-MsgGUID: AWYM1XgYTwquVB7uB2S+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185792325"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2025 13:30:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDqKQ-000Jj7-0B;
	Tue, 28 Oct 2025 20:30:02 +0000
Date: Wed, 29 Oct 2025 04:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 6/16]
 drivers/virtio/virtio_msg_user.c:67:8-15: WARNING opportunity for
 memdup_user
Message-ID: <202510290452.fvmNDn3t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   27143c677cd93a347826a8702540f4b7cdb0d14e
commit: a4d343e030bf285d7a9a48c801fa5424d5ca6eaa [6/16] virtio-msg: Add support for loopback bus
config: mips-randconfig-r062-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290452.fvmNDn3t-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290452.fvmNDn3t-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_user.c:67:8-15: WARNING opportunity for memdup_user

vim +67 drivers/virtio/virtio_msg_user.c

9574f8bb21551e Viresh Kumar 2024-11-26  53  
9574f8bb21551e Viresh Kumar 2024-11-26  54  static ssize_t vmsg_miscdev_write(struct file *file, const char __user *buf,
9574f8bb21551e Viresh Kumar 2024-11-26  55  				  size_t count, loff_t *pos)
9574f8bb21551e Viresh Kumar 2024-11-26  56  {
9574f8bb21551e Viresh Kumar 2024-11-26  57  	struct miscdevice *misc = file->private_data;
9574f8bb21551e Viresh Kumar 2024-11-26  58  	struct virtio_msg_user_device *vmudev = to_virtio_msg_user_device(misc);
9574f8bb21551e Viresh Kumar 2024-11-26  59  	struct virtio_msg *vmsg __free(kfree) = NULL;
9574f8bb21551e Viresh Kumar 2024-11-26  60  
9574f8bb21551e Viresh Kumar 2024-11-26  61  	if (count < VIRTIO_MSG_MIN_SIZE) {
9574f8bb21551e Viresh Kumar 2024-11-26  62  		dev_err(vmudev->parent, "Trying to write message of incorrect size: %zu\n",
9574f8bb21551e Viresh Kumar 2024-11-26  63  			count);
9574f8bb21551e Viresh Kumar 2024-11-26  64  		return 0;
9574f8bb21551e Viresh Kumar 2024-11-26  65  	}
9574f8bb21551e Viresh Kumar 2024-11-26  66  
9574f8bb21551e Viresh Kumar 2024-11-26 @67  	vmsg = kzalloc(count, GFP_KERNEL);
9574f8bb21551e Viresh Kumar 2024-11-26  68  	if (!vmsg)
9574f8bb21551e Viresh Kumar 2024-11-26  69  		return 0;
9574f8bb21551e Viresh Kumar 2024-11-26  70  
9574f8bb21551e Viresh Kumar 2024-11-26  71  	if (copy_from_user(vmsg, buf, count) != 0)
9574f8bb21551e Viresh Kumar 2024-11-26  72  		return 0;
9574f8bb21551e Viresh Kumar 2024-11-26  73  
9574f8bb21551e Viresh Kumar 2024-11-26  74  	vmudev->ops->handle(vmudev, vmsg);
9574f8bb21551e Viresh Kumar 2024-11-26  75  
9574f8bb21551e Viresh Kumar 2024-11-26  76  	/* Wake up the handler only for responses */
9574f8bb21551e Viresh Kumar 2024-11-26  77  	if (vmsg->type & VIRTIO_MSG_TYPE_RESPONSE)
9574f8bb21551e Viresh Kumar 2024-11-26  78  		complete(&vmudev->w_completion);
9574f8bb21551e Viresh Kumar 2024-11-26  79  
9574f8bb21551e Viresh Kumar 2024-11-26  80  	return count;
9574f8bb21551e Viresh Kumar 2024-11-26  81  }
9574f8bb21551e Viresh Kumar 2024-11-26  82  

:::::: The code at line 67 was first introduced by commit
:::::: 9574f8bb21551e50de5c2a1dc4023a3e0cae09b5 virtio-msg: Add optional userspace interface for message I/O

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
