Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92B236F8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909741; cv=none; b=KW8Z9YSrQcrUvkS44QMTAFtVLOunem5ckC9cHi8TfbbsCemacut4Lt+he1VsIm5lGZafzMX/Ow8i5Oaok/a1dTro4ff3e06B0YYFyNsNvFjSyWdPl/rCQOLnmLbHXkpqaAy1NOQ1nWYM4wq8CmF7x7WmQe9iVofsyLVtLsnMfII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909741; c=relaxed/simple;
	bh=825aW6lHt4c0dXnjzL+hNnkzNbLoPtKheCFyHT2FLkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYPXBE4EeVCJP0hsEcfpCrrLHH/bwLnIP5XT9HIpMwEHwX/MTCqBwDmj0MvDinBOImgav/JPAx6hpkabSR52recrDSs58Qo5Wvvt9rYW+HsGsc0sjItKefmt91Rs9bgk8WajV4YlcLTxonygRMzxErsne3LnORQybwPpkzmB9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1nj9460; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1nj9460"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733909739; x=1765445739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=825aW6lHt4c0dXnjzL+hNnkzNbLoPtKheCFyHT2FLkk=;
  b=H1nj9460Ns9BgsbkglMpZZb+Nal7FfzKxkQHhGfw8vLsRSfl4KXq+AN6
   VeTxWW8koUMDKXAkEG9+4Ml9ImBlpzW0tH6RW5/I0/D5nQpvZjcKeH9ga
   x+xzel9OaZIr45O3O/aXcW9+tWC43zJ6sIxQeXMGy3rh4Ne0bpZbqL9vE
   347Ifo0sscQQC0dAQSF0VGwWV5s9jEDR4l97CyuW8u7QrQnkZ7f5mbIsU
   JL4oLjnCo9EOSkv4wG9NBXP7jrT2KPD9ErkyJrgwNK/xqzkuruuHa+7Yc
   IsSmvdWe0coEq1bMuxCH4OJN8M0c8RXWcLblwTtDFaV1D52AHDDtXLSlB
   g==;
X-CSE-ConnectionGUID: tiFUBbN4SDG4ucB/AM2s4w==
X-CSE-MsgGUID: QnlMZndPTneK5kFDUoIP8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34183739"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34183739"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:35:38 -0800
X-CSE-ConnectionGUID: RaXaPv1fRM2OEav3VwgCjw==
X-CSE-MsgGUID: Zyg6iXcxSwqDC3AegWV7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95932760"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2024 01:35:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLJ83-0006Ut-1K;
	Wed, 11 Dec 2024 09:35:35 +0000
Date: Wed, 11 Dec 2024 17:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:2611:3: warning: unannotated
 fall-through between switch labels
Message-ID: <202412111750.wKcr9GI6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   a3f82e653c46a6e972edb5f623ab83190db10758
commit: a3f82e653c46a6e972edb5f623ab83190db10758 [2/2] media: v4l2-loopback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241211/202412111750.wKcr9GI6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111750.wKcr9GI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111750.wKcr9GI6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-loopback.c:11:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-loopback.c:2611:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2611 |                 case 0:
         |                 ^
   drivers/media/v4l2-core/v4l2-loopback.c:2611:3: note: insert 'break;' to avoid fall-through
    2611 |                 case 0:
         |                 ^
         |                 break; 
   5 warnings generated.


vim +2611 drivers/media/v4l2-core/v4l2-loopback.c

  2587	
  2588	static long v4l2l_control_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  2589	{
  2590		char vdev_name[sizeof_field(struct video_device, name)];
  2591		struct v4l2_loopback_add add;
  2592		char __user *vdev_name_user;
  2593		bool exclusive_caps = false;
  2594		int ret;
  2595	
  2596		pr_info("%s: enter", __func__);
  2597	
  2598		ret = mutex_lock_killable(&v4l2l_ctl_mutex);
  2599		if (ret)
  2600			return ret;
  2601	
  2602		switch (cmd) {
  2603		case V4L2_LOOPBACK_IOC_ADD:
  2604			ret = copy_from_user(&add, (void __user *)arg, sizeof(add));
  2605			if (ret < 0)
  2606				break;
  2607	
  2608			switch (add.flags) {
  2609			case 1:
  2610				exclusive_caps = true;
> 2611			case 0:
  2612				break;
  2613			default:
  2614				return -EINVAL;
  2615			}
  2616	
  2617			if (add.device_nr)
  2618				return -EINVAL;
  2619	
  2620			if (add.driver_fd)
  2621				return -EINVAL;
  2622	
  2623			vdev_name_user = (char __user *)add.name;
  2624			ret = strncpy_from_user(vdev_name, vdev_name_user, sizeof(vdev_name) - 1);
  2625			if (ret < 0)
  2626				return -EFAULT;
  2627	
  2628			ret = v4l2_loopback_add(&add, vdev_name, exclusive_caps);
  2629			if (ret < 0)
  2630				break;
  2631	
  2632			ret = copy_to_user((void __user *)arg, &add, sizeof(add));
  2633			if (ret < 0)
  2634				break;
  2635	
  2636			ret = 0;
  2637			break;
  2638		default:
  2639			ret = -ENOIOCTLCMD;
  2640			break;
  2641		}
  2642	
  2643		mutex_unlock(&v4l2l_ctl_mutex);
  2644		return ret;
  2645	}
  2646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
