Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651ED33E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MxKFoOsp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EESpMYVs"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NDSnYk013819;
	Mon, 23 Oct 2023 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=iJlzvexHGadNfgezBRUzQKTbhT9oNe5O1cmN2dIaDmQ=;
 b=MxKFoOspzwmqoiIkck+meqWXLiyCC8wcha7d6KtGxt/2uJjcUrnGJUFauN8ydzvDENJi
 7VWiywYNstpvjfqOZH+12XlhyI7twozDeliEAClQ5uAmTCZRMiaahY3PPDym8OJ0y8gp
 GT9Np9r3PobKG5FqOPTnWshidVULxe/f39xs/BttSi0ZIyleJfMIP7j58hieC1qt18KH
 FsbTR3gnXvLQ6OLj4aVQJzOBkr6i0Wuehx8cTPjlqRkagmBI0Z4zgyobnhA2zhB08PAy
 HeIO7WxJ8MFq8H+5Ca4hin0q0L7dj/LFuWim03QdR3FfnFULosCVXAByWq/tkawLNJBT qg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv6pcu6r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Oct 2023 14:27:25 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39NE0CIw015099;
	Mon, 23 Oct 2023 14:27:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tv53417g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Oct 2023 14:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9EIY0rA7s8ZJkEW325wet3g032MJissDX+RA3kA3DBWwScIln0mES6lPjDXKCLgN8cgGFu4H2XZcV3NwWSmWuadC7xM6VU0NLUbCNI1rgjdEGjEUUvGkd06YOYEuRJbnmYH+tnUbViuMGJ7Y8cJGi0BghrypvmnVftRF0d6Yrnep2g5QtwwRLJHEIaDe3rw1uKYJS7fdy+r99F+riYTpHYQRRO4nUUnIz0JqT43ITH6lUkPoNGCWJSk86DQuiJjjjrzfjyvPUSVi/4W3L8cHTLxI0h2Fom375f3m3ImzNSXTTBByTIvo8BfDjR8Ic5T97VsoE9NpLpNQNoYK2MlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJlzvexHGadNfgezBRUzQKTbhT9oNe5O1cmN2dIaDmQ=;
 b=Ck1GOy8M7tvN6i4DqqguJnDYL/0NfdpPAD0E+tl3J7gLfQ2vZx+9qSfsN18FSc9W8pJxWP/jSOAq9RoW8aN7IpEeXNt7sD71LIu1i6Hi4rGwfdmdYROssGn2b6nE07iVdHlxC5jFs3sIz4+uuodO23Ah025buQ5QBZqyjh5cVm43Uqs2O231TD4GxCKcME93tVhM0Z3X88lB2/XrvpLedHQgV9K+G/Wr2CXTSLNH7CJZHj7uH2asXbnXwZLeIRGXVp5hI9Q9P4by8ZaXIkHSPC6RKii1Y3Ik34Ec07ebmMC+rr9qrMs8KCW1x13KCxP+k7tHEM0OSfAWucPHSqOa6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJlzvexHGadNfgezBRUzQKTbhT9oNe5O1cmN2dIaDmQ=;
 b=EESpMYVsuFZPFiWSwN/D6ZpEAcsvwYvkgiXVsxl2D/R9nmsuTZb4/fUjk0QlUUCq7I7ib+31ggin9fOD/MmQtC7wPA+7MsotdzwdVpn2KCOWmueyi8uJeZ5zFPiZbQZaUYh6Sbe3BiInGpqquLhV2sAh64QSf7BJM43GPp8iStQ=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7055.namprd10.prod.outlook.com (2603:10b6:510:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Mon, 23 Oct
 2023 14:27:21 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::7c24:2ee:f49:267]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::7c24:2ee:f49:267%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 14:27:20 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
CC: Chuck Lever <cel@kernel.org>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        lkp <lkp@intel.com>
Subject: Re: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Topic: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Index: AQHaAqCQwJqmSdwUNEqXZBKnPkqVzbBRo/cAgAAcvICABO+AgIAAxI8A
Date: Mon, 23 Oct 2023 14:27:20 +0000
Message-ID: <B413DF07-2DA4-4536-BFC6-64831621E543@oracle.com>
References: 
 <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>
 <202310200545.ScAzFYdK-lkp@intel.com>
 <D61BB9F1-C4AC-4654-9F0D-8FB4F3A737ED@oracle.com>
 <4a2b50ebbe3704f20c516248806453f919726349.camel@intel.com>
