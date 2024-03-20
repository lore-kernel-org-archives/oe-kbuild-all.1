Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC152F61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710947546; cv=fail; b=SpMfc/ozXeRz+YccuEtPoehFRKwOM/h5+063JXVMkEwPdJ5ce3ORNZK4VgTxnsTjnYnNLQ0XLi3+MrraDB9NA6ls4aKELHPwV0zJmha4D4fOiH5Ku4NF7Lwi73eRmXPqQ64UXpvPpHv9RLE9GhhWggO53ME0FN+zVyzcMMHCGcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710947546; c=relaxed/simple;
	bh=RogW3gxTKoKWrvL2dncfGUho4cablzQLGriT+H2MtMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BUYjQytGYRQf5AtWq7w+VuhAbpYJyMJSGRA0GHN5dn8/5T9d7gp5YVRtG5z9cKgJbwNgyw2tXZPTWtAx6kEkyLj/e3ELR44HETLeMh0yItiGX6SRXPqHXpknxNhTcV0zDlXrJ2t0PLSxuxGqEHIQ9cQZDnGT9UkHVIqS5sGdID4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LtnDIrc9; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LtnDIrc9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODHiz5L6UZEAPvSq79HGRGr5mzqqvNEwyJ0gmt/BpE+N8hgnUrvAxZljxU9u2D1p+97SMPNMpyYEGDSk9QN67366FSMtlctbJISkXfeDdF+TrIVhXZ/A1KbaxenMOo+p1EJ7ldQrku1lqmzzxxZzvbvNgfBSWApcS4n7MN54o0vCGENeGVScmj6q+XvlOajT0vquPC2TbEgaS8ALUxJ2YWk962gyNB1PqY8FQ7HElZ5q9r+zVLtsY2FEAqRf8ww0B8upEXfn2gETxtgBZH3+iC+WFYCvGA9hm/39YTDs2eiuK0mv4ebTrBLY4FuThyILY6LUoWcUiDxCvv5VdzG1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5OtDwX/C914a0APjtzR8+pAUaZSL0I/AD94hZpxEjA=;
 b=gTbQGHAMBJ2envVdIGULMTpLbfSgmbht1/fRIPT0B5xxplLBFLyIUYDb0uKzC626HP5L8D/B/apt5qFCb7H5VPw0d4pIIuUb6qs0e6lMv9QokLbu76RnX5xszNj4qhWVaxlpe80S5vKZ25QYXO8IzrNNdRW2wcB17AiuAXpOx00knfU3i6Ct//iAabL3WuWm37AlWJr1ISniq+NywEyxls/9qJLhiA5mznmzHX3VHRgwxk+E6WN/I/2MD0uXuiiB0UrOhiKnfL4Peo8B7R+TxnRAkYR46RIKX/wcRsrAZx3loV8EosokxIfipFY4MV+VX2+xLI78EPUYC1Q0r2c9UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5OtDwX/C914a0APjtzR8+pAUaZSL0I/AD94hZpxEjA=;
 b=LtnDIrc9cgOQWjXJNVkLptBOtqpcjywqY0i93Ilo7WT2H2zzQKKH/zF1QSZHiy3Bw7tdiKRCPUJ0er356xc97+zYpvyrG40+BiI7w1zkpU2++AwBAKsQG7+BW31NFnx9URwhhTySXEAPkqc6sSJffccohXxKzfH7eRh/QjoeZe07YhCVcl24E2O6sLIictEdy9/r74TUMMHYeDSITeRcg8sV251psMLBtfkN+h1nw++EpfiHhsxNwKMlbXN+bK06iSHjDazsD2DXymg+b+ww75RnWNPITmxlPlGctne94mODNZJ+D9etiJD6dmwTOIdMPZ/ie9NQ94g4OY8VG9wZ+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.34; Wed, 20 Mar 2024 15:12:21 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7386.031; Wed, 20 Mar 2024
 15:12:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 26/52] mm/internal.h:1117:30: error:
 'struct mem_cgroup' has no member named 'deferred_split_queue'
