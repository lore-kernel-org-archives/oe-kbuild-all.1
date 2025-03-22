Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D382AD2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742618173; cv=none; b=jLtlhil5nsB+MTXnNNqc2UWRe6EyYo8rvl4Q0n/KUFiM6juNBZ4r9QEldqSqSJzRQLm/auRqtSPcoLlivtPVkc+VNUAAAcSgjrfIt/PKn5U/GvMxrHfNeDamDJuez0+9eLp1/bxoIZ5rbQltlIQztrg+6HpYCY/J+Hm8zho2bGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742618173; c=relaxed/simple;
	bh=BiMnDbQhnN5LvUldNwXCwD9cjH5U8hBF96SlaYKPYno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXmrW4wUwOBj28SZm9WUIQygiA+9Fh1uoyWTxaq88a1+KxXrSjLQG1tl9PWQU287c1QcGGvQyH7FDp0y9Rg+1GZCG0xlDu4VqatWkfMBs20mXcf0KLqHdfrHPuf914Emt0S2ulYy2q6hkgmB0T58+qD7lJ3DrKyd3NImYY6nmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dppLPh9b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dppLPh9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742618172; x=1774154172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiMnDbQhnN5LvUldNwXCwD9cjH5U8hBF96SlaYKPYno=;
  b=dppLPh9bG6QxjRAtnJigEY5zFG+r3yPMmN1LAGK5hOWiLLjDkfpY+5LP
   H3Id+xZt+VIDm3XJLw3t3xrlgsaF6HbgWlYFHchLlGij5U0Ed+hxLfPfM
   QQwxoHU5RFoZjwkiRQHMPkumX0+r4a7ygEr6F26LOJkO9Kbf7PZEK6TD5
   03UXzln1rdpGzPNuAH7OLZfIqOEgSW1BOsRzZq/mXnCX0lhndYlyFgOyt
   IOqgN8Zby7sXKX5Cl7cftlm9slE1eqxsurL3mNrJ5gXCO/2XOctLrlz/A
   9qCWATd9Cruhpvz6EfFhm4qECsi3cvplBCATOGuuEQcWWOFDcsgL7nEnf
   A==;
X-CSE-ConnectionGUID: iNH3mZBFRCqGJFkrk85tbA==
X-CSE-MsgGUID: k9ZQS3ShROec6z3KyMLyWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="46634240"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="46634240"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 21:36:09 -0700
X-CSE-ConnectionGUID: PjC8pSbxSNGAkbRLQVrx4Q==
X-CSE-MsgGUID: /XUqO162SXK+/x7H8+tStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128241428"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2025 21:36:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvqac-0001vf-1B;
	Sat, 22 Mar 2025 04:36:06 +0000
Date: Sat, 22 Mar 2025 12:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 48/48] mm/unevictable.c:496:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202503221210.y0KG9XmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a6e1fc54eea205af6a2968fa3399a828517a7dc1
commit: 9eee07ca21b4bcb78a9e0092696f13a0b3db291a [48/48] ck: mm: Pin code section of process in memory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250322/202503221210.y0KG9XmZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221210.y0KG9XmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221210.y0KG9XmZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:496:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     496 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:501:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     501 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
   mm/unevictable.c:501:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     501 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
   mm/unevictable.c:496:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     496 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~


vim +/static +496 mm/unevictable.c

   495	
 > 496	const static struct proc_ops add_proc_fops = {
   497		.proc_read  = proc_read_add_pid,
   498		.proc_write = proc_write_add_pid,
   499	};
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
