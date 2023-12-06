Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F7B1A5B6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 23:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsvwnafM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701904871; x=1733440871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0FherxvQtGVhOje7sSU62EK8tDa2BwfmY549sq8uIA=;
  b=CsvwnafMU52jo62JXgrmWz1dYTja3lWBpogYAbTdYwJx/S5WdHWL1rvZ
   H9VR2HRRkzMN8S9k66wArm/7DPz4AkZJG2o+S+SLt/OgDrNOCGK5tCEhr
   CvjLDr+9IwPfK4EMKejR8jaO6nB0zgiaNMUvL6YjRaHEMyNFjX6Q2ROyw
   HR1V9f0kRU5OS8/osQHFdcxLd5P3phGQMFQgfhBV2i9+aUBw+BZdPsjh4
   XmdBfVzGkYRSWHmSXfBtnrfOhfjnxs6KQzuWJuVDPbGLa9P3eMBYY2oTy
   yf4om7jwVARAl15XQ2Ojlp3PM++fnvgN0Kj6QUe3t/rV3uYvUzMluKTUl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1211467"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1211467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800516888"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800516888"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 15:21:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1CT-000BYI-0O;
	Wed, 06 Dec 2023 23:21:05 +0000
Date: Thu, 7 Dec 2023 07:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [qais-yousef:uclamp-max-aggregation 11/11] htmldocs:
 Documentation/scheduler/sched-util-clamp.rst:172: WARNING: undefined label:
 schedutil-response-time-issues (if the link has no caption the label must
 precede a section header)
Message-ID: <202312070722.6ljjHYA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   125f789d9c871f96dccf78573b6760d24cdebcc8
commit: d3e87a62acb4d2f91799d5112ae868760ab94bfa [11/11] sched/documentation: Remove reference to max aggregation
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070722.6ljjHYA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070722.6ljjHYA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/scheduler/sched-util-clamp.rst:172: WARNING: undefined label: schedutil-response-time-issues (if the link has no caption the label must precede a section header)

vim +172 Documentation/scheduler/sched-util-clamp.rst

   171	
 > 172	See :ref:`Section 5.1 <schedutil-response-time-issues>` for more details on
   173	schedutil related limitations.
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