Date: Wed, 20 Mar 2024 11:12:19 -0400
X-Mailer: MailMate (1.14r6018)
Message-ID: <9A8427A3-B921-4E27-A77A-F8321A920843@nvidia.com>
In-Reply-To: <202403202244.AgXvkIgR-lkp@intel.com>
References: <202403202244.AgXvkIgR-lkp@intel.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_E0B0B7E8-592E-4760-9B78-D74464912B52_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::15) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 96293072-7bfe-429c-038c-08dc48f02415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2dT8VofCCaU5i6Yih8UywoI/olKAfJ2e0FyyigxtIk+BJY7m3+nVRT6WsilyIcnBzXn23yACwEJCLYSbumEc/jBsp71pvLUwhTk7BU+o10Wxv9trGaQDlBsojKXbCUuQ5xk+6vjUo6asVFI36657Y1L/S1qDnc/7CrXBpkeBq4IlGZNH/H8i6Y/CE3jtlwIRdT5Fq7GELWmTlXjlssFQeKTyBCiNKnT03YCWTaZNhD4ZZb+TymVnmtrIICEJnvuXcX3DiDTyX67Gw1ndVJn8vrGevnbKAfKPe/ICnfzskvXorMgoz6jRH5lPeOjgvERR4cx/upNREDMnhc3aKwfk6w/QyiiIvE0wa6JsrzbdNyesQBYkvsk/rNvwT2H0F9AXzTtoK6tS7Oy3VWwUW+1HAWZKzEKx9Ac07ieJFD4O824gloPKBSFsVE2/ne6XirS89x45Aeod4r/PSF3k5eDovhI2BPd6LFBQKkk8YGES9DG+nY5Cfd2B4rcBb3PIGSByXg7DNrgWQdvOGZPDcIdbGWNx/jZTNOwTyZ9TVbkyMWVrd1rOIqFYptJH43P5zFxNyhJDshdKbjA0gD58pJMvK+t+8hV6wUZVqReWeI/qJjKr173JRGm7AwQapncP3K2ZiiCiKt+zYM13xf0pX+fGg7TkHbk203TVHExN+Jf1W/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WJPw/MRiZ+V4PmWWIbtnGop3mi4MgieR6n9crlgCiWyYd6jTHRYstsU2u5GS?=
 =?us-ascii?Q?v4hQVSq0QIv/2miO7kH3VvdxqEdZi54fnOPliEZGZNOs2pgpUHm6qc+08gnb?=
 =?us-ascii?Q?+lUGAdQ3r2dkGImAqJTsdpA2yLmoxuL2ErFWeE0CyB8tRt+26bzFrB7/TiA9?=
 =?us-ascii?Q?UAs/UeCcbl4/HtSspSs6uXCSbsKhDfbhY+bc1Vy6Pf+vcJdnjGkFQO/+gW5v?=
 =?us-ascii?Q?DrlkrlDB+zcec59WBgnbe/+Y53ferdyvg539Ah9kjvuxSn3Eb8jEdlOHmOcI?=
 =?us-ascii?Q?fPKb1Kp5aSK/dsLDCVexSltclCRKwgsTwf8RVItuszxgLSWcJH0AGgr/VXaJ?=
 =?us-ascii?Q?38U6nwAxTrdjI7pU3a2mkUmqi6+N6I+vOTVDLXlIT+M+NFWgHqq6ft7Z0xcU?=
 =?us-ascii?Q?V/Jhsup7JT/v6DUMx05cAszJQt/5YH0g/PYjHJcC2SP8b0TjjLw/Aj/hciiq?=
 =?us-ascii?Q?SInPyCQZQYeHCupZ7Zcqkjw5/2xENBz34KprkgScqO9XOfcwU6VvhIaKOnnc?=
 =?us-ascii?Q?mbEX8ZxYcGwFz01eSAHMBSInaft5d23TpapswzuHGTygRabA8tGkewKJfLUe?=
 =?us-ascii?Q?k8eXTB7mAFuezRcjzo1czb4gYtjzkHsKnNi+wMYw7kUsQ68Jx36UsZoezU++?=
 =?us-ascii?Q?g4FNFftO/JsS2hCGfJLMM/O3XT2HMbmV4tT7OICrfnHf+YN6AFFa09if0LIf?=
 =?us-ascii?Q?8g5T9KFqHnjx7un9ceCxoe62EBNk0T8uoK9Kr5T4BBri0+s6oLwmj+PHmUyj?=
 =?us-ascii?Q?LALbyUopeIMoyS71HOjA3lk2NanAV8cl2LhvPnrlXPECrZg4vz3+L+mUOtHr?=
 =?us-ascii?Q?VudOksveAMZn/8Dl3ZBAlCbvkEwUAqAeLML4rVtj7NSWEsP7ZCAFG6tvWhDl?=
 =?us-ascii?Q?I/cq1V7CkUjSw4AjNPAqI9u0Nl90tkO7GVjKeUczjekxMWmEn+XJHHo5jsa1?=
 =?us-ascii?Q?nOA5UBuY4smJo8lIRUkKobkvsp9KVKMprHFad6Afclt3czZ/kGEwOoTa4Bp5?=
 =?us-ascii?Q?us8PbZcv/fngcLF1jZdNAVI7I1IuR3T6aqrV8HPizeyWqk0/KJJWwWEV7fml?=
 =?us-ascii?Q?G79RWReIGcJQrBDnjS8oIT1AR+oVcC7E3dpgxwiFtWkRVzRreb35b+EF/meq?=
 =?us-ascii?Q?+73GaATo1VfLkCCKaBrWGr0pUzywoK7QvsOO+GycKckrryj9tC2bU6b4IcwS?=
 =?us-ascii?Q?uftHorospZYF9srWBkU3ulcrxxO5Uezuji4C4rGuw4ZrBI+0ZMbZSvXQXK69?=
 =?us-ascii?Q?m0uPz/z3CsUHB4E4aQkIFQc4W09VvZKXzwQQa97z9zvnUQemDWuvKn8V8xhD?=
 =?us-ascii?Q?CtmW3Jqn4GbP70mlqWVk4Lzm8uHlppYlN93UcgVO3J+BJFKK/zhZjPKTUUbt?=
 =?us-ascii?Q?X1Pa+GZamCFAP71LOmUIZYUzGiYiOpWMp+0MFwF2nql8RuVmz1EUsPVj2hnF?=
 =?us-ascii?Q?8hFQGafhZG6M5kljmwsm9Erv4OGLGl1CCfKJmaafwHRVF1DfCUzxnQcQDXfG?=
 =?us-ascii?Q?Lu2wLQ6bJw6byYbjFtbg8Nv4vY7mDkOtpk08zN+MCZo8VoxmV/SEe0XDdffa?=
 =?us-ascii?Q?LPg6AbYCx8RqH+WIxz0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96293072-7bfe-429c-038c-08dc48f02415
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 15:12:21.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIO/1KRzdObltwd4vDRKFNHXBsdzPS9GsqecKaihfE9lWbCVkyqdBEDflxNKyaH1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136

