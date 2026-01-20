Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF6346761
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883493; cv=fail; b=CEiMM7dp+iIcnZqofbeHgQZA3OLcvcwYBV5HoVHqQJxFfHlJb6zlLovVAZqW2GBAJ3gE4zcLcq/jc6qF0j9BK61kJQ+Hu6oN4f9bu5+zbqL/FkEglaZdbyGxYYNwYv+Bh/3rwFFiOYnjdvg4isd/f6VqBmnbNnvjtz+RTBWFOiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883493; c=relaxed/simple;
	bh=CgNIRadwCLO/z0w43edS6vUmwbtxJA1oYMHk0vhE4tY=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dGHqP91BIpsV+mpzu6FKqxR2sXNKaCteSxBSHYOLgoSGdQu9OqHL2M3FOFV0awPKiR4o8RPRrr7Qo0gLhEMS64Hq8h6ubG1fdd+UpkTZim1kYhDf7C7ahnL+Cx2fqJD/dX/Ta1T5jSzQlfasEQGIMX5MMTdnQ4Y4Xg3FMtpq2H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xbM352oD; arc=fail smtp.client-ip=40.107.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xbM352oD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDerRK8JQCHV8SwAgjVtR6sMD2MmHz6BBjtwxaN8ilTGfV1bn12rpH7WLPgVLtwUXp7atn2Eo0xz1EM0mKfjAQwIBGGkROUbyF4jvEOq9F0TWV+wXndRLrmOxwgWO7ZXlNnUBZKc09M6ZlG8jNRdLu2DGkPNoyD6ZnPTESSbYd5J1fZqLPOhH3akQFfKW029qRqdWXq1V+x8VHQOpDUGhSeg4U7up96tiSwv0YPTsivvTv3LLW5EV3hepREm1PcSIY1iGIRDVPLFQ9dqgKvdzoquOj5SYvg4tWq11PgXS1MaZpLkP5SUVzfxrtOyQT09oLknaLr4QnhwSFg38Lu8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krH9IIzbFafEBlOdk+/NllX5cc3MSYk+dSkL4z9GpTY=;
 b=DT6bV1rurwfCVKrGysDzDP5y2BGZF3liGQfIA7JTYXcQyZgukxFXK7pY10ydJWrwTbA/flnrdgKV+oWm8nmFAyhYA69U5+jqbzxVUoydDYfrANN9efO6v/Ky92Ag1/2LVlAL3gTiKpGIKTVprVuRUXDSUcT+sl1syKk45J9v4WvxbwlRX+3GdAXlevL5WII+Iu/NMZp2epGJ9oH20Aki4s5MQBIFdHc7o0ocWRlwjtd68UswMuuDoeOtP+ksUnQuMRVcWHxUGwf1xdYKMyRRtokTyllbHeENXKu8Ily+QSPLITVUJ+IeQVhar/IHNJSxJwj1ZJRZU+LPWbrUktFmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krH9IIzbFafEBlOdk+/NllX5cc3MSYk+dSkL4z9GpTY=;
 b=xbM352oDeI2DkxwG8vlSpwzDd8WYB5AMdLgBCinNntS1od29JOUrD8wN/D91pLFmtdDfirqeZgrD6sw7uT12CeH8xhXNvIJ+cNDSUzsnui5kf41Zbg/R9d/Mv8iex44AQ3MJsJDozdRWt6R1sV77rXJp+ikx5qbwgF0SwUKJGrQ=
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by PH0PR10MB5625.namprd10.prod.outlook.com (2603:10b6:510:f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:31:19 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::a9) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Tue,
 20 Jan 2026 04:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 04:31:18 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 22:31:18 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 22:31:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 22:31:18 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K4VFML588191;
	Mon, 19 Jan 2026 22:31:16 -0600
