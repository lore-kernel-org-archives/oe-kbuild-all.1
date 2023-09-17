Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB86FC1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 21:41:02 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38HKStuO016296;
	Sun, 17 Sep 2023 21:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=PEdlPmK3tsCDEvStPfQxyNT5jF1SafCYglIVrOnsLk4=;
 b=qh/q3Jaaihc7jjkwNKYGz8o9aakEcCy2xO5G1ZM7lPOkoBKj3hFuchkrfjbDKzQZwkJg
 FJ7R5eivqfRmzy38b4KSBeO7bnXYRaWS5nG/H2uLtTaA0hK5NvQa6Sqxzsffp84CdykT
 VY+VNueVuqmQDQwbCGB35hSbFoLFDjDN8cjFsMOlbsh4AqWdCgK2R1ZXiEyIHbjfVK0C
 zDmQDDY1nwoguzKfBhjcCgNXlNP31R5rYaW7iOBaMOFbdlKV6HbmzUFlH25k5SKiFWy2
 7KQx75utv/OLVCDHJNbuamxWkm4UMRXHmfHo4AUECj/H4SiZbruOAyMchTNYaaORPRQQ Lg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t53yu1gpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Sep 2023 21:40:50 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38HGh0rB012290;
	Sun, 17 Sep 2023 21:40:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3t52t3vxj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Sep 2023 21:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UK66dsJqrkbCvjTEbu6+IVDG8bU40tvutAxsyfZQow9JJz9JUeQpMUsbFm5lh/o8uC9KpZzmofGv4v2QFqh1X4FOAopFSFTTr5Q7HF9MAsJEg6F+PaDiHzn1AgctHXORciVEcSrFxRsW/veOIJeFSxciG76TrnuFF8VeignZ9RleHFYAd1JFLkXUir6LYNOIkbIFagwFZZxTIOTGvFC/juZWLkRfm80Wb59KIMLmhyOlRRUIDnwfYLrvBzU96+W11mvyc8XAEWIepUY9atNvdO6y2qGTESOD9514YQeW4CKKTeVFLXag/L4Npc9bcG4jifbNRUZvs2xaiBRp15+taA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEdlPmK3tsCDEvStPfQxyNT5jF1SafCYglIVrOnsLk4=;
 b=N05flLBRNp/eAdtbW5WTa9OVegONffpEaSGTRZ3Di3NhDliqfzZGv10m16dSJKMQZTOig+2DI2ytaNIWS/cZw1KnZvNzkBMO9g7LSqElno1ZAPRuEAfHrICOeDrGfuphjThP/gx7d5XQ64flhTrMqQDrgTy+boQuuSmJAPaE/E43VI4MxxJKNSJSPiWe2HQvTBQBI05V3G8iodzQO2hWU9Ik3gsNpXWKXFOiiFHGOMZjqQVR6R1tWHpIosWPDn295oGEDYk61yjG7WHyGWxkC6o+WQqUzMsJv73PcXZzUT3/MSemK/ubkaG3HhayXFu8aX82XlHOP1BDKrBcOj3s4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEdlPmK3tsCDEvStPfQxyNT5jF1SafCYglIVrOnsLk4=;
 b=mkxQN8Krwu0K121Mc399sekCiYUqMHmxoJ7B+EJoCLah3vGJnDqb3/DsaeYWudrQCH29Ukol4Iqg4nMGhDBflM/hSGU0aTxakiaYPx/o9d2WwAclg2NIkX85kylbqFa2Oll8SZj/lrCrZmrFrd/Sf8sqEgm9FcLx548IiU0Sxes=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB5406.namprd10.prod.outlook.com (2603:10b6:a03:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Sun, 17 Sep
 2023 21:40:47 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::bffc:4f39:2aa8:6144%4]) with mapi id 15.20.6792.026; Sun, 17 Sep 2023
 21:40:47 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: kernel test robot <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:nfsd-next 28/29] ERROR: modpost:
 "nfsd_nl_rpc_status_get_start" [fs/nfsd/nfsd.ko] undefined!
Thread-Topic: [cel:nfsd-next 28/29] ERROR: modpost:
 "nfsd_nl_rpc_status_get_start" [fs/nfsd/nfsd.ko] undefined!
