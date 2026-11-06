Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793924522;
	b=Bqq36tCDZrJzulcNQr3QhHkLtBgOhcRiaGNP9hFSSSZmK53JlLAQq2xwqg9DoTlVAU8z
	 QNE7SNAEl6CnskdAPbqqX8pc2beL6wa5PORnenKB99hlWIwag4YSepsA+NDwTEFlAey7J
	 no1SjADnRKrCVJONMjBnP22WjkRkSP7N4U681LA+ycRTVxkN0L9OvhPEe71OjNiSm46jt
	 mIqe9RBDIJ2fLXKg5kYoX7f1CKSEEDEYmn2f+cqckfQAdwhERbDns0aTF23CdxjlMvNEa
	 gXTZGJWisGb31r9c5RmSV54b47coKrUuSnaDQ/7m4+YfdAgqBqyla6A9Nis/1bk9j6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 Content-Type:Content-Disposition:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=MiBoE8onyn2UjImbtm4S75u7J8/la68huvJeYT2WvKQ=;
	b=jXg4pa9iImWjMTo/rJ1uNFrRaOOOchfuB+EtqEQDqyy/ZC8Q9csOf3MkF/AXbmobDIfR
	 26xy9vGaqDkSHf6HALtjZbFiBpkjW04aQ4fyBsd6CDSEovn7aIaKg5gbR1mXv5bAvn3Wh
	 Kpwt7MvzwuWGdWcf8HGG1uC+1dKr6MSdUDrXG34yncY+ZcCroHRp6ZUqA5ovLphGEtusq
	 QsliaJE4puCUBDEbpHbmVBJ63VFAS1GEC1A9VzLyEb2Y8ONtBwsVqZMkSEBWYzZpETMji
	 q8YJQszoFsUZ35AkXsrFvarwwxiEhzPizVyRinwtp+gpmEN15hbyMXEGQ75wKPMLBNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=muzJRMnu;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C6606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 00:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 902C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=muzJRMnu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793924521; x=1825460521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8r2fwX1Ylui/W1olaHW2J5OZZM9kChkqex8r2RoPDY=;
  b=muzJRMnu821GPR03DCbsXaG/Tqm+d8Ir0cLfZBHe5rahMh38qVRvsX9h
   CP3/eQORA+M96hUUkv3xrgao0C23fXvI0aJ1XzBSTWVMaofKeYWIdJKOy
   oKHW7a01yvmuysSJqfoi/9Vf44Y1BGkG5TJqqXRisRZL27BRuKrImoMB0
   /3LSIW7W2py8sSVGSLkcmf5qK2wmKPCLfYYmYTgS1jW1kC3sPvCT2eF4d
   RTIJW3dqz13tGW4bWghefRmdc/5uonnmK7XJNOBnxSgTnaFIA0CmDE2Zv
   DFd6ciXEc0IwOectUZdf5kPFR2PgU1GMsNjdk2p9UDtGpYh1Nml/1sYDB
   g==;
X-CSE-ConnectionGUID: YLWb3libQNqPcKkrrgEqJg==
X-CSE-MsgGUID: INueHyXaQ+O+BrnRHRZVVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2606782"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2606782"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:22:00 -0800
X-CSE-ConnectionGUID: l7WROJxrRcSNWpCD7KMU0g==
X-CSE-MsgGUID: nCjmrVgLR0iLTu8fOcGr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9023335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:22:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:21:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 16:21:59 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 16:21:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9EHfy49GIooukurGElwY0sv/niRoxNaSOPO6GivYPEwNrHQWd054kSM72WSNBp/M/KCWj9mPSosEjMs7sqN7OGklCBi5SzMNL2waqxTjWG4rAKQ0VQQRYjbGUvuxBdYpNkM/2SjrIL62Oow7mPjgog8Io34u5/Ezceoke5keYCDcqQx3Sd4+RztwLgxlZg7vy4L+qZ4LZalLDa0jvcY4kOHsvefBzCzj8mWcC1Y4DH24QsiP3gXLz8KlIFMTee7itbnrWouz8AwWv7Fkpt/e0HhOtxdKMEaTCT2AcZbGk+aQBrkibL4FUwE/izc0BXZ4s10UoQBS8+O75m9XZ2XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiBoE8onyn2UjImbtm4S75u7J8/la68huvJeYT2WvKQ=;
 b=r1AmfIEEMPO2cb2bMYjz1QDilFXiUcz1FgAqs9B8ktffgi+ZXvUbvylw0gpUcNk/jZbkVMMhHl+pCEQ6hm4VDery835K3+7+RRIywDsaGmD/U0KKCDhZSm1Ig31qjH10uyQAB4Chph8RexNy2cyCfcH29Yz9oFLFUW3WcEOmcOcgWterr7jdxWjVCqNUz0w4VJv4zbxVIAplqYK8MmnBr9wpT1BiOb3zjzuC4uQN3qOPOxizXxkRHj7s7q0N4AgmABbMhwAdjSlMzuTRbROz2UBWPAdZFkOdL3naibsivmCHS4KnZAac+n9aQDWYy2Ke6PyGOyMnP6VEZm9hdpQWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Fri, 6 Nov 2026 00:21:55 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 00:21:55 +0000
