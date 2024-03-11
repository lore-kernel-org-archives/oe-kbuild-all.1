Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEFC629
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 00:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710117448; cv=none; b=OrnStGfq9yY63KC1ZD4bMxSL+F5foCAVOIGh+cEIv/hdWkFM0OklRIfLCbZxr1ua25AxlZMcJnGtAgZBkkczYcs893dQ9H3z8HPK/NAZ/DuaVMTOal7DceR5cm2k7ocLamyAnXIsz9eMBbgg3Sg3tEDdIBwcC8IjCXuxpTr8tPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710117448; c=relaxed/simple;
	bh=7GDK13lqvCUCCShtW48228Q8sR3YRirbz/mGxVI6XoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kubu0ptaYQAVvXZTCQdtUZjpleNzPA3+uBT0JAUE840+1fGol5KShpTUzVZwIJLXxjSUFhS2ke1cPVg5+yotvgPtQ2PunYhI6DcRyzSeXKAaqFHFaRDLGJQivhCg95Z4I3Mxl7pKQRgJRzN4PC4xtvcgEjtc81hlRgRBNyMUphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3a0E4zE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3a0E4zE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710117446; x=1741653446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GDK13lqvCUCCShtW48228Q8sR3YRirbz/mGxVI6XoI=;
  b=T3a0E4zEsR/NpliYtEs+b7XJGiKnva4rGM9++gODTElNZ9RTlMM8eDKF
   rL6MDYbqYgHdMWIuwiNP8UCRVRVurUydJsI99FDvEJpp6RvTipWJU5UL6
   xrtFFRxJ8E2ftNzLrFXEraOdC3rWQOZhQFnU0XFp4hKXg+WvINIo0DuGY
   Bh1gAhNdCOS2J+6t3XfCTUvOMP+JOXk9bLX3lyCBA+3Fq4wQ2UTvUYCDQ
   PQizmlqL97i93bUuCgMWN6QtKrpIbijSX5ss2mqU02fpLoMmpfChXWxTt
   4diU6bUu6tYtiJRomU2AKXKpZ2pp/PN2rwEAh1mMy0+g1SRJK+rdMeRn4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15407016"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15407016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 17:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="10914887"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2024 17:37:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjTfL-0008kx-1p;
	Mon, 11 Mar 2024 00:37:19 +0000
Date: Mon, 11 Mar 2024 08:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26617/27506]
 kernel/cgroup/cgroup.c:6267:6: sparse: sparse: symbol 'cgroup_css_set_fork'
 was not declared. Should it be static?
Message-ID: <202403110816.RdOsnC4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: d59852078d94c8512772bc9bd5086b675797e73a [26617/27506] sched_fork: Fix race between cgroup_migrate and sched_fork
config: x86_64-randconfig-123-20240305 (https://download.01.org/0day-ci/archive/20240311/202403110816.RdOsnC4o-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110816.RdOsnC4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110816.RdOsnC4o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/cgroup.c:6267:6: sparse: sparse: symbol 'cgroup_css_set_fork' was not declared. Should it be static?
>> kernel/cgroup/cgroup.c:6275:6: sparse: sparse: symbol 'cgroup_css_put_fork' was not declared. Should it be static?
   kernel/cgroup/cgroup.c:3120:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit

vim +/cgroup_css_set_fork +6267 kernel/cgroup/cgroup.c

  6266	
> 6267	void cgroup_css_set_fork(struct kernel_clone_args *kargs)
  6268	{
  6269		spin_lock_irq(&css_set_lock);
  6270		kargs->cset = task_css_set(current);
  6271		get_css_set(kargs->cset);
  6272		spin_unlock_irq(&css_set_lock);
  6273	}
  6274	
> 6275	void cgroup_css_put_fork(struct kernel_clone_args *kargs)
  6276	{
  6277		struct css_set *cset;
  6278	
  6279		cset = kargs->cset;
  6280		kargs->cset = NULL;
  6281		if (cset)
  6282			put_css_set(cset);
  6283	}
  6284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
