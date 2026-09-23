Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85126415B6B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153696; cv=none; b=DngN+23kJQ4lu3EkzztEqCSTrf4SigAVNxxoneAp2j7ugcchH+h8A47oYTF1RG2MqWb3jSnM3CVwYpS4zyxyl+SUPrqwG59YBgosr8b4lMcZgHC5RCOe3aU67iK0QZgtbx4/HcZ4BlJ/sqM13vA4yYiPtK6PmSVW3MoS4NJlQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153696; c=relaxed/simple;
	bh=IMNqjiI12u0sYZeCg4iRQxY4hbKhlPgGHPQQQYxPkDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SNcw9CuY9vcIgZ/vT4U2yHB14my7I+CsIMcvdjajhlrR91br+fx0KxPLB/22rtnF5sbhBlvf99wYUU1vq5ojFDGIh4olKCrI9h+BBNm3oTPeBJCnYonySpkJfd6x57LgkYtg6BZtnbJW6YIzje7fi13oeFuGQcjPVwPfEPtNayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GasKEBQ/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GasKEBQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790153693; x=1821689693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMNqjiI12u0sYZeCg4iRQxY4hbKhlPgGHPQQQYxPkDw=;
  b=GasKEBQ/b2pnb0dejwPCfpwmT4vHT3fqBSKaEun1ths90UDcd5rsKqSx
   4RZuMJOhn6Q1yFifjoMtbVq8tCxKjlI+7/p/N01o4xa/vyqpMuwK2fBGp
   nNpLeq8s99XpkrgfElxDLFKtPYqebLM+z7S5JrflYq1QBOm50nhu7jGpo
   moX2bjaBliZHigktGRIikPMtG7VZEehqnYeIYqnU/NvlNmWPY9XvSWTWp
   EFzL7Ug/gcVB5IeE/PeA6XL4sYmhngddsPeID22Wc1wxCKDeUydomVcin
   VqsPFDRU9lNZOjog0H+QItW7k0rx4wYF13LRMgoAFLxiRFN2Ml2a4I/yo
   g==;
X-CSE-ConnectionGUID: PFk7S3kkSWmeQBZ9Xn+2zA==
X-CSE-MsgGUID: HYBiUo5qR12UMlLOMP3aZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89745183"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="89745183"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:54:51 -0700
X-CSE-ConnectionGUID: t+swF9B7QQm4+w3j/skoFQ==
X-CSE-MsgGUID: LnjLf8lAQAyYFQ4DyvCOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4597840"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 01:54:50 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9IkZ-000000000ax-30KS;
	Wed, 23 Sep 2026 08:54:47 +0000
Date: Wed, 23 Sep 2026 10:54:38 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 58/67]
 include/linux/extable.h:57:10: error: 'ENODEV' undeclared
Message-ID: <202609231027.LtkVFWsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 1004de649431d4488b747496cffa70b779e91550 [58/67] kernel/extable: Accelerate exception table search with Bonsai Tree
config: alpha-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231027.LtkVFWsN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231027.LtkVFWsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231027.LtkVFWsN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:17:
   include/linux/extable.h: In function 'extable_export_bonsai_tree':
>> include/linux/extable.h:57:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~
   include/linux/extable.h:57:10: note: each undeclared identifier is reported only once for each function it appears in


vim +/ENODEV +57 include/linux/extable.h

    47	
    48	#if IS_ENABLED(CONFIG_TEST_BONSAI_TREE)
    49	int extable_export_bonsai_tree(struct bonsai_tree **bt,
    50				       const struct exception_table_entry **start,
    51				       size_t *count);
    52	#else
    53	static inline int extable_export_bonsai_tree(struct bonsai_tree **bt,
    54						     const struct exception_table_entry **start,
    55						     size_t *count)
    56	{
  > 57		return -ENODEV;
    58	}
    59	#endif
    60	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
