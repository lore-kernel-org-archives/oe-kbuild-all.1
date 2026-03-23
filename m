Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92052324B16
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275883; cv=fail; b=elJQbqdyoJEsrD7Kr+GCjSG3n6GLprBVsCe3nQWeJO/t9FIB4lYaNMuQO/PP0MJniv1E8ppTPp4cHnFqMgIIhr/BbV7n3V2MdFbMDYHz79KNwZ67cqW6G0x7fLUAotEgclg5MXXzA3e/Jp3phOWmdyhxKy2Ala0jvD/2/ZjhcEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275883; c=relaxed/simple;
	bh=WdpXmYPeCkGO9wPKSu+CiXkd3PxKmyB2GQia3hErNU4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OxOSyD2STwuOTHu4MZphH45bMeNSFZ8r7GvBnv/DyomXwkbnZFlaJb7pq2s/8oYPl+QFuM5NahXtd+Ff3xOuC2ttY3JeTQgZrX4yw8QNif6P9P3AuR2T/qbmyRs+1hcFh3UupfBwnmlJQUuS5/EeLB1BQePcNvyw4WAZS2xBM+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=op/hL1h2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WfL1b8es; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="op/hL1h2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WfL1b8es"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDtBu92539979;
	Mon, 23 Mar 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wrNerBjtXIe0hYYZUDG6oDL+t48JyvJ2bQvpagnlUYM=; b=
	op/hL1h2YDnoAA3iWaoTn7qU6ne0M0Ufb66sN0wZIulhIM7DBYuYlDxeoK+do3wu
	RGgsPW9tOM+33Mk08F3P9thTLXgyE3GwxbxjIwHZLDSOriIOBr24XAjdJrc1JpHS
	NIDwkD8zn6pZHCVS25B3Hm8BmO7ghe93dNId3YTvv1LTYCg9HY+95ur36VVvqgU9
	McUuIMj6pvAS4sLbwpO/sCFi27jP3YQf0VChJ1DcxqRC/r17oDCH7gPs1T6H5AC7
	+xuX6Ih43eZgdBe4AfT7yqcEt0VDFdaOZr2rERm5/tLWSYF0gUkeUqZ1LI0Yvryh
	pJMsW12/tCgypqid+lZvSQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d1khf2c9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 14:24:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62NChOr1038497;
	Mon, 23 Mar 2026 14:24:38 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d26xn51t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 14:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jETCptfTiMeRR2+D1L91zecAuSdGfFD+Z/wvuJCyUSt8ooHYmcDkg4c8ckqRDyWNADqJ43h91cQfOQGoNHaili6O0ELucKFkGg3gnRIxKChJkY+tjxCGHFmtOmjjISCwMCpnOHNENU3hJK7teP4I1b2m+SoRqCSo4EYEogerNrGX2JwlFuELbWP+B2EM1oSprWs7P8EPcIo4PgBjlxBEOKwruHp9Nj9enJBk2nLnVd/PWpQfzp/x9RcX9W0zx+40JuHmcm9iw8lQ1GkTuAl20t7HPenJzmIRSEm0i/LAiTVjpWJt1BVtPrNdjbNlnhRHLnT5w+14aNG2CQW4O41pOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrNerBjtXIe0hYYZUDG6oDL+t48JyvJ2bQvpagnlUYM=;
 b=NrcFt0hs+swUdQYF43lJ2JvfDw7wSwRvzcHwmG99g421iK9GBskHO48X+WlUbU0OfhSJs7S0eeRLXMkxHv1qhwSawLZlClGi76bfU/bl32ssUG3RTb5NfzT4m2cLAnixGM789YAGdj+Lpb9OZ/geG0y4QTaDlOw0W/VwL7Sssj4duKAOntQ8y4r38YZl6L2GR2eflj11QoYfx7PTJ6jJ1ENrgD32BX0hNwAUgKNWfu1bD+dxuhM5BAcxTllcWbsXwS0o+C/GMK//x0yOElj+8aAKRB3Z4DFwlEG7Ozttf6xpq6jRZIPecWrJmy+XSuZQzGI7ILOzN4etsDcjV5NCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrNerBjtXIe0hYYZUDG6oDL+t48JyvJ2bQvpagnlUYM=;
 b=WfL1b8esMuru1CtNH8h3lqkkeIBcan4Wx7n6A7T2g35ZF5/sOVxUU7a1ciJSrEeR4yToXZon6AEmfSB5bv/LK/mOEPkB/7j20t64Ydf7AGktaispgmCCMzSy3KXc8GW6A+bE+X3rtFWLMZK/PRPhpKtFt0RyTlG3V556HSQtdlk=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by DS3PR10MB997749.namprd10.prod.outlook.com
 (2603:10b6:8:345::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:24:36 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 14:24:36 +0000
Message-ID: <d57dca72-2c87-4f38-9c7d-9a66ca41dff0@oracle.com>
Date: Mon, 23 Mar 2026 14:24:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted
 blk_opf_t
To: Mikulas Patocka <mpatocka@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202603181439.atBWgPQu-lkp@intel.com>
 <1d017f62-99b4-6293-d57d-4a3063b6f79e@redhat.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1d017f62-99b4-6293-d57d-4a3063b6f79e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0064.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::11) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|DS3PR10MB997749:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7424c3-a2df-4027-5f95-08de88e7e8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XQALtuf5RURidfCXNNfN3+dNM9OdAhZCgXPjS9psz2RCbM/g94nduZxLZDgeiYiRGwAUduOUCBeYL4XdN/LU5m3rcMplDrCs9E2WzILXEJlrykEgF4JU2QiB9xMIh4gIj9ufkvOHDbDd8XKt0imiscFmz2UlXxG6rmkDl19hHjQ87VD2skyvhFKDsQk5A0GAfeU0YisQ1LfurGfmKuI2ttezXi5bXYyr67fZx3i2wnfuCFPQfJ4znHcbIsA8/kRVcLctoeR9AJ4nJpydIJtUjP22PGBgsHRgvjylgU4t5JlW1T/4Y9lFgaF6dmBAUZERzrTr7e2+fxtuevMpk1SVbtKu/oUXE/NFoTwvwHtLghZd2wChVacaD6fR2kZpy0WeHeybM8khlWVVZsaVk3aGxUCHjn8SkEGsGPJ87RaL6y/jOaeTzSuxGuhfpRb2P4t8noKLWYUVY+LZz3c4S+p38IOoc8bcF7De7hGQch0mRBPVbwf9cA5vxHBu9xgKb8FV/wRLnrQ/RpAr8rhxNlN+NzGQ25t1DiypGVg8X7RRE5AD9oudqWOxKVSsqJgDH0aEF9df79F0P61yKKtyhvxmtm8ckSFFn6oWLoaRhM73AXHdloesH0VkkCZkNkKAfKA1SKZLwRMSgOeO8JsHUD23C+IZT/9BffoXzPdeWhqs5bI+u4bvoS4SoU/nTeskD3Rz+I0e88jJXo+fINHURs1MJh4v1Tz2ayX0/iMo5HPK8xu8k3yie/WTogwzbwiDBf9W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFEAFA21C69.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODlXdUgyRkY2K1FBeUI5d2U5UzhkdHNwTjBzbEw4SDVDQzEyTE9hNk5xczJX?=
 =?utf-8?B?eE41amRpSzFhZUhWSTM5TllXWE9ueVdQOW8rVVMxYnRza3dKQnpLSFhHSjZj?=
 =?utf-8?B?TzJycmIzNlpJVjQrcC9nVzFyNXc1eHdEM3YwM2R1V3NSYndDLzF0OWN4bytM?=
 =?utf-8?B?TC8wZDZpOU9WYWFqdmEwTE1qakttaXdRZFNyTDhWNUhsNGNMaEFTeWF1Ujg0?=
 =?utf-8?B?cEgvb2FTK0lzbE81L3hDbjZMTzlpN0Q3MjMvOXJSQ1p4OEo2dzh5LzFVUlpq?=
 =?utf-8?B?RWF2b0xBSjBSb1dhU1c5M3orOXA0WVBacUhxb2ltcTlHV0E0TGtXd0VzTFF4?=
 =?utf-8?B?bk9jTTd1U0EzcWZtdTEvU3d5UFRUREJTWUc0STVrdS9IMG5OVFg1YyttRlBF?=
 =?utf-8?B?N2pUalN3WVNMOFlBWThmbTNuTVZFaEFiai80ZmVHa255TmlZL2l4c3FERU1J?=
 =?utf-8?B?MEJZMlhIU0ExcWh6TWQ1dGcxd01lZGMwY1ZqNGFxUC8rczB3cU4rZDYvb1Ay?=
 =?utf-8?B?MnhYdm5FYUt5dVNETThPODMvT1J1RjhmSmhjWFVXdDFJRzBkOXQrdmdWWE5q?=
 =?utf-8?B?dHJ6WVkxSlV6VUQ3U3l4Y1hNOTNOVEt2MkJiU2krZmZQQ084VXZ4TFBLUDl1?=
 =?utf-8?B?a1VwYVcvV0hLcTZHcUowdkdSUXFHTTJKVWs0MUdYblpSNUdndm40Zm9nVEdB?=
 =?utf-8?B?VG0zdEg1SzMvcWh0SHBHckJHcjlmOVN4dUNjeUpNRkdJbHhJNjBjT0FrVWJJ?=
 =?utf-8?B?djQ1SDNsN2VoQkNzd3BzYkdWd2Nyb1A0RGs2TDN3YVVGVjdrUEdEQjBUT3da?=
 =?utf-8?B?dllBMW1lbGVQMnVzb1Z5RTE3ekVIMSt4bTRnTFNjdWZxd0ExSVcwSnBnU1B2?=
 =?utf-8?B?aXppcmd2VjVCOG81TXc0WThnSlNTS3NncTJrd2NCRUloRWVqNXVWYXdVR1hL?=
 =?utf-8?B?RjlpSUcvYk9TMmtNWThyTkFrWGtHSkd6SWllTkY1aUhRbVd2TEJEVU9CQWxz?=
 =?utf-8?B?Qk5VRVpQZFlJMW40ckUzYy9vRG1uNHIzOEk3c3RteS9OanRhOTR2MVd6eGtD?=
 =?utf-8?B?TkVhTHJyRjc5UEJMUkUrZDllZStzcmN1NUlIWkQvc2c1cWtwZmhSNVVxa3ND?=
 =?utf-8?B?TTFrMS9NNHcxbVc1Mm9XWjBWTnlERFhMcHJtWGQ1dDBIdU83UTZVSmFuOGJU?=
 =?utf-8?B?SmpyR3JQdVBDN0kxcXUvUW84SkpMTXc3RTFzY3RKOEduZFlnRjZLMDdJVmtY?=
 =?utf-8?B?ajhjbTIyVnE1MTRzTW5oZ3FBYzhTZ1k4cXZheENNZlhIMEZ5T1lhQW5KWnNY?=
 =?utf-8?B?RmV5K1BBQ2hRM2VDb2VrcXRNVEpYRHF1bUQ5Rmtud2FEMHY1cmRXVVlkMW1m?=
 =?utf-8?B?KzcwS01GZjZkZXVNZVdGcUtoQlZ4RVgyNFFiTXlxQjIwdWY0V2NtMVZzMmVX?=
 =?utf-8?B?cm40ZTRINW4zK3kwWFFxWk1KeFMyMzAzc0Q0V3orZ1hPdkQ2SUF0dTQyUGVT?=
 =?utf-8?B?Y2JmMDRuRHMrc1BhS2tJVXQ5b2daWmlIVHF1cFNvOHA0WUV3ZXhHdjNNNGNS?=
 =?utf-8?B?ZzRBU2RoeDhnbWswTW55czJEREcrZU9ORmpMTmZ1dVpJREc0dVdvMEdYMGMv?=
 =?utf-8?B?WUVzSTVtZ1NsVHJFOUM2UjZNVU9kSUI4VFNhNE55ZW5lMUpFWjRKbkVQMnht?=
 =?utf-8?B?eEEwb2YzTU5TYWNvK3lUaFduUlZRZTd0UzdNU3d2UDBibUNDUXhXQ2JNM0hE?=
 =?utf-8?B?MkNtOTJVb2VvKytmWWNKdGkvYmVzWGgvSldMNGZhOCtPOEJsbmxENStyNTha?=
 =?utf-8?B?anhxWk0vcWdON2F6aitaeTRlOTdNd0FUS3pYaGRFektWUnBVZ2k4aUN1dnZY?=
 =?utf-8?B?ME5BbnlkVzVNU3dsam1pSmtod0h3YjFMM25iTzJ2eUI5L3lxQUNNNUM1ejlp?=
 =?utf-8?B?dG4vMzVSR2prQjZEUnEwUlNXMHBGVUFQdU5NU0pHMU5jK0tpS3lteU9yUlFW?=
 =?utf-8?B?YVBMNlBCVXdubWN1ZzBLTVgyckd5RzRsbFY1QkNoUkNDbURvTlNsMUFEakRh?=
 =?utf-8?B?eXNTSjhleVVvNzNoS3p6VmhwcEhkdUNFaisrQ3NuR0tXb281WmtjZ2pudy9D?=
 =?utf-8?B?REdtN2NQODJDbGhnd0RHMWxjSWZzRHhqd2FjNXJOaldML2p3ajFCaHJWNk5U?=
 =?utf-8?B?ZmVXV0lpWTRCUkpRRVIzQnZOaDhJRERJd1JLUWU3SFRxaFRuQ3VEWUFMblJK?=
 =?utf-8?B?eFlMcjlUc3ZZMmJFbUNpQUxZakM0bGdzNW5zdWJmdHlEV0V1RmNXbmZzelFP?=
 =?utf-8?B?SDdxelhWcEdHRzdpeE9LQ1hIZ1JEK0JlNW41Z3dod216bzdjVnluV25wdHpU?=
 =?utf-8?Q?NgCuIoVZGuGckvY0=3D?=
