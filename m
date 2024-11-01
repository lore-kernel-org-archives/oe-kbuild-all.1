Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B413C3D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730428932; cv=none; b=ifEXJjpDFdJewz5VFiM8bVt+U4B5Ewz6Mpv0GUR5xurKyGdW7eelB21euHj0qG29u+Ptx6wGNOcTo1J/ulMoGYYpzecpHMroNWCwZkNBmvDTqGbnXdcctGqTonSzQCMngsLC+M86PsM9evdeTcveYC1oMQFpQetZ+s+4hCc5lAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730428932; c=relaxed/simple;
	bh=267cphxQiKHtUt6Gqi+HOqPlDdzeN4/inCqzIIz70Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc8enO0lK5UiQGQzwO6GtQd+9dOzSqIAtFHONP5wUTWclcR1ooKNKjUOqh0vz7stNSwCBMSeuVu46S0ZHO0BTCzYUSUocRsW1VJoryX9Ib+n5BP0IuwV6dSHEiwvY08v5XjSniwWOxXLqoDSJuVrOO2mEuJ7VNPX6uKZzhtRdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoLlH5gQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoLlH5gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730428926; x=1761964926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=267cphxQiKHtUt6Gqi+HOqPlDdzeN4/inCqzIIz70Ek=;
  b=QoLlH5gQJqK20TJB+Xa2DY2+MTNJpWP2Rt+sKnif/xgYpK9ixaXXf2Uc
   Q5pi09mvFof3oPX2tTzfkIuUpNPFcNJ4pSLkAiAJUpedZVRC+pdbHIzkr
   ardok/LkXbtlaeOoYJcZGfTPgwEIJfZexdBYznJTnheNojHAPOWnmzKkH
   Kkk+eA+27LEeeqe0FK9GemvKkw2Ct+1DEy8XXLiSwK9SuDjMxjlQZm0ei
   gz0WVEbt8hCbutQfBzFWO1V2IjVe5O3pt+n85Mgsbi32c9V2zJ6avHnnc
   UuYMQaqHotnkoE6hta2DGOD72EHpHaH+2EeSqVLlcN7Y+Ldny/Bg5wZ+Y
   A==;
X-CSE-ConnectionGUID: G3QF+keXTGip5FFJ8v/55A==
X-CSE-MsgGUID: dY499hUVRNCUzZjw5i9OWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33880827"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33880827"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 19:42:05 -0700
X-CSE-ConnectionGUID: e+bII5k4R2WBzGuATyspRQ==
X-CSE-MsgGUID: CsQd21g+SV6STGptLwDcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="113671408"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 19:42:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6hbt-000h3K-2U;
	Fri, 01 Nov 2024 02:42:01 +0000
Date: Fri, 1 Nov 2024 10:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13350/23911] super.c:undefined
 reference to `__alloc_skb'
Message-ID: <202411011008.jiA2icMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d3ae2925a8986f17b9b1a4b026403edaf8286665
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [13350/23911] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-003-20241030 (https://download.01.org/0day-ci/archive/20241101/202411011008.jiA2icMS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011008.jiA2icMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011008.jiA2icMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: kernel/sched/cputime.o: in function `sched_idle_time_adjust':
   cputime.c:(.text+0xa05): undefined reference to `get_idle_time'
   ld: fs/ext4/super.o: in function `ext4_netlink_send_info':
>> super.c:(.text+0x149f3): undefined reference to `__alloc_skb'
>> ld: super.c:(.text+0x14ac9): undefined reference to `__nlmsg_put'
>> ld: super.c:(.text+0x14af3): undefined reference to `kfree_skb'
>> ld: super.c:(.text+0x14b59): undefined reference to `netlink_broadcast'
   ld: fs/ext4/super.o: in function `ext4_init_fs':
>> super.c:(.init.text+0x95bf): undefined reference to `init_net'
>> ld: super.c:(.init.text+0x95c4): undefined reference to `__netlink_kernel_create'
   ld: fs/ext4/super.o: in function `ext4_exit_fs':
>> super.c:(.exit.text+0x93): undefined reference to `netlink_kernel_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
