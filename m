Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1E2BEC26
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 05:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763960992; cv=none; b=PNi+6B6OVwc8oYTLG6O4gzP6qegel/AJxl7tAcYLJsMOGDy1427DzHbg1oGAkj6CVfYqnccLdhQ8U9bYb+obQK2cCTCjSky8I5tGBT5UHWYsqfZz/x5oTRF3V9dZlo+TaNmKVm+L59/MvkmKmHj09APooIIOtNlyPP4jjC2F0c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763960992; c=relaxed/simple;
	bh=Lmd3CbxCn/2CLyNJPO0KamThjfNXv9lHbIWUgWMFq2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAy/QdQE4nH6oBJsDjq57JV/uW3O3wlIxAkxBSbnCDvwQ5PRUIkgtdbtJXNq31P+WpqOlWP8tS91vSRcIxd2ZmoJi600ceYLrlEFprBgruwLYNLOpkrmq1meQDHRYRmcnI3TzNzMvvLfLk/U0/fA/Qn2YaPn+9oTLVKQVsGyiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElGGtQAx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElGGtQAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763960992; x=1795496992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lmd3CbxCn/2CLyNJPO0KamThjfNXv9lHbIWUgWMFq2Y=;
  b=ElGGtQAxG/OILy6YgdOJqvr9vfWrCllT2IpRRfDrgJG/xBcAfonJEfJF
   I3qwVfeWlip3brpkh2H/ywhsRAwPmDZL2u8TxuMScIi40EQ3wrDzu9ifd
   N17JkIGuYCsMObPnJWbuL/CwI/w1nyVuFrjoK5KVOs4RqxU7XUIuqOKVS
   Or8A9rRNclBGk5thlYnAdForu5CPIaGfcEr1OWSOtUdMuAwuyQvm02bAa
   AJ8BFIT8TZTfUpE+IEQGl48sS8Hy/zjbOvvagDIY61bN2osngfvdsZbUy
   w8ooVxOSZkA4rbjag5GDGRo5Q22xX/ZEZ4x+/2iqn8YmuisXAYdu6tra6
   w==;
X-CSE-ConnectionGUID: Ihpc0R+2T4K4ygxJBqx22g==
X-CSE-MsgGUID: cLf3UPubQ8y+wukJNCWlig==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77428240"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77428240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 21:09:47 -0800
X-CSE-ConnectionGUID: bh+PuUZOTX623PwXy9YS6Q==
X-CSE-MsgGUID: fhiPudGvQTGOMBqNn6Wb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192103710"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Nov 2025 21:09:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNOpa-000000000Ot-3DN8;
	Mon, 24 Nov 2025 05:09:42 +0000
Date: Mon, 24 Nov 2025 13:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 33/47] papr-hvpipe: convert
 papr_hvpipe_dev_create_handle() to FD_PREPARE()
Message-ID: <202511241245.kno3FVH4-lkp@intel.com>
References: <20251121-work-fd-prepare-v3-33-2c6444d13e0e@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-work-fd-prepare-v3-33-2c6444d13e0e@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c8e00cdc7425d5c60fd1ce6e7f71e5fb1b236991]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/file-add-FD_PREPARE/20251122-021000
base:   c8e00cdc7425d5c60fd1ce6e7f71e5fb1b236991
patch link:    https://lore.kernel.org/r/20251121-work-fd-prepare-v3-33-2c6444d13e0e%40kernel.org
patch subject: [PATCH RFC v3 33/47] papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()
config: powerpc64-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241245.kno3FVH4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241245.kno3FVH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241245.kno3FVH4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-hvpipe.c: In function 'papr_hvpipe_dev_create_handle':
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:512:17: error: label 'free_buf' used but not defined
     512 |                 goto free_buf;
         |                 ^~~~


vim +/free_buf +512 arch/powerpc/platforms/pseries/papr-hvpipe.c

