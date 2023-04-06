Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72797ECA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 07:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwvDhspJ3/JfhbWicQCkaNi2dtJlryBpi2ae4fJxuuYmYIZMAvDD96Fs9fG+8S+LEeSa5yv4tZ/ncV/5I9jaCZGNaC6ZwTlW3Xce/dmpK3auLpxk+Xuba4cB4OMUqdAM2/B7H8bd4ynVKQOlKLRmG3Kx3fttHLlil6cv7ZfJJf7I1HPDex3hNb6XpEB3gUunM5GcT/rDe1v5h1XiIKkmzzK+srZFIGWWrNFIDiqZg2qQkm3QWtlc98o7jiuTDFXvXgBJG4yjqTv+t+kxS2LkG08/QvK4iAHia5JEGjKc0AGctwhbX/IH51TAHZKc5ZgYHbVrjAf8XtMwofhU/VOuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aog9PSABNQT/XbyCQayZWFNdzq6B3tNo9Z6s+Q881sc=;
 b=JqZQC7136dr7uuV8EsO5fZmRFHMpqJTqvs5tEI/qRUXVDAyRHgHyD5y6vYs++hLDP8jex3rm2pWaK4gBNpF9njnKjkMhT/SYS7V5hXQLvMTSS6JMxAzHodySxwH3mqDJJej4URdQsTssU+CCjtMR76qcf99N1JSFspq0+AKIr/UEnzRdnZXPNRd/uVK2KLSUQtg+or+JX+rk1eZff/lOudNil/nCN1Ua/rGD6uhdWrhv4gdcscSo3AOTCnkVNVCLxYOjOJCsWcaXGdqbBeViA+AWsv228Sm6iIYMWveRwXY4RSe6kkZ2PDIlrZ2LFDA7cvhGUyDXgpfYWwH0n6y22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aog9PSABNQT/XbyCQayZWFNdzq6B3tNo9Z6s+Q881sc=;
 b=qe3OZb8f5OnR0waosyzKwTgg46AELYrAO/wPKs93aIGLAcSl135CG7RZDeArUuQDckDJvqhAmCwzRTTu6ueAGDrVNDP4A0L17Nl9HdvQAYTscKPlx6Cday0+xjd4jBs1cxJ4NZxJFoPY2+t94lzc4pxLYUte9uPhdIeAU90NSkKw4bVp5O7oI4TNWVtqkyHtV9QJ869qZTXnH7FIa6e15kTetKBzGRzROXOxVUVRE5SrwZI4v+l85iPSvKfN5et9/6ki8rVXLmBmZk8+BWQ3Og/LPWWF4CEA1Ktxz110CrEGO+VbF0B9Ne7vxmfHj1KDRsIvFxoaSfL0fFjnIfyobA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Thu, 6 Apr
 2023 07:55:24 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255%8]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 07:55:23 +0000
Date: Thu, 6 Apr 2023 09:55:18 +0200
From: Thierry Reding <treding@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [drm-tegra:for-next 30/32] drivers/gpu/drm/tegra/fbdev.c:103:29:
 error: implicit declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <ZC565nLPElAzDR9n@orome>
