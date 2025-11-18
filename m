Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03026A1AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431429; cv=fail; b=f0GdaqlZTWUIhLvG26L0XtyWD0uhzPhGE57fSgM6OvB4Tzp3lmevNPNI8aIeto8ChC90ow1UWJRsI3+X7Wah2rU4LAkUtsjVyRvxBHQ5nEYqv71Li4agmONBBHfwyug4oialNPyCuESiQoaYgN8z92foDb3+5meIIeLXYhGOszc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431429; c=relaxed/simple;
	bh=82TE7oNdTw7zPjttnPPzccWNVdBHKJMtZ1N9B9ZfJsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o0bUe4P+lpmSfkdw/JVIEcxGzJycFItI/L5Z45p0QmXy5DhzJD0PcdmyRGObgj0e9NQEzx4qmYc0urZLFSRT6TKsCQLomhibKv7KSfPYhe9v7C1MUg5GvGfnd7p/qte6hGiTABh7MEGLafiDKLTaxDW41Zow4Ek1B9Cpa0+r/Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gkj+oKNy; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gkj+oKNy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLyJM+CN41tGysW2+bDGYurov1tP/P+evu+6MY2JjDIWDXmIztbi+hpRoFxBtlzQP3js2ft2+dyK+YDniyXRen/5ZrlK5+ax0uFOB/BXEanmerTe6olP1EZXiLl5s/42U05xY02xRwwlgKfhuD2iYEBE+q8BN+lwoSDD3T+fm5xVEEDhPfR5Bv89fMHxEtL0tHbpQ3C/lutmuhNJ35LA5xb5fECTP5G+r9ThuUY7ERQjcUrovapG1swwwfryGLUJOCYNDNzXqwaZgbbOrd2o4J+wi66l0W3I0HmrGR9nzfGR+SfD8fkJKZKR6SomVK7TpCCXm5OBJXOAvqsYweqOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VytUTLijIfjdmvPWYYJ9gVhnmrVOhAGbXg7SBKEeylY=;
 b=fVAtWV0J13XtxFZdA1YNn6qWOX4AN2RqCSxFtyKy2tKxuhlkvSPU+lXWg1pC2uGQ3N59Jw0UnXhu7o/uWk6TRVvFfoL6JIAKCtDGE6yFz0nefgZU7s2XJginz+lTFRC7A4RyhHPjGON8brKbpxbHNUf3u1kcgJW/VkPZO/i6ICnLJ/ziLxRzLMHyeHyBgD0MEL3I7EAjoOyaWYjGiLuyJOMO7X+cZaBvKy1ais4A8R/UjaY/tJ+R1Tw4P8G1Qv4TPrSKpL0SRQnFwXX7DJOkeQdl6l5FGniGxaht5eJyqGU9efPLO270ziXwg7+hZU+KB3lPhpNBIu7G51ezhAcTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VytUTLijIfjdmvPWYYJ9gVhnmrVOhAGbXg7SBKEeylY=;
 b=gkj+oKNyrH1yAnVGEVqIuWGZYqGQBeBjiXZcSo4zr2X+u8Hsja1SChH0c40YhMBM0vc0TBdQM418BqbSxRDw1eoaAVqasctrZ1mdhT2WekGcvnAgrd8bDCxL7tfXfI9O05Evzch+KdBoNSTHqn4rrs5FZovr/Dp6fPWqEi/FaUk=
Received: from SA9P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::34)
 by IA0PPFB6B4D32F9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 02:03:42 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::38) by SA9P223CA0029.outlook.office365.com
 (2603:10b6:806:26::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 02:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 02:03:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 18:03:42 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 18:03:41 -0800
Received: from [172.31.184.125] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 17 Nov 2025 18:03:41 -0800
Message-ID: <70f36dc0-a55b-4d88-aa35-d532b0a94823@amd.com>
Date: Tue, 18 Nov 2025 07:33:40 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] sched/core: Track blocked tasks retained on rq
 for proxy
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <20251117185550.365156-4-kprateek.nayak@amd.com>
 <202511180452.4hbbjwkB-lkp@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <202511180452.4hbbjwkB-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA0PPFB6B4D32F9:EE_
