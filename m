Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732338DF9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375767; cv=none; b=gdTdU89GRVm0qZwn6Hx61qfwaV8p2dBwv3vA2HpIQtOs05EZJN8QwHgTH6InqP8e6rCSs9J1ZTpU5LiLavxXjvJc90f6pUUt53rzo+blRLcvyozF6dQArN6z5vazQos0I80PAZHKxN3uJ4W76wstkPyV6mfHjHK/zCjXp8zHVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375767; c=relaxed/simple;
	bh=4/TEUDQLFPHbmIy6HfalmVuKK6yt/hD4aLzGMfwBUyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p04zlGZybRYfIWOd1abNWRMQwL8bkv4Oz22+QpLwyBApOONvSKVa/FQ3d3iflPmrz5iOq6K35W5/asguV0B3x6svTVu+yCTafmnOYx2M/8L1gk5tQ6uYkv3lkiUxxrtJbEaB8qD7AOndKrcqVchY1uHyZ/aYYb2E00OgSpXSVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdAxY9th; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdAxY9th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781375766; x=1812911766;
  h=date:from:to:cc:subject:message-id;
  bh=4/TEUDQLFPHbmIy6HfalmVuKK6yt/hD4aLzGMfwBUyY=;
  b=KdAxY9th/kf9IDxPGZSgaZzcOX8AcAwZ3AG3W7MXFJup6VP1ZJX8247b
   m61TtIYu5JrxodEGbOMkM/H2kTX7YLut0Sg8pzaJsHuhemOE42wt4cAbm
   OItcmBVJJ0HiR42XxW+6ipfEBR1cYv3gTQX+Y95Bb+Vm3TA5Zubs46GMM
   6Wa75msM9Yx5hgEjKGZ9n80ttuLMQsa+6a7Wrcdupt118nGi15dFOMu6/
   Q/Id+AjyNrebWrJvW/64QLxfr0ZTBvx825fxxVO1cTfvDWxmmlQv7rmLB
   eIZ1UwcPF5qlsQNy3zIE1/ADSI6F3NsraNz3lxlXyHlpoCvELObIbaPZt
   Q==;
X-CSE-ConnectionGUID: f/x0u5+RSMeJzj2L6iiuxw==
X-CSE-MsgGUID: 1kp109ZDSiO237kZuhwZKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82024601"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82024601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 11:36:05 -0700
X-CSE-ConnectionGUID: pML2qQqLQVOuWMRUgEtHRA==
X-CSE-MsgGUID: FOgN/vieQuSQSSPL8eIw5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247167703"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 11:36:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYTD7-00000000QAK-36HR;
	Sat, 13 Jun 2026 18:36:01 +0000
Date: Sun, 14 Jun 2026 02:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 28/43] WARNING: modpost:
 vmlinux: section mismatch in reference: lookup_object_or_alloc+0x68 (section:
 .text.lookup_object_or_alloc) -> unknown_bootoption (section: .init.text)
Message-ID: <202606140252.MLH6ZsGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   c30cbbf5a225651bcec95051409f08b2be078aa8
commit: e59cfa56675e3679cb4fc08ca7f88c5fb6162ccd [28/43] fs/congfigfs: sanitize configfs_get_root() return values
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260614/202606140252.MLH6ZsGT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140252.MLH6ZsGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140252.MLH6ZsGT-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x64 (section: .text.lookup_object_or_alloc) -> 0xffffffff (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x68 (section: .text.lookup_object_or_alloc) -> unknown_bootoption (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
