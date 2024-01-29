Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF93C46B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 04:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706503389; cv=fail; b=HjuCPmCvBx2P9JvO/TDev7nkA/oufsj225leQh438XDGDU/qJD9yp2vIUnfpa7JNALg2qZ0+6F4Fu/nMViS0D7fbyeHpc93hixEg/0vQiJcgPt4/e8Il/HdX2/kZwkpDw3WbsUmeICVG2iz2VUozsJBsuY3hGcKpuZYsJRpVo+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706503389; c=relaxed/simple;
	bh=12J8xBZ7mubtYVXZSJmPslcUBquaueDS4txqsYia0gM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=T4WrJ1/JQESV9kVdhKVL8CuOsHY/DOctTUnIYwoUwUMwkp5urFLU3WzDBmOETJKf3Qw8vOu/E3IiRSANWKtV0a9A3x+tvupeH/doB067h9ClbRFnuOt/XMSfeQbaoydyVLlOCHFPn//ekOUnyIxtP/WSTIdIuqvvaN8Azt2ddh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzLCCyBg; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzLCCyBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706503387; x=1738039387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12J8xBZ7mubtYVXZSJmPslcUBquaueDS4txqsYia0gM=;
  b=JzLCCyBgCbW6rksshq6BdO5YvTG4B2Xz35W24vbr08eDfdirAWpI8/7l
   9NRxtshILo2oVmUNQTZCGsLWFyXKZpG6B4Lxj7iobBs6cyXaYCGpTd2Py
   e0rr10Aq9P7tioRqDyh89ThzbY5yXxiDCAn/bhox7soNZUbZY+BRYIQ8O
   vLzx5LEnOHWAnph3ZoAuIMKXlUzzV/yEaFz1mnkpJUnqV+fGmJ0GP+tjG
   7Rz0xXAfm4irUwYWQAtXRtYuJvxCRD9lqj9q3fp029J9DnJeOJdTJj9I7
   Mkyt6gLt1iX7LhX4DuXU3OR2FfH579HXAOs4sdtSl1zIXqzStnRm8h6IP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9960609"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="gz'50?scan'50,208,50";a="9960609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 20:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="gz'50?scan'50,208,50";a="21981714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jan 2024 20:43:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 20:43:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 20:43:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jan 2024 20:43:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Jan 2024 20:43:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB2mDIkevCCSM0LuSnEXGqG4kfoms12tP+iCGLiWE3BkzZVhCfiJXASDNE47AkSKyaVZHb2jRbsurBkOe9BH/ZQ/LUZJXJWprpv1AdaF07nQL9MQEbXY1auWVF5rPlmYQkrAiTETVIdiUqCFwdYLJn+F4aYJtZXUFNYUXXNAt1UPK+qyX3nGXLYf8HwVRUN9d5pS2i9jhBrT0AKf0wJNlrMbND3tnFC2jyFhqdjOQC0+5ZzUJRFN0bLePELgIBZK3kEIW++3mexVC+S/ZMc1VlAqV6rshYmGZDRhoE1pUUzc9F5EgSOHO78Fi4j/vl1GAjv2gqEbVz7Lo1MTjc4vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lRsUdtVwNbIfJovVB7Z2QAvJ3vRlkpMBU1YHH5YgW8=;
 b=aGEEedA8OXlTtgbX5n0IcgQSCoIxXFTbgle+JOZRATYX35DwKcB4XY6hPyxmtbtJW8gipNnP5bDCsLXvASBbXegI9XJbSBhXYPl7ncADOX1lUnRHplu1Cp6rLrF7e8aHARDyQsWV5yrPGvY9s8i9kOR2hkjS7HhRd0lHa+9dGpVb/Cbiiyw/MwpSFiazPOxydB06MYek/0sMhT70FABqzSM5bTZDyd4d2CQK0d15kMi1cLF0OsOxI0VTyRMpfhX3mQzR122rneMgN+qaMbJbixMbg/ECbV9a3cWBeyNvFFXajfYXs8Y4Cdn8iS7ULI+WYsKFiEQXOmDf5fiKhOwH9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 04:43:01 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 04:43:01 +0000
