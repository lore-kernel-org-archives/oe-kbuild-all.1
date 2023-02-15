Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE417C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676426972; x=1707962972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zP4ttAblnw8iXM07HMhfyGv2UjphiHf+7sruIc6ZC00=;
  b=LoNlUMB4KeyGCECM6eI1wxloMLu61FXPnC7MhV4Wzzia0Lk0Sq8vIoBB
   pFcxHNfCbZO+3L2uDGV4XgaDoFDS1PsLdcv0L/WlhXfQ5bp2jKUaVfEvN
   +0AoE+MKkuN/Jt3TvL5OyyJV1jq9psstk+AwveLyfNSjO5PnBhkm5zSzQ
   fPeYqtdt/79zLo1b1OZ5R+cP19TV0gQcTKNoX44wO8ZQjnWre8uwdqsJU
   5O17IjgboKaQHkAh4Kp1G9Aio9y9y+bOFKjA/g+Xo18HA0XCN1y361Yht
   GvEwZCsL6b5n9BAR1OIZ4moFKPGM8zdvcijnG+nBkpTLtznYu74H1wNLV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329951273"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="329951273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 18:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699774245"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699774245"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 18:09:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS7Ed-0008vQ-1N;
	Wed, 15 Feb 2023 02:09:27 +0000
Date: Wed, 15 Feb 2023 10:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Perry Yuan <perry.yuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Wyes Karny <wyes.karny@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 9602/12724] htmldocs:
 Documentation/admin-guide/pm/amd-pstate.rst:343: WARNING: duplicate label
 admin-guide/pm/amd-pstate:user space interface in ``sysfs``, other instance
 in Documentation/admin-guide/pm/amd-pstate.rst
Message-ID: <202302151041.0SWs1RHK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd [9602/12724] Documentation: amd-pstate: introduce new global sysfs attributes
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151041.0SWs1RHK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pm/amd-pstate.rst:343: WARNING: duplicate label admin-guide/pm/amd-pstate:user space interface in ``sysfs``, other instance in Documentation/admin-guide/pm/amd-pstate.rst

vim +343 Documentation/admin-guide/pm/amd-pstate.rst

   340	
   341	
   342	User Space Interface in ``sysfs``
 > 343	=================================
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
