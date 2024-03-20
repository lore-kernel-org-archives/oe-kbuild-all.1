Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DD40866
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946952; cv=fail; b=LTyaQLIj2232DiXejRUxKTTni9zZ6vB25kpNosgslRgzK0lgnSwNqGF44Ozuk0WKQNEBrnxxKlebMxqZgTglCRb8n5ddY9/Tqg8powyyOtfgphY1yaDWQTqQMOYl358NjBgufP1Xt7FMhjADgePeKJRH0fHD0RdYREzigAB5gtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946952; c=relaxed/simple;
	bh=SKcDVwz5I7PEjPEalDW+fOoDLtUkSRwJMauZzXYCN4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E89Xk+77adyzvtz30JM5KJKXS1sWl1AAmAdG7JAKwGA4tP5/3CUygVspdqiqT6zJVm6c08aJv/NsCAv5KOT0RVDOd8Juo8u5lP9zEd0MrYsR+jTIGXnta95pXNnu19061UKc8yFLq18+8rUBxp9W1tlc76JgXgvUH3sWZiDEzrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XWIu1AD8; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XWIu1AD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/6h/wBqNzTnGSzOkgUl6JpAxQm3OazfTjBJ/Afg2ZR2+fwsoZNVnwanlRAsapxbNXOmIFtN3lZCnPevwSszEtaUsFEs1hMg2TrAjVuKRCTxSpzi5tuMPND5mFmhsqydLhrcv87gTtZLfwURWU/x35voSlNw9d59yBdSGokdmSsYWAQxIjFOwnGU68TOtTBeS3eGlNutV5VCAnHjvd4+w5z2ihn/uCEVhOGIzSY+E3eGnK5c+ra0t+qc6wqlVP2Ss2IOf4T8b32o8/n0h2qfZqvXHpjToDvp3hm6MSrbbtEV6H1ElP5IRcn+cCRH0nVxzCSUMgweNe62rk++PgaH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wPi61gMDxJ3LYpG8LKuJoT+72soZOP36X6C6dy2Ubc=;
 b=ZcTrkE4+eAbQNIPvzCHGJvMWHQmnR0NX/vZKfyF6ND9SYWvFELtNFJ1W8yGX+dEF0yYn8VZA6NwjYVtN0kx2v/kw2wJ+7Q6/XYOjpIBP2gqrnCRvFjhzpSO/RYksiebTHU9YXx58DisB9muWDpyDJbD7oJHVcilDXPPYU2Kz2slzquSoB1rf+4u1Byj8uDljO8CBqm4imp1H/nnh8I87AYBCZFAfwjt53DFxPYLjR+sMlChG8ZbY0xwr4JDVu2w+Z2/ZWSIfLgBqEjrGdo3dcTPw32WATebyq9CveNXXiGtIvokFvUGYI9ONb7xFVCroWA/+CN33BizTSi/BulmhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wPi61gMDxJ3LYpG8LKuJoT+72soZOP36X6C6dy2Ubc=;
 b=XWIu1AD8LMicRD/FWddlWLIHRtKpaLdhcVeEThwgjcyJBFnlV5nwFjU3Zmwn87kzqhv8JO8F766WYXN7bNmxHaJBKRgB7cxZwB9qllDp20T5uQyrlkoLXEF0rDgaQNoj0ORu/Gv6Uq45oJ7JwVsaLX9kr123HQnwqhllmcOQtGLbJfmWJQ3TZQwXWYdbgJ0c2exLXEDH3z0/Ij+vqs+aJSSPtuO/JKTsmFTpTMzYr1M4Y6iWrkSVtTt/r1Szs5ezxtQGgsognCywhKiIsBSpxjQzaGCOM0tv0e54vR9CLOUt3lE3xlspHVXJq4RtA1vwm8A8HXiy3M4fdrlfiVOe4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.34; Wed, 20 Mar 2024 15:02:24 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7386.031; Wed, 20 Mar 2024
 15:02:24 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 26/52] mm/internal.h:1127:22: error:
 'struct pglist_data' has no member named 'deferred_split_queue'
