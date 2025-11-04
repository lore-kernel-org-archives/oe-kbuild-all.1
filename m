Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC427208AD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762290733; cv=none; b=sK0cb1GuBzdFMyFGRUY0IyY0eEwLdfFsts9uynF8rc/PKlEgs319hHkUjZHPWeyVI8ZfL32pFaspMUsgnwDRExTQ3neVDfTU8AMdJSBSm3/aD/1hUeNncuCEv9l632T+yE+HsA/brDD3YGQJF7mqdgpBpLaxbOFjBhHZvjHO7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762290733; c=relaxed/simple;
	bh=wPrOjHOKRWpGxNA4mzzFJOoeYTzgcuw+4LjErT1+lFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXEjA0zdCmeo02oi7gk/XdU6Bgdg5b0KFqKWPekNwjQWrRfS1tWqLW+HN9JprW7Ec+sU8qYev8u3349U8YsM4lsHcSurz1vH/VtYcuPKnVkotq4WdjQ4NCWYmO+sQ2ymsv7/bNes2C4OxcV2hkzvKlZZCwnHYp5J1oVgCfiP8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPhmNR0j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPhmNR0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762290732; x=1793826732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPrOjHOKRWpGxNA4mzzFJOoeYTzgcuw+4LjErT1+lFA=;
  b=VPhmNR0jPx6Htx3KIVgFhqyAbelW760sD/yvlfDhke60inE/cqlLEjdK
   RVw+DqPPO9HNZyXSOEBSKFU1za3HGIzcOP6prTTIkL0ROtsVYwleZoJlq
   pTI6AEMnF58VEKLdEsbY4pQqaOw38ffBQKM3dINS2UgjmXFJS+eg8EtAC
   sRbF3RDsvZtnayxKZbdnRIvGIUYnZF1UnOUWtj3IQTO35A+rwjMD0+OVy
   aUpdXMcEMYfFR41wto5WW0uFEapHD9mu5Co+KhLxKyqfoQynwhV1eBV7Z
   WH49NLnIgjXY0dhPKvsJBxcYBIyELk2qyQk9Wr6+9jowz4SXyJD5droU6
   g==;
X-CSE-ConnectionGUID: 9p/cCQR9QEOaeGZ0A4H7/A==
X-CSE-MsgGUID: e3dPRkAMT3WeSoyeM3/A7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64313565"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="64313565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 13:12:10 -0800
X-CSE-ConnectionGUID: TtcN8IeaTgCCvcu1s6HOlg==
X-CSE-MsgGUID: bpneY0WSR8CnWfeApLXzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="186948460"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 13:12:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGOJs-000Rq4-1I;
	Tue, 04 Nov 2025 21:12:01 +0000
Date: Wed, 5 Nov 2025 05:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 17/27] mm/oom_kill.c:252:27: warning:
 'oom_constraint_names' defined but not used
Message-ID: <202511050545.SQfMNggQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: 1de15690efff0a4668efe386cf2b9bacab17e0ee [17/27] mm: allow specifying custom oom constraint for BPF triggers
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511050545.SQfMNggQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050545.SQfMNggQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050545.SQfMNggQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:252:27: warning: 'oom_constraint_names' defined but not used [-Wunused-const-variable=]
     252 | static const char * const oom_constraint_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/oom_constraint_names +252 mm/oom_kill.c

   251	
 > 252	static const char * const oom_constraint_names[] = {
   253		[CONSTRAINT_NONE] = "CONSTRAINT_NONE",
   254		[CONSTRAINT_CPUSET] = "CONSTRAINT_CPUSET",
   255		[CONSTRAINT_MEMORY_POLICY] = "CONSTRAINT_MEMORY_POLICY",
   256		[CONSTRAINT_MEMCG] = "CONSTRAINT_MEMCG",
   257	};
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