814ef095f12c9f Haren Myneni      2025-09-09  479  
814ef095f12c9f Haren Myneni      2025-09-09  480  static int papr_hvpipe_dev_create_handle(u32 srcID)
814ef095f12c9f Haren Myneni      2025-09-09  481  {
71a67f1fa8b137 Christian Brauner 2025-11-21  482  	struct hvpipe_source_info *src_info __free(kfree) = NULL;
814ef095f12c9f Haren Myneni      2025-09-09  483  	long err;
814ef095f12c9f Haren Myneni      2025-09-09  484  
814ef095f12c9f Haren Myneni      2025-09-09  485  	spin_lock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  486  	/*
814ef095f12c9f Haren Myneni      2025-09-09  487  	 * Do not allow more than one process communicates with
814ef095f12c9f Haren Myneni      2025-09-09  488  	 * each source.
814ef095f12c9f Haren Myneni      2025-09-09  489  	 */
814ef095f12c9f Haren Myneni      2025-09-09  490  	src_info = hvpipe_find_source(srcID);
814ef095f12c9f Haren Myneni      2025-09-09  491  	if (src_info) {
814ef095f12c9f Haren Myneni      2025-09-09  492  		spin_unlock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  493  		pr_err("pid(%d) is already using the source(%d)\n",
814ef095f12c9f Haren Myneni      2025-09-09  494  				src_info->tsk->pid, srcID);
814ef095f12c9f Haren Myneni      2025-09-09  495  		return -EALREADY;
814ef095f12c9f Haren Myneni      2025-09-09  496  	}
814ef095f12c9f Haren Myneni      2025-09-09  497  	spin_unlock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  498  
814ef095f12c9f Haren Myneni      2025-09-09  499  	src_info = kzalloc(sizeof(*src_info), GFP_KERNEL_ACCOUNT);
814ef095f12c9f Haren Myneni      2025-09-09  500  	if (!src_info)
814ef095f12c9f Haren Myneni      2025-09-09  501  		return -ENOMEM;
814ef095f12c9f Haren Myneni      2025-09-09  502  
814ef095f12c9f Haren Myneni      2025-09-09  503  	src_info->srcID = srcID;
814ef095f12c9f Haren Myneni      2025-09-09  504  	src_info->tsk = current;
814ef095f12c9f Haren Myneni      2025-09-09  505  	init_waitqueue_head(&src_info->recv_wqh);
814ef095f12c9f Haren Myneni      2025-09-09  506  
71a67f1fa8b137 Christian Brauner 2025-11-21  507  	FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
71a67f1fa8b137 Christian Brauner 2025-11-21  508  		   anon_inode_getfile("[papr-hvpipe]", &papr_hvpipe_handle_ops,
71a67f1fa8b137 Christian Brauner 2025-11-21  509  				      (void *)src_info, O_RDWR));
71a67f1fa8b137 Christian Brauner 2025-11-21  510  	err = ACQUIRE_ERR(fd_prepare, &fdf);
71a67f1fa8b137 Christian Brauner 2025-11-21  511  	if (err)
814ef095f12c9f Haren Myneni      2025-09-09 @512  		goto free_buf;
814ef095f12c9f Haren Myneni      2025-09-09  513  
71a67f1fa8b137 Christian Brauner 2025-11-21  514  	retain_and_null_ptr(src_info);
814ef095f12c9f Haren Myneni      2025-09-09  515  	spin_lock(&hvpipe_src_list_lock);
814ef095f12c9f Haren Myneni      2025-09-09  516  	/*
814ef095f12c9f Haren Myneni      2025-09-09  517  	 * If two processes are executing ioctl() for the same
814ef095f12c9f Haren Myneni      2025-09-09  518  	 * source ID concurrently, prevent the second process to
814ef095f12c9f Haren Myneni      2025-09-09  519  	 * acquire FD.
814ef095f12c9f Haren Myneni      2025-09-09  520  	 */
814ef095f12c9f Haren Myneni      2025-09-09  521  	if (hvpipe_find_source(srcID)) {
814ef095f12c9f Haren Myneni      2025-09-09  522  		spin_unlock(&hvpipe_src_list_lock);
71a67f1fa8b137 Christian Brauner 2025-11-21  523  		return -EALREADY;
814ef095f12c9f Haren Myneni      2025-09-09  524  	}
814ef095f12c9f Haren Myneni      2025-09-09  525  	list_add(&src_info->list, &hvpipe_src_list);
814ef095f12c9f Haren Myneni      2025-09-09  526  	spin_unlock(&hvpipe_src_list_lock);
71a67f1fa8b137 Christian Brauner 2025-11-21  527  	return fd_publish(fdf);
814ef095f12c9f Haren Myneni      2025-09-09  528  }
814ef095f12c9f Haren Myneni      2025-09-09  529  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
