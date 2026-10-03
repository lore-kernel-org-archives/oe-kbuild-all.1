Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB9F3921F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038534; cv=fail; b=ZCXGqoM0fBDkBEuwz/LTRAQ0YjNxjHGvFzYmgbKPJxlXcvqMKIElOPEZsDNqwIxg/Yi3fdf+UZCrcMWZkA8yQJ1dfqxcMOxUB9oplv4i6Wvz30Ef7yxXdgKGQWht8f5Cq0eymIyJyCQxn4kduXfCAFCCLSkfFXmPCv8RQX/ytCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038534; c=relaxed/simple;
	bh=JwqR3CXTZ9bBOivDePKyycp+D/c2fUab0jIBCvpx7W8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qsYsqz4WkfLSYWMFnLphC27NvCcMvX3XRD+2Fvnrb6IusNxm2YWNHwogKA9oQXtnGA2UIllfanze3u0jJ+TSl3dz8Oa6+GRdkNgDtN7j9FCHl8RKGhvMExZxYMNeIY7bdu9aOE9m+aAkJG1iy3whvEcjHszkHMloHbfkSvHtb8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io/9wfEm; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io/9wfEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038525; x=1822574525;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=JwqR3CXTZ9bBOivDePKyycp+D/c2fUab0jIBCvpx7W8=;
  b=io/9wfEmObMhLXANOA7oZiDXKJjRbn7INEeJqI4hSptcj5jSHAVEtSTj
   5dxN6pGlMUWquoHiYWgVMZOG5YctP7yKRb/yvamXYCRzwrydpCkVTDcYq
   ZJdlGNHmYjilFCa1ycrLKV08QeF8zF70vGxKzpplzJ2mnHgX8YdF3mr3W
   akJ+CnFbmQm2GUr3JEek3wPDhesmxDB8JGTafZLTDUwFDuQEPpJt5JsQT
   UucTB1YOOmGQefJ7/tSjXbXO0GOTWc2jaO6EOOlnwQAm5wO7NDffrJT/y
   0PHJLywinB9HifnJ22VlkPwvCrqW1U6rcriXZIxPwphdpF4g+hcYe1xhr
   A==;
X-CSE-ConnectionGUID: kbRy2FhtRYqji58XUHGV9w==
X-CSE-MsgGUID: jN5ensiwRc6r2ZPeNUpBvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79336647"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79336647"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:42:01 -0700
X-CSE-ConnectionGUID: QeuctNe2REWhzNzBzCKXIA==
X-CSE-MsgGUID: RSHNxuVTQU+5uCfnN0V+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275105002"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:42:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:42:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:42:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:42:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkaz3A//LOXvsvixCjju9zZlMKTqAmNbGdKi0mk1Lho+YbMMOdt5XsJ2tX65p1YDya90YZa6cGKvwcH82zVByWHGQ42M6qtflos1Zj+Kfl7kOQ57FQFHgzVuPMXOD3mssQwnsvx4KhiyUCn8lGjmH1yJ+KEgSVSpYYCBI5HSxCOZw1A1x+CHvLDuHYjPIs8BWj2Sm6KvX4gpJRofkSeQVvId/JxEMaE9dmu+aalcaPZUxgtEh6ENMc3uNwUiuLreCzEQGQKN78PIcZ9mr2sVNQsodOv56gnqI9p4+nloyhBxnmkj2+7eh9+XIMqxmG0nwCN4lTEkV1Q+uSkOKRBEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjYudgnBdrnP4h7rOvdBQVHVxZ5fX5WFvZDBq1uDxQw=;
 b=qxUdp4G8e7U0s3p87enkRr03bipwo5oKjVuRU+SgD+JhHvJx+1KAg7AgfzRMPYI5PUHMFYTKGjfTUA8Dt2+ZX3X7zANhPJQvwc97mgTl+7K5cIS4rMaF+pVYAjPS91s5BjWF0d067aDva7V3HqewD7dXX/foL0MVHSSBH8PCwcz8RyaZJbSKqHChg+JxljEFGL3su+PW8jNbi7IBGh6AR7AKOAcU+wxq9otKkkkpS4YFfvtlxAjid1oyciR+rbRbsQm/bEgFsmCKES1Iupp2kAm7ieAA3m3wuIHzvES53uHY7k9Spc++NAzvsRuAAyEbsg34g7r8DP8wxOfFzV6pPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:41:58 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:41:58 +0000
Date: Sat, 3 Oct 2026 22:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/net/dsa/rzn1_a5psw.c:212:41: warning: initialization
 discards 'const' qualifier from pointer target type
