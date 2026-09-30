Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A954E06D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777164; cv=fail; b=Nfe0O/qnPbj7yZQuQCPEqRPD1aUYxj3SPvNLElyYD+li0iwNsilV0WA07MzaSSvDZ8iJEmfrh1dNsvElTzcUgCTFwh5akkLgRRtv7+h5v1LSbwySlF1HqjazyWkRO82GrfjDFcx5OYTKAY4nBSwJTldsfcYqx4lOIm3orjeH9lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777164; c=relaxed/simple;
	bh=Wn1bWcm1FuVh0kW5uw8w1ejuUgipTFT8PC+BhXd+9uQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nW6y9xzk4kBJxEw9NSZW5yjFOV2+pAk50r8pMR8bn0CJyyV/uBbf0UAEMsMy9H+jFLtXXZhNr2lO0B9MKAAvYv/Ll1AFAeRf1bVRkjuwrbBN4WRA0ppr417e83Vl8ljJ3/cqTqkbkY5oPvf4qBu8jB3q+1EyHjRnc//dW49BuCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMjqlYFE; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMjqlYFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777153; x=1822313153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wn1bWcm1FuVh0kW5uw8w1ejuUgipTFT8PC+BhXd+9uQ=;
  b=HMjqlYFESfrmvnO2xApRmvM7D5QtDB6esLS0akX7B7rVsdyaNHoIkdwm
   eBNZ0Yoiz8uI8jLSp4wTJSaOC4s0U0Jhyf3ML+ku7UioPLpMWaQV3NEIw
   tFIBrCSQfMMK23qetqHI5+o8QfBDJucNlHUOI8r0DNoP6VZyZ/qYeA2VT
   06VYnrm0bseIll9NuwBX2FM5r5taqKpppPxw9ePfx4ZmZLKXMDLgO+7Wm
   fLbp1HXaW+cG41k4E8jY50wln0IkUDhT1X+zt9DvGHFq2QsQ8zZxcN/of
   FTgVhtmK06t8tpVLDvO2nqyiDjMaZR6ACwZ6BNEByv62fCOCB/Skr6wJL
   w==;
X-CSE-ConnectionGUID: AgK7O37HTamTf3ds8eF6Zw==
X-CSE-MsgGUID: 4/KvcKPATa2b4ysmu06s2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90374507"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90374507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:05:49 -0700
X-CSE-ConnectionGUID: fj63IVxsRfufGTlTWxIe0A==
X-CSE-MsgGUID: gI5HFyZDT166bqxXFAWFow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="301970456"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:05:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 07:05:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 07:05:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 07:05:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCQzkBZ1Ssw+Hep8zgyM7SQLfp8dMCIfDXHPT3DMjCiycZHuS/P/2s2+3mtV8ILPn119cat0eJw4WLzN9EBJnVeH9biMiicrkgNdolbky48/OxQ5HLTyUweWYQDs04HOS4P7bWSIfhbehRZojpmgdGrFGpa4uIFCs7mGnKz/dr3J69YXD3vT4R62yOz2/ByhKWVyUVREQMowurL2TIUMGRA3ILIrdVLjbMdyswoiGwrQntJl3u7vLs/5ieBHa79grY9459fy/rUOQIj/XomOlvVhyNoJ47DXJ08eq4gO/ovn6vSrIJaun8a66kgu6W0MnxVRV64Vm8EcnwXgCZ0s8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp6fpVuKTNatcjaXsMOl4TivBYhqjRLb3ZESXQ6cGiU=;
 b=devVATMOiKKYqFALQ7SJjK1iC83yTSD467xNUrb2HuBtWv0h8zswJkEuUgBPzV0toDjnXGTOCnipLOmyvEWIkg78HGrQ1srynG+Yeiq32J9I9wznq8KGZBhVHpFD/8ENyFUUnbw6lpPzEDJUAV+hIwS7ZsnGytyWV04IWSFO9KMPGPxr1hMlDWEGMzVMc5UFMHBzfNofWuFYGGgsfzw2XHkzXHhpCjCd5I4VPdUvrbkfsgC9uPc70sbitSKpmR73AttJn1zSzpxL6i15QGNo1CynxU+ckRquBdePLklQGmfgWsSx2q5j3CKT2nMJI3Tq4l4RM8DgINoTxhvtFmQ3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:05:44 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 14:05:42 +0000
