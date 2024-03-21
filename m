Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751211B7E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711063147; cv=none; b=MHwKq0sgjoX/UKpY8dQxUZGK+2Cz5lI1lfJDhs4OitBAtf4DySiZ7qb+csR0xj+6MQSmkH7FdOHmTo5yT7z+MYYcoXOI43QqzAHqa6kKGJU+YAJKviKpiME7TQ5jeG7tnQOtAhwpAxeAOsU+lU4FtZY2bOgoiU3KrjIs9hJrLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711063147; c=relaxed/simple;
	bh=dbn9AnAV/ogGjpV5g7mx1spT/6AcxNC32B41fkFxRTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrRQFAEv+hx4bK0Cw9vt6LlqtYJwZXvy9vPajgjxzbTAQXd1J+iEnlh2uM4/e7NsFsYwK4mq3Aysp8uPZao9sjPXE5YrPZTYwQ3xIAGEUqRJIZjyzOMFnPuMbQk9axHykTwc8JnL1EsXULqu/5O5YNBGEcJwisdXwdeBFJbtS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr2d0Fwu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr2d0Fwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711063145; x=1742599145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbn9AnAV/ogGjpV5g7mx1spT/6AcxNC32B41fkFxRTg=;
  b=nr2d0Fwuwk8hFWkUlVCczd5MCmgfO33tIQuWrkyrsPbAy9bbzwXn/au6
   PT67TuY+clvv0/OPp2dv6pwdpvM55XeJRw0BTIGFdjwj7uIlIlOgj3Gdr
   nyTenWNhkdTCRbKFry0bOyilisVA4AX8WLnzQrLvwGjolt19lUXf8NhBe
   z9zhCfPyWC4fM87viajzNncA9hYkMTQsT4ug3MSWpFaQxuNa6Rf4d7mnu
   RdKT+w9enCyp41ZmMobdgJRP8RmrsNGSf+D41k0CiOxnLnFVwLgEp8kTv
   eNL9NYKHZSyK1dbbG9VTERLRLv7VkcEWRj8AhAWnOJYZ+QvzsNw8cJcH9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6279802"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="6279802"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 16:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="15329767"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Mar 2024 16:19:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnRga-000Jqp-37;
	Thu, 21 Mar 2024 23:19:00 +0000
Date: Fri, 22 Mar 2024 07:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13350/21917] ERROR:
 "netlink_kernel_release" [fs/ext4/ext4.ko] undefined!
Message-ID: <202403220708.c9s8I4tC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7875dd004c18a516e18108ebd879dd1f5c62d753
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [13350/21917] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-003-20240319 (https://download.01.org/0day-ci/archive/20240322/202403220708.c9s8I4tC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403220708.c9s8I4tC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403220708.c9s8I4tC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "netlink_kernel_release" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__netlink_kernel_create" [fs/ext4/ext4.ko] undefined!
>> ERROR: "init_net" [fs/ext4/ext4.ko] undefined!
>> ERROR: "netlink_broadcast" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__nlmsg_put" [fs/ext4/ext4.ko] undefined!
>> ERROR: "kfree_skb" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__alloc_skb" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
