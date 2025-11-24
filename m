Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0C722A4D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966571; cv=none; b=GXPyc6rfcuXok++PKQ3qjS6nXYzWhxoFHWLqzwhM6v0IDQYqqIlQNHKM83z3KI66JQ7XVBiVKSFlNgeFxSqLAxSpF6fSOdCJOuaGyFadzoFJS6lec7ZlKfS2S+iKhYTdluzoss83AK0vRd1b80wz6VzZNKbQIkaCQ9Tq1sVrxM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966571; c=relaxed/simple;
	bh=sBbk9r5MTt1NBcNiIdSW6q8SjxX3SMP27u+WNpEr6Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spw65X6Om/X6P4vs4JWYwJajMiNE0jic1s1UPL3vijMvsZYtDQLJZWT6cWAmNXTsM31UbKw5HEX8xYJ22P6JEKL4dw/Ml2+bbFElZ1q46Wo7AIJgy7N5LD3jtASNmQ2fDsIEOjFtDhUJfJhK2kuPB/UVAiiccyCaEXctuDTibWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XounLw88; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XounLw88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763966570; x=1795502570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sBbk9r5MTt1NBcNiIdSW6q8SjxX3SMP27u+WNpEr6Pc=;
  b=XounLw88ECu2vrPM3Bf/yKrt2NBXt5eT0/+JEVAoVLvGZm4gw28V+zs2
   jNwMcsQhy3Mv0uWHxgEaH6rnbxl0r3Id/RbcYA60V0XE45OIiz+DWKA8R
   0T2TeUtOOaK+zg9uzCzYOpLw48uaX62kvmeHIf4Br55JUXi/AAKAsABZ8
   eAuVK4KQg258k6e1gp+WCk/6bUMyJemR/WzpxJ8X/V3Wa6+UNUH2CW/Hb
   +x0GAIe8RxJXKbRurZAUwkj5OYVTeO2jTFAR1BIGT6U5dSHr3Ls4kMUBO
   568eRtdrISMsw5uezshCCv1cLCQa2tbr22jnvFb+XXbPwh82wo5i4lvZx
   Q==;
X-CSE-ConnectionGUID: jw8gW+PJRVGEbUgLcjhI/A==
X-CSE-MsgGUID: iO+mRy+6TtuvAfvzOh2+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="88611722"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="88611722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 22:42:49 -0800
X-CSE-ConnectionGUID: EBvqj7fDQuaIZlFUIR5BAA==
X-CSE-MsgGUID: 4NQrNqJvQruXkNDL1bNEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196531515"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Nov 2025 22:42:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQHe-000000000RJ-0H4R;
	Mon, 24 Nov 2025 06:42:46 +0000
Date: Mon, 24 Nov 2025 14:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 35/47] pseries: convert
 papr_platform_dump_create_handle() to FD_PREPARE()
Message-ID: <202511241457.wW7Asu0G-lkp@intel.com>
References: <20251121-work-fd-prepare-v3-35-2c6444d13e0e@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-work-fd-prepare-v3-35-2c6444d13e0e@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c8e00cdc7425d5c60fd1ce6e7f71e5fb1b236991]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/file-add-FD_PREPARE/20251122-021000
base:   c8e00cdc7425d5c60fd1ce6e7f71e5fb1b236991
patch link:    https://lore.kernel.org/r/20251121-work-fd-prepare-v3-35-2c6444d13e0e%40kernel.org
patch subject: [PATCH RFC v3 35/47] pseries: convert papr_platform_dump_create_handle() to FD_PREPARE()
config: powerpc64-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241457.wW7Asu0G-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241457.wW7Asu0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241457.wW7Asu0G-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-platform-dump.c: In function 'papr_platform_dump_create_handle':
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:344:27: error: expected ';' before '}' token
     344 |                 return err
         |                           ^
         |                           ;
     345 |         }
         |         ~                  
   arch/powerpc/platforms/pseries/papr-platform-dump.c:304:51: warning: unused variable 'tmp' [-Wunused-variable]
     304 |         struct ibm_platform_dump_params *params, *tmp;
         |                                                   ^~~


vim +344 arch/powerpc/platforms/pseries/papr-platform-dump.c

   281	
   282	/**
   283	 * papr_platform_dump_create_handle() - Create a fd-based handle for
   284	 * reading platform dump
   285	 *
   286	 * Handler for PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE ioctl command
   287	 * Allocates RTAS parameter struct and work area and attached to the
   288	 * file descriptor for reading by user space with the multiple RTAS
   289	 * calls until the dump is completed. This memory allocation is freed
   290	 * when the file is released.
   291	 *
   292	 * Multiple dump requests with different IDs are allowed at the same
   293	 * time, but not with the same dump ID. So if the user space is
   294	 * already opened file descriptor for the specific dump ID, return
   295	 * -EALREADY for the next request.
   296	 *
   297	 * @dump_tag: Dump ID for the dump requested to retrieve from the
   298	 *		hypervisor
   299	 *
   300	 * Return: The installed fd number if successful, -ve errno otherwise.
   301	 */
   302	static long papr_platform_dump_create_handle(u64 dump_tag)
   303	{
   304		struct ibm_platform_dump_params *params, *tmp;
   305		u64 param_dump_tag;
   306		int err;
   307	
   308		/*
   309		 * Return failure if the user space is already opened FD for
   310		 * the specific dump ID. This check will prevent multiple dump
   311		 * requests for the same dump ID at the same time. Generally
   312		 * should not expect this, but in case.
   313		 */
   314		list_for_each_entry(params, &platform_dump_list, list) {
   315			param_dump_tag = (u64) (((u64)params->dump_tag_hi << 32) |
   316						params->dump_tag_lo);
   317			if (dump_tag == param_dump_tag) {
   318				pr_err("Platform dump for ID(%llu) is already in progress\n",
   319						dump_tag);
   320				return -EALREADY;
   321			}
   322		}
   323	
   324		params =  kzalloc(sizeof(struct ibm_platform_dump_params),
   325				GFP_KERNEL_ACCOUNT);
   326		if (!params)
   327			return -ENOMEM;
   328	
   329		params->work_area = rtas_work_area_alloc(SZ_4K);
   330		params->buf_length = SZ_4K;
   331		params->dump_tag_hi = (u32)(dump_tag >> 32);
   332		params->dump_tag_lo = (u32)(dump_tag & 0x00000000ffffffffULL);
   333		params->status = RTAS_IBM_PLATFORM_DUMP_START;
   334	
   335		FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
   336			   anon_inode_getfile_fmode("[papr-platform-dump]",
   337						    &papr_platform_dump_handle_ops,
   338						    (void *)params, O_RDONLY,
   339						    FMODE_LSEEK | FMODE_PREAD));
   340		err = ACQUIRE_ERR(fd_prepare, &fdf);
   341		if (err) {
   342			rtas_work_area_free(params->work_area);
   343			kfree(params);
 > 344			return err
   345		}
   346	
   347		list_add(&params->list, &platform_dump_list);
   348	
   349		pr_info("%s (%d) initiated platform dump for dump tag %llu\n",
   350			current->comm, current->pid, dump_tag);
   351		return fd_publish(fdf);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
