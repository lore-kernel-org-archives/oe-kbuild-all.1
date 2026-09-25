Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33864968EE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332594; cv=none; b=gSwrt8Ajd0j1qwl7KM+dfijNhcPtb49rCaFYoHZbI7vkAzeS1uoqpmLVt7bB2PrRiIXX/E9R9EksMhk3xMdWBgHX+zIdiaVeVwSjVoFL3gjc2Ai3ByAo+nT0UcA+6au9Qh/Qufi6wcd0vo2UmzAcVZ8h5QZkcY5l2+88r+MkxpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332594; c=relaxed/simple;
	bh=8rI6Wfg12nxZQ5T5NfRbkoJIAUB0zjG7FNb6vmidHf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=g3AfvSZauPZCiRCxeASvwhX+PMIQsqnNwAuIR3aLLRR/x2gGZTOaNzYXlsilxvWiTlxDoJteDNBxCZACJ/V+eIH6UjuiEzlLppO5q3HUaA4iTcI9pPLtgMPrnBQ5vXNP9GHvkVsnOetb67v7FC7g5Sjd3fOdHaN8A/BteKn6JLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=GgalzomX; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="GgalzomX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1790332584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zwk1pzJqieZDQ/QZPL0n2uzZG3z2uYsFcX/latG2+o=;
	b=GgalzomXRfLn9Jmq/DyWA7rPCgrzSvoM5oASsd+HlvdH2mid28hZK+PnQhOJlDeqOFU0D0
	/PaU8KD8cBTELyCBUE1fXwdzGq/pntS6leMckRN0Wsr54+T5IIFZs+IqDBCxbRRvkFkIfv
	Gk8Xd/hP8v7fN+vhQVn0PzyFkxvUgnQ=
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020074.outbound.protection.outlook.com
 [52.101.186.74]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-70-Rg_97CbbNkeZ12TSS5wzRQ-1; Fri, 25 Sep 2026 12:36:21 +0200
X-MC-Unique: Rg_97CbbNkeZ12TSS5wzRQ-1
X-Mimecast-MFC-AGG-ID: Rg_97CbbNkeZ12TSS5wzRQ_1790332580
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0776.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Fri, 25 Sep 2026 10:36:19 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:36:18 +0000
Date: Fri, 25 Sep 2026 12:36:17 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: kernel test robot <lkp@intel.com>
Cc: Antoine Gouby <antoine.gouby@toradex.com>,
	oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [linux-next:master 8888/10113]
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: linux,cma
 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges',
 'reusable', 'size' were unexpected)
