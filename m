Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9B1E9E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Nov 2022 17:22:58 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1HE4Q2013889;
	Tue, 1 Nov 2022 17:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=mDneenh1+HDwAYV6fHU9FM49OXeCTpdwPEdDYUaPZ2U=;
 b=FDtj2Lz8w5Qf6jrmZwrv17kO3Z1ddD/Xy5a8tn7CoT8itVBpSwwluTTKwV3QE1KFjArb
 q8Rb15ZL4VcOJnupOI2K4ksy0XfGz7+7ZdU1hPb1SPKYPe6ynjH/z7Wsc2BRr397MjCn
 uKhWJGht8haCjJXtHnfGNX4b9K04Fob/GrM5pit3w+WznXJ8umbPqYXk5QMcywUf8FqC
 W6VEsKIJtYwsRGytyggZc/wyJD/u64cPAJmIMf8wiKu3OxQbcftX7JlaFEKjA3j/PcxD
 QIGxqSn/zby4zuzIyvsxd5hiaNQ6sEoU94m7b153kIJnTbXgauWUjiejCQTT5f0OiHzv Fw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgty2ybnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Nov 2022 17:22:49 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1Fbqwc002968;
	Tue, 1 Nov 2022 17:22:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kgtm4pr9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Nov 2022 17:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx+16H2l7gSzLydxvFoowK54uJlF7eb9QgT+hC9kWhIIFIvviayZ0GKKGgzQfjj+XwMPINcfTNLGpGJ6bI6oCQkoRpIguWfQJAcYw9Ar6t+5TwDeBVgelsJTO1lsFzy0sxpFFBwJaTlJe2AQ3TVOhrVqy+fYiVCx0EA1s2De33je8zVpZMu/8yCJy/pFFazrtTafDdDgN6YLQsPE8lKVBCdJ9BYWSn0kr9AQvlmlq11lS8PjALy4EMU8bcthPI9IQd4q3APNDS9uvtzIW9QHDSj1WLkZdr0/z+L7DTa1R/9WmZDBFTFNGXaLmanJBOXzCyvq6+GT8p++KtvWkXSaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDneenh1+HDwAYV6fHU9FM49OXeCTpdwPEdDYUaPZ2U=;
 b=Vo1UD1SuYhV3A+t+/MNIV+t9d5dgO0HpA98Nfq9/PtOxxnbk7I3vwXvzZZEJUvpQw+j/QAk3cnqsNR+vZ2+cPofnqhIHZKhk/BoW96nnUCdDKrvrdC6JOoSFhZ3cnA1JDiGHcdH6PKETSbfZ/RRV4npHd2TMJUKAr78ItCfbZ1S5OigTgf5/80ReofS58j0fu8RoCY2ebfq71KL0fDEmlCDPYGFeuhy0lzQ+5mBalVZmaVH5cwxAvhOXc8+xoQN78A7Ozm8xYS8UBoDEBi15rhRNmir4UoRP1PTG6xp2fotccxcOEjSNLnBQJYkHCa5ky8pJfAM5wXy28uu7wMjElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDneenh1+HDwAYV6fHU9FM49OXeCTpdwPEdDYUaPZ2U=;
 b=Iuv4S8RaDBovMwpQmwGT7KtjB7wMoSDjT/x/jA97aV1dYDdf0P0mQldcxyvViTwCSFb+9BbAUu8KZKPTSHlqe27lAeJz7eUP2UV2bahsFQgA0JukmcOI02alVEw/0alJsoOHW9hNnKjgeYcQokNrmoKEVv+Go+BfIp7Lr2k2v1I=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 17:22:45 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1%3]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 17:22:45 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran
	<fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List
	<linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3768/4356] kismet: WARNING: unmet direct
 dependencies detected for DEBUG_MAPLE_TREE when selected by TEST_MAPLE_TREE
Thread-Topic: [linux-next:master 3768/4356] kismet: WARNING: unmet direct
 dependencies detected for DEBUG_MAPLE_TREE when selected by TEST_MAPLE_TREE