Message-ID: <61e84e12966ea0259961eca5a25c302c62acc9d9.camel@ti.com>
Subject: Re: arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.c:648:
 undefined reference to `cdns_pcie_host_disable'
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Chen Wang <unicorn_wang@outlook.com>, kernel test robot <lkp@intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, <s-vadapalli@ti.com>
Date: Tue, 20 Jan 2026 10:02:35 +0530
In-Reply-To: <MA5PR01MB125007874FDFE05EF3D9D4989FE89A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
References: <202601192149.m9qDmfLW-lkp@intel.com>
	 <MA5PR01MB125007874FDFE05EF3D9D4989FE89A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|PH0PR10MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: e05c236e-c31d-4baf-5923-08de57dcc1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|32650700017|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RThBRWt0QWJCRzNTeUZna0xucGZEbVNtaE1XUzdDU0Vua1huajJNQjZ1MHky?=
 =?utf-8?B?NUNVV3RERGZ4aXV1a0tualhFaGlxYk4zZFY2RnF5QUZGVEpMTDNHTTllZnc1?=
 =?utf-8?B?U3pJS3I0dWhVVGpXTW80cXlIWmtDQmxQVTRMM0FJdSszY3NDYXlSdGNJa2Fm?=
 =?utf-8?B?SXM4dUM5UkExcnNsbWtTYkE2MGJTZCtlUFhYczU4bW9oZjc1cG5SYVl4ZTdi?=
 =?utf-8?B?b0xEVWtPNHl6aksydjRoTzk3NnphZFVkSlVUNlpZYzNoNmZSaEswNUlZdlEy?=
 =?utf-8?B?dTFZVnhOdit5YlZzeFpyRVc3cjBKdVNRQ2R6Um93M0RIZHhvS1dyNUVUQktS?=
 =?utf-8?B?N0c0Yk1sTzVnTnhFU0lOSW8vVGJJV1N2R2VnL3JBa01RTTdFMVplVHJKWE5D?=
 =?utf-8?B?VnluUlgxZ2owQW1wL0dOVGJyeW82bys3N093bmdKMXpLZERXY2tEeDRlUmx4?=
 =?utf-8?B?cG5tdGtJTjRzL3JwbDZHbUdDY3owZm9jQnh3N014MldLbE5kUVViSUVXampX?=
 =?utf-8?B?L0Fvb3Q5OHo3bkE0N2RkbmJyMG1TcE1QU1ZucTAyZExPQ3gxcUxIQXZJUGpT?=
 =?utf-8?B?VXV6YXNEalFNZVBPbmtJQ09ZeHlOc3hnRVJmMHJHdElHTHZNcEc5cmhrMjhY?=
 =?utf-8?B?KzkzbkluT3lhQ2dHcXFUb3BWbGNUUThnaTVkRDVNRGQ2cG5GQnlPMXVVUFlE?=
 =?utf-8?B?eXJ4TENRdDhDSW1zYmxsSHVxdmpJaS8rRW13TnNXYWZPMHhDa1p5eFhUcXFG?=
 =?utf-8?B?K1oyNHlYVDFnRUlXQ2VLaEVEUVRyRUVRT0dhSlRRODJkbWdWOVV4bnA0NWdm?=
 =?utf-8?B?NVVxejNIaUlRQW5HUFp4UVl0TVFoNjVyei9LL0d6MXA0YTQ2MFo0Zi85TWdL?=
 =?utf-8?B?RmJXOEpmZGNnK0pNb2tUdlhTTUgxM2ZjU0s1bHdkbTJkSnN3cXRRdHZjUGQz?=
 =?utf-8?B?RFNqRlRjSldIUHR2bzZ4WGlpSGhkcDBHSHhINDVDVnVHVTBITk1LSDhjQ25j?=
 =?utf-8?B?S0w3NlVBNXZ0YkZERWZKOFJrQkZGN05JNDNwVzdSRFdnVGc0UkpNLzdrWG9F?=
 =?utf-8?B?QksyOGNCV0REVjJCRXNkRXZnTFNqVnlhSFdCT252TURldVZ2YWdYVC9uNGY1?=
 =?utf-8?B?OW5kT0RzSmpXUzQvd280Z3ZlZ1RoUmZPR05vTllYR2FXQ0x6Zm5QSU83Mkxo?=
 =?utf-8?B?enZpTGw2bWJ4enFkUkpERGVWREVYVlJCOHViVVMrOHBzZnNlakRMbkdWTE44?=
 =?utf-8?B?UTdKSFQzd21GVS9JUmMzY2wycElIbm5uSGFNSzZHMDF5dS9XOFo3R0FTcnZr?=
 =?utf-8?B?WHFrRGhRZnh3K2doSUx1WCtCcjRXOFFDRXVYUjdoSHBTbkZTY3dkem1SZ054?=
 =?utf-8?B?SGEzZjc1d3U1NTdjTFVlTVRBaDVqU0ZYeDdpd0oyOVlvU0syREhNL1lQRXd0?=
 =?utf-8?B?WEtDOWRlSjRNVDQrNjl0c3B6T2FTZTBvbGZhR05XdEkyM3JQNlpWdkRudHFs?=
 =?utf-8?B?VG9WV1ZpdXBMSC9IWm13YXpFSzFXNzltT25VMXU5T0xiVHA5bnhpMnNNc2ZY?=
 =?utf-8?B?YjVLTklvUVJwc2Z4MTdlNXo0bGFwcUlkcU5CRWhpbFN4dkhxQi9CczNvYjVn?=
 =?utf-8?B?OVF1ZlVJWWZ2c0xYMDd6S1loZUs2d2lEL3dENEJ0RW0xNEN6K1pVcmpaeFV3?=
 =?utf-8?B?ckE4RGhZb0hzY3RiS0RTWS8wMm1ONVlhTFJ6WkxXMWVxdVkyb2o5ZGNpNXNU?=
 =?utf-8?B?TVJNUUpHaDN3c3JJWGlUbXBPSy84VU1qcWM0aEh3WTlPalhRU3g5KzZ2cVhi?=
 =?utf-8?B?N0M2R1Nrams2VndZcHByS1hZUlozYnRZNHplVEFXUlJqMHJOVW93blFmV2lj?=
 =?utf-8?B?Qkk5Wnkxc21QY2l5V2gwNnErRjVlMTB5M3pYS3d0UE5NeGNBUmhoVDVjUjZP?=
 =?utf-8?B?N25rMjR3OXExdkovUU1MbHNGNnU2RGI0MVhjTnpEaFp3VEQ2KzdDMXdPaVhL?=
 =?utf-8?B?enRuUmQzK3VIU3hES0FKNW9KOXkxaStpTm9hVUFZUVVJZTQ0QmhJK1FKd1pG?=
 =?utf-8?B?eE0zZnlYb1ZySzkyMjVkYkRJd3k1SllyNExlSzBJYnN6cnUyWkZ6QXA2QlNW?=
 =?utf-8?B?bW1WQnAvcWJkNkV3aDNQYWtocTZtQTFZZHB2dGUxdnNMMXpObXRjM1E5Rkxs?=
 =?utf-8?B?T256U2ZDb3JZdmJHeUxFYWtYU3BVZ25mem1nazJ2WVQ1ZzQzYjM0MVlUVUpr?=
 =?utf-8?Q?abmfIGFrIud05XGLxLHrPt4PsH0OJwQ1lOh2/kErek=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(32650700017)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:31:18.8851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e05c236e-c31d-4baf-5923-08de57dcc1d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5625

On Tue, 2026-01-20 at 08:45 +0800, Chen Wang wrote:
> On 1/19/2026 10:00 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> > commit: 1c72774df028429836eec3394212f2921bb830fc PCI: sg2042: Add Sophg=
o SG2042 PCIe driver
> > date:   4 months ago
> > config: arc-randconfig-002-20260119 (https://download.01.org/0day-ci/ar=
chive/20260119/202601192149.m9qDmfLW-lkp@intel.com/config)
> > compiler: arc-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260119/202601192149.m9qDmfLW-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202601192149.m9qDmfLW-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> >     arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.o: in functi=
on `j721e_pcie_remove':
> >     drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference=
 to `cdns_pcie_host_disable'
> > > > arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.c:648: undef=
ined reference to `cdns_pcie_host_disable'
>=20
> This appears to be a configuration-related issue.=20
> "CONFIG_PCIE_CADENCE_HOST=3Dm" but "CONFIG_PCI_J721E=3Dy".
>=20
> I don't think this issue is related to sophgo drivers.
>=20
> Adding Vignesh and Siddharth who might be interested in this.

Please refer:
https://lore.kernel.org/r/20251117113246.1460644-1-s-vadapalli@ti.com/

Regards,
Siddharth.
