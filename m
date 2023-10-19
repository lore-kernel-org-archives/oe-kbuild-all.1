Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F619440
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="w3zZ3nwV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vvvJ0r+4"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JKxaX8027657;
	Thu, 19 Oct 2023 23:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=HFvOayNkIAUOuhS5EoP7tmUbR/cCeDffyEZWS4ZkS1Q=;
 b=w3zZ3nwV/aZg6yXWKkm9FeDQpSImg5V2XX5vxiUmSVu1CBeOiZ4/nr8/sK32wNIEFaUi
 jCNbge6Tsa2HP1qpOexDf60GHThdIk/tUjH6hnkJX974D/MA1I5QnWOI+ONThuLkCvXy
 qQVSWPVvvrhp/1X0s13/S7h21Bak/Mk7pAkdy9En2ULHn+Wb04DPmqEi3xHbtwKPDB42
 K+1PAfB3H3pKGgBW5L30NxbF5ggTMB+Rs/OXifNLH1VQEiVtgbT54L4a4wg2/7819qAH
 ZPlbBZbSpdf4Y8hfnc4LU6nWZmkud0fq5xe0pT+CG0Wgc31O1x+C5h7JsSX+tGrtUh4T +g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tubwc05w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 23:21:39 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39JKsjHQ014239;
	Thu, 19 Oct 2023 23:21:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tubwem81v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 23:21:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtWG0eDgD9LtnRWFVt1ZifiOx5Ym4+UGILZJb0qpiq+ERmQVDtsXLEmFrJ5Gg+iQ0FT5+gEZ+gJbyJc829VYAVXGzLd4vz7wAV+k/V4iESpamzS3xWer4inZMs4NhTIq1SriNGMyFjFde7NUtiXT6m3roQpbf1FaghxqA8sza3bq1fzAC6+d8I89+DIrZ62BrV2sIXvBfRtzqsBNFIqRxUHum2UNSLnNVc4U/m6aY2SQWHZq5QyOAO8JUV6D4L6N69TCIxOX+6reLUO4ePMHsAWzuFzlb9i5f2zjSM2waxHnmH6MxXJ0+cX382eHjrbHrFmrKKAq19WQWp0+ED1XKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFvOayNkIAUOuhS5EoP7tmUbR/cCeDffyEZWS4ZkS1Q=;
 b=XY7N1og7UhHYo6BUwWv4h+xr/jv028PxhEeqoZSFU2b4V1Da6ecTjpL+gUiYjLJagXLErXEcf5yC4h4NEuqQWZZbIleBUrAOwu6qySTAHeSQjC88bBp582sMKaSXcnEVHCSuifkqvlez200cvne0cAWw1EIYd5kf9iNbcBnhvbbXJwcZBAJ1hdVqwgmA0imxAcQxvwPobA4JFXa97PVGXPfmubRu3Q79G1VVBZPmxWwalN9mr91OIsG+uOOd8I5taZAbCUZyxva+yAAvdpsWS3oeHE3DBMd/VoWlBh5sxcEQFqXg9C08bANJ31wpVDeDKugsvc4TJfcAW6q30MZ6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFvOayNkIAUOuhS5EoP7tmUbR/cCeDffyEZWS4ZkS1Q=;
 b=vvvJ0r+4mr/ZbH84s5+313f3EodmgiiBmZxtLC4pW+igQO6hOiUFp1er7fGFwhn/BNpr+SfFq5HTNC2Cd56B1InsCv2rXQ7jT3PQef0bjrO60i2AYvQuAStBe/Cf59C1pGECkotfdThayWNsOpbu/x0rm3VrVM5SuHRw0bgh2Bw=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB7113.namprd10.prod.outlook.com (2603:10b6:208:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 23:21:36 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::215d:3058:19a6:ed3]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::215d:3058:19a6:ed3%3]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 23:21:36 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: Chuck Lever <cel@kernel.org>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Topic: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Index: AQHaAqCQwJqmSdwUNEqXZBKnPkqVzbBRo/cAgAAcvIA=
