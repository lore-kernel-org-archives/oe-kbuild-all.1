Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E71B28E609
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043761; cv=fail; b=nqPdyGU8tP1XYre5aVvYuS8Fq3QsjnkuYBTevrqPKCd5Qo0yTE8SfWspczhgHGGzaKgoNIn9oS+AOMFI813Os6/Ti0yX0852ie2uAWQsSlqumUnQ/L01/X+IxKtNtpMRmjKmUHLqZlAG3DRHhH+//diRUytrfF8IeblMvojmKKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043761; c=relaxed/simple;
	bh=8uJDNwnNjM+QNpIc7MGYh6AA2YuAUVYO5ZP5JvBkG10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J277oPR7GnDHBHLUsyIekhxYTNwSHpvt0BSJ6SUmtyp/RAe3ZbaoNJal1t4uCLXAlbt0Cks544SzIwMIkw15eIcr5kXPDQcVENc6IKRW0FJb3stPtJrdO5PVQiQk85wduyf0tZ8XY3JRSLSIR5mptKMNC3d6O4c/n+OlJgqHAE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tZ5BvgF2; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tZ5BvgF2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZH4Mr2RlliYBwsKHhv028BDlAs+nYxe0N7PuVlp3uut28UBqnKt/JjXvpVbF4EB+fwHM331bst6zzPAL6cHJ6OoMHOUawe/phx1bDy8k96D/G7wXJctvCKGZMdf2aEs2I8x0qVB3cWizCW7X2ANGjBbE3nk7zV7czMm9JwRYvjiHiY5/ZTnw2qUB2Tpg3TuBX32HceXQvmVlalHyHEUfWC81jaKo/doezCxzn7H1bhVgVB0rIc0z0BEV+sOo9J9xB+YP1BiN0npRSQwNE+fEWMLzY013LfnIQ4rpG5X9yvSjEmYoNmeNJkyaoBdr3rxUKn7MXLWsGw6jDLUDoJ+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY2G87sAv/dspOfHY2+4U41a1IEYyQOFHiKTtanxoG0=;
 b=aB0VwObfjDjZRJLmBCvbO2gO+IEq8buAVqPJ4zXjO6ozdUQquNYo1hcukkURKO5tkd2lwR8JntliSkoc0fK8VVmh5LplnwQi3H9KUPWI46ZzcI8b5VNH6GrekhCQNC1dQq4xJtYOUcK7bwN6qR8qhcOTxAd+jCEUgy42Vsm6OWhfEZzfmap7KRTrGW2OmpTndhfoE7zO5yB3ClgCOD2vv9NzPP9Kv2FOwWr0j08r2KQLUfY6yg4NchfmGeC2OSyKIUmJ1sRcN3xPWHdDJvTdpbViDODUxxVb9E2Or+Y/k2hOFQTm5Vg7nQwV4hgbthRaGdW+8/UycgDywL6xH7OtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY2G87sAv/dspOfHY2+4U41a1IEYyQOFHiKTtanxoG0=;
 b=tZ5BvgF2WT1VuC+yRynvGNT3b0BTNaCC6NZZPVPYBKGfb68fHbeUChvvl+kE7HMnCaDmFjO9GC42ohRpXWpOI98BRk/6147Tj+G7NFJ1VtxUctHgKpAR+dsZNm2SpXUJyyis0eHRV50LrDfbHBMJ9uh6zeTKyBK8xc7WLeBTYvkuiqkYWAPlypVRSfNNwpX2BDnSlcBH9H9NPlT/M8k8c5DrUVemj9E8vztUXr2h7S1DxKXF+cobmzJz/jg8QKGONS57ds50rWmAzUaSkNYt1eiFodECWV04xasrDxFJYFnwtSvb/8a3lpe3UGV5elJBEG6wPqivlX77Sy6KQI2DLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 13:29:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 13:29:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 31/59] mm/mm_init.c:1512:30: error:
 'PAGE_BLOCK_ORDER' undeclared; did you mean 'PAGE_BLOCK_ORDER_CEIL'?
