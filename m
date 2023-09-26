Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607F3D392
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695752220; x=1727288220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IR7w6Do+Vj1BSw8u2v+FIrbITe2rQlTJGNaAYZx6xT8=;
  b=nDCTSABFhy9s1kSGgRCev0Ied6DVr/7Puky0/LkysaAuowBTEqvF1Me1
   8bf00VS0+c0cOXX/taZ8yK9hFjnc3+srmT7uqsPNB/0kY8LWxukghykmc
   tNdYisazbOntTjaZYKgnv2Lfq//PDt9betm1NwubL5I+0HXtIPtyoETrE
   1ECmUvcwEAbGNfoumVnce1KDSQZf1gnY5KKc02SsNPTb3FM0RI0fPWwFA
   JnCIeygLkuJKMplngFCGBJTRe+02+IwzgvZcssf/jAUwePTD2Cv5u+ENe
   7iTQcSmm7WlBBTKpGxzBuC4opOLuQZ+eWtNd4vdASCkMX5pTlt5v5uaXG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361013386"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361013386"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839105314"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="839105314"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2023 11:16:56 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlCc9-0003Du-34;
	Tue, 26 Sep 2023 18:16:53 +0000
Date: Wed, 27 Sep 2023 02:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com
Subject: Re: [PATCH v2] cxl: Add committed sysfs attribute to CXL decoder
Message-ID: <202309270116.IH2UP8s4-lkp@intel.com>
References: <169574219129.3884437.11954592650115343944.stgit@djiang5-mobl3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169574219129.3884437.11954592650115343944.stgit@djiang5-mobl3>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on cxl/next cxl/pending v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Add-committed-sysfs-attribute-to-CXL-decoder/20230926-233134
base:   linus/master
patch link:    https://lore.kernel.org/r/169574219129.3884437.11954592650115343944.stgit%40djiang5-mobl3
patch subject: [PATCH v2] cxl: Add committed sysfs attribute to CXL decoder
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309270116.IH2UP8s4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270116.IH2UP8s4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270116.IH2UP8s4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/port.c: In function 'committed_show':
>> drivers/cxl/core/port.c:286:34: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
     286 |         return sysfs_emit(buf, "%d\n",
         |                                 ~^
         |                                  |
         |                                  int
         |                                 %ld


vim +286 drivers/cxl/core/port.c

   280	
   281	static ssize_t committed_show(struct device *dev,
   282				      struct device_attribute *attr, char *buf)
   283	{
   284		struct cxl_decoder *cxld = to_cxl_decoder(dev);
   285	
 > 286		return sysfs_emit(buf, "%d\n",
   287				  FIELD_GET(CXL_DECODER_F_ENABLE, cxld->flags));
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
