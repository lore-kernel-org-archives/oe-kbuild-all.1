Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28BB15B5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jan 2023 18:06:49 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017qvse029775;
	Sun, 1 Jan 2023 16:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fyGy/dYo/qTvgfalipFtgULJqLTeR2t3wWljoGjHRzM=;
 b=PNCb4azIQx5ItQ9UQX8NFVqxCCqhEGUPrlK1CIiwElYjFaRJWwkmM7a52L4o0XDxTXkJ
 zwewdPPTvIKpTd4Z9adw+k51q9UqkOmb8AjmZP4uf63MHyk7aqUhsfuQsqoDyK2wscpH
 USChV87DqjlznYbyhVBHcjRHQFCIU9S5Bk8psNVJoVhJjE/uentGPTgNKPLj+PVC2ebi
 PY/0mlPIWV0MHSPgAs3noc7MzpbaoL8F8mhuXL8CnvAvlfRvZDhT31wWlORuFZ2ejbZB
 aZ28M/s5aLSoW56GKOofn40urBfiyTmveebIoKpb0hZQ9M3OtJ8Q2OVxABSqKMFKdQ/x /w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mtd4c1cgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Jan 2023 16:42:00 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 301F0lnK012661;
	Sun, 1 Jan 2023 16:41:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3mtbh9e8hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Jan 2023 16:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHI4vEGbVs/Cl4At9xdRYZYgtJVacy+BuHU2mdWzeqi1nbIxJ+SfMxwtkyDbKtH4ADnGty2CZoZTq8DoDs6MDh7sVOUtl5WK1nXmlebDmoeUyWZr83K48v11et8k0hQwjMBNoDec8aRVvjLT5HDIqZTyNO1YViMSzA77fliqOhhpjhfoJsbB092sjbky2Z8xmQNN/CmXi6u0/FVbJsbAEi9uayh4cckRLZfrCsVTD2U3lTXRjm09E4LJaDcFCaR1hlgZllaP3YL7/ExGwaNB8z4ylJT0D5fJJcbuuNzXp7MxSLCizPCVb6MZgjhXJoB9CP8PZo3CZFW2s7Im/T71HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyGy/dYo/qTvgfalipFtgULJqLTeR2t3wWljoGjHRzM=;
 b=l+JzPJIo9IdRJ5jdRY0c2jKtxIodQNnM5jbaJ1GREw2sRKk1vk7+AVWrMXfGSwIzPy3oO2ecpYJbTNd+PWG2R6vCAqYQjmDYL31nmTjeuHlinq64mfgDMMDcZFPpjj6gjNkT5ZYPT+iqcz/NppKDJLLNWzkthpXqP2UtYgtV3xdwh1htMPVZfHydKNPKYJvw8HhCUjmagyGT753O6069GeGrsZtR4gu7Gvc6CwDjOlP2U7UGp5zHAJ/e4Ds7qYu1fgUd8+jvivp6enNUXI1/DCerRXyuK7haXZ4Wo7vmbVSJMPMmT9NCAq87qsx8lPDSlAgclCq5q0Dky/+/dbfJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyGy/dYo/qTvgfalipFtgULJqLTeR2t3wWljoGjHRzM=;
 b=qbBLzrV7FclzuyWBlunXr4gPRwlYCQEmm+I3XhaMUkW0bClXzUi0MWGFEqn3SX03wmuTyHPbVQXZPEn+qbe9i8Y9KLFKw3G5T6Q5CQgpA9KSdW2UqWoXLJWAC/HWdd6O+z1QjB41/p6dDcrHVwp3Ik0sV6NnUBcf7TSLontDNs8=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB7052.namprd10.prod.outlook.com (2603:10b6:8:14c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sun, 1 Jan
 2023 16:41:58 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::d8a4:336a:21e:40d9]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::d8a4:336a:21e:40d9%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 16:41:58 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:topic-rpcsec-gss-krb5-enhancements 30/67]
 net/sunrpc/auth_gss/gss_krb5_mech.c:561:15-18: ERROR: reference preceded by
 free on line 559 (fwd)
