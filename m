Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA1185A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693379951; x=1724915951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGiQ0H3OwrKD2HRv/UhLvkrrXRXoXfb81lKdhq9ffds=;
  b=C9EyZyNK90AXbXf3ChUrZ/6CAo/Q54uXZnlGxoLW5V2GxLCUKw1SlR0A
   6SgO0KwTS5ow1k6XrABW8NXjLkv6xi9TSRNR1RYse+qXtX2q2dMysDk6o
   mrsK3mMvD/vhJ2g9CplibiuZLsdCpWalrI6ZawIu0x8DQ2tjZKmoneubd
   ONpx+1GUn+lhUs0/ZcsO0IsIHCK85uChgpWAkjw9QBPbNnwKJjKAX5Fwl
   UI5Fjitl1k4K58W7eK3udXYqPuyiyNcOfHCL0AJsa5ig9uvZDBRzlrcDv
   Ook3KujBkI5DAfQUd/jqyaUTpi/uBKrQvfpyXBaTi9hlPerSPeAxfqoaa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379324123"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="379324123"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768323423"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="768323423"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 00:19:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFTj-0009YX-14;
	Wed, 30 Aug 2023 07:19:03 +0000
Date: Wed, 30 Aug 2023 15:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 11/36] fs/ceph/xattr.c:1414:28: error:
 'struct ceph_databuf' has no member named 'length'
Message-ID: <202308301539.XjH6kb1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d9c2320ef61eb3f02f0f9cbb4b8811c9991160ac
commit: 9af69041aef0a8a9db352e4ba0f94be00063168d [11/36] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20230830/202308301539.XjH6kb1Q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301539.XjH6kb1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301539.XjH6kb1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:5,
                    from include/linux/ceph/ceph_debug.h:7,
                    from fs/ceph/xattr.c:2:
   fs/ceph/xattr.c: In function 'ceph_security_init_secctx':
>> fs/ceph/xattr.c:1414:28: error: 'struct ceph_databuf' has no member named 'length'
    1414 |                 BUG_ON(dbuf->length <= sizeof(__le32));
         |                            ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/ceph/xattr.c:1414:17: note: in expansion of macro 'BUG_ON'
    1414 |                 BUG_ON(dbuf->length <= sizeof(__le32));
         |                 ^~~~~~


vim +1414 fs/ceph/xattr.c

  1373	
  1374	#ifdef CONFIG_CEPH_FS_SECURITY_LABEL
  1375	int ceph_security_init_secctx(struct dentry *dentry, umode_t mode,
  1376				   struct ceph_acl_sec_ctx *as_ctx)
  1377	{
  1378		struct ceph_databuf *dbuf = as_ctx->dbuf;
  1379		const char *name;
  1380		size_t name_len;
  1381		int err;
  1382	
  1383		err = security_dentry_init_security(dentry, mode, &dentry->d_name,
  1384						    &name, &as_ctx->sec_ctx,
  1385						    &as_ctx->sec_ctxlen);
  1386		if (err < 0) {
  1387			WARN_ON_ONCE(err != -EOPNOTSUPP);
  1388			err = 0; /* do nothing */
  1389			goto out;
  1390		}
  1391	
  1392		err = -ENOMEM;
  1393		if (!dbuf) {
  1394			dbuf = ceph_databuf_req_alloc(0, PAGE_SIZE, GFP_KERNEL);
  1395			if (!dbuf)
  1396				goto out;
  1397			ceph_databuf_encode_32(dbuf, 1);
  1398		}
  1399	
  1400		/*
  1401		 * FIXME: Make security_dentry_init_security() generic. Currently
  1402		 * It only supports single security module and only selinux has
  1403		 * dentry_init_security hook.
  1404		 */
  1405		name_len = strlen(name);
  1406		err = ceph_databuf_reserve(dbuf, 4 * 2 + name_len + as_ctx->sec_ctxlen,
  1407					   GFP_KERNEL);
  1408		if (err)
  1409			goto out;
  1410	
  1411		if (as_ctx->dbuf) {
  1412			/* update count of KV pairs */
  1413			__le32 *addr = kmap_ceph_databuf_page(dbuf, 0);
> 1414			BUG_ON(dbuf->length <= sizeof(__le32));
  1415			le32_add_cpu(addr, 1);
  1416			kunmap_local(addr);
  1417		} else {
  1418			as_ctx->dbuf = dbuf;
  1419		}
  1420	
  1421		ceph_databuf_encode_32(dbuf, name_len);
  1422		ceph_databuf_append(dbuf, name, name_len);
  1423	
  1424		ceph_databuf_encode_32(dbuf, as_ctx->sec_ctxlen);
  1425		ceph_databuf_append(dbuf, as_ctx->sec_ctx, as_ctx->sec_ctxlen);
  1426	
  1427		err = 0;
  1428	out:
  1429		if (dbuf && !as_ctx->dbuf)
  1430			ceph_databuf_release(dbuf);
  1431		return err;
  1432	}
  1433	#endif /* CONFIG_CEPH_FS_SECURITY_LABEL */
  1434	#endif /* CONFIG_SECURITY */
  1435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
