Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2085.outbound.protection.outlook.com [40.107.113.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E914C6D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 01:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718672951; cv=fail; b=aPkHbR++3HhynhhvsQ4vw1I3Q/oe6k5ggSKD7zAoO9oQVZVgu1itVhJHp3Qi3etPXMrpQfmXOFo/qO6uWUfpROAMxi3Ij2oiM0dx64iagLCcNIvHvD54lPArlklkcq9sm6rDeG7jUqQRZM07Jxir9vwncSojelC7mPWzFhbJzNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718672951; c=relaxed/simple;
	bh=cr9KiXu9ojh80OxMNKeyRY2hRijgiPjpYUZUvZ9htBA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eYIftlsi0oXXPASeSGeBetBsUCSqss0YcI46ows2d8kacjUCKQeFWUYPbvMj112jceBLl33eEnkBzLopR4b6xaCXMnhDSTHDrbINFlQGWJFadR3JAPe7QIa5Nxf5NzibrHcpQfFatXcKaS+Mni9PXASHlbpJnqHN24ad5rFGMaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IGIWx4bG; arc=fail smtp.client-ip=40.107.113.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IGIWx4bG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLOfEsec6quQEkCpkJlAlcHSCZQJ1HWrzDPFwAQ9FQCiGJ7VtnMRAmtBjcUsGYFkyxCgsbPs4EFg+l9MUuU7XSQTwcwtZQuZfOIRQQuJFtO79ip+7hCfmw4w8UMmOhvq0NuWMkbOp2BSoHtplKrUBU3B7EKdA88Zm5kTvlyQVIaQqfuN2drlBvvoiHltszMEW9FzKaI63DHmBanmlVePNJ5mxBiy1anYVE8gBnYbbYG9BhupaPKk2qppEdZmFg6OD7lQKlkZ5umoy0RDqvEcSZGYWVcXX/j3L1z3h3fvmxkqSm3vWrbDiRAppS45tSX6b7DLx/uOGboW/nx0X/ampQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxUIJM6sGzQ8lFjcCbIkCNg36bcQg8iYDbD7LUuu1v8=;
 b=VbWoeVTOCLCL9AkviFHesmEobQP6jlZZaOC/rpEydWwMfNmgc5HvkKGWSseymgWBMXMiQcNla95xoM87XAFIldH3sRsw8RCqrjAbIvwUdDY0r9qkQV/ibPVviTAjaw+g2Ujze7YQdZNl8+M16mU6tKfGgezBtPXdHRPh1q+jp8famemO+39kE7gklhnFnQvCBPBrqu10EP9T+LWyvnc4gVdFp4XC0qkVWMIbPczG8JjW5uJqrX3TSR6Wc3xBXFK0ho3l308uRB/kzCJLPue2tU54AxxkN/MCyQNilcYLnHQWvsookCLP9CzGbuvTt3h4ud8LtEx+bntczWpZHn1bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxUIJM6sGzQ8lFjcCbIkCNg36bcQg8iYDbD7LUuu1v8=;
 b=IGIWx4bGJq4l6ypvXfvYpVLxTG2Dv0vYXr5CdmT5rhzwm5DXl5ApjKOxrPHCuMY3vFl2i15OaSUufKWCew1a4A+DeD+tlp2oE157iMqv8B83oLNq6V1z+9kSVbycxNEFi9fJEoKkPy9QUrRa2gCvfNcmrDXdpW7CWhMt8WOmxbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12117.jpnprd01.prod.outlook.com
 (2603:1096:400:3cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 01:09:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 01:09:05 +0000
Message-ID: <87a5jj3vm6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [morimoto:renesas-bsp/v6.1.94-2024-06-17 52/661] drivers/iommu/ipmmu-vmsa.c:485:undefined reference to `free_io_pgtable_ops'
In-Reply-To: <CAMuHMdXocnjMw67acsehOpZKXSrCE6ci1-Z3wgNQrBRH_TeTYQ@mail.gmail.com>
References: <202406171924.M6q32pv6-lkp@intel.com>
	<CAMuHMdXocnjMw67acsehOpZKXSrCE6ci1-Z3wgNQrBRH_TeTYQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 01:09:05 +0000
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12117:EE_
X-MS-Office365-Filtering-Correlation-Id: a2740f93-f5db-4db1-eca3-08dc8f333fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|52116011|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hbYJY61fmeexqqaBqxJUFSFUsRB7Sy2SdAdEQRVE2axbYEHlBzRgFi2UkPFs?=
 =?us-ascii?Q?Brc7S2Yp7lpWMaeATWifU/CRWS2ycsJexOyqmOlD/Qik7bjYicMWG7CI6ZBC?=
 =?us-ascii?Q?Aro9opwLXPklCPsUblT3DWsaLV9FVu1ZiJwm1jlvpsGo450f9EOXAJCnymax?=
 =?us-ascii?Q?F1c3MIUxGJnKHQOMvPPGKjHVmCHC4T80ca8lk35boXE1ZTWC2QomXba0F0xC?=
 =?us-ascii?Q?YsI4y4HO2nL9UUHUazNdqCK56vybbU0ghZlFgO+YPbrwNJTpqUUKJ+K/uxBq?=
 =?us-ascii?Q?S846bjhBjeNkhHBtWQU/LlBGVFBtbvSg1vL/T5QIQdK+Kc0xbkEoAzZro5yb?=
 =?us-ascii?Q?m9g9BJUWwGR2J0Nff+Zftf1pa1Ibca8sx5/aInop8/GAxZPd/acwRpPE6qdp?=
 =?us-ascii?Q?bu9/NnrEZHYbJoSycYNfTTVDe3wc6HbGXNkUWrIxm/hOVxyKj2nDa5nnzr39?=
 =?us-ascii?Q?8p5mQUxc/PDxjj1N9nKiS1brHhGPh0aU5p9vg39GsvA2Y8Bq8kX0QNyzdHCN?=
 =?us-ascii?Q?+Fn/cXTBYjqwQKWKkysEILICXYhypryQYq3K13PpGhzr5SXFV1wWBdxZSAm9?=
 =?us-ascii?Q?WAnENKa8WGFTKtVhLxxqRXMj3RSUJ0fdAMMjBPjJZaUGeuNn76W61F7n1CwL?=
 =?us-ascii?Q?e5uKkEcAn0XVCvdbSNJ/s6cg58r0ANYku7cu2NzXkL2n22ADIxLmB0mJuvsT?=
 =?us-ascii?Q?5MoRYynPVsWSHMcCMfQHRnZdoRoOBrbzDGrO7AoLiypTCGy4duwBuVYKgQc0?=
 =?us-ascii?Q?nmb2v1ukxlgHkVI761XNamAeJ2T/QiSFr8bz+aelP8g5XbnpCn1OXt6vjLmi?=
 =?us-ascii?Q?1Odc5VPDcC0EIbwSLXTNTE42/YFJk5WaJJTNzfGLd9cXvNUlkeZZWtudRLbL?=
 =?us-ascii?Q?a2VE0J3AtQ5PA4Yfqw8DPgdPjIUckd0Mw0SGuGP9ZWx939tLeftrKpMxHjBu?=
 =?us-ascii?Q?EXXRHKR4flHq7Mp37Lg+UYKZPCkH61QGV8q8Uy/qyTVHhrc6+7e40ReaRHEF?=
 =?us-ascii?Q?/GJeI/8SYer+4TAskzmrSt489Z9pMirvjMWjzFgv3P781uVpSiQ2Aase0g6a?=
 =?us-ascii?Q?fqYVxkm02FiynmHNCuj2q+e/3ukGhTfL7anUVIucJ0XCSSdKJnC822hUk7YD?=
 =?us-ascii?Q?KRoMupYvC+jSHmRpS/eCtgbsp1ZGhU+fm+Htqata/2NK7nyA3FXuTQCvQ9I2?=
 =?us-ascii?Q?ahgB4ZCWRCTuIOZnFByX33S3E06930FyM75HgNTg06lelWYGb/VeofvznbUi?=
 =?us-ascii?Q?E1VG7ZiSdSSK2TUJ/xsMISaY4HA/SLS9bkY0gWLuDzMao5JSUmvIX8zVjDSU?=
 =?us-ascii?Q?usj0/5JPbk2/IT+bP6QmTh+7UZjJMA14CCpbuIk98bMH3qgrIYPfVH+e0sjS?=
 =?us-ascii?Q?DZePNLc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kCbaMen8ZaMSlJ/QdnZA9/zNdqG6e6m6RBUOCknBNc77/33ovaVXfc7gfMBT?=
 =?us-ascii?Q?w0yEQGQ8EsiFURAM3/URLSUsvyucb3vBHxniZyuT9buol9l/j26AozEgFeje?=
 =?us-ascii?Q?/wfY7rZjvs/ciGJicD114t+j724TlPsx2Hragbsu50JB6ibW4D5CRHlaSiip?=
 =?us-ascii?Q?G7jozFjygxh1aoNrkFkfBUt1V2qMwkfJX6XilsgrhvIVfGCdZk6H7/sA6lgO?=
 =?us-ascii?Q?+bPCNW3D8TXbmLA6FzUB/rciVwJtlDQtXP2TKanSjGj+ATJgdKM+fk5uxS/2?=
 =?us-ascii?Q?1IzHtiSHwfZkOuatu7BJ0N6Cpv8f9j1w3N4ehaF+HwCRG2czjPhedmazznvE?=
 =?us-ascii?Q?xi+j4sDd8R5CPpb7vXMm8y+aBosN1GbUbn3bHdiEhEOzaNo79xK/5xlDUtIb?=
 =?us-ascii?Q?VH3V+r9qMdCJRcRsdvl6eK3htUuQOmSi3Byykj4ONPLfKePHE1xJSXipqZVa?=
 =?us-ascii?Q?n36fZTHbm5aj1ttYPDJxP5ZI1mC6LJ8M+BXlEncmz/W52Ig1ifzTukqFFF8j?=
 =?us-ascii?Q?s8YWu/PN+dVNf1RSgmzLwiSvc5b9HzCYHOKevj/BfjxZmPYl3RhkLS9qPwel?=
 =?us-ascii?Q?mUFKK2QS8HcagOVO1k/jNzoMkQAO+L+AhzRHRzYORYKQYkKzogabkrtC3IZw?=
 =?us-ascii?Q?d/dqXrZ4exHwbhpU1pEA9CgZWnOcDVvQ/uoYcHT1mEjUTOZ6EynLIJSBTebC?=
 =?us-ascii?Q?vnOReEip78qR/lmesjkUc+h7uW3lBt6ajzMy2M8XyZh99pmQx8Qvkj+7wtGy?=
 =?us-ascii?Q?N2ZEIDtEdjR94812FYWauVWLu6vNjqSWINApJhmEHHNkfZPzjcyhLeDvpf0U?=
 =?us-ascii?Q?My3aCvSjBB8NSNi5jKbBdASeVcsaJV52t2XTXSiQaxAXXb7SgU00TQZYGlzN?=
 =?us-ascii?Q?D83re61w8gU1xqLrUGR+uRC5PomHPG8iLeXoXNogX19wd4EM3bPHw7MC9C/G?=
 =?us-ascii?Q?LXj+pTHSTAcJISxKlGfEBeEtcP85W2sKmzrUHKw2Kjy1LUJFru/B6Ng6Yjzv?=
 =?us-ascii?Q?LHkyV4CtjlP2iBkdANT3WO0w/va3CGxX0GyILDCbPuqSyWE5yRYlEr0I2tjb?=
 =?us-ascii?Q?Lfca8TuE7twB1PPc+MLgF6ngnxXP+pd3/kC5ZPQC73ErEz5HCkcY3ZHb+m2G?=
 =?us-ascii?Q?uhi05d2L0xovY923z6Zw+YJaLnvxAOtzMp0EM60kWQCSH7/IHaM2Ho6Mh34C?=
 =?us-ascii?Q?tk3K5K9i6eiXkdLD/kRC5uKXSGKkagTp04gD8V3W3lMi2RDTi6HNTYlmbKGU?=
 =?us-ascii?Q?PvPWRfXDXHqem0RQr6Ojeuq6VFzYMpkPCVBwduc3lfXbcw3sroRX0kEB56D3?=
 =?us-ascii?Q?pdr/rFRyYmpyQZ1ay6iNqLwhcnf0rCyE5rOoDjBIGU+S8pvf8zQJIKXQFY2A?=
 =?us-ascii?Q?p6pNS8S1UDsiEMb0+w532HjH26m4MpXoBChXvLsZF40oGk0h1MfLQcyVUT0k?=
 =?us-ascii?Q?+2uvkGVQ9LXPACF4cemi6JokESAZFY2RSmi30XPSECYv8Vgx5Bt/pBLDap4x?=
 =?us-ascii?Q?6PwEHZ49VC2UO9W0UOLZwlw9DvHlcEQxDbSogN9EEluEd1tkHO/SyzjTCIoD?=
 =?us-ascii?Q?EeRJ4F9ea4iWUbND+ZYM0Wn9PlifVUR5iuBsb6Y2e/InE0Jda48cE8OXOKyC?=
 =?us-ascii?Q?oq0id2UecC7sWxSnVtl9OO4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2740f93-f5db-4db1-eca3-08dc8f333fd0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 01:09:05.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCXNXCvOvHGgwHqrjpmgpu9rI7c0q5pnrRNgsfI86QstUhdH3kJ5g+7IkoYoOVM7mb7YLBOd548C7O+3y9z2c9pFm7XFX0eNb1d1rlW9LpNFFjQPoNtKa6Wi0euny9EI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12117


Hi Geert

> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> >    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> >    Selected by [y]:
> >    - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> 
> Missing backport of commit e332003bb216a9f9 ("iommu: Make IPMMU_VMSA
> dependencies more strict").

Thanks !
I have backported it.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