Date: Thu, 19 Oct 2023 23:21:36 +0000
Message-ID: <D61BB9F1-C4AC-4654-9F0D-8FB4F3A737ED@oracle.com>
References: 
 <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>
 <202310200545.ScAzFYdK-lkp@intel.com>
In-Reply-To: <202310200545.ScAzFYdK-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB7113:EE_
x-ms-office365-filtering-correlation-id: 7f6ee7d5-713a-431a-7fb2-08dbd0fa23ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uFZcEhlM+wKftppS+Zuw7Y3yElMBrRRmMZ+ohWcOyb5LuA3uZkvy7O1X9zm0498d0uOtkcgIiKkn/J1Lgif7vgIoguP2Um52HWnq0yoPqHz23KszbDv0TDm/8iyAYksm0GCYYrgjPEB3aDf8VKSVjO7ompitGlMoLi08b1AzOQawTNch1Hopd0g9bdZZbQNrBa0ZF3myqd9F6ylqAe2JipGdPR/y60IvpgOHeAp1oFoxt2xua1dfVwlnzUTfU13jrBnMcXexVl+SuZoZISS5UR8B1EiOQXwwyEAinf5UiZTjg6XkdOqUypyKkfyGxZkyrE6B4dvf3B8kDVKh0WxphQm8l+OckAMiKKtBeGVpjRQ6eEGbgAsv+PY8m9MU+60trryagFRGyOn4olwgE/Mx/+YQtWsVVORwVvE8vAzjwICMwQTKG2HTW1xwZVgd9AIzNX5AqyHwKEB56rKf/dGU0LlUvAzqmtPpqK4Hb+LF1NfnbTuzSgkPqNkRpzwAKwcQsymTsuWin/BCfC4Ex1KajBMQcsJNkd5JHSeVIScKRdTTboSBlyK5Y+/gGta7sFRO3evjanzKV+Nx0TvME/NHpljIo7qJXgZeJiy1ssugDN6NpziDfY0cRuoT0y1+JXgJOrd0bPtvoNSFnRJcNzbez1z29h5fwmm+qUMbV4JV2Nk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(71200400001)(83380400001)(26005)(2616005)(5660300002)(8936002)(4326008)(30864003)(2906002)(36756003)(33656002)(86362001)(8676002)(122000001)(38070700009)(6512007)(6506007)(53546011)(6486002)(966005)(91956017)(76116006)(66556008)(66476007)(66446008)(66946007)(41300700001)(54906003)(316002)(64756008)(6916009)(478600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fSVs0owSM/89JJJYG3mkwcXawQTsKaM8bQThREYNCX73JqYpF0Zj4BcDCy3y?=
 =?us-ascii?Q?4OTMxXiI3G40RTm+a66kyOMFhiXK3QIB48Kc1I20HITYspwBAoHjuHpGi3WH?=
 =?us-ascii?Q?amCl13Y6Ph+Bl81vqGcA9f79ynUJzazYFt5l5xiGfFp5yRfVMGwhM0we0ogo?=
 =?us-ascii?Q?GQ6ofnwkoqLRs4E42DRRY1cobtoGAEorKRFjCEl+jXE+Cxo7fVB4KueSMrAh?=
 =?us-ascii?Q?wyEPlDqBuqLAIEdeb7ADDC8OaofRPYnk56tr6HzCtmXhOXPhxJ9dW+cIUCAq?=
 =?us-ascii?Q?0f2K/7zxIoF9BL1czqjMxmCzkgw/lYIcUb/SnE3PunAPUX7KvacgEHSr5y0W?=
 =?us-ascii?Q?GzcZ8GIxy16AzzZQQNgyhneSYR+TbSjpeTD1FVBzbg0wLQwS8z8GkXhe3jUC?=
 =?us-ascii?Q?dg+BkUOkWXRwI4beHyfdprNedkUzgyia2z9jRFzhw0Fq4lklPCFdqVkLEIYa?=
 =?us-ascii?Q?ThDHHGlqw4K8RNoqBreXBvz/nJAytSjV9SYJy7UrImTGSS98V2Fk6bHRmKrI?=
 =?us-ascii?Q?Rvr6gSx7A4u8fYrAMuihl5oTZLaHTEU+QMyBtRsxTAtKqWL32ndUVJP6Q8Z3?=
 =?us-ascii?Q?pMsb/QOsTh60F7fT6bAcG8Jf7+s4ozi67eGsmuAuDfW+eBhkj8pQ2zEHKnlx?=
 =?us-ascii?Q?Bvz0Q1EWUtFVVeweuaMvz9biNfaPi64ed8Ub1tQLWeJLaPKdLrYMC7jq5ZE0?=
 =?us-ascii?Q?I3vxs5nb+ojx/hkTABIq6n2XBcS4XfFZ/MQHEWEDRoJOD65EAFj8udLX2tSH?=
 =?us-ascii?Q?9yG1D0YBGIEhwT5G+lthVLEpVU4pGc7A7f9A/WubdaQm0TAmyoGOKWVUrpdJ?=
 =?us-ascii?Q?D2G6mtp6jxgBma6sIlUjTI+k9h81XN1ke3d8pJk/quD8KPQpRrd7JQ/dMwGf?=
 =?us-ascii?Q?U1ppSgQOn6CLxTSjkVrJgQl6BQ6xwGIbtrzk1LosSsrUPz5dMCcbPcZAcqrB?=
 =?us-ascii?Q?mSrRy/+UEbb6F4LGmuJ6RYvDdJQWoc2RRNTC4T56WVd8psuHoprQZTOP4wV0?=
 =?us-ascii?Q?9yLdn2mrfGVNTA3xCzdG4BDZ5WAo01+ieB21rGNH36d+HwaCXJ2fh0JVL1eb?=
 =?us-ascii?Q?RWT9Ag/z7dVhNtX5JVCK9EUf1OLqN7YmW8juDkVYCW6N37A9SNyj3SxUrTWg?=
 =?us-ascii?Q?dlopr9wP/jgpKHWlZ3oKsW/RFYf/wVn5aWjBKSDO64mUbPTfBMpEfwKCNCcO?=
 =?us-ascii?Q?NSKFZ0NjNLUEXivXCk8y7gbfsRQCXd4nFX1yT2m3+plj9f7AIPUS7Ms46YNc?=
 =?us-ascii?Q?6mYroNTLRpySpwgxq+22KutTO1nMLzLHIPRiP8i97XJMBe0IohOj6gsW9n4q?=
 =?us-ascii?Q?dlxODsO2gnLjtaHOYdroH9E6A8ASrmPDjIYfCskmKCJpF0YjSH/1z2ehIEVV?=
 =?us-ascii?Q?NRe7jX93lVfeQG1QfrI/Fz377wE3PU+Bptis/CcYxDMyruvD320N0ikAnOrJ?=
 =?us-ascii?Q?wpoERQLIELAdMu6JW8hSnhK26ALaqffEd0ULFL6wiTiiygFdOkFU8sw4UHG1?=
 =?us-ascii?Q?KOWqo1ex4DPARhNeJmUklFMIZ5J6AyagQRt1MYUytLLov5dBUqp8dLEYGsm/?=
 =?us-ascii?Q?PXKZywdlCU4ffIUdQWVPvgz+eZ85Y+pdpgrYH0U2ea/GlNaf5FtcQWCrTDC7?=
 =?us-ascii?Q?kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C11B9210D036CA46B6D8A207D5BD6A1E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	WIj4DNxdDtjGmv56w2bip4+7c4M3GEtQLIzip58iOzOgRDS2JI5TMzs18DWvUVn64MAfqUGPokiUEM+SVZQpVs45aceiZSPTmNbM6RaIW2IJuHJqdZl9XarNAkpSvfLvVoZLcyFWSwGroXuQUFJI5uva0bsn4Ns/fFF9TBf8s70saPFa+EqQ3TROZcKPYBLaRY7ZgINp9/S0eV5cGWX/IXE7E8nfke3kcGt4l/EKtu/CgOrpwxbKYEQzKJk2ls1N06sycjoH1Ylpb3Wqv+3qLnej6bVExQrc9/bWVRNDf8lLHOoTfWL2Mmii/0AydnJSSnm6cvlBuptN+nCF6WJ63XXTLvP/+GQDJbITLxpLFoK1Ldp0+adt0/3DQAqZBXCeYC9NXW3mKe49n6g7heXpk52l6DmSKdQ0MEj6xC2lTxFt6Qg/we46WhtjbfEHq2nKfXlFAteUYkJThn0QgWQVF0E/9M1sqaBoNfIkCr3pQ0N1d/MRlG37AfKwsLnGFA9vxT8F3Q58VdWOPbWZIqSMGNJfpN5EmGtlQr5mQago//JGLh+GdeEx89t4BZ2NsKeRipsFXvFeE6mDtXpw/WP+tIwUzTps/1jKmqfIM/AhWfCi7b/Ir/NlUidZ42NnUnb/EXT1gNO23zVzPf2fDgtUXubfMSkl6GZ6viQpiRPP9qQ3NjDs9/t24AfxlK54tf1u6Lgliqgg/+W4elF4nTXnLr+AHPOwZ0pjNT2q0gky5JWgDxz9sBTSiRSVRISGygrScFB6Zc3bmC3Wb631lGpi1R+RUKcI8iz9Au7OR2W7YHkJ0JZBVUWejl5qXw64U0V4
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6ee7d5-713a-431a-7fb2-08dbd0fa23ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 23:21:36.1929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5NduzByS6BpQxdzvOCRl6sX3v/VyarMhxITi96GF8T0Xjyh7B5avI8HFzL3vY4gmDGCQFBDvNL10ipps9AJrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310190198
X-Proofpoint-GUID: b9qkTnlh_fBRYOdLLaZKR-2F3App3s-7
X-Proofpoint-ORIG-GUID: b9qkTnlh_fBRYOdLLaZKR-2F3App3s-7



> On Oct 19, 2023, at 5:38 PM, kernel test robot <lkp@intel.com> wrote:
>=20
> Hi Chuck,
>=20
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on rdma/for-next linus/master v6.6-rc6 next-2023=
1019]
> [cannot apply to joro-iommu/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/dma-de=
bug-Fix-a-typo-in-a-debugging-eye-catcher/20231020-032859
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/169772915215.5232.10127407258544=
978465.stgit%40klimt.1015granger.net
> patch subject: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapp=
ing bio_vec arrays
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202310=
20/202310200545.ScAzFYdK-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231020/202310200545.ScAzFYdK-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310200545.ScAzFYdK-lkp=
@intel.com/

Fwiw, this was an RFC series. Reviewers have already rejected
this approach, so I won't be posting another version of this.

Is there a way to flush out the test pipeline so no more tests
are run on the series?


> All warnings (new ones prefixed by >>):
>=20
>   kernel/dma/debug.c: In function 'check_bv_segment':
>   kernel/dma/debug.c:1204:15: error: 'struct bio_vec' has no member named=
 'length'
>    1204 |         if (bv->length > max_seg)
>         |               ^~
>   In file included from arch/m68k/include/asm/bug.h:32,
>                    from include/linux/bug.h:5,
>                    from include/linux/thread_info.h:13,
>                    from include/asm-generic/preempt.h:5,
>                    from ./arch/m68k/include/generated/asm/preempt.h:1,
>                    from include/linux/preempt.h:79,
>                    from arch/m68k/include/asm/irqflags.h:6,
>                    from include/linux/irqflags.h:17,
>                    from arch/m68k/include/asm/atomic.h:6,
>                    from include/linux/atomic.h:7,
>                    from include/linux/rcupdate.h:25,
>                    from include/linux/rculist.h:11,
>                    from include/linux/pid.h:5,
>                    from include/linux/sched.h:14,
>                    from include/linux/sched/task_stack.h:9,
>                    from kernel/dma/debug.c:10:
>   kernel/dma/debug.c:1206:30: error: 'struct bio_vec' has no member named=
 'length'
>    1206 |                            bv->length, max_seg);
>         |                              ^~
>   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_p=
rintf'
>      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, ar=
g);      \
>         |                                                              ^~=
~
>   kernel/dma/debug.c:224:25: note: in expansion of macro 'WARN'
>     224 |                         WARN(1, pr_fmt("%s %s: ") format,      =
         \
>         |                         ^~~~
>   kernel/dma/debug.c:1205:17: note: in expansion of macro 'err_printk'
>    1205 |                 err_printk(dev, NULL, "mapping bv entry longer =
than device claims to support [len=3D%u] [max=3D%u]\n",
>         |                 ^~~~~~~~~~
>   kernel/dma/debug.c: In function 'debug_dma_map_bvecs':
>   kernel/dma/debug.c:1377:38: error: implicit declaration of function 'bv=
_page'; did you mean 'sg_page'? [-Werror=3Dimplicit-function-declaration]
>    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
>         |                                      ^~~~~~~
>         |                                      sg_page
>   kernel/dma/debug.c:1377:55: error: 'struct bio_vec' has no member named=
 'offset'; did you mean 'bv_offset'?
>    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
>         |                                                       ^~~~~~
>         |                                                       bv_offset
>>> kernel/dma/debug.c:1377:38: warning: passing argument 2 of 'check_for_s=
tack' makes pointer from integer without a cast [-Wint-conversion]
>    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
>         |                                      ^~~~~~~~~~~
>         |                                      |
>         |                                      int
>   kernel/dma/debug.c:1059:42: note: expected 'struct page *' but argument=
 is of type 'int'
>    1059 |                             struct page *page, size_t offset)
>         |                             ~~~~~~~~~~~~~^~~~
>>> kernel/dma/debug.c:1378:34: warning: passing argument 1 of 'PageHighMem=
' makes pointer from integer without a cast [-Wint-conversion]
>    1378 |                 if (!PageHighMem(bv_page(bv)))
>         |                                  ^~~~~~~~~~~
>         |                                  |
>         |                                  int
>   In file included from include/linux/mmzone.h:23,
>                    from include/linux/gfp.h:7,
>                    from include/linux/mm.h:7,
>                    from include/linux/scatterlist.h:8,
>                    from kernel/dma/debug.c:11:
>   include/linux/page-flags.h:437:50: note: expected 'const struct page *'=
 but argument is of type 'int'
>     437 | static inline int Page##uname(const struct page *page) { return=
 0; }