Date: Fri, 6 Nov 2026 08:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Flynn <david.flynn@hammerspace.com>
CC: <oe-kbuild-all@lists.linux.dev>, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 1339/1462]
 powerpc64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference
 to `nfs_idmap_cache_timeout'
Message-ID: <au0dmp90a0XiAkf1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::10) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc173f0-9b83-4d55-e7a3-08df3b9bf683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925022911599003|260925021911599003|260925021311599003|261026121527099003|56012099006|11063799006|261022075727099003|261102124527099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: gFAsdH+IeuOvGEs8UvVQ0VaXCZ78ShHx8p/wmnUFQqIA8bWEtlQdQUx0rdKEDNAYkMjRhHigkl/ZnByx8V7UWfA/Iycy53drFHY21WEiDYfOw4a7v+NQxtGfoti6vaRTx48rTEa1cJgWe+Zx6veCI2Rt92W/bXI3I2CKR0qdl8Rg8Xsesstii26788E+imT4tti+yyPlan655ZjCC/5OFgZ1h84F45QUgAXmhHEM6hlW48Zfjn0dhQFiXLxwDubTZr39aZWKEMkiiOxnHLAbKK3onUB+kY31SCte91TlKScJ1Qd7NJNlZeFgbC1J8jHY6Rajh3LV/T0dneMIWy47eN2MxU1bV9J8JY/OW3m4nq1N5x2o3x4XWTQYGvTPCtN6GYpFzN0zwpX1cU9vaPXapqYfJilWaEGFo9MAu5KHxV7LS/M4NgyxkgWxVHUM5iSc+f6fe7hXjsyO3olj5sk547/67SOPKKKr7v0uv7zr8L8dxPA8YprlpK3r6gE0G1jDTEhhr34HYEynhGU7LhpS+Eay50RU1wv5eQ4Y7IqzSiYpPBHOcgWYUKsByKkpEnKlLbQfmgtjN6WpuUjbd/Jlxd2ZusmfYrgJHdijKm805OohSekPUlzsFeudNnEeem7k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(56012099006)(11063799006)(261022075727099003)(261102124527099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmJNuq6qViceFIIOsYOMFjIv3saapPDEQT3RIYOqFnBvWF01yMTgH8Z7R6/F?=
 =?us-ascii?Q?DV2GKo8vhH2pMEuQSGPK20LZ4A18iODjD2NPrdI6hWiCjh6zG7ffr3Dz1KLk?=
 =?us-ascii?Q?qz6A95m9BpaJOhg7wKPAfHHe8vxJSCIxm3Hedfuz3iNEwuNT7E7WTQ49YYe6?=
 =?us-ascii?Q?AgwwrDicfktE+5x6UgvVtCqC9D6MHAcQ02WRXs2wi5n6G4hS3XglbOtXuiPs?=
 =?us-ascii?Q?ZVuB4Q+J0GqVJF9d5NgcBws35eSLYZls4e3pZM2oCF5zpspoTIbV3CY1YIqt?=
 =?us-ascii?Q?nAyyj2zhmFawGRT5M27RZHRAZdG2yHmQ4c4AUp2xBva86OyFFqucHCLIooj4?=
 =?us-ascii?Q?Q/8rJc3HWsWDyjl7arD0EkDCUudEDQAAHu65VkBttaglq8CuhXRILm6sxTmu?=
 =?us-ascii?Q?VJwqKaZY1czAX44pIBeJjYoemMqlGN6shm7SpIAdUrAlBYygMYW1/3vzht8X?=
 =?us-ascii?Q?uN24CbEgL5f+HvWEukHsVNHuqjUIZwceqQTokBveX/v3wWTqun02q9XZp0wr?=
 =?us-ascii?Q?m+g2Yva1xASxvMP/czqz01Kfnhvq10xQOe+DTTSyiFx31gEJHpKpLrVMNvHT?=
 =?us-ascii?Q?0HrdyO2ikiDi/3LS/c26F1HWlXSWUbTwse0UPNROtHkVKZHQnkM2a4filb9a?=
 =?us-ascii?Q?tOpUWvoBl0Apoibrmw2VPCOVHBZ+dBA5Y2qFbC1HdA+4KEM5ZNI8uBUg7huZ?=
 =?us-ascii?Q?PpF2zoMPgU4cbsaS3Tsng9zl32xVZ9dKd477JpdnqRvuR2Fdu22dghLsvKAz?=
 =?us-ascii?Q?NAzbRrpDPkW3+7iI9DbEkHiA/sEb+9TT6CNmIYvcsd0ZqMzkLsSRMNIeOWyx?=
 =?us-ascii?Q?ky9zKSHPVoWNk0MkoicnS92nksHY0X1Z/pTv4CclH3r94AMb24P+BBDTgQrP?=
 =?us-ascii?Q?pyj2N/idfV4Ebd03aGS4AtTYnWTVlyUOJyGF7cSr4i3wGH8lISuuuY8IAr63?=
 =?us-ascii?Q?j17TLlybbnq3YbcCdfvNd9S5xpPo4C2z38vDcdFosrPWoS9eTOEW3mRoJYzL?=
 =?us-ascii?Q?4rWlDOX4D//1NuVdES2ecIwdETaBZj+z1gpdFMQfcNn4OSPdjCYL6o81LvWD?=
 =?us-ascii?Q?ZBS0k+roQLkEG4vdpA9KEdDRQdKPx+IVo4fL/FKXJszKA92uoD4MSeDE1aoB?=
 =?us-ascii?Q?3MCdCbnNlIdTAGyJ8Y9GiH6GgxpjrUSsLGQHEEl4amJ0BEHXso59y71MVatH?=
 =?us-ascii?Q?5D4LxbMhtefNj84mWVNFSWYk9Ionmi3wDgWlRHw3TFTMwFnHJYvDEvUO4R7k?=
 =?us-ascii?Q?m8vgtQzSVkxsnlo1ZAs2HAMILF/Jq+vKLBoGrpE85L5QX0VGlqrtsBqVTuHf?=
 =?us-ascii?Q?8+IVh+Nso0uX2WmTWVqLrmNJY4fogYrlwsp+Lm3PnozPqy266PWTp38e0/bg?=
 =?us-ascii?Q?UKNufhenpW2kZ8VPkL1/dQOqMd7Na5QbLBzcYNizEOcUnBh+KNjaS0kYzHT+?=
 =?us-ascii?Q?9HyyCjmVNYUxpDXHPIertXDbuv3VDhdUeUd9MvvTnQTCUEF9bK+fJ+etRMnL?=
 =?us-ascii?Q?w8XtxabMvPp56RGKTuYwotR1dLFEK5y5kW/P/vK9+D6RBvdLya2NOMjxFXQE?=
 =?us-ascii?Q?jOqn49wSRiFcMF4uQKbVg+/+7R9q897tp8eznOLsH4ptyYYlpXhXKBN8A86P?=
 =?us-ascii?Q?bX86/muDWGEen75DUlpL4lMkeVcHBYaoJ79tOhVqmOsYJgvFiNrKZBRaUizw?=
 =?us-ascii?Q?q2Ify5bpKFpkQy/NuDk8T5lO/AXazbDVmhCRwmyMM0d6Mfy9iTqrClSTaMt9?=
 =?us-ascii?Q?ZG/GyeBZHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5m+H3r9Aa1+MQpWET9APnAIw7wwUO5b2+V0IbAPs9waGIFY2y/inaLOgorVIQ+xSyTuTB++iz+M+iq8Z1VVMSRIC71AtePCsPFJG3KthicGVkz0YySLkXZNDQgN7Qj/QwSaao4N3R7DG62HD83hJlcodMHWHjqfob9XLtX4S6vOoblhM+gl8cyw1wNMR1OGUJaFUEj/9XuqaVxVxzR9Vobi1A/Y2ntCIF0XbZRNrTSQoDYZYlkjQN3xYpg5/btZjNn9msiXAMykLsQ52uznzdPDQ4jldjNYYuL9S5YpsnjXHttQWRaIeWdjW89oRq3RzODV7v4FKGoJcIw0RiDLkrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc173f0-9b83-4d55-e7a3-08df3b9bf683
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 00:21:55.5401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L6hQ8u2aHzwAzBkb607PC7BsCW3L3Qf+exVQ+qqe1VKifL8h+zm7LBMM10Z+OHLm+CU9U84IuNqmiGS56gA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 1bb07fd5eb81675b74c94d750b57d01f34768f8c [1339/1462] hammerspace: private extensions (O_NOMODE, mkdirat2, NFS client/server)
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611052124.EcUajHP1-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052124.EcUajHP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611052124.EcUajHP1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> <stdin>:1633:2: warning: #warning syscall mkdirat2 not implemented [-Wcpp]
--
>> powerpc64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to `nfs_idmap_cache_timeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