X-Exchange-RoutingPolicyChecked:
	I8Vnrvo91oVuAihTU7OMQJPW3zqPXMObV8R2AWaRbSixcKHk0jwBjZJGM78MYebcdF8Y9yAnaTqxLZSGTAOXSq5Q5nND6rEmYcNZWs/x5HX4cXGzlVf/FHH8DMpEMw8N9oxonk3gnELLUhCToDBkm552JA4HpkXJK+geh8g4W4OiudOoPveo9nDeQk6poa/i9shv78Qc7Y2drNZzShbOmvg5UL0stMcs8hSNp0/QzN3p9gh8cyTD9E7dPzkk64LhReg9Y0H5rnH1mZEi4AiJfGvr7pZ9/3SCCN2GV1CAEt8y8QknhLRBV5YTXIR/qstoY1frUb0iE4HBIi0GVDHfuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VUBL8oOWufFAuGxppsL1NwkBUGHXwKb+Oy8M5KroYM/55HAt3wO8x7E8m7wiHS5h9IJJ2aAxCyQr4mI2S30wD00AOVda37BlUPUNTZZCHWRxXVp323I6QtlFlHx1ABUEfmV6lBLe42SpDZlteMt6M7byEdzAyymZC7N9EeZObBCHJnRs96AJnR3xabooU7PoreqVaPNiYlmoNvHqjC/84w8CgLbQIj9OjlihfANl+mhw3b3KphVeQKGuOhAJ3tDErmvMOkeWTPorVQEP3hh4+oQGnQ+Nq2LdIkfp2/jJ2yiuQnInEeQ7otTzTmMOA1rNm+9sYvp97qqp7Z+Y+umU6dkkaHhDDBV3Cskgvjq0iYJlE7atVi4mPVpg8urhsFcGKbVDniTccLBOwaDBODkcybBxgE7X9tGT0jLbK0j5rOuLLR0tfgInLQHdMlTchmlfC7aLDtHvAdDeT1iBikn3jy50Uy9xaY7NN0wxvsaFbdksTVbEsl2X+paBBic1EcLTWEyG2r7EopDrCslOAY8JCWU6ey6826QfeKJwZbHZpuBVh/swIQjZc6Qkq6XFSYe7Hvm0zeXjyMkn7WCVLWt0ma5MKFiTLQdGyhi0YXEkp4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7424c3-a2df-4027-5f95-08de88e7e8e6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:24:36.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJm0HqLmjtNj7YCLQI/dYJDxUovBu11S27MGAAqetYceBbGr8mlrJ2YcZeFURnyinoZ3bAa0NoV7njbjcWe6Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997749
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603230111
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfXyJUQxo+l9PrB
 fUcsQV52hLDfwo5EAk/4MrcPLpGiAXcdd4Y+E64bZKQKp+onPRoWIFE28f7Dh0n8Gbap/0bSSaY
 hiJYcKwxoBC967tL+dTdcq/ahrAi48TQljKmMydBfntXHuIYgsfv4Nex6vYTT2QCILm7D/N/mHP
 I3fWXzFH2a+qLYkb6mfARoLZ+15BKJSc5KqHK45zHuq4R8IOscmIfSzL/K2ISywcc1fxgtS80vw
 UXlfIxyxL2UXgOw57/jl1enssMkDcWsmNrdeC8rvBZOmOQz/Z0NZyLJDj9ph13wJd3NhQHRn2VM
 oIRHcN5Zcr7uilPBrvR2lqMMJ1EtR3dwp7Kh4S/7qnsKywLo2Hgb+o9biAW/P1P1W5sKd6Ecs3o
 ZKCCqKvtTpINOfCPOsQRikAt2RoewZaZCcXgthLfz1EwHgwNiOowmQacN67PujL0FerRGAoViYg
 Q0YeCXdrCgQ/Ngl3U73e/i2jktGtmljsXJIZLSGE=