>         |                               ~~~~~~~~~~~~~~~~~~~^~~~
>   include/linux/page-flags.h:461:38: note: in expansion of macro 'TESTPAG=
EFLAG_FALSE'
>     461 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, =
lname)   \
>         |                                      ^~~~~~~~~~~~~~~~~~
>   include/linux/page-flags.h:531:1: note: in expansion of macro 'PAGEFLAG=
_FALSE'
>     531 | PAGEFLAG_FALSE(HighMem, highmem)
>         | ^~~~~~~~~~~~~~
>   kernel/dma/debug.c:1379:68: error: 'struct bio_vec' has no member named=
 'length'
>    1379 |                         check_for_illegal_area(dev, bv_virt(bv)=
, bv->length);
>         |                                                                =
    ^~
>   In file included from arch/m68k/include/asm/page.h:66,
>                    from arch/m68k/include/asm/thread_info.h:6,
>                    from include/linux/thread_info.h:60:
>   include/asm-generic/memory_model.h:19:57: error: invalid operands to bi=
nary - (have 'int' and 'struct page *')
>      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_m=
ap) + \
>         |                                                  ~~~~~~ ^
>   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '=
__page_to_pfn'
>      64 | #define page_to_pfn __page_to_pfn
>         |                     ^~~~~~~~~~~~~
>   kernel/dma/debug.c:1391:41: note: in expansion of macro 'page_to_pfn'
>    1391 |                 entry->pfn            =3D page_to_pfn(bv_page(b=
v));
>         |                                         ^~~~~~~~~~~
>   kernel/dma/debug.c:1392:45: error: 'struct bio_vec' has no member named=
 'offset'; did you mean 'bv_offset'?
