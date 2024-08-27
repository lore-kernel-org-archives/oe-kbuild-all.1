Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0AE13A258
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724801125; cv=none; b=GON4b30xLtgY8ilnHdWURr9Gy44IWELrf55/HEgjiZQnGir7ZKwp0cU7Eu8l7XAtm6QfFYQhl1unPhcb+MYBmOOcxpQCUwRD5iT9dpHStz4Obmh2af+cbDiC78AAsVGO0rLjvos/g8pQMkhNC3hp47XP+STFxpLxFkd2bnEjBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724801125; c=relaxed/simple;
	bh=kF35JFr35QZFk99j3nJinGpyP3ZfaEKjJKzZlbfs7rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/Xn9yGpP1tZWpJTbz0l8Z1bYID3P48wL43wPZeVOSpvs3T/8mIYOVaeWmiIZ0MAgXbcvv+xMGvm/1mNfDgmGz85nsMNNuAsQytgtrbommNeuyGTs6HBh8gySR83Y0Z4uWzVfJykhrd91CiKTAgh2K8cpg9KrCNQzWBYhe81enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jr7NLUND; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jr7NLUND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724801123; x=1756337123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kF35JFr35QZFk99j3nJinGpyP3ZfaEKjJKzZlbfs7rQ=;
  b=Jr7NLUNDVKhaTxlQ11nzx8Rn1vzrj5H0MuHwDaFJFLuLDTRWjZRejgbv
   S5K/PyYxnv5dBy3YAD4gekovAU3NFZxhM+CiTZPaFcMg8HTwLClPWTP3x
   p5iOUUMFXJdI9xwnnqx4coVhmsPX9lz++cKm7XgHDgB5SylzWBrzokgnI
   GaJyEA8taWnGw54xDIG4CTtDl6lv7M9EJQEbxmD6zws4jpCVfc21Yrdpv
   yCVbcBN9g0LXRlg6EPr/udbyGdSV0Tf4UZ8hnjWfNurORDQcBQzL7C/oJ
   VhQdJrIBNviw+2v6U0oZTr6zii4I/zf9zFCPhYem+6Cx6X7IV+lUFyu09
   Q==;
X-CSE-ConnectionGUID: yz9FZuNhR9WK5U8C3RwJBg==
X-CSE-MsgGUID: wEeK+jSaQRK4nhe/XSYzCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48691762"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="48691762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 16:25:23 -0700
X-CSE-ConnectionGUID: KkWjRsyISBa5abvbes0yaw==
X-CSE-MsgGUID: DqbpSOV2SNehMocWFHtMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63546344"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 16:25:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj5Yt-000KCE-0D;
	Tue, 27 Aug 2024 23:25:19 +0000
Date: Wed, 28 Aug 2024 07:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangyigen <ygw111@yeah.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26811/30000] include/linux/backing-dev.h:418:49:
 warning: declaration of 'struct cgroup_subsys' will not be visible outside
 of this function
Message-ID: <202408280725.RGVxlJvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b32a887db4e5c4c061e61977efabbc1d5e867aa7
commit: 13e5c52d7cec7621f78bce452b78785e689ed0b2 [26811/30000] cgroup_writeback: bind blkcg and memcg
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240828/202408280725.RGVxlJvi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280725.RGVxlJvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280725.RGVxlJvi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sysctl.c:54:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:606:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     606 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sysctl.c:54:
   In file included from include/linux/nfs_fs.h:39:
   In file included from include/linux/nfs_fs_sb.h:6:
>> include/linux/backing-dev.h:418:49: warning: declaration of 'struct cgroup_subsys' will not be visible outside of this function [-Wvisibility]
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^
   2 warnings generated.


vim +418 include/linux/backing-dev.h

   417	
 > 418	static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
   419						   struct css_set *cset)
   420	{
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
