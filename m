Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678844119F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223030; cv=none; b=h6YdgW83xZ7jXKILaF4gqqcC7zNEClfwwBmdAIRSTFcN8fs3m/Dn6LAuCom7FTmehbUj1OOqbu8puLguh0PUW26LyuBcxGIEdZjcdKeZynRntHEVpo2GWbTQTSMwu6WyyTz0Ah7+C70mP6v0IrpXdHkQjnGwTMfyAyaiDhFlw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223030; c=relaxed/simple;
	bh=a28o2eYLBxIkXLJgCCTn4PBKsfhZtRnrpdSGrTZ8LWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FisEuI8EkbZQ+qWQY0Y1CI3CU7/qM8Bw1hbGXYiLA/KBXex5LDLuWUfDIwkkvcZrbBexRX5BUE4kGi5SXd4/4zGZo0bfhm0TphNUUJhytDDWhbjd60wQDPHJvEeML2BMZOC3ViiyxQD8Qq3Sg52GnrBc01wN+qG7bmVMNnnNNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIhp23KD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIhp23KD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790223028; x=1821759028;
  h=date:from:to:cc:subject:message-id;
  bh=a28o2eYLBxIkXLJgCCTn4PBKsfhZtRnrpdSGrTZ8LWs=;
  b=iIhp23KDo/mQ13fUuqFwXiWToNOgA1QCkX804+5b4XG6kCN9jHjrDr3T
   Yaq2m/ERxdipU5Ly4YvUFAOgyUYkBn6FSiv5ZsN0LfW/maZWgMKU+lbYH
   VB+4XVTAc0UuArVDBLh0Ul+jUL88JqywrfRWlUI6RghNFSUHd8aqgoUyf
   +ljUC2leiS62WPO4zt9sy62hA8dETy4Eojut03P+6I+ox5RMWi65s+7fz
   AJ7FdnRX73fRx1S95r7vFhYazotvVN/RIvIZGl0wrbzl+CYTjhNqBCXWI
   uQM5Y11Q3JBNZ8BToF+D1pJoGEZ9qQsLcVb7iq3mMLH4nvjk1+J5biiTc
   g==;
X-CSE-ConnectionGUID: 1qIgD5ZDQbaanJTeqPMZDQ==
X-CSE-MsgGUID: TbynIjq9Ra+7+NUxCOYZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91088594"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91088594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:10:25 -0700
X-CSE-ConnectionGUID: 3g59uvEsS8OIcmswCVT7qg==
X-CSE-MsgGUID: cN1GapasSGKzBORcnfc/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="300154557"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 21:10:23 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9amq-00000000IBc-2qmn;
	Thu, 24 Sep 2026 04:10:20 +0000
Date: Thu, 24 Sep 2026 12:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:
 sparse: incorrect type in assignment (different modifiers)
Message-ID: <202609241216.DmuxwLRI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: f0b7ce22d71810c8c11abcd912fbd6f57c2e9677 srcu: Support Clang's context analysis
date:   9 months ago
config: i386-randconfig-1300-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241216.DmuxwLRI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241216.DmuxwLRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241216.DmuxwLRI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *handler )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     expected int ( *handler )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     got int ( [noderef] *__v )( ... )

vim +440 drivers/infiniband/core/uverbs_ioctl.c