Thread-Index: AQHY7Zt8RiuaQRQ7dk+yWcWAT1UKma4qUc+A
Date: Tue, 1 Nov 2022 17:22:45 +0000
Message-ID: <20221101172227.2ydiaf4ezqubhez7@revolver>
References: <202211011055.WkpEsoci-lkp@intel.com>
In-Reply-To: <202211011055.WkpEsoci-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR10MB3022:EE_|CO1PR10MB4675:EE_
x-ms-office365-filtering-correlation-id: 219ad996-508f-4207-d09c-08dabc2db123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yP0u4YhiWzLAYBDgEom20rO+MYFdz4Xw1ZS0r6XmvHchfwC13tPYze6sHtYZqbl41gaxVhe6tETdOtj8HwYsIxrPJe5Y/1DtB2Jd3Rvfd/X4fyFq2qWfsuZjYpVqAH1fXkMjOaw//nMeAS4wiq7EIDF6NdZx46xyh4Gy249OV73pZEHDr6HLrBxvFrNKaa9vl7b8TvBIrnu1begn79BbEUC6fPODNXZhwWMZ55w0WWgrKzihP0VAGrNPSp53yLymuPwsZFdca4c4Ja4htCpZnamH73GC2zG3QENZqa2aUP3cpfuErGFnq5v1qFZappuG+2IfNW0JGDtJv4N6D9V2WxSIz1Hir+Yk2FSNch2CtQvViy+y3ReL7c8CDoIx7ynaxj+8JSkumSBcKXEcPMB6JZo2M6TrHoo3ZfwJ9RYoqK0LowBNXj2p70KDwHBl8wOur81Z+i/UFgT5a9fDt4xO/zypDJOZ9gNpCf5sKrV6VKMxlMPSasJHbTCjjYYP4xB6yzPoFJzWV5vbQ3lbAFIVZlU4SytJl4rfkNc5GfCSy+xq9cxQDj0Dq6EtQfxf0vi+fL1BAu/4M2qnsKUKidXQIiC+6X8S2CVSI2lp+aTM2nD+7DW0//k5+EaeeRfiULNpB3560pwyfc5rmpxORn5pllsUdZCWl+QrPYWYfvPx3mP4TgvIWYOkgqJInOTCYV1VLBmkfAjZmM2IP+CNE0GZ64B5uiOfei+aixTSjDR3ftxneOm2lkUznAqeO7pjlTSQCYYRn3m6b16EckBTE84+6r9C6WSB6k25n20kbuG+dS8V8gHiXmhfM23Z11gT6mYUzfJcHgoZHdFmKkzfkwTotw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(76116006)(86362001)(38070700005)(2906002)(5660300002)(66446008)(66946007)(91956017)(66556008)(38100700002)(122000001)(44832011)(64756008)(83380400001)(66476007)(1076003)(186003)(6512007)(9686003)(26005)(6506007)(966005)(478600001)(6916009)(316002)(71200400001)(54906003)(8676002)(4326008)(8936002)(41300700001)(6486002)(33716001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XGeJCWmKPdmAkUmh2yjde45Bk958q5ekxy+0LPInwkHSugMt3B3N7xiW6IbR?=
 =?us-ascii?Q?VnAIWHXIOJmut6x0zergESlDnx9CpXS0T3yja0SICOOGLzw26tMSd1v7Cf8g?=
 =?us-ascii?Q?ltMOXU7UXwPyDEjEhNdVTmNSv/859TZdEzKpOTbvQvc1ctEpuDKG/I7XYIbp?=
 =?us-ascii?Q?qSe/P2u+0TuDKfxXbkFw9uQewk7IHjZpia5dkF57VBmWrFcQzfGLkX08U5xl?=
 =?us-ascii?Q?6BZuwNI9YFw0RRUYgIOpbdDRuJXpEOVPaNynn+1eAlWRiG/6pdrfp+p0mBA9?=
 =?us-ascii?Q?3qsrfHmIfUnToHSGoD0dlqbTSPTIqUoaHDdodZ//qH+WrT931f/8SAz5OBSI?=
 =?us-ascii?Q?vHMtCGVOrlGr2psHMosOoNfzVzmWIMadPsvst0KbmstjtyBPyntESf4LU4O4?=
 =?us-ascii?Q?OyK2qRRmTSqoI35x2m8p5JdYafECYgQPayn6N9hCApmM+Za0zNF11TPr3+rL?=
 =?us-ascii?Q?BEuU2lGUyVgn9+TsSTS17ArFVzf+fDmXu1HpS/lRiaBccmvXMhbkwuxLbgdQ?=
 =?us-ascii?Q?4y/xi5COysnFy59+M5VTuprvsoTY+HdNeRB5tX3K1u2Ylzj/2o3KX4Wd17mo?=
 =?us-ascii?Q?0GSVRSf0OY5gYnZNTe4cFh6TQj4apUvXS7Eym1q5jf9XG4hJxnioJr4bwTuX?=
 =?us-ascii?Q?fX3Gbt4+2hYrB0HTDPT6FwMcLve0qef+G1WnjLI3Hd117HPw+UHf7Ps1NXWg?=
 =?us-ascii?Q?zXW9ryTxYaH/P9dqqvoDBk6t2gKUSdmtGkUrTtOvSxDg9+9jERVnQdkPOZ4A?=
 =?us-ascii?Q?0DYhXCqO3mdpc9+CfPASP9p/d+bAF5HWRQa7MMsujcr+/8RncARrqUv73Sap?=
 =?us-ascii?Q?xHfTT65ZBt0i0Abm312cxfzagAtQjOALGsD2w1hCH8Alen3raYmMA9wdy3NO?=
 =?us-ascii?Q?rAYKCrgyftlne4BQqIIl18GRw1+6Bba6/mBYF2ck2zSYpix2tEaDyo+cd2Wl?=
 =?us-ascii?Q?2KbQJE74XIFZrcnx/Vv3PrAVtBP3BY2EYku6Sl0PMGOiL9Ykg5rn5S+YTPfp?=
 =?us-ascii?Q?QY3xa7xboVI0PEMAupJPNbo0YC+oPg/nzHbtPP4Z2Iqvyw3KISizmANTlpBi?=
 =?us-ascii?Q?sHeNlxEbtwi/cwc+l/NPVH3Zem3ve4GLAoZD1eQrByiykzHTdJhDjj3GhcL3?=
 =?us-ascii?Q?QrKyQW5DGjfYaHK7lrGrRtICcUpl480FWW+Xf0UgE9YUhQTygjMMaMx1j1xP?=
 =?us-ascii?Q?sv7gVRVK7M1wWPylA7efp+GRBj2mVNC2PaBgTth/lpvZ/6bUD7L5tArTavkY?=
 =?us-ascii?Q?Gt8bdEJmszrimfYspgUtMqKopS/fzUhJ7Xno9UbZ/Z6YdQsQv5jb8+8UmYpJ?=
 =?us-ascii?Q?iPUTtyzrEC66qFrbrwK1KR0yUg7WGdMYTsz+IyPkfn/u74W7XiMlwSSqAzeU?=
 =?us-ascii?Q?jBaUiucZQgd74vDl+auGjf/829xqk6UAutvzatFABQ8WZYVlmsZKx74Gh2b/?=
 =?us-ascii?Q?4Y6fRHNMVFGhynIRyl6sI78qQxO2PN2yrtETTvC9+PQpFyMbqaMIYyyWhGyy?=
 =?us-ascii?Q?VnUYvM5qZ19i7JmieagOWcdiLM62JwF/24lc4Z5ByYICfY/xNkBi4STYNlti?=
 =?us-ascii?Q?jQUpQ4CggXix4zFIHP8DaYTp/eLzW//ZZQK0LktBKqUB0OSG4eoyeyNgD1rl?=
 =?us-ascii?Q?vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A58AAB9938642A489132A078A8A8D16C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219ad996-508f-4207-d09c-08dabc2db123
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 17:22:45.7342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYy56OYYRN+a3aYfG37IIrtb+K9yMQ7kAUwfkYj2wNk4x9S7wHBnF88QSz9lQYtdhdr5L628KoxhY5NlXdP2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4675
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211010128
X-Proofpoint-ORIG-GUID: znaYN7FMcoeJa7KJYqyb9pvksparf2VZ
X-Proofpoint-GUID: znaYN7FMcoeJa7KJYqyb9pvksparf2VZ


