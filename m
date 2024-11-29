Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA350189BAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732914356; cv=none; b=Q0Y8t5cVKHvo4nraA0/PSfOtei19a1jlWNIhbsjkFf2Rf0bsWg2ObIgBYpkNPFqYVDLSx7zklDWzUvYG23MMLi0l+dz8limm4a5TyNGEs55bq0R+HJCml8+Z+8x00OxVLTakoEZb6hW9hrdwAw9FpyIH4s1WBd5edm0edwFx5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732914356; c=relaxed/simple;
	bh=bUYCyB/2Kf7VUT4HHqI218w8Y3gdlYTfbCp7NMlUga4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLnC9U9VuUb8VZC4LWEydIWPf5uxc2x/BzloV1ufjZPC3+UX3cOIFBjbfqk6Y7b6mhznhwfZ5C+vfWfyN0s04OQj6ZO+oxxCJOEPkKAn4HqgoDNklS0FU93SvL+DQ59tXCnLmFKAjgE0DeW+ArkIYZPAfBqQ4xE7qsXLAAOQTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSv0Ydic; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSv0Ydic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732914355; x=1764450355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUYCyB/2Kf7VUT4HHqI218w8Y3gdlYTfbCp7NMlUga4=;
  b=GSv0YdicCCwNQnr6zQvwD7/CjZ7D2sWqYRUe40Uia0/cSgg5VHRwhCC9
   LYYBGVrtLqPaWvg3X7g1zBBRktsfQEkukcCDwQuqYI3LHaqU6RwE6K4K4
   fouwmBQHVAucLs+k4LYb96H8Np3nwOVQMpFIwFHl2divo/Zpebg8sVRoS
   Ez6qTnVExdeUgGghpr/Hm6iDF6X+UuNA8z8eicONtaEp3bE7CzKLdjnJS
   o+fe3lOSIwWCAWHNJL+jexeNDOBzexTKCfdaKl55LTN6RyDybjEiE57jl
   jXggHXImbXHU+el84kvv9xyogqt/t1sMS2Lxv2G6pp2Xsa2n3f+2DUXnW
   Q==;
X-CSE-ConnectionGUID: if0T8CgZQLGV2ybUFijYUA==
X-CSE-MsgGUID: VtUDEJcmSS2BtmDzzODe8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33303140"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="33303140"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 13:05:55 -0800
X-CSE-ConnectionGUID: RdJGwd64QNGpXWZtECyeuQ==
X-CSE-MsgGUID: CeKqquxES5CMPGKrRW8cpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="93402362"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2024 13:05:53 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH8BT-0000hF-0W;
	Fri, 29 Nov 2024 21:05:51 +0000
Date: Sat, 30 Nov 2024 05:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 65/92] fs/ceph/xattr.c:1415:28: error:
 'struct ceph_databuf' has no member named 'length'
Message-ID: <202411300440.Pds5nqNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: 41b093aa8bfc8c510043df71d06b6dba4808c863 [65/92] ceph: Convert ceph_mds_request::r_pagelist to a databuf
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300440.Pds5nqNc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300440.Pds5nqNc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300440.Pds5nqNc-lkp@intel.com/

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