X-MS-Office365-Filtering-Correlation-Id: a84fb7f0-46b1-43e4-c65c-08de2646b2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFFYMk4wSFhhMHpneWhqa0FhdklpRy9QMGtpM08xMUMzUEZPZmRnWk5obStv?=
 =?utf-8?B?empmSDBZZEdrN0EzcUZZakJ3cXF3YndLbEN4aUFwM2d6TTdPUHIvVVhwNnZG?=
 =?utf-8?B?cFBUTmY1WW8wNVU2ZUdJM3JIanN5YW1sdGlqNjlrQjVoNkhaZzhvYWdTMjlV?=
 =?utf-8?B?OWNHN0wrN0FMZzlST1AvbmluRWZKSmdGT3NTdzVZV00zbk9NRzZvQlBSbXBo?=
 =?utf-8?B?amZNMVlYV3JUd3B1MlE1ckNjQVlzWkxGeDM0bnVkK0Z1OXU0ejBrU2tuRWFp?=
 =?utf-8?B?YVgzbjJ0WlV2bzBYd2ltVjBPTVRKSytYamlxUVdsT2xobXFBWG15MGF0YVRq?=
 =?utf-8?B?M1BVejNjOXZnV1pGNkpReXdiVFRaNXZRQ1ZIRHBtRkFFd3RCSk91OUIxZFB4?=
 =?utf-8?B?RnBubmxyUmhVSEhRY1Q4cDU4QjMwRXNHVFJhbUpYRldzbW5nVCsrMENWRHhC?=
 =?utf-8?B?RkF3bm4zVmRQRnpHd09ta3lHdTh0NHNYTzZZRlgwbGtjUllDRHVOeTI3OVZ6?=
 =?utf-8?B?eDUrdXNlTkxXckhnZEFWM0RlbW00TzJ4RWN1a3NrNVNkeFUvOFpyTkZIU21O?=
 =?utf-8?B?dlRZcE1FZ2FZbzNOV0srSnBWTUQvZ2dwV2dTS1NJRTIwSEZZcVNGYUVSNnNZ?=
 =?utf-8?B?b2p6cVB6ODFQRVNSbzVYKzNrOU5nTEtqTUZ1dnYwVGpRUy93YjFUZGF0dWVu?=
 =?utf-8?B?MjNVeW9aYXpob1JMNldFcGVvbUgvU2hFdmpHOWhOYzk5Um1MRHdSQkJWMnNG?=
 =?utf-8?B?NTJQWkNwV2UxaUZzaTkrYXR2a3plOWk0cEtTQ1ZoaWJWcWt5Y2wvMXluM1NQ?=
 =?utf-8?B?OEZ5ckxmRmhpZFdPeG5CN0dWdHJvTDJIWnNDcG4weGgyeUt2bUp2aWtlV1ZY?=
 =?utf-8?B?ZWUwOHJVdFNWdEIyNDlaRjFjTGxqRFFZN1RIWXdFN08vQnVrRCswcjdSVzh4?=
 =?utf-8?B?bDUveFhsbEYyRDRRMlFQN2cyU0dyREVydm9oSlUwa2FiRjVEd1JsUHc0Ulk2?=
 =?utf-8?B?Y0NQMUZRZnlyRFlZYS9sMXQvYkJ4NUdWTzJ2cjJUbmhVWmtzNS95NHZhTmJV?=
 =?utf-8?B?dTYwUDBqSHkrdExqNzhtbUhacVA5cWppNmo3bXMvWUtqdzR2UGRKdHRXSk1T?=
 =?utf-8?B?NWs5K3BBa1RZQTlicjhRSklnV1ZWVTJIVktOOXh6dE5UQTAxWTFUaFE1MjlB?=
 =?utf-8?B?T1ZKV1VHelFsT2RzdVA2dkd1cWdpQisvN0NuWlJQeGt5YXVDeHhIVWRteXpn?=
 =?utf-8?B?TVBoSHk4elMwTUJHTzdHZEc2VHN0S1lCRDE5OTAxcDlYdGUydi9IWDl2VDFG?=
 =?utf-8?B?N1B5eE1TbVlJWkJKdzNZQmZPak5ETVhNTnQ2dVRaSjN0KyswN3BzT2w3SzZN?=
 =?utf-8?B?Ylh1Zmp0VEdrZlBZWDVaVDFGbitqQ3lmbXQvcUE5ZHUxQllDeFhSRlNweTkv?=
 =?utf-8?B?VWMwV1ViM2xhejVIbGtERnJXNEk3bkJwYXVIZEpWT3NUc0I0WFlSbTlOWDhs?=
 =?utf-8?B?KytZZlV5V0hTQlNndk82ZWJWTU5zOFMrRVVHRmFGQ0dIN0FlL3RIaS9ZQk4z?=
 =?utf-8?B?dmFCdzcxaC8vdnp6YktENnBnV2wveGZwdHU0SGV3enNHUit1d0xweFU2ek9s?=
 =?utf-8?B?SUlqQ2VjNTlmM2ZDQXU5MTlsaldKNnVaWTVCSEdlL1BRdkZPdVRlbmtMRG5l?=
 =?utf-8?B?anhRaG9WWmloV2ZsZTJJN1FoVUdXWW9LNTU3VW1Vdm9ueVRkYktPazFOTTVP?=
 =?utf-8?B?M2c3VWQzcXdLdmhUTWMzNElQem9ET3B5WG9UZUhIKzc0RDdkajlvdU4rYVFN?=
 =?utf-8?B?SHdmV3ZYNmNzWVhRakRqOUVmbmtFTFhEUjJUODZFL0VPRTZjYkd2Z2psNVpp?=
 =?utf-8?B?cDBZVXJLR2RBajUrdm5wVW9QSnJyQXlqUnZkMGJ2WTJURzJPL21UU2NXS2Rn?=
 =?utf-8?B?dnl2RkJLZFd5cXBMbDhqTlBhOTdWMXpKblp4U3Joc0xuTENnR0ZXUHR0OWZa?=
 =?utf-8?B?alBLUkpBaER3RVN0V1hXV2pIUlNvdlg4YUZtcDJSbHl6SFpRTVVEOGFyRFdw?=
 =?utf-8?B?SXlXVGJwditweVRmU0ZwL3BaelFsV2lJbG9qN2pWdk1DU0xYMXNENWZsVjlQ?=
 =?utf-8?Q?eaCY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 02:03:42.3887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84fb7f0-46b1-43e4-c65c-08de2646b2e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6B4D32F9

On 11/18/2025 2:14 AM, kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>    kernel/sched/core.c: In function 'clear_task_proxy':
>>> kernel/sched/core.c:6681:20: error: type of 'p' defaults to 'int' [-Werror=implicit-int]
>     6681 | static inline void clear_task_proxy(p) { }
>          |                    ^~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Woops! I clearly didn't test the !PROXY_EXEC case. Sorry about that.
The following diff on top fixes it:

(Build tested only)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 765365b81b12..d51c35e26d80 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6682,7 +6682,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 #else /* SCHED_PROXY_EXEC */
 bool is_proxy_task(struct task_struct *p) { return false; }
 static inline void set_task_proxy(struct task_struct *p) { }
-static inline void clear_task_proxy(p) { }
+static inline void clear_task_proxy(struct task_struct *p) { }
 static bool __proxy_deactivate(struct rq *rq, struct task_struct *donor) { return false; }
 static struct task_struct *
 find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)

-- 
Thanks and Regards,
Prateek

