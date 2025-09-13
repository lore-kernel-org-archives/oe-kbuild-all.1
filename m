Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A266FC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757804259; cv=fail; b=PF8MB+NLkLC9ZJVE2pglFFwVCm7dQXdTf1JU+99MC+s56nP/mkKvqgV1dugDV4YK7bUEXgfDK90zehA6HAlCQQTN1e/Vacm5qV/ZJNZ9x6Eq5XBZVQc66ArKomuAtD5t4FoJ07ledngIle+a+RehdCre4M9FvQhRqpwdguRqBP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757804259; c=relaxed/simple;
	bh=kFHfRcGEvJSFtBnIHBKeeK29X9D02fuijDJ5wp0KnBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D+ZvDIaSOYFkq74aYFFc+fvgEEN+I2D8Dh6FaEuJVCGWQ7B6aPm3ONsS4PdeFOKCIXNtZWx/dafEj+ieppMEtu3ExCFcAKZKZQPiPAXOclKTwSS6N2foQuynjrILXvNweHXL+tdOsY527R9efjyWoH5GlMhQtvdvsN5P7yX//go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d2U4Of5P; arc=fail smtp.client-ip=40.107.101.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d2U4Of5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxsgvO2w3QWbSIARpvWpYUdNvkM3/hrJ3jjbNnUXZAVXbcONEEWwLEGLDeT/hEWQQxTzLUmg1tML8Lz1sqNlyobplaIVcKdhS9Sd/ERV5FK+whRNguQeZz1rOOQGoiURDRsGOO6ntwCenkavqyhKoGjnQKcLAW0IcBLX4VXiEFu4HZ0M219wHx0U4xuXMj03GX+y0HZdDVO7pHyJQvqLWfTupYmYuTgj+vtQJoicb0B8UZSYFh1Tw4vgSmXOmS+rOx5cH7mPIgUdhbGFtMFKHtRQulYFad4Gm6x5vsbnImlA+KAB8cCVPnK1VY6V4hCJ6iTzszCw2wFgkDb98v5wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKmAti1wouC/FWEsPW6Fo3HSA1R5zd+7NnjID9eMxF4=;
 b=XnUkrROj/sunGjITYjyzAn6PL1hglYIJgCeCh4EUXjCk03l1GFmgWtBAfOXbUGzemTK5BxxbTg+28dAGQoZRpKDDG+G77Tqtfoo3u+TrtumqumLWZGlAbn+/Gtk3TnFF8Ducep5V997ivRrD68qtBhw+n6IbKhENeyM6h15bb+bcvtdLdLv4yJsFK86qdBlGj3wfmmKLNqp0+klvdNKFiTRWMfxvXNo1ZPp+Mj3Yxp1mR3vetbz9cCii4k9MERwf+4D6ODhtheT/a3CaDESoEX1MRB202gL3/b30e2lukKPz2wvN9B5yKUJyVfa/UTBXpZG34af2q7QlwPg9vXb1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKmAti1wouC/FWEsPW6Fo3HSA1R5zd+7NnjID9eMxF4=;
 b=d2U4Of5PTQrepNEiGtUEkoGRsQz0Hsozgxx4IkLZNmISaB1TnN7WQXtn9Kn4H3Q++gPyr+y2gZX0f/uWagjQp11srECbfuacb1g/o5T+13MvgQJ52EO36kbc5qfYViyahn+OBYK+h55e5Rbl7kYQpAvjYfIsh7tKPpqWZxvZizwTHxtCFz1ZUaY2pNXNFjfZvPHf+h8Rf0AEfLburOVdwu7QHvT0WUR+kgh5/ochAusmr9SKJknP30Lb3wu8BSC7cNqYEiOfCdHcNaHpTEDNIFiqcpn9dnk/VSfhDrm0EBUwAq6hk85G2osLMgck42OLhoawifplpbtAR/Qf89TCRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 22:57:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 22:57:33 +0000
Message-ID: <b96ea27d-6e8a-40d9-8fa6-677cd8134363@nvidia.com>
Date: Sun, 14 Sep 2025 08:57:29 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 39/428] include/linux/pgtable.h:235:36:
 error: expected expression before 'do'
