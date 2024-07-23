Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911413B58D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 21:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721771511; cv=fail; b=RrXl0Ue8YhlQCsDes7oVFY6NxllxPVWrj4R47Ou5w+BMSbEGf/4x4dR/aAm6zBDGVF0XVAHSwO318faWjPYEIoIqpDrxSBuQKFMlrZusJUDuyBmeZTjZ3mGNvBtjTsJV1SiC4TO7RUMRfRZZ1Zh3ShBUXVcSJlqw5RPKdT09qzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721771511; c=relaxed/simple;
	bh=6dFh5zKD/HQTBRbqm+oAMP7hT2AiIvVopfXuYyGZvX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U0Vmfi/izIxEzhpyD1HiBiNEYKp+NzckfFDH8moJZ8FzEmtqYVdrB/3rZ1lmcc23zoSGodZy/CahWEp1sfmKXgmROCUjbVTXUoTND3czK61r/GmEaEnbLX6+lZ1G9z/7SxrbKAxXB4sC9qG5ZQRssa0FHCRP8D0xOTSLr9JkZ6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oAWfw+L6; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oAWfw+L6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okN+cGSeXln+k/6kvKtxPqjuDA+i5bFwGQWRJb5VObBvBMFgS/wIA2pZJv/r3RBKkeo9GG86O9dvG8av+m2n8zGvodbMze41gWBq/a5VA8YmN3iv4BSYGuvBefG3aKF/n0HQJ5whZWUpS4RedK5Hw6/HVz722kIuo8CCRQdF76EVpG6xsVzz0L4pjVhaz6q9dUIQpr2sPbr4ayRBhJuEQo4EYZeganWlj+Ebu1r8BCbBSZgHacB78NlOyphnXAJrXRV1jXQwIpYhN4efz8l9g11qgbXzh9bvwYKH2t0KB8Ys7vrS1KkGVhPUOaa6mZrvdFK3mvnHghFylXnXJcOmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSYFrG9QJuc9dBhSjY7mZ9Msgo1RFD41cZlvEW3Ao5k=;
 b=bqi4ewlYvd5xEjHrWUVToaLNSvMWnWebKt30aOyZ+sc/Lx43l9Z617ZQy0EGHPqRFjmquIdGYutTADikVK0aBb0zIHszRjalLsRClZLHAQu4huGMPZBbfBeq4E1SfSi8gCEc9uzbZDWIHh9OT1/MBZtbzfcUpUCIG9Mmpwz5xb8aIKoLqnvoAjllbdi3HN9sP6Jma8lZBqVSBsEJFmtJ77K3h7MNf35v4SErZpZzBPlmPaDsIqBFUg1WTThX+e06eFlyAxGKJ9o55m34sgXoyJpmlGeem8yPAFvneXaIom7xKqKQLsS0+Lvw5Gc4fQfatSlmbMEX4c3+V+dkMxbJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSYFrG9QJuc9dBhSjY7mZ9Msgo1RFD41cZlvEW3Ao5k=;
 b=oAWfw+L6wZgBe7qYYk7teLP6XjwH5VGGIHfAp30U3SiF01BCBqzGsSEL421P2H1UgeVABD6q8857H0LOMPyfQTtg8BaEwNsgKtqOTP2pYVit00gk4WQePPjZsY/YITZVS8fFBFy37kp94wZDxkPQPXUbEFzQRJKRmX1Bs/X54Gruixqr05Fu6/hIKACcJoP2AvrAOgTkODSV4Qk3+WGUN4xMtzfjDk1vWgZqfsyM9gX3Iz9EbBy/uMQTGcJ+MutZYh9comCBTPpn1z6MzIfDLBClh78nCEAO+qpUetewfuG7Ofuyv61Xeu7qn2yYUckA1wiOXIp7/FD+4SeXhIhgKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Tue, 23 Jul
 2024 21:51:47 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::f018:13a9:e165:6b7e]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::f018:13a9:e165:6b7e%4]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 21:51:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [akpm-mm:mm-unstable 9/30] mm/memory-tiers.c:64:6: error:
 redefinition of 'folio_has_cpupid'
