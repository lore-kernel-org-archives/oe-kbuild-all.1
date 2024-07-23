Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29A153810
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752531; cv=fail; b=ljRglEfther08Vl6eEudH5/dnwv3+vXo/nLACJv9SgEqfdbThqWekuDPQTAAO469NdlnDItMPQYAcrwbxMhIZ58UbRwsSpOX0LXGsO4C9+6Im7dR67TZf1XVrKQFjnMnQRS9Okd63UXHcfQsbM7HJ4RvHKcxkaVAInJI7cieQ1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752531; c=relaxed/simple;
	bh=sqmvTXJBTS5bJreaZHWONg1cnWfnxLrodiFK6iBp6w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rLpnLnxelu35HnvFGpZThreuIs0uCf1J76weH2UdAAVeA3LuOnx9hXQ1ax5AMmtIw/ynH1QWom2LYbxwTsVvir5xCxjAlH0FHqp6JQ5Ui4hGPLRtnhKggif0JTekv9BAipQHncj2cPeIyX350OACittn0V1jRrUQDI8ixefqM90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jSpxIzv8; arc=fail smtp.client-ip=40.107.102.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jSpxIzv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RG4kNSjOhT5oSykQTeCK4686u0jU++Ku4VUDPn3r7VX1EuHQ3Wad0zUuzzqPs8VP/2CcX+R5tmMFpX6RP+q6uVW6bVrqdQ1mxME3bh7jnEAlZOIY/G4NCbP773TrcWOyfxSndqGq2zgnj+XfG6LiykiPFcVBCxAWOAXVlm64wxq+jGIwflH6a0fLtMPQtIbgMokDT35VWpqavgjpPYHKl6KTpJibiYjcyBGOcZY6KKkSVjWv2Y5E+UzY1ouQgcOiD0iadCwzC6JRXTTGR+slL8mBUfu+lzudnlVR3S3CcGGsMN5IZv4dAigd/muYVhFeh7qdZAhMGCNOEKxlvus5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqQ0yOzjUWazZZmoefMugBhGWkgP4/1/eXyc4nC2vLA=;
 b=BWzg9kKEl3HkS2jfHHiyVHASWr965m3UMkcE7RKwRmddwo5qkcBhbfUAmEBR7aPj/JgeyVXT1cNyEazGwxCWSbxSmCXp7rjmnOmh1MxgwPy/LHZ8keDmf2lixFnwaNaIm1rVhM/JiwZns+05iE21aqOEx3xyasOWn07sfS6JHxKeHOGV3zIge5j5i6SQqm20R6Iq0wH0o4sXZd/oyyY0c3AM0BRVkBm56eM4lV4OCx3iprdyU6lmNXQBvxSPijtHzwBppei6EZCO6NQDdyEW40m9CJsm2Kus9ySYVzwikaD+yl6PVIn/LeHJPQXNevzmVkPQVCesoEZJhEmXS2ZfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqQ0yOzjUWazZZmoefMugBhGWkgP4/1/eXyc4nC2vLA=;
 b=jSpxIzv8c9/dGQyv3Ega8acGFZN5/W3tOnc8vldgM0Qshqxuk1ixf9ds4l/Hhq4WzPYCArQ6bGZpnF4AZY1QEaLkt2IV8ru4AfnaWTnbleBQKzyJAeTo3ieeDR3rD8Z0WkrAaCUMu8QzAWWUCIhg0zwH6PhNkIjlNNpDk70I7Fr2cJRRDtf2H04XNU0oJV/u3bQHT5pRsJW95In95UPagIHg3ARIsZ32Cgdo0xhy01F4/fX4ZhZUmU1eUKUy6DxokfGKlO60Ga12FpSO2YaSXSRZlQKZlWQgNnsYeNAP1SVsP7kUYnjVv9M8oAKQebVjtx+JA+FQd4roPsYJE+2IUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Tue, 23 Jul
 2024 16:35:25 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::f018:13a9:e165:6b7e]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::f018:13a9:e165:6b7e%4]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 16:35:25 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [akpm-mm:mm-unstable 9/30] mm/memory-tiers.c:64:6: error:
 redefinition of 'folio_has_cpupid'