Date: Wed, 20 Mar 2024 11:02:21 -0400
X-Mailer: MailMate (1.14r6018)
Message-ID: <99747CA0-7885-4E96-95B5-F371528E7A84@nvidia.com>
In-Reply-To: <202403202222.mfp1LH04-lkp@intel.com>
References: <202403202222.mfp1LH04-lkp@intel.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_CDEAA9B7-91C6-4BE8-BC4E-165B838C2D3D_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR20CA0051.namprd20.prod.outlook.com
 (2603:10b6:208:235::20) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a7c3ba-54e4-4688-4eda-08dc48eebfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTNUNLgP5WC3oOa/AaZFqNgnnhwcIA9ZZTkqkJbts//0TwmtEa9LtOvV+Bb+3efy53pNkIuRcCcT7ltN77+RdhGYmA6U97mKZcG2HeoKoqXWtIkaa42oBfrBQUmB0kEcfsUXEzcFJ17SbSDm5TjRdGhQ65QnYFx60TJFP/rBZ1vi8Ssjs8Ry8PMowtTfcX9+g+aSVEttKqDbRYvEu8LpNZG4560M6IwCX0GmrRSixzNy5y9zfDAggpb7/N9FoxZzdJidH3Qal5SslPUkyNWfDcb9Gyo1JSP1IJsoP5LNkmf8fb6XLRzwJCUOiYD60CDP/zvYyllDj8aqQRKn56jMOcs/jb5edcXaigb7bH9teXcO6AMwXIu73jh0nWRCHeJqVvfTKXA3LEpDjJPsYfJj393+/5UDdYtAva486ZAKMg8F1vA+YL5s62bLWAImZHL2uH9JbeBZpz4Hm8FTcHnCK98W++p2+kP7h1ikw272OFV12b8/63fwhxk5wkzWE6JiEOkFz/4xRDuCet8QAvcVLUDNuEzH7ysilyYjGL0oLBg6XPpMOx9U58+xQlBvace9pGokxkqFp/Id196Ob4ZaFBWzoLtY3m1RGCRIGnncEoutweP/jY08AaLOxy/0o2QIh6x24zh5g9wRKqIVCO8yeWaRUl7vX3iXa4aKJzREhYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mMKV1z2cJDzdKcRTzKfJaNZ098wbcKEsY4YW/adS9m4/URA4Tmhk0E69O5eB?=
 =?us-ascii?Q?5Hj3gXgkkRoC+4xOiIOr0r+5pBQYwSGb2MBfH+h0DtBHB+Y1OfVriB8obhZX?=
 =?us-ascii?Q?cOlK4k6nEDJPAjStSCwFnEkjFQdTdnoCG86H0N4AqpbZOlnLzf61tHW1QH3L?=
 =?us-ascii?Q?9MMJSUAPYQuRNdmT+vicZUEYUccJhthADCb9jE3hC1DcNqhuCOjplCcor1CI?=
 =?us-ascii?Q?Hwm/MP61RWe4ATni+OzDOo/r75/+n3/bHIrVoauUJUnN/rYuZFp3O4OUQNa/?=
 =?us-ascii?Q?pEHx6pZ1T2HfKFN50ZnQvyl0IJy1yL6LHsqPt2NFZ4ngnIPnfQ4Iz/FWDqVx?=
 =?us-ascii?Q?+RxRoCDLAH/AeTy4cJEMKbFPKTUByORM4qOqarK/IL0iDN6XnShjlePw/E3U?=
 =?us-ascii?Q?qGPvsXnFeJLwOoCPEDtfMhw7SFTYwY7+W/D71TxzS7Lu4SHg8LICnQYiGpU9?=
 =?us-ascii?Q?yNymM9WuashSlUVcjGeLbn/w5v+KLgZcYD4kr9MNEBeKNd0x2SeBx3Dhz0pi?=
 =?us-ascii?Q?FnRMx89YoAFyZ6ot0O5lgxZZyEXVgLtJ953hT8Hqy2wLuALOpw54rv5J4PRl?=
 =?us-ascii?Q?VI+bEUDqQwDXGbXVizNOpPZu7ryFyjXBRaX8MDlya4pO4apwboXeAx4+yPrN?=
 =?us-ascii?Q?CDnMAAxYPvwkZb1oCNb2z6a69NsyF630RhV1siT8BY6on5/fcT7yjj/y0cTY?=
 =?us-ascii?Q?aLW1DA9LbnhIKSUVEhsk9dptZ41VvOYXjJT4DqWg0evvSVUbDYMeVl2V44uN?=
 =?us-ascii?Q?47UC/BphBxVmPymYyOQALdIP/MHjZZnZV6r2Rn5NiOLHQPZjyvZ5xVTTmIxL?=
 =?us-ascii?Q?Jf1xhpqCStFJoDiE2IZPJeh1lqSF7CeMQjGDU/u0fYP9JDLHakSG4G6A9TLo?=
 =?us-ascii?Q?MtgfTzkjMEKMuCF3tP80FRW/E28ro9Z+r5O8tIAcyOWETmgNdJ3KsWlRs43/?=
 =?us-ascii?Q?mZD66aVT0u3Uu6zYp9G9jaN4IHCOH1HJ/bN7qEj3tbnQxLQBrZ3/9ebqNPZQ?=
 =?us-ascii?Q?6IMyYgGxcRQf71ZdUOL+FkwephWn1d0xlvwqX8iy7SlCQMtFGyy9ukp4D8wA?=
 =?us-ascii?Q?z/za4pC/j/eX4tXDGM+ZsSTQ1DAqK5tggqftYSDiglrSIAUD044rwU9Wq2am?=
 =?us-ascii?Q?MSbXlSuom4QQaclQrPB3KtgNgNMyX/QWMvTO6lwNhSjHHEZP4PGIjC2TLrJl?=
 =?us-ascii?Q?6twxh+VsjC6eCjMMYQ6ZLu7vGNTnZtPpsAtnM6NEa5SWU2Q4jQ3gJBRIA3TV?=
 =?us-ascii?Q?YY8GGuun6QUBwO4us1fWwVbqXI2c2ycHnuqw69i+bbmWZvYHXOFj26hfH4gU?=
 =?us-ascii?Q?y3H2ilF5hgloAOlHncA6wspPNJ/21sBegfrdzWDjxuu/a78QY8LBhyAkhiW/?=
 =?us-ascii?Q?7bCjANFRkKjvsMIRkiAfFdTbQNR54vg320MdZbvMTVwmP+8oQGksQ+3KsGU3?=
 =?us-ascii?Q?dbScTj5QollFQi0ogEzi3zERxSdlcLDEoSZiKDB9d1vFpqaK1sCJFRMkvYQ+?=
 =?us-ascii?Q?BXl2HFR0SrIrLg/m7+ksVeLICCSi8Dmu+4EZIn077a6mnUV9I4ouP4cQ1T18?=
 =?us-ascii?Q?Sr2wcAXDZpqlPIyjaHg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a7c3ba-54e4-4688-4eda-08dc48eebfd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 15:02:24.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NntH9i5jTXtuYVDyQFjgOctZ0zTvkXStC1qErYdn1XCFj4XW09ylxduVdUqwg4r1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388

