Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022138.outbound.protection.outlook.com [52.101.126.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09580366824
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096692; cv=fail; b=qOVgPeFl/xxRfcDq4SxmDY1jScZJcrlyHKk0iS3KVUTKp1cXXbVAPz29QyKgtl8Sgi3wqgSRE2GoZUWu7+1RUUsPfBNkjFEFHFUj5lJFWDnrRBKix3IR/DP09onnM+YH5F4UJOKAn+Ex+dNej0vlcBwmZBGtfakPIFq6J2/MoEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096692; c=relaxed/simple;
	bh=UP5ghnJTJkPibxnv04AzIa7AN8RJBHLrAn7DuKdAQdE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L4yXgVJy9iWkdVjzqrEpYQmjl9Z82QpXWx2q6Vpl6pwZFPiZK7M+I/LpDar10PY72/FS9p3OiAjvXaP0+XTgEOGkPRA43bi2Kuv+I+v3zRNhv4j6FUM/DRvU0YGoHm8tyVor64Asy03P4BCtdcPRdz6/wodP418pWivC0Jxmxrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=hOEuvTf4; arc=fail smtp.client-ip=52.101.126.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="hOEuvTf4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSUW5sMW6HBF49FM9gFKm9z4kJkVdEEYS3tfdQP+DnbioKG0bbKwfUuwgZX0ma6g5aRDVLGrbBdKBcnKKAmhD5n+kCzTZhOId1p3ieMATi+gKbM4hZepD1blLZaFv6r8dTGW2zT3dSROgzU9OxAYBZOwJHUfeOjjIGuLa2+KS+R0B0ECBnT7qXAsEtYw5oS96BTK+5dRjXT5EyZdHoxs6Eo9Gy4VVi4ifAS//iMXuBJYqHdEeZhap4Dp/WY+bkyYsAeHcYV6QviBrW4WLtPIsNdRPqEAaxYoLkQivRoC9xs0gb6TGxR/9c8A30Z0mcljtd16leyyJ8zw+prWUIOOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg5PDQafUVBkdlds+YFin/LDtUZr3oPg4SARGRY7IDU=;
 b=oZLM5SmWip/82JepQNTYnwfRf8OOLbZgU/t/5f19d/vSX7cxH+vp6tWEvEEi7T/XbZyOk1pKUXpgCZmBniR1+TDbv1IMc04FbtcppbkclZaaKp/aPsAli9N0zsYtfaXPH9MfbDaJp8OvFNF2U9zLhROaq2eD3Ey3/cWBGsL2YOSXcU3T2CmxebcL9O8tPWf1iI3PtoOU047aGK9zSC6aOVdfiiKHe2G+HKqr6pCjlP54e09HJ5oApVA9nSXk6lSX+tFw5z/+TxWCCJLuzgxPoGioETALgTpNftmyeztcHxPFWzcznf3j6fRfPhfrh1S0TWCkOVHsM8CK+bL7eS7eFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vg5PDQafUVBkdlds+YFin/LDtUZr3oPg4SARGRY7IDU=;
 b=hOEuvTf4QkqUA+Kgo++AAQqKnMywcrXaWU5MVaJBSJd+hVIbYvsuX4+TG8ri4TBS2VBfrQzwDMT2/wHo014OPIRvOmhG40dj4ombuE70KHmRI6HUEeRZj5psh3jFoZNY2Mhy1K2CBstk0LovvuPZWO5UZLSJlXDImmdXpAjmmlRWUbLlfZE6+CmSTclCtc7Tu9dHsrnF3Tqli0jq54yXRPhRFsyPa6P7SrH9+f11M30xyLJH5MCKTvzf/yxsVtQUzcmUG0XhbU24DgcQxkHWJ+GUFPtGXGqEwIJvHcUbtZUVxJnVfWc+Ke5lBUqqxsuYEE6HtwaCqmOXM4YiAfBX6A==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SE1PPF01E99B2CA.apcprd06.prod.outlook.com (2603:1096:108:1::405) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 05:31:26 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9564.013; Tue, 3 Feb 2026
 05:31:26 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] irqchip/aspeed-scu-ic: Remove unused variable mask
