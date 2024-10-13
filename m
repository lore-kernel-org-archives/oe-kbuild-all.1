Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD81465AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728857771; cv=none; b=K5fvFPLvI9BA06x+baxE0D+B4ax/Y2XGmlFRsGNQGcSU8fdIn/r/kLJ2zOxh3ccIIBOgW7/NVp+A8EhWWZHeBQY6c2IuK2x4jAJsR9yUTHvMGVJ/UIfcFsC1p7cNkXD/7FFn5BJwswhKMCbKmxHnKZHoftksfztl7ontKG9LpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728857771; c=relaxed/simple;
	bh=G2M9na4ul8h3CZEPcg4HOJywhnhx9P48xKmGBp0Jc20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFeq0MlqOuiWWYZbKTvYtMEIdRisCasrLOvFIkNEQMq9VAQkISWkBYxHLLn5+KIV+5ZqLy3SPT/jT0Gdgcv4z7IGTCvwuR3ZNkJQlRCJxTmGYjYmQy5hAwX7wEZqYWq5equznFqF5hTeOYxBdSv9WElyRGOzZy3Cu8puNTk433I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kakFWm8a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kakFWm8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728857769; x=1760393769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2M9na4ul8h3CZEPcg4HOJywhnhx9P48xKmGBp0Jc20=;
  b=kakFWm8aVj3jtgGmYO6B9HGuOa32y0vLPSdiUU1fC/jjCI7ZC310FpWG
   gDDgLjGxFs5hzbj8UKl3ovA/Te7I/AOJU3BJa4XCp2LtAhfJQvff/7ruA
   XBle2RHJuGuA29zpsRh90aWSPz+aW9U/IXgnljgV4yZyzB14oI4Ws9D67
   sP/NRnEi6ckofEiJQhFhYZPHUgBIpfF+v/Wyr+1uKc0lL4KPKglQnFyw0
   t13b4ItK7Y6tE2uwKPTBz4TETgsx03v1ku0gO/GOqVY0el3LaLwDHqfVq
   JlE9GW3zZlAC1HJaeE99gmxaDEUL43WXjbAYjDaYPzWDI1OCCNf9RLjQi
   A==;
X-CSE-ConnectionGUID: iz2jT4O5SUS8iVJCqj2Mwg==
X-CSE-MsgGUID: xcF2+f3ASj+s2D5CkgkklA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="31993720"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="31993720"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 15:16:08 -0700
X-CSE-ConnectionGUID: jE0c1BzdS36lwBDDyGBFnw==
X-CSE-MsgGUID: Ta+82W3VSdOqzazS3FpkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="82009988"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2024 15:16:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t06sf-000EjL-08;
	Sun, 13 Oct 2024 22:16:05 +0000
Date: Mon, 14 Oct 2024 06:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 2468/4143] fs/dax.c:1271: undefined reference to
 `iomap_want_unshare_iter'
Message-ID: <202410140606.7U5MISGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 6ef6a0e821d3dad6bf8a5d5508762dba9042c84b [2468/4143] iomap: share iomap_unshare_iter predicate code with fsdax
config: x86_64-buildonly-randconfig-001-20241014 (https://download.01.org/0day-ci/archive/20241014/202410140606.7U5MISGJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140606.7U5MISGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140606.7U5MISGJ-lkp@intel.com/

Note: the linux-next/master HEAD d61a00525464bfc5fe92c6ad713350988e492b88 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `dax_unshare_iter':
>> fs/dax.c:1271: undefined reference to `iomap_want_unshare_iter'


vim +1271 fs/dax.c

  1260	
  1261	static s64 dax_unshare_iter(struct iomap_iter *iter)
  1262	{
  1263		struct iomap *iomap = &iter->iomap;
  1264		const struct iomap *srcmap = iomap_iter_srcmap(iter);
  1265		loff_t pos = iter->pos;
  1266		loff_t length = iomap_length(iter);
  1267		int id = 0;
  1268		s64 ret = 0;
  1269		void *daddr = NULL, *saddr = NULL;
  1270	
> 1271		if (!iomap_want_unshare_iter(iter))
  1272			return length;
  1273	
  1274		id = dax_read_lock();
  1275		ret = dax_iomap_direct_access(iomap, pos, length, &daddr, NULL);
  1276		if (ret < 0)
  1277			goto out_unlock;
  1278	
  1279		/* zero the distance if srcmap is HOLE or UNWRITTEN */
  1280		if (srcmap->flags & IOMAP_F_SHARED || srcmap->type == IOMAP_UNWRITTEN) {
  1281			memset(daddr, 0, length);
  1282			dax_flush(iomap->dax_dev, daddr, length);
  1283			ret = length;
  1284			goto out_unlock;
  1285		}
  1286	
  1287		ret = dax_iomap_direct_access(srcmap, pos, length, &saddr, NULL);
  1288		if (ret < 0)
  1289			goto out_unlock;
  1290	
  1291		if (copy_mc_to_kernel(daddr, saddr, length) == 0)
  1292			ret = length;
  1293		else
  1294			ret = -EIO;
  1295	
  1296	out_unlock:
  1297		dax_read_unlock(id);
  1298		return dax_mem2blk_err(ret);
  1299	}
  1300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