In-Reply-To: <4a2b50ebbe3704f20c516248806453f919726349.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB7055:EE_
x-ms-office365-filtering-correlation-id: d644baee-c970-48dc-6c1f-08dbd3d42aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 48ioA/k4B3OBJ3DX20sIfh78+zLabyBkEm4iXQmZUoEfCImtbVYoCiaUC5lrCSmCTJbnSVQQT8kP9fODE7e2sJ79RE00ouufagQHOaycVxdZOj2OEsU/ujkAjxMz0hILOhcLRcKyXsNm0NgbvuGnp8awPZM98nnC463rJklad3AE/JLqouwkVFcE7ACmrAx4oIXkHGFElWUA+khhlYy+PLGZc8XxXEekLt8/BYvwZbUbmiMYOC6ogvnS/u1YtLkvRzMqPw2vCsaVAS8qf7ukDycCWYpNnerzIFw1r4SgEpHIE6bl7w665hBwSKYAXmhFKTmFS6fcOpgph3PKYFUv97baH8FL2ZHXf8i2zcbqD4bl4Oa6g3OODt9IzQrl4Ja+AAnFi6b5v4eOvf6YAxxSkikORPyKMr5FV85eGShvfXWQL+7pHvACJYBdIFT1BbmUgO2vXYo6WIKLIPKzqpl0CO6YbdtvkCuw6b/HdVYUZFnLNrpcG/gLyia0GvK9M6XaHCnADctSv7iyXvC4Kes53pf51c8ffN5iTDoYgBgJfySsB5J8yG6krvSSVYLxx/WqWHE/pwIjRSojZySfa6HM4TxnUMttRi0j1SgkscxZpMGIjFvlqGeCdMETQp2oKlmgfMZ8S3tCeXcbio6fxiK0RbRVYbuMJeshLEx+Rj4NFYo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(38070700009)(4001150100001)(38100700002)(2906002)(86362001)(5660300002)(36756003)(8676002)(8936002)(4326008)(33656002)(2616005)(6506007)(478600001)(71200400001)(91956017)(122000001)(66946007)(66446008)(54906003)(316002)(76116006)(66476007)(66556008)(64756008)(6916009)(83380400001)(41300700001)(966005)(6486002)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VtG3EHZhUlSVaEfr0UK6aVXu+a7OxH7C0Sk5I2vo5/oUwGsw8C+DWqeTfqe2?=
 =?us-ascii?Q?TqMNbFT3z6wrXN6Sml4gOMehmIwMhMU9It1uf4xFYFEXCN+1DAQ5xA60sO66?=
 =?us-ascii?Q?ar/biNAmSBHQxr29KPUBAGhjV4Mjzve/bP/fTIE6MXRUzhuuNcVx3xqc55qW?=
 =?us-ascii?Q?bqiWH/LZF84PydlvWXm92NWeTfEgrV4Emuq3gkTW3ni/9C3itfkDl8sPQfRl?=
 =?us-ascii?Q?RJ18GQF8xMImDxPSi3hu0fk+x1Rue07TBFddii8TBYlN3kOWrj9lQajqhq2N?=
 =?us-ascii?Q?3mNgKEpZpN/8kEtXfdu2M5DC2+FbtQeWHh7KY1QE3pu71Z6v2Q7zQn5D7OD9?=
 =?us-ascii?Q?sSuXu4FC0SCCtpiGRFho7JRrwWLn/fwmEfFc8meXKn8CCRW+6Si/rPhw6O04?=
 =?us-ascii?Q?4Tafn5E3eI12vkSDbTegkpTo+/DuiFzHU1QQCsncHy4tGfFp0XxsUpweu2Q5?=
 =?us-ascii?Q?2XXfhIujvj9FqODkxFrskuMePGD30xZ3c+roiG0COtEvgA2T5STsQwi6bVTv?=
 =?us-ascii?Q?xVIh70Yw7vp9czxVeoW/snQnJpwXNMGeDQuUWxo0fwhGQqEbX2YA+5NX/UNc?=
 =?us-ascii?Q?rYD37Ae2Hzvq6s3kxOj+VVrIGEATqOSbss1ck1fKXfmDZjYNHZZkWbNtt54k?=
 =?us-ascii?Q?VJ0RT0nzMkU6jb2OUVrU2SrtQaeGMek6RTZlmgMZZoNhhYIeRYxk7+qpdeWS?=
 =?us-ascii?Q?UF37gmxer7nIuRBUbE5HiRWS8mkbzLQd9gr9dGgWmO5QTil+Z1hsw5LEcGwg?=
 =?us-ascii?Q?WTT7HDOc/fZpFCH5yMza2ARte7txFhA0uFQZcOHiTAdVJgLgF7HBLo23OOse?=
 =?us-ascii?Q?yHgdQ8Tl84Ovu7BjZGQDUmrzHuQyfHHb5gJWnBKc81KgWOKi5MIzSsSR7KnQ?=
 =?us-ascii?Q?WoNBe+BFpZznfU7VaBMCxbWtssElNKyTXjKpe3KhYZMeghpLDyKN2xB0GNS+?=
 =?us-ascii?Q?YtGkwp/JuomtRQXPqzWdU9uZFk690SKd9xzQ0N05z9pjPAWwmhAoF+NG8C8P?=
 =?us-ascii?Q?+2QZuyDtZ1uvJ+FgZJqqUJRndzCkqtdxdB/6ZJBLnSibKHo6Rl9COZnbLjx5?=
 =?us-ascii?Q?Njbz9PR/OYrYip1gplKuELBZ28uaatD2oYx4/OuYIJQFJt30MIOQNVS7RBY/?=
 =?us-ascii?Q?OIRzTqcepJg5uo5XgXPbVEeYX7ZIdW/tu/vTJK2XoyDL2LeV9ysuUHYqbvvp?=
 =?us-ascii?Q?LHvdImf9XtMYxQ70SkF39Fwt99sbsv90udEmXyajgN/CtOR1JTBELve8Sumc?=
 =?us-ascii?Q?WXaajUQWHgDEEsY8SuTHsNlKXUIWBPegvHTp8zDqMpXnM3o2qbNxlwKnF1AX?=
 =?us-ascii?Q?JEXt5N4zG+1lZq9Mc5BJT1z2TqHXqQluan5UfxCaNkWuEgRrVnT0sDu7h/4g?=
 =?us-ascii?Q?B5RQxHx+tCJpF5tDbxip7C7Qayx5l/OoAdYhA01zSPCEW+h6rHbEghxt/2xJ?=
 =?us-ascii?Q?jT4kV/LxVTfA41nN8L5VFvYOAermGrHRgGPZzmeTdb7/ZbHFK2siIT8EKQkn?=
 =?us-ascii?Q?WHsxU4qRBIdIkYr77cddXpiTTu4glo8lQHCv+ga/x7UJFe4wxb47EaX3RUeD?=
 =?us-ascii?Q?YZZO1EV7aUu2/9tMCdgwxuAnmhtg3bMxt/nrh0rWzHbjDjw0TFD712PlgDIi?=
 =?us-ascii?Q?ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD424A6E9B63C045A20D20234682AF26@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	o3BWmK1xzA/6Oat6ycp/VMYfM9rX6prX8eIThB9WuFrP4ZrthSSu8qrSOMuyGQN96o7ImhM7HFhSDitkkjTach4R+UYA4UcWrH69EQ1WuZgP6g0+n0ie4A27/jjlQrPaJ2jh85HHumsUv0txkto5FjjwB3fE0cPy7Ar82BjiFnwUQS2PfWSsFnpMDfqwbM30+F77ld3K2kj2lYwxXqruX98r6A7wbO+U7lnmy5oKiAC0Cf0B/UYvAa+mNneBDGH26RgDBo60+PcutS/eNkmCvsb2gHWhY0wY7+NhqukpgKbDPw4/BqbyvmGIl1MzRPx3xYUtRJTcGhPfxaFSYfl8iEUF6pV8+XOveQIvR3jsJIKS58cfICaaAb8YFczQuR9b4u8KQoenzhiWtDcRXS8ct/poFp60ImtyUBROgLzyArnxpJP7kWLe6dEFCXFJij/eyD3UHSCzfmmZxbECmd0wUKgk/MX1ESB81doFF8hyh6wcoE4rRi09FcJpmjflWVUQ+nX2+zMR8jRg+lVM0ArHE1nQDRLOD5DcHmQhv1dRMCzKiyLfnYEltKwKzf7qX15cT2CU/t7k3xIpnSt6AR4jmvgGYlAw/+SeqchtdU1WOP+IN1mmC1miRshk4MfcDDyjh4zDWSn3SAHrJfi2bkLGdg7BkctlrfXcNfKiiiKumOfdQH/+h+rFdnbtGFWQ0piIRGiXkK9/+455sPJP/hvLL96CEB6CRQe8JnaxSnOTF+hQLM+T7Ow4jA2QvxFhy3s9jZcELuQheh5Bl55fDJ3CdFdkut0hupsx5boVKTUKeCoMw7jI1MpxsWawRGfLsMI/
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d644baee-c970-48dc-6c1f-08dbd3d42aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 14:27:20.5427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQjNXv2AKQ246Y5G3XvbL9+YF9V86NZps3zv9p4KO0vPwakDlgm5sULWAets9QQgy+K2pALTthxnDAtmsD9Gew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_13,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230125
X-Proofpoint-GUID: yT7Vfkb-JyfB6csB1_tpq5kY-MtNiDE_
X-Proofpoint-ORIG-GUID: yT7Vfkb-JyfB6csB1_tpq5kY-MtNiDE_