Date: Tue, 23 Jul 2024 17:51:43 -0400
X-Mailer: MailMate (1.14r6052)
Message-ID: <E4FF383F-079B-4F72-97F4-BC9EF83F3C40@nvidia.com>
In-Reply-To: <20240723144520.465d13ed2b48613c43028426@linux-foundation.org>
References: <202407240024.Lhu1XDok-lkp@intel.com>
 <92316F08-AF73-46E6-B82D-E40970CB6E94@nvidia.com>
 <20240723144520.465d13ed2b48613c43028426@linux-foundation.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_DA25A293-8524-475D-9E91-04F9994A5C60_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN0PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:208:530::25) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: be31e68e-fd58-40e2-c11b-08dcab61a629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1B+siXUSXzXMA3QhXO55Db/Cwf2wMsm2HmghoZNpDwHyR1tyQP3QtBwAwglk?=
 =?us-ascii?Q?JB26L9wNF8x8qM3RH9zCqAlDhf7ZqcNIKXlRp7iZ6dVJxD08upo0TMIjMWi9?=
 =?us-ascii?Q?PxwsVvzJzbyDrYYv2Dry0uomvD9pwkBWR4KnL38TmnRFGN+S4CcaTFRmc59u?=
 =?us-ascii?Q?g7rrB87aVfGpS+5ytYxEDzTJg5l31y7lVSwcA5RvnwCwCeVO767U+Kc3GHjL?=
 =?us-ascii?Q?ao9ZQ7U6fdpee6N5hbNvCvHC8GQF3sPjjk0HsjpqDPJgQFAIupHB5+N4dXdf?=
 =?us-ascii?Q?/1ZELlqjDmqpeNpP7BSGOHQd+9Ure2uK+4JUaSXdKIOU6jcnJJJ5/ibvDNbF?=
 =?us-ascii?Q?18lOScjpkOjtFj1bm7NlGfxi9xoncIazdZinX63Xs+zhpnIzKA2A5z7E727t?=
 =?us-ascii?Q?MyC5dnS4gippsaWZSKDyaiFeqQzXNUTUaZvpZS2U1sY1vZiE7ZWh/8hSWlmn?=
 =?us-ascii?Q?HHDthzPBMHEEo+04GqbYdKtGS/bhTtAl9StYz2TumgM4hpfEbFRuwIij4xwq?=
 =?us-ascii?Q?35+mDFirrdeOdAigkBbO+zw2+WxWzqk3qKIrxHBUdOFvUqZ2T2qflGXI7fQR?=
 =?us-ascii?Q?7naFSW47EaJpfGdX+ZsO2HUkMgaRzPAN9Ci+iePFqx4LfdLeai5WB2eOF74p?=
 =?us-ascii?Q?S+iEvO9dGmcHRKs00/zv2CLnjyQ53FgXU2QttSh1l3sSsR/wP2v07xMKGCrX?=
 =?us-ascii?Q?H58pBIaKltz8C4pCwXk1y6z6ozEnxr40Ta4FPxNNTjo8+3fEVf1w6FJttSKN?=
 =?us-ascii?Q?Djs91fVGE//EkweFnwwryI8yh1Gady2dVB5rc7G8QxMTjuDC0hekr/osIOIN?=
 =?us-ascii?Q?KgPq/XJ/R4ckJra/FSwD8DKuLAyo6+EIzt92ll/HXE7gEi/ggrZ1w0naoUHz?=
 =?us-ascii?Q?2YLeuYBvJtED187pvbfHErMzLcySEqF8zB+/z1VSvd9vPtRhrLZ2K9s+E0Y9?=
 =?us-ascii?Q?B77H2sl9D8ilgJEfR3eUt8xFOIxBEw5fFaPaVuD+GCz0kBZt4SXrqzTpWX3Y?=
 =?us-ascii?Q?dUu40r0oijNaCKzDooUWkJWAt6ResKNPhdSY6OsiAMpfI9xaPXIZgShR3uGP?=
 =?us-ascii?Q?fgD4gTQKO5GUR0IZcCJCcrZfS/+QMJRTb2fr81jzvfXrF05llATiimw5GVBQ?=
 =?us-ascii?Q?UuJE4GpzmSR+2XMpNgLqI8b/z7lBpdy5GSRWUFVvPpQbZeW305g8qhcUE20x?=
 =?us-ascii?Q?YoOF+FmaGEUV3hv6/MNZ8KoRQaH4q/TIPE899dXiaazR2Y3tYTxDPsTM43Hl?=
 =?us-ascii?Q?G3G0W6208faFDBqzrz8QDU6kDnqe9L5mKBRY3dyI8zCOZUjJyrA4DvXN52rg?=
 =?us-ascii?Q?lSUhmr3k5Bpj6r/heLygqPd/HZ2bbVWEGGZiDAwHAP36CxwA3+MLbNueuod+?=
 =?us-ascii?Q?C8E73y0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W8m5az7cyLBaoCF7HnGCJncd94ArOXYmkrkLl0DU3oeJQVaixkYxl5qFQuZR?=
 =?us-ascii?Q?W20ZawaCKb2uDTCPiHNWJzV1cmr7ZBuGALhET/haSgBRgk6Z7TAWKL1U1xex?=
 =?us-ascii?Q?/Kq02XMY4IytJz46wa+3GIn6AMELCIOJAAE8GBT2NTNDDHj4P0NrguB/y0xl?=
 =?us-ascii?Q?zCNZiltT8VG3CpOd8Uesa2etxvw3KyRs6sITFCWUsqE1mLmnQrbxkAkzkB+U?=
 =?us-ascii?Q?tXx145FZnkRu24umiz8LXGPUVhG4RXE1kV5aq7brldujvV/H4QT09F9NVFs+?=
 =?us-ascii?Q?+NxHnpGaDE95NVjSJv8ZC7VVfnroSgnSGWecVwRFVzsgs5zO0cE23S8gN+Cc?=
 =?us-ascii?Q?arYZPe4G93W/61eLZ0OTskqYEqZ2jFGoeQGbkH/wKAwCGI/UEyz/sGl7wOEM?=
 =?us-ascii?Q?Fxc0a65jRRKYb93Nh7SQ4lPcrrGRy/kPIIWP/wXyHSdRVFWdNvrRFlTmw1Tl?=
 =?us-ascii?Q?8NZ9iLAdoFkJzjxaocX1V4aLPiv4CsPlWBh9/g8Fs2d0hiCWNi5yJt/KSO9c?=
 =?us-ascii?Q?ChvQdi30P9K3MKAyoHPP+u4YR69EgEqicNK9nQ5ZWTzyc2+8IUlyc2Y4B2EM?=
 =?us-ascii?Q?SjlvKB/h8UOI2+v79ChF3HovzJUKq2xW9T8Z7t/JYUgUNrh+L0dsKeqSheCk?=
 =?us-ascii?Q?cMa1rXJSv/srA4HHLaKJzA3N/b6DxmMNpNREVRPRIcg3ncaJpFGgHz8wEby0?=
 =?us-ascii?Q?EqHe9akZqVGZJ3SJ3KDU1MyNTZxOKGpsdJcgPIid+pJ8Dd2FteLx7y6XPiN1?=
 =?us-ascii?Q?F3Sh0OdY1XjlQKXB7Jayg0RYkocuu0APc9tcofgzESKrTz3EQLuPm4s6l3kv?=
 =?us-ascii?Q?E0rMp2zl+jASJzxkXGukoANdt215KNFYoTBjWT8KEqW3wtPjrCO7nC17aehi?=
 =?us-ascii?Q?ry8CNAwcGfG1ZXa5yxKyuQCIXWdZEgbIfLnv2yXyeOalqqO7lC7n7fZvs5KK?=
 =?us-ascii?Q?nZQamSeQ94D8vUpiQm7IrbxauXEbvFhxExqRA/e+Xs4YKASDeCmqrBI0Q5VS?=
 =?us-ascii?Q?BjtgP3d0pKyn2VhNiPyBaC3F0wlXFfA6PaYD6n2wbETkevjzU/XxSVZ9t+qm?=
 =?us-ascii?Q?S6pl0o/Fhn4Qizw68odHG29qsFJmh21GB1aT8EtA1A7gcd54KsRA9aXYymmQ?=
 =?us-ascii?Q?FMSZQiDlr3EgR/aM8rAkRZMmdFXMH7DHY9o12tVgPthfPmUa25B11bsTSRJD?=
 =?us-ascii?Q?QglJYXJAW6QFmXwwmxhad+qmc5omYUs4JI+6ZqOh0wJkaGAfMA0b2eQLXXTB?=
 =?us-ascii?Q?834wVp1Q2ocvwCwMu9vXkpG0lbQF8K+jUUKUa7kyXLVVT4w688I2tOmM7y4f?=
 =?us-ascii?Q?NqrauBAQdekCBDaVcTc1mmoRyuNV0mbeSROq7LDAH+4ke0XIOUHpVGGxXIjl?=
 =?us-ascii?Q?LZYVkBJ0qlunpKSMe5UMRW8hgUtMqY+B+HQAOa4gMdufagXtZ3dwQfPlBlay?=
 =?us-ascii?Q?pFnI3BWdKGkwVOA6Uq30rHeZ1Mik8f9mNxEd+UlcCqBs2ZuZ4eXdphyUdD+B?=
 =?us-ascii?Q?OYF1z1F/pFO/8IUy2eTCNOemOfdV1KZA3YlNx8FFZNjG0P66c/QXKfc4W9yt?=
 =?us-ascii?Q?RNTGFYt9TW/00UTTYgA4M0EQbLz/dK+Q3WyFoHVx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be31e68e-fd58-40e2-c11b-08dcab61a629
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 21:51:46.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WzILD5uj37gbI+LYXFcSOPRY/T6ze4StUNj/SiVD4Hr3/0tm27Jgbk6L10VuGfh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878