Date: Tue, 23 Jul 2024 12:35:23 -0400
X-Mailer: MailMate (1.14r6052)
Message-ID: <92316F08-AF73-46E6-B82D-E40970CB6E94@nvidia.com>
In-Reply-To: <202407240024.Lhu1XDok-lkp@intel.com>
References: <202407240024.Lhu1XDok-lkp@intel.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_648D4596-22E4-4810-96E6-9AF6A5EA9E11_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:208:32e::32) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f35087c-0a3b-492f-f13d-08dcab35744b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lbAITBGx5Dmi2Iu/r9Tf82OJgOpOSESm8OTA/bbV+SCeOU+PBrLEsESwt5Ma?=
 =?us-ascii?Q?MemjO5J4HSzrt8ktYZKHHYxlPWq1uEa3HbvcOyi2EnhRtfjUcD0zft3H1zM7?=
 =?us-ascii?Q?wY5c6x1non3kWjuGvzQKrc/7sG3ekUnwzbAjV4Do4o19wytyDmTFUeZ441qD?=
 =?us-ascii?Q?aPwFTVbbpXpquMGqv5eVZdr2UMiza179uvyZzZmnm+ZCa24/cFXbaQ+/7NIH?=
 =?us-ascii?Q?mCeCYLPkqwmjC0r3XuMW1tL0okHZ4LSICGcfTieuJBipXAP7nxi2a+U48DgV?=
 =?us-ascii?Q?jbymN8dkyYfk7xkLJOzbAyaf/mFA7ktDxQTxgcoYyr1PB8yn/kl7jv63Ld37?=
 =?us-ascii?Q?ZeZWsL10wdZIY/FqJ+J9g8d0uQj7fbZc5W3QdKWjCd5BdSukoOq4qsJcjlv7?=
 =?us-ascii?Q?r/9FGrEJV5g7c0+EfuLw5mVuKpgnBfLffVtxPJwf5gi9cLhZFEDM6OVGFQ7V?=
 =?us-ascii?Q?ziMDxvY/f2HanVZrENs0jxJSpXzLn1IDQgw9ZSAY0E+PS0/kfR2JKc1Q0AFW?=
 =?us-ascii?Q?2MGYoYUktuSQMMiolltP/qEhj7C1cWLV86A4rWYpH31lJlW2LdDZyOkBXjC1?=
 =?us-ascii?Q?+HLZtO9ssGuZq33IiwdIfQmn/36q9L0PHASu8enahq/fbduEAESgMOWvZTT6?=
 =?us-ascii?Q?smQYIDQnbjZZa9DWxisytqVtRRDAzKBsCxOiBBDUW0KZtmUTUsDQ/8XkelbI?=
 =?us-ascii?Q?ziDmLKvZHJul3pAmP/GwcqUcI0iK74GL5ZQ6sc8yvJEdNRvzT9H/O6LRbbib?=
 =?us-ascii?Q?2ZjraHnp5h/gRUOyvVyiiidufH12MiWJ7VWutuVsFTQvj5mc0MlBo0nfo5Ib?=
 =?us-ascii?Q?Cuay3mJkNQzGJWUip4pJe6APmcO0CYFmeZPscBL91eTcjBcMQKJHONJvMnK5?=
 =?us-ascii?Q?E8t64XR1E0km1sxIzCjSaa6rwWFc2KX3oEnfvtyfm83liEpRf4oBU4l8byPq?=
 =?us-ascii?Q?dqIqdBetx9e9LF2T+/o1Yaz8R80rWbh1GjvQ3PLIDMXkQYuhRP6pmCj6iYf6?=
 =?us-ascii?Q?yqAa3JinR7xgu/RjAvk76tsgVCTH+Nflug0MCPzyYaorz7N8yW0qwBkIYAya?=
 =?us-ascii?Q?pWLtTwgImWr/tmcclAWRQ2KzSlPM/axOt1QIHuNjBvBnnu0G19kzggImX6MC?=
 =?us-ascii?Q?07F7rwNYOO/szDfZaRPB+b8lMFXBLjAmUtxtbvMpa3bQfrYiFXbeSObBY6pC?=
 =?us-ascii?Q?X2qVQeySiG/2LH+yrp8qSwkJ8mvNM5u7kdXQba/axFUu8xnBli7sDMHt+l+e?=
 =?us-ascii?Q?BZw70J4cXANJiPcPYZNslUQAKFzhvwUBnNX1tY4Z4/0o3GbAG/DVNpM2Atp/?=
 =?us-ascii?Q?6HVsoeMPeaK1X/9xHGNN/xEtYYHuRapQ2k5MVVKwe7HiWYO2VKFSrnPmKKNi?=
 =?us-ascii?Q?NU3gSV8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qM3TS3rSQjWRg9j0RUQorngI7Q29QLnYif3ba5XLxiTjsjJRrb6IdKkkhBgJ?=
 =?us-ascii?Q?MGCZ7BfJIb+Cmf8xWtSWJCRCJV2wSoo2LhzltiKkXf/e5+u6G36ZGTNQ2b2p?=
 =?us-ascii?Q?qCujCeTASVsbD+GGHQJN81if7ErxwibTLv8XvZdoPLzQQuMzmv22st8koTew?=
 =?us-ascii?Q?SexeKCAkVfNXlLkzBulMrHdjSV7THu4zQnOKYHOkjzmophl03Ague+wTwKuj?=
 =?us-ascii?Q?XqdbgMlbAKXHWfTeuAPL/ODeYhY6mpoGlY6hu88A7JhsZSL3sZnVUZoYr6GE?=
 =?us-ascii?Q?m6gYrpi7LiZQcDdyftDz5DP7mNfmrIzuwk4dYySJ+NAR7uC0L5GcWUTDmoNy?=
 =?us-ascii?Q?Dss3ylKYOKrCgMCJFCUQa0YdR2m1YrppqScDFOEynYEKPPXE6EnYSBKNGQ/0?=
 =?us-ascii?Q?c/86Eq50sJw6pJLPOa3NrwUqKmnwYkaUba8bEeknGim7X2UxdNlrO797S1c2?=
 =?us-ascii?Q?/I0ga+dZuoyaqOF9WpciHbqrgSJmDdJyDKKp51nkGkd2VBf7pa5i9ECTqgdq?=
 =?us-ascii?Q?j+i8dkjvH+TfQ0rmCZDmmq17vqqN/YrD1mf2Jc+gVzBB2Vh2V/ZhXfio1Mj8?=
 =?us-ascii?Q?ZXhRGiIhl3e7TZSP80v2+t8d5S/Tjf2oENLYRjOAiRkjtnH7yldJmXQXSyRq?=
 =?us-ascii?Q?foBdCYNlatBtNSMCHoFCinXrQB5RjBctt5eBH9uGefnSqGV3p7ro0AG1lrto?=
 =?us-ascii?Q?K1Nkl/h3lzUMUszD7ZFeGaj2HF4KgPTcyUM7HaEUtG3S6yWY63rGZsLV/RPa?=
 =?us-ascii?Q?kftlkWT4dKNXntI+ztzv6/c1I0ZGFqugQZ5IhIKMtKVvqhgSCqjGB1zVrtQ0?=
 =?us-ascii?Q?pDniD+Y29vB95+/Dr1lAHth67lFkWHVfNBSs5gOSDwqLUGvfmr788VBt2PdE?=
 =?us-ascii?Q?IcZbkuE/vYWqjGS4VA1WHQUZZgZHM5yYn40U7gFdZSdHkMrhe68PM83UEJir?=
 =?us-ascii?Q?lPTWljb3eimhtNLhAGkoEJHVLFl0Ud1oZm/awyc9jcIL9d2+QNMmBRPdbDXv?=
 =?us-ascii?Q?Ebivf95fx0LMUH1HxG8tCZ/RXhIMeARtjvyhjau354C0a4t2MCKB21WoK7Ij?=
 =?us-ascii?Q?6M2/CpiV4CV9NeVy6xwt1bYDmFGuXQVPCWeamMw+yumrUTjwNSTHpMTbPKvK?=
 =?us-ascii?Q?IypTdSvvz1TShLpOeLONCaFwA3l99ddmaMq+U6CC7Waivkm1R2pyZCTM4+wS?=
 =?us-ascii?Q?Isc6P3n2KKCCzoESbwgIkszG3W5dKPPA/HUkGxci71pMZe/xK0Axgp9SmgXP?=
 =?us-ascii?Q?rFZxr4fr+xYPDUNSr1rCjKfhvr7LdjPeEZeaKayrg0ipNWZEjM0jW3kQ0QwS?=
 =?us-ascii?Q?U7vna2WdAlXcG0fCZy3Q6hU8wckdxakoSk1x55zdZQhWZpjjs6IIK/6xSt5j?=
 =?us-ascii?Q?NnLms7T8BzQKPi0oJKm+eO0rJyQpTWx+9i/weIHw+U9bPYElbvhBbeA04IR4?=
 =?us-ascii?Q?oZoUTwiBkR2NRIuQXMpByXESedz9Noa+SWEES3FBgAmS9xaVkjrKjNcavHLf?=
 =?us-ascii?Q?ixeEUeOOYbv1vUao6Oc2ySoEk7sZGIQmbBO7a2QAXNmeW8aNHB+gExtVFrKi?=
 =?us-ascii?Q?Auvcr9IQNVh1A5tm0Tyri6ohNtEHugJOoPZn1z8z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f35087c-0a3b-492f-f13d-08dcab35744b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 16:35:25.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+8LPMcKzJdZIVazCPnbLFY4aOIbAhFVZD37elRwzmxxcQVy7kxtG/B9nnBDdzFL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853

