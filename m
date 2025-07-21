Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2928466D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753088335; cv=fail; b=SIgTHwJRR2HYCOsibqeb2RbA/uBMeXP0DzQ+1DeTV+8SfRiCV/t/ZOO0wo48nJDmFLE8Mx/2QOftmKog7feXMiTa4aFZPirhjERw20LRXgn6yKtnCirFqghJ7Jv+eyX63QciU9fCJJ0G4qgBb0Wj8LlxsBVgqB7wC2aseH4tDV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753088335; c=relaxed/simple;
	bh=C8efH5Augb0Rs9BlVV6OeeJT52jh7O2GC3zqWNajwWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLt46KF4FM+Wj27pelxgwn8ndhvNYUCSql3jU9OeDuJqBu9u8P50z/3Tu5V41cjayLFkdwahbE5P/LsqJbf6uhfA1hs3TC0gPeVytXvWOCL7qCl3hap7Lg13PkbFaGuf03D2BPvc9+ZXqCFdF+zfca4tO4Lt3TKFwsCi6RBJ57U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PVzZZu5K; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ifBbaO/P; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PVzZZu5K";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ifBbaO/P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L3dKuD017342;
	Mon, 21 Jul 2025 03:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=721smWTKaah4ETT3n9
	7v2tSQLewM4b8iyJ2yd53t/zE=; b=PVzZZu5Kt0UPtOp98QD4JXnDVfLut/Y0v/
	cUu80KJDzkaO4bNjtRNvEmR/NZ51AJLMaKGkalHy5e4jp0K1b7y1P4aIfJ5XjbJG
	jIV2IS71081MXbvyJ87jn9JRjUBua9VRvY0Fxv1jopq2PorlRRdgp8mahj32R3S3
	XVow4I3PgbI/4KEpARqAYZcAdtBxIJXktLB0+1uHJfXmVY+EUY70w2g630u6Vw4R
	uV31SVkcfCS7e6cjke7syu+33UNX9b+ijIBYEGGPnLNGyBK5dQCc7saHpivMZTTq
	dItJT27B6L4lZaXOg0YM4mbEMTFT8w85YlwcT/iv3Hk3+ETRQmKg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2109.outbound.protection.outlook.com [40.107.100.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4808s0hsye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 03:58:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt/4Eos2LThL/ARvsc4WRRxxIIejXfs8CxpK9aOM8tRg6kH3WeqXvEgj4GA+LxKHB3sJ3SA+l7sb5BXh+6wH/lrWRjQGga4WunqXk+D7LgyEDNUgxwEXrHaqK8gnPgl8VltVAw2OigMh96zZW8ysvtUNdRgrXVO3ZDo7vwQzI3W4BoPcDkuvL6/NLOj6n2SR8z8AyMfkfl8K3ALmC8ZMb3luO3iENPIlfvbYfFHP7AKSSoFN+Fium5MOctIiNHTEJLhDgva7WizFS/wp22sq5HhPq85ifxTOCqrgK+4EW1Wbe4sdhREhNGkxYU5ulK9yXgm36BTKlQiZPwHhp+E6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=721smWTKaah4ETT3n97v2tSQLewM4b8iyJ2yd53t/zE=;
 b=K9JqyZeRx/kNwwVxkriIkN6TO/cw5jvlCkxLIioN9uWPMKaMIDtEf/SguzUpoCKiOinfUA7tNHvp8CJ9Ps2V15vvFh+Bjy0UOSeXRJIlxsXUjMf/W64I7VnXinAEAud36BF185OYCgluEVhl0afIwJsUZFgvkMKCfeKZzFQm7+xCQ/2cMrknrWDSpFBaD6tbrVALDj/gyrQPohlY2iCIRVQ4rbVr+pA5SJevxc1+LBBFD4vZ9LyZt75Wek1Maof5tyM91mnoIjmC7Fov93CxpoXYN4STmoVFzEKIiSL5bTTacE3eVgLD3KplbI3KXhjqWm/uwIp492lxcV/dUvXwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=721smWTKaah4ETT3n97v2tSQLewM4b8iyJ2yd53t/zE=;
 b=ifBbaO/PDLoEar9NklKMCNlSzOu8eEyV/V6vIWblw0w5L/2QH+AZz4aiamS0tMx8oNbwBQOLolE468yPtCYjcen0vYW3PfYPzRWezY+Ra0OL5+C+/DqkGu/2nSezthGruKV3X2BWvLLKrKO4pK7f8N9jeHnSeX+Oxc4rcaTHLws=
Received: from BLAPR03CA0124.namprd03.prod.outlook.com (2603:10b6:208:32e::9)
 by SA1PR19MB8971.namprd19.prod.outlook.com (2603:10b6:806:459::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Mon, 21 Jul
 2025 08:58:31 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::61) by BLAPR03CA0124.outlook.office365.com
 (2603:10b6:208:32e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 08:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 08:58:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F10F9406541;
	Mon, 21 Jul 2025 08:58:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D9A46820249;
	Mon, 21 Jul 2025 08:58:28 +0000 (UTC)
Date: Mon, 21 Jul 2025 09:58:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Mark Brown <broonie@kernel.org>
Subject: Re: [linux-next:master 8699/10823]
 sound/soc/sdca/sdca_interrupts.c:220:1: warning: the frame size of 1264
 bytes is larger than 1024 bytes
Message-ID: <aH4BM1anJP4hR+yR@opensource.cirrus.com>
References: <202507182222.OLgOy9fX-lkp@intel.com>
 <28f4b539-e88a-47b0-a7db-f04a20c7275d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f4b539-e88a-47b0-a7db-f04a20c7275d@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SA1PR19MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5a72f9-25d7-40c6-fb22-08ddc834c3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dyt3UnDq0eXI4N8srEPxJioKoPyBoXBo8D5UX61BPriypldMvJlHGo1GyWLU?=
 =?us-ascii?Q?/OxzjOnHUSnze7wc383w3G+5WUmEOJH5/6tGy7jscBjW7UBtIHoZ5ZTFv1es?=
 =?us-ascii?Q?CioUH3qCbfIJAgz1u3CroEc6tuB4IeEXFWB0sweh2kZ///pLxZbLFeTpQMyR?=
 =?us-ascii?Q?Vz/EqVvfGQvQEF/FKNQS5OY+PSeZVEt2XgqsyB5ZAKCEqaG7qJZTPUjp8eca?=
 =?us-ascii?Q?duq32DsvZTB/w49RYnn4Q90llHNDuojGHghq38Vb47HMkijZJ5TuTQDUE0xP?=
 =?us-ascii?Q?9Jo/H2+X6YiUXxAYvqmoHKYw5zSP7POgXug0w1vmUfSankoOSb6sX3O1cRHj?=
 =?us-ascii?Q?Rc02YTZeVt521r+N8Cb5pAmzwD/7dXmKp9e3Fyh62YXpj/1CJB9ji6d175io?=
 =?us-ascii?Q?3cJA8kOSkYbPcAihFgmBBoc6efURJ5+2TMMZHekXnBMGMmqHyg0+Uclrh4wZ?=
 =?us-ascii?Q?0hqh4N9s3CCefs+jr6H9zuEeHmpQG4xOX2Q/BQuDYAGpPO/OyjQAPMeb/cyD?=
 =?us-ascii?Q?IcGIGMLmU2/8gC9wzFPvL09OkcfhRZRoa2+35D2QmowuSLGqU6XyRl9ftBJI?=
 =?us-ascii?Q?38vMbNjSX76JuwAHqEOIbFKh/CqZhqUMQFHgfLbhMpjHig1qUNPKzY4pbohA?=
 =?us-ascii?Q?jcCFWVXLclTHHgKflCGttdKVx7+a2u28XJLiBy7X2K9Hr+KDI613Ug3fjNsR?=
 =?us-ascii?Q?nppCFqaAL1GWpyk9UPpEGjrPwuKZvMN/h06AWCJET5qDBgoPwiyVm1ptalMo?=
 =?us-ascii?Q?wrOV+6aI1MeoB9+RaVNjfU8+ua6022K8HfD5KCChXJs2HSBmjuJF9Sb6x2UT?=
 =?us-ascii?Q?ZvHkSvjsTw2avioYwNiggy6YlQVy0NQGqO7Q9QXssW0jqczEeQEVjPazWnld?=
 =?us-ascii?Q?1zXssrunvxt7yRqavT6mxj3U944+U+vGPRKTxqmJF2YIcn8u/gMDhbkk3B7a?=
 =?us-ascii?Q?H5kR3l1rT8KH8v1sjHbRFw/bxhGGzP4KceK2Tz1UN1DOxbQiNATO7MgpxJg5?=
 =?us-ascii?Q?z7Gm4nlu3e0y5k1NmgzkaqciVr+oKH79VoGgcE3WmR2niVccRNaMqh+eMfxQ?=
 =?us-ascii?Q?APPf+F32iJc4OyFWcJpg9fvHfCh870qxFPosILd61kagzh+RAOPrWSGW9Aqc?=
 =?us-ascii?Q?LHLdqAbQHUDpZg/fxhlVIzDZIiH+7W3wXvTYw7Z77r5UKuG0jdNEP7ubfHGy?=
 =?us-ascii?Q?i5/WuCwf5Aipj56yuddAMBT0oZ+uSWzSvNM3ue+PAcsHPyLhwpRw5sOwzxaw?=
 =?us-ascii?Q?5o+E/zGkmsMHn9r188U0487qcjpWspazEbc6Yd4+t3BXf5U7n+BrTty8kyux?=
 =?us-ascii?Q?xOonswDJVG6YGDlNq+bYWXZGDbDHjoPrkT4vjQvTU/0CGFwS7bZpZLE2JzgM?=
 =?us-ascii?Q?59OJfK9LjmJsjhjblSdbTH7/yggqPdejueHWlnbPpTMO0ZPCE9rKSNTxD3ew?=
 =?us-ascii?Q?NC7PDhaUceKSdbHBy5LWaBRmbe2bD3mcpPno9+BSWVzOktVFMH5bs7ItWfK2?=
 =?us-ascii?Q?SUol1Q00HutE8R86mdY4aSCFc1drkA59TZST3qlsaYr0d7VVfVVm7C4D1g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 08:58:30.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5a72f9-25d7-40c6-fb22-08ddc834c3d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8971
X-Proofpoint-ORIG-GUID: 46hdFwSi_Sb3vRTUv0nRZV6xndlfZzYy
X-Authority-Analysis: v=2.4 cv=VrYjA/2n c=1 sm=1 tr=0 ts=687e013b cx=c_pps a=VfHLf9WzjOx8D5hT+FIuNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=rNkukBM0GxjFrdmr:21 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=hZtV8SweuFhq_IIcgOoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MyBTYWx0ZWRfX+G88fDSTCPbE IwBai9czvl4oFQgJkzsOkmICEZSytn5tobX6gazjMXizMxYNKroMhkEUivzK9IiHvf1EsBXmyQc jjWlNGMFDyQn1yFAIe/nxSahEYPLydmcPqFpP+LmZVuWo7whvf1dSc9mklFVXgYDm2bltodCbbx
 jj663QF/sPzbgIWKyRDZTXHKe0KtxkNuzgWa/l64UKZTig5YqNbqzTws0QB3W56GnN7ikqvzf5i J0pbIhW3Q+eRl48PiSt8I8VpwY11aOgjiFVzu2EgnbOS7+F3LK23OMiv6eYxPpb+CzZUP1/haIS 7NWPME9uZS9zSbTwwvqQv6qkYw8z3+vPt4GASO1SjXdpTwT2p4k4tKVTWa5VFizB7gNKEVPY85+ r1Z0GndJ
X-Proofpoint-GUID: 46hdFwSi_Sb3vRTUv0nRZV6xndlfZzYy
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 18, 2025 at 05:50:23PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 18, 2025, at 16:43, kernel test robot wrote:
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> > commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd [8699/10823] ASoC: SDCA: Kconfig Makefile fixups
> 
> The actual root cause was commit b9ab3b618241 ("ASoC: SDCA: Add some
> initial IRQ handlers"), which introduced the new interrupt handler.
> 
> > If you fix the issue in a separate patch/commit (i.e. not just a new 
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: 
> > https://lore.kernel.org/oe-kbuild-all/202507182222.OLgOy9fX-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    sound/soc/sdca/sdca_interrupts.c: In function 'detected_mode_handler':
> >>> sound/soc/sdca/sdca_interrupts.c:220:1: warning: the frame size of 1264 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >      220 | }
> >          | ^
> 
> I have not seen this one in my testing, but I have looked at
> a lot of similar issues recently.
> 
> 
> The first thing I see is the "struct snd_ctl_elem_value" structure
> on the stack, which is about 700 bytes long. This is probably
> too big for the stack, but doesn't explain the warning by itself.
> 
> Seeing that only a single integer (ucontrol.value.enumerated.item[0])
> is actually initialized in the structure that gets passed down,
> I wonder if it could just call a different interface instead that
> takes a u32 argument instead of the full ucontrol.
> 
> Alternatively, the ucontrol could be preallocated, e.g. in
> struct sdca_interrupt, as there should be no concurrent callers
> of detect_mode_handler for a single sdca_interrupt.

I have a patch I will send out shortly, although I have just gone
for the lazy allocate it locally approach. The jack detect is
hardly a critical path since it only runs when someone plugs
in/out a jack, so keeping it simple seemed best.

Thanks,
Charles
