Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883863;
	b=OiMrEGHxcWwPLJXFXjJO/cE6+wb6sO//dHinaVI+pkYS01n8B80O56fBWuLrINymqVqm
	 aDaZqky6wAgsxLaNjus9zNe7gVmy5kxVSQqQOmN7zIFqaKXRQnncL2679p+Cq7CczEhmC
	 l1j7s9DLz97p24EZyu2kcD/W49xxE6dRSJpLSlVL6iFokNOjBU3WUfEpGEonYCTFZbyCD
	 IoHGI9scF9FdjeSWmEwUHHoHx+o1ZC7gOY9K0wpCdCJ4/nd3UCvpq1/3f7ZwsIIFQBFP2
	 jXqlGf4oDNp8QNblouXkYGeHQZNYCjIKjtGSncBp8lsUuiC14YjZ8zu/TXCtWTs5YOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883863;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zyVsM4XH7VxGfoO6gO/jDJ6wr8IToaWJt+gvLVx5b2I=;
	b=w2150eThPYrvehd6etdlEawCaCNQgwVFGFcYRu7msW6Me4OQV8un/h0fKZI+2g7B/Edp
	 nRdT1Qgve8nprs74cJ5oxreeQZTMS9AN4lC3H6zzUEHG6n38Ga+4HzKjTRXpLJoVsKZVx
	 /hoCM+hdM17O+gD3PNSOUbVVkElkAEiRZQwsW7AkrNr2DvcAdYPL/6ohpWkPTAqMVjFgj
	 7EEPTNhwc+8pjzRwoCWhdglB8e6m2zM8EzkXor75Q0rpdg5DO9+fVpGsE2i+53v1CAmtN
	 8852MLZ5xjsmX1k3rmAKC1lNYnZ57xnOxhP9gAclkal/CEt4SnunnFJjY4gbi8O0Dtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TfLa5nXl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886BA606A33C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 13:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886BA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TfLa5nXl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793883862; x=1825419862;
  h=date:from:to:cc:subject:message-id;
  bh=Zk6CF01KnHueTv2jKY2LqtvsqO8K55GfYA7bINpVCqg=;
  b=TfLa5nXlxCm9Da6r3vn8oe+KG2zxHNgGgIFC2rAqhkaUSuF159uNLut4
   +9WcGVNEixyAPEWTeadlJH5BPJ/a9nzdtbBBqv6k5GhGM6EedVfd1swkA
   ET0xnxb4VmvfIXVygvr4djMujB+tb5Tn0f1Bgh0xnnSqvqyE+1N4hcTkM
   xxXz1iXYVXiTg7QcAaomdPsyhSL4vTuaHcrcy+c8zLNlZuc02/Qf5azbE
   8CTVaSpfaTqEO0evZxowznJc8n5HgeX6qdO27HSGgACCWVydatvagt0Zd
   HXaOaEKN0mRCfEeqJeyxH4ZHf1etgR/ztnWzTh5V/e7NnT53o8VKvXAlZ
   Q==;
X-CSE-ConnectionGUID: GB24EQehT2qmT2qC0ghJyQ==
X-CSE-MsgGUID: jSYwSIsjQvyqjxsLcJaRdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2546487"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2546487"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:04:21 -0800
X-CSE-ConnectionGUID: OUk1yxQwSeK3WL5cnOdWiQ==
X-CSE-MsgGUID: 5hd6Pmo6Q5qSyQtONtsOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7124254"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 05:04:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOx8b-000000009eN-1BWv;
	Thu, 05 Nov 2026 13:04:17 +0000
Date: Thu, 05 Nov 2026 14:04:14 +0100
From: kernel test robot <lkp@intel.com>
To: David Flynn <david.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 399/1462] Warning:
 fs/nfs/direct.c:1319 function parameter 'inode' not described in
 'nfs_direct_write_nowait_refused'
Message-ID: <202611051424.qN0uyJ2S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 36cc57b7ec1f44a8408122e4aceeb5bec064547a [399/1462] NFS: io_uring NOWAIT admission for NFSv3 O_DIRECT I/O
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611051424.qN0uyJ2S-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051424.qN0uyJ2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051424.qN0uyJ2S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfs/direct.c:1319 function parameter 'inode' not described in 'nfs_direct_write_nowait_refused'
>> Warning: fs/nfs/direct.c:1319 function parameter 'count' not described in 'nfs_direct_write_nowait_refused'
>> Warning: fs/nfs/direct.c:1319 expecting prototype for nfs_file_direct_write(). Prototype was for nfs_direct_write_nowait_refused() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
