Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99573361672
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773084015; cv=fail; b=djhVUUnRsHHWM3XXUgb+YKTYe0Kjo1jfCdk2+Zl6k+a55nNIbaUznOWytjDt+Q30OjYs/LvG9rueVjRrdJlxYodFR44oKgcVO1NhFw9NXeLnSi+tMhKX1NCdCT5gKzqG4llPEKzIh2YQM5VfLnWH29/sIOqEMoIPTZmha5+lIbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773084015; c=relaxed/simple;
	bh=X8XjooMEMMSjkMIro4Bwvp9IuOQeQ1qtHtKfsUsHMAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eaP7Tg5JPl0AERch37MkNc7OnvWTjbAYwltlIb2TBRT4Awc2dD8T8UlXlqvghLNeGeGWe+U6sq6qHusHkNqy0MCkEZ3w0Ll4pVbZqlHtRyNry2ialz2biRjFmzyZmJuLrtr8uoHK2rGjaCVNc/Vu1o6j33GMTWD5KQ774R0YfvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=baMWAy6e reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="baMWAy6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L32dFAvIl/rWhu2T/joI2nHm9D7E6vUKSkAWha8bNqvu5UJochkuvJX1mJCZT97IuGgn/A6ayLk0MBF3FpJvKYKPrnKi28CoKM8zsje7T55mZSNl6pHHNS8d/axtOiwh3xPFCJPorxZBRlWdhFGKmLlGZeyPuA0KYia5Ei7INdgAsVR17fWIVzXmGR99QfKT3UtdNRbyT2JMvTFPG99loIvbVz6XjsiHYTcQWE2ArfuTOHcaXwmjxGmLsUPO0XlfARCPyTBkB/0aD/os0cCpt5j9oQGw/zDaAeGJmco4ijEl3C/WFHSlaxvdVRvfJtwD/z+EKbZaAYgdeYDB32y4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZDlyQuvrUwonFcAEJymbf7Z54rdZCFtGdbcfYYLFDc=;
 b=VOF+8nlkxiFZS169ewqpMQvpyU7wLFCeu1KWns61TQUWHzfx2Da0wh2zTS8AbPYTmK9nu9EC9AxaxxoGQ9qFvTbHHViFkUmPRgXgDdHEkZigG4FBxX57TJjkRWFzv+h+FfdZ7Cc3USYOOxlQsDcMYsHA054l+LqYYawWuXVJxfSKdSJooGNfJSibkChVas1//HPdIzxOd4YdwdK4e7pYvgBL8YLkZjT8yD3K0ZEQFQX23Qu0SV1IAIUXBNZSJZXpItJI68y16Ie/QyZiCIso9YlIGmryuzOH0WkSjgflWfg9tNlKVzOwpAsVarSMHvil78GEsSPP2c79yPsDoKOXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZDlyQuvrUwonFcAEJymbf7Z54rdZCFtGdbcfYYLFDc=;
 b=baMWAy6erdwuA9fvxKqypdl2InHV/8YdWG41d/legLisA96aHzerd2CeYrpOYxpTMnQANgjfod5Zzxz9K5tRqrTqeA5i2LLGGn+efcdbmS7Fprp5UX/pWzJU6LuBP/7ql5WSz0qA1ijSeNndkeNUZ0g3sMUmkkH7q+FSdwm90KXlj5ilJiKuks0BfzqUsVB26qBkWsSTsUUlu/qnI1LN+YI7EfPm4KiZIQ1gSX1/Di2q1x33OfMeMmhIWkjCw9/phC7rKpA9ykCtcteSJKz79L7naB7sN/9aeFMY3xwaRT08rB/YdFrAro0W1+rDNnf+cJfvedRJymxw0+u11TPKhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS5PR04MB11419.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 19:20:10 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 19:20:06 +0000
Date: Mon, 9 Mar 2026 15:20:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [linux-next:master 1683/4342]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width',
 'nand-ecc-mode', 'nand-on-flash-bbt' were ...
Message-ID: <aa8dZd_rkBFK7Bd7@lizhi-Precision-Tower-5810>
References: <202603070924.95EFyPaB-lkp@intel.com>
 <87pl5doz98.fsf@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pl5doz98.fsf@bootlin.com>