Thread-Topic: [PATCH] irqchip/aspeed-scu-ic: Remove unused variable mask
Thread-Index: AQHck5DanMZqkpWL+0SyzQk9GEbWYbVwdUig
Date: Tue, 3 Feb 2026 05:31:26 +0000
Message-ID:
 <TY2PPF5CB9A1BE68147624EDB4C0B6C041BF29BA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <202602010957.9uuKqUkG-lkp@intel.com> <874io0h3sz.ffs@tglx>
In-Reply-To: <874io0h3sz.ffs@tglx>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SE1PPF01E99B2CA:EE_
x-ms-office365-filtering-correlation-id: 913265cb-164c-4e85-3fb9-08de62e579e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3JCc6lGIgEKpbXLBth5i/wUHhAxY46sn3jJA/NYOI1p0PV65Aa81OuneqtXB?=
 =?us-ascii?Q?hQTtchTYxEhEdZiM8u9kelXwoO/RHOVkHtTA02b/NQk9hXv8m2FTOqQayegT?=
 =?us-ascii?Q?Ekke3uy8z2CCuT+E8oIbpCjV6eIOGwcXFgTbf5l38zXMOhaTxQE2WclCGz1/?=
 =?us-ascii?Q?2YoBZNQlhEPy9sgBkcCDy/vm4QJB8unba5Xgl4n3BzKzUhuM2itwacwGujTg?=
 =?us-ascii?Q?8sofwMgYkyToPFilna1q1ULX+Xp6ylbi4VD8ErDeCrj1mKK1h5ygaLjf/xSR?=
 =?us-ascii?Q?KOs/VZQd9jSxK8/t6/IT1C95hF4oGLv5VNxgZO9BXYSoHmtNs3HXYO5v94w3?=
 =?us-ascii?Q?9Oy48mHxSdHBnDO3ybAzgB3tLOXEORvs+rtVeCTKZ2xNP36zZX/Ne3UvONHI?=
 =?us-ascii?Q?8ldUB76e82dYuGweCX3zSa4JqXD6ojYEYb36rGS+MkTJjh2k5H4AYcT1ubmz?=
 =?us-ascii?Q?3rYjudoS4fkRioUAsO41xOnuRmNND8oUrAdQCWT6oCjhmrlxrtQzasz4h8Cf?=
 =?us-ascii?Q?aac0nHvz3VpF+LPVZpJj8adUJtwB2TosXUMEQw2lmksMKp7oIRA2N8pY0Kqe?=
 =?us-ascii?Q?eEEHdlJwmk7VmpOy8DxwuN4T6r4nGaBPdkieEKmiybaGjPEVQ9UsTjRNFLLU?=
 =?us-ascii?Q?LwbqQZISB6PFVjCb5ATYoTzusNLmKRR/fnN21j/uMI3Jl8D9Lau2cWQ+VRDe?=
 =?us-ascii?Q?GCxe7C8ercuHjgbZm5LTLQlFI5rihLh0L/WTbvvMOGNBcd8qjihXd4Bc07Pt?=
 =?us-ascii?Q?5IEHobOZdj2zXYMPapIGPSQ8TZv3Wos2pUls4HMRE+4h2zLE5ua0wGqyJixT?=
 =?us-ascii?Q?g6csH8YzyPMX6bd2O9jzwefTXil9Nv2mVfa/04x31h91JXCUD1Gch4Et3UEI?=
 =?us-ascii?Q?UUELEdDVst89bAP6OSkAzxsDlbw+WqGSXVbyNy2R+bDRk8qXGRQCTaTx/YC8?=
 =?us-ascii?Q?V+RNLZHw8crxN3moOvn19o7JSA8ggUly5WMJyx1gRUPalk9puBLjHR/i75DK?=
 =?us-ascii?Q?jfEaT9xneXXBE1L6987DDM/xS4r/z6i1HtlLRJizxAibWHInaWQkKcZt2Agp?=
 =?us-ascii?Q?fJ6KHdwn+pZARJrl2g57zU3wojIJLz9Kt+YuC1YXkY88wj0cETlYL2u7lIq3?=
 =?us-ascii?Q?GVhOq01iMwR3uhR9kxqvFrvsDwx++tnm9IAh+WV0mzs6VolGEnav7w/D5Z82?=
 =?us-ascii?Q?kAIqiKMSHz9kyDwPRbAIvPDmINvrS9xj3TjINMZG03l85eKvM0aix9yHtwft?=
 =?us-ascii?Q?j9qm1SRhvbKl3Ie8qVeJ4nZBLX8FG7MTgbLCRFSFl4HJkfmoJvXsmJfLDuWB?=
 =?us-ascii?Q?v2Ul0qM5jSX/LxLeRjQOYdzJU7qpGy4gfNOXTMBLFpIpiSwZTd4aKydfOrsm?=
 =?us-ascii?Q?ga7dbbjK+xKS6yzsjHLgJ4GEAVfQPn0rvtCIbnShDu8E3UXycDNjSxDuNB8G?=
 =?us-ascii?Q?dV88UF0KFoqMuyPSHXe0gk2WifaqdXcThPvbJac49fDijKK463aodaB/6Kkh?=
 =?us-ascii?Q?XE2rJ3uF9jtMx1KDfFAhRM8kVkt2W4shRyf2o5W1WnnPhnMakMSHnYuyBSGj?=
 =?us-ascii?Q?32hsxbMfswtLnvyOIMtm5nytm/Ctfa6JaeZVVQzFyXtNGZFNF4whzF/fUCRc?=
 =?us-ascii?Q?9DAfXLeSZg/1krnNRSQ7P0s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KEj1ylQ0MydVbMQcXD4895OvZqjFstZe9J2O8SLUvfqOAAzi+ohGYgNo8ulR?=
 =?us-ascii?Q?Nwe8x9lN5EjM7eqKlb7VXv8dcwHJDflHwk3gx7UQc59yIXT5J9HY5Ot70pd/?=
 =?us-ascii?Q?cRwG5OPqEaFl1MfrN5PIX/raqrtXb60Db2isqYvz07+wyrB3FENp/J4roaKY?=
 =?us-ascii?Q?XAkXBYCNStSGScZXpROPRUlvRQ82A2KLX3/j24//dNIYdPRCQPFvrGH97uv7?=
 =?us-ascii?Q?P4jX7acKsTdqnP0Hv3gfgSpbnkTDrqg6E5yGOUatUqW/RWxun9pW2kw9vwCu?=
 =?us-ascii?Q?TZ3hPrDLnhuSYKfaLiJAmTUbf7L92XpverL5ChaQ+Z1eXb/iEFDD5J+VdmYn?=
 =?us-ascii?Q?GjN0WQVclcyW1af+501WAaEFw3ocxVkWkOgQOc6Pkflf8xQ6EsA76+2bzCFq?=
 =?us-ascii?Q?L21CYNlqvINWEf71oNzeVDwJ1BLRCOp2M8ARUhOqoM0CjgM4+IM8gRpccGch?=
 =?us-ascii?Q?YfmB/HXMnoKh98soHn5L+mxE4pMWWxJS1nF4hyq+tPeFqiLnAb2yDBLauwi9?=
 =?us-ascii?Q?WYy/MPfZCNXDoxFDUwDqIWJ4o7G86DvEQ/pXlktYt/jfO40m3dB6ZBTlE2qx?=
 =?us-ascii?Q?iB9vw5DIhdJOqj5KJTh1pXDwaHTVaeHLqr8YgvSVRQpitVX3/LHQD+XCUrw8?=
 =?us-ascii?Q?iVgyCa+15/Kw+QP0a2uV+7fRxiY1KpGjbpxqlwCS8DQOdTORYLVmeoc4O73i?=
 =?us-ascii?Q?ea8Gnqyj0WIqExLFzADSD+4ysIs62Q9xnmPcVEM/GMRTDgiT+EARvEPIqVQN?=
 =?us-ascii?Q?dG/WhQD4c/mYMmnlC0N3m+qah6+3H7vr+hWfnTg8QSe97YlUNbs2Ug1N9GU5?=
 =?us-ascii?Q?eDlBDCmqKqYEVa04wFHLKYKtLTHwIcB8BgqgPf20UHZWd2z3ZtMRRL4KZAch?=
 =?us-ascii?Q?Azfs2QpDSNaqG1WufnNA8Qk7Dm+O3PQq1pSOni5biNEZ/+er/78Iy/nQpLiN?=
 =?us-ascii?Q?20bbJAwEwFw5yF0EwzAm15FIIo2JnOI3Ov6IXJNFuDFGkG4TO4b1HI74PIA8?=
 =?us-ascii?Q?LzZnRonZXCp6VHQFtIm7+aRw/M8ymWRU5ZopOOzL8CxIeXp16Pc/fK0an99N?=
 =?us-ascii?Q?FhH06knpJIxJUGuvlyTDrCzDbQojxxMNce7en7MC1haYVEUPKWFWQ1Ca3f5z?=
 =?us-ascii?Q?XMEkrkZzCioNdYEUa3lLVfs0d8XJ7aBk21UIYy2p8Dub0+iCIN6Vqy4X1bf6?=
 =?us-ascii?Q?zZGDnzEaEKwN925H6FTUOaWuHVKMWb9JuhE9Lu4OjHx+4dEhUdEA0KoZ0Qv8?=
 =?us-ascii?Q?9lnDUHdDNU14Lp9diPSLahUZdWSl71RYwqHMtAvGIpJRtnCRcS3FKMUJ0K3X?=
 =?us-ascii?Q?4bHoioQSERXh8qp4XVlkKm2cedlbCdebq5t7WRJ2al/8k0jmPGiO7Pl8+YgP?=
 =?us-ascii?Q?XdllRnuLAQkkucpXCMNDcAw5jNnRjuUsYJDd8FTNFBlIF7skIyKPm96/87Ja?=
 =?us-ascii?Q?ZBl4zlgJvRAJKdCyze8mODHQt1UckH2A1S0aqmmd/kJpXw8BooiNjEiw3ifX?=
 =?us-ascii?Q?vOeUfkRgh4jnpks+EsjJwAZKNoyIwsGAk6iAHwm87+uS1UEzHnhxTnvQdv6K?=
 =?us-ascii?Q?1ogpBNpCw7gqcMh6SA3ElzXPEFkTZOvC8+Q+HEwbgOVx5rXcU4xprT5WA8N8?=
 =?us-ascii?Q?XbwkCX2lMFU/B2iu0Erowf/xtjCYebfsgdYVs4fx/2mpuHi57qXHevnSy7h/?=
 =?us-ascii?Q?XpG1ytIbWE9WcmaTvVK+N/OA7rv3H/X92n2vdxKu8w3uOmPO5zRN4trrwrvn?=
 =?us-ascii?Q?iCOP/yPSBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913265cb-164c-4e85-3fb9-08de62e579e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 05:31:26.4843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7PE4yzYY21czQ7nBbHcxTxixWPp80k0pYnWiAEhtOPCNfozxBbFpMfMktkVZduTXmafqIvCqNc/HJgEvdnmpvNSyrJKgwAJf9QEtFt2bzwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF01E99B2CA