* kernel test robot <lkp@intel.com> [221031 22:41]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6fbda10ec6f8d70d0f4446f861f7db726c2f2e7c
> commit: d9c0ca7c6a02830de65fbc684cf0be7e6510737c [3768/4356] maple_tree: =
reorganize testing to restore module testing
> config: x86_64-kismet-CONFIG_DEBUG_MAPLE_TREE-CONFIG_TEST_MAPLE_TREE-0-0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Dd9c0ca7c6a02830de65fbc684cf0be7e6510737c
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout d9c0ca7c6a02830de65fbc684cf0be7e6510737c
>         # 1. reproduce by kismet
>            # install kmax per https://github.com/paulgazz/kmax/blob/maste=
r/README.md
>            kismet --linux-ksrc=3Dlinux --selectees CONFIG_DEBUG_MAPLE_TRE=
E --selectors CONFIG_TEST_MAPLE_TREE -a=3Dx86_64
>         # 2. reproduce by make
>            # save the config file to linux source tree
>            cd linux
>            make ARCH=3Dx86_64 olddefconfig
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TR=
EE when selected by TEST_MAPLE_TREE
>   =20
>    WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
>      Depends on [n]: DEBUG_KERNEL [=3Dn]
>      Selected by [y]:
>      - TEST_MAPLE_TREE [=3Dy] && RUNTIME_TESTING_MENU [=3Dy]


Thank you.  This is already on its way upstream by v2 of the testing
patch:

+config TEST_MAPLE_TREE                                                    =
                                                                           =
                                                                           =
               =20
+       select DEBUG_MAPLE_TREE                                            =
                                                                           =
                                                                           =
               =20
+       tristate "Test the Maple Tree code at runtime"                     =
                                                                           =
                                                                           =
               =20
+=20

Regards,
Liam=
