Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44238EA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 06:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENU6/Ge1d7absMcbsPUPuACqQ+Tyjtel4gFm2pyAthMCVXMEMWT9cDIjzFG4UJhD8P/pFc8AOPsfdSG+2dHKJ9wjGDFOND9JsxjAykEJWaEJTS0tBpU5ANAMXJzFFF+awizB7J2EBOgYCauvS6ryYeIjW+CF7ArzMU9N1fpod51C1mt0NOdRTzc29/Wzh6ocm4+ifb0pxD455uWNHUj+TsSnHXqqt9p5krRTG2Zu0ysyHm41o8RIAqshTix6ZrjhX3GIPqFPWkQOA4jT/wrUqiGu4r39uefCQvJmbvBf04arGLtvEhXAbPE3MkoOrIP9AXBSjLcJB0kuUCk8l9XDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhNtNt2f56rRCcLGJwFzR7Bb7Husk+tYhWQ+BeeauOk=;
 b=j6Z25DTmjXVLqRsiRA3d8uwfheqVvDE/Ah4ANbLZtkrLPqrrXDPZpZEuwqQod+fSel2tF8iDefKaMxm92G7VxqFUbsLKUSPlfuUo5rce87YqhEB/177Xs0eBfIwxYeUXMvclq5fMwH9+hIeii6RNiaebwRBkohQBirywlrZVju7lnRz0mm0rBpTQeJ+fZjkAE7lIFx6kElD55AisahvIcJwzJgvjFOuRNBEjCKw2ERppRhxxa5lX53BmBRwbvbwinL35eq4t1M3LpXhTNs8Q0BiaK07qNEWJ3JYLBylwJiRf80Il65yhf3xme8qjLRRQvRO5exIFVvUL8jCoTguaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhNtNt2f56rRCcLGJwFzR7Bb7Husk+tYhWQ+BeeauOk=;
 b=XLE9FfQHLqCW7jlotDVxthvlWMk3mFSIkP6etR/llTx7lR0zaFBkBFVawrNISMOyCJ2RR9wIlx/ZXPFaBZDohAce1JypW9WkraRZkEYt3gkrzP/7Nz2XQvAEaXtrhBhsI51BCTfd+Kf/BMGc7c/ENugSwUOrmkJzSBM9IUv+ZF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11463.jpnprd01.prod.outlook.com (2603:1096:400:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 06:25:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 06:25:02 +0000
Message-ID: <87tu0gsb41.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 09/25] ASoC: rt: use helper function
In-Reply-To: <202301241201.jBsUFSYu-lkp@intel.com>
References: <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>
	<202301241201.jBsUFSYu-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 06:25:02 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11463:EE_
