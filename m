Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947DC28641E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670300; cv=none; b=fff9ipocFRWFnpORe8qtrWPsMojVk4ehQWqivMqpg6PdIewBBAe69ppFL50fkfATLxYc2FcEYVpBDs/9aArIRS2UzVwXOMjVhRyBSfmW3NeUvzRTxReNSSnpQBQ50GhlDCiwF2ATcvY2lwvAoYf9PFxUsBMfy//2K8YTodm/dmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670300; c=relaxed/simple;
	bh=ZhQWMXN8xU/6vqzM+Zg9GEAqNJ8AIbE9SDSQhQ2wOag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uXDPouwIR+tcp07re5qUzrYCYF6Yaoeeh3VhvBo0WRbxOOkqDXv4jH/ixColnHDsiaPjUF28ltXVu9NJL6STDdFOLA8RXyGiwYnhovwnQ752j5zS9EcoqyS8pK1dU+lMBZ4uqo269rEdJL11GCyQ7xycOhshYwra+GofQHjC/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfxSkKJU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfxSkKJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776670300; x=1808206300;
  h=date:from:to:cc:subject:message-id;
  bh=ZhQWMXN8xU/6vqzM+Zg9GEAqNJ8AIbE9SDSQhQ2wOag=;
  b=NfxSkKJUOtBZq4UQm6XnhYNDs8AKrmjdrVl8ndJfvGzoOr/K68VQG5lV
   6W0oj8jplMdqUaZfmFGj8m6UfWGdt9Oisqyw7n/PrzdqwajOJvFRIc/9z
   kVMQqafR/RgACUAfWVYZTQUMmcOW/Eq5n3CceDx3T1nyTT2bXdbIIAsEb
   YTfJSl4mJojv9rEq0ie/f+BpkxJ+VylCIQ6df2sVLmJDIXVjN1EzZAwi7
   aka8l3+oW3VIWmR2ucCGyjHGHHDXIoSh++jdDGqDe33WVZJyYLmSZ1rU0
   rAb+iIrmH7mxv8ftEzR/Rpc/yJZjTMz72RpIPt+fwNkcf6S3zWgvQxfao
   g==;
X-CSE-ConnectionGUID: 0836s/2tQLCYuEHmDdNGGA==
X-CSE-MsgGUID: QDGqlrcUS7aOefxkswtVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="103043971"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="103043971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:31:39 -0700
X-CSE-ConnectionGUID: YpIIBv8ISsWwJ3dsafxFwA==
X-CSE-MsgGUID: YvIpTjW8TQywql3RhFaqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="227007042"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Apr 2026 00:31:37 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEj6V-000000002FY-1LZ2;
	Mon, 20 Apr 2026 07:31:35 +0000
Date: Mon, 20 Apr 2026 15:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 96/97] Warning:
 fs/bcachefs/util/fast_list.c:47 function parameter 'gfp' not described in
 'fast_list_get_idx'
Message-ID: <202604201527.1VdAESHY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   f51f0a6b1a26e46b50806f6860e6d7473231038d
commit: 0c148d8d4301dd4875972784a7196c3926d3f3c4 [96/97] bcachefs: New fast_list helpers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260420/202604201527.1VdAESHY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201527.1VdAESHY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604201527.1VdAESHY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/util/fast_list.c:47 function parameter 'gfp' not described in 'fast_list_get_idx'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
