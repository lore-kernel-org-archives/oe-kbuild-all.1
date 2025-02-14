Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1237517E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 00:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493233; cv=none; b=Cbh0GEEX+zu0mk8bPGXunej/m/RFjiOV+YBdsKyKeQZiL3/bHQU54hodbQfaDtC2q6/PAseaM+B7H/Z8wAGZbrsuTBb6QsYkzWjByBVOke2QN9ibBKQjtb486/3Plt3pfsB9T4+bmXVgSBI97mfjwUvsOWb2SeQSACdG0tmjyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493233; c=relaxed/simple;
	bh=2OGCPzKVWfpiviq8FgpmLsFzhKP9SXOChha3Y+41M+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/2n0X3iUNMvNf1FWHlEUFfGDvr4xcUXBtQZhPzdFuP/PEkU3Qjj2Z4ZxE0J9htcmBdDFyqNo5UIExKpa3yDMQAAXZpH6teY7pcdP7Mzh8Har68U5Xmkp8hlIuiFABXBXvxXz2MQvTkS5nU7praT9lNHUEy0k1vSFI+JiBhpApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFI7qMcq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFI7qMcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739493231; x=1771029231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OGCPzKVWfpiviq8FgpmLsFzhKP9SXOChha3Y+41M+M=;
  b=HFI7qMcqHV2jhL8jjNA9hjQyGgzVCalokv/9uTeVJr+ELH/n0qfIf5qK
   ycBD63P1JhOt0M87EbAYialmNrs2zYe3xFJXUySSlvGD7TRdheHo1Gm4z
   yeD/TFZI/HJGjFpJrYKz2gGrekn7tb6k25QwV6uD8H7b/4bVUbZT/lg55
   qNKuZNUGUsqt1nnijQWOwUhMnHXp14aTFJ1tw1/e84lWAmsGq2pn+dqdK
   VkAIp3OG79nzmUxk9adNFtSbit/kVIcImAr3XgfkoCuDTi/yTEJlgqVz0
   oyhk21keppueJkPMZYKLIqszUAnpjswkTRdm02+ixZWu4cZdd3pPoeGUw
   w==;
X-CSE-ConnectionGUID: LX6j1XXaSTaRItQeTIPLyw==
X-CSE-MsgGUID: kaQXa1OhSXmx0oSC0fmqxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40341599"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40341599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 16:33:50 -0800
X-CSE-ConnectionGUID: 8u+qk7i/R1KxTzDHfa5oSQ==
X-CSE-MsgGUID: GVHAYUiQQ022sQWydvHBOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136536526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2025 16:33:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tijeN-0018rv-0y;
	Fri, 14 Feb 2025 00:33:47 +0000
Date: Fri, 14 Feb 2025 08:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 15/26]
 drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse: sparse: incorrect
 type in assignment (different modifiers)
Message-ID: <202502140829.SCAwcAY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: fea714eb2659066278dc75fbd6229e18b5bfd23b [15/26] srcu: Support Clang's capability analysis
config: arc-randconfig-r132-20250214 (https://download.01.org/0day-ci/archive/20250214/202502140829.SCAwcAY5-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250214/202502140829.SCAwcAY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140829.SCAwcAY5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *handler )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     expected int ( *handler )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     got int ( [noderef] *__v )( ... )
   drivers/infiniband/core/uverbs_ioctl.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/arc/include/asm/uaccess.h:592:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] __user *to @@
   arch/arc/include/asm/uaccess.h:592:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:592:33: sparse:     got void [noderef] __user *to

vim +440 drivers/infiniband/core/uverbs_ioctl.c