--=_MailMate_CDEAA9B7-91C6-4BE8-BC4E-165B838C2D3D_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 20 Mar 2024, at 10:59, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> head:   a824831a082f1d8f9b51a4c0598e633d38555fcf
> commit: 1166721383f8962e2c6c388b2adc7c6f1e9901d5 [26/52] mm/migrate: sp=
lit source folio if it is on deferred split list
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/2=
0240320/202403202222.mfp1LH04-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240320/202403202222.mfp1LH04-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403202222.mfp1LH04-l=
kp@intel.com/

Thanks for the report. A new version[1] fixes the issue.

[1] https://lore.kernel.org/linux-mm/20240320014511.306128-1-zi.yan@sent.=
com/

--
Best Regards,
Yan, Zi

--=_MailMate_CDEAA9B7-91C6-4BE8-BC4E-165B838C2D3D_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmX6+n0PHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhU3JwP/1JHzgEUBytnoQTc/Nilv4o5VDcEil7RiogZ
BUyfPbcvNjcDRBK/1kXB50d6RcBNnPJRm8VNFGCwiy3YJBrMJt5f2Xxy2NT8sDWy
Q3HZqPRJk3iw06wGT6r7+XIGn4lydqOeGO4M6qIIo3OdHfjxQQXXuevWOIisM2+h
caF27zmcQUOIhb+ELMq/fZw2pffqzndeCAkHNR3UhziF+zuwSgOEfXY4+R97kjHv
Gel9pn2fog5Ts/lGQcpOBm22uEaVPt6JQJ9klevGqNBoTvmBm2UK+JplK/kc43kb
+91cxdhMkcD3lNg5VjR68mJ8XhuOLawHX6rprBalqyp8KhJJYswzlgo4MfXHzF1s
3RQmmqFxw7cl8vkrYGeICancHU65gphtS/AEmsTVztm9AvM83W3RKyVQ1OcAUQNZ
TE7XK+FWmOl8BLw9pZFHf8RaRuU7t2W49kmhHxt4kWmwjDnzW6cOy2e3bZR2cq5W
GF41YlLvgoZNVB2OVCXBMNlPuIFDF39rncqmef1ntNcM20vnLQiYsn2XHKFA6Rl5
lwQlpTNvfIP9TF8UFIP9hKBF/zGxNGRCn/kXNIguvBpwppt4l1XKJdsm2ql1YAmi
urXJi/96c6R3cr3s05bIvA9jLj1z/lBwupX0Ldu0Dt/Sw+TSvq+SK7OG1fgqCYFj
UCe9lPSx
=+hYk
-----END PGP SIGNATURE-----

--=_MailMate_CDEAA9B7-91C6-4BE8-BC4E-165B838C2D3D_=--
