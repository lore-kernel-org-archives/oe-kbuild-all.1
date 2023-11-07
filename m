Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726FB2F849
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYbCTkaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699393771; x=1730929771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRvk6MtIxmZR47xpZl+Mw6Ip70pQxiHaERFJs/d6VtE=;
  b=KYbCTkaXRDEebYa/NDyXmanB0bpT+XkLm0S98CC07jL9r5hURTqUh4q7
   n6O0debSnLQ9wLuy42JXIME1P0/RUc+D9O96eSz2SWx1915yX6WEEm3SU
   FrkNgrEzycMj/sxAneMsAI8DuIrFMkwmFIgb1N7CqGULJHevZ8yQF7GN1
   889WmGPn94c5N6aWpPWV4DQ52Ii1b7VNwMQn5wPFWbKPFnJGf7MjSzDYp
   ocgR5HUyrbYxYpTRSA7HJsaxS+T6C15fruMOsboUhUJSrjFQCTr+UcWXH
   qkctjHMcW0UmdOAXvQMxHo8DktlE3spJa0oIW3viyIgl3ETonJzx7zRCA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393552982"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="393552982"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 13:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936297172"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="936297172"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 13:49:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Twr-0007PU-0O;
	Tue, 07 Nov 2023 21:49:25 +0000
Date: Wed, 8 Nov 2023 05:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest-wip 12/13] drivers/virt/coco/tsm.c:354:5:
 warning: no previous prototype for 'str_to_guid'
Message-ID: <202311080459.emxRiury-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest-wip
head:   4ed58356a95af36f4112fa8808ca91bdd81e65d0
commit: 18b377cbf77f6478c4e3065eaad12d540011a242 [12/13] config-tsm: Add interface to configure remote server GUID
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311080459.emxRiury-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080459.emxRiury-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080459.emxRiury-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tsm.c:354:5: warning: no previous prototype for 'str_to_guid' [-Wmissing-prototypes]
     354 | int str_to_guid(const char *buf, u8 *guid, size_t len)
         |     ^~~~~~~~~~~


vim +/str_to_guid +354 drivers/virt/coco/tsm.c

   353	
 > 354	int str_to_guid(const char *buf, u8 *guid, size_t len)
   355	{
   356		const char *p = buf;
   357		int i;
   358	
   359		for (i = 0; i < UUID_SIZE; i++) {
   360			if (p + 2 > buf + len)
   361				return -EINVAL;
   362	
   363			if (!isxdigit(p[0]) || !isxdigit(p[1]))
   364				return -EINVAL;
   365	
   366			guid[i] = (hex_to_bin(p[0]) << 4) | hex_to_bin(p[1]);
   367			p += 2;
   368	
   369			if (*p == '-' || *p == ':')
   370				p++;
   371		}
   372	
   373		return 0;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