> On Oct 22, 2023, at 10:43 PM, Liu, Yujie <yujie.liu@intel.com> wrote:
>=20
> Hi Chuck,
>=20
> On Thu, 2023-10-19 at 23:21 +0000, Chuck Lever III wrote:
>>=20
>>=20
>>> On Oct 19, 2023, at 5:38 PM, kernel test robot <lkp@intel.com> wrote:
>>>=20
>>> Hi Chuck,
>>>=20
>>> [This is a private test report for your RFC patch.]
>>> kernel test robot noticed the following build warnings:
>>>=20
>>> [auto build test WARNING on akpm-mm/mm-everything]
>>> [also build test WARNING on rdma/for-next linus/master v6.6-rc6 next-20=
231019]
>>> [cannot apply to joro-iommu/next]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>=20
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/dma-=
debug-Fix-a-typo-in-a-debugging-eye-catcher/20231020-032859
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
everything
>>> patch link:    https://lore.kernel.org/r/169772915215.5232.101274072585=
44978465.stgit%40klimt.1015granger.net
>>> patch subject: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for ma=
pping bio_vec arrays
>>> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/2023=
1020/202310200545.ScAzFYdK-lkp@intel.com/config)
>>> compiler: m68k-linux-gcc (GCC) 13.2.0
>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231020/202310200545.ScAzFYdK-lkp@intel.com/reproduce)
>>>=20
>>> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
>>> the same patch/commit), kindly add following tags
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202310200545.ScAzFYdK-lk=
p@intel.com/
>>=20
>> Fwiw, this was an RFC series. Reviewers have already rejected
>> this approach, so I won't be posting another version of this.
>>=20
>> Is there a way to flush out the test pipeline so no more tests
>> are run on the series?
>=20
> Sorry we are not able to flush out this patch series from the bot after
> the test was triggered. We are not sure if there will be follow-up
> reports for this series, but the reports for RFC patches are sent to
> you privately and won't go to the mailing list. Please kindly ignore
> them if the series is obsolete. Sorry for any inconvenience.

No inconvenience... but wanted to make sure that these were not counted
as regressions, and also that if you have a database looking for the
reported issues to be addressed, there would be no fix forthcoming ;-)


--
Chuck Lever


