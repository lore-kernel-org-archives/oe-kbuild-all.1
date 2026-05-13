Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32853921F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671704; cv=none; b=WO6+OmW2Gdm6LUHEqyxaGuHwRhlcxZChcYTQqfgypPvC5mZufJjZW0MbPiXck1oiiXn/POkOWXAJG+dijWrBTWWpgZfupUiqrldrftm5OnhiM4MucXYWdHp0YReM97/nAlGWCecvjlEOKqceWGNEkFL0i+aXcfGAt2KVZG23QrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671704; c=relaxed/simple;
	bh=qsU3Q9cC4l0Rzrc9m7Z1nKkogez0oAmRjxfYI+FjRF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5OHApvM/GlcvHRJGxlae8Tdaxc2EBKVxsQg+AfuG6cy19vvWRXG9JE1DZFRB6IZGLSA2d2ujXf3j2eU8gdD/JwOtSeY0uHygayA2stdp6HU+7IT0h8lCgsBAi7vckLAuTYahb6CJejApFVXJFP2GyG6+AgDRxcKQgz3W+mkA+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4lxbD3s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4lxbD3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778671703; x=1810207703;
  h=date:from:to:cc:subject:message-id;
  bh=qsU3Q9cC4l0Rzrc9m7Z1nKkogez0oAmRjxfYI+FjRF8=;
  b=X4lxbD3sZyDpHVqvH6NlBb7062MPFqNKqUDSsKqGA8QJ3afQnK2hcDqD
   ib4ZKwwp5Xo7HbiAs4IeoqOAY/5uevTJpvKdLsjx2dmYQpRZ4gk0ZRgnV
   K+gKe2UlIZptwxgTu3dj7M97Ch9twwVqy7/gN0/OR6DC3ZO2M/YeBa+ps
   5jjg/CEJc7nnlFEM18Un7j5Tq0c0GTlTP//SzreNNQYhhCJT38iUT/CuP
   w32VHbm2p32Wygr/nVH4hTsmcdtu2FqIqyAPApd/ZTG15qo/ukF7pc8RD
   +3GOT7R3LSuZSvrVap0VP2AwWzQXLyw1mndM4zgwIKhfLZwd8ZsGD8TJu
   g==;
X-CSE-ConnectionGUID: 435XzrGFT7WKqd7j5xrtwA==
X-CSE-MsgGUID: rrmF9ZdXRRWqHZB1Z+a0vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90175267"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90175267"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:28:22 -0700
X-CSE-ConnectionGUID: hVS/IM10T7SW3L5fh6Gn4w==
X-CSE-MsgGUID: WaZIUeGRSIe8iUmYXhPzqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242072431"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2026 04:28:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN7lC-000000003zb-0TcE;
	Wed, 13 May 2026 11:28:18 +0000
Date: Wed, 13 May 2026 19:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 28/28] bash:
 drivers/infiniband/hw/sxe2rdma/check_aux_support.sh: No such file or
 directory
Message-ID: <202605131935.8BHgY9d0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f4db1e132382b4b5f45f359a27d879d526448c7c
commit: dce7db61f61d8ac759d22bd218a3cb5cc247c562 [28/28] anolis: net: update linkdata ethernet driver features.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260513/202605131935.8BHgY9d0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131935.8BHgY9d0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131935.8BHgY9d0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> bash: drivers/infiniband/hw/sxe2rdma/check_aux_support.sh: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