fac9658cabb98a Matan Barak         2017-08-03  427  
3a863577a74962 Jason Gunthorpe     2018-08-09  428  static int ib_uverbs_run_method(struct bundle_priv *pbundle,
3a863577a74962 Jason Gunthorpe     2018-08-09  429  				unsigned int num_attrs)
fac9658cabb98a Matan Barak         2017-08-03  430  {
15a1b4becba886 Jason Gunthorpe     2018-11-25  431  	int (*handler)(struct uverbs_attr_bundle *attrs);
155f04366e3cad Gustavo A. R. Silva 2024-03-01  432  	struct uverbs_attr_bundle *bundle =
155f04366e3cad Gustavo A. R. Silva 2024-03-01  433  		container_of(&pbundle->bundle, struct uverbs_attr_bundle, hdr);
3a863577a74962 Jason Gunthorpe     2018-08-09  434  	size_t uattrs_size = array_size(sizeof(*pbundle->uattrs), num_attrs);
3a863577a74962 Jason Gunthorpe     2018-08-09  435  	unsigned int destroy_bkey = pbundle->method_elm->destroy_bkey;
3a863577a74962 Jason Gunthorpe     2018-08-09  436  	unsigned int i;
fac9658cabb98a Matan Barak         2017-08-03  437  	int ret;
fac9658cabb98a Matan Barak         2017-08-03  438  
3a863577a74962 Jason Gunthorpe     2018-08-09  439  	/* See uverbs_disassociate_api() */
3a863577a74962 Jason Gunthorpe     2018-08-09 @440  	handler = srcu_dereference(
3a863577a74962 Jason Gunthorpe     2018-08-09  441  		pbundle->method_elm->handler,
3a863577a74962 Jason Gunthorpe     2018-08-09  442  		&pbundle->bundle.ufile->device->disassociate_srcu);
3a863577a74962 Jason Gunthorpe     2018-08-09  443  	if (!handler)
3a863577a74962 Jason Gunthorpe     2018-08-09  444  		return -EIO;
3a863577a74962 Jason Gunthorpe     2018-08-09  445  
155f04366e3cad Gustavo A. R. Silva 2024-03-01  446  	pbundle->uattrs = uverbs_alloc(bundle, uattrs_size);
3a863577a74962 Jason Gunthorpe     2018-08-09  447  	if (IS_ERR(pbundle->uattrs))
3a863577a74962 Jason Gunthorpe     2018-08-09  448  		return PTR_ERR(pbundle->uattrs);
3a863577a74962 Jason Gunthorpe     2018-08-09  449  	if (copy_from_user(pbundle->uattrs, pbundle->user_attrs, uattrs_size))
3a863577a74962 Jason Gunthorpe     2018-08-09  450  		return -EFAULT;
3a863577a74962 Jason Gunthorpe     2018-08-09  451  
3a863577a74962 Jason Gunthorpe     2018-08-09  452  	for (i = 0; i != num_attrs; i++) {
3a863577a74962 Jason Gunthorpe     2018-08-09  453  		ret = uverbs_set_attr(pbundle, &pbundle->uattrs[i]);
3a863577a74962 Jason Gunthorpe     2018-08-09  454  		if (unlikely(ret))
3a863577a74962 Jason Gunthorpe     2018-08-09  455  			return ret;
3a863577a74962 Jason Gunthorpe     2018-08-09  456  	}
3a863577a74962 Jason Gunthorpe     2018-08-09  457  
3a863577a74962 Jason Gunthorpe     2018-08-09  458  	/* User space did not provide all the mandatory attributes */
3a863577a74962 Jason Gunthorpe     2018-08-09  459  	if (unlikely(!bitmap_subset(pbundle->method_elm->attr_mandatory,
3a863577a74962 Jason Gunthorpe     2018-08-09  460  				    pbundle->bundle.attr_present,
3a863577a74962 Jason Gunthorpe     2018-08-09  461  				    pbundle->method_elm->key_bitmap_len)))
fac9658cabb98a Matan Barak         2017-08-03  462  		return -EINVAL;
fac9658cabb98a Matan Barak         2017-08-03  463  
07f05f40d956d4 Jason Gunthorpe     2018-11-25  464  	if (pbundle->method_elm->has_udata)
155f04366e3cad Gustavo A. R. Silva 2024-03-01  465  		uverbs_fill_udata(bundle, &pbundle->bundle.driver_udata,
4785860e04bc8d Jason Gunthorpe     2018-11-30  466  				  UVERBS_ATTR_UHW_IN, UVERBS_ATTR_UHW_OUT);
f89adedaf3feb2 Gal Pressman        2019-04-30  467  	else
f89adedaf3feb2 Gal Pressman        2019-04-30  468  		pbundle->bundle.driver_udata = (struct ib_udata){};
07f05f40d956d4 Jason Gunthorpe     2018-11-25  469  
3a863577a74962 Jason Gunthorpe     2018-08-09  470  	if (destroy_bkey != UVERBS_API_ATTR_BKEY_LEN) {
155f04366e3cad Gustavo A. R. Silva 2024-03-01  471  		struct uverbs_obj_attr *destroy_attr = &bundle->attrs[destroy_bkey].obj_attr;
fac9658cabb98a Matan Barak         2017-08-03  472  
155f04366e3cad Gustavo A. R. Silva 2024-03-01  473  		ret = uobj_destroy(destroy_attr->uobject, bundle);
aa72c9a5f98644 Jason Gunthorpe     2018-07-26  474  		if (ret)
3a863577a74962 Jason Gunthorpe     2018-08-09  475  			return ret;
3a863577a74962 Jason Gunthorpe     2018-08-09  476  		__clear_bit(destroy_bkey, pbundle->uobj_finalize);
aa72c9a5f98644 Jason Gunthorpe     2018-07-26  477  
155f04366e3cad Gustavo A. R. Silva 2024-03-01  478  		ret = handler(bundle);
3a863577a74962 Jason Gunthorpe     2018-08-09  479  		uobj_put_destroy(destroy_attr->uobject);
3a863577a74962 Jason Gunthorpe     2018-08-09  480  	} else {
155f04366e3cad Gustavo A. R. Silva 2024-03-01  481  		ret = handler(bundle);
7452a3c745a2e7 Jason Gunthorpe     2018-07-25  482  	}
7452a3c745a2e7 Jason Gunthorpe     2018-07-25  483  
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  484  	/*
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  485  	 * Until the drivers are revised to use the bundle directly we have to
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  486  	 * assume that the driver wrote to its UHW_OUT and flag userspace
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  487  	 * appropriately.
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  488  	 */
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  489  	if (!ret && pbundle->method_elm->has_udata) {
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  490  		const struct uverbs_attr *attr =
155f04366e3cad Gustavo A. R. Silva 2024-03-01  491  			uverbs_attr_get(bundle, UVERBS_ATTR_UHW_OUT);
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  492  
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  493  		if (!IS_ERR(attr))
155f04366e3cad Gustavo A. R. Silva 2024-03-01  494  			ret = uverbs_set_output(bundle, attr);
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  495  	}
d6f4a21f309dfe Jason Gunthorpe     2019-01-11  496  
3a863577a74962 Jason Gunthorpe     2018-08-09  497  	/*
3a863577a74962 Jason Gunthorpe     2018-08-09  498  	 * EPROTONOSUPPORT is ONLY to be returned if the ioctl framework can
3a863577a74962 Jason Gunthorpe     2018-08-09  499  	 * not invoke the method because the request is not supported.  No
3a863577a74962 Jason Gunthorpe     2018-08-09  500  	 * other cases should return this code.
3a863577a74962 Jason Gunthorpe     2018-08-09  501  	 */
3a863577a74962 Jason Gunthorpe     2018-08-09  502  	if (WARN_ON_ONCE(ret == -EPROTONOSUPPORT))
3a863577a74962 Jason Gunthorpe     2018-08-09  503  		return -EINVAL;
fac9658cabb98a Matan Barak         2017-08-03  504  
3a863577a74962 Jason Gunthorpe     2018-08-09  505  	return ret;
fac9658cabb98a Matan Barak         2017-08-03  506  }
fac9658cabb98a Matan Barak         2017-08-03  507  

:::::: The code at line 440 was first introduced by commit
:::::: 3a863577a7496278892360a69d90d8465733100c IB/uverbs: Use uverbs_api to unmarshal ioctl commands

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