Message-ID: <asEUL3RywLRAqdQ2@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:510:323::16) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5204041e-62e5-4692-b065-08df215c7a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: fvL3YzoAqFfRNzGq/PshF8w1Lb76joPnQexrDZRJ8CrV5oiBvSJPg2+4zA3huD/VGotMfz+xH7Awuhdo+8OIEJmx3fLUvLgqSeLgBHaY6jieSOUYHCfZ73JOFZvwvzafsQji1aCMCXcEXpsbLvlqShPRfQjLCozgwIcY7WSFMaTdWJjnR1bVyOkAQQMrHx1gVmXjYkBSge+8BOhfqoApveRIi9W8EPxHyqyTCiVmiRy+9kVzlCZVxolSiHnI4jOOdkxEnrKHKQyqhDJrRCJurWjqnNwuRAbt0P6nRytqeZnPtFctTpqAc1ps1l06he6rJAopdb9I2ItMofbG/9CxvmiA+fPovEMWkrI6S/sq2ZweOenC81gDLGCqXknReiJW3W8hsC9NAdvCuqN7RSxSA/nvYgknj0yJZ+PItDtFe2pUuP2Xl3FTcWQkmcz0p+eS8jyPzXbCM/Bt2/vIGLDUfrvLONxNRChzrrAtJ9raOGMhj19NfFWXQEczftO9yBRMlGGsnmKAZIbT3S5I15MfVNC5ZIi8ziv5PbLxksP3p8yj4KXcVsUeL8j0h9fTQBdYOtQ7aULkGaH10lr95QLVZ8Lk5D8MiUUXj/CseKLr4768XlA5ZjLV4AW45VEDRQxa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j5rsOn92jKAo0BLVienUIxJooUoHeU3dw9M0cbdjqjXxhtAPdjzkLLfHIb?=
 =?iso-8859-1?Q?fT4jlrLkB+tXLP7NAAW5UqqdlSrrAClX6bYuWa8dorCnvErdd88AbKlEYp?=
 =?iso-8859-1?Q?Lc6GKl0BXU8XV2ubeH/FNlU3AoUm55SV2AGDzuuYJSNY9VptgMtJZu1O+M?=
 =?iso-8859-1?Q?nl7ulT9xutgDgeS9x3U+QLjYzP2BKaecNHza6zakj5DKCI+Wafvgg4tuGK?=
 =?iso-8859-1?Q?z7a1CjBWfPssp972IbRfQrGdW3E98e3692QbZcuhaelqt/IFs0SLWMdd0L?=
 =?iso-8859-1?Q?odQJ+oM5hZPDBXh+dyAQ/8B1BW3ZhrYuqdxWXCQcIrx3fBIFXAU2XBSwNS?=
 =?iso-8859-1?Q?Q8gM8DxulEQGCJK3RtwzAJvknH3BykKv45eYiVPgdTbcLs1icYufyJ0d8a?=
 =?iso-8859-1?Q?oTMPDdys6HX5WXnXSgLAoFclMlh2sLS1AHuWZK3Smlq5I0NMmRyCm+TKqI?=
 =?iso-8859-1?Q?qNq1EkHw1svJrES3TcD3L3uHs67U7JLXwv4/QKWWHOhMRWNVz8tjEho0gy?=
 =?iso-8859-1?Q?DEL5K+vlzZqqfsn0NgUOYUQA6gT3i1x9xXFYDcqvZkgiGbVDsQMq3yJiMX?=
 =?iso-8859-1?Q?Yn7w1R2oi9pcu8TvKinW+ZHM5xgEMVzQy0LyCCXey3yx2qbA41O2yPdfYC?=
 =?iso-8859-1?Q?RTW4MDBMPc4UdqVNMZtgRisaGfOf2NdP+W+gSXkqUWPjE4vK/7QK500Dxl?=
 =?iso-8859-1?Q?0fac3sb376hfkn1cvWdyV6HmRdaMDZej1JUXsQXxQ9uA3KPg3Ntb0NdTiI?=
 =?iso-8859-1?Q?h5YRjBOPRIVcfejwJq6Mwu4iMDk/oO29kD12QiThU2Wow6pgZ4Qi0ZnI41?=
 =?iso-8859-1?Q?bLqFW1JOF/QxUKFCzBnIecK/bhfPnnEQQ4oqRVrJa3VpdTkK4u7Ovyg/sg?=
 =?iso-8859-1?Q?UMIVW92lVOkRTxaleXkTeh29WY4e/+1nLPZyFGfV/mk92TmaAAghiRSHWq?=
 =?iso-8859-1?Q?NKHIMvMGKobQDWKeeRPMGfWmB8JD84CoAF1eMk7zhIi7AIro/KJ0XKL0wf?=
 =?iso-8859-1?Q?1o+LronNsrV+xWylYBLS249QoFQ8RUOQ1rzf8hYYnagdjylm3Hhdt1HC3g?=
 =?iso-8859-1?Q?e5WbHzly9bUeCkFKqWJ23tOcBD/7QdfVWqAzvt/XxFvydZ244fwHvdJY6e?=
 =?iso-8859-1?Q?Mda+nKmJ3VnQQEmMN70XpP493jGPrxN8T6dtb2S/nZG79fIJvrh3hvRNRB?=
 =?iso-8859-1?Q?x5iF/fyqmqrzaRjxiGzj2NiIODZ3zXjUumxbVdov6IQuHYscPvGXbc5HEX?=
 =?iso-8859-1?Q?Z37Yt+AgXiSYu7OFuYXdBKTDVuRfGh3rGxhAJ/Gtq6TRKdv3YunEjN7m9e?=
 =?iso-8859-1?Q?PQHEUciQ3gOwBGbbjMcWoJR0gSt+EohglU2IwU6/MIBICrQ4V4gZK/hvcZ?=
 =?iso-8859-1?Q?oLtLOjSW1+LgsMkY/OLBl2LhChmKojY3gUjnzk67WmJzDniaECYYgJ+mqb?=
 =?iso-8859-1?Q?ICUFwg0AnXjFtV+crfXiMC8LORe/rZwyFcq5BQ6LzySaBRemfC79DdwuKN?=
 =?iso-8859-1?Q?B0Cq2TcjnXFbq+Nh4kM/CN2yW8GFoYkVDbQNDOYNh/ZPRvWsFfi7gzS3bZ?=
 =?iso-8859-1?Q?vqWdcodeINqooO3lzD5cq9p+uherFWSXuor+zefWiFMinqdhkD7Auf+m6v?=
 =?iso-8859-1?Q?bqTPb/g7aQsj/+P6lenr9EXdAmf4oZB3dGBeAz028vc7bP/3rcRntrM0wd?=
 =?iso-8859-1?Q?1+3fwzyE/wX0qQbHZwIkWk4tjof8D7OBt1PrbIFSdEXQGP37NNVeUPGBWh?=
 =?iso-8859-1?Q?8rbYDssSyAlIrIgnJizXOOeYTb8eOflWFn6P3jI/4Jh76c5rCXsaVRCLN7?=
 =?iso-8859-1?Q?QqFvxCjU3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: F3Vi4/j/cMyHqOLAAIsb3QTKAebqf09en6NXqV0TWazWAB9/OKnxwATigzI8t6JRVix1Y8rJP4URK/o3S4PCVuy69IS9VBgqpT+BCynYtk83v5hmTAolCrwb1Q1Cqutx88SEwrRknyKJpcvy2e5eeg2ewU9+zQBOUQ8cssu776m2zNG8q27adYRKUJYSUjk+9jHbPN8tDREj/SHk5HorBEcqlHs2zYegwfSJs20g5vQOTBChnToFT/tPT20XuNTxHxoJ/TsUiP1V7OJYLbWjOfHjlEKTjjW7vHpGQFTCOridtrFwKNWdU17WvL+4wLQ5ij1PAIsyuWvd/Iw0PNf+YA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5204041e-62e5-4692-b065-08df215c7a91
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:41:58.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfNqXgXsKyupKbCauXAsTGBAk63ReH7JA0PFHQHW+IATAO7oAr/QMejCzWxcjm57SRmTh586svdfGboo3JMT8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

