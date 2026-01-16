Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B90235063
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 23:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768606410; cv=none; b=EAYveqsH00mgrGrCT/7PD9Gzq6v3A8ny8+cOCR3f5bn94pd2TrSke74v7oPUDQ9iBKM9x5kUZfzddTg/cLDGbL360JBKuaPXkyZuzPqRKTC803cw7HnrlNMxDNEpu7GEIYU/eQu8gyi52CdvTgdJT0gcQLgW+cw+78jftwGWCmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768606410; c=relaxed/simple;
	bh=JqOHEWPxcdtjhpaGlho5PNp5U3w7MEYADCZR33XHBuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCEqnz/dKn+C324CYZ4GYT/e6ZhliaO8UbGEQTVx1o8+aVV3uTA5KHrvfughMM7YO92QtVaR6EdaKjaFf+SdrEkcsRmaMZMyaO2mQN5JuNSIiLaefCM3idzRU3VDXJpkznvwFRNiIs5o8PRBsMdJS421awZo1RwBFpsnNVCN/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D46LdFtG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D46LdFtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768606408; x=1800142408;
  h=date:from:to:cc:subject:message-id;
  bh=JqOHEWPxcdtjhpaGlho5PNp5U3w7MEYADCZR33XHBuk=;
  b=D46LdFtGLwXTu2A5yC9NTr4eIlQ4LkX6CkIgfHIqes1LXF+NVdKCAuBx
   d0KNZMSyj8LYhEhfhiuJu8IrsIHwEP0nxkvcxHmskC7N/r5Z3wNZYnJmQ
   Ip0syWJxpl/X2ryush+RHAM4Vw0S5ZNU9T+ElR7CGoJ4rUFyn8Uli3089
   jVh12p8uiYIK7ZxO0vhblG0j+k9oPOVvGe1akZhKpaEwYxvewCW+jyzSW
   xhamq2L4qLDJdEBcAjWEtFL4NPTVd136wULbrUanwHrjDNCSN7YRFf3De
   EMQRyn2bWfUvZiIhrO8jMjYOmVvoeSaE8JYjjDlcRBBrqUd8D3AJ7xDnE
   A==;
X-CSE-ConnectionGUID: sfWsp+RoRqmt4iS/MEHZjw==
X-CSE-MsgGUID: FrnPFfJMQuidti2W5ALDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80645282"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80645282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:33:27 -0800
X-CSE-ConnectionGUID: 4bnKQBHXTmOgVu6MvZ15Kw==
X-CSE-MsgGUID: 3vjAStjoRWeP3aIajQQ5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="210229770"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 15:33:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgtJj-00000000LM4-3zcZ;
	Fri, 16 Jan 2026 23:33:23 +0000
Date: Sat, 17 Jan 2026 07:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: drivers/base/devtmpfs.c:88:30: sparse: sparse: symbol
 'devtmpfs_context_ops' was not declared. Should it be static?
Message-ID: <202601170715.97Vdjz1i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62ce2547fe8a8ba15857bb974bcad250c5420d6
commit: cb0e0a8bf4e1e1c8cd6d11ccaa355a23e1853566 devtmpfs: replace ->mount with ->get_tree in public instance
date:   12 months ago
config: x86_64-randconfig-121-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170715.97Vdjz1i-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170715.97Vdjz1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170715.97Vdjz1i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/devtmpfs.c:88:30: sparse: sparse: symbol 'devtmpfs_context_ops' was not declared. Should it be static?

vim +/devtmpfs_context_ops +88 drivers/base/devtmpfs.c

    86	
    87	/* Ops are filled in during init depending on underlying shmem or ramfs type */
  > 88	struct fs_context_operations devtmpfs_context_ops = {};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
