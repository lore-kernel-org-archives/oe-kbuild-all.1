Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77C2F39CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276754; cv=none; b=gOv19nno7SaN0Q9/bRJOsLle3HuvpVJkWfftG1MkYNqNJXjt1K5c4A1NQC9QH5GfEkFZ3bJQAmRi/vBtqxjFWUF3WZoP6zLZbSLHgExaySnaAlZytiJr4QPDOvvnNq6ywGh8IMF/HpDfR0z8bbwK+TjrjevHXnm39aiRj4v1o/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276754; c=relaxed/simple;
	bh=yjyQCe8crmU7YU2XD9cLnyw1r+T1KJxbvviGATfMa18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIoP+l65tLH5E4OQIQ5XaBQ/PqDXWxbdbZp/gLhTcPZKEcHNWu/GPfWYaLwM3Lht3EQZ5w7vJcSnqmKSy8AVdWRqZD7FNbEE9XR3ND79KK2uCxGwgLCN1RLMeCSPyV+H3sc9cbbQxgbeUzfFhCmAc1t7qn3GQ5hAbAMyPkv3VMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btErFrMf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btErFrMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756276753; x=1787812753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjyQCe8crmU7YU2XD9cLnyw1r+T1KJxbvviGATfMa18=;
  b=btErFrMf19j/dXsJ88NPKpTUn4a4g3mOXHQVQsvbGuifvMxIvFVFNIS7
   LnKqun8SBIZb/frq5Zpq9De4Vp4eXuK5u5fYmQjiL47KCfDoBJma4S8m1
   30v3brBkecvTsLDKph9aK0sp6mtr0pSgYuAy5OU9JaMB5ZxlC2DiXuGtb
   d0ClvD2ewkXPDGHAakdG4JW5a9mg9nA1i5altbaBgz3pYiZsZTxbE2VnL
   YjrOV1SF/rdPVEDirAov1JgCD3iOBxmsnmutNZM7DEcPqyDztR4IdqiCA
   UBLEAWmhLxNNS5i1VE1eJvyque6LzAjmpajvDzMS+mzvtz9VuS+3ntmqj
   w==;
X-CSE-ConnectionGUID: KvgQkDHbSrisdBTGiKmK+g==
X-CSE-MsgGUID: rYjyjRi8TCSZ8DYV+qy+fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69894403"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69894403"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:39:12 -0700
X-CSE-ConnectionGUID: 8tq5LWynQG2aeI8neHgI/g==
X-CSE-MsgGUID: cu0tGhbrSNmWrcNmHViicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="174098160"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2025 23:39:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur9oH-000SkF-07;
	Wed, 27 Aug 2025 06:39:06 +0000
Date: Wed, 27 Aug 2025 14:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:iomap-pi 8/22] ERROR: modpost: "__bio_integrity_action"
 [drivers/nvdimm/nd_btt.ko] undefined!
Message-ID: <202508271402.DAEALpnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git iomap-pi
head:   98fff771924bacb44d3e7923273796c8666e0eb0
commit: 230365eba58ec1c5b0ff33c3ae9c0424ee03f623 [8/22] block: factor out a bio_integrity_action helper
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250827/202508271402.DAEALpnj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271402.DAEALpnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271402.DAEALpnj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bio_integrity_action" [drivers/nvdimm/nd_btt.ko] undefined!
ERROR: modpost: "bio_integrity_prep" [drivers/nvdimm/nd_btt.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
