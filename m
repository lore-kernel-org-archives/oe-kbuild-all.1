Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131B168DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692292356; x=1723828356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lW4Gs99clp24g1be/o8KoTm4TvBfDD4QsWs4eUiesuQ=;
  b=BWVdGfy0RxtoExjM72SZCPgULsQdNDa2aWTCR611lHolrFHgHew+cPUc
   YAUsLsOksRgbAYVFZkgOfMYOuLOUpSe7q9VUZyHhVD5Bu2L1o59mGxeIO
   GJ8D7BPXwfT+DAqONBEfXuvdYOt3MymRboyuyXZaziOZAkPnGpjT3p8b9
   reNGysJORrmQTYD7gsQ4K8bCO0epawDaGDnwv97Dmk4lf+WQw9Bm3UvNs
   7BKvrnE9Mljx3QQrRELerpWazFIUNmMqfvDZZQCbthHAy76n4dfr4dUAf
   pkorwdjGNdh5igJ8vXEiK9D/xd1zmUCYlAqV16bFwKDhGMWNp06n55xRS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370342239"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370342239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 10:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="848945531"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="848945531"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 10:12:32 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWgXw-0001L9-05;
	Thu, 17 Aug 2023 17:12:32 +0000
Date: Fri, 18 Aug 2023 01:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: johannes@gnu-linux.rocks, jikos@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, benjamin.tissoires@redhat.com,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	andi.shyti@kernel.org, christophe.jaillet@wanadoo.fr,
	ak@it-klinger.de, Johannes Roith <johannes@gnu-linux.rocks>
Subject: Re: [PATCH v4] hid-mcp2200: added driver for GPIOs of MCP2200
Message-ID: <202308180056.nB1KSUap-lkp@intel.com>
References: <20230817091505.213318-1-johannes@gnu-linux.rocks>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817091505.213318-1-johannes@gnu-linux.rocks>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/johannes-gnu-linux-rocks/hid-mcp2200-added-driver-for-GPIOs-of-MCP2200/20230817-172246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230817091505.213318-1-johannes%40gnu-linux.rocks
patch subject: [PATCH v4] hid-mcp2200: added driver for GPIOs of MCP2200
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308180056.nB1KSUap-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180056.nB1KSUap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180056.nB1KSUap-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-mcp2200.c: In function 'mcp2200_remove':
>> drivers/hid/hid-mcp2200.c:395:25: warning: variable 'mcp' set but not used [-Wunused-but-set-variable]
     395 |         struct mcp2200 *mcp;
         |                         ^~~


vim +/mcp +395 drivers/hid/hid-mcp2200.c

   392	
   393	static void mcp2200_remove(struct hid_device *hdev)
   394	{
 > 395		struct mcp2200 *mcp;
   396	
   397		mcp = hid_get_drvdata(hdev);
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
