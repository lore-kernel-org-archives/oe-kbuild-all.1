Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841253D001
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgi+y6Wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697152296; x=1728688296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fzh5JoEm1jXW9L6yfglRmOr4Ah0DxpZpYvSVY/HRlo=;
  b=hgi+y6WasedFbyHdMBvSv8jkCoCDIPLvPwJJisGypehbOZaYTeydRf4H
   KIyeWvWMzDIn0Sf3JajiHjoV1QBrCWejhckOJPSAMbje643ZAXnJjqEpJ
   MC0U9JJhBU6NHx8WlD+FdHmeXJ0LtQS+1TfusUX6837E593mH321FFqWQ
   3rGnnhKfhZPUb+l767U12YlybZhv5mY6Zn2TWrkEODWW558tPMbl0pXoD
   lMHfkJQ4WX7F8lJI0bMUXYUkaTeBnQf2oF/ACLK5NDHQ6yEb+OAsb+WjT
   +yC/z/AMUjcLJfikNBtxZzXWwaKzmPV4eMcNUCkW5QT4A7QrMA20l7H1j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382288624"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382288624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758240766"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758240766"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 16:11:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr4q4-00040n-0O;
	Thu, 12 Oct 2023 23:11:32 +0000
Date: Fri, 13 Oct 2023 07:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rafael-pm:thermal 5/9] checkpatch: ERROR: that open brace { should
 be on the previous line
Message-ID: <202310130753.DUEkGASi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
head:   d3bff6277087c77a12ae6458d6da44d725f6fbaf
commit: a56cc0a8338523f709892696cc229527617c1316 [5/9] thermal: core: Add function to walk trips under zone lock
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130753.DUEkGASi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130753.DUEkGASi-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#29: FILE: drivers/thermal/thermal_trip.c:30:
+int thermal_zone_for_each_trip(struct thermal_zone_device *tz,
+			       int (*cb)(struct thermal_trip *, void *),
+			       void *data)
+{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