Date: Wed, 04 Jun 2025 09:29:11 -0400
X-Mailer: MailMate (2.0r6257)
Message-ID: <EF1B1979-4D72-472D-8655-6B21AD26AA58@nvidia.com>
In-Reply-To: <202506042058.XgvABCE0-lkp@intel.com>
References: <202506042058.XgvABCE0-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN1PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:408:e2::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e81c5e2-11be-4368-b6c4-08dda36bcb8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AFTzRpMzebdXqTnqgmSqvodSEK22Fr45luqSCZ9pAaY97Ol79BbP4vauhbpD?=
 =?us-ascii?Q?w556Jc5vKPOImXNcMc4TJfmfhz1UssCAk3CqVo20phxpO5sn8Xr6EyXB56i0?=
 =?us-ascii?Q?pjVnCzLzLfovyM7/EhQDzAYaafYV1cRj9IxL/dp1MVvrVGA3ILQxS2sXpJQ9?=
 =?us-ascii?Q?ojeYq5QkyXM/QeqE4CVgz9Ke8VMLIJPGCEEGPM/tSQjiMcQ4D2XaQ+2Qzj87?=
 =?us-ascii?Q?F9+Uu1p3AX3mSCu4Od4AIwFWD7PPmkcwGlPPjUZ3ZUIfLi5o9uPM/OtPMplb?=
 =?us-ascii?Q?mmMyNP9wV/qK6Uk4oWZ9KLOFxYuzhp/Pk586uDTYKcyltj/p+AiEumOansyb?=
 =?us-ascii?Q?PEW/sFqx//sMdstwWtlm0cZPfbkdfjSBByUYhlJn9X8KBaEO+Emwemj4W03n?=
 =?us-ascii?Q?Jp8IE4ePAoze4Kb0j8/uWcM3catBCXtS9K9/7ZHlf39HnVs91sotmJ6sfbxF?=
 =?us-ascii?Q?FgEET5K9mGU+ydCK17bCJbjK5ITnbzDTt0nvenBapn4k4L4NBRo76xMPLwFg?=
 =?us-ascii?Q?vLvavHpc0Db3XRMCqCxlTNc9ztIQ4jTaTYQSFTrHp+6QJovJeiSEVzPBSG0Z?=
 =?us-ascii?Q?nxTfENLci2cfu4gQc+8ElJW2BdlOXQdRIqMlrZANMCx/cl2OqG5eAjPrF3V3?=
 =?us-ascii?Q?Sb6i6OcMJQyJb/9nSrPtyiQ9+OpjZJdOXYYBU1IXtvXO6eStdTzNHpLKpoMM?=
 =?us-ascii?Q?mp+5J85Nw30sRAap7LDm5V4r808Q2aKZcgfy+WDiGP5luDisu8ts7aYKOjdL?=
 =?us-ascii?Q?vcJL9WlMUZ5px3oTJ7GL8Ue0af4LwWxScy3vq89pchNq9krDd96DGaL3VE5Y?=
 =?us-ascii?Q?jYqBeUPy079OTo1FwWjjk25FEFDz7AlN3Z4q6U6AAj/m6AWR0OZmu3+5UjAw?=
 =?us-ascii?Q?rUe+okW70+Q5fn+FcI1nuoe/VoLdWqZS5qznDBBwlG5JP4Jw1dX2eqVyS7c0?=
 =?us-ascii?Q?ib4KtVKftxz2dhBtosEZn+5ihMu7vuVvbOaKu2h6D4C2z7GLfYc+dM/t/CKV?=
 =?us-ascii?Q?uTM97yM53lsVf2fscrntXQGXo0WS63IjVHnVC5jjGmYTJEMN5pBNALj63+/s?=
 =?us-ascii?Q?xnjx1k1Hb9ZwnC75/1QGYOjtFMPJNI5zNHw/Ov9qamqioY68eK3YRZRRCuEn?=
 =?us-ascii?Q?Jz2Dr6n+cC3jcBysIPC6mklw2CKlfCxOMmKjncWAD77TX18VWeFlAOMIl+xk?=
 =?us-ascii?Q?VkmpW5ziWOuBGJaDwkxsqwFflhLnrOrSAlRlU3Q8F7cO9iGrUCckuqYqzAgW?=
 =?us-ascii?Q?bD7kZLv/AiQ766osnU5R145/xxZls/89qlyr3O8c51Xif7WKc0liC/PXdVja?=
 =?us-ascii?Q?hEhWV37PzkukJHxWdUogteCraHWDMINbvenIt+5YjfCoBImSvjWbQdhfzwr4?=
 =?us-ascii?Q?AIZ132kh0t08NDkVyPUDM1rRUwaabF/ttFtqYy6oWh4TaNwyaHsC690QzN2B?=
 =?us-ascii?Q?bnMAamehA28=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uHJlesfmUHAog9xVd4uS/Ry3fYAmS5df4Fr5eAXFN79HBOG9KLVPMBD1T9HO?=
 =?us-ascii?Q?fu27qccVRsbx4sr+vLOWr7zYhYIQ4xjwPCJmOOIpgMeGcVb3iA568AbXiTFk?=
 =?us-ascii?Q?FTxGTIj8CeTK0Ka0sxgrkagfe349wvbsCp4V99n37feX9kbjnDhms9gDSosS?=
 =?us-ascii?Q?OThom1IdeoaGqMeDx9Bc5A6fnTnuiRKQKnPLYeOhh7rHcv6tpwayH7hmCvry?=
 =?us-ascii?Q?lulZ4yKNHfCK/56tuRXT9L6o9c/AF87wOADVMF0Cs2UXjEHitdjfgSSVTpDX?=
 =?us-ascii?Q?v6bwXLC114s4SKSNdQtLRLC59M4dCqGfqpu+1YKqyyi62KSpO/N5BT/NL/q4?=
 =?us-ascii?Q?H13BvXde2ngQyuUjfue7U2TTfMfAPLzBjWCN+xGgJIOieEv1FIpbSTFYNoZ+?=
 =?us-ascii?Q?nGGoTRzKqkoIaqeQwIkD1AMOC7J5MDv+UYUd61QxZgoy3p/4nkgLv3v973+l?=
 =?us-ascii?Q?p/Y0huCTdSig68MFTog4jPO/TM4BzIpQk/sBPUEHZjyNsw+qsNI7aTnRngZd?=
 =?us-ascii?Q?s7LrkWTTe/ckPY/Qs4hos8rFq+XwO8ra3Ki289JC/G7KBSAcYhNyBZ4+kvny?=
 =?us-ascii?Q?2mfAT6qiqWYw6xKgEs5a7zM8Vxzky5zk4lFCiGCzERQn4Kel7GASZ+i7D1xO?=
 =?us-ascii?Q?+4JSHsT4RKVKHAVL3jbAYBJ1rJspuNsmveuDMnNlLPh/9FO7nervzzHw7mID?=
 =?us-ascii?Q?iDFg7SzXt+HLZaIqHalKOI/yTLkpKeknNlrwac0xp6HfZwXE1f6+sxN1gcAH?=
 =?us-ascii?Q?Iy2ceqIskf9Fbj0OMwO0OFGCy9QkG+Oi1mJ814DXMeE69NPaJaNsvchh3QLT?=
 =?us-ascii?Q?bI448ch3azQGU3lroRvGRrfqlscrSjd1bVAxJbcjjPy7d4NaL9bfmM+R3jkW?=
 =?us-ascii?Q?w0V/cjVldPnKZJ+TN9Q3sHhAcUZr21tT6s97VDk7HBuz5LXgyLl7dCDY7QBb?=
 =?us-ascii?Q?1AD8DyMYg6WZRRUwJjtrH0qYLSyYPPEFczNceTk4tkFMPKRJY/EXrKkeBq4b?=
 =?us-ascii?Q?3x8JP36pGyUVO6OGZsbNDftbOOV2bOV3pIyZLVWRsiZciOe+osnan4QBzLYz?=
 =?us-ascii?Q?/dnZBkcYE6Y7Dv9XGoDcwAxnMz4OrUZudJXjHF/oNWDcvIXYG3PbeHGzMiXD?=
 =?us-ascii?Q?luQKqsV3Rx1SgjC6igZn12peZXyfqprswkAwgxst0kTR2mXDsQeDV3d82bJz?=
 =?us-ascii?Q?ATzR4HpdSKMJLxxdSPLdQ+tajUDSn6Y4CDi72JqOkPTOT+p0XRP//5v4HpNU?=
 =?us-ascii?Q?qtZuYij/ETPWuZudr1cZ9tnG4UvnBAG60d3GgDimdU7R4XErJRrwvwQMX27z?=
 =?us-ascii?Q?FDO7CA6NlJx6Un+8UHMUwBjtriXIjSjIbhDXvepmnNXJsMCLAQ9NjI7CILRn?=
 =?us-ascii?Q?zXU2S22WFyer5IhIT3Bil1JarALCo8zqkNuxoVyRGC+PnnqRMseFF+uxptvt?=
 =?us-ascii?Q?20atScOBiXiKDI3Q5uhog9ljKjCPgl8VX+SFmEwR/rJNwc6o9Gsi3hsDxD0G?=
 =?us-ascii?Q?v5fcwE627wXtdyhhYKwknT+bCb5bCaCGXS8Kvo5cIX7wKErOborU1x9PDRdC?=
 =?us-ascii?Q?WTQFSwaxkE2lq5uAwEjt6xEbr+MQuGuil8JB6wfe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e81c5e2-11be-4368-b6c4-08dda36bcb8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 13:29:12.9658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lx188xd/E2frg+k+c0E9L63Qirq8ZYzSytQwS+WiKCG4h6zCZC7VAx0XbLBzBQhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On 4 Jun 2025, at 9:06, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> head:   80bb0b2983e95be26d929303d589276875c8900a