>    1392 |                 entry->offset         =3D bv->offset;
>         |                                             ^~~~~~
>         |                                             bv_offset
>   kernel/dma/debug.c: In function 'debug_dma_unmap_bvecs':
>   kernel/dma/debug.c:1464:25: error: 'nents' undeclared (first use in thi=
s function); did you mean 'net'?
>    1464 |         for (i =3D 0; i < nents; i++) {
>         |                         ^~~~~
>         |                         net
>   kernel/dma/debug.c:1464:25: note: each undeclared identifier is reporte=
d only once for each function it appears in
>   include/asm-generic/memory_model.h:19:57: error: invalid operands to bi=
nary - (have 'int' and 'struct page *')
>      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_m=
ap) + \
>         |                                                  ~~~~~~ ^
>   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '=
__page_to_pfn'
>      64 | #define page_to_pfn __page_to_pfn
>         |                     ^~~~~~~~~~~~~
>   kernel/dma/debug.c:1469:43: note: in expansion of macro 'page_to_pfn'
>    1469 |                         .pfn            =3D page_to_pfn(bv_page=
(bv)),
>         |                                           ^~~~~~~~~~~
>   kernel/dma/debug.c:1470:47: error: 'struct bio_vec' has no member named=
 'offset'; did you mean 'bv_offset'?
