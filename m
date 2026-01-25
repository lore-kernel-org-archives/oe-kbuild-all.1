Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629F1A0712
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769360672; cv=none; b=P5IJCMOvi6IxSOtUPcCQT+ekDX1lIh2b7QqEhyoR5tL+gqwuFmLqp6pg6HRKcy3p5ipN2q3VPJtNsxSGnKhUOfKT7gsduUnAK/mEtKp/yfMlmhMAP/pnNYmJd6oM+G9ByRNx3RMS/sCSYMPuFjHU3SjZciiRf26dLmNybkO6l1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769360672; c=relaxed/simple;
	bh=qP/rUcPm3ashHvBj1MZJd9y5DqDDTWqYWrDFOBmtrdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xp3OjpGzo8STSlyYA5AfFSbOCNo5wjuNvzbomzN5vrcjiiELPLV1G6GjDz47gmgs+69xTrYHHL5b8MAfkfpiJUq4XP0baTAJRqMaAdqc5mnEq2jvi5zbgJrOIjGZAC7r+XAZXBk+kJC/6bqMzlQCX/Y40Dvw5F7dDDFGTB6K3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeXSwv6s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeXSwv6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769360671; x=1800896671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qP/rUcPm3ashHvBj1MZJd9y5DqDDTWqYWrDFOBmtrdE=;
  b=MeXSwv6sOgVG6ZrO3KhNf4F5I/eD0yRee9vJYU886jRPZ51K8pr+OlnC
   PzjuDGi3cqVMDVYXvdyCwjXerc7HHF0TOSGr4vxed7xxLawgr8Xzz1Chc
   u7z99UAaHZZpfT/sAkQ+6dcoyYQYCbwsuIvyjOMd+eUI8m+xAxiOB82SR
   HYNiTVJcNAlUt+Igh4znO6SrgfM/1aeJD3NegYsVFW+34nvkU/UmRWJwG
   4bkNgnz0FkZZVyPI10JX6J73yPvp0pivl53ZW3sWEesf0v+M4v3inhHfJ
   ozQKtJWMtM0sI8Eul0MI7qNmscSjolXYtTPR2RrvKvI8yU/yoqsbJrd8m
   Q==;
X-CSE-ConnectionGUID: mBZXYsAkQ1qy/hdCTGFUKA==
X-CSE-MsgGUID: Zj7OEiTPT/67WqTKg5MC7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="69573321"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="69573321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:04:30 -0800
X-CSE-ConnectionGUID: 4To9EJ4jQxCUGYYfI6jSzA==
X-CSE-MsgGUID: goeyBANUSoOgORCvr2F7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="212477490"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2026 09:04:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3XF-00000000WHi-3cHi;
	Sun, 25 Jan 2026 17:04:25 +0000
Date: Mon, 26 Jan 2026 01:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 include/linux/compiler.h:253:27: warning: passing argument 1 of 'do_id_store'
 discards 'const' qualifier from pointer target type
Message-ID: <202601260047.aXsXYjZw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 445ba0f479b21cc9310a99aefa9de3d53559eeb0 [16/17] x
config: xtensa-randconfig-001-20260125 (https://download.01.org/0day-ci/arc=
hive/20260126/202601260047.aXsXYjZw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601260047.aXsXYjZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260047.aXsXYjZw-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/memremap.h:5,
                    from drivers/dax/bus.c:3:
   drivers/dax/bus.c: In function 'new_id_store':
>> include/linux/compiler.h:253:27: warning: passing argument 1 of 'do_id_s=
tore' discards 'const' qualifier from pointer target type [-Wdiscarded-qual=
ifiers]
     253 | #define ptr_unqual(_ptr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
         |                          ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:138:28: note: in expansion of macro 'ptr_unqual'
     138 |         return do_id_store(ptr_unqual(drv), buf, count, ID_ADD);
         |                            ^~~~~~~~~~
   drivers/dax/bus.c:92:50: note: expected 'struct device_driver *' but arg=
ument is of type 'const struct device_driver *'
      92 | static ssize_t do_id_store(struct device_driver *drv, const char=
 *buf,
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/dax/bus.c: In function 'remove_id_store':
>> include/linux/compiler.h:253:27: warning: passing argument 1 of 'do_id_s=
tore' discards 'const' qualifier from pointer target type [-Wdiscarded-qual=
ifiers]
     253 | #define ptr_unqual(_ptr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
         |                          ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:145:28: note: in expansion of macro 'ptr_unqual'
     145 |         return do_id_store(ptr_unqual(drv), buf, count, ID_REMOV=
E);
         |                            ^~~~~~~~~~
   drivers/dax/bus.c:92:50: note: expected 'struct device_driver *' but arg=
ument is of type 'const struct device_driver *'
      92 | static ssize_t do_id_store(struct device_driver *drv, const char=
 *buf,
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~


vim +253 include/linux/compiler.h

ac053946f5c40c Uros Bizjak      2025-01-27  252 =20
050e991b39389f Thomas Wei=C3=9Fschuh 2026-01-25 @253  #define ptr_unqual(_p=
tr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
050e991b39389f Thomas Wei=C3=9Fschuh 2026-01-25  254 =20

:::::: The code at line 253 was first introduced by commit
:::::: 050e991b39389f7ff8ed2529193bac1f1a3a91ea ptr_unqual()

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
