Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980EE4F20C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725735144; cv=none; b=rWRtyGbOjjd03LWOj0XjjfGjbpeyeW6OtZDYKJ7pLX5K/Pa+s4kXpQr6Xc0wgfsVldUBaLx8srCdbn5ibLj3Y81/+owlvYtMrf17iKOJjAoEhOVFTmSJp41rNoTObdb+p/ejWZLS0DV8BuWbTLDO+efHfp/MnyL4QhbWYZMu2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725735144; c=relaxed/simple;
	bh=S+M6yH7FxwkW1l5lkEgGHQXuh9u7RNbBX4D4PSAQ/sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxP5x5VAHRQ90+TCd/+rozHfjkARkZbjZxcFRWjdRYWfeJKf8tASO9Ks33Dr/ObDg+7xtcg5EjQqXZAUaFthAFoq7KwCSq9JQ7nOoxo8P7fnrGGYzPuUXvsaQv7p19ENsi7BCWTyYDORNFDhPaA+BVNRjZ9un2UsFHueGSjjzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3795kFt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3795kFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725735141; x=1757271141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+M6yH7FxwkW1l5lkEgGHQXuh9u7RNbBX4D4PSAQ/sI=;
  b=R3795kFtrsC6ZMJnFdG0CGq6TNruNpKifnw2FS8gDl+XrpzI3tbbe0lf
   cLj/+Q/ete5kjs4BDsKzf+hLbMduFJusuMvwphhYYYNNzqgKHsB3gS/jP
   G5bSrSS6VAykt22knOElGKv4BmlqFwgp7hsw0VMvvDyCZfGCxEUU5lSp2
   3RBHbPdyKM3tY8IYy5c+nTZyF1zfHje5+2tDI8CkXQJIR138F6GtFpsAP
   gvNdJWoVFxA8iadGGnBC/jnsD/jimLRU2hnjvPTt2pq7t2u6EMwJK46V1
   IlutM/+y51BaTdNJWMmOJ+4yQbCW9wzIt1yehlsp0IzkXNHYtlo1foDkF
   g==;
X-CSE-ConnectionGUID: /vJQ5O2BRUWJLstGFT5nVA==
X-CSE-MsgGUID: n96wopQIR1uAdACpNGXc8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41951149"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="41951149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 11:52:21 -0700
X-CSE-ConnectionGUID: zIKRAfJaSkqRscbk6m5sDw==
X-CSE-MsgGUID: fm7mibpOSnW85JYE9MQnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66048901"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 11:52:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn0Xh-000Crp-2w;
	Sat, 07 Sep 2024 18:52:17 +0000
Date: Sun, 8 Sep 2024 02:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 34/61] fs/ceph/xattr.c:1415:28: error:
 'struct ceph_databuf' has no member named 'length'
Message-ID: <202409080238.sunCNxOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 8726f42ad95180ef7b6cafebb2098d6499a4d29b [34/61] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409080238.sunCNxOd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080238.sunCNxOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080238.sunCNxOd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
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
