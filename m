Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023109.outbound.protection.outlook.com [40.93.201.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4844A27F195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954541; cv=fail; b=Ffls15Ig0rkykJf5A9XBF62Mdj5YWAUYpOEjw7cAk1M2j0dgwkjC0kaJlK9G59DdFxbhsKdi0JSHKv7fLcdFoXFKjtyzmUNI75Ss6BCAy4VZ/Px95A1EBjDqvMLmLbXIJjybwVT0a+wfkRsGe2WujGHkpdHhRJKA48jaWfkoljk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954541; c=relaxed/simple;
	bh=rlvYcsYnLZ6cOELKvpqkkNxz5oQVMz/lBCqzBCj+7pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UQzf1eRweDHm4KFKO5ttVSRtRIoTy2qmkxYXvxIXAJUGWbr7UIcPO0/AsWLsCupnp1bIdF/AbmtYGMWmhoObDfXpRpY/NVT4TsIrxA55sJK5i29zju4u5W0Yihjywx0lnMyFwk8UIhUDLTq/Bgw0Yg6Op8lOyHpIfsPcFiZ2lTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=W3gXMW5M; arc=fail smtp.client-ip=40.93.201.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="W3gXMW5M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8/A6QU8tfHtsqEf8cLvkVevpYS0UnKs2syKpaEhqen8UYU5sqjfZGao72TqBfhGXqel0ONsG62q63ECgPGl1SIYF3wa/Qvk6ASxl8Gi9zNAkwq87MvguT+jfX2jfnclHrRCRi3h6PX5aDxFomHvJGwquvNJPgf8fK3KjHGnfvM+5z4a4KbSNMgIPM8OPk5wNPQmFkB5JhsCSh6kKZFT6gCLFnyP9oud1k5oFgERU1UjzXYTJ0k0qijBhDfRhxau4UTNHkgoygegwKpy/lBgMBurAgB77MPb8TY88f0ru6bMAYNmJe1ZTwPOD56XW0dzsfDrf31q+aPjWp4i1+JAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4TJg5B4Dfvi+aO9xkyYLKZS0IVO+SHqQ64ofx90erA=;
 b=psh9PIEYd+ZXj/qON+RBpnLvxmbEceLnsWyXZ42p2P+8pDSADaNZ6RJucCEe2M182npVgbQ3xZ7eOqpirqjclAow8M3eNvfeSJsDenTH1W9AuCy/RKKPAhKbOjUCvhfu0fyQ3x1CVt4fK9BrWAR2+0+RYeYpqYIrx2ISteIHfLRnPTci6xOREq5sRwKRTxvdc1FAdjGMZz0ZB7xP+FR72LERLc2wHVmqSdZ+u2Zzr0LRF70isVXFdtgubW8RkbvwcDKtruD+7VpAwindNFKH6wAGgiuRvPIL+ELjh3p1lg8u1UbE4InyuRjrIFq2n3qpFx8whpxWrz884shyUQQTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4TJg5B4Dfvi+aO9xkyYLKZS0IVO+SHqQ64ofx90erA=;
 b=W3gXMW5MPGGdsic/53Exs2p4eeC7ICY9Q3EyT8jo9wHqYgKSR1nOcHpnjmQx0X+7dtWqnqNEWYdbc2Zu/EHZRCHffXqUDDpVSudJXqsE7wMr1ufHjpAVT1ktWuz4MkY2hw49DWjfIHlEG3/vcsIBhsWZhL0NfP4OFGI+vEXrhKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hammerspace.com;
Received: from DM8PR13MB5239.namprd13.prod.outlook.com (2603:10b6:5:314::5) by
 BY5PR13MB4421.namprd13.prod.outlook.com (2603:10b6:a03:1dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:35:36 +0000
Received: from DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3]) by DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:35:36 +0000
From: Benjamin Coddington <bcodding@hammerspace.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: Re: [cel:nfsd-testing 29/69] ERROR: modpost: "__crypto_memneq"
 [fs/nfsd/nfsd.ko] undefined!