--=_MailMate_648D4596-22E4-4810-96E6-9AF6A5EA9E11_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 23 Jul 2024, at 12:32, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> head:   cecb3db438d76f7c1005fd52689809696a330474
> commit: c57ceb62609b36d1a01e8bdd894d032379999b75 [9/30] memory tiering:=
 introduce folio_has_cpupid() check
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/202=
40724/202407240024.Lhu1XDok-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240724/202407240024.Lhu1XDok-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240024.Lhu1XDok-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> mm/memory-tiers.c:64:6: error: redefinition of 'folio_has_cpupid'
>       64 | bool folio_has_cpupid(struct folio *folio)
>          |      ^~~~~~~~~~~~~~~~
>    In file included from mm/internal.h:11,
>                     from mm/memory-tiers.c:11:
>    include/linux/mm.h:1796:20: note: previous definition of 'folio_has_=
cpupid' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
>     1796 | static inline bool folio_has_cpupid(struct folio *folio)
>          |                    ^~~~~~~~~~~~~~~~
>
>
> vim +/folio_has_cpupid +64 mm/memory-tiers.c
>
>     53	=

>     54	/**
>     55	 * folio_has_cpupid - check if a folio has cpupid information
>     56	 * @folio: folio to check
>     57	 *
>     58	 * folio's _last_cpupid field is repurposed by memory tiering. I=
n memory
>     59	 * tiering mode, cpupid of slow memory folio (not toptier memory=
) is used to
>     60	 * record page access time.
>     61	 *
>     62	 * Return: the folio _last_cpupid is used as cpupid
>     63	 */
>   > 64	bool folio_has_cpupid(struct folio *folio)
>     65	{
>     66		return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIE=
RING) ||
>     67		       node_is_toptier(folio_nid(folio));
>     68	}
>     69	=


