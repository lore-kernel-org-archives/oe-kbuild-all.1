Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989875;
	b=O5VU/vnBeboplw0k9FGw7c6LJMbg6KTYvd3VgPZUrA50QIXKE0X9jtwRAlzShQD8sjS/
	 uCVsWFJ54rM1WkK+hR6l0QkSRnmQyVuIzShxdGIh0yqCWNmifIBJnFpDEbkuJaslMPq4Y
	 8udA4QFeDlkJa9Vpkqgl8SC1x3VfCfveDgFIo0drHpmu/m47pvDw17iauC+ia3sPgUCFG
	 bED0eCOILR5r2Suvf2AIZskazbpeZsHw+9IjFHRa6k3cjxv+b8a89ihDt94VNSPPgj+kd
	 g/hF6jt5quI6UCN05RE9d2Y1oMiUZIDy6tt1KUnXvsoMwhdwad1FEG+6x/f1vKBzy7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zQVvgy16UMx63ijSb4wwTVVG0akgIBjHstnDThvluLw=;
	b=Ou9RtY7rXbvVxCpdy8I7XpBPwxL13jcNx4nBiwxc9EBeV8JHjnNhWI+voAvYl7dtw3k0
	 zItwxHuLWWxCQKxTHB48NBfJrRyDS2vO9jVzOK18xe87hdRwTWbMVTUmAdk6JfUOKDNKn
	 3l0eqOa1KVrE6LSOyiRMKpShtl2KNL4rnpYhHGybJy4YOuB539sD9tmn+YIwBmC6yZLls
	 yW+bI+zF/zk/6zl8pIG5WUqse7ulD97y7R2SSTOqJ4T48QMU0DOLBYjNPrm3E6EJ4wvcf
	 10Px3cMp1eZxO1ZcX3aR9dGGwvOiY/4Cgd8Qgqnf5LUKn8ehUs5xSyQ8t/XRGf6MuOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEqnRwzD;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 04:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B54E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEqnRwzD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792989872; x=1824525872;
  h=date:from:to:cc:subject:message-id;
  bh=4SpEi8vXVzk36INOCgVZeYlcuW2pjnW2sO1ReSYVoLY=;
  b=aEqnRwzD4xTv4dGo4SKbKS8q2NeC1jifwN85oT6GoJDwyj+4uGxeSekc
   pPnZiNhdgdooMQk2WqmxLJz910WmBL6yJXT1/nj00LA6drRuZ+kXxU3SJ
   ZZJl97IWWtC2oyWkwb3hUmf2r+VTduWpVz2z3+lnUPiAa2foXkMzv2srx
   85XkiJlVOEZrjqqiXgnEgMrrnCDwUtkwEcpIgNrQeaT1OX0+MqUUq5VFu
   H8fFkutO5vopFuhykRGVgXhxzHV4xYmrp74MyBCe8r8xLQnW2uukqZW/j
   NEcYB10gBMM81CkHQm4GObT38EkDAak8jrzfDx0i+SilOzJhJDLLBT1YZ
   w==;
X-CSE-ConnectionGUID: vwmFJdM2RGujGA57NfsKEw==
X-CSE-MsgGUID: iKqhb1CDQnSZ9T1N0JpdSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1553630"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1553630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 21:44:31 -0700
X-CSE-ConnectionGUID: NUYKYyayTQWSiYmRaDV6MQ==
X-CSE-MsgGUID: vAnGQSVwTYKzsJAmjsfEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4543477"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2026 21:44:30 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLCZO-000000003yB-1sD7;
	Mon, 26 Oct 2026 04:44:26 +0000
Date: Mon, 26 Oct 2026 05:44:24 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>
Subject: fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol
 'bpf_real_data_inode' was not declared. Should it be static?
Message-ID: <202610260537.GikAbao4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b4b543fa18757297ac756a6fe6e64f506b7844a
commit: 3f8c65b06fafc3f779abda5f7b81707411d05d4c bpf: have bpf_real_data_inode() take a struct file
date:   4 months ago
config: arm64-randconfig-r2305-20261026 (https://download.01.org/0day-ci/archive/20261026/202610260537.GikAbao4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260537.GikAbao4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f8c65b06faf ("bpf: have bpf_real_data_inode() take a struct file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260537.GikAbao4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be static?

vim +/bpf_real_data_inode +377 fs/bpf_fs_kfuncs.c

   361	
   362	/**
   363	 * bpf_real_data_inode - get the real inode hosting a file's data
   364	 * @file: file to resolve
   365	 *
   366	 * Resolve @file to the inode that hosts its data. For a regular file on a
   367	 * union/overlay filesystem this is the underlying (upper or lower) inode that
   368	 * stores the data, not the overlay inode.
   369	 *
   370	 * Data resolution only applies to regular files. For a non-regular file (e.g.
   371	 * a device node, fifo or socket) on a union/overlay filesystem the overlay
   372	 * inode itself is returned; for any file on a non-union filesystem the inode
   373	 * attached to @file is returned.
   374	 *
   375	 * Return: The inode hosting @file's data, or NULL.
   376	 */
 > 377	__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
   378	{
   379		return d_real_inode(file_dentry(file));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
