Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4F3DBA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706680779; cv=fail; b=tbbBF7jjFeN5nUeLPNtOPoleeLhEbf6LSguBKFUrSIjapTt8JoWvAFcCrGPp62/wAv0OrkRYZaubMEhIt4GAb3Wd3O2hHOyh4/cQGsslSY+20+Hq+0xRIOrZDhzYiGOz7dJOsCVJQn1939iZ5e48WZZSVKFd9BRKBVUfkRCqs9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706680779; c=relaxed/simple;
	bh=dZkzDC5cYFbY7C923DZ417jdzICvFesDMT9WmUm1vjg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Dfe3TDo82JKCuCqFGHzSuQ2c6oFN5cXxBuOOHav8rWyHlY1AafqbCp4SPKsmA0b3cXuxBQclWlq9/MkYrnLWLAieDauwk6jHId8iX7EkTA7ppPqVyp53U5SmhKrN1e30kZFjdRG09draOMaqjtdsus7VIVK7lzsCWr29eVBZARo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbDvztmp; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbDvztmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706680777; x=1738216777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZkzDC5cYFbY7C923DZ417jdzICvFesDMT9WmUm1vjg=;
  b=JbDvztmprGm+Y17n4nk3SLdnXO4bb9WiSd1SKSeJmKOtMItn2mCLne6R
   lrdB+9gWXbeSwj4M0+l0xRTKDrvgM2LOKVQ/K0edpx4DqClkaf4yQTOsr
   R2QG2yI/NDTIxzV4s3UnGsvdQp796Mcn2U6Pwca1Zy5Z3KAgbmAy2HnFZ
   ygP6Mpj5Wdqlci992X8FNRFYsA7EogRrIOtEVIAzA5oLFRpst1IbMCkXM
   LNqzgDE1lbRVPywc1BfGKeNVeXJxlMgC+JOL6dsrDjc3XTPDgmGBlppPo
   cjwj1e6nnQ+5HrIILauSqqttS/RyqNQhyy4LsF0D+SgnE6kvoWh+gSJmc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3341158"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="gz'50?scan'50,208,50";a="3341158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 21:59:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="gz'50?scan'50,208,50";a="36754653"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 21:59:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:59:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:59:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 21:59:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 21:59:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgL7NRSrP8wZm0W/jEGKIM79uKFp9tFt1LnN/SMwLocoF+SLRKe13KFg2PpBERuMrVZSi1QGwoxz7U50HPVt3/YxZwVeaBfFX51fKSlaj2wVgpH1Sm0AqV7JZZo7JCGtlC60bWYCy9bQsKvx/+ZGnsyUzP5i3UCLfbQwnnTD7NE1pYam8Zj7w6AHAJQRIuUc//frytkS2sDQD7sbLypWTS0S9zcawD+KXi2E8pJ67Jf0gqF/ba5DDkyUD0c50lIxB4QOHw+e712osOxF0s24a6vZmV8PBcOmeh80aclLaI77UUy1LEIjG/yzRmyD/6sfflHjyOfr/0hLOm3jecRy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMKj5ePeVgDp9Utc5TqL6HOIkcwV6eo4UPXeiRlstMA=;
 b=lqwP3muhfg+FATNzNCTr4yuNjyEu+jcHjtKEcJ4O4CuDobT2Woy0oZCyZ+AcudznBPknz1fYAcK8PYUXNFS93djesK1lXkKU29kx2HnKgHie6ewHVAkyeV2jJuigPBN3wo6sVE616lw8wfjjzD6zZNCZukURMILQgTDYz9X5/V9nGrK3PIA5FgdEbWrVFmf0/JXHJgW7w0ZK/osNhq32z27HP1JmoYJ5KNNB7NWD11Z5z+fV/A0KbY/m/RPf9VBWGld/bWUKR3zkZ3N8UdkAf63thTmeacxKI6gKoJsT1whT3hmGeNky0QvkRufgSRkyXQPbLX8CgBfDhz3KKvW1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Wed, 31 Jan
 2024 05:59:30 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 05:59:30 +0000
