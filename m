Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2054.outbound.protection.outlook.com [40.107.113.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EAF138E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192772; cv=fail; b=BASECS7YMowjGS1NhcF8+kaitSSBLQf70+84CisTQ5w0+E89zjxREJr8aNjiuOs/+Jb96nhvq0HTKzayoFIFwnqbwX8I/gyOFuwurog7kP3bkwvUNocVY9BtLR17V8eJS08MhaYO8EW5zsGjsHnX0cymT9By5/mT/bbJvHs7qog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192772; c=relaxed/simple;
	bh=a5cSZRvYIJ1xsUEZhlMipPVyvjx7Lf9tf7d1kcmAtrw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BYry+icc51XWFC1Fyvo5MbLYRE0LM+UlzkuhRTy3t2HimOaqXqQyFLI5mW37J7GoSgKXciWZJHNy3O3ql0n9GjxdTcSQPBZxV05RO76BK2zGG+f/vyx5bKJ3pAVWm+FzlT6Gr3hyRnpQKp5PwOyddzyv3H3+dtMQlSr3s/HC1Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=goKxtGEX; arc=fail smtp.client-ip=40.107.113.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="goKxtGEX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnXY0gNsw1iCVqPHy4DjLsNEhSx4yVy+hYw7mIlemkG4TaAIRvxJODSSeNqsDHsLS0JZzOGQkyhSoukb2K4eIZlzEvJl2EfvvwE8mYmpTIG/YB8B92hQLseMbcl3n/pVG8zQg+DBnqjBWXTMo22SI7TbSPC3pN/R6swOa46pWXrIBMUxid4AAogzmO6DAtVpDhoI9sq5c9luX8NCtgEOBB/Aph2ztenP//UNMtzinwhnrODl+ZWxSNvd7GjeUFSMUkYlcGhGLQA4qqOq+BS06NU8JNSDFDuEBaLOwNC3Wj+/lNX39qEci+nEUF5n6QKJQbRWTRCGrGGJgEM00ydw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRbNaJBpbliy7SKmN7CbO25mzfO3ynkSZG+4mNWdX0g=;
 b=YRwa/xzJUo2sQy23cbUHmWWa9V8YZ3DNFxA9OlOYWtGi3SyKgAcEmDxwD2h4OWG8bA0pvDgapX+6f02tPHjyxAkjuE+fndy1jip71A+gRCkCCPwIDAidIHjXei3UhOhOnHCrN4UiWX2ttiJW3zK6ZMgFWrP7xD3n9oKwS2deHy9wPY15PFrSa98Hbctg+R+w319RG3XLhXY7M9ilzd/g8GDexjrO5Et+Nc+Tl9bsN51lbMG+7Yx2ZLBPLStVUyFZDf4HebkPlHb7bDX9rDVbGy8RrOxtm7v3uAUfscWJCEh70IGiTaq0uRTeAkBgzE0aIdTfNrDHo2jPRE+7B8NOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRbNaJBpbliy7SKmN7CbO25mzfO3ynkSZG+4mNWdX0g=;
 b=goKxtGEXwmA0bY5mIYmiD6agruoZbnUsB6UGdClTcHvuuT1xhwMfdH0f00nnJWyMRMf4wUvh/eKqyZWNW735ql5ErghumbeUh9zs0/G0BGnJ1zKJnRPsdrtpm6bTp655zD46wmafXbb0YEnGAsqt0K8YRHbVbZye4wHmktmAjVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6968.jpnprd01.prod.outlook.com
 (2603:1096:604:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 01:32:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 01:32:46 +0000
Message-ID: <877cefktvm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev,	Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,	kernel test robot <lkp@intel.com>
Subject: Re: [morimoto:renesas-bsp/v6.6.34-2024-06-17 120/132] arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed to match any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r8a779h0']
In-Reply-To: <CAMuHMdVSohkXcCQrcmoZ=sTLjTgeAgsMX3chECO5Sscjd8W4GA@mail.gmail.com>
References: <202406201854.Pp3ZqJ0W-lkp@intel.com>
	<CAMuHMdVSohkXcCQrcmoZ=sTLjTgeAgsMX3chECO5Sscjd8W4GA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 01:32:46 +0000
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: f8699f44-6f61-4bdf-971e-08dc93ed8ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|366013|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pxyU31AWQP1MHjfel9DS9NiOBngyES+NHjUCSZ19Ren3C28AKDPjODSjmzio?=
 =?us-ascii?Q?0Q8GJwR7n02eBjMSRuRe0dPCUAPD25jrQB9i+KLNpY1kCWQIuXUzpYLfSBdh?=
 =?us-ascii?Q?XWci3V1RQqwAfrfvgLoWV6ya/Ml3NvMxw7cP86nkEki4AiNTl8/JnutN1L9q?=
 =?us-ascii?Q?/ES9FGd7SyCZT6XuF7qYswl7sDs57QMvm2dQHlTfFceiR3OScwkrP/l+J+aB?=
 =?us-ascii?Q?ni9ygAJ8raeEQ1MqVCQq3demRHxE9CESXddbdH7XKUrMuR5+Hcj/cDZ+69gt?=
 =?us-ascii?Q?y+HQjqK4rNk2g5g38hQ7xwUphtSi0g90fLgpgqn6nMzMX5rhJnFntOrDD/Lv?=
 =?us-ascii?Q?NwXI/IG/9xgW+aGQCyMbarVPuFhpSV8LH2zyuum+O3yYzT4X1s/8lBw9znA/?=
 =?us-ascii?Q?0T/8SugOCiQiIf1XtdxmJ3xYkS93zBe+zCcKWFcNY2FS3w906QO8gAxjJP8d?=
 =?us-ascii?Q?8ciDpDS4QkCDnks1oE875qn2+CntIh5roefbnOkLtJrqsp71sn80MvLFnJWi?=
 =?us-ascii?Q?Phd/32pAmydnrJheds88vb7OozizoKJcFj032zh1vXxWDeq3j5aGNO4tyNlt?=
 =?us-ascii?Q?Hh316dMSL5TMNuYjpZIuRIxg2Hqmwd3vf00/diKOvR4xmacaNoa+mLeZvt+W?=
 =?us-ascii?Q?ffAvAZfFtr44x+CN7MPGmn4MfMqsBEWAaHOkjv0/TJKkp8dy1FIPViY0lF0M?=
 =?us-ascii?Q?Fnjp8AKHV2tcfJWn0HmHT5A61oghCqJpVrcKntnLu3V4N87JTw5diM9+LAvx?=
 =?us-ascii?Q?xZvwVFeXccfY6G9RDRgfYfShvNJUuByDj+UjqQQGH7ev1XbsPqHcbxWA6Q4P?=
 =?us-ascii?Q?+Z0rML8hVNCOhTqmavzIh1sN6QlwCVl25zPiFBKrgu3Tws9NetQTWoWkUV+c?=
 =?us-ascii?Q?9UjJpfNytsgHqnNH211FiEjdnLgFe2/m13UTNm9f+1WpdySCGvQNxSF0zmGv?=
 =?us-ascii?Q?g5gxegTCZDpW0Mg01a7DXrPi9mDPGZ+voyP//znwKNBy0Q9PDa2/TPUPm7A1?=
 =?us-ascii?Q?Id90p+uy9OLpnoHztj873fE0VIepMGlLHtQ+2hnd8WkCGEFotHuWkEz9WF5X?=
 =?us-ascii?Q?pDt1/Q7IbkaLujRisqQNjJDhazhkJqjTNOJco83jtL2F1aOGwwMR8V/TbCVT?=
 =?us-ascii?Q?2olwpb6MVm81fE3L0e4MglvdYbqNKu7dPR7QOpv5ayHDhF5VZW64AYpXRGKU?=
 =?us-ascii?Q?pkMgD8UDhc1a+2U0X0YBVhlwxdaAGeA+QYIVgx968tPfTzVVMdAWij39Wau4?=
 =?us-ascii?Q?ipsfgtYkA1FKjnn+eGHFBm7nECYwQ8bL8tT8ltkbwLIh9Mf3vD8nMkmFGj2g?=
 =?us-ascii?Q?z0HLW3se9kxvsWIVzV3io0VQHwcEw+GWenozYPuhTnlV7VL9sPxrzwI201tM?=
 =?us-ascii?Q?kA98Zpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(366013)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9hsfGmNNRHQfDSbXakHSlizm3UaOK2uDIt3Fm3YqeVTZtYDWZQgj6X4gVNx?=
 =?us-ascii?Q?wD5OPBK9LgNLH1iQSanWp7aq5tr83ZGNWS/udOvM1IHfDc1Y51ebVP2iaL1Q?=
 =?us-ascii?Q?EkQ6k2qhYqroJSmP243tira3vU/DfTkAVmuB5H4anIhhKleAjxZdWpekZ5PL?=
 =?us-ascii?Q?y207NsT3VzaKXqB4CgIdGHzD602/4iQPr5i/blMjjZyvlpbRJ4tY1inM4u6P?=
 =?us-ascii?Q?KukUcHf19gpBcuQw+WV/dODd8RVS+5B0fjVCjpRX1lElYLGWB8kIKZJUfTYs?=
 =?us-ascii?Q?SlzbI3CIWCOzURMi9Zx/MHmzUivAa5jHuJIlDfCpjS+b27N/qfv+HpRADkgU?=
 =?us-ascii?Q?7+aX0K/HdZmI/txNgYV3mYohmOARRkhRA6vILbpx8GsSCwask+aW4hpHOcsq?=
 =?us-ascii?Q?V3i0fDedgVgh7yh9Vj1Tf1b+YT9Kv/9yAnqQWdmo42KXD/D4hahNAfYfGZsw?=
 =?us-ascii?Q?g1Wz1OYOKUruQJqPqrphcGmUBfqpU5Fz0SZ6TWfQXOXn1XDQqxsQmoIM+BQu?=
 =?us-ascii?Q?phyCUf103oLGx6/ay2V0X6UXOWpmuBkaEsNY2iSBWdWLeMNGOLINy1v4J/Ss?=
 =?us-ascii?Q?p0HOqYZBOys6IyXX3BRg14hGn0Njxr+sepPq9XPiu/yWiFmchF/nqRVmqD1d?=
 =?us-ascii?Q?jPmN6A4gykPgfGCHEx/GnJvtmuhvb4e5pn+hpp2YKUJX8LtOHvkAofcN8P8J?=
 =?us-ascii?Q?8ZjVGLLlQa5lRbBBm1iDdQewbS2tja2+n41eYDXd3z7HPg8OFbTWHDfeGGCQ?=
 =?us-ascii?Q?lzK/nJDJC96fXrYt0GLuBQjOC84s+Qh4VwqkkhQUfAuJSjgFcHpBBoJ/gV4a?=
 =?us-ascii?Q?DJIX/h7ei5PIMsNZ68xt7INDESrjWKLosgVtepmydRIVYc/tBoBN7Wkie+Wj?=
 =?us-ascii?Q?8xTfNEOj/l8mp0SMB/ayjD+uVo9lYSSptomCkPuCW6PEO6Ir+puDuX8Pr56C?=
 =?us-ascii?Q?aXg9qz5QZo7s8H1QdnzltzOTr/6b5LdjAAv4M/e+bfYfHoeEUbzLG9xQj3ie?=
 =?us-ascii?Q?dSe6GV7/aIlgEvHOflZj6Hxwgb0HFj0f4ErJtkWVFt1ZBmICU/wMUvzP0J0I?=
 =?us-ascii?Q?GpMDp91E5yaDlVZJmVZg1NKdJTGRvdc+YIxUwMyUJsMvLVzOoBhkw8JHacnD?=
 =?us-ascii?Q?l2lyjeTpKc1Ih5ARC+oO6/MyqU+3HCUDcGrmN7c74VsFUoKfVUxAILGiohAB?=
 =?us-ascii?Q?+fMFdg9/uoUB47izQ+gnxxBQPAgWnbjyjPG9fanjUTJZV1JAKKGC81WML0Iu?=
 =?us-ascii?Q?VBmtJ33ABjPN7tKFIFcRAEs66ywXMH5yCr8ZAl9moQUH+QPkRQroIc2Qqe7x?=
 =?us-ascii?Q?C3f9GkYedtZFPNzv0kZKu/Y6Tv8p/A3DqKcc14w3TsGX31k68u04wKpc5hc7?=
 =?us-ascii?Q?RzrVYMix9dQssJCJxizU1Wp6bR7qRItbk0YBna0td26xVy9yHwqwkYoYI9pB?=
 =?us-ascii?Q?GRZUwTfQGDtO86RvWjRP4JtyiVMKhVENxnKMbTDc6TQeO8p255uOMD/cuaGn?=
 =?us-ascii?Q?AiyXrjVZO9fR+FyRq0JqOdnjbR9QrwfOhbGXYD9dKQ1S2jtGih+iUjMHVdiZ?=
 =?us-ascii?Q?XGIF7xCEO5I0aJIAuM8221eZkxBRtik0Adwzw7eVWgnRLR32DGXjZGlNB+QA?=
 =?us-ascii?Q?OHl/jf6TooaQXW9qv4uRQ0U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8699f44-6f61-4bdf-971e-08dc93ed8ced
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 01:32:46.1454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9gtG0XifG4T/AVZCMhl6uYi6tlFoMIf7VFbvC5zxNSJZqrmg1LInzwfO9tFLOiFgStpf9YDGfk5cBqO6G9zdG0IcXQG7c1dohZt/wmr3qvvBXCtvbSzZ6kT4pJyO9xT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6968


Hi Geert

> More to backport ;-)
> 
> Here are all the recent changes to DT binding files that contain
> "r8a779h0" but haven't been backported yet:

Thanks. I have backported

Best regards
---
Kuninori Morimoto
