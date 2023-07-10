Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35A12B73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689003922; x=1720539922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqI6DBcn9y4QkhWEjJ5qOI6pXtXnTv6XpNdf54rvWWE=;
  b=NJoTU4noX6OzqU6Yh8W1JUKH/WDBsndTYRXbPbbJ5+qORPl5TV/ntE49
   zxhO3IUcEkeCtD5RWm5YEGDR12il8YwYlj2GT1la0CsUWokawVbkupCoO
   nKDLyO3hEBdqnzyisgPZjYol848quK+lftaXDZn74cX/10ulO9hMZCgeA
   OlwljrHhJAKRch8IB9harYCNviT7tIVnih00tSU8ISKiEvueT+iGm4bDP
   9aJ4cPgDtimil0WJWcUD2/PfnMx1PnEkHdwaC2yye9aBKq1hgaPDScrNz
   em5VhB0dicSZyER8tAzvznJmMJDrN6rCYQfGQZWILPuXDrXnCGPa/XEaG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="364416584"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364416584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 08:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834314761"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="834314761"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2023 08:45:19 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIt4h-0003n2-0a;
	Mon, 10 Jul 2023 15:45:19 +0000
Date: Mon, 10 Jul 2023 23:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Fomichev <a.fomichev@yadro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ntb@googlegroups.com,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>
Subject: [jonmason-ntb:ntb-perf-latency 2/5]
 drivers/ntb/test/ntb_perf.c:1185:35: error: implicit declaration of function
 'get_random_int'; did you mean 'get_random_long'?
Message-ID: <202307102335.rdB7ccFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonmason/ntb ntb-perf-latency
head:   d7d7b0ad2f253736c7c9862df3f2cdabd0359385
commit: 40de9cf6319f5a01c50a8f0550ed658515776b72 [2/5] ntb_perf: extend with poll latency measurement
config: x86_64-randconfig-x013-20230710 (https://download.01.org/0day-ci/archive/20230710/202307102335.rdB7ccFY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307102335.rdB7ccFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307102335.rdB7ccFY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ntb/test/ntb_perf.c: In function 'perf_init_pl':
>> drivers/ntb/test/ntb_perf.c:1185:35: error: implicit declaration of function 'get_random_int'; did you mean 'get_random_long'? [-Werror=implicit-function-declaration]
    1185 |                         *bp = (u8)get_random_int();
         |                                   ^~~~~~~~~~~~~~
         |                                   get_random_long
   cc1: some warnings being treated as errors


vim +1185 drivers/ntb/test/ntb_perf.c

  1166	
  1167	static int perf_init_pl(struct perf_poll_lat_data *pldata)
  1168	{
  1169		struct perf_ctx *perf = pldata->perf;
  1170		struct perf_peer *peer = perf->test_peer;
  1171		u8 *bp;
  1172	
  1173		pldata->src = kmalloc_node(peer->outbuf_size, GFP_KERNEL,
  1174					 dev_to_node(&perf->ntb->dev));
  1175		if (!pldata->src)
  1176			return -ENOMEM;
  1177	
  1178		/*
  1179		 * Prepare random data to send, guaranteed exclusion of 0x00 (unreceived)
  1180		 * and 0xFF (stop_word)
  1181		 */
  1182		get_random_bytes(pldata->src, peer->outbuf_size);
  1183		for (bp = pldata->src; bp < (u8 *) pldata->src + peer->outbuf_size; bp++)
  1184			while (*bp == 0 || *bp == stop_word)
> 1185				*bp = (u8)get_random_int();
  1186	
  1187		memset(peer->inbuf, 0, peer->inbuf_size);
  1188	
  1189		return 0;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