X-ClientProxiedBy: SA1P222CA0171.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::8) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS5PR04MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: 880023a3-6861-40dd-7075-08de7e10df6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|220923002;
X-Microsoft-Antispam-Message-Info:
	NEZPVILkyP40eHq+mWZLLDjPuV5PzHCjCTAlBzVIXQbJUiezXBr65iFx76GnhNnZwiQDIfXJjse/k1Sg0DnWys3DNWSAXWik0u1mmZUfi2zWxdagnkp7DMbdbWYyFto8cANIBe2UTPfYIrak08R6z11B//kBnhkLME8Q4UhYYtoR9plT9Yx/HkUbf2DwWwKxAcH9YJQPWZusZjP2Td9Zd1UegeJQ6HcGc63gV84ng0jXk3A+jcgiCWifnDJq5RLMsCTerlplfK+QDTAX93gZOl0x9IlMh/Gn76MnIZEtFWiC6KWFg8I7SeGUjyqfnClKs3zLytr/oWisZBphcq4vrB1mFRy7fzvAZ2f2cA7IJHpPCiQ972jlzYF6Su9B7fg6UmndYc+7M6D0ob+WtMLzgRLupMnTHk/qdQuVbGGEyaeipQSD4LFckACnYWR6w3inR1Ue2jswIWHOtXMGttGbZajWW2nXd8OYVWi2F/SAdV/sU3vanu4qO8Mhw++t+EPK6IqW2C0vNlz+Qiaz1W4s13JimArTemevbiIqmHIn8XNAuKRYaG2AgwutAg+MxCcYOUjsG1XvRQ02xb19Oded0nl4ZITUK7j5CyvDm0CtoPDRjIzbrxq8yYXMcyvl5+sP0Svu5cHYnoAeiidKqC6zzcRGK4yRtvCTeWwNWLE6DuQTKFh3y07ivKAzKcjk4GTZ5LTva1VCSxNfNCgaHZqRSmbYJ3npU40Sw1f5pBo66QUMj7nrbxYaSfo/a1eW5JbVdwnjIL+oEOoMe4h7VYyHVtXpzdEne5Y0hGGVvWt1WBRQ7gV3hvmdzJ7ExUAkp3Zy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?AVulpFR+R9jyxbHeHJxI7eROiszDtckMQajB+sUIMSo4M1jvE07t7gRm6h?=
 =?iso-8859-1?Q?H7IVg8wmHP0V4BxC8XaM+UkSDDXnK4TjfiLuV9T3j+HM33vIe3orhQ5GVL?=
 =?iso-8859-1?Q?NsvzBQq9+0jrb1y2JGJB6ha2HK+zcmvlx4zOvw7EgJtISwO5h2xLvXRrl3?=
 =?iso-8859-1?Q?5D1w1KYGKHc/X6w3Vzx61aXPFGowNFZAgKp2HuvBL0cL7PF2JdCU2qFAwJ?=
 =?iso-8859-1?Q?emyZHr7XSpA2qFmSNWcm8bFlS+gNAR67jXfATlSivGXsE8SFKSawsIeShG?=
 =?iso-8859-1?Q?xBDWRA80xsGHPQGUAMx67VU1SL3HX9TwOtVkVWLkLSRVwzxPSLPCg1Oomd?=
 =?iso-8859-1?Q?eTmBuyBVn6MfBU5eiKnc0AHN34KYpKOtI97dmxBvRAqQS6hkyvmJavqY4q?=
 =?iso-8859-1?Q?usxwciN7p55L+yc5PAKfN/mMVLFYt38l33IOg1idr11v0oCYuD7XQnKkVc?=
 =?iso-8859-1?Q?XUDT4f/5sFHoYzfsRbq5zjHnUgtmtV1VAC3jg6oAy5OGIb8K/61LgHSnxD?=
 =?iso-8859-1?Q?ymwqMTpmHwWDxbY9pRufhauIfmB4by+T4jN2LwnrgVHwD1TtlCFB2/Qv7E?=
 =?iso-8859-1?Q?V8DUz7/rf17JGYXExwzEQwxROCg7E5afAkXX8U+mrE604cV7WD38hTyHKm?=
 =?iso-8859-1?Q?XFl81VfrBAEd9vDWtM9MygYHWv5riHq9hoKWqmC1UD5C3m2/kEFjc/nXLt?=
 =?iso-8859-1?Q?S3k0+Fr5+Xqif6wi7xKdZ9e5TtKDicTbTOkUk2gW9AKwSrzU9OKp4ZuZC9?=
 =?iso-8859-1?Q?NDroV0vfdgDgt2f7srjTG0pOmL7uRvk4HEfJ1ZkcwI9LJJJFlozERgylvg?=
 =?iso-8859-1?Q?0ZM85KJUoHgB66X/8ZV/4AM43umEJNouesgTQCUO8b56wIGX3GHR9NZvca?=
 =?iso-8859-1?Q?nX/sVVlYXKzot1STXB/T0A7WsTyvH7UslgucGVnz5K/GcYFfV/KF2Wzasx?=
 =?iso-8859-1?Q?4sqj7cHS2L2M2D+0yCDNJMolzixp088xH6ccWZvnHLdwP0cyFt8/bhOSRq?=
 =?iso-8859-1?Q?t6UcgaSKqCqrGo26ipcBWowzicapYgwAcwUv2+QQ5TDENovXs93WH68ik8?=
 =?iso-8859-1?Q?E9MmqgEhqMLvsYTjDzFCpMmlM19rUTiodHD6K5NV7va+FMsy7HvhQ748/M?=
 =?iso-8859-1?Q?lyAXfjyzpmPX+4uBZ1YJ4Fz4TCGemchzbHMPJdJkKEv9yxjHBcVF5s36wN?=
 =?iso-8859-1?Q?LIxyXIrd50GTze6fxSw84lqMIJGJCyY+XmMpqaQl8ri4OdZNtbE8JuY5VT?=
 =?iso-8859-1?Q?/QOcm0Tb6UQ8btku2g1XooPZpydafTdV815sEFbDmqkzJmiR+aH27VXOEX?=
 =?iso-8859-1?Q?2mQXulMfOSZs8btXdBwTlP2cD8qH3o1ocM+kUlSr5/SG8VGg3EP+HZJh9U?=
 =?iso-8859-1?Q?HtYf0eLrOVO0/hkYsfJzFse1Gg30cO6x5pemEmfAY/GS7qux0tJ1XWkmap?=
 =?iso-8859-1?Q?qQMyTSrajQ/6t3BQ8sghFeNvDDL8Y3oCTAeB2wE09Lj1/zId9pwhl3pdCh?=
 =?iso-8859-1?Q?ufmuACvQT5K4vz8/YeFR9bwXe87O3fjfuDctfsnSMhfFMoW67YBoKD7Z5z?=
 =?iso-8859-1?Q?96IltayH7J1j3w9vzsaSVI6rWuqa2DFCJOpmentuICN+LrFIgGlKQqg1S/?=
 =?iso-8859-1?Q?jURZxsaQtUgOlVsV9g1bV5sixJDnMSe2xRMJXqhAB5muyzeBnliFzTwVGd?=
 =?iso-8859-1?Q?dy7rskOkan2mp174Wy0+7EZX0RqW8StkUwzByUuuxbORZoTWOB46eHAZGZ?=
 =?iso-8859-1?Q?YnvrdTj9XNe+7coikdKseOMIeRFbe1JFVqOn8WF69QDMuf+3Qu2tIuO10J?=
 =?iso-8859-1?Q?9VmHUAmxnw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880023a3-6861-40dd-7075-08de7e10df6d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:20:06.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2ix9iXanCnbb99YjpF6yyS/yZopeNNxKEeS8BzfBQNo1gOc9ZHY9s4N1wQEmjATsXRvABSmNEJYwdYfVaf7Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11419

On Mon, Mar 09, 2026 at 03:26:11PM +0100, Miquel Raynal wrote:
> Hello Frank,
>
> On 07/03/2026 at 09:39:44 +01, kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   3f9cd19e764b782706dbaacc69e502099cb014ba
> > commit: d86e70e9ca995942e848515b089e9be7430c862e [1683/4342]
> > dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
>
> I'm keeping the patch in my tree for now, please have a look, otherwise
> I'll have to drop the patch. Thanks!

It is caused by legacy nand chip layout problem, I were tring to fix most
of these warning by below thread:

https://lore.kernel.org/imx/20260306214226.403672-1-Frank.Li@nxp.com/

Frank

>
> Miquèl
