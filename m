Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC282066C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737777193; cv=none; b=CusQ33STm/dK5TKkKQTgaizOWgUM4QpEW/u+wOlx/w2lklIjO1FagEJDsDtCntLZcQRT6ZdX7yhG/x6vWPJ+dA25loMVTZoa7WjQo2zCD0vBQMpYC11deLwiBA93/IG9mjV4d8VzPi2dFQ7J09y/QYzYrcPhZRJEtPNramU2Ofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737777193; c=relaxed/simple;
	bh=5hj+nVnYABLN8afTne5D4rR8awnpn1P+DCfjksL2Yy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CEEyAsLvsK+mV++XyZh9yCpy9hM2b4kETMFlhowD7PVUKJczrBj8jQxp1HRYttKDrnuFrrlsGr6wrg+z5a24PcXRxWPJodcXDYCNu8a7f79UT2ub7KloYfqOCouwNCNpQczF+yit82SlYPZ0xvnw0OofJX9QNrfPVv8UKyvht4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+sngt7u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+sngt7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737777192; x=1769313192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hj+nVnYABLN8afTne5D4rR8awnpn1P+DCfjksL2Yy8=;
  b=N+sngt7uUh8Mj4m4M1NFD4LCZ/vmQohQjE+k0MvKfXf2/8LPmqJPn84u
   hnrlHvw5tCcwUGznA/tXdkds80YW2q2g/SN0jA/WmnAJcy4nn0utm1X68
   cEVX3LeKOXEo1R2ipt5iSSSzceWxnI2kKK8texdQKpX6zAuJh+lMthVjT
   D2PKcs+m7U5svX9BEQM6QCVi8+beEudQCo0y95N/7edIiofo27yIUggRN
   bZBYHRTTIDc92LYiy1cHqRqiylyFcV2hgRewmQpU0drzVF6l7kHsYrK7j
   brzC77OGmXbf6ZQNzMx7ovHyYjaM9xeEE7Q4m5IebWV2sxW0vnu3I6Bsa
   A==;
X-CSE-ConnectionGUID: 1aSnl58xQI2D01BKR47LNg==
X-CSE-MsgGUID: PB5FscESR1uGTDW3alz56g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38207830"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38207830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 19:53:11 -0800
X-CSE-ConnectionGUID: DbshVn/3TSOXaZ80AncI+Q==
X-CSE-MsgGUID: qgglSk0iTUCU2AxNsD8IiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="108058601"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jan 2025 19:53:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbXEJ-000dS3-0v;
	Sat, 25 Jan 2025 03:53:07 +0000
Date: Sat, 25 Jan 2025 11:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dean Luick <dean.luick@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream-20250117 6/24]
 drivers/infiniband/hw/hfi1/file_ops.c:250:3: warning: label followed by a
 declaration is a C23 extension
Message-ID: <202501251134.7W5LCHUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20250117
head:   c8e61ae3e86047b25b2fa39ad982e4990fe639d5
commit: 270a4c12edcf733cfccd4d32a531b806cd5abc79 [6/24] RDMA/hfi1: Move user copy to ioctl function
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250125/202501251134.7W5LCHUs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251134.7W5LCHUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251134.7W5LCHUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/hfi1/file_ops.c:16:
   In file included from drivers/infiniband/hw/hfi1/hfi.h:12:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/hfi1/file_ops.c:250:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     250 |                 unsigned long events;
         |                 ^
   drivers/infiniband/hw/hfi1/file_ops.c:258:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     258 |                 u16 pkey;
         |                 ^
   6 warnings generated.


vim +250 drivers/infiniband/hw/hfi1/file_ops.c

   192	
   193	static long hfi1_file_ioctl(struct file *fp, unsigned int cmd,
   194				    unsigned long arg)
   195	{
   196		struct hfi1_filedata *fd = fp->private_data;
   197		struct hfi1_ctxtdata *uctxt = fd->uctxt;
   198		int ret = 0;
   199		int uval = 0;
   200	
   201		hfi1_cdbg(IOCTL, "IOCTL recv: 0x%x", cmd);
   202		if (cmd != HFI1_IOCTL_ASSIGN_CTXT &&
   203		    cmd != HFI1_IOCTL_GET_VERS &&
   204		    !uctxt)
   205			return -EINVAL;
   206	
   207		switch (cmd) {
   208		case HFI1_IOCTL_ASSIGN_CTXT:
   209			ret = assign_ctxt(fd, arg, _IOC_SIZE(cmd));
   210			break;
   211	
   212		case HFI1_IOCTL_CTXT_INFO:
   213			ret = get_ctxt_info(fd, arg, _IOC_SIZE(cmd));
   214			break;
   215	
   216		case HFI1_IOCTL_USER_INFO:
   217			ret = get_base_info(fd, arg, _IOC_SIZE(cmd));
   218			break;
   219	
   220		case HFI1_IOCTL_CREDIT_UPD:
   221			if (uctxt)
   222				sc_return_credits(uctxt->sc);
   223			break;
   224	
   225		case HFI1_IOCTL_TID_UPDATE:
   226			ret = user_exp_rcv_setup(fd, arg, _IOC_SIZE(cmd));
   227			break;
   228	
   229		case HFI1_IOCTL_TID_FREE:
   230			ret = user_exp_rcv_clear(fd, arg, _IOC_SIZE(cmd));
   231			break;
   232	
   233		case HFI1_IOCTL_TID_INVAL_READ:
   234			ret = user_exp_rcv_invalid(fd, arg, _IOC_SIZE(cmd));
   235			break;
   236	
   237		case HFI1_IOCTL_RECV_CTRL:
   238			if (get_user(uval, (int __user *)arg))
   239				return -EFAULT;
   240			ret = manage_rcvq(uctxt, fd->subctxt, uval);
   241			break;
   242	
   243		case HFI1_IOCTL_POLL_TYPE:
   244			if (get_user(uval, (int __user *)arg))
   245				return -EFAULT;
   246			uctxt->poll_type = (typeof(uctxt->poll_type))uval;
   247			break;
   248	
   249		case HFI1_IOCTL_ACK_EVENT:
 > 250			unsigned long events;
   251	
   252			if (get_user(events, (unsigned long __user *)arg))
   253				return -EFAULT;
   254			ret = user_event_ack(uctxt, fd->subctxt, events);
   255			break;
   256	
   257		case HFI1_IOCTL_SET_PKEY:
   258			u16 pkey;
   259	
   260			if (get_user(pkey, (u16 __user *)arg))
   261				return -EFAULT;
   262			ret = set_ctxt_pkey(uctxt, pkey);
   263			break;
   264	
   265		case HFI1_IOCTL_CTXT_RESET:
   266			ret = ctxt_reset(uctxt);
   267			break;
   268	
   269		case HFI1_IOCTL_GET_VERS:
   270			uval = HFI1_USER_SWVERSION;
   271			if (put_user(uval, (int __user *)arg))
   272				return -EFAULT;
   273			break;
   274	
   275		default:
   276			return -EINVAL;
   277		}
   278	
   279		return ret;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
