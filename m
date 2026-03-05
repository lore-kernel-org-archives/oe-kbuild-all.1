Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860937DE82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705640; cv=fail; b=MDrUhk3xhaMFm/zs19obrH1Kbt7cnaLIhZU5qsCs5ORohcbjQH7YEwYERkKiV1el9WYzxfiW6YlvkvHpvbzhD5/kg9miIpSjA8HJhp6/miCB1XVqfto4zOnbEmpmOTZgTpClw1njlsjLikTmq7oqfe6Q+71IuDy/64j1ctxxq8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705640; c=relaxed/simple;
	bh=ybRTq2PHTG/b+cqqF5J9X9rNIbrBP5kkE55gUwfprDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mbtUtTWWBIuyzbx5TZTlHoBzbScq43u2cu8AWcjOXyC6amiNgmew0CgsmMtohfS8TXlhUjOeXs0s1ch+cOaXRvTQvrlTVUiJqGYvd0hM7Y9sgqFzXniQoasDnk/rxvlc+F0EHyxv1U6/nTC1fXJNs/FarCe8CzbyAh+Ak6dzuu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gWKIM7kq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hbA91OX7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gWKIM7kq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hbA91OX7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AAoW2598167;
	Thu, 5 Mar 2026 10:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sBVJK6SF6gQWU5IY71YqlU3hy0eyXaxtijOfI5JrOCA=; b=
	gWKIM7kqlHHPr8CVAn8WVaLJ5roy+S8qeRgopHhzvnMCAKMivfIojZDH26lQCc2Y
	24iBkOnMV+/ZTEjqW2Ul+pq1Cwa6yAL6MkRXPWzZP52qk75l4X11xSY3MJYUkGFZ
	bJxUBopuihLTFtUXPNLQ8K03bG88aFrebhJZrTWyBrCXc4TzIoKo5M1PnAwQ+PqQ
	u4LpXxVrqxuqxHXEmIhMjOykUkwrPlXWV6a6xFJeJCyHo85iZv/LlB4uKc2nyvLf
	IUKe5NB8Ac9++iWC5/64uY7BaPSBxE4LPr5/L+fsN6X4frhLQCd0PCv3RKiB1CDA
	eZeizTfblQL9ikyLQGC+NA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cq7up005h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Mar 2026 10:13:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6259xFYe034703;
	Thu, 5 Mar 2026 10:13:56 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpth3kqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Mar 2026 10:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJVx73Rf0YHr64Xl/vUbJTXeOuhif/U0spQLS4ym/hnU/9YifLwp/UgDZf75wX3csH7dFKCK6ghce7LHlHkegGZgxsV6gPHXOt+4oau+ut3JvB1Rpk8HT5u3NYBkPrUYBXQ4u9EiVvvsBK/i9tHeQyIaSlBjqhIzrirUgRkcu4/0EMrRLg7SAKo8YQ2aNO98FCtYO067iJ5KN0Q8Pa596SiETJ9259r0lZDrTn42nuF2ph9MTpDh4NyTRO4kJAhzW6iRazcaM/ByCQlGmPIC0X4C05XXiaK4ljNOdEOYwiPDmOrkvazIMtWXUeCVyg5z0S+9YAb8qYFOPngfF20Lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBVJK6SF6gQWU5IY71YqlU3hy0eyXaxtijOfI5JrOCA=;
 b=wKblIYlpHHtDDhwaToPFBrBOp+CsR1b6wqfOkSRpzZnq3krxCp1oofN/UW+VPnv/Y+d4F+sQlYkqD5N4gTpBMgNzaG/lG2TBVb9dX5EL2z7GNgF+lYxvykMkAh2HahuUFrWHgFE8IqdLfYeTHTS5Ygjq81Bk8qKtINlE7/nSZVz57nzGWCKccCRI1/53I6iomgngfxWhZkMxnBsn9PmRgsG9RfAlmrT7ys5nNxp8doOPHCwAu6ihOxd3Z8iRV6T9n7e9UeIiSc5lL/99zZ+ITLXw1Mdet7BsoSwaPQs3LFY9RcohFt3i06z6N9oejQsnCPd13H0YvFGamdLVmdWt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBVJK6SF6gQWU5IY71YqlU3hy0eyXaxtijOfI5JrOCA=;
 b=hbA91OX7PlU64KGekVKRg6V0M/FBhmSQ0eh+9d38GNG8gHJLHFf2neDekIYRp50OTzq9smnaZpYukdKYPmM+AyrYplDy6gk3YTMQ7U8MKAjCnccS/UsDBdzU4Ba+CFx3NU5SIESbTOj/0Nd29KWuC+ReggSouAwxyEUzu5EPK58=
