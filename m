Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D312222A6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405610; cv=fail; b=Qfyi72hhQzC77LmqqKGsLeeEE7nK2Nl1gqdXtDY9o3dXArTt4rGbuTj65JtGZHE6z87bMm0qUSGscrw7BELFMn1Fh/y9xciYUs5LDdVcUsvgs6W6B2RdQpMlQHkwcG/YZ2IvM/VwNYKLfTtVkGLIDk96BsSO4f6A3EFdS5J32L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405610; c=relaxed/simple;
	bh=eUyU+fbFfS8EbnHD99MHkIHOULPchC0ALH2Dzcqe/XY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cmFYZbD4EgwvElmphZ+irNPl1gYIE3JsH6M26zdSKSaOwVJfF7Wg3NgfcsSLS9JdToqnAH1S5NMk2cq+aYcC1nM/J1JyTwI9xpniSOi9bQwosX6kNRgRivkVxwR3ZMf39KTs4c4SUs72KpFuf447ubDnhZrBcHiuNaGkaVxSn2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sgCWnDLe; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sgCWnDLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtgElOApqKLvZ9ElrtZrwrWfxCILphhbog44xiRVTTokjFo20GA+DL4ujhtW/HNKlyAwyjeMbq6F997U1kmhb5DnwWzPo1s0zSXF5y8yBGwXcJiq/lUZN2sOLeHUfHBG8O1QWEIVv8Iw9Pfk147x6d27Z6jOTjncISTrJxIqMz427U9W0mE/mW5BRcn/C42jvAk+cOYyRoUdEnoNo9qSWBKOvqyqfKvMVNtdFp1iAEINAyBQxnymx752zG4Efqtrd+DXeV+SQra7ftM1qwsxn6/Abiznx0MhUkXX88UTCHyKPFa2Xbib1l5odyJFBU47HVirxXUnHa7Fz+clsEmGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocjnbUDNmzrpxLpwXOJvFGqansCGUiZQz7+/ALZVUHE=;
 b=ga/cX2D6rQJvqfkLae+BTcPzMBkknzOsBNRpI3mp/9njHl0z8NIkao95lUktqrjALIFJZ82W6ZlTEQtuzjYhp/O0s9l7DemL2StL8aS4LJbn1tsMno42SydcEuZqPtk+I/AQL2p9XjPRjIlfbBqDIqB2WwGqKVHVRasnFICabbJdRHC/E7r+p070WgpyYMadPzJVpaJUy2TIq3z8bYGyGeYUBBU63txdzeMGdS7ArMVkg6QREHNDSlrcozlN3Z4YgSR/o52g50RoM0n6eB53sTrNYDaK85AyFkZTSZiISLbrBjjO45phcUm0W98Wr1YCXzFV1ulU4F9HgsQWruzLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocjnbUDNmzrpxLpwXOJvFGqansCGUiZQz7+/ALZVUHE=;
 b=sgCWnDLegKp51gwFkc6ehUdqPvpbWRLWhFu/ps1JXhZrzFH/jrkAZcauZrSHqgn9kYe66FHWWMcaG26jtj0dYu/KDn6girG35BLHeFAa/sMmDiqD7fhP7EPET46wr3qLqv+fJ1Yz1rKZ8bByvNTJ0XTJ4F6wSAGN/xezE/grIsG6GQMC8tCiUq3nk3J2j9ngaiHWDOJZRdSBxTTAhhH0W7mFA6V20cFBQqBXljEO7dI+vm86vFdydd3lD1q5T5eemggop05mt9qRrzwp662SFx7k8Js73fXnkADrWMLesJuXa/ND6K0u20yr6iMlOPGH7cC4eNmDfdXXBpmOdSgmkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Tue, 1 Jul
 2025 21:33:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 21:33:26 +0000
Message-ID: <7969b64a-c18d-4b4d-a514-d78eaf9fd920@nvidia.com>
Date: Tue, 1 Jul 2025 17:33:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [jfern:nova/master 72/87] Diff in
 drivers/gpu/nova-core/debugfs.rs at line 1:
