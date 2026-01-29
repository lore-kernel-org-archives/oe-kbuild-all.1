Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEE359FAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769719519; cv=none; b=rXJTUrUtSFxSjbAWjljJqAlyhagDJQbdrSvE5nyQYrj81cRpiN9hGGVU7vhz4Vnx11eA32OHos7ldt3IcLcvh77BCIU2tOBYv4WSL817oIG8ozsL2Qjl47I3uMhgX1BUSLJXZq34i/QZfw7IXfNsUq8spnlnwGZxMwKeKIIDtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769719519; c=relaxed/simple;
	bh=eaAMJBWwDFM4E3gcG/86gamrGhbNTzFRqLj5w2BMOTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pp/e/m5NK1C49y46J3zDEH2RVxMMDGpYkzLlt5oL7kdYsu/kUqatvtmC3ONzjLy+lSqfAfeBMIzpxVw15kM1+f4T+eRqI5XVoEThCugpAg1RFuYzwt4pZZ0LgQInpkJ/MHzjhr5pKJAX3GDgSNjE+sruBl/lQEBfGjuVqvowgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4mRf39E; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4mRf39E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769719517; x=1801255517;
  h=date:from:to:cc:subject:message-id;
  bh=eaAMJBWwDFM4E3gcG/86gamrGhbNTzFRqLj5w2BMOTk=;
  b=R4mRf39E6sUQA8WrcuhDpUWrqQWPwjavjX1Cby4DEij/c/7iRHiOoNs4
   0FC9m5GrUYxnt8v4bunnsu2wVD5wnYPT9spKJT6rY0PEvA0ZQX+Jw0RWj
   xshfbV4ria1FRlitDP+HWin9D9oUBxQPc4L5cHM6w1N0om/BhP28tmwRe
   YQ3m4hoRRU5KkC/SFASbvw5Jh7AafDJLgxaDHsJhq3L4FH7eliW44Fvg8
   +aO58sHrn8jsEZZKlhzYuTKz06fxqLbislmuKHKFekhXbi9wd9h3frmt2
   sk07FvVC/9yfWHrmXu3P8OPYyaStNu9CoV6ODGF6EsCWs25YCufVbSbRH
   Q==;
X-CSE-ConnectionGUID: 2tsuRZcJRTqZDS7pp0RWLQ==
X-CSE-MsgGUID: +iCjdtESQ0GPKWrtt27fkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73569239"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="73569239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:45:16 -0800
X-CSE-ConnectionGUID: 9kGJFdrtRACtYsLkfcQWDg==
X-CSE-MsgGUID: 3EenphENRMyB6j1Ciz3eJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="212758157"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 12:45:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlYt5-00000000brY-2wR3;
	Thu, 29 Jan 2026 20:45:11 +0000
Date: Fri, 30 Jan 2026 04:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/7] ERROR: modpost:
 "asoc_sdw_get_codec_info_list_count"
 [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
Message-ID: <202601300447.I7uN9NDk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6e70aaa6c473ee3c01f2fcaf3bf4bbc9c768c74f
commit: dcf066e2640127f5a26ff2394968a8fe39220475 [0/7] UPSTREAM: ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: x86_64-randconfig-071-20260129 (https://download.01.org/0day-ci/archive/20260130/202601300447.I7uN9NDk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300447.I7uN9NDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300447.I7uN9NDk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
>> ERROR: modpost: "asoc_sdw_get_codec_info_list_count" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
>> ERROR: modpost: "codec_info_list" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