Received: from CH3PR10MB7704.namprd10.prod.outlook.com (2603:10b6:610:1a9::8)
 by BL3PR10MB6089.namprd10.prod.outlook.com (2603:10b6:208:3b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 10:13:09 +0000
Received: from CH3PR10MB7704.namprd10.prod.outlook.com
 ([fe80::2a5a:b9d9:26b5:25e2]) by CH3PR10MB7704.namprd10.prod.outlook.com
 ([fe80::2a5a:b9d9:26b5:25e2%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:13:09 +0000
From: Praveen Kannoju <praveen.kannoju@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH] net/mlx5: poll mlx5 eq during irq migration
Thread-Topic: [PATCH] net/mlx5: poll mlx5 eq during irq migration
Thread-Index: AQHcq/Jc3KuDnivfpU60Ol++d2Bny7WfrTQAgAAL1+A=
Date: Thu, 5 Mar 2026 10:13:08 +0000
Message-ID:
 <CH3PR10MB7704E2BEF429A2CF6EFC573D8C7DA@CH3PR10MB7704.namprd10.prod.outlook.com>
References: <20260304161704.910564-1-praveen.kannoju@oracle.com>
 <202603051743.ceus9qzu-lkp@intel.com>
In-Reply-To: <202603051743.ceus9qzu-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_Enabled=True;MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_SiteId=4e2c6054-71cb-48f1-bd6c-3a9705aca71b;MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_SetDate=2026-03-05T10:11:44.0000000Z;MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_Name=Restricted-Including
 External
 Recipients;MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_ContentBits=3;MSIP_Label_94b7886c-3e74-443c-a58e-890de065ec46_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR10MB7704:EE_|BL3PR10MB6089:EE_
x-ms-office365-filtering-correlation-id: 3f130d20-5a4e-414b-b563-08de7a9fccf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info:
 xFD18fsKDGnQ8Y9DD+dowV+fW1nctMvKx2uLryv1dgevCGboCSeSF2yYvOfe0riqZb2XmA1X6etSz/5G1wEW6EUldGFTZjDZ/G9k3R38ZvXyY6a5U3rogW8oGrEbE8YJIR1QjQ4H/9Lp6Wz1OiIsRuMI79OWx72eG7og0Vp0iEkj0JowbS/y4upxBVFEXeJeHL5G8uTsaagmyjPAeiKOjF8cIYbxJtQwo2na7mZ8TAB+05joaj3NoTaG5W2JvodSc2bwI36AwwEcrJSr649MkjK9wNye/LBd/HG8htNxt0aS0557lzvXn9noNgAY95XiN+qUNteWdqUxwHFYk8ZIHY7vgHB3pFG0c+/mkbNpiwDRxgkYnfhwCMDI3C5DQShCzvZGrsS9yIRjBBi048z95ukVytOKitpnQbq9k48TeT0JRTcv0AIEgKg3eV/n8XCxd+N0SS8GcT/RQzbm7QYttoQrCmJEsfMgt4iKlGlGjIvzWfbo3ZUlXbDiPf6OLDbj6vaOODdZbC3X+34pipus/yTaIvcYYGEBuOwojAvP8DTLlJBwFJw0QfpRupHMmrOaTl95+a+e1TeD+jAuwhokEO9CCyPQMYcv06tUpMsfmF+n07t6uEM1+VDM2YFOUZpMIzeM1QPR+divluxUXxP5z39x8prGHAoZqMu3Ckmtkk5US8jqXqPkpMdr38txa5y3nDBehjezatGPNx7NZtlBogieeijD4dTHddGhiHPQN7PNU70UBIeRE5m9VFjwcUS3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7704.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?eHZLM1ZJazhna0g5WWorLXhzSDZ5TDNyV1ZxMVA3dCstTW1QZ0hGQ1p6NjJr?=
 =?utf-7?B?aWFkMDlYZE1uaFNBRVBZTXF0RE0zS2dlSVV6SmZaRFM5bFhDQTJlM1I5VXVx?=
 =?utf-7?B?NzZadkJWM3RMREZQTFI1QnNNNHVtMm8zUlM3dEtvTEhYWC81N29NZ0lpRVdM?=
 =?utf-7?B?by9qQWdHTUFWYnBOcFZNdExUZistdUd4MllwY21wcVhIdmdBQktUUjljRWpO?=
 =?utf-7?B?MTEvYmQyT29DdVlhT2h0enVkNFNRSVBuRTBvTndQaG15ZncyNm80ejRXVFVx?=
 =?utf-7?B?aU1GZjRpb3hqT3B0cDBFM1lHMUF5VUo4L3ZnRThJWUVjdSstVE9DWFE3dEc1?=
 =?utf-7?B?UUpsN0d4UEtxSXEzQkduNDRuc1lDTnZqeVNabUpVTGc2UUpsRCstSzJyaTJS?=
 =?utf-7?B?MmRHWGxyVWh4bE5kMDJhQnBRSnN2dXF0OW5oYXZzN3VLaWdZOFR1bkRtbFN2?=
 =?utf-7?B?ekhQbkZKbG5iUTIvOGl1TkFZZ2MwUHV0a3RldzBoOEFKckJiMDNIVEIxWW54?=
 =?utf-7?B?RkRCalRPb1k2a211M0dXdFpobEMwbFpGTUwyaG95ck54TW5pYUZFYjFGL1c=?=
 =?utf-7?B?Ky1jME1hYzRycHVRWWNna1J6R1A2MTNjRU5STFVydUhQZnYvL1NDeWZ4TjFS?=
 =?utf-7?B?N0FkWkF0WWQwc2s1bTJjZ3IvYVBDU1AxMkJKazZuRGFRTWtJczJpZWV6dXZ4?=
 =?utf-7?B?dHJ3SmdrWkprQ2lLdldiT0UydnpXV0tya1VROTM2OWxtaVRSV1ZPVTcyZjE2?=
 =?utf-7?B?ZlVCVW1za2g3c0FWNVVPRUI3NGpCVEJSeE1nbkErLU9RQ29aQ0pKcFc0N2FQ?=
 =?utf-7?B?YlpmVGk5Y1ZOWk1NbjFzcmN3T29idistdDNrRG1RdGFnZC8rLXk2c1h5UkpT?=
 =?utf-7?B?MUlpYWRxUkJUdXFvYmdKeG94N3F5eDRXKy0rLUsrLVkzVURUUHJBN29Ecm9O?=
 =?utf-7?B?NlB4WHhmYmZnRkMyNWZBZ3Q2ejJnNWNtQUM1V01QeGFuUnhjYjNOWWo2VS9m?=
 =?utf-7?B?OVNvdVRHWnh4dEtVOW9CS0hoRzEvUldDZFlDZUlta2JXKy0wR3duUEZWYnRj?=
 =?utf-7?B?VGd4OXZRTystYy94RXdFM2cyMC9rSXNoNEpxcXpjUTJ5dVJoSk9nb2FVMTVB?=
 =?utf-7?B?QmE2UVVNNWxRU1RyamNaYnVDWWJiZXNoTDdUMk5YRjhBdVlaMHVqQnRnOHpK?=
 =?utf-7?B?NHBveUlYTlpwaG56MFkyeUpiV2FsL0RXcmF4MFk1YmRnbU5hMzBjZDd6bm1w?=
 =?utf-7?B?YzhYUlJTTlhsRzhzSnhMa0w4SjRmNlZvYUN3aE4vSHNxWnNyeDFCdTBOTG9w?=
 =?utf-7?B?THJYekJrZWVmRnBsbEVmVFhlKy0zMHVSUHFHSTQ1NUJlR3JWS2hLT1p2UTdr?=
 =?utf-7?B?TnFidW9HT0RpRkc5d29wZzVaUWZmdm51S2dDSzRVUENpVUkrLWs1Tm1SSVBw?=
 =?utf-7?B?bm9TQkZWVVgzeTd5SFhCL0JSWistaTVzVnkxcW1WVklNS1BPU0pBS20rLUlC?=
 =?utf-7?B?VHFOVUZLbW9XUmRReDVtSmNLeXVEQmRBaU1iNzV1SHkzYmJRN3c0YloxbldB?=
 =?utf-7?B?L0JPZHIzUnRETSstdFdtdE04NjNCWGtaYURoWXJqVE9qeGdDTDlwWUZOTVBC?=
 =?utf-7?B?eHdwOGN0S1JDSkg0V1g1RW9ZbGxlY0NSZjVsV2lsdTl4VkJhV05uVlZYYUtR?=
 =?utf-7?B?NjlJM2hSY1NsYklaS3JSWUhKektBSFJwc3RzclVXU1gxbkJJSDR2d0ZjN0NW?=
 =?utf-7?B?RDh3Sjk3eDV0cVI5aW5pWENmekU5Rm1BalBZMzFRQUduTkFHWEN2Z3dqM1FD?=
 =?utf-7?B?cVlFSTd0UUovKy1xcTd1azNjc2p4eVNSTHdGcjJMWXQvTWQzazJ3NjhCaGhB?=
 =?utf-7?B?ZU1KOWc0MUVGcS9YdzZCS0JoSWp6MXBWZGJReGgzVWgvYWd0eUF1Ykk4OHJT?=
 =?utf-7?B?QWdKSkdMVXdRNlBRL2dxa2dlQTZjNmlNWmZybEJRazBUd3ZLVWhqbXExcFRw?=
 =?utf-7?B?WlFpYlplWFE1WW9LR1hBT0I2NmpLazBBblNqRXBTYUZDSjBUd3dkUjlldU40?=
 =?utf-7?B?VEExcHUzODhvU1dtd085VlJhU0FFam5xL2krLVM0dFdtdWJ6ZmtGM0s5RDI3?=
 =?utf-7?B?eVpOblJ4SmkxMnpjQXJwU0xtWFdrZXFXVHRnMklPUEo5NmNSWm1JLzdWNEpl?=
 =?utf-7?B?VVU2TDJxaVpCeUFSU2JnU3B6emZzendqaGhob1JmcnZ1Z3FaRVpjdE1vc3RB?=
 =?utf-7?B?WW5wdHowbUdBWGRyeG42M0ZuVUdtMWR3aWZDZHJoWHptN0JiS0p6MVlZVUU0?=
 =?utf-7?B?cEpIeGNzWVVGc2wxSE9jUGx2cmJmL2dWR29WUFJERlJyUmJMVHRxVWZxQ2Nr?=
 =?utf-7?B?dnUwdEF5dWN1cGJTTGpBaFErQUQwQVBRLQ==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mL6bccOnhc+E74ZGMXyvHG0eyDuJhBOw5QoBO+mfBAZijZx1/Y+4eAMnyU5oZy9c10fdn9k3/f4dqL/O5dZyk2M/zXuWiIdi6k7G/9+fyQcAVMlNZwK94Q8b+JTb++dg9K2ILUJqjRpYTuxKVWoc63OWqT/hvL3b6fOR3V1117kl2bOJ1+S7BBfpBJjdtkZEzWXMOcHTSG7INkgiimb7XFlkMubIJIbo+fRXgHE6x9qLe7YlmXqKGdpQrT4mLheMH1WXWDgV8MAqA3VCAuNwA8MjQgmkjsszBMFUg6eF/awbq7Gak1B48wpRIL7pIdyWTiK3V8JR9bS6Zhs2McB9Gw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YwQD5a4zbNyprV4eqRGPAiA+kdAZ/zkcL9I9qaNSqTwD61R3kOHUiqlVWaUv5iER2aBndVAPE4BI4kRn6YhWXcUzQwor/APl6UQ7jsL3L/fJMHM7TyR7Ttmqbrh8spp9oqc/f7AV0/sS2hhn4RJh5yFZBiu7+19IAo9MZoREF6hrvKDMPWJifXvcHssUwbc7ergKMDklLI1JWCh+WFdKeswDteGU5OfEqbjdsXoTfZ1LWpiZzETehGAX92wUYdBrIhiit8HkBvIC9eN1EukPICabflQEmYlaTBJzAySAf4bsAPG4t4SwNNQCQ4WdlsZKSLuLefYFV6UWIH8GZlh4MTaW/w/i/DkKZv6f/ppuDtDqzJiuw3jEQpNN2WuZfyjVJOnJC7biX/H5CqmAnfHqzZKG2l+/v/S1iNlhMUnFBzjoURqvEvhhQ2imjHo1g3GPK8UGP6F98w3gk0sUFSJ94wYnTcbZ5p5U0ZcjEigDcZ34V5Yx9z3upNWF3JEQRrB/VJoQghlBl2nqijr7PNKsXl4D3Uao+swsMiym4R5dWodF6vaipI09DColV/50X0637CL6L0dk1hMnRTUbUQLaeZnZkYsDSalMZkYQ62fq31E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7704.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f130d20-5a4e-414b-b563-08de7a9fccf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 10:13:08.9305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmY88C7cnoPxbw2W9WMAf8vqN6z72ULmSnZIPRVo9hUaVVB2BGRIZcVPgsQ3iQX5r/B1p2k9JavidoTcyDtSQvK4kv+KKEjLl4Nn+XuQxkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6089
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603050082
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfXxoTdyCP76UFb
 99PRZxZ00E9K8bT3edIou82EaOJLIYIGBbD3C4xhwMiMMLsV3WPRu/CI4ge7G8nEgXjgEx9r7t0
 0m5sNhe1yZ0OZS48T1ctsFXYU7yD1VT5c8sLN9Ba4ZT/1ybeaghfb7eTJ3uduGENDXMWfXEFQMX
 KyHyH+kweIRLvk9/idcy4Ray2YTr1dkUlxDkhbaBV4IWt8ZnIS1nKXOqD7Q38djSwQWOj4cg8aQ
 OPZsL7CcvSRc411PU8uJmLzhj2s5lAcMcn1Q3XytQrFuIrAwJ/Qh1kGqW+yzGIb8Ht9k32EIn2g
 Zw/L3pDatbubHhEH+9w5/+SEW0wPdALDGjH65htBd3QhKuUJbMRcuOERT9ojSi9IeDm5igJstLW
 KfLaj0aUFmm2HfIvzPbCuNneisMwsz67CeYRSQVyob0o1kfAa1TN3qTqYuBxvG1Gs9eYjEA722P
 NDONCw2cjck1l/oMyea2YqHW6uyAd/3H3DGPqfcs=
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=69a95765 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10 a=YU3QZWNX-B8A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=Ikd4Dj_1AAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=20KFwNOVAAAA:8 a=XFJw1KJJAAAA:8
 a=mQvHCebiAAAA:8 a=BXszkKfDAAAA:8 a=c1PdSmG1AAAA:8 a=hggDf0hBAAAA:8
 a=NSIbRwiEAAAA:8 a=XlRjxQ70AAAA:8 a=QNEIRpixAAAA:8 a=-Rv4R1Kxbh4QkJMaxUMA:9
 a=avxi3fN6y70A:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=y1Q9-5lHfBjTkpIzbSAN:22
 a=DKZDSSD9H29Cdu8kcpdD:22 a=wsrb8zZI_WQ3QAEBCXTy:22 a=duu7wrcty9prphiCz_fF:22
 a=4iM0TfZbaBQr0p37pvCp:22 a=7ilw6d6txcz0Yr6I31bG:22 a=ijqVwrIbDdJfMQQjsWiJ:22
 a=1uMOUU2w0DxzEe95gQqD:22 a=qWpmzA7Y7fjpuCUfDRU4:22 cc=ntf awl=host:12266
X-Proofpoint-ORIG-GUID: PQnb5mtEDRF6WXHL79bP98JFdEefvZaU
X-Proofpoint-GUID: PQnb5mtEDRF6WXHL79bP98JFdEefvZaU

Confidential - Oracle Restricted +AFw-Including External Recipients

Patch applied to the wrong git tree. Will resubmit.



Confidential - Oracle Restricted +AFw-Including External Recipients
+AD4- -----Original Message-----
+AD4- From: kernel test robot +ADw-lkp+AEA-intel.com+AD4-
+AD4- Sent: Thursday, March 5, 2026 2:59 PM
+AD4- To: Praveen Kannoju +ADw-praveen.kannoju+AEA-oracle.com+AD4AOw- saeed=
m+AEA-nvidia.com+ADs-
+AD4- leon+AEA-kernel.org+ADs- tariqt+AEA-nvidia.com+ADs- mbloch+AEA-nvidia=
.com+ADs-
+AD4- andrew+-netdev+AEA-lunn.ch+ADs- davem+AEA-davemloft.net+ADs- edumazet=
+AEA-google.com+ADs-
+AD4- kuba+AEA-kernel.org+ADs- pabeni+AEA-redhat.com+ADs- netdev+AEA-vger.k=
ernel.org+ADs- linux-
+AD4- rdma+AEA-vger.kernel.org+ADs- linux-kernel+AEA-vger.kernel.org
+AD4- Cc: oe-kbuild-all+AEA-lists.linux.dev+ADs- Rama Nichanamatlu
+AD4- +ADw-rama.nichanamatlu+AEA-oracle.com+AD4AOw- Manjunath Patil
+AD4- +ADw-manjunath.b.patil+AEA-oracle.com+AD4AOw- Anand Khoje
+AD4- +ADw-anand.a.khoje+AEA-oracle.com+AD4AOw- Praveen Kannoju
+AD4- +ADw-praveen.kannoju+AEA-oracle.com+AD4-
+AD4- Subject: Re: +AFs-PATCH+AF0- net/mlx5: poll mlx5 eq during irq migrat=
ion
+AD4-
+AD4- Hi Praveen,
+AD4-
+AD4- kernel test robot noticed the following build warnings:
+AD4-
+AD4- +AFs-auto build test WARNING on net-next/main+AF0- +AFs-also build te=
st WARNING on
+AD4- net/main linus/master v7.0-rc2 next-20260304+AF0- +AFs-If your patch =
is applied to
+AD4- the wrong git tree, kindly drop us a note.
+AD4- And when submitting patch, we suggest to use '--base' as documented i=
n
+AD4- https://git-scm.com/docs/git-format-patch+ACMAXw-base+AF8-tree+AF8-in=
formation+AF0-
+AD4-
+AD4- url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Kumar-
+AD4- Kannoju/net-mlx5-poll-mlx5-eq-during-irq-migration/20260305-003505
+AD4- base:   net-next/main
+AD4- patch link:    https://lore.kernel.org/r/20260304161704.910564-1-
+AD4- praveen.kannoju+ACU-40oracle.com
+AD4- patch subject: +AFs-PATCH+AF0- net/mlx5: poll mlx5 eq during irq migr=
ation
+AD4- config: x86+AF8-64-rhel-9.4 (https://download.01.org/0day-
+AD4- ci/archive/20260305/202603051743.ceus9qzu-lkp+AEA-intel.com/config)
+AD4- compiler: gcc-14 (Debian 14.2.0-19) 14.2.0 reproduce (this is a W+AD0=
-1 build):
+AD4- (https://download.01.org/0day-
+AD4- ci/archive/20260305/202603051743.ceus9qzu-lkp+AEA-intel.com/reproduce=
)
+AD4-
+AD4- If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
+AD4- the same patch/commit), kindly add following tags
+AD4- +AHw- Reported-by: kernel test robot +ADw-lkp+AEA-intel.com+AD4-
+AD4- +AHw- Closes:
+AD4- +AHw- https://lore.kernel.org/oe-kbuild-all/202603051743.ceus9qzu-lkp=
+AEA-intel.
+AD4- +AHw- com/
+AD4-
+AD4- All warnings (new ones prefixed by +AD4APg-):
+AD4-
+AD4- +AD4APg- drivers/net/ethernet/mellanox/mlx5/core/eq.c:958:6: warning:=
 no
+AD4- +AD4APg- previous prototype for 'mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-not=
ify'
+AD4- +AD4APg- +AFs--Wmissing-prototypes+AF0-
+AD4-      958 +AHw- void mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-notify(struct ir=
q+AF8-affinity+AF8-notify +ACo-notify, const
+AD4- cpumask+AF8-t +ACo-mask)
+AD4-          +AHw-      +AF4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+=
AH4AfgB+AH4Afg-
+AD4- +AD4APg- drivers/net/ethernet/mellanox/mlx5/core/eq.c:978:6: warning:=
 no
+AD4- +AD4APg- previous prototype for 'mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-rel=
ease'
+AD4- +AD4APg- +AFs--Wmissing-prototypes+AF0-
+AD4-      978 +AHw- void mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-release(struct k=
ref +ACo-ref) +AHsAfQ-
+AD4-          +AHw-      +AF4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+AH4AfgB+=
AH4AfgB+AH4AfgB+-
+AD4-
+AD4-
+AD4- vim +-/mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-notify +-958
+AD4- drivers/net/ethernet/mellanox/mlx5/core/eq.c
+AD4-
+AD4-    957
+AD4-  +AD4- 958        void mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-notify(struct=
 irq+AF8-affinity+AF8-notify +ACo-notify, const
+AD4- cpumask+AF8-t +ACo-mask)
+AD4-    959        +AHs-
+AD4-    960                u32 eqe+AF8-count+ADs-
+AD4-    961                struct mlx5+AF8-eq+AF8-comp +ACo-eq +AD0- conta=
iner+AF8-of(notify, struct
+AD4- mlx5+AF8-eq+AF8-comp, notify)+ADs-
+AD4-    962
+AD4-    963                if (mlx5+AF8-reap+AF8-eq+AF8-irq+AF8-aff+AF8-ch=
ange) +AHs-
+AD4-    964                        mlx5+AF8-core+AF8-warn(eq-+AD4-core.dev=
, +ACI-irqn +AD0- 0x+ACU-x migration
+AD4- notified, EQ 0x+ACU-x: Cons +AD0- 0x+ACU-x+AFw-n+ACI-,
+AD4-    965                                       eq-+AD4-core.irqn, eq-+A=
D4-core.eqn, eq-
+AD4- +AD4-core.cons+AF8-index)+ADs-
+AD4-    966
+AD4-    967                        while (+ACE-rtnl+AF8-trylock())
+AD4-    968                                msleep(20)+ADs-
+AD4-    969
+AD4-    970                        eqe+AF8-count +AD0- mlx5+AF8-eq+AF8-pol=
l+AF8-irq+AF8-disabled(eq)+ADs-
+AD4-    971                        if (eqe+AF8-count)
+AD4-    972                                mlx5+AF8-core+AF8-warn(eq-+AD4-=
core.dev, +ACI-Recovered
+AD4- +ACU-d eqes on EQ 0x+ACU-x+AFw-n+ACI-,
+AD4-    973                                               eqe+AF8-count, e=
q-+AD4-core.eqn)+ADs-
+AD4-    974                        rtnl+AF8-unlock()+ADs-
+AD4-    975                +AH0-
+AD4-    976        +AH0-
+AD4-    977
+AD4-  +AD4- 978        void mlx5+AF8-eq+AF8-reap+AF8-irq+AF8-release(struc=
t kref +ACo-ref) +AHsAfQ-
+AD4-    979
+AD4-
+AD4- --
+AD4- 0-DAY CI Kernel Test Service
+AD4- https://github.com/intel/lkp-tests/wiki