--=_MailMate_E0B0B7E8-592E-4760-9B78-D74464912B52_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 20 Mar 2024, at 11:09, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> head:   a824831a082f1d8f9b51a4c0598e633d38555fcf
> commit: 1166721383f8962e2c6c388b2adc7c6f1e9901d5 [26/52] mm/migrate: sp=
lit source folio if it is on deferred split list
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/2024=
0320/202403202244.AgXvkIgR-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240320/202403202244.AgXvkIgR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403202244.AgXvkIgR-l=
kp@intel.com/
>
Thanks for the report. A new version[1] fixes the issue.

[1] https://lore.kernel.org/linux-mm/20240320014511.306128-1-zi.yan@sent.=
com/

--
Best Regards,
Yan, Zi

--=_MailMate_E0B0B7E8-592E-4760-9B78-D74464912B52_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmX6/NMPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUy/sQAKBzwnPlegBwr44SwuYuNvMKpMPZ6lYDNPxw
P9CdBpjeJckv2quV3U4tLUajH/fU+Gfs7EHn2Py9sSHFM8OSghMjp14p+CE9jWrS
e5ktrE9nrye9zdixQhLu6zfN5sOiG9/TI82kytuyERB9cOj0LsNrI101oJQhKKFX
cJAA4bRx94KysLctG7wyMXxhv3cR5ESErl2eH/x6ewmAzHxwDE2gSUqMBIQbDm+U
4E8yrlIXmZyBJSNAL3nqZOkx408Yf3QenQdD6TDiTC6S2w8+xn8Hwt92/9yTAw/k
cAzpZUMrkQP/h+Vtsj4V2+ijJI/btdM5loU91SHlhX45P5O88lrIXPcBKvYp9Q6A
BDFVvQwSsQQOrjlkcoeZvjWPCVUrRhM1vA75FGPU2cPFIje6wsLzPSMdUIjvz65g
a3G/z7k9wwH7t8rVwk+nXVpqmSlH5F1DRMKspjjHdTlLOcuSBDO1c6D2WKPfjFJ7
bzjO1L0TCfzbmq5maAtsI2QlYygAiDmINItN4qmdHMuNQOK6zqMCzD9OFivt4JEw
SDgEAq+jLXh2e5B2iZzGRCIWEJZhCDz3RrW7864g08hb8ggCLOlrPaefwOr9qTgG
AAZODJCXdGpOa/A5xqRRkghM5cI72EROAB07dhhT+kbnx6qngmJEpt7oSjFm1TyQ
eeY1c2f0
=Nzz+
-----END PGP SIGNATURE-----

--=_MailMate_E0B0B7E8-592E-4760-9B78-D74464912B52_=--
