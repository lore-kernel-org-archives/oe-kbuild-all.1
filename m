Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029B242D88
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202793; cv=fail; b=EBlBRbqU/2myvODBaRY+Qw8/Vcaf9H4mXHKagzFEWExhers6JTvbaCMoymXLefrVkTdqx39lMD0v8P3AyoQN7bV/GXzeApNWieqrmAyFAqZAG5B7NzFV+eNXX4yMAbYRLpyHGCBDjt8lSjb0NKdgFvF1AdUo/sBI+ZJttyAeATE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202793; c=relaxed/simple;
	bh=GussXslallja7D0NZz3Fquck8yYoTfNeNsp85pbuzoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tjnS0BJttfBVlcCv6Kzew8YTekt7khsuWPy+dc1VqzKKrA4t6y1jBghUpWrFGlOUPGq4RzwPva92aM5vJTE7kGTOyPByChvRTs4xrFFPtMxdzrjZ7teRmGjRuTSSv+91AMAliefmY13EJ3LyVfFlVp+3UAFNwOa8Pj4uL0A2fVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MuRdl3U0 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MuRdl3U0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dy3Joe60WAC+vXWQYlsoKUGezStbxNTGyYIyFM0N5GaThY1THxx0q9d1KmYqfU02a8m0DRhJfe/KXCl51swQ/9pDeFVKL16Gxhc4xXz59V2gDU4nkONoBhtOdyZXzV0T/xupQr+PZMT2R7BjmO12XSpvzN6jp1eZPbD9TpZZlrVps+RxO0YKnC5DKl/ZSpVPCnSo7dG14X+gPwCC0ebjUkiTIHbgDRR8A2hY1dBez8qgJ0Gh4TrId8QR8vcLQoAS7CpIHneOhdBON9+AEEOk9ecDkEELebgfDkNLOqpOF5rFds9V7ddTZfLD22raGoPjCYWImqKpFPMCn6pJtU6CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8MPz14dD4GSVrHYRZwW39e7JAoeoVih2yvQ97+bf84=;
 b=fVDl8jTVDoy4Izqvo0n6Ai0/qL4eiHc31w83kfdjbR2hlwJHcMwXtVsl71zMJSd0ujwJHoOkSAGALayAci8FVAUHT0Tb5JYZjywDXYr2GWOHPcvBQGi+J7K4kjY41ls1oggGDT1J4kxbyJFyoXnvx9vZbqvEWM76p8zybpsDJO6yB1IA4UBYw69KNxffybl8s7OyLQTb7kYmG03KYtP0R3JCOEKfyGi2OJ5jC+wz67hGEeD9LIzbYDaeHabzLckP71cGq4QYtyplyQkEy4yFdwe/mrnXz1ueOu0H4sOL7cpQ2Y2wwfMZaa6njmppf8snks7kYYVPB0T2Hv00Qm3etQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8MPz14dD4GSVrHYRZwW39e7JAoeoVih2yvQ97+bf84=;
 b=MuRdl3U0L0jpf+J4fD3tBxHUOoa6cQ+2VDB3CzYp1HZP4JpmfKIUw1YE5qcFoLqp2AEE6L1BsqOXxJ+wmdIrsHOvxL2E4F+lHvtTesxQVl1i7mcVTVlp1jtsRlYqdeL+i70ONSae+dXKMcvSPuHKYwtAqqJAtsExfGpsE6NrBctBx/E67YyqXaVaktAKpTLNEUQPnfULovL0xpJcxMEQio2t50xK8BatpHcGNQN2ZQ2KCmGQa5kwBTCZ4Pyg3DZLMjfa1DcZnnB28AB9GayxEvefLc2wd3+yZ4vndgel90t7ZDPZdyNW/fD6/jqcwHfiBFQm9phAH80a5JMSXc+N3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 07:53:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 07:53:09 +0000
Date: Fri, 3 Apr 2026 03:53:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 8419/9801]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('clock-names' was unexpected)
Message-ID: <ac9x3cn_ZwpzlgkP@lizhi-Precision-Tower-5810>
References: <202603271742.UMycleyh-lkp@intel.com>
 <87qzp0828j.fsf@bootlin.com>
 <CAL_Jsq+pOUuLPaPzQzGVQ_ENq_-7481cxgArbxdSbrPSVpafJA@mail.gmail.com>
 <87fr5g81d8.fsf@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fr5g81d8.fsf@bootlin.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1be2e7-6831-40f6-4312-08de91560c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014|18002099003|56012099003|22082099003|220923002;