Message-ID: <arZOoXYRMj7Z-6eZ@francesco-nb>
References: <202609251222.vNCTmB8N-lkp@intel.com>
In-Reply-To: <202609251222.vNCTmB8N-lkp@intel.com>
X-ClientProxiedBy: ZR0P278CA0023.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::10) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR0P278MB0776:EE_
X-MS-Office365-Filtering-Correlation-Id: a1783e5f-817f-4531-5303-08df1af0d599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|13003099007|10067099003|56012099006|22082099003|18002099003|3023799007
X-Microsoft-Antispam-Message-Info: eoGmRWndYiqDYZn+hXL01Ex0FmgN/FAIbc8/GEuR1ZF/DUDjxnrDUTeYx+bMMghNkbMjhbabziXhinALGTX8P/aJqxtFTHOAINR3b4u1UmURHx/OViAKByPHa8oua5r5r6slksCBNOcSn4JvpbOEPkTsJunqMEVWGhgewHcFDPDdYg8wvfObO9C1yc71TEykOGmjDsB5IReFgkm7EANtgYUBNndJG28ErBs9Zjt+RpXZtOkyBRfpRxNTfwVxzng7GQ/2l4wMFhD7Nr1O4TYWNyxd8DZ1hDS/FbNxWAGfGdyzcyJ3jMVZcq4cEawIvbrk5xyf/vIP7YSZwHzUbPWPVlkMqnYyOG10c6GVy4r11qyMhS1MyiVDDh5zZWLMz+Mr2WDnDCT9/fN5BwObtBgj9KYS8my6IqCayEmjQLI/gu/KBHL36J2vfaqK5Us6q16tAgMlxf9KNABH6nFJ2m60goGyv2JI4Do3GEDOCvOXZMY8v7rZc4599sBWNwF3tjpIKFP4/M1CNmb4bloJ53iE2WBErmzcwvMkPw7wgU7YQ/BLHle5LfJd81Q0sE4dRDfWW95eiRnsJvTGeZr0kUm+07+AEDyivjvyAr+YEC0KxyBpXobP1SLNOBMWJT9mqN7i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?00A7R7PZnmnC7X1FGzn6ucWjHVubX7VqN7xKCxVKNyCDhsYmcMZ7CUp+c9lE?=
 =?us-ascii?Q?P54FyrUPx8tOkdj/GGDCx61kZy8RKPY5fBCnQG4nGLxA8X8G+MrQ7PmHu/nP?=
 =?us-ascii?Q?CRUwSfHf7fewlafj+Ybwd19W/Xshb1rrqSw0ZSVmXsvcXJG8ZoomXSKabDde?=
 =?us-ascii?Q?grlc8YEPCM0fl32F2Cavf7F9gOWh7hg3oknGk83DaVhbwFo3N4Kdc2qlLsBj?=
 =?us-ascii?Q?neb4W5V1QaHAAiv1HHA/cEgrdmZUwYKB7ZWRgQ/YnqiRar9bzW1fizFxHWLp?=
 =?us-ascii?Q?N18Wh47LWlLIDRrGVVGyf8ow329mdL3WfcK8uFitCCFrU9lzrAtZpbWtcySn?=
 =?us-ascii?Q?iEP6j2e8Kwoggd6L2vCyGxWAo3WZhuMPblPVf0NOJCHdLSsUtvXOVglTjvdq?=
 =?us-ascii?Q?2/OFEiE+DtToBuZL6ZINCcvhOVYM+EKRLMLu0DdGLl+/dHg2leIyW9G3FTEV?=
 =?us-ascii?Q?57fwCh9slqKK/cozJl2zeJHqlpd7dmDishpbXgPACazy8TdGXMmB1e8P/Bmp?=
 =?us-ascii?Q?84GrkQPZ+RHjtiOHoeGQDuZWsdVwu8ja0oMWMwr4ZQYpjJqaPZOvjEb8nHNQ?=
 =?us-ascii?Q?BjCjv+PCEQm+UwCWVlAPwxYATwoOvQJLAHoFOLCtKtX6rB96lhdV/ewG3dCf?=
 =?us-ascii?Q?88mBb/sR8nC+x50eKKGC/PwRJo4lzU3W9DvZ8XPapFriHFQBtSfSm9yIRbjo?=
 =?us-ascii?Q?0bSH3OXpERdD6vFTzJYUpo5yFpOlo1T89ClCR0qK6FBNO6cyFpKSM/KB2YRY?=
 =?us-ascii?Q?lSRo/vzZ1Ychg7tbOHP/a7jTPOf4MF+eOCipnyySkE0TUq0OWvvVXBbvMNBm?=
 =?us-ascii?Q?8fecW6AE37wqTsVL/cq6D0FQazD9N0LVGM/I5leLm3LqVUr8FGXntQWe8Swf?=
 =?us-ascii?Q?6zkhxaok2oofA/d1Zirjo2Y6QXTM0bBcp4fihwx41akh0VhnrxuYhu+ifiCT?=
 =?us-ascii?Q?xkjEkBFa4hkTBTdQKBqcczWBjBHcwNogies0pXcqxH6vE9C2w4IIJ7xzj/Gi?=
 =?us-ascii?Q?mYhFU76jRttVqk71XFfMGqY7mRLYp98m6gumkTCoihKnd0/c0CbY2gsBgrNY?=
 =?us-ascii?Q?QN/GrQP1bbcpH0fbRY8alEUB/el2GtE0uOdVPjt9whui8LsW+IUXERzFOcqP?=
 =?us-ascii?Q?JJedflPn9HEWgU6hPv2C66YEDqdzlKlYRZj955VqJOAQFTtXS8pZ07ocPUyE?=
 =?us-ascii?Q?K4Nzo+Yiafr21RKnl9ufRnZw1gnd2/RgReqymGvs6rxgZ0nZH8RkmTf0Dmji?=
 =?us-ascii?Q?8E/1OFYnQ6dg7dyCnT+BFZUZQ5P+UGeBfErQZlyUM4Ou8LhU0AGI8/FhQicB?=
 =?us-ascii?Q?/7CIVSFTwxdnLEBFrjospqrFc/UsF6juph6XALxQ+f9SQu8dtS8DCq9EKhbN?=
 =?us-ascii?Q?q8H5hf3ednxinvdSRezmKqajngEYNjbFgthrFVEWBB5SSy715/GIjQH0rvKN?=
 =?us-ascii?Q?to9SfPlhgBe4vUkFCk2JxFiCpZ370EVIz4b9VQkTsmZTjctqAI3FxTYwghMQ?=
 =?us-ascii?Q?bF+icYOkO9/G8XGv+1AvJDG4p6Ykp+d3sfuTZafuzG6S5iGQqr/wEPvGPftN?=
 =?us-ascii?Q?DluBP3CIPPvW2TK7+e38OBZasxT1v3QXWAapHMsD1cVjEqhYZgZxnx63sMBM?=
 =?us-ascii?Q?H6crROTEO/cLrWvEyYqtCUjnvay0iuUR/nG86PeMpuUUUfwsNpLX/KQx7eJ0?=
 =?us-ascii?Q?rkZvO6F18S/qT0Rt7ucbs9uMYP6TjXaRAO6rkdMSXiieac9tZlWwvUfYseDI?=
 =?us-ascii?Q?FnTC1CiDMm23BxnzU56N0a0AE7ytDp4=3D?=
