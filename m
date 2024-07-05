Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715E4AECB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720162503; cv=none; b=KqFNmkH7BB7AmMYeZ6Qd7eM8nj0cqUEUCkdsQ93vEWIzxCcUsX8LyPb+nGWQrrbQWm+V8rH46jIXZ/3v2oEMwvNODFYmjh3LBHkDZ/4XMcYBWNjH/uIc1FSSrS4j0r1RGABn5YC7T8d2MCqwjy1Ga85ane8XQdnS9WYJXHNoqsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720162503; c=relaxed/simple;
	bh=8U2THlmTrFtIuT7o/EWjnkBlUwiuDsF2ZnmMebwbqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cR+TM0UdBOuPLZCm1o4rVYe5i9xUHdOdnmCzVDXtYi94XWTSGdqHc7/WTCmR1oxbTJGrWqwf6UtBAQNyN63Az0dlIlHc8P6hjhFvgUNvEcspYmUgljDXv4DLM6V7onTeLqKr6NXCSXhruC8MoPCdArtYy764Tl3bFUusp8ZEi8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwz5pkGI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwz5pkGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720162501; x=1751698501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8U2THlmTrFtIuT7o/EWjnkBlUwiuDsF2ZnmMebwbqq0=;
  b=cwz5pkGIF6nZ5f2zR+GVooEvXa081UfjsqcbHAK0v55d9dApLOsoppyR
   WkfRGutuBF7W7fystRB3IBZHEsq+o6sxA/J5g/Ej9xb1WW8E3n60BYoBr
   CWCa8VNS4/YTdbwUBJY2/Cd1L1Q7uJ93oRvmcxjpQJ+K2cQ4Z/kvFxbMb
   Yh/wLTNXzIq+ZEx8CCiWMv/gApx4KW0p9vg/WfCFbx412SN/68qf4VxNr
   rjAAbbFHwkPz0yNWwzi6zrpP7vssbLkliAVuJJm6jMvb9f1RqIFd5Gw0T
   fEmQoldpY0l29qG+iNB4CUOs036p3T4m3IUHcM52nPZXCAIGm+TSzfpu7
   A==;
X-CSE-ConnectionGUID: sHj1V+8fRaSlmZcc8a1Xmw==
X-CSE-MsgGUID: i7osC9S0T4i7Zef3USxBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34987101"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="34987101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 23:55:00 -0700
X-CSE-ConnectionGUID: CtkxpZ0tQMilGBvvK8cZyg==
X-CSE-MsgGUID: 3opx+SlvTfWww5cartL++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="77526630"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 23:55:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPcqO-000S3E-2w;
	Fri, 05 Jul 2024 06:54:56 +0000
Date: Fri, 5 Jul 2024 14:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5016/10451] kernel/trace/trace.c:7534:37: error:
 'last_boot_fops' defined but not used
Message-ID: <202407051402.LW9VtaLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 7a1d1e4b9639ff08b2f42605c2950ae1ba4a43bf [5016/10451] tracing/ring-buffer: Add last_boot_info file to boot instance
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20240705/202407051402.LW9VtaLq-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051402.LW9VtaLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051402.LW9VtaLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:7534:37: error: 'last_boot_fops' defined but not used [-Werror=unused-const-variable=]
    7534 | static const struct file_operations last_boot_fops = {
         |                                     ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/last_boot_fops +7534 kernel/trace/trace.c

  7533	
> 7534	static const struct file_operations last_boot_fops = {
  7535		.open		= tracing_open_generic_tr,
  7536		.read		= tracing_last_boot_read,
  7537		.llseek		= generic_file_llseek,
  7538		.release	= tracing_release_generic_tr,
  7539	};
  7540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
