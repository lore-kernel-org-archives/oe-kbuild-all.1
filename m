Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFBB171D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 23:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695425775; x=1726961775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3B4BDXrFZ0Ku5GpJE1Z88V+kxsL1ZgTAGsVIN5rM96g=;
  b=JI6TvYf4SGie7HTyXu28y9um8TQZd6bK++h9l/nivy6A0WRGSUNC2q9Y
   u45k9e7G61tkjYEBKwMltzqBShlXblpYPTO2K5x65CJDM1pMVIErAFgGK
   ROzqCtth9sVgVYcToihF6P/4AxvG2QKCM9beTWYxfqQyZXYclcBUqCYeq
   EkjXZH+gewaIBlGF5ckswXD+ODZizMHYnpuvQpmk7i/v7ycDbmZmXm81l
   ppl+fMQ0ZrJd5du1gJJtM3H2AUDzz3yeJnC12equaI9drZ2QPJsPZLQIg
   mPC9w+BjjiSS94RvzlzNYFuvbcEXlIsg4/NQYU8kll00k33TwcTEbISQF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="411898076"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="411898076"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 16:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="817977300"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="817977300"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 16:36:13 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjpgx-0001T7-2t;
	Fri, 22 Sep 2023 23:36:11 +0000
Date: Sat, 23 Sep 2023 07:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/7] lsm: Add audit_log_lsm_data() helper
Message-ID: <202309230721.A3rSI0GG-lkp@intel.com>
References: <20230921061641.273654-2-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921061641.273654-2-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ce9ecca0238b140b88f43859b211c9fdfd8e5b70]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/lsm-Add-audit_log_lsm_data-helper/20230922-052237
base:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
patch link:    https://lore.kernel.org/r/20230921061641.273654-2-mic%40digikod.net
patch subject: [RFC PATCH v1 1/7] lsm: Add audit_log_lsm_data() helper
config: loongarch-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20230923/202309230721.A3rSI0GG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230721.A3rSI0GG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230721.A3rSI0GG-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: security/lsm_audit.o: in function `.L59':
>> lsm_audit.c:(.text+0x4e8): undefined reference to `init_net'
>> loongarch64-linux-ld: lsm_audit.c:(.text+0x4ec): undefined reference to `init_net'
>> loongarch64-linux-ld: lsm_audit.c:(.text+0x4f8): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
