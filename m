Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5922612
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521020; cv=none; b=ZvdnIITXvr3iTRHm2AFkYPaxktotrEhwe18IN80eQg7qpOkRzz2df0iJEQTAyPMXn9AuQWQsRpRhCQ/CbJ3n4gaN1CwPJEkJ1cTaWJNrVb0Zx1U/ZWCGIzenKfEvjNTvimVGQi8nuhJgE+qkwHhwoSGAwCPdjxQM+xVoJ/QnoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521020; c=relaxed/simple;
	bh=KsnWOYwTZh1ceIrN/xKOtiVfCs23mVB5eEtTANRuUDw=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=dPZJpiqVHEXFPA917WYYY5vld32nMZhk8by5BTbVxO/QpN9ataL2kHjCbbf2kbljDeUf6RkjqY3R5GAR0Fb6NousJGRxxR5ZqSMUXd3Gpye9ksqxZhS0lkp5BWe3r/lq7jjF9w2nk3mIWlIdJSF0f1ALf81ra8flRpy4ndeQPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MO1UavWO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MO1UavWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705521018; x=1737057018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KsnWOYwTZh1ceIrN/xKOtiVfCs23mVB5eEtTANRuUDw=;
  b=MO1UavWOiPAP6wHu76H+ltZfRxVfbfQFCXsgd/ZuMA5QTMi5cQ2oGMGr
   db0RBnKR5VSb9WRqKq3GLQT++jsPQ+LdPdEMBhjdnqLj6VLEIbpBF99r7
   egP8Kpc/ZocZ42AWueJnJZesRn/GNE8i6K96R5ua0xTxaewy2BMdnWjV5
   okwWiA3frfzZVaXKQoIe6OzOJtLF1JqB8Nkrv1kwmkQMrUf0NlpP05lZV
   LrzJxl5wMyYtqBXkP/9adNF8LFzLavnAhbp25g1WZpsZkWJ69kU+H/tWM
   b+usPYBTQw/upFBdq+ZZ3xRORxS4H6uaoFf3453OyxHWo5PVs+DVfbgNt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7349221"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7349221"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 11:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="18915505"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2024 11:50:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQBvR-0002Ia-1D;
	Wed, 17 Jan 2024 19:50:13 +0000
Date: Thu, 18 Jan 2024 03:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 77/105] fs/ceph/xattr.c:1415:28: error:
 'struct ceph_databuf' has no member named 'length'
Message-ID: <202401180333.BY5bzpZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 5f8e8cf45a6f84108c392fdf99ccab5c44d5bb79 [77/105] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: x86_64-buildonly-randconfig-005-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180333.BY5bzpZv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180333.BY5bzpZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180333.BY5bzpZv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:5,
                    from include/linux/ceph/ceph_debug.h:7,
                    from fs/ceph/xattr.c:2:
   fs/ceph/xattr.c: In function 'ceph_security_init_secctx':
>> fs/ceph/xattr.c:1415:28: error: 'struct ceph_databuf' has no member named 'length'
    1415 |                 BUG_ON(dbuf->length <= sizeof(__le32));
         |                            ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/ceph/xattr.c:1415:17: note: in expansion of macro 'BUG_ON'
    1415 |                 BUG_ON(dbuf->length <= sizeof(__le32));
         |                 ^~~~~~


vim +1415 fs/ceph/xattr.c

  1374	
  1375	#ifdef CONFIG_CEPH_FS_SECURITY_LABEL
  1376	int ceph_security_init_secctx(struct dentry *dentry, umode_t mode,
  1377				   struct ceph_acl_sec_ctx *as_ctx)
  1378	{
  1379		struct ceph_databuf *dbuf = as_ctx->dbuf;
  1380		const char *name;
  1381		size_t name_len;
  1382		int err;
  1383	
  1384		err = security_dentry_init_security(dentry, mode, &dentry->d_name,
  1385						    &name, &as_ctx->sec_ctx,
  1386						    &as_ctx->sec_ctxlen);
  1387		if (err < 0) {
  1388			WARN_ON_ONCE(err != -EOPNOTSUPP);
  1389			err = 0; /* do nothing */
  1390			goto out;
  1391		}
  1392	
  1393		err = -ENOMEM;
  1394		if (!dbuf) {
  1395			dbuf = ceph_databuf_req_alloc(0, PAGE_SIZE, GFP_KERNEL);
  1396			if (!dbuf)
  1397				goto out;
  1398			ceph_databuf_encode_32(dbuf, 1);
  1399		}
  1400	
  1401		/*
  1402		 * FIXME: Make security_dentry_init_security() generic. Currently
  1403		 * It only supports single security module and only selinux has
  1404		 * dentry_init_security hook.
  1405		 */
  1406		name_len = strlen(name);
  1407		err = ceph_databuf_reserve(dbuf, 4 * 2 + name_len + as_ctx->sec_ctxlen,
  1408					   GFP_KERNEL);
  1409		if (err)
  1410			goto out;
  1411	
  1412		if (as_ctx->dbuf) {
  1413			/* update count of KV pairs */
  1414			__le32 *addr = kmap_ceph_databuf_page(dbuf, 0);
> 1415			BUG_ON(dbuf->length <= sizeof(__le32));
  1416			le32_add_cpu(addr, 1);
  1417			kunmap_local(addr);
  1418		} else {
  1419			as_ctx->dbuf = dbuf;
  1420		}
  1421	
  1422		ceph_databuf_encode_32(dbuf, name_len);
  1423		ceph_databuf_append(dbuf, name, name_len);
  1424	
  1425		ceph_databuf_encode_32(dbuf, as_ctx->sec_ctxlen);
  1426		ceph_databuf_append(dbuf, as_ctx->sec_ctx, as_ctx->sec_ctxlen);
  1427	
  1428		err = 0;
  1429	out:
  1430		if (dbuf && !as_ctx->dbuf)
  1431			ceph_databuf_release(dbuf);
  1432		return err;
  1433	}
  1434	#endif /* CONFIG_CEPH_FS_SECURITY_LABEL */
  1435	#endif /* CONFIG_SECURITY */
  1436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
