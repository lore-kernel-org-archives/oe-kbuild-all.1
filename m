Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0520EE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692747830; x=1724283830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzUAPeBbu1RTl1wwTTcIEBpAagMzR+rGKnTGtctmNAI=;
  b=e5Hek9evA+1/NpverU++w1r/I347x4LANTaBZkMpq5SaxrT5MULZLCJh
   V8z355eQj0zm9bS9RAO2+HBLgK+fGYcE511ihyq6ij/P3ssJlML12FAuM
   xV8gLbb1G74ocFmXr0nDqFEoCcJy3ByJc1Ul7Spf4Joutpe+p/Zxf7VPO
   6myx68by0oGJpt/9s8jrgDOINDcG1VLlyPJ64auV7dPsz10D2N6rx+krA
   +rq2WxsJA9NTjLDy9EX+XvO58fgArtssN0BjYvYYa+DoiJPTdH2hz5iDF
   LOxbFe7kPiZsHojw5p492iXupTnI/AZrNZ7pJrXl1SRaDgJ17t5/zePQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377780337"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="377780337"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 16:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="806471316"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806471316"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 16:43:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYb2J-0000cs-12;
	Tue, 22 Aug 2023 23:43:47 +0000
Date: Wed, 23 Aug 2023 07:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 11/30] fs/ceph/xattr.c:1414:28: error:
 'struct ceph_databuf' has no member named 'length'
Message-ID: <202308230714.dft8H3xO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d98064c4bf02eba42e22917aecccfb339c094d26
commit: b37faadb921b2c2fa9de4cd1995240f31d7d82ec [11/30] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230714.dft8H3xO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230714.dft8H3xO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230714.dft8H3xO-lkp@intel.com/

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