The error has been reported by Lorenzo Stoakes at: https://lore.kernel.or=
g/linux-mm/6effd690-3cf2-46bc-8061-2d19922ad4fa@lucifer.local/.
I will fix it in the next version.

Best Regards,
Yan, Zi

--=_MailMate_648D4596-22E4-4810-96E6-9AF6A5EA9E11_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmaf28sPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK0ngP/jyu3o239HyDuu0H5XO3GQtUCPOelAe6rePh
2GWnaPgW+yunRPmsvXnDQ3wChREPEmogwkibDxMGq2dAGnJVossf8KoelBvA3aYm
0z0uKxcO/kTCoXaF1I8Ly3v+z0GsIHY66Hrvg5L+P5PVQcnGNWbuQ2BsB+4SDeJ/
03/gKd0O7CnbP2juDPQv/Fd9rmexD+6RBYFL1c0fBVDqziOu91VL+YK/u8Pmk48V
l83UPfGJjOHJ3MOZ6DOtmvPpWOBSNd9OncLOg6c78B+xBss+9HLX46yLnDEq519L
C+lJUMpKpa2dkuSYvzP1uhvfKGrjzUMMHXSxnxtPUJuwZ3k4J/QcfqHvzQmsUHj+
dl/gxdGR2ID/iMylY7cyYndM8zvOCa/nkSUC23Or17XOBWvpA4oMHrzEgyIOACxT
gd+qXarUUzMtHjwaFC+cMNGZ+2FZc0yKxyRwr8UH+Rf9lAymA/6PcHxP32e8xndN
85CaZvCK9MANZrj3T1JjytlZ4KCoQJsJBKEKXqmPtlN1Rr8aF3LS/TVZLiHeaySe
EKRmWMPvCjjnrRrNtsggKkHX1iYJQDv/Scg8Jc90qD7OamMIwglRvIT2Xj/Fxodf
UEB+I5Jmqsbz6y//eUPp6+RVTA0eBR7Nnvf9sY+gb3QDtri8PVvHOF/gN+stmook
cVu4nH5p
=mOT7
-----END PGP SIGNATURE-----

--=_MailMate_648D4596-22E4-4810-96E6-9AF6A5EA9E11_=--
