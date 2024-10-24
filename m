Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5776249F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729734875; cv=none; b=uLWu38/FbMRWpiYTb45TtPhy7ChZxFsnUPFk9yd4kd3L3JawKRQcNlXyK4uivCbp6EUCYQCzyLN+v0yTaJYw4jgoTQ9Hvsgorpmb0o99vj4LUxJawnWph+pVK+d9dskhpcipA09yAxbRoKPmnJju6TUCH0yeeRZlZ8I/b1tdb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729734875; c=relaxed/simple;
	bh=+cshJRH05c/X9kek4CQuI1r/ZG7Cyod7Ge15g5IaMZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiMYgmeRvGkO6MNPSLSgAygRTeb35o9BhqMoR5aASgYiAiV5IeoIRzLlW+bPTVhpsjk3I8Gl7skHdWuu9QY61uRksvdYw265opmp8AZmSyvgMfrEuYwJJxK9ydNrpCbFBex1DNm1w/9KMtKxuW01Zh8XZabH5ysvW+Ehv6O7dSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPK72MYC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPK72MYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729734874; x=1761270874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cshJRH05c/X9kek4CQuI1r/ZG7Cyod7Ge15g5IaMZA=;
  b=IPK72MYCa4TIfjNeu+MyvfzMlVn8Yn+agJVGd7Iw+ZhMgfdQwRGe8MuG
   0f7nWA+V/XFVDI6WPdHCJm/z3BOLnlAMT898KopjRUzhC9ZEX95lxUnK/
   UvNo5cu1KVYADtb6ZVgYWMk4yfFMp5rOKRDTz0Tnm9OYOz3GfDV8/SHrM
   J37bNtzwGgkryZMCN1wWOQYxhgz3aoNc+/EwF3hNaAkK1qZT8ueZUgTg2
   JvBNLxaRicN/Wpef9OdVSiRKJrLM2oGGJKWDCZI/Q4nrS7IjIqSQvQYYk
   Q/jR0XgLncfKmaBo+hK+cOwOOs2dFlbNiLAffE8J71X8FD8zid4sSNq69
   Q==;
X-CSE-ConnectionGUID: FZ4bkSj6R5u24lnJgmq2sw==
X-CSE-MsgGUID: +Z1vcIlRQ5CO10OmlCxWAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29571739"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="29571739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:54:33 -0700
X-CSE-ConnectionGUID: mEYpSxZVRTCHVJFm0abkjw==
X-CSE-MsgGUID: 3kWz7SCWQxadtqO0cuVRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80368995"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 18:54:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3n3T-000VoW-0v;
	Thu, 24 Oct 2024 01:54:27 +0000
Date: Thu, 24 Oct 2024 09:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6277/13046] vmlinux.o: warning: objtool:
 sm3_generic_block_fn.part.0+0x1d: BP used as a scratch register
Message-ID: <202410240927.3cjc3tA8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: bdcfdbe076c8b6d621c9f38b5e08f96887a10dba [6277/13046] Add support for Zhaoxin GMI SM3 Secure Hash algorithm
config: x86_64-buildonly-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240927.3cjc3tA8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240927.3cjc3tA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240927.3cjc3tA8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sm3_generic_block_fn.part.0+0x1d: BP used as a scratch register
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4e2: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