Date: Wed, 31 Jan 2024 13:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Zheng Zengkai <zhengzengkai@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-5.10 1515/30000] htmldocs: Warning:
 crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist:
 Documentation/security/keys-crypto.txt
Message-ID: <Zbnhu37/VUfFZP3y@rli9-mobl>
Content-Type: multipart/mixed; boundary="2i7kVem2cvEIUsbY"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9165b489-c5f9-4dd0-82df-08dc2221ca4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 43f7INwY/alRdoigVH1dbiok+1G+4cs0V8av90VzAjG04tUuFC5r/8a+xSA9ZalsXuiYbBSF5tgciaMTFX/44+kQrqk31hIKK5XRNI18OdK0d1lwf+V7ltMc9DZzXxGHgaIFryZ4Kx9o90d9jYtuol1vobBl1dBkfxtx8tyYuP1jo6twPUZTn32YiLXaQmOihqSzl+PtZyThOrUMY8oW6D4FyqZW3sPGsqOwgJEn4e5PojmPLZu7CCcJY6Lo+MM+RVRLuht8/f90PlCwBzPrWdT6O8hzxpLkVgQMrbUIh/92RXtXOf8MZxYHl9JurQLIGcuIAo4wnNZ/Rmi4BQGdt9SZkTjbAzaSLMPXhvZeeWDQaNM5yDxS7EcknNSuZnjACgqDOqEDo4XqMzkwqa3HzQ22md6OwNC9KT85H50oaKQT6a43OsGPUl9BJnweH3Nok3kkuwlNcq/VJxazAzdy/V9Y78KQzFoZ9iUzEf95UY1AnkR4D3sJpNYqeBGr7+/+qEfKfCFC62yPM3/VqF2KXqFwGDjFfHisrKbfoPgkEKAZEJ/KLIXtWmRH8eHSInZaXsBtq5JkcXSYgm0+IeX3rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(376002)(366004)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(83380400001)(86362001)(82960400001)(26005)(38100700002)(33716001)(9686003)(6512007)(966005)(6486002)(6506007)(2906002)(478600001)(6916009)(316002)(6666004)(44144004)(66946007)(66556008)(66476007)(8676002)(4326008)(8936002)(15650500001)(235185007)(5660300002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUvEADTN3R8z/WZxgbYOhNzf3LGDcL6U0DYeWHF82hmx2mkAE/QMrE7bk7ms?=
 =?us-ascii?Q?cr1tbM7M6XxEjVurd6MrJ4YQnPvzSSSYUc4EkG/LFTWPZZgxkptjynddQt5z?=
 =?us-ascii?Q?wp4+uSrUum4q7YSlk6mOEiVjAv5cu+S+jPHRCOYxRzNcv0v6IWQeHdlLayID?=
 =?us-ascii?Q?e/xPZVDRrY8CIkCIzemI7PXXg2kXbAizsA5PupOs/KrcrePX/f8ZYuWF8LoU?=
 =?us-ascii?Q?qUnfRGLAMCZX8hAMt4RNupbbZJBpqTkKQ1o2YzF2wvkhNeJGlz9N7+BeOCb8?=
 =?us-ascii?Q?M6/Q8VocM+0dL5Ic+IGx5XHDiCrjNRsSoZX0pWbf6IrOisSuR9yhIJINzO68?=
 =?us-ascii?Q?Y5nyfZ/SgVCd/3C6XJYCRvLj5e75fHeSFA+fNBSf1X/gcTvY55wqvZCAEepZ?=
 =?us-ascii?Q?JO9Yy+OrC+HhSigTjf8FGbGaoGq7dpEt/vXkJZJFijSWAtYxWXsUwCvkfC47?=
 =?us-ascii?Q?qTgxucACzU7l0RGd7FlncmOoyQ/Vdzb9Y8UzjFNaBu6hafeaDrwanhsLSGRb?=
 =?us-ascii?Q?e4SrV9kNjb+mFDp1KF+qPAiY5KWbWvYO3Yzo/g//Lx2UJAy9fvfa2ir9ZY/n?=
 =?us-ascii?Q?XWv/qJfNDse2QYhDEirt8wIx3gtgVwZVWKlt1mH9ssuSiN3BLDMSW2l8Mn/g?=
 =?us-ascii?Q?xhmXvGhvGrhau/9HiVNwgJZ+dvQJFAD82BqZ+ey7VW61LEDTLZTMMt3Y324h?=
 =?us-ascii?Q?Om68TF4tquQK/j9Rh4rHnnj28VZQgrpPdZHN9iwxUFhaW4L8DcE7lRazD59w?=
 =?us-ascii?Q?GCQCoSVt+85R74+Pz4O4NvCAT05IIhfZ8VhshVuEIFUggqbBqtNIj1fN+mAw?=
 =?us-ascii?Q?6iK0+SppuYY/+P9fZETsFH3hn9KAQovcTnWFqn0+baPnR+nAR5+1ifK6ud/8?=
 =?us-ascii?Q?gga8IGA2tKGqjzkjfwzKhrLFSwiQPGp+XWcr0IH5RhNQ6XsjyAHx211W6GSM?=
 =?us-ascii?Q?Hm5IoXQwIw6t1eFxJ5OwedhaHYHeMpeKMF+ulUwHbqZyEDMGAXq0fyDQJMdB?=
 =?us-ascii?Q?kiPdHXE0xKFSaN3pPNOGvkWgbezEBzv3eWgfC3x6rKpHc+IS5gOU2dnc85GM?=
 =?us-ascii?Q?1GpoKEQIF5Eu3PH+oqfZZqc4tzFthbivA7/1svb92gcE70B0CLF3MhP/NILs?=
 =?us-ascii?Q?1fg8+SK1ODUuqmpOryiaroaYH3RKbU7CqtcLz5dffcaqR0dVyaLFdo+qUtz1?=
 =?us-ascii?Q?Esna01MHM2in57wRg9KiiqD9pl3CqtwewzF/+S+tgpwUU0Lbp33LwLIwbQmB?=
 =?us-ascii?Q?By8lFDlrb3Wul2uib3hnB5Lcyq2XvzdEHnLdXOs618bGvMrtOAR8N6ErkLQm?=
 =?us-ascii?Q?JiOoNl1rdBgbig/5CuV9SyX64FQFUIK7RBpyqEkE+Sy9U0LJ1PhD0Wtji+fx?=
 =?us-ascii?Q?onPlN8CH7JfDqQJRhFQmPTn4N0VYu69N9Ao8LmkPwlN0z97/Sqk6wdAfwS9L?=
 =?us-ascii?Q?JrUiypfZBtElvZeVHbcmq1xlEk46ULQ/uHGh7c1DsyCdb8ZSAV+5UfPBCkZh?=
 =?us-ascii?Q?55BkWSKOaHu5nI3uIIKTs7jfrBZMJw/etS/IkUShBezsAIPMs2RCCIwiAU3I?=
 =?us-ascii?Q?29eVsacRy1F9qfeM6uZdmrnZ1/TZ5SP5REy2IMI1U0sM1ZG8RzmeHaqCEQeG?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9165b489-c5f9-4dd0-82df-08dc2221ca4d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:59:30.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mkr9hRuQX7qLaqLZKfsgGjju26/+geIJcoakyH6Dt6zyweZ5WAe38HfoxNHSN4KqlFwe7BYvEr6G+s1oWCZSjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
X-OriginatorOrg: intel.com

--2i7kVem2cvEIUsbY
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7b3b2702f031a1a8368468aef621f12b23241185
commit: c283657144c1475e571f0c1f34477af1f682a12f [1515/30000] KEYS: Provide a function to load keys from a PGP keyring blob
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 10 months ago
reproduce: (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310757.wqsgZIwq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--2i7kVem2cvEIUsbY
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
xAn2/R+/l4t8B38AAA==

--2i7kVem2cvEIUsbY
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        git remote add openeuler https://gitee.com/openeuler/kernel.git
        git fetch --no-tags openeuler OLK-5.10
        git checkout c283657144c1475e571f0c1f34477af1f682a12f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        # install Sphinx 2.4.4
        make htmldocs

--2i7kVem2cvEIUsbY--
