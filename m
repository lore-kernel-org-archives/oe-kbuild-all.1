Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2915190462
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 03:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765681602; cv=none; b=LpcnMdpIdIpCnQZaycPVS9NDv4SjzgJioZdxe7Mzh8WUUeN4N9JHY/qqC4ThIOLc7j4Jh7PNqDiokc6P9EPVXF9ESqDDBV07KODiu/kbhWinKyzguJdANDGDH1gb0jBrBLwJd5xOMkWfhxK3mZsw/fnNdf5e3Ic3VsEaqA48y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765681602; c=relaxed/simple;
	bh=UrekZ1zV4ad/pPmqPKl+KEq2VD1Gg5SJUrD6e1rygF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECLThxi+Bdr+U6yWNQAHEyLvewH8zMrMpIAFXx4Qyz7nx2Ay5XWMDQBNC5a0VFzpotKiunSHTLzAsLb3K8exVTtHvFMCQ2Dc1xdSHedL3drtUW/ZI7zNXxokIPNKjFAc42N7UFb2IaihERLXevOGMNQ9NEKSUU3tJbv+a7/x6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtG8704w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtG8704w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765681601; x=1797217601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrekZ1zV4ad/pPmqPKl+KEq2VD1Gg5SJUrD6e1rygF4=;
  b=gtG8704wmlCmtbWs5kgAGISqHVWsl4WMMWOGcTweJLeQ0hETK/QRSeJX
   rinCmpLBrQIm2s5DSb1uBk2t7EXObpjzg6lqa4KhM0GO9JVthpqKrgV8n
   nSyXYaUgViAlIpkXNC/VB/K3NXP9EdqLquqdZ94tImjhRK2BRaPxRs2TN
   wuOleDwJ+Ey0rwQWfh+WKuRWxoTFF9ogjmOzsNyT0P96ER5uuLrLF9/oz
   /GmPXv6hEsA7JxrNMFckwuaF8oTAO5m98iBbzpBPY7ZF7/aHcqDDuWFlL
   PEEugh15e7NFjSty+BwSZ1GAqDoWV+dDkgyv7I+RzVfDLDcLwpKSSxKoT
   A==;
X-CSE-ConnectionGUID: LJlLDGynS/C4/sQW+0uiwA==
X-CSE-MsgGUID: 71fNkvolRPmfkkYRw3UWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67669875"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67669875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:06:40 -0800
X-CSE-ConnectionGUID: c1OCcL/URpWhVGSxyQIToQ==
X-CSE-MsgGUID: /6Dz5yU7SLa4zHlsE1jTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198256293"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 19:06:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUcRR-000000002Fw-0j70;
	Sun, 14 Dec 2025 03:06:37 +0000
Date: Sun, 14 Dec 2025 04:06:15 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for
 'nf_nat_csum_recalc'
Message-ID: <202512140450.2pYUhzO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [1941/1941] netfilter: nat: remove csum_recalc hook
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140450.2pYUhzO7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140450.2pYUhzO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140450.2pYUhzO7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^~~~~~~~~~~~~~~~~~


vim +/nf_nat_csum_recalc +56 net/netfilter/nf_nat_proto.c

    55	
  > 56	void nf_nat_csum_recalc(struct sk_buff *skb,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