Date: Wed, 30 Sep 2026 22:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [anolis-intel-cloud:devel-6.6 98/98]
 ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <ar0XLyyu+sAzGNM8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::13) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e270c4-eaec-4c15-c8c2-08df1efbea2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: MTpcxjeqrJPU62IcmbJDDgx0Bg0vC67hdb7Y/36jgjBkyGCIAFffAfElluyTYQFMNiXCcgQuc4eOcDV2kKOBFJ1jJvNL7HVziC+7iIU9NrhFwcaLJ0ZUS1WFT1i4nJCwBdnl7OTSOcCGkV2NkcWgHKj+7BYKlqeDM+h8Xo3loLRzpqIlobP1kViAT/Mil4eKZP7JGyvYgygXxGxXwy+tg/zhLnvyShwZ2tYAsUv01nPeoWYgkUBUW6dJo+AMs/PgGhV2GoowEEX3B1EyLs+QFwaQL5zJya8oPoyT87x+CXOwbLD0+W8WFrTVyq+DkpVe1eswYb6PCtgSAB2yJOjWmXSBt+7bU24ThtzXLkwXsm3FHlgUkh2ch+ccgmoDuo0Ehg/C48gK70Qeotl+RWflOCv5Mba3upDE/OoD9CqVeW1/WGHrLjMtyXajOw95JI/IIOsNgII0hQNqfm1HdGDYzy78139Epf7e0rpcHYp9gOOx6EZfdhbmXNXBtrt0CxgZFkLlS2SXGEy+ZNs1uyEXAOm8ENa3BCzDWHtkK0gFcBRrw8rSiBN5/zuKaC9ktDB5SOgw8PFT4fdn/uv8HS4KxNzIfBnBsYTKiaMu5F6Mxz0C7bXvy1LQEfcIe7SuNoBj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYBdFj3K4virtJq0o08ZzH8kOzC+IcDo7wqKgO4195nefAcqZnuGRjNSY2DC?=
 =?us-ascii?Q?jk9KPR5NKe7NejgffA1eD7+fHpaf6aQORMUCmE1pLk565F43jL5GjG24oXDq?=
 =?us-ascii?Q?kc9rZCXXudTw5y1RHY20t5o5hgd+s5briGu+6/FbArcSA6SjORugTeEcjt5P?=
 =?us-ascii?Q?X/PBAUeTnbmuvR1kDWLp2baCFohC3SFvaHVaK39zTQm8o94KILyvXII6t3Pb?=
 =?us-ascii?Q?2E5CJXubocOLLtqG6xkXB0IQpNgeUmX87eFtoy+wEzW4wu9ZygIzQOsSk7LI?=
 =?us-ascii?Q?jULkJKr3HcKWDoUfIkiTHm1EcldPUUcovfwLrmmlAQRIaexyP2RhVhkd0iWj?=
 =?us-ascii?Q?MQ7MMlNjjDa+GCHzzzYFasGzjluDiDGnCaA3VmFIBpZLLevE94EfPLwvRCAa?=
 =?us-ascii?Q?CKS3MmMcUFF9mWdKEkaloL/NFnTmMndGWv1StoYIMQesL3qifK/IiyayMIbO?=
 =?us-ascii?Q?xx+tlPjIz0wwdWIeeT/XxPHKnj7CftlqU8PyS8h1qCMKSLy4HjcA+0HPw4wo?=
 =?us-ascii?Q?gb/ZGWPKmzFAJaXtUPlOjvNboQLITrOXDs4L/dwPeMMAHXhDBMWL2pVOsFqx?=
 =?us-ascii?Q?cGfUmAt4Ofu3WoRmmkp1SCO6lUYIveUmDHbbvGFQTRBfUALS88tCPxtB/pns?=
 =?us-ascii?Q?GwmtN7wIk55D02UW1KcRAeDkKrGPwNX1YkepF0C0FcEcabKQS6rWqMJej7zC?=
 =?us-ascii?Q?jCR2fd5ee0OvsPZ5hqDt+PK691+Cy93VGH5ydXnGCwj8Uv58a4U7b2pQtgQI?=
 =?us-ascii?Q?xAG3kgBk31EBzO3d4Evp0SI8ZXT4ZUAno/QBs2U/c4fm8lPAgRArGWNr3d03?=
 =?us-ascii?Q?FKQTYvFDVvE2Vzr3ENLDiYg/anJpet5v6BTRatgMXHko/D/V1tQ5FJ7lyFtm?=
 =?us-ascii?Q?44ssO8HF5oPaclmYbz5/+KyizqZMfYERQJMj/ZVCv15SIhWlc7ey5h9cxTUa?=
 =?us-ascii?Q?Ej4DAXEz1/bimYt88Fskj9DBxiNbc4QGNILH32nWMZoH9s+yF2U9SIUT7hha?=
 =?us-ascii?Q?zimJ5PBlEoJkEK8gStqt4wJ4WxPJ4IPWa8lwyRARuhBDow4dN8pZw5gmQLqL?=
 =?us-ascii?Q?ANMZK2RyfWp2QeCQTwSrHIO4zySElD/rYQdlNn2hlU7Y7YrzTXty3NxQxD3r?=
 =?us-ascii?Q?rKlYNUc6Fh1AyB1hOcJGOCzeK8m5wRB/QWysireM89oKPoEBHeLxUZycA7jO?=
 =?us-ascii?Q?doBOV/oFJjzkLCJWEeF1SA940sps9JInkV9ha10Wia786HUKBi8IeG5dLZfl?=
 =?us-ascii?Q?/OeyLTCWvWzR9desvDjo+UkAwTMfsTEGfMmgzUFbdFfUXUdd8DRR9CCjaDm8?=
 =?us-ascii?Q?4BiNyshpFKKMTqxY7XLb99WBQGghAPYxAoPW9AeHBLubI8W9syUVvtzOhlNx?=
 =?us-ascii?Q?5E2sHeO914Vc3OMmFSq9lyRBFCkwmLM+v4znAiOkDBY6DWk0FRoQheNsnYqp?=
 =?us-ascii?Q?+x+2mSqTC51oIyBZ5dhplaPo7CjMyY1oaJSgv+teGbpp3PPEmeE6hRFe/xtg?=
 =?us-ascii?Q?8BZ1oqVXOyIlFxjuBXiqJSke7hyOFfs5AcGRtVCd50l6yda5rTclh1pF3S0o?=
 =?us-ascii?Q?onUa0KByohdKNtViL5akrd5TsoXD14s3tOVWv1sr0/Acyw16CfbNXSFr1FM8?=
 =?us-ascii?Q?sLNM3A9fpK6ZLUtzw1S8837K/c5EbWPSz1uRMRvyEVRtlGYJEQHSJZ8MlkAy?=
 =?us-ascii?Q?FnfkVEzxhWML9QRV4NcYaqB9hItocmoS2Q+DFFj1f3qrjaW1xSKv8+bCb65V?=
 =?us-ascii?Q?OTfsvcnAgA=3D=3D?=
