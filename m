Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BD41D0DEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766524837; cv=none; b=LXpbog9oU9OOMDwQKBxwxlCTALFjlHF5guvewJ2ueEt3oHmo+fDx3bDSQwFuds4ryBsv4oTMkWX6hfr/ABAso6VEvUP33byP2MC2s3O5TQuxLP5eWspx1ym6d31o8i8sG+G8d0ECL1GXimLkx1xDwDZySLM48eoMXf1tkd05V6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766524837; c=relaxed/simple;
	bh=PbNwMMi7C4/yzZIiV/vg+quLbFrzKGMy9hwOFXAh0d8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HOAtzqNafvMnYZ3/hVwlChXNtpPB2Zn+uX81rfsDoGEOrfgnNjzXHWiWhf0cDzuOYOW022FUqM3jQjkfN2kbxzLydn0C6o+8a+76qI8jqEYxluLqtsOjp7bdnNyNLfCY/gdGNAk8AzVsklMOizPJXQO8B07TKx5Iwgl8fW5R6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2hKGO/C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2hKGO/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766524828; x=1798060828;
  h=date:from:to:cc:subject:message-id;
  bh=PbNwMMi7C4/yzZIiV/vg+quLbFrzKGMy9hwOFXAh0d8=;
  b=G2hKGO/CatMaUBNQLX0bDZB4U6c5fSsUEPXJSALbG38gvTU4SFxPJTcn
   2tCuNL/fywzrMtqbnt9ue/qvQ8mbJux3VYOAHs/EWu0uJ9nDyReUeRYfk
   5gfIe3iwehUSQFUo98QGBs9GqEkXQ3yIJKQ2hS74MI2BN/aSbA/Jxi5PJ
   EEHq+ImFJjRk3tUkKSkBN5xHQMfpwSe/3+x32fedMlgCBnRlCTZBgDzY+
   7h/to9exBJssBSN4lZ8z1kRjxpTISp5jVYDR3umFnVCMw8JUtfhTPUCNf
   3BhQi0akS9SwlXfRrqq5gNCSpLHrwYK9diYToI5tguKjLLYpeaNfRLYgw
   w==;
X-CSE-ConnectionGUID: ucV/0/cAR3irVFshcSpWPg==
X-CSE-MsgGUID: 0VNOSuxcSCKKfIoUuLrwww==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68416856"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68416856"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 13:20:27 -0800
X-CSE-ConnectionGUID: VkgqU/V1RvyqVnjUWv5RiQ==
X-CSE-MsgGUID: eC00bKpZQ+CIuLCMSmnXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230530277"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 13:20:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY9nq-000000002Nx-0rSU;
	Tue, 23 Dec 2025 21:20:22 +0000
Date: Wed, 24 Dec 2025 05:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse:
 invalid bitfield specifier for type restricted __be32.
Message-ID: <202512240507.scMsfP6J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 601fb01dc16f747534b866610743d95830b6655e [3544/3544] drivers: support for xsc drivers from Yunsilicon Technology
config: x86_64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251224/202512240507.scMsfP6J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240507.scMsfP6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240507.scMsfP6J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/qp.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/vport.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/res_obj.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:208:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:221:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:233:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:243:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:246:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:264:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:359:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:364:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:369:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.

vim +913 drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h

   910	
   911	/* vport mbox */
   912	struct xsc_nic_vport_context {
 > 913		__be32		min_wqe_inline_mode:3;
   914		__be32		disable_mc_local_lb:1;
 > 915		__be32		disable_uc_local_lb:1;
   916		__be32		roce_en:1;
   917	
   918		__be32		arm_change_event:1;
   919		__be32		event_on_mtu:1;
   920		__be32		event_on_promisc_change:1;
   921		__be32		event_on_vlan_change:1;
   922		__be32		event_on_mc_address_change:1;
   923		__be32		event_on_uc_address_change:1;
   924		__be32		affiliation_criteria:4;
   925		__be32		affiliated_vhca_id;
   926	
   927		__be16		mtu;
   928	
   929		__be64		system_image_guid;
   930		__be64		port_guid;
   931		__be64		node_guid;
   932	
   933		__be32		qkey_violation_counter;
   934	
 > 935		__be16		promisc_uc:1;
   936		__be16		promisc_mc:1;
   937		__be16		promisc_all:1;
   938		__be16		vlan_allowed:1;
   939		__be16		allowed_list_type:3;
   940		__be16		allowed_list_size:10;
   941	
   942		u8		permanent_address[6];
   943		u8		current_address[6];
   944		u8		current_uc_mac_address[0][2];
   945	};
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
