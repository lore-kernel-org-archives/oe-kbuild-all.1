Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90423A995
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760910207; cv=none; b=WbHhQ47wOky8Gy7LSVtfoS/py4d1ANnTqPJnAhk/DGu8mhknAlSih3wjxVYY0YCUl5+thGCwIF4ZtlsEGNa91roaxAkHcpa6cOl29HGFXUOq1+TY9VEQnP2PfszR3EkS/A00agxEJ1OAfLWVDADrCiz511mpxNadCKiiQ68ATEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760910207; c=relaxed/simple;
	bh=lMJbVMPMRmrhjLQKZMYbmUJYtuT0rhX4BG8Jg/g21Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+0LUHVx35aDDZt117hbHokm4r1DATEQHU4CHmxsIS9kUdJCjIGA3ElZwFrCmtrsXyq1gvRSOcPZOxco2pwQfN7uwg8GSQcxE6cghVV2F439uCnwsxpjIvVU02bbRYsKhts7vaixD61O5sDiOaN5q38tTZsQGyaMkMonZ8WPsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmdAvIUa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmdAvIUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760910206; x=1792446206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMJbVMPMRmrhjLQKZMYbmUJYtuT0rhX4BG8Jg/g21Js=;
  b=FmdAvIUaXDZM4iMFT3oaJPcQ9RKUP03Bhl8yOCv7tpLhZ0zzyIC28Xto
   84RHgLa3cry9BK4ZzFDA3ONxYrxZCz3vqrw+s8HE8RFsIQJnn11QY0GtT
   l1e5uzAFW/du75SdG1W6av76foQU0yqj9EoiDxUE4hjhsatKp0DKZOysf
   2iI5zCXtZ/KEl1eLV4T6gBKVff251yeRahivI2CTyH4+ONV89ZT6Xiv2o
   xmFP77O03pS7HBH2eJNBNq6QaOy6Sph015/TRi1D/d0SooTgYLO0pYfNN
   pdf7h0iWQ1pRW8JR4CzB6wS4EUlpKC/vCRvuHgKoAbXATTyFI+KHPkFrx
   g==;
X-CSE-ConnectionGUID: u4uAE3cARHq9HDuzIhm9Aw==
X-CSE-MsgGUID: /Ye2/1uESPyoybg1xMFzxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62247153"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="62247153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 14:43:25 -0700
X-CSE-ConnectionGUID: sYMWc7fPRG2zFhD80reKKg==
X-CSE-MsgGUID: GboOsdDOREeoLhkHfCEnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="188481447"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2025 14:43:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAbBR-0009KF-3B;
	Sun, 19 Oct 2025 21:43:21 +0000
Date: Mon, 20 Oct 2025 05:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:void-gfp/v2 2/2] drivers/tty/vt/vc_screen.c:56:54: error:
 passing argument 1 of 'free_pages' makes pointer from integer without a cast
Message-ID: <202510200541.dTnW4trv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git void-gfp/v2
head:   5bc4806712d9e97f6b0344869d11b529287dc037
commit: 5bc4806712d9e97f6b0344869d11b529287dc037 [2/2] mm, treewide: make addr parameter of free_pages() void *
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251020/202510200541.dTnW4trv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200541.dTnW4trv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200541.dTnW4trv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/tty.h:5,
                    from drivers/tty/vt/vc_screen.c:33:
   drivers/tty/vt/vc_screen.c: In function '__free_free_page_ptr':
>> drivers/tty/vt/vc_screen.c:56:54: error: passing argument 1 of 'free_pages' makes pointer from integer without a cast [-Wint-conversion]
      56 | DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
   include/linux/cleanup.h:211:78: note: in definition of macro 'DEFINE_FREE'
     211 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   drivers/tty/vt/vc_screen.c:56:44: note: in expansion of macro 'free_page'
      56 | DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
         |                                            ^~~~~~~~~
   In file included from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14:
   include/linux/gfp.h:383:30: note: expected 'void *' but argument is of type 'long unsigned int'
     383 | extern void free_pages(void *addr, unsigned int order);
         |                        ~~~~~~^~~~


vim +/free_pages +56 drivers/tty/vt/vc_screen.c

fcdba07ee390d9 Jiri Olsa         2011-02-07  55  
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14 @56) DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14  57) 

:::::: The code at line 56 was first introduced by commit
:::::: e730c373b6ff16a177e132859bf6ea4dbb15105f tty/vt: use guard()s

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