Thread-Index: AQHZ6a6EWZnqB7Ef80iodwn1fHSD9bAfi9IA
Date: Sun, 17 Sep 2023 21:40:47 +0000
Message-ID: <52E0F6C8-F575-4976-8F6D-D2DC5FF4CB4C@oracle.com>
References: <202309180555.zbLtkI0G-lkp@intel.com>
In-Reply-To: <202309180555.zbLtkI0G-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB5406:EE_
x-ms-office365-filtering-correlation-id: 75dae834-51d9-4bf7-876f-08dbb7c6c0ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 maxi5bgKHkfqlvsB8ahEdxYkWSJg35ULaU3sZt35RI37zdpwx76BqSQ+1I9/EM2pUewkMQ8x3rZ6n5DF2+QSKKy1wUn+N8DhhQG2R+/YuwihKp84zCQb0fifxhrGKvxzDxjTv4xtarNwZM06SANrniruIRaxpfe+B2iTl1JrD8z8l0VNoURnPxx33qMn3/wUkyBTOfpzXcUWfinU8CxOXeLB/LwpMjlumH/B67OxrgYymN76Jwq5c0B5fRGp92ZwwYCF/ydkJ6TT6a3TWXXUceCwMbdwjnwh8OJob+g9Vy+X9ENY8ktQ6dS/lKE8lXhaHNGwRlUIkKFyTtYGz2lEVqUfMHZm9EqVKNZNkOXlqCqCBlzrizWtMGWUoPMNFfXJludPuqO+9t0Hm8Cyhfaf/6vaWx1X1gDOW0opk0KrtFZIeiEBDCUKFpxaiXD0mjQ5l5i/wsgNrSDQ+RRwZJuBD7RLYH5mETim1SIHB2DziLyqO3hyA6j4GdAKHHfROiCxLMYsZlIs62+z0PSebsKF4YAyjYTj+BV0Wfzj/rXOxPwURjDLVggsw6m6L3fEmMeGJzbEXRmnsKI50uuIcvFP3duBo8mOALon/ps7O/EhkkUEOLNYL9qmfYQM6KR6D83CZtWLsZEstapdOh4Egky99widG2WTaE9Bw51I4yNsA70=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(1800799009)(186009)(451199024)(53546011)(6506007)(6486002)(966005)(6512007)(71200400001)(478600001)(26005)(2616005)(2906002)(316002)(76116006)(66946007)(66446008)(54906003)(66476007)(66556008)(6916009)(64756008)(91956017)(41300700001)(4326008)(8676002)(8936002)(5660300002)(33656002)(36756003)(86362001)(38100700002)(38070700005)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hWpHu8JeTy4RBTvLGOjWv2mYSF4R4RnxHPupMU7VUsax2HRQV5HgjWE/pRlq?=
 =?us-ascii?Q?8dQxo8ARUV2oUBc3I/M4F7WpR7C2FlaQdIM/w5cTaMiqokti3zgLN73l4zqP?=
 =?us-ascii?Q?ZN2BVgwSj1vK9sPTQmxDTjqYwLuN1vMDYOodkzKLbHe9vTydhM6ARL/BCO1Y?=
 =?us-ascii?Q?07BvnRw0/80Sp6jYH6PkDWtrbLYCRGmnDsNLD22bXmnYRcCw6r+s6Yn/17hz?=
 =?us-ascii?Q?tNp2wo9uF6asPqG8APlRoOz9CqXJqdW4z2s0TA1zdfqWQJeJgsEIIMvvkJqm?=
 =?us-ascii?Q?buH1Q9yEnMYX0gwu9au94e3sF9xUSz82ZgpiW0soCEgp92Wh4NKWD6YhtPuc?=
 =?us-ascii?Q?K9DMjChiAF/XzuorPJnhgJWN2911ZSJQRESJDS63++zUcmfXpW9HWpH8dH7T?=
 =?us-ascii?Q?gb8dcDHAqzQKR0dTJ0iI7aZeRPO6drtkT6arg2DkGUyRz7M228hqe0/MneJr?=
 =?us-ascii?Q?dh6eCrQ/3GSIoFDw/MesqRu63pWGFjLdIRxy2il8flu9NM5ciLdS98rLjRwm?=
 =?us-ascii?Q?AuMo8LXafbIc5eo6IwK1EjC66zIuiAjLJcmzQx5DvL8pIpeMgmxFsUueq0Xc?=
 =?us-ascii?Q?8c9R0J4bg4yQWTPxPTR1oSKrCNIp8G2dh418s9SL+CUDMRPjdKxubnxjiucF?=
 =?us-ascii?Q?8YxvL0FsPOKzwfWq7n7LW42LVxaTOrqX+aXYajyPbzogxLnc9qCdd/iAYwhv?=
 =?us-ascii?Q?MrzGg6oAaY9qBJbdWPggHH5ixlaRevvcutbVVYYAM3v0PfRWvatFxg3RZoyZ?=
 =?us-ascii?Q?NRxPRQzjs2s4kn8GKD55IT0woaJqwFG15Ptv63nKkZNzebXEPDoZCPRuP46m?=
 =?us-ascii?Q?mUm13vuAUXbcVf3XsE6vduBi2i7/LG2MuAeasjghOMGyGmTNagx2QSZXZuXw?=
 =?us-ascii?Q?/5XZ7zLlpDmMmllMyXuP0XJ/tBT5YZB2AHXFwcTG4ELpUDJfoZUbJP0GnDJG?=
 =?us-ascii?Q?UkgRRhFPhN3qxpYT8UT5V2pKRZFKiy05IUzTsIKnykiEeTNl1Klhwkd6Iwcr?=
 =?us-ascii?Q?1NPYeg9A44WilEXW6+H0hJD7rcz3FdZ+FfOF5pSUDReqqyqfevJJhoxnAb33?=
 =?us-ascii?Q?iHA4g/P3Id0p9od2NpKh37UZ4R/MZ39WWWwF7OUdR2X6phOBhY4JQj7QzFZS?=
 =?us-ascii?Q?5fBgKEZLfa3wnIlH6qcYcVOKkWP9ZlFJWaoRN5aFV77YhdLzbgJ4wLFBGi1T?=
 =?us-ascii?Q?rVyj7b2c3SzcFvWzazuC3XiPxK4y1jYL+lBw04KmIJxa08+cK/k+wH3xT/z0?=
 =?us-ascii?Q?x4Sw/GW+Ug6gWczxok1sI2Tw3kEIyzFoDVAhV+FZfM7mR3yUpkqZTI9jzgRV?=
 =?us-ascii?Q?ts78L7Q/hcBPkFhE43SEUjfATywO4r8h4ICOMLzTzZmYdn6YbT74ru739hID?=
 =?us-ascii?Q?vhV8MdmmtSVYdh25mP560eqjIOSWJ1bQVahpl70CeaxcCmZ2edfpu59eM9ud?=
 =?us-ascii?Q?yd5HIcyOjymUyFdoYOaHm1L40EUG19KjcRtharSr5fiQ/SZ1BIYCfud07I30?=
 =?us-ascii?Q?KSsVACOT95SYHAAoVqE3c8Vv75nGauONpR3F0BMX6gGJn4uBFncyf42qFml+?=
 =?us-ascii?Q?ma6GSgepzsD224KmUUK4Xc5C5+tgCkjvtJ9iYXhAlIELWMU5HQUciERYQf5e?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A2CED1CD67B05C4D82D236A76E8FC091@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FF+385cT8J5gVvTsI5SHQXluVbX7NiHDuSS1JmH3Ym5+KFK+wQZcDr7ZjewlnvWoM0DA2LSFHr9NrY0Cl9vDktQY/XU8Dy3cgtccI4v+cjwKdgiZ+N6NM38XadbIfPMzyzhXbmdkRrePdZC+/fqLu9O0pRPVhRGibqE7YrV5r8qOhFw2xgQxNd0QYbwMzvpv4shF+ZZVKNG7vfBAESh5thU6qZl5nZWdHfX/lL3nJTI53AfVWrIQQatzHP7KysQwrT+ymKQX636EDIcWki0MLR66wFCUCURl3ROT4JvjXwzaagX7iVO7o04jWy/rEmo+5896p5W4K69MLMCaJZGVfa/1WazKXWjRX7KOOAR756QC4EnNNdADklRD0GqtcDTlxDvQTSWeahmgl9lqc0zxUx8ScUR8K+BPTmPdGVWscspgW9jkvYaTeqSN8ENg1qTqKMrbxFmMMjGFzC45aGuck6A00Ug1qgINkfxW4wgBokbMsZV1nuBfxQu/FqLraOim/INUp9I+x4B+TZJsx67YVGZpPU5XZG/HN1c7vEywHo+46z2WLMVTCUQ23ISmTsYm8Y3sq1JNOsazifrH/ZHsbgXn1/VUwiXi5G2EShoeXpecfLx9CZ56WxT7dyyps/BY7rfOBhj/rW8VdKT32Zv1mE+447R6QEff8ENqpgLff6EJAZmS+ffPiIaUGXF9RhqOl+rCb5Oj7KHTD5dLig09iYBzlr8Mh2A9GeRsLNb7sbNRsxyBtrKM6jVaxEu3wDLSxUOnabXhkr6xj/tz5vSg/RoKLIe2jiq83PEx0lubV3ghv9SPIivfr3u63BXOU3l0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dae834-51d9-4bf7-876f-08dbb7c6c0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2023 21:40:47.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1EggBmwso+z90pSn6MlNl6cpAQzO/4ffd3bYPtyyWzeHX5NIocVMlWzRIerBz7EDggFXNKYzAS5TcGFWUdHwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5406
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309170200
X-Proofpoint-GUID: l1PxabhVVvKqtKQBODhdXgDnKg3kWL_D
X-Proofpoint-ORIG-GUID: l1PxabhVVvKqtKQBODhdXgDnKg3kWL_D