To: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202509131255.x9EfvIGt-lkp@intel.com>
 <20250912230313.117341d5491a3145e7bcf311@linux-foundation.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250912230313.117341d5491a3145e7bcf311@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: d57f8fb2-407a-4fbd-015d-08ddf318ec86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFo0eVorNy9PSGl2RSt4VEQ0S0kvaDhSRDlBNXZsb1pqTWRsOGpDT2JPaGxn?=
 =?utf-8?B?VFpsLzVpNTJsZ29mT2p3UWxyZ0l0bWRHNDNOS1I0N3BIc0pKRExPZVRscE5r?=
 =?utf-8?B?N3ZUWDNNcDZMeUdUK1R5WFJpQlMxSTdiWEtYR2pSdk1MUkFIMHJZNlJUOFRI?=
 =?utf-8?B?cjlJa0VaY3R6VDZGb3dTVkFYZlhXckFtWTVsQVRaWnBqQldOSXduSFZKcHhT?=
 =?utf-8?B?UmkwQWRzakNtZ0swVVl5bzhpcTJDNTVobmZ6UDV5U0tVVnpGRWgySEh6b21J?=
 =?utf-8?B?K0pWbFNOZmJrWHdkWGZ2Sm1ubThXVXJBandaU3JmRCtrbFArZEpWR3FJUnY2?=
 =?utf-8?B?WTF6SER0MFZaRmhhYjVnTkwvQlYzOENXcU9xRExpRU9JZUFKN3BsamlENFdQ?=
 =?utf-8?B?cVJhR3E4SWlvUm1TRU1ZaXI1ZXVtQTdqWFBXTVlUQm1FVzlGUE9SaVZHNHhs?=
 =?utf-8?B?Ky96ZytlVWd3UWFpN2Y5cEcvbDNTWTVQdVZmbmNIY2tva01aVXg5b0hEK3Vx?=
 =?utf-8?B?R0Q4RUhkWnJqdWNYUWJqNSs0ZWRPT1VRNDFZRmczQlZ5OW90QWdUakYrNHBl?=
 =?utf-8?B?Z1VsVGlGZXk1WXd2L2ZjaC9Fd0ltblZCandlRnpUcHA0Ym5kblk3bWdVY1ZR?=
 =?utf-8?B?eDVmOWZaV2VFRGt5b3IvNUJOKzdNZjRwTm1XOXpGbGM4Y1dYZnAvVmwzdkV2?=
 =?utf-8?B?WXpkS1daZkp3anFBdnhpN2Z1T1BBWFYyN2FYdXFWamxPbjVicnV3azVleENH?=
 =?utf-8?B?Mjh5MGdKLys3QzNTRm1KU1pYZ0FPQmdDZWQvY1FVMGpRS0RVUmJ4S0FXZ3Jj?=
 =?utf-8?B?d2UyUVg1UDNjWHFOT2kzLzh4ZzJiK0NaWlFOeUllNm1CU00xUWFhMmtKdmVu?=
 =?utf-8?B?UGkvdjhqTTcyd0Nhc0FHdEhVSVo2d0xCYm54UWVUdEs4NWVNV002Z29RTll3?=
 =?utf-8?B?RXVoSWloQU4yRnR0TmlZOEZUb1BNN0NxSjNtajFHVmtNdmgzZThKdndaUHZB?=
 =?utf-8?B?dysxb3N0Nmxxd0NEajgrSXczSFBocTUxWjBVTWxqQ2JVS2RMYjVacHBsVlJm?=
 =?utf-8?B?U2ZsbUxtU0UzN3ZoVnNSTTkrRjBaYVZnTFJqNmZhMmJCMnBId3hKYXVmYjQx?=
 =?utf-8?B?Sk81MGJoczErQmJyc2Mvam1KVDBFa1orUkVGL01PMzFxWVJMYnVYRDBJbUht?=
 =?utf-8?B?V3o0K0hISTkrQTNqeVdnUTJ0bGRQTEtyOGdyWFBLZjRYWTVlcytxN1BkaW5r?=
 =?utf-8?B?S0FpeEdLYWJiSHBnYzZvejZmM3Jqb0RYaEJSa0VWOS9NaUNOM1JrL3Q2UTVI?=
 =?utf-8?B?TWNVRC9odHZXNVlZaEljdEJ5aW84V0tlWDZFY29EQVZaRWVlQU50dGhEZ1Av?=
 =?utf-8?B?dU9FQmExbHpnNGc2SFdtSzIwbGIxWEJYdmZyL245QjJjTlhqdytDNk5qWFov?=
 =?utf-8?B?eUZ0MVpNWjZKdWVTSkowY09nQVh2RGkydFFhMy93cHJyMlQ1S080Y0FmUnp0?=
 =?utf-8?B?dm8zRld4T2ZOZ0pmVFFxSnhZZDFMRU90NStYR3V6WVhHM3BHMk93UklJUFdv?=
 =?utf-8?B?UlpQMTZFY1krNUN5WS9LZFlZc01MaFNnbmhqdFVxRHBWdmwyTDY5eFJycVBx?=
 =?utf-8?B?TUlubVdVc0pkU2h1YjhaQXdQaXZSaFhNV2plODQrOXZhVHU3RW1WOUlFMkN0?=
 =?utf-8?B?SllXNW1TSGlpelBrakNmZWVqdTl5TUV0Wnh4Uks0Yk83TFNqRlNxRU11TzVF?=
 =?utf-8?B?OFgzRkpPWTlYODIyTDNyYTlYVmFUWmo0NFF0enBZWnZyUThPRUhpUEJ3WFhR?=
 =?utf-8?B?V1lVTEl6YW1nWDI0U0lwVFFvOTdmN3kySnBjbytmSUlxQlJ2UklwdWY5dlA4?=
 =?utf-8?B?WW1wVGRhbGczaFhRQmdtUmFqMlVTSVo3WlBTVFExdkRnTnVYS0QrdHpaNUY1?=
 =?utf-8?Q?2jM09MI3TZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRLdUhyV3lMZkZsVk1NejZ1Zm9oTEJBV1hkdVhIR04vcGg5UEJ3L0VkVnho?=
 =?utf-8?B?Ujd0QzRVSGh0TS94dzRLTXorL3c1RGl3enFKM3FJbUhzMlB6SXYxaytnR1Iz?=
 =?utf-8?B?a1hWQi9YSUQyU0Z0SXlBeisyRFo2VFBHaHRsamlxUTdpTzNBb0w2VytVc1U3?=
 =?utf-8?B?TmVVZlN4Q3F3WmRFamx4ZXNUdzk3UFA5TG5QT3U2cU9yWGxFeUcwZXRyMXdl?=
 =?utf-8?B?RWtrTzRqM1VUeW5PQnZHWVRyc1FJTUlSbE5BOEViWjlVUTlDeFdONnZCdmpu?=
 =?utf-8?B?Y0kxVDc4NDN5QU9DRlRPdEhuZXM0SklET1VVMW9tK2tFZXo1dUdFdTFrQWVC?=
 =?utf-8?B?QnhYRmhkWUpRNEIwNUc0VDluM25hSm1BWEpRMkZYcHNxTjhjMjVjSDhyYlQz?=
 =?utf-8?B?RnhDeFRXSmJ3U1BNY3pYdUh5dVo3aHFVODlXdnFkMzdOM0dnOFBhMW1OeFJZ?=
 =?utf-8?B?a1QyS0IwUEoySVQ3Zlh3MzJOMmtWUHFNcy9udHVsQVBTc1BBazNlSjdIaXQ2?=
 =?utf-8?B?S1ZpUS9MR0VZR1c3bk5vSDZsS1o4bE4wdmh0QnhyUU5ZeGhiQTJxalk4eWFy?=
 =?utf-8?B?SUtwK1NkZnpwNnk4dUhpalZTcytKTFl4dWIyek14ZFRVU3l6MVdoUHFRY2Vi?=
 =?utf-8?B?U1laL29kSFNYbCszckllU0FYQjg4dGV0TXMzYjJtbGd4WHZ5R0xOb0N0cjNT?=
 =?utf-8?B?VXZFdi92NHVETXNLVmdsUmVXU0N3b3ozOVk4aTVIQk1GQ3dDdkRlYVI2Qnpi?=
 =?utf-8?B?NXNPT1ZVQTJBbmZqR3ZVWC9XbGwrZmhRb0IyU3hnSlh3dW1qWmtjSXNkZGtI?=
 =?utf-8?B?WGMwN25sTTVuaXp2UDlOYjFmb01IR0xBOFZxditpWXIrdWpZY2MwSUZCLzRW?=
 =?utf-8?B?WVFhVXM1Z2p5QzI5bElFRTdJM0xjQmdBeExsYVQyT1JORWhKS2ZCQUFwaThC?=
 =?utf-8?B?bjRUVFoxTXZqeU55aGwzcWtKU01BdE5KMlV3T3RZUXRpbnd4bnFVY3VwU2RJ?=
 =?utf-8?B?bnFpalVvbEgzUUtEZXY4Q0NqY2FJMldwejJ0dXk2bTlEYTN4MGJ6cmFMUXJL?=
 =?utf-8?B?ekJjd0hUMnJiYjJNNEg3SUxRN0VYVUo3dGpLcDVKZWpUYzNIVTlNV2F4M000?=
 =?utf-8?B?dE0vU240VS9wUmJvZjh0M1I1QzNxNkZGazZyNVA4cks4WHVNNXpKcjNScjB6?=
 =?utf-8?B?LzRvek4zVXoydGRoV1VIVmVscDJ0QVR4cnpaNlhRZmF2c1BNY3V2TWYzSm9H?=
 =?utf-8?B?aUR5YkxsT0pXRnpOWjEwUDJ4VEVvUU9jd2hPamt2ZGZXb3h3NVhkVlZmNk15?=
 =?utf-8?B?bmcyRUljbW1LQk15MVJzVURITStwQVphWDVJVUluOHR4OFVhSW0rNjJMUm8y?=
 =?utf-8?B?WjJ0K3VET3dOOEFiQnJLTkRCeWo4TkFIM0ZZbjh4blY1UGp5bTN5NElHaHd5?=
 =?utf-8?B?dGZJUE5pckRKTTVONHpMWXJON1dXL3pxVkJudzhLWGVXWHM4aFZBS0ZlV1p1?=
 =?utf-8?B?aFZ0NGEvcFozLzV5OUNTQzRWNlJ3MzhIVWZIWnIvczNkWEd5Uk1TT1VsZGpI?=
 =?utf-8?B?RElHbzByeGVCek9Mc2FTZFFMTGtsbVJQZG9ER3JsY2F1eTF0Vzc4NEpjMjF0?=
 =?utf-8?B?N25maXFRVXhYc0ZSbGoxaGg5b0RqNjB6WkhHTk1KamxMYnpQOTdPT3B4ajY0?=
 =?utf-8?B?SkVCZkU1bld1Z29HWFpIdEpGS1IyaGFTZWN6VmRDcFRoSWNWSHFXZUFYNVU1?=
 =?utf-8?B?bVg0ZkZ1RG9ueUx4N3Z0WUJaU0hpY1RGTmxmd3U1a2VGS3hrU0hMelNVdGh4?=
 =?utf-8?B?a29JREJIdUhVbEZPRHJKQ0xOamN1V0ZmQXZiemREUy9rSEhsN1FXb2dsMEl4?=
 =?utf-8?B?NlpDZTR3UU5IZ3NLMnQwb2hRaHVOY01rajNiRE8rclgyZnZDRDM1Skdza21i?=
 =?utf-8?B?ZlM2VG1uUUZnYTFWa0JnRldLZ3RPcFdlUXlSTFJSeXNaQnVvUG1SYkZ1b2dP?=
 =?utf-8?B?aWpaUFI1b1RKWWhuNXExL20yQklGcHJIM284RFhOZ2dzYjBVT3BXSTZ6NDRD?=
 =?utf-8?B?R0ZZVlY4YWlrcWp6MTlTelJWWlZpcVRabUhwNlk4TXltaWxLbDhTYjRlRmRF?=
 =?utf-8?B?eStrUWtlOFY0Yk1pbGdOY3E3VVF5MFRRbG5wL0VTMy8vRVlmUjgzSGdDNFlk?=
 =?utf-8?Q?3kjBjx8TQyA0O6fCfBEIqTwig55+VKbp6WJriQ2r7Kq0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57f8fb2-407a-4fbd-015d-08ddf318ec86
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 22:57:33.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1GsFQcxA77qLN4AeHhUHdksFXEc38wfNyZkA8uKxPdG+OpN2REeMLtOpFiUCOPrkZppUb/8yM/rSlG2gEQEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149

