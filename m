Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B23382EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210993; cv=none; b=cUP+nQxid5Yxxc83rTjJp/AFy2dGnirS7sE5h+M72lZ2XM3/QLq34zY+n4yHz0d2u/x72yImAkf3wz1vmHj00mYr0CTji+aErub3XpC8QKVYBDKY+5yW/gBX3EEgvPMjGIVbUeiFAWOKfrpLS1QnnfDVRiQpyrfAiRUWLYseZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210993; c=relaxed/simple;
	bh=odBc/I3Epy0zyzFODF0gZ/MluOA2cMa3YbNHvyNv8Tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EHYuuw+ovm+MtZHMKmVPg+7k+HZk/dFmBU7dErG9YjFJ7jru5uw6PE0ugLF5uh4asmkrZf+d9K/xfYYzLQsqsdv6+y6sYDqSPM6GxFBy+qcqZL8WNg+oC4oqzRcOXuoMZW2zjoSYWajfFQa4AupEtzhvCR5X1qjQjh8Qor8M8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNzgQEaO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNzgQEaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768210992; x=1799746992;
  h=date:from:to:cc:subject:message-id;
  bh=odBc/I3Epy0zyzFODF0gZ/MluOA2cMa3YbNHvyNv8Tw=;
  b=DNzgQEaO39CLocnJDxCiGm5yNDYO4KZDqzwrYwDU1Nq+cfvDKCJ2qa8Y
   TAYFQvzPVSXowhCmScxQ4JVgGwEhphf8XJRrLG85NSXxg2Avd1XnjyhoZ
   s4zWsYwX3H9wIdu7EjC76BJ+mKJmPhPb2ATe4XKNNefowHuXpx3ukTxbg
   CAz8+4hUmkfllR+Mv0Dkx0GFYM5+/YEdVPz0I+CpnQw1SKxlY0IzeEah/
   UK5mHc4kUE2jwe04yjl8bOjt1v0Sx3duuHwXYjy7V5KEgZxoDaDjzK3lM
   OReziOQq2prYIAuflBtzKL0H8wE8Z3NTwhXVen3ZrNX2rESZ02oAp6KZa
   A==;
X-CSE-ConnectionGUID: J2/AzKp8RxmWq8SpenhqYw==
X-CSE-MsgGUID: 1YjB32+VQh6n+OSZ46+dMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80848449"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80848449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:43:11 -0800
X-CSE-ConnectionGUID: o6gw6VxDSFW9tr7BnVDyiw==
X-CSE-MsgGUID: 6qwDzt19Q0usZppBw/kJ4w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 01:43:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfES3-00000000DCz-1fwN;
	Mon, 12 Jan 2026 09:43:07 +0000
Date: Mon, 12 Jan 2026 17:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>,
 Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
Subject: {standard input}:4155: Error: pcrel offset for branch to
 .LS000B too far (0x38)
Message-ID: <202601121758.kA3osRht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: a6d73242b8b5caa9f9a529eab49cc1e85ace9890 ext4: support large block size in ext4_mpage_readpages()
date:   6 weeks ago
config: csky-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121758.kA3osRht-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:4155: Error: pcrel offset for branch to .LS000B too far (0x38)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