> commit: 2bb7d2079ada079bd9f25c92e6a4618ee1ce22db [31/59] mm: rename CON=
FIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_ORDER_CEIL.
> config: powerpc64-randconfig-002-20250604 (https://download.01.org/0day=
-ci/archive/20250604/202506042058.XgvABCE0-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250604/202506042058.XgvABCE0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506042058.XgvABCE0-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/mm_init.c: In function 'set_pageblock_order':
>>> mm/mm_init.c:1512:30: error: 'PAGE_BLOCK_ORDER' undeclared (first use=
 in this function); did you mean 'PAGE_BLOCK_ORDER_CEIL'?
>     1512 |         unsigned int order =3D PAGE_BLOCK_ORDER;
>          |                              ^~~~~~~~~~~~~~~~
>          |                              PAGE_BLOCK_ORDER_CEIL
>    mm/mm_init.c:1512:30: note: each undeclared identifier is reported o=
nly once for each function it appears in
>
>
> vim +1512 mm/mm_init.c
>
Thanks. This patch should fix it.

=46rom 616cc58d747d4b1c03e8db613b7f05c5005134d4 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Wed, 4 Jun 2025 09:27:03 -0400
Subject: [PATCH] fixup: rename the missed PAGE_BLOCK_ORDER to
 PAGE_BLOCK_ORDER_CEIL.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index f2944748f526..38a1abd49e57 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1509,7 +1509,7 @@ static inline void setup_usemap(struct zone *zone) =
{}
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
 {
-	unsigned int order =3D PAGE_BLOCK_ORDER;
+	unsigned int order =3D PAGE_BLOCK_ORDER_CEIL;

 	/* Check that pageblock_nr_pages has not already been setup */
 	if (pageblock_order)
-- =

2.47.2



--
Best Regards,
Yan, Zi
