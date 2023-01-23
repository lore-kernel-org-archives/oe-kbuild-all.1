Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B48829
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 22:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674514061; x=1706050061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6k5NG/3off6AjSAmlH+OU2mOiel7tu3M7Ca5AAsM8Vg=;
  b=h5ZR98qwT57SUu+xEPpsuB36RyFcPVq0AiMOHpdCAexeR8UbNeUvEbiq
   tz0kLvO9uEnDpuERpdkJH8p9yHVSgoZn7gd79X72jLwKETFQKVfwow4iH
   Pm12pgIdaR/coq3Hlwflbi9sqCbDuAev7cRGuxnQ8csCAaIYxhV5EZANW
   vInfOWhWg0Ew7ZKJ+RCo3r/7xpEbhPCYgj4JeflWQQeu0bssgBtdNMaxj
   wIeSfsdi8S3a7GzgPg/qo3VGGiuHL+p+UVSn11YRxX0jJ9PRZMtBlDVCI
   f6lJCPH6YgBJXT+Vjjf3n+ijxLAbD5c00zBlrARm02Kqdi37/5wIpGtiY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305837501"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305837501"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 14:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611797895"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="611797895"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 14:47:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK5b3-0005w8-0K;
	Mon, 23 Jan 2023 22:47:25 +0000
Date: Tue, 24 Jan 2023 06:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2107/7257]
 drivers/platform/x86/acerhdf.c:344:2-3: Unneeded semicolon
Message-ID: <202301240635.sPQIDrxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   691781f561e9868a94c3ed7daf4adad7f8af5d16
commit: a1ebf2cd506baaf3e5ff04f79912dc4509f41fa9 [2107/7257] thermal/drivers/acerhdf: Use generic thermal_zone_get_trip() function
config: i386-randconfig-c001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240635.sPQIDrxN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/acerhdf.c:344:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