To: John Hubbard <jhubbard@nvidia.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202507020022.CTF71Rpm-lkp@intel.com>
 <03c57ca0-200d-407a-a0da-43137c9eda3f@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <03c57ca0-200d-407a-a0da-43137c9eda3f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 38175ba1-0889-469f-fb4b-08ddb8e6e9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0cvb3BheUw2eVJGRlZyUDE5d0tiaDYyUXhMMjVwcFYxV295a3ZiLzV5TEV3?=
 =?utf-8?B?NGw0cndKNnB4b2l3anNScmZsak1PQ0FSa0xib1NhZW9hM3FCYnZic1V5NExo?=
 =?utf-8?B?eGV0NTFRZEdLSmhNcE9FaW1xdnhlM3lxd3dUSHdmOEp3MzVMMzZxb0lnbith?=
 =?utf-8?B?YWVkUnQzNk0wZ25iK2twT0gzZ0FlUGZPOHl3V2JSWWVUQm9KYnpIa3FMSngy?=
 =?utf-8?B?N1ZBSzhPMjExYnM0SmZnYXRxcVNQMjlEZUs4SGkyK21hdlAwSjBGbjJPMjZB?=
 =?utf-8?B?YXBuRWJMMjNnazA4cHBITzMzTFllTUVYaDJLZWs3Smsram1qZHhjQTdIOEp1?=
 =?utf-8?B?SGNqcktqQXQ4WG5qdno0aW90K0huUGxkeTFteXFSM25EL0tZTFUzRDRPQm5P?=
 =?utf-8?B?STl6U0sxYkxsOVZlQVNsd1FhTnJIcTNWNW1VZ0I5dmo1T2l6ODVrNHY3T0NO?=
 =?utf-8?B?MTljTGhSL3Bsd0w3UEdydmxRN1NnSmk2UXJVcnBBZGljM0Z2VzBjaU1iTlY5?=
 =?utf-8?B?S1VId3p2eEZ4RDVFMGJmVEdpZUpGNlJ5ZDA5Q08wL2VuY3ZvVk9ObXU5N0FY?=
 =?utf-8?B?OUFncTdSM00vemltdi8rUWpDWVVaRTBLeVRJaUtlOHdRWU9pMnNzOSt0SE4w?=
 =?utf-8?B?dW16ckc1Z3AzSXZRaE1OVmZqSk5obk5UQkMxajNmQUdteW1yVWttZFlrTFZF?=
 =?utf-8?B?a3BlcW1ZcHk5djVkeGYwMzc3cXVqT1RiOHhFMWRYQ2hjTTNUOFB5blY5M3RG?=
 =?utf-8?B?em5OVXFPNUwxKy9nTCtobzFRV0JxalVVdkFPTU9Vc2N6bHpBcHRzZWFGT0sz?=
 =?utf-8?B?UUR6djIvUmF6d0lTYlZWWFJwdytmV3NwRzNvTm1tSmpYVWtUK0JCYWxybXo5?=
 =?utf-8?B?dHlJSGUxNkYvY3J2Wk5TTkVpT2k4TThlUzBNZ20zQXU5c2R0eXBXREREeVVV?=
 =?utf-8?B?Vk9JNjdCcldwYnJLNEg3aWZnTkVpSVQrNDhIemJDTzdDYm13a2pXd0Z4dC92?=
 =?utf-8?B?bUdIeHBuL0Z2WCtRVWQzczBTV3BkZ04rdGNKbDJNVGhzWWttMHhXK251UVd0?=
 =?utf-8?B?SjVGVlNEdmFHYldqN1N2VXgrd2F2WXpXTDg1bEN1U0lkS3g2MVhkcWxyejV2?=
 =?utf-8?B?dDdpMlpnY3JmZDEwSlJnWjRac0F2QVpmUU0rdHpPTUNOeUx2dzlUU3hmTzRN?=
 =?utf-8?B?ampleUJza25HS3k4N3Fqd0V0K3E5MUxHMEVTTmhCU1pndnR0REZvVFdrNWNX?=
 =?utf-8?B?dS9oSHlDVFpNSUl1dE5wUkNnMUdpUXkrYkJnOGJVQ0dXOGtBblFwSFBtRmlS?=
 =?utf-8?B?ZGdhTy9KOVdldnErR0JCTU1XeXhERFArZHpSSzg1NWlzZUdzT2RpV05RVUtB?=
 =?utf-8?B?Smo4NXhWNTFyQ0JUUVpXMCt6V0Q2eXhhbk9SN2h6VUxtQ3VkeHNuYnpmMTdj?=
 =?utf-8?B?cGYwdUxnZUNOcWZ2bFdVaFVNVFJacWZXRElId3FXSVo3Mm01dEJQM3BWd1dR?=
 =?utf-8?B?TmxOR09hY1gyaFpQb2sxU0xUWGJ4T0thcWhocWxRY3o3ZUtIRmJzZ2lkc1E0?=
 =?utf-8?B?bmVCWjZyZldQOGUwUGxQQ1RpYVVCVFhDYitWQmU4Z3lBd2s0WlZtOEZFaXEw?=
 =?utf-8?B?RjBHQW14ZittaTd1VWhMVDdkMTZyYzN3TVpYYWxHWEZkR053SGtWaFBtQnZj?=
 =?utf-8?B?TUlnci9KN3lvVXQ4RnZIc1BuREVyMWx1YzZnR0pWaTZ6NnBldkVlbW03cXAv?=
 =?utf-8?B?NEVaZEdqZk9QdmhmLzRlREpHa3dQQ2UydHV0TGw4UmtnZmNJVi9zWEt6TjRv?=
 =?utf-8?B?RkhSeEROaG1MbzUwSWhxeFM1dFdPMldmWldaamMrY1ZOMmFZVDhxdW9Menpa?=
 =?utf-8?B?bWl0b2p1YWF6amdUbWRMUEYrRjBJYVFqT1Bpc2Vqamp1VWZuTHpjSE9FTHBa?=
 =?utf-8?Q?M/9zpBYYPmw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJmVE9Td0hNZnh4QTNKYXZZZEtxL2FkUStJYlVTd1VUS0ZIcE1Id3NINVdY?=
 =?utf-8?B?RDBDY1NsWitpUGlKR3Zhd2lMcWtGbDRubUlyMy8rTWJXME0yYVFuTFFHNC9H?=
 =?utf-8?B?REI5ZkNET3Q5TUNnTnNTUS9iR3FsejVwOThRbGJWdWM0VzhMNjRweCtEK2Qv?=
 =?utf-8?B?OEI1c0Npdk9NZDRlWFBFY3F6QXZxaU9zdzZYSzVDcllNNlFDcnN3NUtMTXZB?=
 =?utf-8?B?SzltWlp6UEwzaWcxQUJieDRSM1h1SFY5c2NYYnpjSU56THNTNWFwRG1CK0h3?=
 =?utf-8?B?Y25uZ3BicDdLamtJR3VicVpZZm5Yd09Ic1czVkJwbDNlNzlyUHd6Q2l6UUF1?=
 =?utf-8?B?Z2IxYlFGQWxQRlFtaGUxY3BFRFFBNUE0UkQ2ZDMxTzc1Sk1BOHRGa3llVlc3?=
 =?utf-8?B?c3lRNXRSMkN6T3hESldTK0ZWdEFmRFhpVVZhQk0wMGJEZ1lWeVM1cUtTNkps?=
 =?utf-8?B?ZE9mcEY4cmZ1MTRyUVJrMzFyRWdUbTlUUEt1dEpMZVlOaSsyTXNmNFhXdzcy?=
 =?utf-8?B?bGFxUDRBSTNwdENCcm1nK0dpQ1hFMG1SRTNPelU2MXZsVnFoN1ZXUXhvT1Fq?=
 =?utf-8?B?WExtVUJSVVFmL2lmRkZlbWJMQms3TndvNkdmN0lDcG5nZitjQ20rUzAwMGFm?=
 =?utf-8?B?S0J3QmRRYWZpVk1jQlRYK0ZnSTUxR1lEZVY2aTlVVXBNbnhQOXBnbGJtOGJn?=
 =?utf-8?B?Y1VaZFNZcHlkRXJqckN2U1krYk9TYmtqWVlsVmwwRTV4akdzSVN5QVFkVDdl?=
 =?utf-8?B?cGgxeHJSZ3lFd2tDUUR2SHN1b2FoREc1UGRWOVJLQjlHTkRTSXR5WU1CZlNs?=
 =?utf-8?B?VTZyODI0N1BCVFBtS21YWGpnR0VLaGtiMkU4U2V2MTFuTE5GclR5U0ZQM0pj?=
 =?utf-8?B?cmtSNlVDbEd2amFNdUpCL2gramNOcWNxeTNOSDkyYWFHWHByeFl4eFpGYU91?=
 =?utf-8?B?U2JJQVE3QjdXUjUzNHAzWGxvV3lEcVFIK0ZYb2daRmFyUzg2N1pUT1lCdUhR?=
 =?utf-8?B?NW5HRTJ1blowOXdhRko5aE1UMVIvYzZrSHB1eWxleVp3ckFOZXBZbm5ZZG9D?=
 =?utf-8?B?MjdoSTdIQVUxNUJkNzk5R2xCRDBpWCtmM3NpZyt3UUtibFNkbjhqNDRZN2FS?=
 =?utf-8?B?bWZvMUxiVjRoM2ZqMXFmZEZXdElObFBoQ1ZCSzBNRlgydXp2R3RmbERtUzZu?=
 =?utf-8?B?cUxvbWM4R0NxdGxxQ2tNUVYxV0V1K0M2c0hVRjhTdWk2UG5kaFpIT1BnUEd5?=
 =?utf-8?B?U0NodFhQV2ZrVjc5VjZvN0xWOVY3TmEvNlNzclZ2czQxTEhxRkgzWm1yam4x?=
 =?utf-8?B?TTZQRzIyYTNrdm9LNjFMWDB2b0VmOFJpTDBSdTNNOEZ1YkVjNG4zZFVySHc3?=
 =?utf-8?B?U2RCNFU2WFpDMXZjSXhvUDV1UFBucTZ5aWgzMFIyWnpIVCtUbDN6QkQ2KzFh?=
 =?utf-8?B?NlN4YlBlWU05RmM5RXJ2RXRnWDd0SVNRaHZ5d2hzN3VuUmRzeWpUSzBaTjlQ?=
 =?utf-8?B?TW0zUXVHV25jSkEraEtwSW1YYmhxMWkrbmxIS1V5K2dFbHh2aWZhc2R5cFdu?=
 =?utf-8?B?ZXZBcUZraTJ5S2o5U3NGbVdoNXVza3FvN3ZWRy80Y3MvbzNPN2Q4STlOUVJh?=
 =?utf-8?B?SGtPT2EzKzltS1RteExSWDZ3SE43RENlSzNiVHBhNnQ5cW5mZHV0Mlk2YVFL?=
 =?utf-8?B?VUVZSW5iOGFIdEx3NWI1Q1J4RHVGSlBScTNJeXdCNkUrTS9iYzNjZmtQMmVI?=
 =?utf-8?B?L2NyaTBKSUMwdXVzU05Iem1nQ3gvN0U4Vk9IZGt5QlF0cUFLYUFYUjFTVGF4?=
 =?utf-8?B?YndWdlMwWlJVYldQenMxTDE5TFluZDVzYTRTdFpCNTBKeDkyampiMWNhQmdh?=
 =?utf-8?B?ZHUvZ0wwRnNXL3M0WnJHVFo3WUY4SW5nTHc1MnQvaklJWVZwTFJyZTB4eWow?=
 =?utf-8?B?WllTc1UxdmRHRk5lN2VoU0ZTNFhmUk5VR3dKR3NHZktibGFvL01XQXBOa0du?=
 =?utf-8?B?R0QwVVRNbkk5Mmp4Z3p1bzExRFZwZXNESko5cTU1NmR2amxuVGVGQ29xWjhH?=
 =?utf-8?B?WUp4a2dBSkxudjJCbkVVRWp5ZGhuYXpPc3BETkNOWlV1bEtidzRkellqc1hh?=
 =?utf-8?Q?+zUEZbtG59PkABwSLdKMfJG4I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38175ba1-0889-469f-fb4b-08ddb8e6e9a5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:33:26.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhYX/u7n9o80BZGrhIlwmaHFEs6S+X/V7T16n7Z3nQB/cTcFjBOl0Qb3xwJM7u2XoQ7CyH13g+tD8BKfX7te+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679



On 7/1/2025 1:56 PM, John Hubbard wrote:
> On 7/1/25 9:14 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/
>> master
>> head:   dfa2b234298399a62d48d2a78ce8f3f58d21cda1
>> commit: 70794f2c1436933de0355b0bc0eb6faf16e968f8 [72/87] DEBUG: nova-core:
>> debugfs support to dump logrm, logintr, loginit
> 
> Hi Joel,
> 
> I've forgotten, but did you submit this and its related patches,
> directly to the kernel test robot? Otherwise I'm wondering how
> this was launched. Just curious.

It launches for all my upstream trees (scheduler, RCU), and I push my WIP trees
to kernel.org as well to share with others, so it tests everything. There used
to be a way to stop it from doing so by appending '.wip' but now I believe that
doesn't work (also its odd to suffix .wip). To its credit, I did fix the lint
errors it shared in my latest tree.

> I also noticed that the patch title (subject line) should be
> tweaked, in order to have the right hierarchy, to:
> 
>     nova-core: debugfs support to dump logrm, logintr, loginit
> 
> ...and if this is not a keeper, then maybe put "DEBUG" in there,
> somewhere well after the "nova-core: " prefix.

Yep, fixed. thanks,

 - Joel