--=_MailMate_DA25A293-8524-475D-9E91-04F9994A5C60_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 23 Jul 2024, at 17:45, Andrew Morton wrote:

> On Tue, 23 Jul 2024 12:35:23 -0400 Zi Yan <ziy@nvidia.com> wrote:
>
>>>   > 64	bool folio_has_cpupid(struct folio *folio)
>>>     65	{
>>>     66		return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_T=
IERING) ||
>>>     67		       node_is_toptier(folio_nid(folio));
>>>     68	}
>>>     69	=

>>
>> The error has been reported by Lorenzo Stoakes at: https://lore.kernel=
=2Eorg/linux-mm/6effd690-3cf2-46bc-8061-2d19922ad4fa@lucifer.local/.
>> I will fix it in the next version.
>
> a) "in the next version" is too casual, sorry.  We broke the build!  Pa=
nic!
>    I'll apply this:
>
> --- a/mm/memory-tiers.c~memory-tiering-introduce-folio_has_cpupid-check=
-fix
> +++ a/mm/memory-tiers.c
> @@ -51,6 +51,7 @@ static const struct bus_type memory_tier
>  	.dev_name =3D "memory_tier",
>  };
>
> +#ifdef CONFIG_NUMA_BALANCING
>  /**
>   * folio_has_cpupid - check if a folio has cpupid information
>   * @folio: folio to check
> @@ -66,6 +67,7 @@ bool folio_has_cpupid(struct folio *foli
>  	return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) =
||
>  	       node_is_toptier(folio_nid(folio));
>  }
> +#endif
>
>  #ifdef CONFIG_MIGRATION
>  static int top_tier_adistance;
> _

Thanks. It does fix the build issue.

>
> b) is a next version planned so soon?  If so, why was this version
>    sent?  Please try to avoid sending an entire new patchset for a few
>    trivial fixups.  Just send the fixups!

There is a discussion on renaming folio_has_cpupid in patch 2[1]. I am
waiting for the feedback before sending out a new version. The new
version renames the function and reverse the logic. I assume it does not
count as fixups. Let me know if you think otherwise.


[1] https://lore.kernel.org/linux-mm/D2WXTV2186EV.2OTDTPCJSNVN1@nvidia.co=
m/

Best Regards,
Yan, Zi

--=_MailMate_DA25A293-8524-475D-9E91-04F9994A5C60_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmagJe8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKceMP/RqrjYeCCEfpqFSwsF8DPM/ykg0PMRtaSZGp
eUGpHwxl1nzfjZTT1sVa1Cmjz+aiy2TCBFMPOFxjGo31LBMsp+kzVp+AG8t01bUg
dNktnsHa5xIOQmYeu0YZknRQo9+Rj7LnYnhtUUuFsMfvhSDM5eP8YzNltLxr52wi
/wrAGxykXl77UYvZssJDSHTwxnnHAuqyS/Zg1NrHiswmljx1xy/TgVli0TNVvicL
8qJ00VZcCvNazo7B5HmwFF20r68vHjcAS68GMok2Z/biT4QyTGp21Z9G/oa7SoJu
PjNePORchEBWkNADGBlp/fUtF2NkbVg1vqyi7r07SH4jLWr0jbhmxs/6SGfZS2O1
OwfOKrRranI/3DjzFPbn5B/ePUJYBF5eV7yRNngS0gSjgbQ2vcex1svlsID7ITOu
g13ejZVWuPmS8As/uB9kdaTDY7p6SiOG4H1/7oyj5vfaNuLg5wV6faHfuBa80eNX
HvW1h0I7dAtlg38Ghhw3uqwrYPrUs/k0+KJ1TReS/yysbxj5Il+6+evo6mZQalZ/
N9MdLX/QHJDH3DugZdBKkai84MAaDOCGiKIPv+EH8CsjQT50mNOYakjd62V/sVdX
dmxgElY5xDOXCvMRhA8YMlKRLYEIbxGrjhzT2T8hci8mgYGfa26gJMHbho/dA+eA
ByKvO8es
=nzBh
-----END PGP SIGNATURE-----

--=_MailMate_DA25A293-8524-475D-9E91-04F9994A5C60_=--
