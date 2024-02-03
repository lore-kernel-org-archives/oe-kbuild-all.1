Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313375F86A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706991030; cv=none; b=Z4TPyzNZJ5uisd4/BKP9BsdFMN+6k/Z4K2lM/g121n7pwmokPkQH76VCM42oRTcRUAwL+33bLCk5GISZVeTPsqkl6GGIjLJzCDY2a8tW4PmQtbp6hFifxr6xNFZzibvkUPMsk9y6TWvN29OAl2c2VD2UHeS/zMYqI6SFt1/0gKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706991030; c=relaxed/simple;
	bh=x6tzkksiFiJb+Uy10odQpwTrRmWD8OWFzZjTU1dQgyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1dqh+T7y8UyT7xC/OR9ujRYAWBTs1lEmQSuMICuH51qBsr1qNiiUmF/WnxLZGOrvwgZhAmkyQSFJfqtR3w/HNnm9yN8ZdaMj+QJr87NTx+HnNGObI9FUXrztxGgdaCGwgr/xkr9b1GkWFuIJw6WzNo5tPdxZcLbq59qYe5XkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKJZxYMW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKJZxYMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706991028; x=1738527028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6tzkksiFiJb+Uy10odQpwTrRmWD8OWFzZjTU1dQgyc=;
  b=nKJZxYMWcuwmzha4R7HfEZIDdkAgfifb1vqtVvKiExr8hTY+CLQOghk8
   wJ9vZ9bjgQermarpYYHVx5aM7vmo9CSmceHsaaiwe7cA4d+BYJcx6bQ4Q
   ANhb4+o2/dSya9On/DLVj2yLU8GOlgjow9L1QQbJb5ShUz20ZFQCO0tfI
   sllh3njIZANq/SL0oMMbuKDxq02FVHhGE2kl4AjgpK1zN2F2sMHWRehJ/
   yKVyAVS8zM4PX0uzT+MbUAORokRU/QKgYXwGXTvluihFOT75oOeBCYOc3
   5+WdVSmgoI3XIABtfFgVjmEeS/16bCuGwDUZCMJnc/wbeiTL3yR3y8tkg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="492041"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="492041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 12:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823505372"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="823505372"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2024 12:10:26 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWMLI-0005YA-0n;
	Sat, 03 Feb 2024 20:10:24 +0000
Date: Sun, 4 Feb 2024 04:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11954/21614]
 drivers/soc/amlogic/meson-gx-socinfo.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202402040409.rwfOX8Xu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bc2c7cbdcbc5c8e5bbe65d3542ec2fccbc61492
commit: a95885602b93885b15fd80d3a9f59db0daa6d831 [11954/21614] drivers: soc: Allow building the amlogic drivers without ARCH_MESON
config: x86_64-buildonly-randconfig-001-20240202 (https://download.01.org/0day-ci/archive/20240204/202402040409.rwfOX8Xu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040409.rwfOX8Xu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040409.rwfOX8Xu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/amlogic/meson-gx-socinfo.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
