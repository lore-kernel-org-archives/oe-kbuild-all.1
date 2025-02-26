Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66B2620D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 23:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613309; cv=none; b=AeDXNUVjPNgwhxT9KZWq77ZC1V2yQV1chTgpyf9sTUtBH+v9IyiXyoZ3IS2QRmzqm494SHbsxGiKNgZvjkY1WRMqh5gIBbH5eETwlbuRZMet+voCfPoxqXILF7rYTDZlYG1yo6xTLz4NMfMoqxZd2bJfGZ2d7vgIYuMFRpR+EdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613309; c=relaxed/simple;
	bh=TwNcZrnsb6XFNQft5L8dQghJKtV/OvrkaOwWaDhIVMs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YjJOeHSQ1jBaljaSXBeGKVkeOe20Owao7yNM+oXwG48sHB5KwT4qqjt1tvqLuM4ENuF1ZLrhf9eNaeO3wZ1iU/eur6wCJvx3ly+bgn4ad10OYhF7BuoivJcPhPMubiES5//9bwWrBOubncKdOA88Cu53sO+fRufKaN2JG0FoR48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWnqLDcC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWnqLDcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740613307; x=1772149307;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TwNcZrnsb6XFNQft5L8dQghJKtV/OvrkaOwWaDhIVMs=;
  b=dWnqLDcC4K4C9WXIhagZHgkuSNbu6v1GT+rIyxD0jDl3N5iuaJdXNlUG
   fv+TbAL/px4IaF6G2AzyBA8aTC8Ef8OzS7Lz7Pj1cNFb2uTdc3PAKNSZj
   w5RBxZXEatpvNiX0fBXTsRFMW/Ua8sfVOgVZjpHYU91WKPLo/AfOSBmh4
   OqCt9lRT6ab+qujLOmJ+DJSpufdvRca8Y9IUAM7N9r0pfRB7Elyv6bPnQ
   2fWGP87PPwbuUz2J/xv+wzkumksAsmjUxbSGh0nqwLdLAOUDTtcoKlkOj
   rvz0tsNDDQ8EbWaBqVn+skK1xrQmNlDQkAFE/VmAYJVhIjZEBoJ+85seT
   g==;
X-CSE-ConnectionGUID: /9pWTGWURlaoPtYBkwdtlQ==
X-CSE-MsgGUID: yv8HwgOUSwmGyvQQqj+xUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29088399"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="29088399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 15:41:46 -0800
X-CSE-ConnectionGUID: xTVf9nfZRXuR0mIPgYNv3Q==
X-CSE-MsgGUID: k3i705/pS5maPnhiAy9KoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="121446391"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2025 15:41:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnR27-000CbW-2Q
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 23:41:43 +0000
Date: Thu, 27 Feb 2025 07:41:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:255:15: warning: array
 subscript <unknown> is outside array bounds of 'struct
 etnaviv_gem_submit_bo[0]'
