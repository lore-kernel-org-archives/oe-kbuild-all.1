Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C11A256E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766761601; cv=none; b=k1wnvThV98Udp89/8HevXJw7vnLk4n8EnRnrWvB/RcC9IDBPZcpqSPkoZ0RXB6yxA350GTbsPEiyNBcmRKqJnPvrEt52soEpZcC/sDH8WXqQlblAHBOheXPdiXkixdXZDQEOMP+KeBEY4fF1ofcY540VAl0NB1DZYCZnq3CtT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766761601; c=relaxed/simple;
	bh=8u83R4IFnjFucLNCjvSGjlJ2Ai/QXypXWJsW+vwYCFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hujzAzXSYZK5iJK6tS70Piua8032tWbbbYq4l3LlhIpYQ83WPqTwMdeVXe3U6ohdVsil8bznA1LtMGQlyEFAaZG01alIEPKCHQRxQ0vmeQ1C67j2iKBZgWy3BJ8pKcTf+kSoaGD5GESWQey5CJFiiwwMV99Cz+j5PwzUwI9yAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cona475F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cona475F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766761599; x=1798297599;
  h=date:from:to:cc:subject:message-id;
  bh=8u83R4IFnjFucLNCjvSGjlJ2Ai/QXypXWJsW+vwYCFI=;
  b=Cona475FhzZuN4tELILVkES3ir0g8UPMdW6zm/TpSnROtJGEWsw/tZBC
   Jai0fMpDqWxz+dHXimzbkvvRDiNCrZdUQnviAQ5n/6PlY5oEkBau4czMA
   bU/Ztkqrw+cw5JT1YD4g6tubyR8hhFWA1stu8SDYgzWn2y+O/Srzzf3UW
   0Gf3cg/svhFNObkd4E8sfDEx00bOvdV5wafeezhJJCXEwPU3HpPv2xCWu
   ercDzJo8CwxJjlfisXW81xdBe7iu7jGJ+l2lZbQ+n2QdHJeSTrBIFZmM9
   Uo2yyfY7PNy+B03bPazJuzBVsyeh1JkadRfzlnR80xOO/MrwffjgiXqGs
   A==;
X-CSE-ConnectionGUID: h97AeGyFS4C0g3i2WmiHzQ==
X-CSE-MsgGUID: RLAKmx/FSc+zwayrEx7Ycg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68585910"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="68585910"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 07:06:38 -0800
X-CSE-ConnectionGUID: 5itXHyPQT5CQB7PtgZUs7w==
X-CSE-MsgGUID: q09HOEDiThyA7kFsG66isg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="200418198"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2025 07:06:36 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ9Ok-0000000056L-1YPp;
	Fri, 26 Dec 2025 15:06:34 +0000
Date: Fri, 26 Dec 2025 23:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ub/ubus/pool.c:447:5:
 warning: no previous prototype for 'ub_fm_flush_ubc_info'
Message-ID: <202512262223.82hdqwfD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 3ba2ea6f540df963f195e45f1a0cc5110cd67cee [13/13] ub:ubus: Add new UBUS pool device interfaces
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512262223.82hdqwfD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512262223.82hdqwfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512262223.82hdqwfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/pool.c:447:5: warning: no previous prototype for 'ub_fm_flush_ubc_info' [-Wmissing-prototypes]
     447 | int ub_fm_flush_ubc_info(struct ub_bus_controller *ubc)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ub/ubus/instance.h:9,
                    from drivers/ub/ubus/pool.c:16:
   include/linux/ummu_core.h:303:30: warning: 'ummu_core_tid_ops' defined but not used [-Wunused-variable]
     303 | static const struct tid_ops *ummu_core_tid_ops[TID_OPS_MAX];
         |                              ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ub_fm_flush_ubc_info +447 drivers/ub/ubus/pool.c

   446	
 > 447	int ub_fm_flush_ubc_info(struct ub_bus_controller *ubc)
   448	{
   449		struct device *dev = &ubc->dev;
   450		int ret = -ENOMEM;
   451		u32 eid, fm_cna;
   452		char *buf;
   453		u16 upi;
   454	
   455		buf = kzalloc(SZ_4K, GFP_KERNEL);
   456		if (!buf)
   457			goto out;
   458	
   459		ret = ub_cfg_read_word(ubc->uent, UB_UPI, &upi);
   460		if (ret) {
   461			dev_err(dev, "update cluster upi failed, ret=%d\n", ret);
   462			goto free_buf;
   463		}
   464	
   465		ubc->uent->upi = upi & UB_UPI_MASK;
   466		dev_info(dev, "update cluster ubc upi to %#x\n", ubc->uent->upi);
   467	
   468		ret = ub_cfg_read_dword(ubc->uent, UB_EID_0, &eid);
   469		if (ret) {
   470			dev_err(dev, "update cluster ubc eid failed, ret=%d\n", ret);
   471			goto free_buf;
   472		}
   473	
   474		if (eid <= ubc_eid_end) {
   475			dev_err(dev, "update cluster ubc wrong, eid=%#x\n", eid);
   476			ret = -EINVAL;
   477			goto free_buf;
   478		}
   479	
   480		ubc->uent->eid = eid & UB_COMPACT_EID_MASK;
   481		dev_info(dev, "update cluster ubc eid to %#x\n", ubc->uent->eid);
   482	
   483		ret = ub_cfg_read_dword(ubc->uent, UB_FM_CNA, &fm_cna);
   484		if (ret) {
   485			dev_err(dev, "read fm cna failed, ret=%d\n", ret);
   486			goto free_buf;
   487		}
   488	
   489		ubc->uent->fm_cna = fm_cna & UB_FM_CNA_MASK;
   490		dev_info(dev, "update cluster ubc fm cna to %#x\n", ubc->uent->fm_cna);
   491	
   492		ret = ub_query_ent_na(ubc->uent, buf);
   493		if (ret) {
   494			dev_err(dev, "update cluster ubc cna failed, ret=%d\n", ret);
   495			goto free_buf;
   496		}
   497	
   498		ret = ub_query_port_na(ubc->uent, buf);
   499	
   500	free_buf:
   501		kfree(buf);
   502	out:
   503		return ret;
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
