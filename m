Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC122626
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707061329; cv=none; b=Lv6HpfnRbzVtJQ2wPNRNNhj6h/OZQX6XEomD8dKgNdSgOpnfaBb2XNSMDpX2ESFXD/dZeQBl7YOZ5ZbmsXLd9GdCGPSyL9qcJBmul3nBfcRS67SzV0LM+vojUpsbU75Zs/1QxzPlEAycJg8GVQFIBvC8qCkkf2mKKlK+03LXBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707061329; c=relaxed/simple;
	bh=/66B8onNUZ8uJh3gRaZmI3huAsmE93ECqyh9MSvVRmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nn+hGCrxy+HDTuujfc/mew7UusH/N6qXaOhxmmvL1QOWjPxXdWzgfDm8G8XIHbCZ2YuLOhIpTAOvrUsU9hdtuoOec27ffdkXX6tvMS2jmH4l7RB18A2FyhKKtvl/+0kcpAGc+D8Rid6egjlKJ7F+GXgjJ2Zwcsy0khxaRYognqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFApEIhn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFApEIhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707061327; x=1738597327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/66B8onNUZ8uJh3gRaZmI3huAsmE93ECqyh9MSvVRmU=;
  b=AFApEIhnacPpYk04oJKeTuw6CYJ0mLeEv/mLQcDOosWPXEaFx5Lqo/sf
   d96cQifD2i9WaL84iglvyrcdbFYIDDQdZZKGxigIUphTUsbQdokZluNru
   +gL0WuuqzGFmvQx4hGlM9fphR6Tci5LkWUxYX4BE539CFD8uzMYNxIJOY
   bFrRNE5MASPylrGcpLygwfesAP23NTqPq5rbp2dD2j3W1TmF31ZTxMEJz
   sMuKoDUFZT0RVi32n/SzNQkzfqulFTd+SEbHRe/JO7FvgjqDI+rQDoaP6
   mgrjTu/mfJAOennX5ZCQc/WpAoi4zcMRnu7DqofBjCPxm2ahFh2DNs/QP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11759164"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11759164"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 07:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823654235"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823654235"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2024 07:42:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWed9-0006Se-02;
	Sun, 04 Feb 2024 15:42:03 +0000
Date: Sun, 4 Feb 2024 23:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20217/21614] hugetlb.c:undefined
 reference to `alloc_new_node_page'
Message-ID: <202402042338.IRD86Wp9-lkp@intel.com>
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
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [20217/21614] dhugetlb: backport dynamic hugetlb feature
config: x86_64-buildonly-randconfig-003-20240203 (https://download.01.org/0day-ci/archive/20240204/202402042338.IRD86Wp9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402042338.IRD86Wp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402042338.IRD86Wp9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: mm/hugetlb.o: in function `try_migrate_page':
>> hugetlb.c:(.text+0x67e9): undefined reference to `alloc_new_node_page'
   ld: fs/ext4/super.o: in function `ext4_handle_error':
   super.c:(.text+0x25299): undefined reference to `__alloc_skb'
   ld: super.c:(.text+0x25343): undefined reference to `__nlmsg_put'
   ld: super.c:(.text+0x25438): undefined reference to `netlink_broadcast'
   ld: super.c:(.text+0x2558b): undefined reference to `kfree_skb'
   ld: fs/ext4/super.o: in function `ext4_init_fs':
   super.c:(.init.text+0x648e): undefined reference to `init_net'
   ld: super.c:(.init.text+0x6498): undefined reference to `__netlink_kernel_create'
   ld: fs/ext4/super.o: in function `ext4_exit_fs':
   super.c:(.exit.text+0x7e): undefined reference to `netlink_kernel_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
