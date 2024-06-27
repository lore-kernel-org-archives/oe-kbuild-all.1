Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA959196D9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504776; cv=none; b=ZqxvcyRToZeADAEZXpfLEmoHGF8+tyFjxWymAqy3Y001SPFGJVLYezin9NErV5B4J26Q6NdJk6/+k4X6SaF4/QVX95VnX5y47BX69V/07TewUWS2Ism5dWFAtAZMdT5nrC2yqpf343QRQG5S+NLycjSXxdMQwtWzaRoG8cseJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504776; c=relaxed/simple;
	bh=lVwymRTAkXkRP8EJadrKbFks6VbP5wd9zzubHE/h2U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONg3akmyRH6MDBLhdSNEcLAYUnPtUclXsVE9O1QCvJXkFYnPeitHePUbsYVGik8B0+ykiwVXcEXpm1Kn0QEEPopZjObP5x5SHXvmk1ZD5fF57ro3zbTfR7g4PzwsTlZn+bpyis7F0zf7/MVLi34E3VosF0ZEr61chgBm90PUg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKgIVt+Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKgIVt+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719504775; x=1751040775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVwymRTAkXkRP8EJadrKbFks6VbP5wd9zzubHE/h2U4=;
  b=VKgIVt+ZYs9CT6MewwGomDcmKoXksv9nbcnkJXLzldduddh+JwI1Gtw8
   XmWbz0geEsB54vlKAQ4vPjxHiudMLHaueFeKAnPw0tcxA17OqGBfDroF3
   fX+q03X+f9lmbXJwxzxhNKFMk3iB3aMQm990mEbQl2ZKQm0vmrU25umSh
   3XoWh/McO8okZAAWtSBaJAVfzf76zAbtY/4TfkBx9Mi5lELceBpLyI73R
   UEb3QJqv7StPuTI5MGLAkDBHQfN3Xe0LZ3swd48Xyn+8NhjSyx82PARG8
   VzKy/iPm9tUfmdRo6TssGeLz9AznwoCGuOFwh5dmFCQGvZX/cmabEgAFI
   Q==;
X-CSE-ConnectionGUID: qkSvSIK3STKWF2KEvd7aXw==
X-CSE-MsgGUID: KkoomSFIQ2OGlnNqZxtoag==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16485329"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16485329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 09:12:55 -0700
X-CSE-ConnectionGUID: 8BDKGnrwTjyUxsAeKt7jYw==
X-CSE-MsgGUID: 9ExfgNUOQJ2kyBdJW2lOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="67640410"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2024 09:12:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMrjv-000GKc-0H;
	Thu, 27 Jun 2024 16:12:51 +0000
Date: Fri, 28 Jun 2024 00:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6881/8719] drivers/gpu/drm/msm/msm_gem.c:51:43:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202406280050.syeEwLTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 204226de27c3a6328b155005f132afe12eca3a5e [6881/8719] drm/msm: Add GPU memory traces
config: powerpc64-randconfig-r132-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280050.syeEwLTE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240628/202406280050.syeEwLTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280050.syeEwLTE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/msm_gem.c:51:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct pid *pid @@     got struct pid [noderef] __rcu *pid @@
   drivers/gpu/drm/msm/msm_gem.c:51:43: sparse:     expected struct pid *pid
   drivers/gpu/drm/msm/msm_gem.c:51:43: sparse:     got struct pid [noderef] __rcu *pid
   drivers/gpu/drm/msm/msm_gem.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +51 drivers/gpu/drm/msm/msm_gem.c

    44	
    45	static void update_ctx_mem(struct drm_file *file, ssize_t size)
    46	{
    47		struct msm_file_private *ctx = file->driver_priv;
    48		uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
    49	
    50		rcu_read_lock(); /* Locks file->pid! */
  > 51		trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
    52		rcu_read_unlock();
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
