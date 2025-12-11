Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2FB2749ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453502; cv=none; b=mOjWMxpCf7k+BhsVzKIvVYVMFVa82lgA52LqVPzn5q36aGwwGT0mhoAhRTlO92I4TDYXx/qkJr3zpxtHDQWEpaFJt6RSFdBicsLA/q4FEo3wusH8gtbRfTxeR+Cwspg5L91MnQrWBOISyHNZdSq5r7lX+WajO5CqakoCbh01ajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453502; c=relaxed/simple;
	bh=nVUKLvMUmEf4K0AJohepc5AryJj6CZwx/qjRvApC5CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J92izuvrV7qcOQuUJy8tRtZPTZYa5n9phwsWlWG3P8g2GrO/kAZoS8+7y5tqs026PqhmjkaL+A5OamsvhZEo7j+rsdlyN9gEapInR6ZqIeOkHs3WtdWOwPUaHr3rWtHzSwlU47zDQTqwHvIrAuu0Ga9DB6KPcPr3eq+eO23zJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHi3V3Ip; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHi3V3Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765453500; x=1796989500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVUKLvMUmEf4K0AJohepc5AryJj6CZwx/qjRvApC5CY=;
  b=iHi3V3IpK3Xt382Nvj36AR3rZuc6bJQedZiG80GXEMj1+BL6e0Jivi3O
   2Jgu0skAwNRFvs20UQfNBHxUoZBVdsbfBFCbMMffQ8trp5PRwqRH9I+mM
   cKbWhnyEhxnk8t/4Gn45K9pgccrjqaBAfS78G6Gezf0hfpyfFK6W/Wzu3
   LwiRI7A7AoGB34P+Nxm78qne9hwvFbTjXL0b+843JweL0VzRf2co4Jqnw
   Lanhs9fvXz4IQjUxlRpa9YhN45bhdMGO5HGIJyP1xA1zhLcfZbvBqxmnC
   1Nq1VBeAapfMeIy8WOoz6VY+1braQ138j6cVRoC5TVIE5Wf7wC88+lvSP
   w==;
X-CSE-ConnectionGUID: H5rLuzEfQq6fDwAhSF9JDw==
X-CSE-MsgGUID: FO8JctefT8e1HK/v+zxBoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78897007"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78897007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:44:59 -0800
X-CSE-ConnectionGUID: +KeHCpkmSxKLDmsRlT5i2A==
X-CSE-MsgGUID: HYkcsyZ+SIOEey6l60LzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201202089"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 03:44:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTf6N-000000004ar-3FCh;
	Thu, 11 Dec 2025 11:44:55 +0000
Date: Thu, 11 Dec 2025 19:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 7/17]
 drivers/virtio/virtio_msg_user.c:137:66: warning: '%d' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 4