X-Exchange-RoutingPolicyChecked: A67DgmmZlF86T3E3Kq1pKkEH0gMkNd7yJ1eLLt3vI3qmLm+GuJTUk94zvFsusWIsdPpL0T9je1Dk0rMz8E1Ive2FTesQ6/joSvTF+SvbMFgarBu911SpvOul8YUGVzKNlXL0oEKYgxwKMYVdTMekf1OC856iGB1HRvS7tcFO3SJB7Q//p1w97JF/UDgiYhkBrqshJ2Py8TnfPZ8E5Kt4ZwCgRnC7Kjat4ETOoEZwxpB1QuhWTJacVy2uMnWAmQ5XvD5k0JteTT9ilXvEmD7Qic182DyfMOVZKyTm/FncvW6S8EC4tfU4kf/95WR02DkoZIZANxgxc9/RkDx3Adl7aQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e270c4-eaec-4c15-c8c2-08df1efbea2c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:05:42.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjzEzKOr82HKu8G/87UKPvVdL88dYpFeSPRQs91AMhI5pFXB5085maTwumkEgOSj9r9WODE9bqZlxSsIzpuzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   02e32237447fad73b1113af3e12dddaf2b08b5f6
commit: 51aee14260ab017517da536fbc531488b8e67975 [98/98] iommu/ummu-core: introduce iommu sva permission operation
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609301517.uGvbfJft-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301517.uGvbfJft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301517.uGvbfJft-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:103:
>> ./include/linux/iommu.h:1918:40: warning: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2.h:35,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_acl.c:25:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:23:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error: 'sxe2_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1533 | static int __maybe_unused sxe2_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1534:27: error: 'sxe2_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1534 | static int __maybe_unused sxe2_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/net/ethernet/linkdata/sxe2vf/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:24:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1864:27: error: 'sxe2vf_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1864 | static int __maybe_unused sxe2vf_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1865:27: error: 'sxe2vf_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1865 | static int __maybe_unused sxe2vf_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1918 ./include/linux/iommu.h

51aee14260ab01 Lei Gong 2025-08-21  1910  
51aee14260ab01 Lei Gong 2025-08-21  1911  static inline int iommu_sva_ungrant(struct iommu_sva *sva, void *va,
51aee14260ab01 Lei Gong 2025-08-21  1912  				    size_t size, void *cookie)
51aee14260ab01 Lei Gong 2025-08-21  1913  {
51aee14260ab01 Lei Gong 2025-08-21  1914  	return -EOPNOTSUPP;
51aee14260ab01 Lei Gong 2025-08-21  1915  }
51aee14260ab01 Lei Gong 2025-08-21  1916  static inline void iommu_plb_sync_all(struct iommu_domain *domain) {}
51aee14260ab01 Lei Gong 2025-08-21  1917  static inline void iommu_plb_sync(struct iommu_domain *domain,
51aee14260ab01 Lei Gong 2025-08-21 @1918  				struct iommu_plb_gather *plb_gather) {}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

