Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1E53B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWyLEoWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698478397; x=1730014397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WedcRtU5lEtQegWOBktwmA7tw6OkblazgKrE+Q/Ay5A=;
  b=hWyLEoWlUtkpLl8kDckBU2n85U/X2dRjEA6iXt3mpLeu+n3u7O8G6DsC
   cX32//9ji4uCWMUK3LhzaYxZ+reQS9+irNadFS0myb2KQFt0FemmgCBk9
   Xzm5PZPeXFhg6gGirBqc/igPWU5pZQzEtUF9RoINjKI7BumN/hervz++R
   gZ9VQJSR9PxcVH/1FgbG17A1JUQcqiXKgVn55mKjUrva5/3bwII0pfFzy
   RWAfNS8NA54K3k8XNJwg9gIM873nEtyyxZ/ZE3cAQFTG+8aiqahTt15VL
   KS5bt7LYy5BUmq0GrJFAjGjejT4ay1n9DQTn/1+hg9QthbJYSoaFTVOQP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="391752148"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="391752148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 00:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753334890"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="753334890"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Oct 2023 00:33:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwdol-000BYV-23;
	Sat, 28 Oct 2023 07:33:11 +0000
Date: Sat, 28 Oct 2023 15:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc: oe-kbuild-all@lists.linux.dev, shr@devkernel.io,
	akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	riel@surriel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/4] mm/ksm: add ksm advisor
Message-ID: <202310281513.BWtopDPM-lkp@intel.com>
References: <20231028000945.2428830-2-shr@devkernel.io>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028000945.2428830-2-shr@devkernel.io>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 12d04a7bf0da67321229d2bc8b1a7074d65415a9]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Roesch/mm-ksm-add-ksm-advisor/20231028-081347
base:   12d04a7bf0da67321229d2bc8b1a7074d65415a9
patch link:    https://lore.kernel.org/r/20231028000945.2428830-2-shr%40devkernel.io
patch subject: [PATCH v2 1/4] mm/ksm: add ksm advisor
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310281513.BWtopDPM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281513.BWtopDPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281513.BWtopDPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:334: warning: Function parameter or member 'cpu_time' not described in 'advisor_ctx'


vim +334 mm/ksm.c

   321	
   322	/**
   323	 * struct advisor_ctx - metadata for KSM advisor
   324	 * @start_scan: start time of the current scan
   325	 * @scan_time: scan time of previous scan
   326	 * @change: change in percent to pages_to_scan parameter
   327	 * @cpu_percent: average cpu percent usage of the ksmd thread for the last scan
   328	 */
   329	struct advisor_ctx {
   330		ktime_t start_scan;
   331		unsigned long scan_time;
   332		unsigned long change;
   333		unsigned long long cpu_time;
 > 334	};
   335	static struct advisor_ctx advisor_ctx;
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
