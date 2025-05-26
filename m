Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0226A1B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516596; cv=none; b=HOtgsIq3KmmeK8Y/EVgDKPaSPXdWpe+0RM6JJbRhIdKTRQGa5W38EIXNvmxtorYYBsWPatpx7lb5U2wqeD0TQB3AbcYECT8mglpBtbwlm4rhSaeXMX3IVoiioOqCj/n92ydp++QP8u+Blmw8BJQTu4lIpu8ArdXiR550+Vej6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516596; c=relaxed/simple;
	bh=iOw2HR+CVl/q1BTwHZPFjLcjuy7wtY1DjEALeRK3UGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceKhE6GK0wh2mu3tK2+cQaIvxdX7GWWfdvEZ4P2MTIAehH9h7svg9AiJf3IuXZp8r83VMjbkqWM8EpmAxfHUIh2jPN86wUtlSnWiiM0vJcwo7EVEd5XUe2BGWuonQMZhgNxBla7raJSpeAOUVBw5DHHf6dYWubQuP/aM8UXpFA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLyp4vO8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLyp4vO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516595; x=1780052595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOw2HR+CVl/q1BTwHZPFjLcjuy7wtY1DjEALeRK3UGQ=;
  b=XLyp4vO8PY5OhjZ2yeF5O3CFNiftDDk0zPtUBvswYyWIpjvlB2gRlgDL
   sESInAPPFkDG0frEt+z9xMeaMQ/9f7EZhLMUA40UxzWnQ36c1RQsF2ilO
   9GpCBQR2xohUC6WZuBtVHl6sI9YCYpoB0eFwLCCwhtogxBflWA8kNSufj
   OwmAxzsu6WfgqDYXHWbUxrx1HX+pFJfwY2B4kUTM/rkn+AM/zLeiaFVoF
   WC3UwvDMjbKt7nnc5WMfP26yzxhFBDCYvVWF3WN1MA7qNNICYPbmqFiMc
   UUDBNjnzZEwEa/KSULIbvppb3GN8ta9LsbB/8g6eXIE3O7xvr2itWLVju
   w==;
X-CSE-ConnectionGUID: sJev2Tf3QK2wFUl4FJn0hA==
X-CSE-MsgGUID: oI8OiX5+RjaHqCmBu8Lxaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830482"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:12 -0700
X-CSE-ConnectionGUID: k+Zgcez4TqmztLKmWyDK/A==
X-CSE-MsgGUID: 8/XzFrBARIyRAVzAGQX8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864445"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:03:09 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000G6-2c;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 19:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/oom_kill.c:318:14: warning: no
 previous prototype for 'bpf_oom_evaluate_task'
Message-ID: <202505261957.PXrnlHsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [0/1] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: x86_64-buildonly-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250526/202505261957.PXrnlHsx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505261957.PXrnlHsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505261957.PXrnlHsx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:318:14: warning: no previous prototype for 'bpf_oom_evaluate_task' [-Wmissing-prototypes]
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
