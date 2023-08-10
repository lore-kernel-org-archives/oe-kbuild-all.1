Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105F1ED26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691665996; x=1723201996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHRjWGw/h1XRLhXpBfu0nO0AU5mQAK92UaEBGQ+yeXc=;
  b=jsJTeBiyNNlqiOZ+6Mk1jdCsyWv+CZFsgbBSR0l9J54hP1S5vW3n6X+d
   jVSaUyDc+iTTZQOEvC6DCbIcJwNCAmw1EAmI1nHpL4oBZZS2MzryiZDLG
   BvN8XkcjCFN9Xbnm2qL/PQkS0xfP88YodQl92oX1nKdMqXzXdbXf2gZNL
   xkz1/wek9g283VcSGkRSGBFdkx3QP2CUUMDThu2IpShbloi0+a3dr91B+
   Wuw7KZusdwfwa0d+e/FReIIwNonLzb+CWEgz9u/hqZOIaJjrbqquxk8do
   mmSRwEWs54hGEJNkyF0K9yMFkLodDCxD/6aegabwpKV6sAvcnOtfpu5bi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370268424"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="370268424"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 04:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="725753186"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="725753186"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 04:13:09 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU3bI-0006xs-0Y;
	Thu, 10 Aug 2023 11:13:08 +0000
Date: Thu, 10 Aug 2023 19:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [tip:x86/bugs 2/4] drivers/base/cpu.c:512:9: warning: no previous
 prototype for 'cpu_show_not_affected'
Message-ID: <202308101956.oRj1ls7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Borislav,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
head:   cbe8ded48b939b9d55d2c5589ab56caa7b530709
commit: 0fddfe338210aa018137c03030c581f5ea4be282 [2/4] driver core: cpu: Unify redundant silly stubs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101956.oRj1ls7s-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101956.oRj1ls7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101956.oRj1ls7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/cpu.c:512:9: warning: no previous prototype for 'cpu_show_not_affected' [-Wmissing-prototypes]
     512 | ssize_t cpu_show_not_affected(struct device *dev,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/base/cpu.c:537:16: warning: no previous prototype for 'cpu_show_gds' [-Wmissing-prototypes]
     537 | ssize_t __weak cpu_show_gds(struct device *dev,
         |                ^~~~~~~~~~~~


vim +/cpu_show_not_affected +512 drivers/base/cpu.c

   510	
   511	#ifdef CONFIG_GENERIC_CPU_VULNERABILITIES
 > 512	ssize_t cpu_show_not_affected(struct device *dev,
   513				      struct device_attribute *attr, char *buf)
   514	{
   515		return sysfs_emit(buf, "Not affected\n");
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
