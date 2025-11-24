Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D12E0418
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967834; cv=none; b=sH+6/DkYD0voPG2XKc9Oe9kBZr0HPWT3NLJMVlTbGvvsLmpbUE76LEWMIHKC787hF0GmM4hQCdFwnpPaHQ0ZgRlxKh4cMqXITmtdY83KqtLe0MNdcrU0tg8NAmnW2hLrJ6jLg+R5fdNsvUlUpJuNgMBPYyledLaNWIzD+4cN5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967834; c=relaxed/simple;
	bh=PuN4+4/5VdBfeeq3PmbdsdfHx3XVjwTV0/poXAE2WtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjPAexUmTKRs9YKuZNg9Q7QfRsz+I49wE0ZxWSAfesHngYCn3fIME0n9ImQd577NccMKalQ6mprmR0zMNL0+Easox11nD9gj7x9pMcETD9q9mXgW663Al0jZbJMTfCY3BBeP7PiZ2Cwzl/gKIm102VuIsOGHntZzmFQKIpFgW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ojn85k3y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ojn85k3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763967833; x=1795503833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PuN4+4/5VdBfeeq3PmbdsdfHx3XVjwTV0/poXAE2WtM=;
  b=Ojn85k3yPHV4lwFr9LDH2xdD7FlfJUyROTBFVKEbhunWX6SAKjoVE7Td
   GMCWNXriFsZ9OSi3aFEcOaV5DJtKBZ7Wq0vpKioNbj8iMAjUDP7MaFqLa
   Eoer5X8HC2nmlNCGUMYSqeh7InGQIBXZ0g1eNqTMWAPW4hbAJaQ3NXShS
   nRnM7evbCeAlSYXQ3aqCUGaoElasFzKifoWrmFTM4h/YOzdZU9SIhAxQz
   +4kOWBhYQdSqeQtJ4cL5ak0r9qmq58sD2yI9ifUshNvvPrWFbbWtcqnCc
   P9AkPWsD08j5CXZiUT8WVcO+7UT8VDXXh0i9heCFqvZVAOVOMmdZ/eQr0
   g==;
X-CSE-ConnectionGUID: uYQaHzjaRtWK+PRb3JEMOA==
X-CSE-MsgGUID: jFw400lmTgKReYJ295KYZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76287236"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76287236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:03:50 -0800
X-CSE-ConnectionGUID: q3FomvJbRGKtoW+LRDnlIA==
X-CSE-MsgGUID: IoefhYhETHat6rKbY1fILw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192273561"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Nov 2025 23:03:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQbz-000000000Sl-1UpP;
	Mon, 24 Nov 2025 07:03:47 +0000
Date: Mon, 24 Nov 2025 15:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 38/51]
 arch/powerpc/platforms/pseries/papr-platform-dump.c:304:51: warning: unused
 variable 'tmp'
Message-ID: <202511241407.HxqGVVH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   a993ce57dcf06d1fb0e7a80362b520a5771cd32f
commit: b26c6a1c1caee2608dc18803b2756df8ee9c9ecc [38/51] pseries: convert papr_platform_dump_create_handle() to FD_PREPARE()
config: powerpc64-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241407.HxqGVVH4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241407.HxqGVVH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241407.HxqGVVH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-platform-dump.c: In function 'papr_platform_dump_create_handle':
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:304:51: warning: unused variable 'tmp' [-Wunused-variable]
     304 |         struct ibm_platform_dump_params *params, *tmp;
         |                                                   ^~~


vim +/tmp +304 arch/powerpc/platforms/pseries/papr-platform-dump.c

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
 > 304		struct ibm_platform_dump_params *params, *tmp;
   305		u64 param_dump_tag;
   306		int fd;
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
   335		fd = FD_ADD(O_RDONLY | O_CLOEXEC,
   336			    anon_inode_getfile_fmode("[papr-platform-dump]",
   337						     &papr_platform_dump_handle_ops,
   338						     (void *)params, O_RDONLY,
   339						     FMODE_LSEEK | FMODE_PREAD));
   340		if (fd < 0) {
   341			rtas_work_area_free(params->work_area);
   342			kfree(params);
   343			return fd;
   344		}
   345	
   346		list_add(&params->list, &platform_dump_list);
   347	
   348		pr_info("%s (%d) initiated platform dump for dump tag %llu\n",
   349			current->comm, current->pid, dump_tag);
   350		return fd;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