Message-ID: <202502270713.UsDPznMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: fd4b77e8deea9cced6c1eca8bd64d2f03fc7cc94 [1/1] drm/etnaviv: don't restrict to certain architectures
config: riscv-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250227/202502270713.UsDPznMR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270713.UsDPznMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270713.UsDPznMR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c: In function 'submit_lock_objects':
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:125:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     125 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:132:34: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     132 |                 if (!(submit->bos[i].flags & BO_LOCKED)) {
         |                       ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:140:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     140 |                         submit->bos[i].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:140:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     140 |                         submit->bos[i].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:158:42: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     158 |                 etnaviv_obj = submit->bos[contended].obj;
         |                               ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:164:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     164 |                         submit->bos[contended].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:164:36: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     164 |                         submit->bos[contended].flags |= BO_LOCKED;
         |                         ~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_lookup_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:513:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:79:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      79 |                 submit->bos[i].flags = bo->flags;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_lookup_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:513:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:98:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      98 |                 submit->bos[i].obj = to_etnaviv_bo(obj);
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_pin_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:531:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:228:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     228 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_pin_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:531:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:239:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     239 |                 submit->bos[i].flags |= BO_PINNED;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_pin_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:531:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:239:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     239 |                 submit->bos[i].flags |= BO_PINNED;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_pin_objects',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:531:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:240:28: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     240 |                 submit->bos[i].mapping = mapping;
         |                 ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_bo',
       inlined from 'submit_reloc' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:294:9,
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:535:8:
>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:255:15: warning: array subscript <unknown> is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     255 |         *bo = &submit->bos[idx];
         |               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_bo',
       inlined from 'submit_perfmon_validate' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:321:9,
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:540:8:
>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:255:15: warning: array subscript <unknown> is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     255 |         *bo = &submit->bos[idx];
         |               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:178:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     178 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     191 |                         ret = reservation_object_get_fences_rcu(robj, &bo->excl,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                                                                 &bo->nr_shared,
         |                                                                 ~~~~~~~~~~~~~~~
     193 |                                                                 &bo->shared);
         |                                                                 ~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     191 |                         ret = reservation_object_get_fences_rcu(robj, &bo->excl,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                                                                 &bo->nr_shared,
         |                                                                 ~~~~~~~~~~~~~~~
     193 |                                                                 &bo->shared);
         |                                                                 ~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_fence_sync',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:550:8:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:191:31: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     191 |                         ret = reservation_object_get_fences_rcu(robj, &bo->excl,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                                                                 &bo->nr_shared,
         |                                                                 ~~~~~~~~~~~~~~~
     193 |                                                                 &bo->shared);
         |                                                                 ~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_attach_object_fences',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:558:2:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:210:69: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     210 |                 struct etnaviv_gem_object *etnaviv_obj = submit->bos[i].obj;
         |                                                          ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
   In function 'submit_attach_object_fences',
       inlined from 'etnaviv_ioctl_gem_submit' at drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:558:2:
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:212:32: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
     212 |                 if (submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE)
         |                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h: In function 'etnaviv_ioctl_gem_submit':
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
--
   drivers/gpu/drm/etnaviv/etnaviv_sched.c: In function 'etnaviv_sched_dependency':
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   In file included from drivers/gpu/drm/etnaviv/etnaviv_sched.c:10:
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~
>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:39:64: warning: array subscript i is outside array bounds of 'struct etnaviv_gem_submit_bo[0]' [-Warray-bounds=]
      39 |                 struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
         |                                                     ~~~~~~~~~~~^~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.h:110:38: note: while referencing 'bos'
     110 |         struct etnaviv_gem_submit_bo bos[0];
         |                                      ^~~


vim +255 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c

a8c21a5451d831 The etnaviv authors 2015-12-03  245  
a8c21a5451d831 The etnaviv authors 2015-12-03  246  static int submit_bo(struct etnaviv_gem_submit *submit, u32 idx,
8779aa8f8b7fa3 Russell King        2016-01-21  247  	struct etnaviv_gem_submit_bo **bo)
a8c21a5451d831 The etnaviv authors 2015-12-03  248  {
a8c21a5451d831 The etnaviv authors 2015-12-03  249  	if (idx >= submit->nr_bos) {
a8c21a5451d831 The etnaviv authors 2015-12-03  250  		DRM_ERROR("invalid buffer index: %u (out of %u)\n",
a8c21a5451d831 The etnaviv authors 2015-12-03  251  				idx, submit->nr_bos);
a8c21a5451d831 The etnaviv authors 2015-12-03  252  		return -EINVAL;
a8c21a5451d831 The etnaviv authors 2015-12-03  253  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  254  
8779aa8f8b7fa3 Russell King        2016-01-21 @255  	*bo = &submit->bos[idx];
a8c21a5451d831 The etnaviv authors 2015-12-03  256  
a8c21a5451d831 The etnaviv authors 2015-12-03  257  	return 0;
a8c21a5451d831 The etnaviv authors 2015-12-03  258  }
a8c21a5451d831 The etnaviv authors 2015-12-03  259  

:::::: The code at line 255 was first introduced by commit
:::::: 8779aa8f8b7fa397a0abe9e6af3334ea41e15836 drm: etnaviv: clean up submit_bo()

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