> On Sep 17, 2023, at 5:32 PM, kernel test robot <lkp@intel.com> wrote:
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-next
> head:   013fd95f671a2d4427bf3aa0820897e41f384ccd
> commit: ecb61abdf1985420234b8f12f93a07d59d5718ed [28/29] NFSD: introduce =
netlink stubs
> config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/2023091=
8/202309180555.zbLtkI0G-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230918/202309180555.zbLtkI0G-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309180555.zbLtkI0G-lkp=
@intel.com/
>=20
> Note: the cel/nfsd-next HEAD 013fd95f671a2d4427bf3aa0820897e41f384ccd bui=
lds fine.
>      It only hurts bisectability.

My bad. I'll take care of it.


> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ipvlan/ipvt=
ap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/dummy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/eql.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ifb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/macvtap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/tap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/common/usb-=
common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/core/usbcor=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/mon/usbmon.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/ezusb.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-ke=
ymap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-=
ccgx-ucsi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/asus_atk0=
110.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/thermal/intel/i=
ntel_soc_dts_iosf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_u=
art.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/in=
tel/intel-hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/in=
tel/intel-vbtn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/in=
tel/intel-rst.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/in=
tel/intel-smartconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/ib=
m_rtl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/cl=
assmate-laptop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdim=
m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_btt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_e820.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_mf624.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/p8022.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/psnap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/garp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/mrp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_htb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_hfsc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_red.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_gred.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_ingress.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_sfq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_tbf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_teql.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_prio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_multiq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_netem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_drr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_plug.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_mqprio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_mqprio_li=
b.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_skbprio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_choke.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_qfq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_cbs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_etf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_u32.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_route.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_fw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_basic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_cgroup.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_cmp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_nbyte.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_u32.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_meta.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_text.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netlink/netlink_dia=
g.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/xfrm4_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_di=
ag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/aut=
h_rpcgss.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpc=
sec_gss_krb5.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/vmw_vsock/vsock_dia=
g.o
>>> ERROR: modpost: "nfsd_nl_rpc_status_get_start" [fs/nfsd/nfsd.ko] undefi=
ned!
>>> ERROR: modpost: "nfsd_nl_rpc_status_get_done" [fs/nfsd/nfsd.ko] undefin=
ed!
>>> ERROR: modpost: "nfsd_nl_rpc_status_get_dumpit" [fs/nfsd/nfsd.ko] undef=
ined!
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Chuck Lever