Hello Thomas,
	Thanks the patch. Appreciate.
Ryan

> Cc: oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org
> Subject: [PATCH] irqchip/aspeed-scu-ic: Remove unused variable mask
>=20
>=20
> The kernel test robot reports:
>=20
>   drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' se=
t but
> not used
>      107 |         unsigned int sts, mask;
>=20
> Remove the leftover.
>=20
> Fixes: b2a0c13f8b4f ("irqchip/aspeed-scu-ic: Add support for AST2700 SCU
> interrupt controllers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202602010957.9uuKqUkG-lkp@intel.com=
/
> ---
> Seems the aspeed people are too busy to care about their own code....
> ---
>  drivers/irqchip/irq-aspeed-scu-ic.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> --- a/drivers/irqchip/irq-aspeed-scu-ic.c
> +++ b/drivers/irqchip/irq-aspeed-scu-ic.c
> @@ -104,11 +104,10 @@ static void aspeed_scu_ic_irq_handler_sp
>  	struct aspeed_scu_ic *scu_ic =3D irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	unsigned long bit, enabled, max, status;
> -	unsigned int sts, mask;
> +	unsigned int sts;
>=20
>  	chained_irq_enter(chip, desc);
>=20
> -	mask =3D scu_ic->irq_enable;
>  	sts =3D readl(scu_ic->base + scu_ic->isr);
>  	enabled =3D sts & scu_ic->irq_enable;
>  	sts =3D readl(scu_ic->base + scu_ic->isr);