X-MS-Office365-Filtering-Correlation-Id: 030c7a20-231a-4e19-622e-08dafdd3ba03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Noa0n7Tw9x9wEabHjR0EMt1Rb8dfrO0NbifQWp8WrnSYKR2pdfXhNTFNYYWHjAw79ch3/bvcgSkQ5Hd8U+m1cQZKBJCbUm70icanDVYl0Z4EiEWAoXMq/mnwfM7HV0eI+wA0UtzG7Rpr807McNqj9syIjM0JexrlCmsXe1wnrjbhg29/MzEmJ3Um/mI+SZrBMYXz6YlME34wWHTnJMPmEYq3iuHyjLn2IFyMLo6Skw0aUUY3rqsaxugutHNoeyogiQ7JPMrfUXs9OwJsectWugJAkrVI9bkkLgPyPQwtkDKMd/qXA7n/VyFwaobr4XM1giMhbVc5ouU/juWZ3DbfARs13HBEAwGX7tgzNVNQAp0x273CfzLVo+TXq0bcOURBCRPFdNBX+ivpcq2mPJ1sdD8Tms/TEWlg5QfQmnWKxGnXfmmlEyUfCOmzcNNctTvcRSXyEP14fCjcCXYKbu5gcFDzzHizskmFF8IKMhEYpEBpHfGT6yyZ7ll0ZVd5ICJH7pmoOCUSQqqkKKm6ZeeO1C7yrOL4cY7hqKL2N4xErFF41UfFGM0oZRm62swsiS4Pes2PlB/iwhhgGLi48lQLq/2vGmLuOyu5iqNlA97r+PyFAjq/ybQQjbohyVkiO+EzV73EVPVf3d/Xyl5M+K6xYaBUpBKeNOyOAhyJIVVbwzrs8v271br+1M/MfGGSk2BpYVCnjCPcSoZVGpHTpVKQxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(4744005)(2616005)(2906002)(8936002)(186003)(52116002)(6512007)(316002)(5660300002)(6486002)(66556008)(4326008)(38350700002)(478600001)(83380400001)(38100700002)(6506007)(41300700001)(66946007)(6916009)(8676002)(86362001)(66476007)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kXCSMq9RQRYWYo2LOPPKDlzIzzbtTRyqIgOG+MmC1IDXdaVbwXlbuaNs92LA?=
 =?us-ascii?Q?4K22olAiCROTJ+M7oue3Oh+S17gvhXTN6bUxL+SAGKR9L0Pcxlkh9fypyzuz?=
 =?us-ascii?Q?vh9zwZbRw461DAHxYPvZKASpvrYVaNb2GwBKb3vbZ9eSrakzNddSRKYCOfv3?=
 =?us-ascii?Q?HBtMeHhiBbje9IU6FKk0mVMW+7TpvLRw1uCOx3fq5OrXpMLKpkoucCeEJaA+?=
 =?us-ascii?Q?XvMv3onAJZq3t8fF9QGLQ7Pr6gJxF5dDxajpSDlvuL3arIFcfmbc+gpWTWxS?=
 =?us-ascii?Q?wZCjRpWGjU1JZev4RWGbyEGA0ZvGqEAtd1MKwTN8xcMKk9M7egStPuCwm3dN?=
 =?us-ascii?Q?lP9JQnMT4sdvtaAU4wyeJvbgZl2ddaMDe+vGdsGJHhEOYzj7+TmIxZTW7SOG?=
 =?us-ascii?Q?vJFmBb8kITg6Fo3O96GfqS8GSNPUWsdLJWzyItAuUxPokAlTLVpWjgePcfaz?=
 =?us-ascii?Q?gf+YQRvtZpPBEFRgqi17wB8GgydD44U1DpXO5tQU72ZAYvZ5ERLUPV5DKGA0?=
 =?us-ascii?Q?ML+KdC3e5Ro5mOS3V+sj9Q+/9O94b91DMZeCOjD4cSMbdRTVl/WUAKNxvyck?=
 =?us-ascii?Q?keMUSUW0Xwek6oqIpXxY5mvWSTb/vk9WFyzsYw6/YXk5AmuvidfP1qA2Q97F?=
 =?us-ascii?Q?iSLSH/vUlKWICCnICEWBiQW4GeGcaO4JyXNFFv38VOpDOQKpVKpV73XRqP1B?=
 =?us-ascii?Q?n8jbR/RZPSaBvnlzw66ZKdNoCrhWIOQLE2cS0adnWRdNKHkI62qhi+dch4M/?=
 =?us-ascii?Q?NvS5na8jZcZ9DmrvvuvyH3lks9dH8P6fRUtmf54h+f9vCMOUJHCsXjSDOzFp?=
 =?us-ascii?Q?lVVEK96u7P9Ryssh8yDzgObzf/rBgWm8DqrCVtjcBLcTiLiCMNj17LUFeRll?=
 =?us-ascii?Q?WRc8NhqrMdOyQ2+accA0OdVp3JfsY9zPt5ra771AlyTYW1C8KbfK9UHKNVJa?=
 =?us-ascii?Q?iqd26kN5xBinmmwTF3m94nJZUCJrvOq9fheea9H/q3dbxCvALBJhdKdXKb1+?=
 =?us-ascii?Q?88H8DJwghTFuPq277o7kwQ2Mfmt/l1PRoOlyg6OIPuJVblGLyxs1mS9F9MK7?=
 =?us-ascii?Q?wsILUFmc4b2b/hT74kebVoaiE8BiuKHc0Jo/t4CjZLLvpd0Adz4EZCoab1nE?=
 =?us-ascii?Q?O9e3ZOqg9dH5O+PHVOsrlFNq01aWRbQjxuxMnGTkNoTi/ComszvZZDUT8vAp?=
 =?us-ascii?Q?5rpty8VCuvL6SQ50Iw0+kZuRkuIBPdO6NxhRF3Dmfo0erBoM/DfAFWnWNf8h?=
 =?us-ascii?Q?orij2AQF+FUftiDZKhSzDvZO3iTVIUaVUjqQvLEys5/fP9sJgWkg1eAUUn2V?=
 =?us-ascii?Q?/R0neCUjjCquMWtmC4K4AP5R3I6a+kd4sNbgLffILL1Vjs+nuB8Fg6bXDxKn?=
 =?us-ascii?Q?jxxCuA4AVaNySW6wSuz66rAU5C4XpOXtjhAqB9taQNH/G0EGxC/aU90H8Ajm?=
 =?us-ascii?Q?DOKPFOrrKZvQRPFfZGuqLmvUKA3S1Hqm8jCG/GdlA2umuMA5hGK4FZVs5E84?=
 =?us-ascii?Q?QyDtTIFWinz7WTaWeuHueR8rBGX/5tvoEXP9yx2bVZ+rJYTURlXrTtUXfHIg?=
 =?us-ascii?Q?erCBNLwoU5nJq8Nf+pTWZc7SQcfNminPWzHKGDgGvBuR/QwCneSvtYCXrECQ?=
 =?us-ascii?Q?pIyl0V55nWdhWMNbBmXUcOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030c7a20-231a-4e19-622e-08dafdd3ba03
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 06:25:02.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/WZK9HH1p2xcxEnr68IZpR6H2y8dFzZ2YC8MZR/POi5ZeVpRsy7KCpqbxQ7flL6PvfId7Y8o2NNUUPP/EbZEPZKZEFoOmvnfjtr00VrI2hevglyZ+SQdQEkZQPkoaOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11463


Hi

>    sound/soc/codecs/rt1318-sdw.c: In function 'rt1318_set_sdw_stream':
>    sound/soc/codecs/rt1318-sdw.c:578:12: error: 'struct snd_soc_dai' has no member named 'stream'
>      578 |         dai->stream[direction].dma_data = stream;
>          |            ^~

Thank you for reporting.
I also noticed that [14/25] patch has compile error, too.

I will post v3 patch at 26th.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