X-Authority-Analysis: v=2.4 cv=AIvfpCdw c=1 sm=1 tr=0 ts=69c14d28 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=4QnrBI6B7-dZDOdAjm8A:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:12273
X-Proofpoint-ORIG-GUID: Fqq1RxHEVW1X6HqU3uFgBEiipXrx_frt
X-Proofpoint-GUID: Fqq1RxHEVW1X6HqU3uFgBEiipXrx_frt

On 18/03/2026 14:12, Mikulas Patocka wrote:
> Hi
> 
> Could you please describe what's wrong here?
> 
> If I grep the kernel for 'bi_opf.*REQ_ATOMIC', there are 14 places where
> bi_opf is tested or manipulated with the REQ_ATOMIC flag.
> 
> What should I use instead of 'bio->bi_opf & REQ_ATOMIC'?

If you can recreate, could you please try the following:

BUG_ON(!!(bio->bi_opf & REQ_ATOMIC))

Maybe it's upset with being passed a blk_opt_t to BUG_ON()

Thanks!

> 
> Mikulas
> 
> 
> 
> On Wed, 18 Mar 2026, kernel test robot wrote:
> 
>> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git__;!!ACWV5N9M2RV99hQ!OmRe9qEu3kUbFAxqlOLx9d_2e3W5yQy0bEmI1otyyZgomwTxboZhSPfIfq8xAdHD31rRUtdcL9O71Ff6tw8E$  master
>> head:   a989fde763f4f24209e4702f50a45be572340e68
>> commit: de67c139b3846ece6b8bbb62abf1f010ae85c083 dm: test for REQ_ATOMIC in dm_accept_partial_bio()
>> date:   3 months ago
>> config: mips-randconfig-r113-20260318 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/config__;!!ACWV5N9M2RV99hQ!OmRe9qEu3kUbFAxqlOLx9d_2e3W5yQy0bEmI1otyyZgomwTxboZhSPfIfq8xAdHD31rRUtdcL9O71Jp0TXRZ$ )
>> compiler: mips-linux-gcc (GCC) 8.5.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/reproduce__;!!ACWV5N9M2RV99hQ!OmRe9qEu3kUbFAxqlOLx9d_2e3W5yQy0bEmI1otyyZgomwTxboZhSPfIfq8xAdHD31rRUtdcL9O71Hod7K3l$ )
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202603181439.atBWgPQu-lkp@intel.com/__;!!ACWV5N9M2RV99hQ!OmRe9qEu3kUbFAxqlOLx9d_2e3W5yQy0bEmI1otyyZgomwTxboZhSPfIfq8xAdHD31rRUtdcL9O71LBaMQ9b$
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted blk_opf_t
>>     drivers/md/dm.c:689:16: sparse: sparse: context imbalance in 'dm_get_live_table' - wrong count at exit
>>
>> vim +1324 drivers/md/dm.c
>>
>>    1283	
>>    1284	/*
>>    1285	 * A target may call dm_accept_partial_bio only from the map routine.  It is
>>    1286	 * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_* zone management
>>    1287	 * operations, zone append writes (native with REQ_OP_ZONE_APPEND or emulated
>>    1288	 * with write BIOs flagged with BIO_EMULATES_ZONE_APPEND) and any bio serviced
>>    1289	 * by __send_duplicate_bios().
>>    1290	 *
>>    1291	 * dm_accept_partial_bio informs the dm that the target only wants to process
>>    1292	 * additional n_sectors sectors of the bio and the rest of the data should be
>>    1293	 * sent in a next bio.
>>    1294	 *
>>    1295	 * A diagram that explains the arithmetics:
>>    1296	 * +--------------------+---------------+-------+
>>    1297	 * |         1          |       2       |   3   |
>>    1298	 * +--------------------+---------------+-------+
>>    1299	 *
>>    1300	 * <-------------- *tio->len_ptr --------------->
>>    1301	 *                      <----- bio_sectors ----->
>>    1302	 *                      <-- n_sectors -->
>>    1303	 *
>>    1304	 * Region 1 was already iterated over with bio_advance or similar function.
>>    1305	 *	(it may be empty if the target doesn't use bio_advance)
>>    1306	 * Region 2 is the remaining bio size that the target wants to process.
>>    1307	 *	(it may be empty if region 1 is non-empty, although there is no reason
>>    1308	 *	 to make it empty)
>>    1309	 * The target requires that region 3 is to be sent in the next bio.
>>    1310	 *
>>    1311	 * If the target wants to receive multiple copies of the bio (via num_*bios, etc),
>>    1312	 * the partially processed part (the sum of regions 1+2) must be the same for all
>>    1313	 * copies of the bio.
>>    1314	 */
>>    1315	void dm_accept_partial_bio(struct bio *bio, unsigned int n_sectors)
>>    1316	{
>>    1317		struct dm_target_io *tio = clone_to_tio(bio);
>>    1318		struct dm_io *io = tio->io;
>>    1319		unsigned int bio_sectors = bio_sectors(bio);
>>    1320	
>>    1321		BUG_ON(dm_tio_flagged(tio, DM_TIO_IS_DUPLICATE_BIO));
>>    1322		BUG_ON(bio_sectors > *tio->len_ptr);
>>    1323		BUG_ON(n_sectors > bio_sectors);
>>> 1324		BUG_ON(bio->bi_opf & REQ_ATOMIC);
>>    1325	
>>    1326		if (static_branch_unlikely(&zoned_enabled) &&
>>    1327		    unlikely(bdev_is_zoned(bio->bi_bdev))) {
>>    1328			enum req_op op = bio_op(bio);
>>    1329	
>>    1330			BUG_ON(op_is_zone_mgmt(op));
>>    1331			BUG_ON(op == REQ_OP_WRITE);
>>    1332			BUG_ON(op == REQ_OP_WRITE_ZEROES);
>>    1333			BUG_ON(op == REQ_OP_ZONE_APPEND);
>>    1334		}
>>    1335	
>>    1336		*tio->len_ptr -= bio_sectors - n_sectors;
>>    1337		bio->bi_iter.bi_size = n_sectors << SECTOR_SHIFT;
>>    1338	
>>    1339		/*
>>    1340		 * __split_and_process_bio() may have already saved mapped part
>>    1341		 * for accounting but it is being reduced so update accordingly.
>>    1342		 */
>>    1343		dm_io_set_flag(io, DM_IO_WAS_SPLIT);
>>    1344		io->sectors = n_sectors;
>>    1345		io->sector_offset = bio_sectors(io->orig_bio);
>>    1346	}
>>    1347	EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
>>    1348	
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://urldefense.com/v3/__https://github.com/intel/lkp-tests/wiki__;!!ACWV5N9M2RV99hQ!OmRe9qEu3kUbFAxqlOLx9d_2e3W5yQy0bEmI1otyyZgomwTxboZhSPfIfq8xAdHD31rRUtdcL9O71IiRgk5v$
>>
> 