fac9658cabb98af Matan Barak         2017-08-03  427  
3a863577a749627 Jason Gunthorpe     2018-08-09  428  static int ib_uverbs_run_method(struct bundle_priv *pbundle,
3a863577a749627 Jason Gunthorpe     2018-08-09  429  				unsigned int num_attrs)
fac9658cabb98af Matan Barak         2017-08-03  430  {
15a1b4becba8861 Jason Gunthorpe     2018-11-25  431  	int (*handler)(struct uverbs_attr_bundle *attrs);
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  432  	struct uverbs_attr_bundle *bundle =
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  433  		container_of(&pbundle->bundle, struct uverbs_attr_bundle, hdr);
3a863577a749627 Jason Gunthorpe     2018-08-09  434  	size_t uattrs_size = array_size(sizeof(*pbundle->uattrs), num_attrs);
3a863577a749627 Jason Gunthorpe     2018-08-09  435  	unsigned int destroy_bkey = pbundle->method_elm->destroy_bkey;
3a863577a749627 Jason Gunthorpe     2018-08-09  436  	unsigned int i;
fac9658cabb98af Matan Barak         2017-08-03  437  	int ret;
fac9658cabb98af Matan Barak         2017-08-03  438  
3a863577a749627 Jason Gunthorpe     2018-08-09  439  	/* See uverbs_disassociate_api() */
3a863577a749627 Jason Gunthorpe     2018-08-09 @440  	handler = srcu_dereference(
3a863577a749627 Jason Gunthorpe     2018-08-09  441  		pbundle->method_elm->handler,
3a863577a749627 Jason Gunthorpe     2018-08-09  442  		&pbundle->bundle.ufile->device->disassociate_srcu);
3a863577a749627 Jason Gunthorpe     2018-08-09  443  	if (!handler)
3a863577a749627 Jason Gunthorpe     2018-08-09  444  		return -EIO;
3a863577a749627 Jason Gunthorpe     2018-08-09  445  
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  446  	pbundle->uattrs = uverbs_alloc(bundle, uattrs_size);
3a863577a749627 Jason Gunthorpe     2018-08-09  447  	if (IS_ERR(pbundle->uattrs))
3a863577a749627 Jason Gunthorpe     2018-08-09  448  		return PTR_ERR(pbundle->uattrs);
3a863577a749627 Jason Gunthorpe     2018-08-09  449  	if (copy_from_user(pbundle->uattrs, pbundle->user_attrs, uattrs_size))
3a863577a749627 Jason Gunthorpe     2018-08-09  450  		return -EFAULT;
3a863577a749627 Jason Gunthorpe     2018-08-09  451  
3a863577a749627 Jason Gunthorpe     2018-08-09  452  	for (i = 0; i != num_attrs; i++) {
3a863577a749627 Jason Gunthorpe     2018-08-09  453  		ret = uverbs_set_attr(pbundle, &pbundle->uattrs[i]);
3a863577a749627 Jason Gunthorpe     2018-08-09  454  		if (unlikely(ret))
3a863577a749627 Jason Gunthorpe     2018-08-09  455  			return ret;
3a863577a749627 Jason Gunthorpe     2018-08-09  456  	}
3a863577a749627 Jason Gunthorpe     2018-08-09  457  
3a863577a749627 Jason Gunthorpe     2018-08-09  458  	/* User space did not provide all the mandatory attributes */
3a863577a749627 Jason Gunthorpe     2018-08-09  459  	if (unlikely(!bitmap_subset(pbundle->method_elm->attr_mandatory,
3a863577a749627 Jason Gunthorpe     2018-08-09  460  				    pbundle->bundle.attr_present,
3a863577a749627 Jason Gunthorpe     2018-08-09  461  				    pbundle->method_elm->key_bitmap_len)))
fac9658cabb98af Matan Barak         2017-08-03  462  		return -EINVAL;
fac9658cabb98af Matan Barak         2017-08-03  463  
07f05f40d956d40 Jason Gunthorpe     2018-11-25  464  	if (pbundle->method_elm->has_udata)
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  465  		uverbs_fill_udata(bundle, &pbundle->bundle.driver_udata,
4785860e04bc8d7 Jason Gunthorpe     2018-11-30  466  				  UVERBS_ATTR_UHW_IN, UVERBS_ATTR_UHW_OUT);
f89adedaf3feb2e Gal Pressman        2019-04-30  467  	else
f89adedaf3feb2e Gal Pressman        2019-04-30  468  		pbundle->bundle.driver_udata = (struct ib_udata){};
07f05f40d956d40 Jason Gunthorpe     2018-11-25  469  
3a863577a749627 Jason Gunthorpe     2018-08-09  470  	if (destroy_bkey != UVERBS_API_ATTR_BKEY_LEN) {
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  471  		struct uverbs_obj_attr *destroy_attr = &bundle->attrs[destroy_bkey].obj_attr;
fac9658cabb98af Matan Barak         2017-08-03  472  
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  473  		ret = uobj_destroy(destroy_attr->uobject, bundle);
aa72c9a5f986444 Jason Gunthorpe     2018-07-26  474  		if (ret)
3a863577a749627 Jason Gunthorpe     2018-08-09  475  			return ret;
3a863577a749627 Jason Gunthorpe     2018-08-09  476  		__clear_bit(destroy_bkey, pbundle->uobj_finalize);
aa72c9a5f986444 Jason Gunthorpe     2018-07-26  477  
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  478  		ret = handler(bundle);
3a863577a749627 Jason Gunthorpe     2018-08-09  479  		uobj_put_destroy(destroy_attr->uobject);
3a863577a749627 Jason Gunthorpe     2018-08-09  480  	} else {
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  481  		ret = handler(bundle);
7452a3c745a2e7e Jason Gunthorpe     2018-07-25  482  	}
7452a3c745a2e7e Jason Gunthorpe     2018-07-25  483  
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  484  	/*
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  485  	 * Until the drivers are revised to use the bundle directly we have to
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  486  	 * assume that the driver wrote to its UHW_OUT and flag userspace
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  487  	 * appropriately.
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  488  	 */
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  489  	if (!ret && pbundle->method_elm->has_udata) {
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  490  		const struct uverbs_attr *attr =
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  491  			uverbs_attr_get(bundle, UVERBS_ATTR_UHW_OUT);
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  492  
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  493  		if (!IS_ERR(attr))
155f04366e3cad7 Gustavo A. R. Silva 2024-03-01  494  			ret = uverbs_set_output(bundle, attr);
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  495  	}
d6f4a21f309dfe1 Jason Gunthorpe     2019-01-11  496  
3a863577a749627 Jason Gunthorpe     2018-08-09  497  	/*
3a863577a749627 Jason Gunthorpe     2018-08-09  498  	 * EPROTONOSUPPORT is ONLY to be returned if the ioctl framework can
3a863577a749627 Jason Gunthorpe     2018-08-09  499  	 * not invoke the method because the request is not supported.  No
3a863577a749627 Jason Gunthorpe     2018-08-09  500  	 * other cases should return this code.
3a863577a749627 Jason Gunthorpe     2018-08-09  501  	 */
3a863577a749627 Jason Gunthorpe     2018-08-09  502  	if (WARN_ON_ONCE(ret == -EPROTONOSUPPORT))
3a863577a749627 Jason Gunthorpe     2018-08-09  503  		return -EINVAL;
fac9658cabb98af Matan Barak         2017-08-03  504  
3a863577a749627 Jason Gunthorpe     2018-08-09  505  	return ret;
fac9658cabb98af Matan Barak         2017-08-03  506  }
fac9658cabb98af Matan Barak         2017-08-03  507  

:::::: The code at line 440 was first introduced by commit
:::::: 3a863577a7496278892360a69d90d8465733100c IB/uverbs: Use uverbs_api to unmarshal ioctl commands

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
