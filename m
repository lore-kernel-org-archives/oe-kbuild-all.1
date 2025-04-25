Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B38BE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 00:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745542695; cv=none; b=a/3fwVI3y0as+0BJcxUe8LABG/kKnLiWKQtPb6nVNgxgsBM9Jf23K85BHjCW4XhGzOZcuOOp93iidOx2Kl7Ey6BuRQ17HfPvfM98FI/9hdhDOLk3PzBPGuCQbsdAUA2CWoqdp5XQM1KwQTpwLOKd5qKcZyUzpf9I870/C7Sx1IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745542695; c=relaxed/simple;
	bh=XXROPGGSr8kPNfpjwaEmgnU4oHzUG1cM5vuxQ67Rwxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfOKSRrnHBiwbkGfAsDznt6DAYnNu9THDNoYKidit1g9dWdiS8PVEk1H44j014zxZbs5T9aZKWMnNCuiBVpY6iEolOYud3fmmxZW0Y0BDcqKDkNM1wkkkgJkTyZSeY7KnyfPcfZ6qxkU6fUVtsmgDxW7pN0fwcelz077ZhxD/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n85ZMVeD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n85ZMVeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745542693; x=1777078693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXROPGGSr8kPNfpjwaEmgnU4oHzUG1cM5vuxQ67Rwxw=;
  b=n85ZMVeDoUSIWrlevo14MssBh3Tq7dCQvTTfj/YdlF05FH+/pV/AwBJA
   CMKeI/0o8zuGqywtYQi9v2hNH2fqdibpB6WsiLQS+oQu5F8ssmwLU3N/i
   G6xrO4hcyNb+m/2GMlrqmj4/hRqkOLluIqEJN+oLOMLBvxEEWOikGh0YT
   +qdGRXqGdLJiNZMyIrvh2UgyUbp5VQZ2OpCFAlCv1X1pEJFBbMkl1KslF
   aK78d1dlNEw+6qbYYHFqfvTKxss/QJnC8zG/G1ci4e/V+NyQ9e1K4dN+r
   XaAiwMSKrWUOOIHkqHexERx4WHTuD/3nLXKh1vvIZC0FUu/w6cgpWqkYl
   Q==;
X-CSE-ConnectionGUID: +89ODQNITTuqNqoV3LyW5A==
X-CSE-MsgGUID: mfFciOtGR8GpfnKAiJGyvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57844968"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="57844968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 17:58:12 -0700
X-CSE-ConnectionGUID: TfbnmzU1RH2Z/mg90pM3Pg==
X-CSE-MsgGUID: SyxxKttLR+2YKJSGpUmmYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="163733015"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Apr 2025 17:58:11 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u87OK-0004h3-1k;
	Fri, 25 Apr 2025 00:58:08 +0000
Date: Fri, 25 Apr 2025 08:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 19/19] mm/unevictable.c:496:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202504250803.mAwXCIZc-lkp@intel.com>
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
head:   4bad2cd1902185593ae2d7cdf67ac43d5aa2dfe9
commit: 9eee07ca21b4bcb78a9e0092696f13a0b3db291a [19/19] ck: mm: Pin code section of process in memory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250425/202504250803.mAwXCIZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250803.mAwXCIZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250803.mAwXCIZc-lkp@intel.com/

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
