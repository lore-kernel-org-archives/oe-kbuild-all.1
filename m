Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4598963B9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757235640; cv=none; b=HXfSKqMkOwaY9ZAn3h/00+FnRh3MJH5XoAyVsJDVBz5KIuvjkrxzRoTKMLZlANyLEhoxe67elJ6exNDhGZfnF8IeB93y+seCCKbj1GL8tTDF6kcxOu8enHEuob93J/9fHPYep4t2XICMVZcdjzqJLnzpBs/Vy37Gr5FRpRGQRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757235640; c=relaxed/simple;
	bh=juj8MrZDqyH6PN+tSESq1siYyZmb6rcLh88hLQeDvu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYVpwdGjLy7UQO36WWKZP1/tIJD0fu7wEc72uZnv656mChDjdD07d5VHlf9lkeqxaGB0WMOFWjY5sXASHRLUInNnwc5O+JWBEvg1FyyLh1cfpHMyYEre1IBy/m4TSAQ900AxZ64cGHDKV3w84O51FMmWzVnjqAVqfrVk7bQhc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qlnb9e3h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qlnb9e3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757235638; x=1788771638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=juj8MrZDqyH6PN+tSESq1siYyZmb6rcLh88hLQeDvu8=;
  b=Qlnb9e3hjeiIeii/c0CcseNqevmZPzvIzprRFjY1s4yUeMN7/zzwi+fn
   dJNbNO5lkljxxeu0V85MQIBWNpndHAMvGZgixnpDxyju9ey/mPRZIglVC
   S5jodC4h6uWGbNHwFv4W+C9Efxe8ACmyyOH8CRw7JVfss2yerrlb3FkvJ
   Zw5g04DxPPFDLfAXVkCVGk1ZUv3XoHnWxPbQdQkvbztQZQBFa/4eDDDiO
   BnkPMMhQGatAQviXaZVIUZmPHWYu+804SsWxGb4XACj8v7V9zUkTXniIT
   DnuAy/RwQVPNs2CDZMVjvMVwoIbw6lWJ4boL1XQEBYGn9h1Brg09rHauu
   g==;
X-CSE-ConnectionGUID: 5BCwZ5FBSEuY2zkBhJ7Fyw==
X-CSE-MsgGUID: jbwFHIK1SiSkgVnUZP49OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59471776"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59471776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 02:00:37 -0700
X-CSE-ConnectionGUID: PTyktHqBS3iD/BTGhp9HjQ==
X-CSE-MsgGUID: 5rSjIafzTSGDNLFMLvKgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="172647963"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2025 02:00:35 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvBGC-00029f-0w;
	Sun, 07 Sep 2025 09:00:32 +0000
Date: Sun, 7 Sep 2025 16:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v5 4/9] powerpc/pseries: Send payload with
 ibm,send-hvpipe-msg RTAS
Message-ID: <202509071638.LB0STPgX-lkp@intel.com>
References: <20250906155308.705926-5-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906155308.705926-5-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250906-235556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250906155308.705926-5-haren%40linux.ibm.com
patch subject: [PATCH v5 4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
config: powerpc64-randconfig-r123-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071638.LB0STPgX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509071638.LB0STPgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509071638.LB0STPgX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:177:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:177:26: sparse:     expected unsigned long long [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:177:26: sparse:     got restricted __be64 [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:186:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:186:26: sparse:     expected unsigned long long [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:186:26: sparse:     got restricted __be64 [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:189:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:189:26: sparse:     expected unsigned long long [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:189:26: sparse:     got restricted __be64 [usertype]
   arch/powerpc/platforms/pseries/papr-hvpipe.c:267:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:267:33: sparse:     expected restricted __poll_t ( *poll )( ... )
   arch/powerpc/platforms/pseries/papr-hvpipe.c:267:33: sparse:     got unsigned int ( * )( ... )

vim +177 arch/powerpc/platforms/pseries/papr-hvpipe.c

   118	
   119	/*
   120	 * papr_hvpipe_handle_write -  Issue send HVPIPE RTAS and return
   121	 * the RTAS status to the user space
   122	 */
   123	static ssize_t papr_hvpipe_handle_write(struct file *file,
   124		const char __user *buf, size_t size, loff_t *off)
   125	{
   126		struct hvpipe_source_info *src_info = file->private_data;
   127		struct rtas_work_area *work_area, *work_buf;
   128		unsigned long ret, len;
   129		char *area_buf;
   130	
   131		if (!src_info)
   132			return -EIO;
   133	
   134		/*
   135		 * Send HVPIPE RTAS is used to send payload to the specific
   136		 * source with the input parameters source ID and the payload
   137		 * as buffer list. Each entry in the buffer list contains
   138		 * address/length pair of the buffer.
   139		 *
   140		 * The buffer list format is as follows:
   141		 *
   142		 * Header (length of address/length pairs and the header length)
   143		 * Address of 4K buffer 1
   144		 * Length of 4K buffer 1 used
   145		 * ...
   146		 * Address of 4K buffer n
   147		 * Length of 4K buffer n used
   148		 *
   149		 * See PAPR 7.3.32.2 ibm,send-hvpipe-msg
   150		 *
   151		 * Even though can support max 1MB payload, the hypervisor
   152		 * supports only 4048 bytes payload at present and also
   153		 * just one address/length entry.
   154		 *
   155		 * writev() interface can be added in future when the
   156		 * hypervisor supports multiple buffer list entries.
   157		 */
   158		/* HVPIPE_MAX_WRITE_BUFFER_SIZE = 4048 bytes */
   159		if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
   160			(size <= HVPIPE_HDR_LEN))
   161			return -EINVAL;
   162	
   163		/*
   164		 * The length of (address + length) pair + the length of header
   165		 */
   166		len = (2 * sizeof(u64)) + sizeof(u64);
   167		size -= HVPIPE_HDR_LEN;
   168		buf += HVPIPE_HDR_LEN;
   169		mutex_lock(&rtas_ibm_send_hvpipe_msg_lock);
   170		work_area = rtas_work_area_alloc(SZ_4K);
   171		if (!work_area) {
   172			ret = -ENOMEM;
   173			goto out;
   174		}
   175		area_buf = rtas_work_area_raw_buf(work_area);
   176		/* header */
 > 177		*(u64 *)area_buf = cpu_to_be64(len);
   178		area_buf += sizeof(u64);
   179	
   180		work_buf = rtas_work_area_alloc(SZ_4K);
   181		if (!area_buf) {
   182			ret = -ENOMEM;
   183			goto out_work;
   184		}
   185		/* First buffer address */
   186		*(u64 *)area_buf = cpu_to_be64(rtas_work_area_phys(work_buf));
   187		area_buf += sizeof(u64);
   188		/* First buffer address length */
   189		*(u64 *)area_buf = cpu_to_be64(size);
   190	
   191		if (!copy_from_user(rtas_work_area_raw_buf(work_buf), buf, size)) {
   192			ret = rtas_ibm_send_hvpipe_msg(work_area, src_info->srcID);
   193			if (!ret)
   194				ret = size + HVPIPE_HDR_LEN;
   195		} else
   196			ret = -EPERM;
   197	
   198		rtas_work_area_free(work_buf);
   199	out_work:
   200		rtas_work_area_free(work_area);
   201	out:
   202		mutex_unlock(&rtas_ibm_send_hvpipe_msg_lock);
   203		return ret;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
