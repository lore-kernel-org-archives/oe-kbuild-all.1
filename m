Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F47190068
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 04:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747371545; cv=none; b=IOydy2kbJaapu8vGPAcQdntAKkYo/ImetixvqEfmQLIkjtX6oQ83SUQRlurvc450rMFBl9h/z8Lo9LRLxm4BE9IDd4pbcYob7ZsbZHAEraHM1N7rYAUibSvqhdxmAmlDYbnijmilbzgd4lt0EdoPD7fTzc6TmZmZ+B679is2pt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747371545; c=relaxed/simple;
	bh=0mbW/q9wRu5j54FbXz7JihQR+LvpStL6S3JntvVbmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aELsX6nYnS5yi2QZaeZDMBSBwHWAAJtbrHAzQAZ8tQshWVtYNZ4tkMKJkmoCN3YB+265qQ/mdjYGQkPLgb53IEr7p1QfgL/Wzq8Ozux8wHbWYwkaA8Fnb0a94mhgPf9kqxUiRmUEC2rlWxkSJp1FlKHY7rA0ioAT7jocCtS6bk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1cUxAjJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1cUxAjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747371543; x=1778907543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mbW/q9wRu5j54FbXz7JihQR+LvpStL6S3JntvVbmsA=;
  b=f1cUxAjJowpRMr+dfdfQGLL80xwH6W6vtrykTKrBTixNXQLVDHqKqEUS
   fZ4SO1dskOGR+cZxqDdZ7LXGm6JW/VexVyQuLCu+ZxZEmMTLAhXzJGBmW
   lMwPC4OQ2ddSWwbfCBdhTgpaGRGmIWqIMFGLpJ1LKfh0oUQ9iAAVmEGW7
   oy9ThQAwXiZBoJLTzM1NlM0IRnhhqXmQJeIhaL11N1xfEFBaz9K1G+skP
   5naspQfmXBnGp5uiJ6vjFnZR2kiFjvHefH8B/aKgYwnkxNQfxnKJQoY0f
   GHVR6yuLCsHy/D+IHsquQHVPtAs+ISm4hPpGb3JAo9y31SMxZU6H/AY4Q
   A==;
X-CSE-ConnectionGUID: q/vfIZvWR+CjD5v/VTwukw==
X-CSE-MsgGUID: cnEkyQ9eTMy1ZUdZS2neSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49317443"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49317443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 21:59:02 -0700
X-CSE-ConnectionGUID: NL31miBtTQiFZCsIjY3LUw==
X-CSE-MsgGUID: Wc8VMxbeR8WBMAHpy+3JNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138318924"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 21:59:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFn9v-000J0D-1U;
	Fri, 16 May 2025 04:58:59 +0000
Date: Fri, 16 May 2025 12:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/unevictable.c:501:30:
 warning: 'del_proc_fops' defined but not used
Message-ID: <202505161243.hhdijlij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: 9eee07ca21b4bcb78a9e0092696f13a0b3db291a [5/5] ck: mm: Pin code section of process in memory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250516/202505161243.hhdijlij-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161243.hhdijlij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161243.hhdijlij-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/unevictable.c:496:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     496 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:501:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     501 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
>> mm/unevictable.c:501:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     501 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
>> mm/unevictable.c:496:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     496 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~


vim +/del_proc_fops +501 mm/unevictable.c

   495	
 > 496	const static struct proc_ops add_proc_fops = {
   497		.proc_read  = proc_read_add_pid,
   498		.proc_write = proc_write_add_pid,
   499	};
   500	
 > 501	const static struct proc_ops del_proc_fops = {
   502		.proc_write = proc_write_del_pid,
   503	};
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