X-Exchange-RoutingPolicyChecked: QiTog1ATOMVGx4anVSnnVvO4Qpb+cQgp711ez95v1fPlAhfaBHResnxV6eID8Y+dOrQjk4ahSpKibiAKXOYF3mry3A8jMWsIXovp64frswATNfjrrZs/75KF2cvt5JVSDKV156+rQ19bCq6Sa6bmVVzTj2Yg1L094bWnfupt5G1VjeFZHSk2qaj4+IDa12vj+UClY5HV3Uzig9s9qzHPISICD6GUTd1YrwtQdl9jhpqQV4u/snEFNzYhRQmf82Bz2dEpKEgV6bLg23TSEizdKroVxR9lANMF1W5n2vmBQOR5P8ygmZN//dv5McUDeEBieRkf85zmhRpVTOLfHzlWag==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1783e5f-817f-4531-5303-08df1af0d599
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:36:18.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2vKT3NnHi7fPo7MmtKJV1de7tba6B1p1gUVb2oyh5VmFWfNSvuQtqav6+cgohSdLFnUcsx6yURhOe1xxCpQufadpJFD5T61sJ1PmvoEgb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0776
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qGravYFpLXLlc0MXebJR7L4oEeaU5sVEGMbzV1QkIEY_1790332580
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:27:56PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
> commit: 39be5a7e3ecc08098c039561237499aa595700da [8888/10113] arm64: dts:=
 freescale: Add Toradex OSM iMX95
> config: arm64-randconfig-2403-20260924 (https://download.01.org/0day-ci/a=
rchive/20260925/202609251222.vNCTmB8N-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 15.2.0
> dtschema: 2026.10.dev2+g840a01d41
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260925/202609251222.vNCTmB8N-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609251222.vNCTmB8N-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit=
_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ra=
nges property
>    =09from schema $id: http://devicetree.org/schemas/reserved-memory/shar=
ed-dma-pool.yaml
> >> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: linux,cma (sh=
ared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 're=
usable', 'size' were unexpected)
>    =09from schema $id: http://devicetree.org/schemas/reserved-memory/shar=
ed-dma-pool.yaml
>    =09from schema $id: http://devicetree.org/schemas/reserved-memory/shar=
ed-dma-pool.yaml
> >> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: vdev0buffer@8=
8020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map'=
, 'reg' were unexpected)
>    =09from schema $id: http://devicetree.org/schemas/reserved-memory/shar=
ed-dma-pool.yaml

False positive? Likewise https://lore.kernel.org/all/20260924125039.fieiigw=
4ddgbd3qs@petted/ ?

Francesco