Hi Lad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/net-dsa-tag_rzn1_a5psw-Drop-redundant-ETH_P_DSA_A5PSW-definition/20261001-164314
head:   467636555a7aff5e3f2d57fbc61f81c19a28bef8
commit: e3604cddc3c79985021de1aea0e3f482ab64022a net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261002/202610021225.9Q1Nppoh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021225.9Q1Nppoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021225.9Q1Nppoh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/rzn1_a5psw.c: In function 'a5psw_port_change_mtu':
>> drivers/net/dsa/rzn1_a5psw.c:212:41: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     212 |         struct a5psw_of_data *of_data = a5psw->of_data;
         |                                         ^~~~~


vim +/const +212 drivers/net/dsa/rzn1_a5psw.c

888cdb892b61d7 Clément Léger 2022-06-24  208  
888cdb892b61d7 Clément Léger 2022-06-24  209  static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
888cdb892b61d7 Clément Léger 2022-06-24  210  {
888cdb892b61d7 Clément Léger 2022-06-24  211  	struct a5psw *a5psw = ds->priv;
e3604cddc3c799 Lad Prabhakar 2026-10-01 @212  	struct a5psw_of_data *of_data = a5psw->of_data;
e3604cddc3c799 Lad Prabhakar 2026-10-01  213  
e3604cddc3c799 Lad Prabhakar 2026-10-01  214  	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
e3604cddc3c799 Lad Prabhakar 2026-10-01  215  		return 0;
888cdb892b61d7 Clément Léger 2022-06-24  216  
888cdb892b61d7 Clément Léger 2022-06-24  217  	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
e3604cddc3c799 Lad Prabhakar 2026-10-01  218  
888cdb892b61d7 Clément Léger 2022-06-24  219  	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
888cdb892b61d7 Clément Léger 2022-06-24  220  
888cdb892b61d7 Clément Léger 2022-06-24  221  	return 0;
888cdb892b61d7 Clément Léger 2022-06-24  222  }
888cdb892b61d7 Clément Léger 2022-06-24  223  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

