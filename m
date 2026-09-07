Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1368448B89
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773361; cv=none; b=fD9y2/MTOy8NxbcbhM/Zi5uxFlXl72HFKEAGSNtBjq8MsAZPZBPEFqJOByj131/4XpwMrMmK1yMG9RQQ8crwi3XGgg240I5G860BDOlJBgmZ2IFZrJCff9WU/fDfSZgkwlIkQ2aTNhh1Z6cQvRKxZmJviwzB6QzJj0kd7e0rFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773361; c=relaxed/simple;
	bh=AhAOLKEf1mLxCzZvMvHk9UFZ1mdaJsJRSRb7GxJUrRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OhN4ng+Ip25fzZuZr1/WyMnD7busDvwkwEHQy8RfQ0D5HlNNi+uxq/YiBfyMo91U8qZ1cWA58vCaRJ7HfMV0kStO4w/OFpavDeWGojDjvrH+npPEaTzIcpPmgQb8v8G8Eq8YKUTstwqbJUjrDCSq5S4LMOU1vhKCaPiDf3/gGkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCYQvfln; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCYQvfln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788773358; x=1820309358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhAOLKEf1mLxCzZvMvHk9UFZ1mdaJsJRSRb7GxJUrRs=;
  b=WCYQvflnSc+cybLwhFglCW/fecGqGtaCVQ1ZdVZoFsoZQCNz5QVc95iA
   RZptOOxEVgRGh7hpFeL4h0INssSPitK3J/OC8jB+ktq13VBwzecK61Az+
   a0YICSsg/09e4WjVLBSms1OpBpy957kY3CGrunvs4leFSoYrEasffR0iT
   nLon/zaa1JfwwvEUVBRj+GLfoc0u6F7GtOun7yZKcFjQDR+Tb8fBbp8kX
   A7xEXTGUIX41foGPGBS9AQMDhJyrYy2qWkzvKqqzWPU354PGL5NJya3bJ
   NSBhYKNnThuriYH0qdrbE7QFXnJC6YdRLwxmxPNJU0Q8xe9DK6/09OWws
   A==;
X-CSE-ConnectionGUID: Xv3pz+RRQtmFeRd0nM9wWQ==
X-CSE-MsgGUID: yZWo9HSAT3GxDVVQol0dVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100530660"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="100530660"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:29:16 -0700
X-CSE-ConnectionGUID: ApSl3zpORx2KRadrgr9RMQ==
X-CSE-MsgGUID: 2ec1onzmRmmhBNjMUtgUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="275950120"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2026 02:29:14 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Vf6-000000000hf-1H8a;
	Mon, 07 Sep 2026 09:29:12 +0000
Date: Mon, 07 Sep 2026 17:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge-v8-all 228/234] ERROR: modpost:
 "__aeabi_uldivmod" [lib/test_bonsai_tree.ko] undefined!
Message-ID: <202609071755.qPBEs4Kb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge-v8-all
head:   15fc7b4f50950618237402fdf3a05eb0caaff2cc
commit: 6befb245966f5aba1109cfd718a7cf4dd7f13375 [228/234] lib/test_bonsai_tree: Add benchmark for Bonsai vs Maple vs Binary Search
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260907/202609071755.qPBEs4Kb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071755.qPBEs4Kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071755.qPBEs4Kb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [lib/test_bonsai_tree.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