X-Microsoft-Antispam-Message-Info:
	5617lMNJqmzgi2MObmphE4NLwJ8IgJao4hxTgDm5iGjFfVdOIK363tMAhP3WzOkxOk1fwX3WPI3/Z80isndbZ2wtdQhs4CdHjY/vGP57mCjDk9ycaj3SWbvEUl2DlaV82fwEOQHkJ1Pl4Lt2mzTKvzRn9i0PTbWvMVa/U+XgQQg03zSEr2/rseZtRltHzKUVgvCk12kqbZYN96wrnG4WJM3d24c6S+DKmqbz1TZXeBNTWOmEg2WhhsJ7wysLAUGyQYovTDiZ02ZR6dR1Ky5ATb5y5WtEPZrGUP48djts3u7byQYZ0NkSzmbJtK+GS7XY01NlJVRleNYtfpauyat/VS67WaZXgGcanRiT+c3+6GSSWk7S/U+TskOCtY4uNouUohC2mED20ZbBr7OCebjCoz7dxTEwos9yb2Rxh6pPWJndnKXqo7CB48qs9W9R4wq6UYOO203jdeO6Tk3TkU/9u2RcBYh1d0weibyl4dcCmxrQl6w/NqZtQ9eekVCQVDQP+hyUOLIdcaHpNTutC9MtMr5MXTd+nCyIpFkW852IHbftZBcNrx6VFSP14Jji6+Umx13FwpNhw29dMA+7rh3ga7S9vag2r/emL+cYcVogzeHo2DDky+Hl7lRXrC5gTxBqPq9jRNV6ag0pqPwGE6TAznswOp/Kig7OrvLp4w2GqnVfG2hZD8O5sb8k9aYta2fmYeOzTIeRnzM1rrCn90y4aQEVsEaNW3gFQQK+wOZzOwxj4A0l3TyMrmFSJtxEVZx6cbXtI+H0fvoPPTvaUfdsXTMFLGmqqyi4AChjJ6yJtlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3h6s8JBQbGagjIhoZoIMUxocXtf6XNMpI/Fo09Ioh4MY/uTly+iJeS3e4G?=
 =?iso-8859-1?Q?5XIImN5A6ZmFr75mqOzeuh4hYHYgsAX94x0LYppAPOV3MGZTHCjohiN4IL?=
 =?iso-8859-1?Q?IF/TJXExD000mAQ8Z5WPFHhRggv4nc7EMz3GOIRyXAAN5yTHaQDQamMaMK?=
 =?iso-8859-1?Q?w6YcR8BayFx+QAlt/rUvOkqUHAmlbmcNAt6tur0xHir+0bhrML11rGin4Z?=
 =?iso-8859-1?Q?VPiGQ8Wpj7MhFuzUyGQTGQMK7LGrFQ02MIespinYJCSPiufgVjf7Robr2l?=
 =?iso-8859-1?Q?zKWtRPilJJ7sWRuEV9aSfXb5+TGCnhwT0t3UB8Bft5QyIurq1UnLHF151u?=
 =?iso-8859-1?Q?y4f13ClhcSO9USYeTRKE9D28xzf1tVlvhMGfXRVoXEf85th+7YBehBAaih?=
 =?iso-8859-1?Q?H8rtbruceZve5jqsRjFe7z90/ppfuCgI4uNR5G8X1hbe94zqiA5rgxxObf?=
 =?iso-8859-1?Q?6UHPWlv/9P+33Qq6rQOOxtruCWVf3+sEZQTiMJjO1IzXtabndM+XhgKOkl?=
 =?iso-8859-1?Q?TrCwguy6eh/gX+TF84DEFurZ3ptTGBzJtKK/9bbhoY59iyGsdscM3S87Zd?=
 =?iso-8859-1?Q?HX9r7JWYlUAEpCy/PX/8sh8DUC0YYgKSWOP7aLrSvYSyzgU2BunAbgyTSb?=
 =?iso-8859-1?Q?HKMeGaj+G6+nGEtgU4sHWGYaW1LVYlqP8rM3JPu8QW68M4/efhoZn4o3T1?=
 =?iso-8859-1?Q?DPnNgwmJ0mxSOwsJHMXoW/0XbSWXg6frevwXty4FXbAebCDIgjH3xnXfyW?=
 =?iso-8859-1?Q?0qUmscACXL/aqrGKUo0o+g/5j3frVpmGd89ATuUGn2DkMOOFjhUJ7e/FgQ?=
 =?iso-8859-1?Q?3GFUgwsD+8kqiftNCH7QMfEaAhPH2gXbCkKVFIMmKde9n8FLQyQS2IsCz0?=
 =?iso-8859-1?Q?6OEYrKWdckunKv94HDoD+tC4e6xw+lQlQCC4YLI0jeKLp6zgjP/coGEa3X?=
 =?iso-8859-1?Q?HBw5NcXgl+MLxuMDBdyg2rnOD0xdKJRZ+QtHJI1Bf2bee/EAnEqoLp2H+f?=
 =?iso-8859-1?Q?pE1214cfP0ioyYu4EEaE4YMdDWteqmAd3BqCtg4f6QZv3/Bb4J/iLF/ZmX?=
 =?iso-8859-1?Q?dzxPZSZz20wCj/qP0CsXltpKvTFyR0bmzTguToE3Z15Uxq2LKjXGYHy4K0?=
 =?iso-8859-1?Q?bkFaz8iZztoetW8rxS+/9P2285wpYNyR+cD6U6jQaAStFXFMHJYiL7c3zW?=
 =?iso-8859-1?Q?N9h8IZNR5XPugTnC9uJ8PrpKUaGpTqfMJXM1/MK558b6pWvvwNwe/5JMkm?=
 =?iso-8859-1?Q?Zw8e1lR9TM2Flea4PV5sZG6/qKVU+rczBcp1f9x27Agxu1HiVedtld4F8P?=
 =?iso-8859-1?Q?+JArRhOwPH2JddO4Nax0Y1mLeemmyoIXhIs9oz9ihdeTRr/MYlZdwL9etv?=
 =?iso-8859-1?Q?EoBL0XhA17kG5o49gucUg+0GDBTPViZIEh9lORwl0ebgjOMMZYdQDQ4tax?=
 =?iso-8859-1?Q?dINDjdS5vrvY+ekwxSAvNe11IpNha50/zhP/9zp/jvr8gf+FIm8otboh/L?=
 =?iso-8859-1?Q?lRvAeH3KB5qjnmgx9T59/Qct7ZBjQf625/CgpaS+rDvPyDu/edHCksfJdX?=
 =?iso-8859-1?Q?RzB2E0aIaZqu6umS9sVekMO1lQG4C3Psw8Hxw73mPoH65ym5L2cl7+IPwH?=
 =?iso-8859-1?Q?mqDNLOtsL526JO2/GIrxipjsBQhhohmLmNUqQ+RXIJXh5hPSkK56+v9Ghh?=
 =?iso-8859-1?Q?mIXfjlEmz3zFRaS8XRuIN33YaxUyZB08ep6Lu1YxQ4L1TJ5HjcHgxawSGL?=
 =?iso-8859-1?Q?/4l806IskXX+gEetoZ8NsYWz8X0soqoTnW7Aqu5/1Aauql?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1be2e7-6831-40f6-4312-08de91560c4a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 07:53:09.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfNoR8RdYAkaKE5jiCSmA+KWdcnFqQgkPSZVOPUBEngxZOzINAm+cJfbQ5huz7LZ8ZtJIwwFXnjFvFnEc3u7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

On Tue, Mar 31, 2026 at 05:28:19PM +0200, Miquel Raynal wrote:
>
> >> >>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
> >>
> >> I haven't investigated the problem, I believe we do not reference any
> >> yaml file to authorize clock-names, there should probably be one (or a
> >> manual addition in the -legacy.yaml.
> >
> > That should surely go in a specific controller schema.
> >
> >> Can you send another follow-up to tidy this up before the merge window
> >> opens?
> >
> > We're really not close to no warnings on arm32, so I wouldn't worry
> > about this one too much.
>
> Ack, thanks for the feedback.

It is dts problem, which use "" for clock-names. Fixed patches:
https://lore.kernel.org/imx/20260403074634.774234-1-Frank.Li@nxp.com/T/#t

Frank

>
> Miquèl
