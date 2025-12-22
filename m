Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2833002A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766436649; cv=none; b=rnvMsdNml0L7SckZX5FK0zVXXi7XaE47aX4mCCbY2pqnyhcXojSDzocrEfDbLTj+rhB2f6ihg1G6oZdEIgyo55FQZoL4TCJutQgGUyTkUFIZ8c7w2ukk5RKrIJmlV0VVjWkKgBkVDyg5waTSb77iMrOxZNhQoaoodJWVBfQw6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766436649; c=relaxed/simple;
	bh=uHp7h1fEpw0c08+tqRZYe8N/VLup4PZJkQO63AwDC0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9YKs5Lnb1jKhopqxHFGiohW/Beym5Y17lMlePKzzgQOt1Z+Lme2GSwldZVNb5XuwOW/3rdSj7/TlwfQroeyTURrjtAozBE+VDTM+rbwAyx2VjvEwHVRS/jnrlbLkVRz/vLsTIoOZG5dyzVddfho3TelHcWwGHHofRkMUBKmVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht3FucGb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht3FucGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766436648; x=1797972648;
  h=date:from:to:cc:subject:message-id;
  bh=uHp7h1fEpw0c08+tqRZYe8N/VLup4PZJkQO63AwDC0c=;
  b=ht3FucGbzPqhIAbIYT3SLAXszAdxMJkAvYpAh1Rd/pnL7NtGK0gyK0Kv
   hw0//0xZVv7EqTVReNKtoEoMFui3hIvtJEOMVEhMmEVG9yx99VyMaS+kG
   /sWlui0pwgsQoQqyKHLL/bx3FC7haoP4aj3/vKXHkpijeieYInTVKfRqE
   w8JRGrtuwIoYRRnjX86MckE+Vfsx/GHU4GEqsmUVyWXd7P3F0ZwYg+vZB
   8AQDMCMp+ZBP0NYJOn3XWDgoT28uRfS643GkeqU/pbLW7S/VKyU1Oghes
   g7f+Bo8EkjHJLO73stnZlwlrAEKZe5zY7AhuEgxFJH8HKmtn2MRUybskw
   g==;
X-CSE-ConnectionGUID: em+k86o/TXm8bGtQt/NL8w==
X-CSE-MsgGUID: +/l95s53TnunZRmPg+xzGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70871961"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="70871961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 12:50:47 -0800
X-CSE-ConnectionGUID: bLGSa/1BSoCqrhHcaz8m3g==
X-CSE-MsgGUID: oHWBcvUFS0yYrEShh+KXFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204139500"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 12:50:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXmrU-00000000163-35xR;
	Mon, 22 Dec 2025 20:50:38 +0000
Date: Tue, 23 Dec 2025 04:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-Uncore-sysfs-ANBZ26617 8/8]
 drivers/vfio/vfio_main.c:1313:21: warning: no previous prototype for
 'vfio_device_from_file'
Message-ID: <202512230449.iU6vliP2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ankit,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-Uncore-sysfs-ANBZ26617
head:   babddf073bda0b52417e2d69011dc41f21b7eb20
commit: 1927abdd408e097dbc683767690cbbb2d4d574ad [8/8] NVIDIA: SAUCE: vfio/nvgrace-gpu: register device memory for poison handling
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251223/202512230449.iU6vliP2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230449.iU6vliP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230449.iU6vliP2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1313:21: warning: no previous prototype for 'vfio_device_from_file' [-Wmissing-prototypes]
    1313 | struct vfio_device *vfio_device_from_file(struct file *file)
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +/vfio_device_from_file +1313 drivers/vfio/vfio_main.c

  1312	
> 1313	struct vfio_device *vfio_device_from_file(struct file *file)
  1314	{
  1315		struct vfio_device_file *df = file->private_data;
  1316	
  1317		if (file->f_op != &vfio_device_fops)
  1318			return NULL;
  1319		return df->device;
  1320	}
  1321	EXPORT_SYMBOL_GPL(vfio_device_from_file);
  1322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
