Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2069.outbound.protection.outlook.com [40.107.6.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381E2D033
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="z5H4ktSa";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="z5H4ktSa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H2VpUna8RhBZvc6+yCHWDXq1JhK1hbL4cKFEdUm0gwPMGC2atIMAKmFtJITFairm4SyXywX0jhtr6aNTiXxM9DzQnz96Q87yLYMJIHrp4VYkhCNCdLJHW2ubqmqrp5jM2kKIRIIyFFU24DXEHFOMiMizx07CfWNts2303ZtVrMCYM2yFa4DYZuczcmXRvYPVgvcHj/cK97zbEj9j0OyEglxneiqGvyW+5FdSCzDfOwcrWX841DrQEGrjdRzUcAP2QlQAidDfDABFaBl8W71KdEWUpPiuwfCXWaTztbboAo8XwS6JPsGgfVdtBgNAc45EaORn5dc5W91P5NFlHiMfWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvfIfHmgmpB9ky5wnbF0MbG67mfX80e5ayKXxcghpqA=;
 b=Nghc4TGc8ROAovzIgUbcrj/beo5PYM8MBwwLbCpMgz1stlxu3Anm8LlgKMmmMpRwbWqmrTvYIO8J3iu9CEMlzFvDXcvSoFiG0PVekQuRS8KfC9nG1vEzJMSoFsk4gsS9DxnNaGhvMpXgMotWFcEeJMoTK5eJh9rmCgSYvKTOevBVl5vy/cIBrBW7jVgJI/9m4HKNr1Sl2gjgsSlF/isDFVmDXBkObfqA+LWWktsLmBzeQVPji/OYXzBkgexVzxkdkbcxx1/8BunHCUQIsfJXwwCJ/0P7bkvdSGl7qHZIRg92BxFyUYhozY7gc2v/6lCodJiDd08dZKC6RYKFle/mOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvfIfHmgmpB9ky5wnbF0MbG67mfX80e5ayKXxcghpqA=;
 b=z5H4ktSaDvMEeFEABLFGsbayBW8h98yaOvIWrUd4EvZ9xYV4+Mhlml0o/Da738FAmpoIjlgankWAPQRBNMSySO2aE//xZfVvjXqEDSskdyMoRwXLYM8wi+8huruyWsNasROVmUuCleClo6vFI+usRrlN48jiaPcAhUkRpSgxqv0=
Received: from AS9PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:20b:465::21)
 by PA4PR08MB7594.eurprd08.prod.outlook.com (2603:10a6:102:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 13:03:14 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:465:cafe::da) by AS9PR06CA0103.outlook.office365.com
 (2603:10a6:20b:465::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Wed, 6 Dec 2023 13:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 13:03:14 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Wed, 06 Dec 2023 13:03:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cf71a8632bdbe35
X-CR-MTA-TID: 64aa7808
Received: from d9939670322c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8AD9C85E-0FD2-4A00-8080-C1C2B90453BD.1;
	Wed, 06 Dec 2023 13:03:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9939670322c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Dec 2023 13:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGRpzL3oyv40HWWDPG0rQGPHRh8djt6ej0Y13VwLXoSjVx+o26hGROoGA0U4CQXYHGeKQJOBgboLjies/Qa8ho7S/wRwF9Yb1ZpnpAdytR+l92L3Id3eYAp3wGeI5qWslCuqxkEM9mXC7mMhV+xQVmzwqFv2SaGwLCJF5Y/vNbMS95hg9o50fo0KTqxe1mYNRW2OZW/J+I34tiOchyfkiHcvuYbb/QqBSCyjry2fzdSgrDmc+UPIuCDd5eivBOHy160G6RoGRK752TEspr17ZzagHcPQdExgu2OuFPiWqGUc8W2/TpK67AI6nilqxCK/Y3B6UmNMptu/HqrTEGk46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvfIfHmgmpB9ky5wnbF0MbG67mfX80e5ayKXxcghpqA=;
 b=cPwhbmFREaUvXzMT5H1oDymoeuyitGl7IO1pwV6zgWfKP3PvdBork4Ce6segyMQhKw0woXNzzlMPa/5ijHpBIyirKeO3cxWYAVth+RQmujXGPPLwp1ybRGLl1kx12MYH7qZ+yH+0Oaxbf505eD8MhD5VGZqRMNqA3LUpLKuz7SKOFSw02UUutYv0ew+lsSDl9G0ykmLuOoG0FX40+qrB3nN+lJzH1gyPXJrUO6arPXrP2vzkrZOGBDwUSmNy2b8D6v8a9oMww9IZwyfzJTW02gx7N1hYs1deOIkDh0GxqAnLkDNKkW98RutvZQG3eyTB5fJA85hJKdLr8GtmBve4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvfIfHmgmpB9ky5wnbF0MbG67mfX80e5ayKXxcghpqA=;
 b=z5H4ktSaDvMEeFEABLFGsbayBW8h98yaOvIWrUd4EvZ9xYV4+Mhlml0o/Da738FAmpoIjlgankWAPQRBNMSySO2aE//xZfVvjXqEDSskdyMoRwXLYM8wi+8huruyWsNasROVmUuCleClo6vFI+usRrlN48jiaPcAhUkRpSgxqv0=
Received: from DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15)
 by PAVPR08MB9460.eurprd08.prod.outlook.com (2603:10a6:102:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 13:03:04 +0000
Received: from DBBPR08MB4538.eurprd08.prod.outlook.com
 ([fe80::4624:7666:7948:2d64]) by DBBPR08MB4538.eurprd08.prod.outlook.com
 ([fe80::4624:7666:7948:2d64%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 13:03:04 +0000
From: Justin He <Justin.He@arm.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph
 Hellwig <hch@lst.de>, nd <nd@arm.com>
Subject: RE: ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited'
 was exported
Thread-Topic: ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited'
 was exported
Thread-Index: AQHaKANWpWdF4JQR30WUOtN4ZSggm7CcN7mA
Date: Wed, 6 Dec 2023 13:03:03 +0000
Message-ID:
 <DBBPR08MB45389EB25B0C89853366E5D2F784A@DBBPR08MB4538.eurprd08.prod.outlook.com>
References: <202312061307.TwC5Kt2r-lkp@intel.com>
In-Reply-To: <202312061307.TwC5Kt2r-lkp@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBBPR08MB4538:EE_|PAVPR08MB9460:EE_|AMS0EPF000001AA:EE_|PA4PR08MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eaf1f74-797d-4f5a-2a81-08dbf65bb4e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kK+ZkX16Lmu3yGpsvsnQVqkTDMSmYaTHYEvw0C6mefWMUjQmZSPSGh8cKixzc5p6F0O5LXxF4+qfyplhHp6JPqDoHoY0y5lUzhh411tGwcnXAi8FjFf2Xy2iuJk3CmYhIYGckYSQccibZVmd4RM+bN4xpX32IBwRZVx1BHUGmccwZQGI1Z0IEGdG85knhUK/ZVw7pqbjjNsbOEPe5cWJyEk6QzUXpkioNKYvq7joJFOAQwMh7ejZnV7/xlusc6lf8WI/dWmAlnMtiB191UmqZH5HT29bQypCUiZv235k0kwwQhmEnR3vTcgKwUD7KYe3PTz5sdEVdNfixm5WbFTsoQ36tN2dXjsOdv9hDNWqJCsmOFPXmA58o/12mBvdL/HGTlxZXSy5bIdqvuZwCC2+3Hg8nyNESkHwK48rW8U0T83mJui2+HLTI9esTPb8/5ZutXzh3YNykGuAnwEj6usoSo0+/LBeicPWFMtMMAdkEWrvl0yGqQcjBg1TXghCXq8uRTrnAmyAeoTfli5FJJYLV5iiSxI5yZunosVN9Vxm+Pwv3lwgWkYWHtGa4/iG4MEI7Xljme4IJwUHcP8GLZ0QncNBIgPCYocLf9W+C+AoZEz3FwjLy3XB1RjkjQyv09MKG/fTUuApSCJ38mMM7P5+tO+x5A5jJYzNjol6Q91Ws1w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4538.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38070700009)(55016003)(316002)(478600001)(7696005)(52536014)(8676002)(53546011)(122000001)(6506007)(71200400001)(26005)(64756008)(4326008)(9686003)(76116006)(54906003)(66446008)(66476007)(66556008)(66946007)(6916009)(83380400001)(8936002)(38100700002)(5660300002)(33656002)(2906002)(86362001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9460
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd34a217-0e08-417b-ef09-08dbf65baeeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHHgWaLVLsm82IyyW1GAczJ2prSaQP5kjiiOd/zbGyEkuqim1HGejST62I8NDOzbzeqosYk995K7eV8hbK12kGCNTnw7AqEY7Hnq1bEf7jxY3M3KIkm1X9uYMFsttZEyKsAOyWn/RBN0iazrxRbeu59TaWgfH0XsIRpBeHZhCGGWSreNyp8zElwkU/75JSvK3hKxBVWF/Cqk24QlzY2eVoRUDjc1SMBp4a7x6SYx0T8Ss6dkOJdhjA/rgOqZjbbO6QuuEiWK0uoSmW9UnKWsCkg11S0zl2R78s+R1xXFPSXr+gjHKHQA9vEBl1CMtZrYNDXzLHSmKF9MzsA4DVCjFBhTQJD450PQkv15PArtsVa89DSHEXYYAlJzvAyBQeOOYVPmScNATTcSFNdO/RsRoGKQr9s0AB/sWSy3I8RIEpeG2YnVn5opyn0SqCA7FmVGO8AyKoo6SrCX1+hDO3SX2zBZ20jxrHGzOYx5ygwWWA6G2TFE/Yp/uNdMkccyjyW4n1e6mWjEhO6RV205kaPZuu5QYkclld0uFFicoyM3fpBGrS/Kxhw9/gfji06+7e5z51khU+pJeDcdEnh7A23NZm32iPkXASf8gcor/5jCOerd20Oz10dpf+ue6RJVt7W+g7ncJBeZH3gggLELoWuFAGNkeVy7+5nAGsHS2raNnySjIaxlhEmnCx6d4PefVD8R61QgyBClKUGWdzjsVUDSzn8Szmdz87CpR4z51DmgoHJQuU/4hOGNx64WgdIgwFTmmTFcBNJHK7CXgjuqEeG7I3qgXlPNaD24G0jsmSpKXoc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(36860700001)(33656002)(2906002)(316002)(54906003)(6862004)(70206006)(70586007)(4326008)(8676002)(55016003)(86362001)(52536014)(8936002)(41300700001)(47076005)(5660300002)(82740400003)(81166007)(356005)(83380400001)(478600001)(40460700003)(26005)(336012)(7696005)(9686003)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 13:03:14.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaf1f74-797d-4f5a-2a81-08dbf65bb4e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7594



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Wednesday, December 6, 2023 1:15 PM
> To: Justin He <Justin.He@arm.com>
> Cc: oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org; Christop=
h
> Hellwig <hch@lst.de>
> Subject: ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited'
> was exported
[...]
> ERROR: modpost: vmlinux: local symbol 'dma_sync_single_for_device' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_cpu' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_device' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_get_sgtable_attrs' was exporte=
d
> ERROR: modpost: vmlinux: local symbol 'dma_can_mmap' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_mmap_attrs' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_get_required_mask' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_alloc_attrs' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_free_attrs' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_alloc_pages' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_free_pages' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_mmap_pages' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_alloc_noncontiguous' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_free_noncontiguous' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_vmap_noncontiguous' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_vunmap_noncontiguous' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_mmap_noncontiguous' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_pci_p2pdma_supported' was
> exported
> ERROR: modpost: vmlinux: local symbol 'dma_set_mask' was exported
> ERROR: modpost: vmlinux: local symbol 'dma_set_coherent_mask' was
> exported
> >> ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited' was
> >> exported
Since the dma_set_mask/ dma_set_coherent_mask was also in the error list, c=
an I
consider it as a false positive warning?

Besides, I followed the reproducing instructions and got:
# nm build_dir/vmlinux |grep dma_addressing_limited
ffffffff81b2a974 r __crc_dma_addressing_limited
ffffffff8008ac36 T dma_addressing_limited
ffffffff81b330b5 r __kstrtab_dma_addressing_limited
ffffffff81b4e5f2 r __kstrtabns_dma_addressing_limited
ffffffff81b0aec0 r __ksymtab_dma_addressing_limited
Seems dma_addressing_limited is not a local symbol, is it?

--
Cheers,
Justin (Jia He)