Date: Tue, 24 Feb 2026 12:35:32 -0500
X-Mailer: MailMate (2.0r6272)
Message-ID: <E960A26C-F3A8-438E-BD28-AB5C29FA4EC2@hammerspace.com>
In-Reply-To: <202602250104.IwFsHK6w-lkp@intel.com>
References: <202602250104.IwFsHK6w-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To DM8PR13MB5239.namprd13.prod.outlook.com
 (2603:10b6:5:314::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR13MB5239:EE_|BY5PR13MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: e1778a3e-50ff-4dab-bb62-08de73cb1e66
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1eDFiPkgsYqm69zpZlcTq2c5TCAICSUXnSCYLlfsWkDxfVS4TWYfJ3RXQe/O?=
 =?us-ascii?Q?QSl0fhOK5GZyCtW2U//MFACtFKSkySFBLV8fzTZ8sGrO7QdFWUZxLGtiqIzm?=
 =?us-ascii?Q?AqETmJf8cFuBe34CiCLwI9wcptVbhcX8JiFcJOzI0wdq0cVV2W0T8ew9lhLX?=
 =?us-ascii?Q?BVmqSShZA7uZMCt2plcBkiAmjq469+Sli2Vggn0UGV1Jh/k0AAkgcFM4cn0T?=
 =?us-ascii?Q?4f2FBwEsLnrREDYWjOH/nya+eALtD9MDXGexCVCrPl1Tj2lI/rIeYVhMCnjb?=
 =?us-ascii?Q?dJ2NC/f+9r4roflwybQ5oZ5ITGAIJhnzz+PuuMe30VS7/py1KoUJEO7xafG5?=
 =?us-ascii?Q?5pKaZ494EQdxtshVmiyEtjudDZ3KkyIoN181wgFuKV8MdY/IOJJqqklZqzmD?=
 =?us-ascii?Q?X+r3Fu4kM6QXIhZEkBx47aUSf47z2f9TONAenId6fs5gnaFmzAfTgWCDlueI?=
 =?us-ascii?Q?mhTrIJQ/32YMZ5rJIhW0a9a4H71NQbsAc0VjuHZm7ZK7JISENzw6pVNCV5xy?=
 =?us-ascii?Q?qPIDPwurwFkie8RoZSWNG7puxdGvQ56MZH0WrRHt/WbgO2vP0uzeRYoH/Wuz?=
 =?us-ascii?Q?X5yKiZacUeA0Zmh5003IARxSx3PGTI8bxuk3rhCUYD8nI3np1eqBwKaR5VMc?=
 =?us-ascii?Q?Pk+mxzlFxHpyldv0mY6xUsDrMlP305tvtTMX6XUmUmT9Pr5RXBXD9Dyxua3G?=
 =?us-ascii?Q?a+GdwpXEXbHJPq8zhR3Oo8Cfi+sdr/nfJFNfaE8LqOTXYlXvWdInm8FfLgDm?=
 =?us-ascii?Q?x078bDLgC5qtOI2ASgKw0lyViOcVZL+RNQoaASPWMJs5JPTOdNekPJLcYBLr?=
 =?us-ascii?Q?+WUiGlwrux1b8Qzxz3rP7kf7NwdWtcnARFL24wGpauyANa1RodzdYt2WqSZc?=
 =?us-ascii?Q?kQvmUTNYxlySBWf5Ad6W6DyJflq45B10VS2dCLgu2u4Zl5p8xY6Mska+/2au?=
 =?us-ascii?Q?zBrIXyhHucoQuSC3m+LXsz5u8zTSG/4tB95S6GhCERop60dxlV/n9dJ5qMGi?=
 =?us-ascii?Q?qdpniTQvUOXdHvvaXDrL9dMobwbWK1mAgz3VA/9ChL7vxn7Gmf4FagSHAsZM?=
 =?us-ascii?Q?KurSMjhF/nZDPwc0+4uqir44I499Z6Si9KHnkgT8kNtB5Lihh0SMqOg6fAoB?=
 =?us-ascii?Q?FGS3QdvopyMtHW5PKB8DORM+LK4rOEYlvlB5pSEnJdPyFj9iWYqcrKCDcyLD?=
 =?us-ascii?Q?QLYGoWbl25nAOsZeuC5iGn8sIFrR5c+vylBrmOKB5UUAbWSfc+lXBJmy2u0t?=
 =?us-ascii?Q?4W1CeOSfRsXIH6sI6c3g/t4Bhdo3JmFXJAzviBORNi6VGMiVAdqFKCK0+rOH?=
 =?us-ascii?Q?VK1B8EGmQAvPwszsFhv3QTnWTQfJAEDpTRUcyyiQkj6c0wSdaZK+LFcG92Tg?=
 =?us-ascii?Q?tzr36+HNC8KhhhnP8CmkrJ5l0VlyvVnVGNTqF8a6LWyraKnzpNjerGYo+hf9?=
 =?us-ascii?Q?vRWMqhVulZtcD/0k1hhGooT23iNq5wfHd2Jes/utQNpAA3EKy3PJdTuQEWSV?=
 =?us-ascii?Q?Ja5xDP+QBhfUk4wEL7fE3VcMb8hw0ZljK3jUWaBvByz+v/DSFEDUb6nglXg4?=
 =?us-ascii?Q?0Y03nDAdvr18RHSFaEk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR13MB5239.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QsvjjM07puh/T08Pv+VS8NfWLE3HL6hYx2Ca422Z1IpM0RaHmwmFIL0ntrzJ?=
 =?us-ascii?Q?zkDpymC2hTAZ/YF4TwzASIJCqQuN/wRqQSLXzsVOMuNfKpKK1Bm1TybsALwn?=
 =?us-ascii?Q?LBfOFPjjxaPO7Jh9Rzkbw6QGA34Y7rAn/winCPJkpHqaJy0ktgRK9Z69Khsq?=
 =?us-ascii?Q?VzP6kwuzpFc/ZjdNOGDTRxs54eok2qTmtTh6GhcrUGv5SWQQBxqlVNrcBTd/?=
 =?us-ascii?Q?cWusHQ9I6af0z6dHaXleBfpXM0hmj066LNpoHKZyejIL4j1owVKfNzPPmVQd?=
 =?us-ascii?Q?ytb7iAz65sm9HtNIWgvOq8Ee0kHxC0+Zw/ReMLOPHFUMnEUgMCXOFb7Q3UvM?=
 =?us-ascii?Q?cV0eAARjOScq3Rg9QGSohr9txac1UZZTnisWgJ/klVnwa3bE4wzjxuLQf6KM?=
 =?us-ascii?Q?6Km+9I5E4df+AZCJah2mYClJoqdB7pG1n1J30LYGU48tngUOgxwt+2cKjGI9?=
 =?us-ascii?Q?q4PEDD6sG0wBwyCempAkDEvcRny7Gtj7KDxiqDH9hVlRLyPofK3lAKLxSrbJ?=
 =?us-ascii?Q?y0j/dF/Bj3RAmWPAtUcaW+wfpNi1knhwnBzea/0c22cbLbLavl0mVxMi8Ejh?=
 =?us-ascii?Q?osWg9IWs4CcXhSkEQEiPqN4RHWV7rBD+a9B0shRhH/jPeQA0pEZm0Sj7/M9O?=
 =?us-ascii?Q?1QZ9UOkaFz5rLAIAgO1nx6B4JPjEYTHSk73V4XqK9VFkmtl3fhPkp3Hxw7+N?=
 =?us-ascii?Q?gseE0Y3mGDb2cvsxwGAL8dahlJjKsSpQLSrishiduXydAOYFeoVxE5WGFWY5?=
 =?us-ascii?Q?1gMrKSyAXDl/p2IZzlRuUKmlU2HxwuQlRS1e6qe/RR0FnNKE9U/YFfE1VFl8?=
 =?us-ascii?Q?G2Ws1uMbaAG5oFag4hm5GGWls5WZ2O2G25305V7xAfjXtn8B92XtOTq/ZvWc?=
 =?us-ascii?Q?9rRvOe4yl5NvdaUChNJQ3EOtzLX5o5xc/S6zgh9gga4Y1V2XTNq6cMg7Jehg?=
 =?us-ascii?Q?pZuwJyquvSS71A1IEhNplyYIH1C/mXbXIoTubOR5Wf9aSkDfjNKOBpNqsEAh?=
 =?us-ascii?Q?gkCv9ydjj1BPtt1huhyD8iMl6QP4xyRXSmlBasupQjZGjIBliKmO6x08CbHv?=
 =?us-ascii?Q?xfYJtzY5uqzA3f1yDej2ouJR7tFtA125Jko9NUyXPVwLINipA4hVwJjucQlw?=
 =?us-ascii?Q?mV90UzicZhmm0pC2u+wKLtIuHvzIA45LsWRwKAmCa1aLCCZbNpXDd1itPNzW?=
 =?us-ascii?Q?0kmG7AkDELWbIgK/Ez73yrGrdpefjydlvXF4Gc/p4w2gKT29s4UMojafIRME?=
 =?us-ascii?Q?grKsUyNVP0rffpNMkugyngbKe2OzMJFdNcAnmRUspdtSeLElRwv0/Ir8GdzW?=
 =?us-ascii?Q?dsixatb9QbRuYw0SNCZg34v/7o8+Ps6JoV9inJPptouE6+NL2L7ZkM0Yg+cT?=
 =?us-ascii?Q?gjSVfSvRkRRRVP+Snkh96UPTlpxs6QZYNV6voOgqevXqKyf/M7gwh1e3DbHs?=
 =?us-ascii?Q?fJR2B1ftvLBIk+1qD3T26KuIq031SCwi34TZG3AfHebBYjNh8vS1psbBQQ8p?=
 =?us-ascii?Q?FCSBXSCludsvvHRalBcjtfrtPtZMNDHIX7E2H8eX5McokWOxH/AM1lc1M3rh?=
 =?us-ascii?Q?m/rCgITgLZtz3XE9uLdzsSDQ6EQLIIAqCTVPzN6A4CVmbnBLydjnArR0Ga7F?=
 =?us-ascii?Q?G1rumGxYeoGToxeFqynd7gp0D7dk6CLVlXuS9oLYrAk04gCaPho9ctCL1VCf?=
 =?us-ascii?Q?P/t/biNuwbs+WPPfNkudZIpc1bJa8EcIkbpqv0XTViZlr/JPVC7ehgDD+WS7?=
 =?us-ascii?Q?QlMQykOtzo63AQrJpW2f6j8nz5azqkM=3D?=
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1778a3e-50ff-4dab-bb62-08de73cb1e66
X-MS-Exchange-CrossTenant-AuthSource: DM8PR13MB5239.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:35:36.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAkRXnbCb/k0CvxsGjfms9qKzODTKOzSjdhPBi1wc3fjkGDcXSWvoCj+uhN3QzotTBspHHll/+anggm3+EKvQSoPYTN2xLsifPzLhvWjnMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4421

On 24 Feb 2026, at 12:20, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-=
testing
> head:   70a2007855af80c48aa0cc86ad2a1c50b907e37b
> commit: 35a0423a2954050da493296010d5c57e0d76f8bb [29/69] NFSD: Sign fil=
ehandles
> config: sh-landisk_defconfig (https://download.01.org/0day-ci/archive/2=
0260225/202602250104.IwFsHK6w-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260225/202602250104.IwFsHK6w-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250104.IwFsHK6w-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__crypto_memneq" [fs/nfsd/nfsd.ko] undefined!
>
> -- =

> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Probably because:
# CONFIG_CRYPTO is not set

=2E. which means CRYPTO_LIB_UTILS is not set, which would compile __crypt=
o_memneq.

Several parts of NFS won't work without crypto - should we just set up th=
e Kconfig dependencies?

Ben
