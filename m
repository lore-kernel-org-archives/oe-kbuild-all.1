Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B191CA81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318112; cv=fail; b=QHPQhs7RnvVeQ3kdqHFVUHjWnSeYGAbPopmDt8JcIUNkLF802NVMmJ83cMcxELKotTKaG9aSIPQn9BcBwX5LRhVpqCHYTEuNeTNPtf8B45CxfXkOPwL24Y28Dtiiz/+NXdyEU3F9yJ4QXAEV3GCK0SZDAhh3F7Gj1qv5UrqsRx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318112; c=relaxed/simple;
	bh=3Y2X7n6WwEgrBbNK0OufeSflzPcu/3ntpwev92L/t9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R14v5G2JElzWgOM5ZHwSfaP6Uk67w6SNC9RToBJxrrTXM2vKwZ7Zy7jvc+ar4slTqOzZBVGua8dyOgEml+4yeEjMJZf6d8X2E0WqgvQ42qTfHWTm1sobI2xq8E4tvDgJuoFudTdVHI6PEnmt5TrMe1Z45xtiWoYlq39+4JPAgRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jzb1Zjyk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=guQwA/+M; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jzb1Zjyk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="guQwA/+M"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9ksMG029033;
	Fri, 31 Jan 2025 10:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wOsLmeek2SAEzWvh+s
	emvoL6ziemsgL6iagrDPjasp0=; b=Jzb1ZjykOyG5betATjObg8AkkJf7K1GDg/
	e/S13dOkQbKdRZvKRKN1yDJwsjX250VyveZlaGBmnXEXU3L1LiizIIkavJDs1vX+
	6FAsgyr2AnzL3PxKODVEAw8+BlwfwO+gYiKahhT6pvOy1eYy/EO1CWYwYCMGnPvk
	Y+WtFkE6Fw5asabaVJyYVgQW4pxgrcjzgfE/TKny+GJ0D5TjUTG7tsmooqlB9TBN
	TJuacuB4AqP4ZduScI0yMOJ/2rtjfoxTMfcykCZxD8jRa7btRSl9D83BAegzfA8d
	H+yiKGIMYErdy1JgPYaT0JvFwxALUZeGzTEUcQxkbv1LMlYUcs4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gv6cr0tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 10:08:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VA75pd004398;
	Fri, 31 Jan 2025 10:08:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe4rv49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 10:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/xsCne2K90TylADCOKjoYRiEEgwzOu2ypSn3JFuNz/jPMQ/ngp7eH7gRkJ82XNcNAdEGl2aI6jZtdBBzdNKTdAfFdQ5MERNX7ie9oxecCtYsP6w6q1xH4qdCMc2FPZIlfYcIMWGdhoOzGkCIKyDRixbgvjbDwsdk1CC/uxcDHEukda4X6XnDhU7vvzFMTHVGpwII8rEw0kDUS7y9IGhIyVt+bamMxAqv/773RydWrt9uEMcapTOoZ+5PEIGpScRJMfUtOrU3JAvDnd2pgIJdJYbx27v5lcsz1g3EttElORDTyGZzuH2EQZctFFO+OkHdpJrizq8rAyeBMj0wvckQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOsLmeek2SAEzWvh+semvoL6ziemsgL6iagrDPjasp0=;
 b=DGar2HLS69b6Nfa7Bk8gTA8532FwEuyPnhDGZZx52NDmkAAp++b5OCOUeMM+GcVmpZh3bi8GPVW4ooY/ly6QD4UP4dFemKUBrevHYG8hIFaRmHKWHXYqHQxVcHjWkFG+qyPa2BNkTqFawiRrr7HurLUFVeYj84U/toATMZMBi/ih2dLRdeTI7/51BH8Q92wERqham8uLpoFRSHRR4m3MNZJaeRpzFChE7Mn2s9KiqCf4z/ARFqwjNLQajSy+1V09xK2DH6H8BMXAH8CIWrynWJuxCWrQpoE2NR98xbrwJJY0Yq1hOuCYKzK4iFMp0IN/OpeWnYbWDdKPguFFQsNIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOsLmeek2SAEzWvh+semvoL6ziemsgL6iagrDPjasp0=;
 b=guQwA/+MdXaAvvRERL0R3czXEJbP+pUbZl6DpcHdiq7HDywup0qp8cqL2TN2GrQfiM1MV4qt0dkDN5nKiXpET+CZ/U7RF5QzwMdY1+pWAgorprUNAz98jrDE8WscL74IxAz6+U1beNl+2tcHv0J/kEct+39aQ5Us+x+XApRIT7k=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA3PR10MB8161.namprd10.prod.outlook.com (2603:10b6:208:50f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 10:08:06 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 10:08:04 +0000
Date: Fri, 31 Jan 2025 10:07:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [akpm-mm:mm-unstable 106/111] include/linux/kern_levels.h:5:25:
 warning: unknown conversion type character 'b' in format
Message-ID: <4b879d9a-2d38-4788-9475-b81ae34eb886@lucifer.local>
References: <202501311708.dRI35epU-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501311708.dRI35epU-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA3PR10MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5302f4-fb8f-4fbf-af0f-08dd41df26ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FgcVowYcOtUteFe/3XCMOUCvIbv/mBRcJlIhqNIHF7hfSS5oX7GGQUtGuHZW?=
 =?us-ascii?Q?PfFE6O9qJ1GEinSfTpAbFvS6sZJeIDtGkAJjFa/y2luJediOk1aPsD1byvRI?=
 =?us-ascii?Q?W1G4r7+lkO90lik+iRaZAjWFzelqaARfjqg2ypbW+f3EzpbPUOIMxCv6oZ2D?=
 =?us-ascii?Q?crVKUqoo/xv8IZUsR5mfgU2l9qxoD4OuSrrTg+pCinSOIiiYdtrEfhXej4K4?=
 =?us-ascii?Q?17Xy7CVjaU1pHhHv4NQg/xqR5HYzrh4UGtcwin8L7MuWusmN5tp6SMEi2PIV?=
 =?us-ascii?Q?2R83uRBKhZEUvtofsFm2aZUqLeQAjodK/udDlwUhpkCavzR5+6WKlP5Htfgt?=
 =?us-ascii?Q?nyFPAn6f3WOADIncA2fjGYF8pjRi7KGOdHlrk0OgKmhezRgTCOBZzFTR8LwY?=
 =?us-ascii?Q?iO2r7SLHeUIqKl1hh6dk4aQ1rb4fhrRqZb70JNtDW86SlKvDUCfdWGgwAxMx?=
 =?us-ascii?Q?wpXh04SIBHfU4MTllysUXV+EMJ4nv4hvBuQ0ppeyC19ffF6okddFFAjfsBA4?=
 =?us-ascii?Q?EOCZ71qireINSPX/ZlDRIXlSsncagl8BQfYSEZILlVt1qQSyg+dJA2/MF5AC?=
 =?us-ascii?Q?FP6sPW175qgjSUvQnRxP0hCOhWTTHmELbptimC7PsKyshvQnAyuMp5kh7P1t?=
 =?us-ascii?Q?GOSyrhvg6MraQt2XsVUwfqSqOqi01mDZtwd428fHq0m5RTP/p/58HbZfXSxr?=
 =?us-ascii?Q?ZnaRSKOebGujM8Fz1IhzqBrdjdEPVkAfh86mu+wm6lVJJmu9CuAC962QTzsb?=
 =?us-ascii?Q?iyo+OI4rCq7jSBSSbJBOYnqzQosOAIc+VlUgXxhQ2AC8QHUNwNMsbEvbDBlI?=
 =?us-ascii?Q?x5pWsCC4JjNvzFf5s8c0IWf/9dpohSbzxSCA4We8IHcIKSxaMRhwUutsdpV1?=
 =?us-ascii?Q?dbtKnzItg6yvMFkyPA6O9ar5dn4tZdi6guYoDFifQNuT+vDv31Awx23FPfFP?=
 =?us-ascii?Q?zTxUkbtIltxeDZ5X1eO//sTis2CStqPBTRpnGhHc2xEv7nU5sA07vH8sptRv?=
 =?us-ascii?Q?ANalRchFNdT2COdlcZMo0kQITLy9+mH+9TkScMk+iViODnMoZG3r/tHByw9/?=
 =?us-ascii?Q?kJ3ZQCchTyzp3cOPhsANwBzwwpY7URsglfO9XlczD/iZbCSsuOD2cH4znFL/?=
 =?us-ascii?Q?F6oFqBjnxWFr71iXqJDrJTszKOyzlw4mn+KUX8H45I/0cdJI/SKfurp4jOEf?=
 =?us-ascii?Q?RsZ5ySAxAYLAMK65m7UgGmvpEgAYohvohN7Nkna87wxC7j5EKT7VzREsDxMr?=
 =?us-ascii?Q?Zz/gc+ImU9j29JIcTaPyykHGGcC3dS322v+zNZqU0iXc4YhTh1awEM+uLweq?=
 =?us-ascii?Q?jnNKNmGpLzbDlesNs0vE+iH15HiY4n24Yd+3Ryypx5YYlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KgWb4vCVHglOB6sVnlunxlVCpbtOCUNYQTR0JF9TvJXkigrYXpktkpD0dky?=
 =?us-ascii?Q?giUv9tJrTvuNudqH2ILq4Iew3imkntgX1YEmsTL6Yw1nVx8uiB+9U3WsbvPk?=
 =?us-ascii?Q?ozBjXYmDxw6OhJAAmrE/N5wyqYCpoEmqp+bNv8BTtwE2uVa9+vWpPp7HtjTg?=
 =?us-ascii?Q?PRl31bWCzyFnfvMmUDYp/lph0sk33rxfsOkWvRLiaDOALovZYxqOFXpdUaIN?=
 =?us-ascii?Q?aG0tGkiZu0e8Q6gCcFRHILzEZzb/y2BuBRv6aWn+HKyMJxkdQ1kQirdfMtJp?=
 =?us-ascii?Q?XRNhthgfjaG+GCDdeOUC1YHpbApqMpBmKr8jZZAtzrwwcpz6m4qdyR9/6bua?=
 =?us-ascii?Q?ohMUonyqVZECCwLc6EjhaWyei19yqJ8G91Y7GIXqH5CHWgj5NBlkKlrOKmip?=
 =?us-ascii?Q?QTVqWWGxSGb+B3Nu24IkqdD4dKa8t5EOjoc67d0bN3nmQPh6KCsEIkUIi+AS?=
 =?us-ascii?Q?3n6lQhy3yZavYQbqfT7BHzgQrEO34QeiIpFmRXdtLlfdCY6eWL4hFw+ulOdx?=
 =?us-ascii?Q?cXQfF92N1BM66KsoJJ9nkgTOUCGzU3e4EIAHd1m65DkmBJLjQJ4bDfRFXHlc?=
 =?us-ascii?Q?HGEP9BoSoWDvSR5vLrQmEfCd/7iMlY3y39azqt77EEtSw/FVejYu4zuPmo15?=
 =?us-ascii?Q?Y1gEHQ9f+ygDm/+vwPeI4ws7NB4mxcwp/PN0snnyR8YYvRlIusrDtD16ADZb?=
 =?us-ascii?Q?lOIqpx3y+q/x4CEly4bGdyFh+LBh+1zFN5xH42ldHmUEPugyzEMzxY6eGujK?=
 =?us-ascii?Q?ubQSd5NvliErzORjXhO8Za61A5OkVtgn2WU64vfi9s2Fjvvs3NrjcPYF45oA?=
 =?us-ascii?Q?O4sA9A5L4yDFi5jKBT+jn3aFXhyI47ZD6Yeb0YXD33HNaoqJ8oTM9pX1io+s?=
 =?us-ascii?Q?ECvKNpIHEEBBdX+yFUeL/fT6Ax465j8cE/uk+nZbeKNFSqPITfi4i36MHd4m?=
 =?us-ascii?Q?83vecv8PP+v2yMEcNrQWzY8e7X1SHN+zQ43gc3Xgme3Ws/HdcfraFE6c4XyN?=
 =?us-ascii?Q?xKGoSwKRDSRwEUgpOv0rZkghESBQbjRQURcP1Gv7A9Il9iAo3dAZx/1LGj/K?=
 =?us-ascii?Q?3PVE87gFImFfK3UA5Y98217wIqG/nBPTnphoH3w8P2zIVeeI5yZC/DCrB/L/?=
 =?us-ascii?Q?Ct0rE+iOiTtU4zPI+vvWbwEBIZEtETMXSivD5r/AQIbt7NccRSuQG8ELHPup?=
 =?us-ascii?Q?6XTuHx3GxtwKgP+8+9GbHk6331TvHBJ00g7Q03AkRORHBRhweNspTtQhL5bG?=
 =?us-ascii?Q?qR8QjF+3+pKSxUlh+RxWKO3tSr4g85Bk2Ag1q1RbvLv83W41txTJeiqWVWA1?=
 =?us-ascii?Q?6danNfB8dIbCe+NKVnfXmdvMQMAcDU4YA8w4ziWe5NI4TfZroXrRrP5oI5Z7?=
 =?us-ascii?Q?iEsp9aj/chh4GWmzNmT9BNPMvnt+HrpfqahZY3SNmc+R9Hue385ZXMAEZ2+S?=
 =?us-ascii?Q?w1WvHrZ1AAzlPEbgofj9RDaPrbYHfp3mj2Z6t1v2wQyxoAdElBHC4opEg8Y/?=
 =?us-ascii?Q?oMlPqYHJLC+zHOyQfgnauU6ZfWxIzINipNRRwxdXH8tysxMuKape8m/df59A?=
 =?us-ascii?Q?/qAOo8hXRAup8G6/ZuOydOO5Ud/JVkjDcqUIxiV3PWdRkSsrFSxJt5bUcIot?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qFibnfQfdws7ZGnHZ51jXZm6SvVTp8nb1VfslTzaPLzQ2PgFcCis9qzYg1SKqxio8T8axpnn0JcQLCTKNxPSPPA2F9P9qnwxO3pm7jWVmYuZsWUhULbLfxePhsoTomGMxCOoDsNJ+KMsm4GGalJXJquk2bVvmV03DuUPfTx2+4nAMKrvuQwglYwDjr0r/hj6ncCUE2/Q7gPAaCC7u2NDtpCRNkR/Z0i/5F8IFNfTJSJASxEnDmImIgRtNgjiX6MC8hsrHBciV1Kk4k8Jo3v+IH5wu/mHtvYoIrTv16Q54DzkEgCfIHeRhA89fE9ciuyTtBTu33J/VoR5OhFI0+cFoosdxB808jIRaVrBnkQDyP2LSN+cG7LCldNL4sNlR5hNrpGbIvqDRwOssuoXviX0FfxU6rZiUrO8atTJdAO7MxQpj0CB64tmxM8m4DSqpvbBifZ7QS9SyBWuhQsVBlU2kMOr5MOj0IK0W8ung73J6/5QhjHWVVfl4OWbfw1LAYCWRwAVj/lkbfxYBqVRc/huvvvoUmZcRge/lEZfmHIeUzWoEHIREwuZa6P4UVKXbNK9ZM2edHOROpyR0KizsVGhzh6P73NUYV/sEpW76NPr4JU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5302f4-fb8f-4fbf-af0f-08dd41df26ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:08:04.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCtujSszOuQbnGFhEHvFbOmxZcDPCZErkdx6v33JcL/y5MADlFVgm3iT7lj745W+d4NkhMd4EfUfKUwCQAI3dAwuLICCBUhYc8hvbhpLBSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310076
X-Proofpoint-GUID: 7fmypdEk7qVwrhoIYnU5fRbi3XSV7X1a
X-Proofpoint-ORIG-GUID: 7fmypdEk7qVwrhoIYnU5fRbi3XSV7X1a

On Fri, Jan 31, 2025 at 05:43:28PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   f5604ad70091eabe663ea7106ced99449d653320
> commit: 951452b2ec82d352a69f14cfffdeb7c08461eefb [106/111] mm: further refactor commit_merge()
> config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311708.dRI35epU-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:31,
>                     from mm/debug.c:9:
>    mm/debug.c: In function 'dump_vmg':
> >> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
>        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */

Well that'll teach me for assuming a compiler with CONFIG_WERROR on will
actually... report warnings as errors. Apparently not.

Will send a follow up fix-patch...

>          |                         ^~~~~~
>    include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                         ^~~~
>    include/linux/printk.h:554:9: note: in expansion of macro 'printk'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |         ^~~~~~
>    include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
>       12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>          |                         ^~~~~~~~
>    include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |                ^~~~~~~~~~~~
>    mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
>      262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
>          |         ^~~~~~~
> >> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
>        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>          |                         ^~~~~~
>    include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                         ^~~~
>    include/linux/printk.h:554:9: note: in expansion of macro 'printk'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |         ^~~~~~
>    include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
>       12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>          |                         ^~~~~~~~
>    include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |                ^~~~~~~~~~~~
>    mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
>      262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
>          |         ^~~~~~~
> >> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
>        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>          |                         ^~~~~~
>    include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                         ^~~~
>    include/linux/printk.h:554:9: note: in expansion of macro 'printk'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |         ^~~~~~
>    include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
>       12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>          |                         ^~~~~~~~
>    include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |                ^~~~~~~~~~~~
>    mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
>      262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
>          |         ^~~~~~~
> >> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
>        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>          |                         ^~~~~~
>    include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                         ^~~~
>    include/linux/printk.h:554:9: note: in expansion of macro 'printk'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |         ^~~~~~
>    include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
>       12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
>          |                         ^~~~~~~~
>    include/linux/printk.h:554:16: note: in expansion of macro 'KERN_WARNING'
>      554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>          |                ^~~~~~~~~~~~
>    mm/debug.c:262:9: note: in expansion of macro 'pr_warn'
>      262 |         pr_warn("vmg %px state: mm %px pgoff %lx\n"
>          |         ^~~~~~~
>
>
> vim +/b +5 include/linux/kern_levels.h
>
> 314ba3520e513a Joe Perches 2012-07-30  4
> 04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
> 04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
> 04d2c8c83d0e3a Joe Perches 2012-07-30  7
>
> :::::: The code at line 5 was first introduced by commit
> :::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern
>
> :::::: TO: Joe Perches <joe@perches.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
