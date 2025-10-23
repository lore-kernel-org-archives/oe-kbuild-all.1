Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F425F78F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 04:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195467; cv=none; b=Q5JewdEZTEP8r5pjQz0EfGJ4hbSI6itowdyjx94YLbgMwmkWaTX+S85oSOugdBkahtgNk+RxQmeUyJIrbPcwy0S+QbyFnFK/Opa4DZjGtzD+Af/DwQQU4cPgNXLrxHq8rP84E7e5svb7mcuM48fc9eWi4ufJSjQKM475WMV9Aac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195467; c=relaxed/simple;
	bh=n97WdUykelIAC72XZ+1WYj/7cVNQYl1XofEJEHVCaOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuxZUsytvJhuoZ2gThb5irRVg0Go7HoQfCQv4b6TNP42+jgl3GzNNXRQuEL4RTD8zbJisChUFRSSpzoysGJX0Hm/0+VZo6//vV3vIpLQsIGuKKcJ1RyP7C637XImTLmvBptmdYKHmlHJ+TTkBINW2QMJTEi8/s8qYgsGIbLNNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEtVBo1+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEtVBo1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761195466; x=1792731466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n97WdUykelIAC72XZ+1WYj/7cVNQYl1XofEJEHVCaOU=;
  b=kEtVBo1+8mNuhkckeP0WYqUV26r8wR/mhpRmxnFjGXpXHUXu16pKfDGU
   4UJ1o//QBfT171sEmO27usUYV7HnD7y4e4RHVj/xZPG308XoWrIPbbJcE
   GWAIvas8cna5Y+P031iH34B31JoFrW+enamaR1+bpDixN5P2MnfqWSslS
   ofDSKfCFsn6C2GqUoN+xa/0mfL1qy9FlfABl3Hv7tVsPTsS0XHAc9j2+N
   D1H2L3s10poF3rZ1S4PUDcL4JypKaslokzjHOS2+YpZoS7Z0vyhdthVjH
   QcchT0n7AcTplnwVh6Ctwfo7Rd9wkmt85U72DHb60Vh5haEKGdF8jnnjW
   Q==;
X-CSE-ConnectionGUID: I25wNuLCTqOhKF9eiu8TTw==
X-CSE-MsgGUID: JjgPeQ99TAmJxG5L9Zch4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62563865"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="62563865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:57:45 -0700
X-CSE-ConnectionGUID: l1/iJlR+RkqtDH9bhVFBbA==
X-CSE-MsgGUID: 3Sfrys2BQI6/fQ2p+Afbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188346482"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2025 21:57:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBnOK-000D2t-0E;
	Thu, 23 Oct 2025 04:57:38 +0000
Date: Thu, 23 Oct 2025 12:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 2/9] include/linux/ftrace.h:557:5:
 warning: no previous declaration for 'update_ftrace_direct_add'
Message-ID: <202510231214.b8IxHY1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: c40f09f4f868f69ec494cbe90165980d549c4a6e [2/9] ftrace: Add update_ftrace_direct_add function
config: i386-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231214.b8IxHY1f-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231214.b8IxHY1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231214.b8IxHY1f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kprobes.h:28,
                    from lib/tests/longest_symbol_kunit.c:13:
>> include/linux/ftrace.h:557:5: warning: no previous declaration for 'update_ftrace_direct_add' [-Wmissing-declarations]
     557 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/update_ftrace_direct_add +557 include/linux/ftrace.h

   556	
 > 557	int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
   558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
