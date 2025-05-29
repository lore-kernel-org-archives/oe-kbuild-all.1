Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860C254B1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514901; cv=none; b=c0eP+lX1cKBWEMzRS1zEihExUmwXNOuIBJ6U5YApmZUqKsDDpu/6/Y7qlADB5x+8ombRt5GGlWzWAKnLuXY/5RDnc+1gWPkWzKJkVuWssN2npZuoPp9QCjgmwek5zOfK5RjQMKGD6DvwiiNKAMBCuAQeGekh7oiH9jXJ0dizCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514901; c=relaxed/simple;
	bh=zw7x8+w9LnKHFLQlAMOY+MezcK5fQhElW11rz/pljHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nKNvIIc4NKA6pYJT0P67AKffXUzlU604rMnS9dc6JXFpqoZVKXNDLXyqyQ1D8XpSp/oTD6Kmgw238ZGSj/0iDvsZoPZgesGIKceyhiexvYDo4OEBUi6TlcdmoHniBvyaW0bE0xR/6zqRKPSDkHYc4DMz27lewT3OV9Q6Y87lX/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRML9JFo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRML9JFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748514900; x=1780050900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zw7x8+w9LnKHFLQlAMOY+MezcK5fQhElW11rz/pljHo=;
  b=MRML9JFoY0WV5QaJqOFFmSHLh2QFXM4IWh+DoPha8YZvlfOzZzmAewFJ
   4PrhDgmU7Y3mqMDrqz0uAZUFaua7W/VuY8u9VUbvIhFqRwe/yPDLexdCq
   ACS2Fe1lamY9SthBEmhksoW/PD/kT4pWYcYZnr9mhOhZY0qmOCqhgfNiD
   9qozo/acqeDOymS7kEBAoF0YPIJqPJ9actLdOFpyIllyk0V9FAeL+dpyO
   eUmEBGEduPx6jIqP3jHs0jYVjUcxsy7MeoXWDy12y2+7qpBJKjigJycdC
   g904p4OZXtQqaOgsAUOzkfi3A7Sp1UkhtsB7gi70rQysmNyi5TyEVoESC
   Q==;
X-CSE-ConnectionGUID: M628+8U6T96JlNqmqalehw==
X-CSE-MsgGUID: M/F9UouWQuqD+Xna+IaYig==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61971315"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="61971315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 03:34:59 -0700
X-CSE-ConnectionGUID: rO4KV2IhRc2DjrrkPXVXIA==
X-CSE-MsgGUID: 5UPoEPM9RCyM5+R1MSXYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148811979"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2025 03:34:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKabA-000WZO-0I;
	Thu, 29 May 2025 10:34:56 +0000
Date: Thu, 29 May 2025 18:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331] drivers/crypto/ccp/hygon/vpsp.c:64:1:
 sparse: sparse: symbol 'vpsp_cmd_ctx_table' was not declared. Should it be
 static?
Message-ID: <202505291807.LPmsH7Fj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e2c7f21ccac8f595f261a7971f6d6092d442c888
commit: 294caf049d134e08f0e70277ddb6a29698e9d96b [2331/2331] crypto: ccp: Use a workqueue to clean up the vpsp ringbuffer
config: x86_64-randconfig-121-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291807.LPmsH7Fj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291807.LPmsH7Fj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291807.LPmsH7Fj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/vpsp.c:64:1: sparse: sparse: symbol 'vpsp_cmd_ctx_table' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/vpsp.c:65:1: sparse: sparse: symbol 'table_rwlock' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/vpsp.c:695:1: sparse: sparse: symbol 'vpsp_dev_rwlock' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/vpsp.c:724:10: sparse: sparse: symbol 'allow_default_vid' was not declared. Should it be static?
   drivers/crypto/ccp/hygon/vpsp.c:725:6: sparse: sparse: symbol 'vpsp_set_default_vid_permission' was not declared. Should it be static?

vim +/vpsp_cmd_ctx_table +64 drivers/crypto/ccp/hygon/vpsp.c

    33	
    34	/*
    35	 * The file mainly implements the base execution logic of virtual PSP in kernel mode,
    36	 *	which mainly includes:
    37	 *	(1) Preprocess the guest data in the host kernel
    38	 *	(2) The command that has been converted will interact with the channel of the
    39	 *		psp through the driver and try to obtain the execution result
    40	 *	(3) The executed command data is recovered, and then returned to the VM
    41	 *
    42	 * The primary implementation logic of virtual PSP in kernel mode
    43	 * call trace:
    44	 * guest command(vmmcall, KVM_HC_PSP_COPY_FORWARD_OP)
    45	 *		   |
    46	 *	kvm_pv_psp_copy_op---->	| -> kvm_pv_psp_cmd_pre_op
    47	 *				|
    48	 *				| -> vpsp_try_do_cmd/vpsp_try_get_result
    49	 *				|	|<=> psp device driver
    50	 *				|
    51	 *				|
    52	 *				|-> kvm_pv_psp_cmd_post_op
    53	 *
    54	 * guest command(vmmcall, KVM_HC_PSP_FORWARD_OP)
    55	 *		   |
    56	 *	kvm_pv_psp_forward_op-> |-> vpsp_try_do_cmd/vpsp_try_get_result
    57	 *					|<=> psp device driver
    58	 */
    59	
    60	/**
    61	 * used to locate the command context,
    62	 * when the guest enters the host via vmmcall
    63	 */
  > 64	DEFINE_HASHTABLE(vpsp_cmd_ctx_table, 11);
  > 65	DEFINE_RWLOCK(table_rwlock);
    66	bool vpsp_in_ringbuffer_mode;
    67	static struct vpsp_cmd_ctx *vpsp_cmd_ctx_array[CSV_COMMAND_PRIORITY_NUM]
    68					[CSV_RING_BUFFER_SIZE / CSV_RING_BUFFER_ESIZE];
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