>    1470 |                         .offset         =3D bv->offset,
>         |                                               ^~~~~~
>         |                                               bv_offset
>   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_cpu':
>   kernel/dma/debug.c:1700:25: error: 'nents' undeclared (first use in thi=
s function); did you mean 'net'?
>    1700 |         for (i =3D 0; i < nents; i++) {
>         |                         ^~~~~
>         |                         net
>>> kernel/dma/debug.c:1695:25: warning: unused variable 'bv' [-Wunused-var=
iable]
>    1695 |         struct bio_vec *bv;
>         |                         ^~
>   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_device':
>   kernel/dma/debug.c:1732:25: error: 'nents' undeclared (first use in thi=
s function); did you mean 'net'?
>    1732 |         for (i =3D 0; i < nents; i++) {
>         |                         ^~~~~
>         |                         net
>   kernel/dma/debug.c:1727:25: warning: unused variable 'bv' [-Wunused-var=
iable]
>    1727 |         struct bio_vec *bv;
>         |                         ^~
>   cc1: some warnings being treated as errors
>=20
>=20
> vim +/check_for_stack +1377 kernel/dma/debug.c
>=20
>  1363=20
>  1364 void debug_dma_map_bvecs(struct device *dev, struct bio_vec *bvecs,
>  1365 int nents, int mapped_ents, int direction,
>  1366 unsigned long attrs)
>  1367 {
>  1368 struct dma_debug_entry *entry;
>  1369 struct bio_vec *bv;
>  1370 int i;
>  1371=20
>  1372 if (unlikely(dma_debug_disabled()))
>  1373 return;
>  1374=20
>  1375 for (i =3D 0; i < nents; i++) {
>  1376 bv =3D &bvecs[i];
>> 1377 check_for_stack(dev, bv_page(bv), bv->offset);
>> 1378 if (!PageHighMem(bv_page(bv)))
>  1379 check_for_illegal_area(dev, bv_virt(bv), bv->length);
>  1380 }
>  1381=20
>  1382 for (i =3D 0; i < nents; i++) {
>  1383 bv =3D &bvecs[i];
>  1384=20
>  1385 entry =3D dma_entry_alloc();
>  1386 if (!entry)
>  1387 return;
>  1388=20
>  1389 entry->type           =3D dma_debug_bv;
>  1390 entry->dev            =3D dev;
>  1391 entry->pfn      =3D page_to_pfn(bv_page(bv));
>  1392 entry->offset      =3D bv->offset;
>  1393 entry->size           =3D bv_dma_len(bv);
>  1394 entry->dev_addr       =3D bv_dma_address(bv);
>  1395 entry->direction      =3D direction;
>  1396 entry->sg_call_ents   =3D nents;
>  1397 entry->sg_mapped_ents =3D mapped_ents;
>  1398=20
>  1399 check_bv_segment(dev, bv);
>  1400=20
>  1401 add_dma_entry(entry, attrs);
>  1402 }
>  1403 }
>  1404=20
>  1405 static int get_nr_mapped_entries(struct device *dev,
>  1406 struct dma_debug_entry *ref)
>  1407 {
>  1408 struct dma_debug_entry *entry;
>  1409 struct hash_bucket *bucket;
>  1410 unsigned long flags;
>  1411 int mapped_ents;
>  1412=20
>  1413 bucket       =3D get_hash_bucket(ref, &flags);
>  1414 entry        =3D bucket_find_exact(bucket, ref);
>  1415 mapped_ents  =3D 0;
>  1416=20
>  1417 if (entry)
>  1418 mapped_ents =3D entry->sg_mapped_ents;
>  1419 put_hash_bucket(bucket, flags);
>  1420=20
>  1421 return mapped_ents;
>  1422 }
>  1423=20
>  1424 void debug_dma_unmap_sg(struct device *dev, struct scatterlist *sgl=
ist,
>  1425 int nelems, int dir)
>  1426 {
>  1427 struct scatterlist *s;
>  1428 int mapped_ents =3D 0, i;
>  1429=20
>  1430 if (unlikely(dma_debug_disabled()))
>  1431 return;
>  1432=20
>  1433 for_each_sg(sglist, s, nelems, i) {
>  1434=20
>  1435 struct dma_debug_entry ref =3D {
>  1436 .type           =3D dma_debug_sg,
>  1437 .dev            =3D dev,
>  1438 .pfn =3D page_to_pfn(sg_page(s)),
>  1439 .offset =3D s->offset,
>  1440 .dev_addr       =3D sg_dma_address(s),
>  1441 .size           =3D sg_dma_len(s),
>  1442 .direction      =3D dir,
>  1443 .sg_call_ents   =3D nelems,
>  1444 };
>  1445=20
>  1446 if (mapped_ents && i >=3D mapped_ents)
>  1447 break;
>  1448=20
>  1449 if (!i)
>  1450 mapped_ents =3D get_nr_mapped_entries(dev, &ref);
>  1451=20
>  1452 check_unmap(&ref);
>  1453 }
>  1454 }
>  1455=20
>  1456 void debug_dma_unmap_bvecs(struct device *dev, struct bio_vec *bvec=
s,
>  1457   int nelems, int dir)
>  1458 {
>  1459 int mapped_ents =3D 0, i;
>  1460=20
>  1461 if (unlikely(dma_debug_disabled()))
>  1462 return;
>  1463=20
>  1464 for (i =3D 0; i < nents; i++) {
>  1465 struct bio_vec *bv =3D &bvecs[i];
>  1466 struct dma_debug_entry ref =3D {
>  1467 .type           =3D dma_debug_bv,
>  1468 .dev            =3D dev,
>  1469 .pfn =3D page_to_pfn(bv_page(bv)),
>> 1470 .offset =3D bv->offset,
>  1471 .dev_addr       =3D bv_dma_address(bv),
>  1472 .size           =3D bv_dma_len(bv),
>  1473 .direction      =3D dir,
>  1474 .sg_call_ents   =3D nelems,
>  1475 };
>  1476=20
>  1477 if (mapped_ents && i >=3D mapped_ents)
>  1478 break;
>  1479=20
>  1480 if (!i)
>  1481 mapped_ents =3D get_nr_mapped_entries(dev, &ref);
>  1482=20
>  1483 check_unmap(&ref);
>  1484 }
>  1485 }
>  1486=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Chuck Lever