References: <202304060835.oYBkVjMC-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fd4GIT35M2FDhamP"
Content-Disposition: inline
In-Reply-To: <202304060835.oYBkVjMC-lkp@intel.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.10 (2023-03-25)
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b4da1e-26d6-4fd9-126e-08db367446c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RLVMSXFrFOstqE98MoynMGVELyeheB664AmOZyQLOKK45Q4j/fHxYB9mVq0PN3AJB159+9xFLW/5aGQVfwFoeWcbe/ca3jl8HP5JsTp8+jzaX8f53aORNNWcKvm9RS1DLRPm3P1jykp6sbCNssw+bS8dxjv1Z7pf60hpTeXhJa6+MKkIbfCcMIxBZDZaaSw7CGEytQbv9gk4VUD17B1ulC2PCxhdOrKEAruhUQlsAwaBrn9sJJNTRXs6FxSaiXHFbstXikYSqBjn8XWyaS/AystVliTnuBZdCwRJs6ohWa+EETzrYrgPlZCe6UAvCwPTV7ssvwml4t8SgMgWEskXlJ+YKt6JIGTB+zJt9tF9MlTnu1717xEvXrSXnoZ6UUzvxkXtMgfgIKK9mC26NSHOI8DicX5f9oCTcVb0VlPAi1UrCpNN3zrKPTfM1959CStKMXjDg9O5k2simwALClY3YSXozA4HsoHs6MEIA/mYkMiWeG29uOqvZyQdpZ9jfrTWNHxK3ubsANtkjvGgxXVsuQiBFKkpYHl3SXYU/vav31Eb0i6bZFB3WTF7rl3aDyyRWYhht04Qjli60zfFbSSp62QAYzL3vZtxgOTXkzeoDcv0xREQAXZHBG+UPjpU0TAGWPcXj5FIa5yfvWhqCt3mMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(2906002)(83380400001)(186003)(44144004)(6666004)(21480400003)(6512007)(6506007)(9686003)(966005)(6486002)(5660300002)(38100700002)(8936002)(316002)(4326008)(66946007)(66556008)(8676002)(6916009)(41300700001)(33716001)(66476007)(478600001)(86362001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QWlOja9azXDtTQxq56WOv+1IGPIDBzjmKa670luznpjePyLwZn5Pg5pFfEst?=
 =?us-ascii?Q?BS/E/usRoeeo4oKCh/8QvHqiWIlGxA1LOAie+PT9LmnxzXLFo3BSB6CPE09Q?=
 =?us-ascii?Q?sChGsCb7Yg9os+2td3g6xXKNxFlUZqGPa+yMew0PlG2y05t+OFXVAWOMpb9f?=
 =?us-ascii?Q?nAlfgmW7FIb2VV1uL+ZMAOAPA0gs2W5CNvysQsEZ5oPLisJVTxX6uchOuXYn?=
 =?us-ascii?Q?PFBiJ2Y7UlfSz1TkudgQqwQ8/tiuyGSb7IjsFPBB39YeZcr8ywkeOZ5FzEk9?=
 =?us-ascii?Q?jpx1wYzDgYyDXusqu9NFkq2nTBuguQwejogqIZsjtV/i5wSVZAxGZy+0E1ky?=
 =?us-ascii?Q?oQ8ABs+QErnGA6p4STJoisfhxz9K4Uv2kPRJ/oh9BgTvwMjJZw4pDql1Zu+2?=
 =?us-ascii?Q?HX09deU78p6Nu0ck70Bq+meTZ7VyHjE22FDhhDJrilinSbQl4AwmqvtajoES?=
 =?us-ascii?Q?B4Tu2tbcqYGlpydjuOpoqapbn3Tjtioq77CuwzX5HYxb/BEWw6n67QET8OLZ?=
 =?us-ascii?Q?XoNue/xeaHfRwFd9I6JzX/hY/dNH1EWEPKZCdAiMzE8PT8ac0rRXkUN0xqk+?=
 =?us-ascii?Q?sxSwbrP070EGX03NnYN/o/ttriHkwZ1hFB3qekmnDESfuSDVAgDr1R6Er50Q?=
 =?us-ascii?Q?01cw56+nwAtJEAV8xc1zIZPoit0DWZY5qyJnIU4ryDcslZbAvpcwu7oFpgEc?=
 =?us-ascii?Q?yndeBJtPYGCa6BO4lOPAety8Q30l61Sq8tUNtwC5KxUdWQ/XDsA6ekNfrFxQ?=
 =?us-ascii?Q?TcHjVLPoPZsj2SmHS20v1wDcgUZYHMQ8GU5+NaBSCidx//tf0uRq3guPj6Al?=
 =?us-ascii?Q?GozY1Gtcx0t801Xky824sbBayGci3UqDsHIpRMIcxl9YSbQXwax5ivWSmhLy?=
 =?us-ascii?Q?XgbpHvQRslBI39uGfiT7coAxHbxGYIn8oYj3ysK/GEmPeBfzvnINlODdDJAu?=
 =?us-ascii?Q?F0fVb05J0ffBXvjH7qSSB7Xd9jnI47B9UJ9/xsFX4SactuIt40scStIO0Qdh?=
 =?us-ascii?Q?CQOlnpTFEr1xjKkgHYv/ow85viW9O5ifJcPI2L8CPFLn2ONrXKlNo+6wXCUz?=
 =?us-ascii?Q?cry0XGR1laufPLC4iyda6Pqdlha+6RktLcqiNlE9H0ru7+ONaGIqS/OOhYVz?=
 =?us-ascii?Q?TLFN377qUGgdZ0Ps/RMynnNu3wz1CmDl9wI2dDPVdgDw7Q782/kGNd2tDYgE?=
 =?us-ascii?Q?jDqZkYykClcpnfZRRAWo0fjlfTqB8+BgC7c1oDDOJuRa7N/Otwhw8Mah3SqZ?=
 =?us-ascii?Q?jWYINZM2EX8E9vjz0GcCSkmc88jz+yh/NrqrBFZNtlLTjUtRAixBHnizK0hq?=
 =?us-ascii?Q?bspVeU8HZ+sw4gYJP2m7F3JtCnRf1uOm21LbOcY8vLNyv32VpGqtIhEkSbJK?=
 =?us-ascii?Q?zSe1FQ4EMH0c/KKJyZCLa/Yk1UBQVwdGR4hRfVRPLorDCqftUX4WXjNqRzUo?=
 =?us-ascii?Q?PwvVWf/lTqa0OIp9BUS5b6aTl85yys8FQ2ftkc/uQ1Qn3eXHk5r2W/Uj5z9v?=
 =?us-ascii?Q?TlBkFIdH5lBXrCRpF5p2cRvQovSoFao8g6W6/G1DSCA0OyDrJ9fw8UXIIoD4?=
 =?us-ascii?Q?ar84Z3n3nQen2Nna6JBhdPLiCm1i43dWUBbN8D9G6EVvK5UjvUZHjqCpaVle?=
 =?us-ascii?Q?zmCQbtFHpqP5iRbAnuoCyWsQIoygScZc//WwfdXjh3OF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b4da1e-26d6-4fd9-126e-08db367446c6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 07:55:23.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOCYK+8zLD6UFA+qz7o6Ye024rpks72kuaW0YyK2PjI47QSH+3O9ztFfZelI5PsZ8PFNQcavlpfk2MGVa+EyDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556

--Fd4GIT35M2FDhamP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 08:56:17AM +0800, kernel test robot wrote:
> Hi Thomas,
>=20
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>=20
> tree:   https://gitlab.freedesktop.org/drm/tegra for-next
> head:   e064bf8eeedb78439bed33990f93c7213294e005
> commit: 914cfac73e230064656a42047a6f5546ee69a14f [30/32] drm/tegra: Hide =
fbdev support behind config option
> config: mips-allmodconfig (https://download.01.org/0day-ci/archive/202304=
06/202304060835.oYBkVjMC-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add drm-tegra https://gitlab.freedesktop.org/drm/tegra
>         git fetch --no-tags drm-tegra for-next
>         git checkout 914cfac73e230064656a42047a6f5546ee69a14f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/tegra/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304060835.oYBkVjMC-lkp@i=
ntel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/gpu/drm/tegra/fbdev.c: In function 'tegra_fbdev_probe':
> >> drivers/gpu/drm/tegra/fbdev.c:103:29: error: implicit declaration of f=
unction 'vmap'; did you mean 'kmap'? [-Werror=3Dimplicit-function-declarati=
on]
>      103 |                 bo->vaddr =3D vmap(bo->pages, bo->num_pages, V=
M_MAP,
>          |                             ^~~~
>          |                             kmap
> >> drivers/gpu/drm/tegra/fbdev.c:103:60: error: 'VM_MAP' undeclared (firs=
t use in this function); did you mean 'VM_MTE'?
>      103 |                 bo->vaddr =3D vmap(bo->pages, bo->num_pages, V=
M_MAP,
>          |                                                            ^~~=
~~~
>          |                                                            VM_=
MTE
>    drivers/gpu/drm/tegra/fbdev.c:103:60: note: each undeclared identifier=
 is reported only once for each function it appears in
>    drivers/gpu/drm/tegra/fbdev.c: In function 'tegra_fbdev_exit':
> >> drivers/gpu/drm/tegra/fbdev.c:186:25: error: implicit declaration of f=
unction 'vunmap'; did you mean 'kunmap'? [-Werror=3Dimplicit-function-decla=
ration]
>      186 |                         vunmap(bo->vaddr);
>          |                         ^~~~~~
>          |                         kunmap
>    cc1: some warnings being treated as errors

This looks like an unfortunate interaction between this patch and
Christian's to enable compilation on !TEGRA. I think this is just a
matter of moving the linux/vmalloc.h include from fb.c to fbdev.c
because the vmap()/vunmap() calls have moved.

I'll do a MIPS allmodconfig test build to make sure this actually
fixes the problem and push out a fixed version.

Thierry

--Fd4GIT35M2FDhamP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQueuYACgkQ3SOs138+
s6Fm/g/+LVGA18JTjgUi1sI4dyNDL/4QSdhMa7OV4JzB3aTMr4XgxnYKKsAji6w1
my9HMxmEbHH8A623aE+Lnr/fpR9ZAlKAc//P11eL9wcEIA0GUptj5svUYbu+w6pQ
KKm1K2OM1LtYJavEhDAW201WyDMPYq57lgC6Aj90X+4cpwuygxUR4iMAVbLQ+RjW
yWi+6WeuDXezhfbQnwrKFREKiXjezDb3I86Flqp8+67S4ymDX/FqrGTxoDkRkjgp
1MvkSuWHFqdlAhssDlVhEhzuYGOYetbAuKDTZbUfhjFgwW7KPJEgVi2ExR5b77jp
lxXV6WvrotIdepSMC1NBQLMMP3yAOrfjK3moS3es1a9Sm3ApZweJcU3zthCj7p+h
m0GeinHvROjYvIjWCPnzA47FDlolovfPfC6Cit3IhmLeqVl4s9G0aBbVXO9RJbIR
QopKK7M2AZ4vsRNzHSzw2SU8WFiOM5heA299AGn5XdgM7JR/x2WxeePy0PKjJumQ
yvV4bUGWAiSgj43LofascjdMAePZ6rEflCvAaFiH8FfRYVA0p1DmmYhmzx5+CGSH
Lqn8ORZokeDxUZ0mH63iyf3DoTb7JT7vLoIRPLyXSkDsQ4bUjjVf9mIvTyDlxOqA
IfJMQo8oREhr4+GX4+LfAzrHhUjCtAVgrpUwwaBPGLJmIr9d3iY=
=ySIW
-----END PGP SIGNATURE-----

--Fd4GIT35M2FDhamP--
