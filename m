Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451361D63C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733514015; cv=none; b=Jq7uRatbGxWFB8MUtRv8isHhkdKR1zQFuoo69YG6PM3ZoG7FhpaZEzRninPI927ASv42BGwzHRgDOuhbnTwRp/oytDysEIrojQ5WOUgS761atu/4gmVwBizysdGWMccNrrUBzI8xtu6OC9kBDNaCcTDrzOVTgzcVCSVFNzZRLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733514015; c=relaxed/simple;
	bh=Zh6Bt3A/Sc0s/2wc0zaqlXL4Cv1NhQAfBtFf1htJuj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAyRhNNUeUooRDS+WBwkUU9RRXwffCjVwBewfbrn0ck8/baVQb5tB85UV20dtRgI/Mc9op7lWnAeMbwH+F9DVEZ/nR2vWq9xDqPr0jjkoOfhlXGZBcLBC49FwxPTIfEZSwxSHQe+QxvmkWwSEyFAontPBmlP+vdnFMBxe9H4grQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iuw1mPJU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iuw1mPJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733514014; x=1765050014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zh6Bt3A/Sc0s/2wc0zaqlXL4Cv1NhQAfBtFf1htJuj8=;
  b=Iuw1mPJU0hzujN7APwNqV3gjC9zpmuI8pEHdse7R6JTpvPsvW9TB9798
   lYREnz4E742tm48NGWKLMJkFLc9M7SWlQ/6l9QrNSxjRZFReaAkEZ9LGM
   RXyzkTPQJNh2/09O+SO1OYakqAZUjm+YfzrPrcBFfFp9uwAzy0ImN6JtN
   YVWyYiX1Z+bWqrMmUPWYkS4CU6EYu0gcBaYZhM8H0zSDk3EnkbK2BQwvt
   6HZk/8WxxYSWqtpO74SoM2yFgXUeac3dbE4rSVMnuoONxD1QsZhM/X3UZ
   jUVWhHacOConmpJp7t3dxCtCDc3EsrdRZ4D6rphY+44X7mMwIDHeFqO9g
   Q==;
X-CSE-ConnectionGUID: hZpptuq1TDahuZHUC2/MqQ==
X-CSE-MsgGUID: P+9jTYvsRYeMdhEVEr3eeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33803799"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="33803799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 11:40:14 -0800
X-CSE-ConnectionGUID: 1s8AYjSGTayPHaDBX/00oA==
X-CSE-MsgGUID: WzEGyG8XTZSbciYxLNiLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="94861247"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Dec 2024 11:40:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJeBO-0002Ct-0d;
	Fri, 06 Dec 2024 19:40:10 +0000
Date: Sat, 7 Dec 2024 03:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 1/2]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 'update_suspend_time'
Message-ID: <202412070322.5wdqeaH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   195d9cb705b62681ea7f7d60f84ad75dfacdb871
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070322.5wdqeaH3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070322.5wdqeaH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070322.5wdqeaH3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for 'update_suspend_time' [-Wmissing-prototypes]
      49 | void update_suspend_time(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/update_suspend_time +49 drivers/virtio/virtio_pvclock.c

    48	
  > 49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
    77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
