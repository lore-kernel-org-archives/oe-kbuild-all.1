Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C907F20CCC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644655; cv=none; b=euST/34W+kv4AkVIZvvjr4xPawFPDQH8awXSUbqEVBRUzPXPwppd7WzHpdfNSJEenegrt6fk37VOu4gtKEIZ9EHwgNH5qd+2C2CS/Y0AUov2UnPBxL393gwPUuDQ3V23KYGwNL9b3RMaLpM5ioC8api2vL8wzurs2hlm092v2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644655; c=relaxed/simple;
	bh=gnFjv4ndmAfWLTGc15lnmzDNoAQgjGit8pQ3v5nzM6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFi5NzsnTuke+ueSyhPZz1jjKx2e6DGGZjMZP8Rpn1OpILa9/30YTVFCwUY3+iqZQladV30cXWr0DKL+85w6y5nzwT5c+S5q8sD3O+4PEDwxn/oWvJll/pG1JPJ7/AOd6kYKnixVwVOctyLfSGNV5NoROIVUuAwU3djUYn7U5/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+YavVZ+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+YavVZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644654; x=1760180654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gnFjv4ndmAfWLTGc15lnmzDNoAQgjGit8pQ3v5nzM6M=;
  b=P+YavVZ+2jPI59XEYsGk2HQ0n44rIw4BMGY7P1drmVDu/c1tMh9rlShN
   pCElmm/ZiWkeTQ21Lve82EBASnf4ELewVC56m3qWxMX4LsGRhWbQxRAwy
   Z/XY69G46avG0fUww1Ycz0i2VeZMJ4Nk8r5WZvqytUj98ow/Ep0b12u7Q
   Vy0rmnAMVN0rJauk4LUSrxFKjJViiSQ6Cl9V2kGjJtSf+6Sq7R+yY8h8s
   phhuA71k+3g2bk/1e0tN7HlB2FCFt1ShmXJcLyB3VUBFlPWTc8HSmMEQV
   czeu4Y610jvJCXHVlkCjSiFxWZL0bdQ3Cu2uy82Z2NyqBfWsY5zaNJrfQ
   w==;
X-CSE-ConnectionGUID: fkkAszBxQfeVXnX3O8e2fg==
X-CSE-MsgGUID: v7ptz/hZQuWB6iPplqgqBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27910857"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27910857"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:04:13 -0700
X-CSE-ConnectionGUID: 8NZPzPL/TbKCdMH9FQCPKw==
X-CSE-MsgGUID: TcRYWAiXS0mZQL2K2ipUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76987509"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Oct 2024 04:04:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szDRK-000CDJ-0W;
	Fri, 11 Oct 2024 11:04:10 +0000
Date: Fri, 11 Oct 2024 19:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yue Haibing <yuehaibing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29971/30000]
 drivers/net/ipvlan/ipvlan_main.c:431:19: warning: variable 'old_prog' set
 but not used
Message-ID: <202410111924.i3Aw2F5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   33a5644b70e15c265ec94eb3726216950a1476ef
commit: 373ce97bdbb6378acf984656798aff4bb706a447 [29971/30000] ipvlan: support use xdp native mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241011/202410111924.i3Aw2F5F-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111924.i3Aw2F5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111924.i3Aw2F5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ipvlan/ipvlan_main.c:431:19: warning: variable 'old_prog' set but not used [-Wunused-but-set-variable]
     431 |         struct bpf_prog *old_prog;
         |                          ^
   1 warning generated.


vim +/old_prog +431 drivers/net/ipvlan/ipvlan_main.c

   426	
   427	static int ipvlan_xdp_set(struct net_device *dev, struct bpf_prog *prog,
   428				  struct netlink_ext_ack *extack)
   429	{
   430		struct ipvl_dev *priv = netdev_priv(dev);
 > 431		struct bpf_prog *old_prog;
   432	
   433		old_prog = rtnl_dereference(priv->xdp_prog);
   434		rcu_assign_pointer(priv->xdp_prog, prog);
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