Thread-Topic: [cel:topic-rpcsec-gss-krb5-enhancements 30/67]
 net/sunrpc/auth_gss/gss_krb5_mech.c:561:15-18: ERROR: reference preceded by
 free on line 559 (fwd)
Thread-Index: AQHZHbfbWuEHxjH6NkG0eZfcNrTk666JxHyA
Date: Sun, 1 Jan 2023 16:41:58 +0000
Message-ID: <82DE8A1F-6972-4B74-A8AB-C38D8C58B616@oracle.com>
References: <alpine.DEB.2.22.394.2301010904570.3090@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2301010904570.3090@hadrien>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|DS0PR10MB7052:EE_
x-ms-office365-filtering-correlation-id: 4d7c9902-af33-4c42-0868-08daec171992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uWm5IQVyMVlG7Mp2FKsF32N0gMxKvCGdKRuyqMXvd12qihK9WTJ8skcPWt9V5sVV7oBXhya2wjoSq+Q/CCCMDp+2nur3mnmNObKwXFwd998uZ5XTd7J7HfslEsncrDDOtp0qfZQjlSVRqmBBP4QfmtxpyEN9tIBj57aEiL6/EVLgkEnFUfs1LqOj3ogrQnv0fzZDpFcC+Igodx1vxpxtoI96dKXU03ttDhx9O7eEsLKZgpco5VERDflRyxkao03zk5qsOpMgDweSvzx3/IetFRb+SWc7XrXh94IeLSyLbXAWacjPG5S60YzoZkV2XaNSVUCwfNFBPaYBFsIpKQik9vI7cpkqmGcFmuF6XxtCxUCQhVVwoX1WGUZprQIIHhA0hIZVHLy14vnPBHS4Mkeu6P+Ory8gZ+Wevrt7GPMI5sx1Qkv95C3naqpUCY81pQx1IoFVw7Z0V3QaGK7aEPRB9YVpqZByiB5tl3gujnhxhLnSkZDLlY6yP7QU8xwVjVjbU4KEnLV71CDhUJf7TMKGEH1Q7+hloUxRXehhGePCP0Oo9Fmw5KyZjLjXY3kjY524tvtSe12EU8Id8BZy28E/ItZm70DImp8YMS5YlGK/5v8MXjT1N3vYrL8wRq9SYDhIby8efjZP72h1IKgjLBac7waYUQDWS6ja7pDqWVjWQaDo5Nn5k93Y/+PouRvrWjSfs/13ZWvLdUJtFHsBogUaZ4i5hFsG33Iqq/Ofr2lu6ra6U6mUfcRO07enFP3uJZx9GCbWjFsJd6FcrZA2rTONmw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(53546011)(478600001)(71200400001)(6486002)(122000001)(966005)(8936002)(33656002)(83380400001)(26005)(6506007)(6512007)(186003)(6916009)(316002)(2616005)(66946007)(36756003)(66556008)(76116006)(8676002)(66446008)(64756008)(66476007)(4326008)(41300700001)(38070700005)(91956017)(38100700002)(5660300002)(4001150100001)(86362001)(2906002)(22166003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YX7LBNVwJXhWMBx76n7RNOVQRUtN9Zf9mYzA8e4uwOdMPee+I7rUYsGw4eOH?=
 =?us-ascii?Q?tgE+s5BmqZ+Okr0zksP+dqs2w6A7GECAXdIfSsAVKw7ct4xYkCMSj06iYAoj?=
 =?us-ascii?Q?Yf1LRK4Ypy6OwAqpCNloK51FLNjZQ9Uh45gvLHoi7TlwTqG7juz00Gd/tpP7?=
 =?us-ascii?Q?c2oVtqEacDi9sfjmZH3f6cUxOpPdE1cg+trii2KF9Z8Zgmr+SBIhs1lC7aBg?=
 =?us-ascii?Q?H6jrPBpFa4j6DgU6Tl23l3mF2IBeGI1u17Q14B9MlsgUFhrbkxxOCeyHSWj7?=
 =?us-ascii?Q?EvEUrkrbsvmZWQahI8CXM7sUjWCz38V4yJbtaLYLkiNfYgz52/4fyMB+sEWX?=
 =?us-ascii?Q?qD+ziA2IpRKR4QPaH4jW8pP8EIN62DTdxnumvQL/BO7tdtlWCrTtrhdM/hX/?=
 =?us-ascii?Q?kBMm+scNO/P7SZHl4Z8uGu9PJo3CKy51U8vjvBQv55sxcly5HoHfirdh8nH3?=
 =?us-ascii?Q?w/r8v3356STnqiG3pQdsR0IbzmhtNUVRbkdA+uVB73OaL1/NVjMA2IqJ8SnR?=
 =?us-ascii?Q?eJJBEnao18Dju/UMJt3vj8OljLUeVsoveeEHreEVSvPPCgbkzvJidQ6CaPaU?=
 =?us-ascii?Q?+i4o+GQzR7GrPdJ1LJTFdocwO7Ffg9/0dYPl45zzZFrQUR/GqhKPU8dM46uQ?=
 =?us-ascii?Q?/H8xg+jakgaMl6bABsXvIje3zfKxy7dTqTIrdAkenyTx9tSGQO5O9kAYWD7b?=
 =?us-ascii?Q?GXCJiZpSP1XXGge4J574UMiNNwqXYW7WXd/0NfJQOeBr5XKUeUxPewz0pxDC?=
 =?us-ascii?Q?kP3zIVXSHTWYRDTRCsWKHuZfiguzeQ4YYYSg98w8VzpGFQIiAu21fwVRtknw?=
 =?us-ascii?Q?caRSqNnFtOwr3Nke1vchsarWL+nhKfQgJgLwS/iuIEI5srLhflG/m8ZJH/Bl?=
 =?us-ascii?Q?U7e6tLskjPKdsODpd6r0Uybf/lbK9vIPnO5bJMT1IcMF3Jc97+uCmPjnLsqc?=
 =?us-ascii?Q?8RAmR/azMcHZFTgVdjjI62mkUM/8AwaFwb0eT55jg2S9eHZubgv7VxXL3Hk9?=
 =?us-ascii?Q?qm4MGKM21EP2kE1so5CMM3sG+J3Nrrtx6NgOjq6VMeFwgdz0Iuoj6hAxERRW?=
 =?us-ascii?Q?mcl0QJ7UK7bDGwp2tIZ9sBrJHL5scrStf48w+a7FjeFhy3gtTSQmORLrbDKD?=
 =?us-ascii?Q?L4AE4X1M0HT3kTVX9F/jUTCf4VtJZBhskwPvnRXIwgmnvDShGy2/pppusv+r?=
 =?us-ascii?Q?9gyZg1Pt7EVezNwLO1tjsOMZlBKGuySIzchoqWYhJmU/h8/rd759aEWCaOC2?=
 =?us-ascii?Q?tHIFy6WkA25TvkSgbLhd9LCJ4doUhm/2+x3v9VD95t+6n7Izd+BsFmU5Hxmf?=
 =?us-ascii?Q?VyuCkXMjeDVKUXaVmtVrKWtbZxGtJwrJd8HW88me/fqKl1lpn0tfY4C9ttRc?=
 =?us-ascii?Q?oom87FAEqrzLx3Px+eiWiT/TRCGbsPKp9gVGJgBgyJDar6yKufhtlMOvC0wt?=
 =?us-ascii?Q?ukv4BBluUzHEBuO7n/IS6wDliUF67ptWGzi2Usfrqk3GFZsdIXubZVCv/Eti?=
 =?us-ascii?Q?aLayIju6QhLduiOgQJNS/xYkpf+2nEec7bctPZtK2sZhPaTa/GtpsNP8nEyn?=
 =?us-ascii?Q?o43KkT0cUlWiyB4+IpES4VAPWduJkYv1lPpgfV6wKJaZTwRdnrEW6N95DmcU?=
 =?us-ascii?Q?DQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <73D822F329F7E34A9E9B965595CFAD66@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7c9902-af33-4c42-0868-08daec171992
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2023 16:41:58.3437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6SefkrtBWim1YB4JE+dKoc5Urha2FVLCh6IFcOt2cFPikhGN+EWvvSEtRm42QVNyXCW2mmdZFuUsvheNqMRa5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7052
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-01_07,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301010153
X-Proofpoint-GUID: IU6uSAKtsmAT_kKmXaQ_qISdUOERqs-z
X-Proofpoint-ORIG-GUID: IU6uSAKtsmAT_kKmXaQ_qISdUOERqs-z


> On Jan 1, 2023, at 3:05 AM, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>=20
> See line 559 and 561.

D'oh! Good catch.


> julia
>=20
> ---------- Forwarded message ----------
> Date: Sun, 1 Jan 2023 08:39:57 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [cel:topic-rpcsec-gss-krb5-enhancements 30/67]
>    net/sunrpc/auth_gss/gss_krb5_mech.c:561:15-18: ERROR: reference preced=
ed by
>    free on line 559
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Chuck Lever <chuck.lever@oracle.com>
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc=
sec-gss-krb5-enhancements
> head:   aa20fa7b4e53f714b87e2769ccb80c120776c5cc
> commit: 206158bc9c2ea86853ad9d9c276f4dbf57a62cfb [30/67] SUNRPC: Improve =
Kerberos confounder generation
> :::::: branch date: 5 days ago
> :::::: commit date: 5 days ago
> config: x86_64-randconfig-c002
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>=20
> cocci warnings: (new ones prefixed by >>)
>>> net/sunrpc/auth_gss/gss_krb5_mech.c:561:15-18: ERROR: reference precede=
d by free on line 559
>=20
> vim +561 net/sunrpc/auth_gss/gss_krb5_mech.c
>=20
> 47d84807762966 Kevin Coffman   2010-03-17  534
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  535  static int
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  536  gss_import_sec_context_ke=
rberos(const void *p, size_t len,
> 1f4c86c0be9064 Trond Myklebust 2010-05-13  537  				struct gss_ctx *ctx_i=
d,
> 294ec5b87a8aae Arnd Bergmann   2018-06-07  538  				time64_t *endtime,
> 1f4c86c0be9064 Trond Myklebust 2010-05-13  539  				gfp_t gfp_mask)
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  540  {
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  541  	const void *end =3D (con=
st void *)((const char *)p + len);
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  542  	struct  krb5_ctx *ctx;
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  543  	int ret;
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  544
> 1f4c86c0be9064 Trond Myklebust 2010-05-13  545  	ctx =3D kzalloc(sizeof(*=
ctx), gfp_mask);
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  546  	if (ctx =3D=3D NULL)
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  547  		return -ENOMEM;
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  548
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  549  	if (len =3D=3D 85)
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  550  		ret =3D gss_import_v1_c=
ontext(p, end, ctx);
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  551  	else
> 1f4c86c0be9064 Trond Myklebust 2010-05-13  552  		ret =3D gss_import_v2_c=
ontext(p, end, ctx, gfp_mask);
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  553
> 400f26b542e869 Simo Sorce      2012-05-25  554  	if (ret =3D=3D 0) {
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  555  		ctx_id->internal_ctx_id=
 =3D ctx;
> 400f26b542e869 Simo Sorce      2012-05-25  556  		if (endtime)
> 400f26b542e869 Simo Sorce      2012-05-25  557  			*endtime =3D ctx->endt=
ime;
> 400f26b542e869 Simo Sorce      2012-05-25  558  	} else
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17 @559  		kfree(ctx);
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  560
> 206158bc9c2ea8 Chuck Lever     2022-12-21 @561  	atomic64_set(&ctx->confo=
under, get_random_u64());
> 206158bc9c2ea8 Chuck Lever     2022-12-21  562  	get_random_bytes(&ctx->c=
onfkey, sizeof(ctx->confkey));
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  563  	return ret;
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  564  }
> a8cc1cb7d7a12b Kevin Coffman   2010-03-17  565
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://01.org/lkp<config.txt>

--
Chuck Lever



