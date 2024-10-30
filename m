Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488731E4AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291956; cv=none; b=MgOARnpf+OpXwZsjtdYzKQeXP9+e8FBF6Lxd48OAq/a/5EcesnwmroPRElmFsHbGFEIj7tuxR4RBMvggYPVcdpYVAuCn1NOKgWHcFyLC4X5lETxdYFs6c9ylTLQDUtXOmTUhBq6y1tz0xDR1BWVEup2NVbfV8JfnZMUIj5yYDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291956; c=relaxed/simple;
	bh=Sl2pm+QR07UOlQdFyavDiQ8Wndxu02DUhJ1CSsYmHV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leifHKsPx1EjXFAl6Uq5Js+wSXGQAMWUJkR2fTabwJvq4RXAKUuk2Om2lvbTAqzOcnmRRRZ3Jpd9YrvPk0niKa5YAJpfKqyGy/ph/ZN+1cBZyNm+oLTxjDsO5tG7Kvw1xVheESIGqblk8NUg0aI9ajGP12Z6VZXSn69NhVB7VNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9TPY0em; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9TPY0em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730291955; x=1761827955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sl2pm+QR07UOlQdFyavDiQ8Wndxu02DUhJ1CSsYmHV4=;
  b=P9TPY0emiXl74oLVseM2e1SX1iBO7ZlyqqU30zAUrGpPr67eJqZtNFkC
   3V/LNJsHqer/B3Xv1MOeuLoFbvo6rD/ujHTXBsA7rDGltS0nkiRJQLp6U
   Z7XYrCkrpYc9/ua+hLE3F/2ddP8Ytxhbr0Nb3YFo855gHP8FKxMLDDlgj
   RzEHLSvH+uN1p3n6fpcscOmefxppomlgpbFxpV5oq7zCvhseVYi7oZk2T
   0aYtjkMA9UjlXvzxWxYgXCQ6dOXtm2+HXKNegS6cfNMd5IyQcN/dZ4AWs
   PIrVgt3ip3ZJ0yuspOJN6GvjqxCOMqGIV1TbawprCOLlT59ookb9JSKe3
   A==;
X-CSE-ConnectionGUID: Af+UHwbzQBSYhq08YFCEzA==
X-CSE-MsgGUID: B9COo+dRQm+YnG86TbHRiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33788107"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="33788107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:39:14 -0700
X-CSE-ConnectionGUID: NCPjAIRSSZyzGBIRtT3CGQ==
X-CSE-MsgGUID: 8AVHyf4oRfS/QuR0RIp7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119765432"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 05:39:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t67yc-000eq8-2V;
	Wed, 30 Oct 2024 12:39:06 +0000
Date: Wed, 30 Oct 2024 20:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13/98] kernel/sysctl.c:1033:45: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202410302050.XIoKsFjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 95c98461d1dce7fd1d25f055c88ad639b0e3b7d7 [13/98] sysrq: add ALT+LEFTCTRL to trigger crash dump
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410302050.XIoKsFjs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410302050.XIoKsFjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410302050.XIoKsFjs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:1033:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1033:45: sparse:     expected void *buffer
   kernel/sysctl.c:1033:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1791:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1791:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1791:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:312:66: sparse: sparse: self-comparison always evaluates to false

vim +1033 kernel/sysctl.c

  1026	
  1027	static int sysrq_use_leftctrl_sysctl_handler(struct ctl_table *table, int write,
  1028			void __user *buffer, size_t *lenp,
  1029			loff_t *ppos)
  1030	{
  1031		int error;
  1032	
> 1033		error = proc_dointvec(table, write, buffer, lenp, ppos);
  1034		if (error)
  1035			return error;
  1036	
  1037		if (write)
  1038			sysrq_toggle_sysrq_key(__sysrq_use_leftctrl);
  1039	
  1040		return 0;
  1041	}
  1042	#endif
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