On 9/13/25 16:03, Andrew Morton wrote:
> On Sat, 13 Sep 2025 12:53:27 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
>> head:   8ded915c4409a5190b1c9c57c172d62ab5534274
>> commit: f6748cc302fdca7c486c6098f315bd4174f5c614 [39/428] kasan: Fix warnings caused by use of arch_enter_lazy_mmu_mode()
>> config: s390-randconfig-002-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/config)
>> compiler: s390-linux-gcc (GCC) 8.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202509131255.x9EfvIGt-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from include/linux/kasan.h:37,
>>                     from mm/kasan/shadow.c:14:
>>    mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
>>>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
>>     #define arch_enter_lazy_mmu_mode() do {} while (0)
>>                                        ^~
>>    mm/kasan/shadow.c:322:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>>      (void)arch_enter_lazy_mmu_mode();
>>            ^~~~~~~~~~~~~~~~~~~~~~~~
>>    mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
>>>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
>>     #define arch_enter_lazy_mmu_mode() do {} while (0)
>>                                     ^~
> 
> Huh, thanks.  Another reason why static inlines are better than macros.
> 
>>    mm/kasan/shadow.c:497:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>>      (void)arch_enter_lazy_mmu_mode();
>>            ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> You can't do that with them!
> 

[...]

AFAICT, The issue I saw and fixed only occurs on top of 

commit 116191f326bce79aefa0ed540caade5a55fbd33f
Author: Kevin Brodsky <kevin.brodsky@arm.com>
Date:   Mon Sep 8 08:39:26 2025 +0100

    mm: introduce local state for lazy_mmu sections

Which changes the definition of arch_*_lazy_mmu_mode

-#define arch_enter_lazy_mmu_mode()     do {} while (0)
-#define arch_leave_lazy_mmu_mode()     do {} while (0)
+typedef int lazy_mmu_state_t;
+
+#define arch_enter_lazy_mmu_mode()     (LAZY_MMU_DEFAULT)
+#define arch_leave_lazy_mmu_mode(state)        ((void)(state))

so I am a little confused with the bug report

Balbir Singh