Message-ID: <202512111900.IuJgHf0j-lkp@intel.com>
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
head:   6a007d44ffbf10a2ce4786c5eb4788234701929c
commit: deb6b330c36cc9636b7381cc97a8517845ed530f [7/17] virtio-msg: Add loopback bus for testing
config: sparc64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111900.IuJgHf0j-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111900.IuJgHf0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111900.IuJgHf0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_msg_user.c: In function 'virtio_msg_user_register':
>> drivers/virtio/virtio_msg_user.c:137:66: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     137 |         snprintf(vmudev->name, sizeof(vmudev->name), "virtio-msg-%d", id);
         |                                                                  ^~
   drivers/virtio/virtio_msg_user.c:137:54: note: directive argument in the range [0, 2147483647]
     137 |         snprintf(vmudev->name, sizeof(vmudev->name), "virtio-msg-%d", id);
         |                                                      ^~~~~~~~~~~~~~~
   drivers/virtio/virtio_msg_user.c:137:9: note: 'snprintf' output between 13 and 22 bytes into a destination of size 15
     137 |         snprintf(vmudev->name, sizeof(vmudev->name), "virtio-msg-%d", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +137 drivers/virtio/virtio_msg_user.c

4fd3334eb92aab Viresh Kumar 2024-11-26  103  
4fd3334eb92aab Viresh Kumar 2024-11-26  104  /**
4fd3334eb92aab Viresh Kumar 2024-11-26  105   * virtio_msg_user_register - Register a user-space accessible virtio message device
4fd3334eb92aab Viresh Kumar 2024-11-26  106   * @vmudev: Pointer to the virtio message user device
4fd3334eb92aab Viresh Kumar 2024-11-26  107   *
4fd3334eb92aab Viresh Kumar 2024-11-26  108   * Initializes and registers a user-accessible virtio message device as a `misc`
4fd3334eb92aab Viresh Kumar 2024-11-26  109   * character device. Upon successful registration, the device appears in
4fd3334eb92aab Viresh Kumar 2024-11-26  110   * userspace as `/dev/virtio-msg-N` where `N` is a unique identifier assigned at
4fd3334eb92aab Viresh Kumar 2024-11-26  111   * runtime.
4fd3334eb92aab Viresh Kumar 2024-11-26  112   *
4fd3334eb92aab Viresh Kumar 2024-11-26  113   * The resulting device node allows user-space interaction with the virtio
4fd3334eb92aab Viresh Kumar 2024-11-26  114   * message transport.
4fd3334eb92aab Viresh Kumar 2024-11-26  115   *
4fd3334eb92aab Viresh Kumar 2024-11-26  116   * Return: 0 on success, or a negative error code on failure.
4fd3334eb92aab Viresh Kumar 2024-11-26  117   */
4fd3334eb92aab Viresh Kumar 2024-11-26  118  int virtio_msg_user_register(struct virtio_msg_user_device *vmudev)
4fd3334eb92aab Viresh Kumar 2024-11-26  119  {
4fd3334eb92aab Viresh Kumar 2024-11-26  120  	int ret, id;
4fd3334eb92aab Viresh Kumar 2024-11-26  121  
4fd3334eb92aab Viresh Kumar 2024-11-26  122  	if (!vmudev || !vmudev->ops)
4fd3334eb92aab Viresh Kumar 2024-11-26  123  		return -EINVAL;
4fd3334eb92aab Viresh Kumar 2024-11-26  124  
4fd3334eb92aab Viresh Kumar 2024-11-26  125  	id = ida_alloc(&device_ids, GFP_KERNEL);
4fd3334eb92aab Viresh Kumar 2024-11-26  126  	if (id < 0)
4fd3334eb92aab Viresh Kumar 2024-11-26  127  		return id;
4fd3334eb92aab Viresh Kumar 2024-11-26  128  
4fd3334eb92aab Viresh Kumar 2024-11-26  129  	init_completion(&vmudev->completion);
4fd3334eb92aab Viresh Kumar 2024-11-26  130  	init_waitqueue_head(&vmudev->wait);
4fd3334eb92aab Viresh Kumar 2024-11-26  131  
4fd3334eb92aab Viresh Kumar 2024-11-26  132  	vmudev->id = id;
4fd3334eb92aab Viresh Kumar 2024-11-26  133  	vmudev->misc.parent = vmudev->parent;
4fd3334eb92aab Viresh Kumar 2024-11-26  134  	vmudev->misc.minor = MISC_DYNAMIC_MINOR;
4fd3334eb92aab Viresh Kumar 2024-11-26  135  	vmudev->misc.fops = &vmsg_miscdev_fops;
4fd3334eb92aab Viresh Kumar 2024-11-26  136  	vmudev->misc.name = vmudev->name;
4fd3334eb92aab Viresh Kumar 2024-11-26 @137  	snprintf(vmudev->name, sizeof(vmudev->name), "virtio-msg-%d", id);
4fd3334eb92aab Viresh Kumar 2024-11-26  138  
4fd3334eb92aab Viresh Kumar 2024-11-26  139  	ret = misc_register(&vmudev->misc);
4fd3334eb92aab Viresh Kumar 2024-11-26  140  	if (ret) {
4fd3334eb92aab Viresh Kumar 2024-11-26  141  		ida_free(&device_ids, id);
4fd3334eb92aab Viresh Kumar 2024-11-26  142  		return ret;
4fd3334eb92aab Viresh Kumar 2024-11-26  143  	}
4fd3334eb92aab Viresh Kumar 2024-11-26  144  
4fd3334eb92aab Viresh Kumar 2024-11-26  145  	return 0;
4fd3334eb92aab Viresh Kumar 2024-11-26  146  }
4fd3334eb92aab Viresh Kumar 2024-11-26  147  EXPORT_SYMBOL_GPL(virtio_msg_user_register);
4fd3334eb92aab Viresh Kumar 2024-11-26  148  

:::::: The code at line 137 was first introduced by commit
:::::: 4fd3334eb92aab4b3379d4c7c540747154b55fe0 virtio-msg: Add optional userspace message I/O interface

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
