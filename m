Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FE032C6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hhs1YWxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697750526; x=1729286526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvPV7bG7hO62s78p3LFdjhoT9IxfotMUVngHB9KeLxk=;
  b=Hhs1YWxA9Q6bmZKExZd92uq0xnDxLHpsmpyM7pcI5N2jOxqRmq3Md/kV
   Wnpd3HSjG4qZNzoqOjUgMDbZiTQXWkYKZixLHgve8WHp9XoGr3Ob1qSlL
   1x1r9s7hBQ/5Jft0vccs1l476Nl+rp+3c+uzNCajjoLiQLuIXrrZrvfsY
   ZiL/uVDFQw6TQq/QOFZoZiG/z6dYbFRjqi7bVzlxvCT9jewsyKCtNGf69
   a9I6Vip8riQHM30UlxjV8JeZrwW3P3x84XDLzzF+Ll6MMTQD/p0b/pnS6
   N73nHzvh5VGn0rGUgzgKOmdXYfwMXgFRp5giLQ/4oXZ0iVYtDL4vwI1bQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389233974"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="389233974"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 14:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880847214"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880847214"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Oct 2023 14:16:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtaNY-0002bh-2P;
	Thu, 19 Oct 2023 21:16:28 +0000
Date: Fri, 20 Oct 2023 05:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc6 15/103] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310200537.0a3WJ2hZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc6
head:   582b3d01b6a9d2e0fb1e92ffa07c9ee4270ab878
commit: 7f3833b8bb2aaac72176d9cda30359ff75be2332 [15/103] resctrl2: Build domain lists for resources
reproduce: (https://download.01.org/0day-ci/archive/20231020/202310200537.0a3WJ2hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200537.0a3WJ2hZ-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#206: FILE: fs/resctrl2/internal.h:21:
+#define for_each_resource_by_cap(r, capability)			\
+	for_each_resource(r)					\
+		if (r->capability)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