Date: Mon, 29 Jan 2024 12:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Xie XiuQi <xiexiuqi@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:openEuler-1.0-LTS 1521/21575]
 drivers/scsi/libsas/sas_expander.c:2079: undefined reference to
 `ata_dev_same_device'
Message-ID: <ZbcszvbokECwxmAF@rli9-mobl>
Content-Type: multipart/mixed; boundary="JafF3ot0m6Pm7xsa"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c789158-57b8-4765-24a0-08dc2084c5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Za1Ft3u39NA4z+iimyKKKEuO0aNKWnAkKcJed1jRq/zBy3oKpCJx+KIQ+xsPWCj2EIX7Qrq5cbSs96S0tK2TGo0xODOtwat7ZwRp2aLuPk5YFVaJB15eGqGRC989HFmRzpZIlcty+xJkt6wu/6OJ7stnjfOK7mNqi88uvLKEtHiVaqQfxyfB8HBwkweZhvFLG3m1hopeg/NuqunDo57Rs+4dGWRXRLFexTNPxTbZyol2vkAtbir0Rp+4GoSu/dsS9iaoMtiXkafIH7LndTpxx2tQrsmBfPmwma3ctZqPLsWGwZoh8JOv/7dfJIKBCMMU+zJYr5naEWa9SoB/E8xaVr1V8opn4Fe/mVuMCwDMH5fnqeMo6eQe3DSCjf+wxfVw4C6SAhf849HhEHYliWOxNnAlBwKWODnQo1Xsid0pJT30CuLZ7XGAU/+s8CTZV1An/9d4jjjSf9m6njepozfkARSePY2ZwrM6UmHUt0dESADqs3jGRfrqo0zcYNfs6GsqVgFvwK6c4e/RbNWPsVHkJEI5Exj0GW9qfwxswXx5IXU5rpAb4Mjff30Q8E65txcMiJLEHO4SZo++OUgf2La8+79vXBtMKiMnCrz9GUXyskw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(66946007)(4326008)(66556008)(316002)(66476007)(6916009)(8936002)(8676002)(26005)(83380400001)(478600001)(82960400001)(6666004)(6486002)(38100700002)(86362001)(2906002)(5660300002)(235185007)(966005)(6506007)(44144004)(9686003)(6512007)(4001150100001)(33716001)(41300700001)(81973001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gc6nX1VlmAGsFKb4BQT3vhnc6q39WkJaxkeelOHzYHtlksDirQQx1bs136yI?=
 =?us-ascii?Q?KBy9M4fzY8rnROhxjX3MiGYQegqQCE2Cu7rlLgslpZxNs+bEZxHwjEUdH5cf?=
 =?us-ascii?Q?5MCCmTacUe4IMmxr130fLUqWHF+Kuky/TqDMMyvw02ZW8QyUT9qitDjLgKRJ?=
 =?us-ascii?Q?rLWhZ3lWEt5QgyBLlXaNxZjFm1FQgAWV5xMWwglcwxEafp7B3gpBB8IMivFx?=
 =?us-ascii?Q?N7ZrMo8f4L9VIXQibGCv354vwixXX4KEe7W9bTmFTcGrPQr2E4AZ3Yx43x2S?=
 =?us-ascii?Q?fOcz5Rh1t+RXhY9xApopjuwRxq0YNmoywlNDEDAR0FifPMCxgW2iGG2bKbS+?=
 =?us-ascii?Q?NfQniJnjOztXp12ayvzXD3A3lkL9JrRrbkFptpc8lo9op4QO8eT32KgV8dC7?=
 =?us-ascii?Q?5QOqt0LIMl4t+XnVvPR8pXhcpja/3FyJ1tijyC1AqdQPH84nvVY85igPQ99p?=
 =?us-ascii?Q?4Nry5RQyZfHKohlOaiYaCX9q/hR5J+ta2tFVsOXy2DfqJPixKUN24W6Wa91Q?=
 =?us-ascii?Q?+VUi8fleNT+SKgpUbNTffdaIKZjl6EdRXND85wBLHEQFYYECzAzHtVLm+ALI?=
 =?us-ascii?Q?QooHmsNXSF1NCqYDbyuS5XRsxeoIVTiorXbnvXZ6QXOFchMWdmOAKY+Wg3ZI?=
 =?us-ascii?Q?P7M8rouqBYF3sv4yIT2XHI8kSMxbI+L9tsfIhz0OO/nLpCtk4HrGNAKW5YXt?=
 =?us-ascii?Q?nyJfx17z5Ys3hO5DHya3MPF2I8+TXxuUmCsOrc3T9ZTp9lDkJO/P6x31ZIJo?=
 =?us-ascii?Q?dBen1V8hu0BSKUTRuHfkas7rBrEKuiCVxc1+XJx9P3mkWOuIZckZO/brgfjZ?=
 =?us-ascii?Q?t0MierNw6RJoo7CAg82tgS3q7yR0H5lSVCanvAQ7ZO7HdPdJjh76k307Cypv?=
 =?us-ascii?Q?ir+1akOrkobI2+xySu+Uu1QssinFLdqQPaPVt5pL7O05bS2mmq87khUQDq1M?=
 =?us-ascii?Q?4va1fBeMRrZHW5iLf4CO8fUiOggaXnlt/E3+Cz0tA8eJpR0cnaUDDvatDo1b?=
 =?us-ascii?Q?I+kX543AcYWg6wh2Gs7L1akMFnonTgjsQy1czCIuY33FSB8f103zHqPIwWtN?=
 =?us-ascii?Q?vFJzQWg5YEtzStSn/Ice6JKK1TfDogWHEoPGRa7UbPBxOZ9Up4QZZpeVDyIr?=
 =?us-ascii?Q?Kg+5mG8rghJNlNetWyU4FihJDTIMWdpsvRMcAFDYcDErHAOPQz1/QW23XO4A?=
 =?us-ascii?Q?tipsTRtd66KHB6tCIjCmAIFKtcs9ouy4Riwg+YporFxy366V4p7HBHOlcXyz?=
 =?us-ascii?Q?2YQwAiUM6svxL+qZXK8+rVd/HavbPIDr1FqzfcpPGWV10ar93S7PKD1N+BjF?=
 =?us-ascii?Q?hQ7S9hEYYKhsEFCX337XObDssZIKsVhs1je/rKYwiUphIrWJstOlusiO2sXF?=
 =?us-ascii?Q?MyFubQ+aAt3aw8qle+o3hwODi8MktxYeBJMxAYRVke9XFHQSvezNDQ/tJZRB?=
 =?us-ascii?Q?0zAlEWf+hZ70AyG/cquiKl5Kx7R/NiETbmJLlrUVfuTv/YSRbepqa7Wc1Ley?=
 =?us-ascii?Q?870gifYmUsZu24oq0wuL7pOsHJVN1a13HtQllTgvfnv8bKPIkrVVWVMiqEzY?=
 =?us-ascii?Q?21J1u3UuszOcZibHQ+YQka8xxdglfJyMsZCzErz7XxDxWTxIA7/YlDjxiGUk?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c789158-57b8-4765-24a0-08dc2084c5dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 04:43:01.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcpKU+BsXwxcoLEhx25lBcRd/Xi6xnB2+rVd0YpxSYCJStmizhwVNCDDrexD3sIr4Bq9Tg6Cnlju5RymvfkxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-OriginatorOrg: intel.com

--JafF3ot0m6Pm7xsa
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e0207e2784d0f836e732608faf1a6966546a8eb3
commit: d856ec500c97835c591ffacc005f514509f1a931 [1521/21575] scsi: libsas: check if the same sata device when flutter
:::::: branch date: 13 hours ago
:::::: commit date: 4 years, 1 month ago
config: x86_64-randconfig-r113-20240125 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261034.TNcmiPjc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/scsi/libsas/sas_expander.o: in function `sas_rediscover_dev':
>> drivers/scsi/libsas/sas_expander.c:2079: undefined reference to `ata_dev_same_device'


vim +2079 drivers/scsi/libsas/sas_expander.c

354cf82980e244 Dan Williams    2012-01-12  2011  
19252de6818ced Tom Peng        2009-07-17  2012  static int sas_rediscover_dev(struct domain_device *dev, int phy_id, bool last)
2908d778ab3e24 James Bottomley 2006-08-29  2013  {
2908d778ab3e24 James Bottomley 2006-08-29  2014  	struct expander_device *ex = &dev->ex_dev;
2908d778ab3e24 James Bottomley 2006-08-29  2015  	struct ex_phy *phy = &ex->ex_phy[phy_id];
d12b2bcfd3801c Jason Yan       2018-12-28  2016  	struct asd_sas_port *port = dev->port;
d12b2bcfd3801c Jason Yan       2018-12-28  2017  	struct asd_sas_phy *sas_phy;
aa9f8328fc5146 James Bottomley 2013-05-07  2018  	enum sas_device_type type = SAS_PHY_UNUSED;
354cf82980e244 Dan Williams    2012-01-12  2019  	u8 sas_addr[8];
2908d778ab3e24 James Bottomley 2006-08-29  2020  	int res;
2908d778ab3e24 James Bottomley 2006-08-29  2021  
b2311a287553af Jeff Skirvin    2012-06-21  2022  	memset(sas_addr, 0, 8);
354cf82980e244 Dan Williams    2012-01-12  2023  	res = sas_get_phy_attached_dev(dev, phy_id, sas_addr, &type);
2908d778ab3e24 James Bottomley 2006-08-29  2024  	switch (res) {
2908d778ab3e24 James Bottomley 2006-08-29  2025  	case SMP_RESP_NO_PHY:
2908d778ab3e24 James Bottomley 2006-08-29  2026  		phy->phy_state = PHY_NOT_PRESENT;
19252de6818ced Tom Peng        2009-07-17  2027  		sas_unregister_devs_sas_addr(dev, phy_id, last);
354cf82980e244 Dan Williams    2012-01-12  2028  		return res;
2908d778ab3e24 James Bottomley 2006-08-29  2029  	case SMP_RESP_PHY_VACANT:
2908d778ab3e24 James Bottomley 2006-08-29  2030  		phy->phy_state = PHY_VACANT;
19252de6818ced Tom Peng        2009-07-17  2031  		sas_unregister_devs_sas_addr(dev, phy_id, last);
354cf82980e244 Dan Williams    2012-01-12  2032  		return res;
2908d778ab3e24 James Bottomley 2006-08-29  2033  	case SMP_RESP_FUNC_ACC:
2908d778ab3e24 James Bottomley 2006-08-29  2034  		break;
b2311a287553af Jeff Skirvin    2012-06-21  2035  	case -ECOMM:
b2311a287553af Jeff Skirvin    2012-06-21  2036  		break;
b2311a287553af Jeff Skirvin    2012-06-21  2037  	default:
b2311a287553af Jeff Skirvin    2012-06-21  2038  		return res;
2908d778ab3e24 James Bottomley 2006-08-29  2039  	}
2908d778ab3e24 James Bottomley 2006-08-29  2040  
b2311a287553af Jeff Skirvin    2012-06-21  2041  	if ((SAS_ADDR(sas_addr) == 0) || (res == -ECOMM)) {
2908d778ab3e24 James Bottomley 2006-08-29  2042  		phy->phy_state = PHY_EMPTY;
19252de6818ced Tom Peng        2009-07-17  2043  		sas_unregister_devs_sas_addr(dev, phy_id, last);
354cf82980e244 Dan Williams    2012-01-12  2044  		return res;
354cf82980e244 Dan Williams    2012-01-12  2045  	} else if (SAS_ADDR(sas_addr) == SAS_ADDR(phy->attached_sas_addr) &&
354cf82980e244 Dan Williams    2012-01-12  2046  		   dev_type_flutter(type, phy->attached_dev_type)) {
354cf82980e244 Dan Williams    2012-01-12  2047  		struct domain_device *ata_dev = sas_ex_to_ata(dev, phy_id);
354cf82980e244 Dan Williams    2012-01-12  2048  		char *action = "";
354cf82980e244 Dan Williams    2012-01-12  2049  
a01e70e570a72b James Bottomley 2006-09-06  2050  		sas_ex_phy_discover(dev, phy_id);
354cf82980e244 Dan Williams    2012-01-12  2051  
aa9f8328fc5146 James Bottomley 2013-05-07  2052  		if (ata_dev && phy->attached_dev_type == SAS_SATA_PENDING)
354cf82980e244 Dan Williams    2012-01-12  2053  			action = ", needs recovery";
354cf82980e244 Dan Williams    2012-01-12  2054  		SAS_DPRINTK("ex %016llx phy 0x%x broadcast flutter%s\n",
354cf82980e244 Dan Williams    2012-01-12  2055  			    SAS_ADDR(dev->sas_addr), phy_id, action);
d856ec500c9783 Jason Yan       2018-12-28  2056  
d856ec500c9783 Jason Yan       2018-12-28  2057  		/* the phy attached address will be updated by sas_ex_phy_discover()
d856ec500c9783 Jason Yan       2018-12-28  2058  		 * and sometimes become abnormal
d856ec500c9783 Jason Yan       2018-12-28  2059  		 */
d856ec500c9783 Jason Yan       2018-12-28  2060  		if (SAS_ADDR(phy->attached_sas_addr) != SAS_ADDR(sas_addr) ||
d856ec500c9783 Jason Yan       2018-12-28  2061  		    SAS_ADDR(phy->attached_sas_addr) == 0) {
d856ec500c9783 Jason Yan       2018-12-28  2062  			/* if attached_sas_addr become abnormal, we must set the
d856ec500c9783 Jason Yan       2018-12-28  2063  			 * original address back so that the device can be unregistered
d856ec500c9783 Jason Yan       2018-12-28  2064  			 */
d856ec500c9783 Jason Yan       2018-12-28  2065  			memcpy(phy->attached_sas_addr, sas_addr, SAS_ADDR_SIZE);
d856ec500c9783 Jason Yan       2018-12-28  2066  			SAS_DPRINTK("phy address(%016llx) abnormal, origin:%016llx\n",
d856ec500c9783 Jason Yan       2018-12-28  2067  				    SAS_ADDR(phy->attached_sas_addr),
d856ec500c9783 Jason Yan       2018-12-28  2068  				    SAS_ADDR(sas_addr));
d856ec500c9783 Jason Yan       2018-12-28  2069  			goto unregister;
d856ec500c9783 Jason Yan       2018-12-28  2070  		}
d856ec500c9783 Jason Yan       2018-12-28  2071  
d856ec500c9783 Jason Yan       2018-12-28  2072  
d856ec500c9783 Jason Yan       2018-12-28  2073  		if (ata_dev) {
d856ec500c9783 Jason Yan       2018-12-28  2074  			struct ata_device *adev = sas_to_ata_dev(ata_dev);
d856ec500c9783 Jason Yan       2018-12-28  2075  			unsigned int class = ata_dev->sata_dev.class;
d856ec500c9783 Jason Yan       2018-12-28  2076  			u16 *id = ata_dev->sata_dev.id;
d856ec500c9783 Jason Yan       2018-12-28  2077  
d856ec500c9783 Jason Yan       2018-12-28  2078  			/* to see if the disk is replaced with another one */
d856ec500c9783 Jason Yan       2018-12-28 @2079  			if (!ata_dev_same_device(adev, class, id))
d856ec500c9783 Jason Yan       2018-12-28  2080  				goto unregister;
d856ec500c9783 Jason Yan       2018-12-28  2081  		}
d856ec500c9783 Jason Yan       2018-12-28  2082  
2908d778ab3e24 James Bottomley 2006-08-29  2083  		return res;
2908d778ab3e24 James Bottomley 2006-08-29  2084  	}
2908d778ab3e24 James Bottomley 2006-08-29  2085  
d856ec500c9783 Jason Yan       2018-12-28  2086  unregister:
24b7c4b6e22de5 Jason Yan       2018-12-28  2087  	/* we always have to delete the old device when we went here */
c666aae6919114 Dan Williams    2012-01-19  2088  	SAS_DPRINTK("ex %016llx phy 0x%x replace %016llx\n",
c666aae6919114 Dan Williams    2012-01-19  2089  		    SAS_ADDR(dev->sas_addr), phy_id,
c666aae6919114 Dan Williams    2012-01-19  2090  		    SAS_ADDR(phy->attached_sas_addr));
c666aae6919114 Dan Williams    2012-01-19  2091  	sas_unregister_devs_sas_addr(dev, phy_id, last);
c666aae6919114 Dan Williams    2012-01-19  2092  
d12b2bcfd3801c Jason Yan       2018-12-28  2093  	/* force the next revalidation find this phy and bring it up */
d12b2bcfd3801c Jason Yan       2018-12-28  2094  	phy->phy_change_count = -1;
d12b2bcfd3801c Jason Yan       2018-12-28  2095  	ex->ex_change_count = -1;
d12b2bcfd3801c Jason Yan       2018-12-28  2096  	sas_phy = container_of(port->phy_list.next, struct asd_sas_phy,
d12b2bcfd3801c Jason Yan       2018-12-28  2097  			port_phy_el);
d12b2bcfd3801c Jason Yan       2018-12-28  2098  	port->ha->notify_port_event(sas_phy, PORTE_BROADCAST_RCVD);
d12b2bcfd3801c Jason Yan       2018-12-28  2099  
d12b2bcfd3801c Jason Yan       2018-12-28  2100  	return 0;
354cf82980e244 Dan Williams    2012-01-12  2101  }
354cf82980e244 Dan Williams    2012-01-12  2102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--JafF3ot0m6Pm7xsa
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--JafF3ot0m6Pm7xsa
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-52-g1cf3d98c-dirty
        git remote add openeuler https://gitee.com/openeuler/kernel.git
        git fetch --no-tags openeuler openEuler-1.0-LTS
        git checkout d856ec500c97835c591ffacc005f514509f1a931
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 SHELL=/bin/bash

--JafF3ot0m6Pm7xsa--
