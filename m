Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271B33B96B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810916; cv=fail; b=DyHf44gsnzcctdZ0H/l9gpK0ob92SWfO99NNQud9wgn2s/0NeyWAXtj+2JK79mjy9iaI2ReJxJNjjwEWNgOOkbBICd2FxU67sWCvXh7jP1o9g+d0ObdRtBJx2afCG4vsXTqQzscsaduQzAALlZhZmyR6n9Ylecpk+DLCtCusrXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810916; c=relaxed/simple;
	bh=QzHjwGCKoKFLmApP7aSqQoZLKUBbyHQiUvec+oIaSXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HyVxZU5DV58Fhh+Za4LalDxrPrVLwahfdbmt6ybKfXOljxcPIJIIlWnrRCHUt5BliBvDnwpT6+0VHB9fct+O3hz4NyXe1Lak0/0qM40Dgmmrq0yVrMRuEynVI/6EH9koalUk7vk8hZ/fSrAXmX8gq22dzmyZcXdqyGrkMQNYvRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GsUnetTY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=srxdeItJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GsUnetTY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="srxdeItJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1cbDB500796;
	Mon, 19 Jan 2026 08:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qgfWTUrsBp6LReqEpZ
	DIiKidEycaYiTWz3N7fYUuHoY=; b=GsUnetTYy9EIEBnIrbIYW0J4DY+Jsx1tFB
	DFuy34OkNE1njBduy8LWVHXXcY3y+KVP27wujx/ZLUE5zbgEeidAV2nbX94MV71v
	btR1T8MQtCBV3MOXJRQ37HtV6yqjhS1RQzyaaY1W/UkM1ngghoW3ND4k/ohxPWHt
	tKRUBJxjInxPOa3QH43HJL+iuIlyTkzlNHq5Q2hA+dQefdAeYO3l0Tq2KQwsViqe
	6gktQxbAEugLSKmnoLUf8k7Jdyz7ZtISZ2p7PqY8kvDueWtlPeOgBtdc9lErXXRR
	8HrEPVtAqERsQwijja9vmp0l5IJs949hN/37BhkWyy7bRni2g0Ag==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9hx1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 08:21:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60J60HwS032831;
	Mon, 19 Jan 2026 08:21:51 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vbueeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 08:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ7Rc3BiKl1Hcx9zfwSfpPKmtuW7rQ3sDHa6GRBwIeBHjNo1PndDF+TltQNU7aoVHNQhD9xxUcET6n93X/53Noxrul9sr12qVgYYGCO1nVvy6SRuOTyE+ZE2vjwXTviZSJ7HHzVFXXdf7XU1TZ8zQq2zOSEfii+rIUMWwMBV1Ayim3p9oK0f1k4vMerA+JehWnMEYRG++BXmC2ejenPfpbzim7jPDJlqM+ZPldu1aUDnI9KGBi+Xg00yjvBDrZzR8jJqREmOmxHIOqCLpxqN+BVXP3EYbAcPpzNrCrRNAs8gauBVe+ayU8alBLWvffZDXnC9TE0cOo73FUoc6ZAhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgfWTUrsBp6LReqEpZDIiKidEycaYiTWz3N7fYUuHoY=;
 b=n2LmqUXvGLg++G7C5ci89Kv6woOAk9Dcd6qZMiljmR9JCQ0hXaHxL9FW+YVwu92wepyZTA5L5XqF4E/hABeEHvDtaGgDfVmdW8dn2L8zs8PCZpXdTIU309DMiou+4qizhzyz7Mp13Aus/memsTTu+bTaO6JOwDyOGrzWvoimahkmKcgWr9A2g+EQ4EqtUKLsnMHnXmoIHiqNglsB0ac21Al3ofLqL3fwBffTa0VGPYXZnJZwcflsmY7N0vkXpPDjkLWllqZbN6UnBV+80t2AvLhaMbvHPMJSGL5pFbMXJGkVIwejTCsYeDVdKCVd+38WfolsSScVnt55A6gOitGNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgfWTUrsBp6LReqEpZDIiKidEycaYiTWz3N7fYUuHoY=;
 b=srxdeItJjHmZwq3SqaMtSD8aWRIUoO2inDAz1+GRQIzVvFcjykK9hD2M9EgdvCZIj97Tgq+yIkqdXIhB3Dans1nD9vkVzqSKodXej8fezG2P2VOEhHh4HfZARfNom4F3bP2DWzNQWNy3adiFKFF7G3HjgcRl4c3jJt3EMxSBRZs=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 08:21:44 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 08:21:44 +0000
Date: Mon, 19 Jan 2026 17:21:39 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5478/6849] mm/slub.c:2340:16: error: use of
 undeclared identifier 'MEMCG_DATA_OBJEXTS'
Message-ID: <aW3pk016_bhRCRA7@hyeyoo>
References: <202601172108.4M7RmCaj-lkp@intel.com>
 <aW2KpbqlxEbWhCey@hyeyoo>
 <aW2gCj7pDfRKvmZI@hyeyoo>
 <78b4fe04-770f-4f14-b741-04fd4a026ace@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b4fe04-770f-4f14-b741-04fd4a026ace@suse.cz>
X-ClientProxiedBy: SEWP216CA0010.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc91c05-933e-4640-f361-08de5733c7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LXKOskP1VvDuYus60ikQb5R7csOtO79WxCuUQ80l9eWyUD2gzE4SCuMcgXnG?=
 =?us-ascii?Q?lAlmGREplwqxUy8b70w3uf58YuXDxgi0QTVxYKzptB0vH2q3MMUXtfqa571V?=
 =?us-ascii?Q?S87CZYwi7WIW+sz7HIjPKyABqpNs9KWrnIWJJp/cCrFyDunayXaKQoN2MVZD?=
 =?us-ascii?Q?EQnMfwcWiedzzNwQ1wjsY/e8f1g5l9f0NRZeR2oG8C1sx4QOngG+AA1lwFrh?=
 =?us-ascii?Q?OHBUEgRPm+4BXzsAF+YxN4rGTa94/REFZ+h7+VIetXKZeQe+UgJbh1i/o8Wv?=
 =?us-ascii?Q?doUOj08LO14XlW63Fzxm8WyJqfjyBzcpSy1VNHdqR/kk3p+8zhusNpdjwqVT?=
 =?us-ascii?Q?mNFL5eC92A/EF5CXJp2F8acCEnHI7fd/HqQJly2oJgaN8zMFX2oaBFSwam8Y?=
 =?us-ascii?Q?wci1HtAFctPADzOuAzk9ey/bcMjajxKsJV94Bghv8RiqoX5DFKsqygSkzE8w?=
 =?us-ascii?Q?1QyDTmOk2rFIVyIvTi8ICcfAVLb98wNzAo7C0DJe4I1iREnXaUBc6gBA3e0J?=
 =?us-ascii?Q?U9ctygWpFBHOk6qg+bBRTyQ/9t/TYCvY5EDL0TWIlOiJwRb5xVuBUddtKIn9?=
 =?us-ascii?Q?bSltpimg/hpXRaVrmMSTgATtUV0fQ4S1b+NWbv8EeRX+kUgpzfdc0doNdJs6?=
 =?us-ascii?Q?D6AxwC5sHWxBNdKidpLAz8lLUH2QEhdACaGc51UJcxrbXvsYXRuwjF9Y2WRw?=
 =?us-ascii?Q?RxbKhIXuuoVmm1lUCy3ugB4Y05tiequsf5Xk3Eb2LaYW9IL8e/UbP21V6j+b?=
 =?us-ascii?Q?DoZfKudriCMOWxcrzHG7maIscIrr0Chnv4LiVv1HpcRdBzzLyTCMc0wZBT9R?=
 =?us-ascii?Q?7HB8RqGusbkf02ZFhIRYGh+IItFIv9hlWADL+O8+F5W8is+Le5T/ZN/j5/Cz?=
 =?us-ascii?Q?3w1q9++JfqpkdAH1WaAR9jB17LLgrcxGKuVQuxwUnbxmKvDzlfbNe61h8YwG?=
 =?us-ascii?Q?ci/EFJ5aXNYbZnnIGpvHER9gxDz7pwZjkhxniMSegrEMulq62FUJPDuFrOYc?=
 =?us-ascii?Q?KJuQ+0OlKlIspiVCFqVCSFx8Ovqc8FA2NCzDVgkyZMKczdf/W81zyxzQH4Sq?=
 =?us-ascii?Q?MI8RJrqlKcRzKYWFrApncgCqwJZ5M1NLScIAQNNx4A7M2pMHZi/9vbKaVVRh?=
 =?us-ascii?Q?7dqgn0BuAcWp+alksyJhItx+YNa0SoqLgNXD+1eaMjo9+dU4W62BK7S6cdhK?=
 =?us-ascii?Q?ueQ1l8N+0dsrV7qWw52qYQR/Au0RCMPax0M8Aa0VyKrTUAOHEc2PeL8K1NxI?=
 =?us-ascii?Q?PPZexny3bxV4hT9gGIzrqn2YHc2lDcOZPbsTso5p8RM1RV6BumkUF6WVvkdf?=
 =?us-ascii?Q?EoaPfsQmbWpj4utZ1fnI3+XOEwy3dGB9AMdLtetYk0e207eBM6rL48nXnX1C?=
 =?us-ascii?Q?NeralrN0q14Uv0FluFXhyEdIea1ZxG5ASVcM6ZePLMy/C5WUqeFTwxBydX3f?=
 =?us-ascii?Q?ZXqXgJWXLz1bIBt96e6f+N6hYO0UW6IoMZfoKTTb363TAd8en4cnmvsWEaOD?=
 =?us-ascii?Q?3Psz/v5MFYWZ1s4qZE8rM20tLBZzyneOAdx+0vQOvgb0NYN6CxLvtW6CvzQa?=
 =?us-ascii?Q?mjnDIz/fRzGNj8/CYSNLRSfGLz8JIth3f74Jh2lw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPLllFSYTli0P3Y37lavtI9fpAN0vsq9Tq4IgJWnRhZUdsBSq/pNYsktfW8W?=
 =?us-ascii?Q?UN69CmGeF9YYQBtcbgtnGfLy0ZeJrpy/1tDShFrZkMxGVX8OmsXcmom6TzhG?=
 =?us-ascii?Q?I7RaXDLVu+YIJ8OFixM+E7Yzc4MFIxmIjr8SPRLhJ+huUcoAtgNvBQDsEYtI?=
 =?us-ascii?Q?gUgOydNx274m+/1U8HJmtfMPxy1mwQLp9UhB8JHmCFnn/Xd2uOeb9ZgnbraM?=
 =?us-ascii?Q?d0oTu7cForZKOBiY98D4r0pJbT1xfsdYOR2M++A2hQxb7wNVzMhFUsg5iiQY?=
 =?us-ascii?Q?MD8QIFI/HhhZpRYhK7I6DSJEebA2csYBOtKi4wVOOtwNd05qfi3VANlDwEqG?=
 =?us-ascii?Q?FbfIZiLMN6rtpH50zB4zDgYEdmvpMTZYN7DZp6GE1pbKaYqHKoT08mmYqZ3g?=
 =?us-ascii?Q?N/1jSzSkJS96gzE+VXnyJt1siXPNzvKKFcHppBd5YEd7f68axu9eUqFjuqg9?=
 =?us-ascii?Q?8Yk/J8UdGAHFBeNEzUShEIV9tYcfj/hVCC2+jTgFf1fwCE5+ZIokTgHPDlvG?=
 =?us-ascii?Q?biRjeZcZbCDmGG0HwYb7i9vdJDFtCm7LpRhFvt1cg/nDQz38bsh4uy0J7uhJ?=
 =?us-ascii?Q?oat9HW17pW+UjeWYCnGfLXjypOSpfmLXzrOt+NqMkmTY8EHy7ctRymlcjCFm?=
 =?us-ascii?Q?8r7m7gJH7lpWVm1ijth0/3TDfuoULAvculZDzkq1cRyY8GS6Jyz8cNxNDsq5?=
 =?us-ascii?Q?+9CxPzgZ3yE4iZ0XrQD3qOPxfv+5d8iLLW6PZM3km+AXYSWrbsyjMW0Gt+PX?=
 =?us-ascii?Q?cL8ky5vFcV98jjle4xcSdqOPgJ7pvcvzBwCviJB06AQg240tYIBf8jTKMh+k?=
 =?us-ascii?Q?NxrjClyDm9xqFcMHUn1Os9oN6fNeTVfryRu0+p4MZGXOKaw8hukgdunSDcdf?=
 =?us-ascii?Q?YbI5Hzfxkx6nKEpYkKLzXNxC7p/Uo8Vtm/vM8fUBSItKK+m6OADXgH7GmKoU?=
 =?us-ascii?Q?LBmvmJB+xL/fLoqlMkW9dy49EQEmY6oHEz/HSASp6dBfnOEPEV843KahGUu+?=
 =?us-ascii?Q?PwAc28rycg5gxVs1WFwOmz5BePiqSxbkOX+H+NGQK9syrhB1X/Fw9c+fKn0Q?=
 =?us-ascii?Q?RFGMkWpctrAMG91qGfUd2qvmoqshCT1i8krBoMkobHqwq0bkWOhFagi6wP9D?=
 =?us-ascii?Q?m7gQvuQTfNYbRquZ7tsciqNGLTRly7vLIxXqewPWiwsZOTyuk8+R5i2s8/5D?=
 =?us-ascii?Q?Gzt0aax7r6fIgFWQ/WYX0Fu39jRXtVUcV5MXb9J394sX5zlkUBTNPQH9qhhS?=
 =?us-ascii?Q?p+MMuEj9yiQUfYQ5eK/sPWhcUDBViK6ay/VbfCPmi0IWfRGp0I93jsVRrtCy?=
 =?us-ascii?Q?BX+J5eg5ci/LKYYA9DHeUVl4MXj84xdszaI907+BB5qMLSavjBzB709ZTt03?=
 =?us-ascii?Q?YdvBESmkLrxdCc+NEvidrSM98tO0afmrM58cOXZe8kLetkQDWwSOfBYTCskG?=
 =?us-ascii?Q?zvKB/jntvYpM1yoVXxosUv4jWJPB9QpSSXQGg8+1sM5CyE+ZCpc45cWyQgal?=
 =?us-ascii?Q?96Jh9dlbsguRAQkHy1OqE1gKRx4SLsHD7wmQglRtZ4Kq0oYAQxKs/+W0n+Jf?=
 =?us-ascii?Q?oA//YLuc0+EbMgngIlHmUJH6ccQntOTk8MO7JuAWQ81V3cdaK9yh9cbs0jcs?=
 =?us-ascii?Q?igITROSEAv1AfYC56mnjucOqBnnZEQ9wGskOQRVEHfFuyADvvRH+wrOpufSp?=
 =?us-ascii?Q?4UWuVr9xUGe6e0NiTCrmMM0gTsUMCYPyp9Dg+OHYu0WjtGvqUVnYkkrykyQk?=
 =?us-ascii?Q?kQSki88LeQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e0873SEiD2ouf3L+F7k4auKVK2TgEhuA4OhBakn0S3w3Ry8zD62qpomYetSDHmpP5zgzNu957KoRotGsIhGaaCadF2+3eY7wViTnFWoUq0J3kcJWzzf0hj/vrzfSQIWLt7yUGT+hlSMsQeXcg5cXBi94vSch0bfu0q2VasYrwNzjcPFmkMwyrDm2ruqmF3UHTYRoC2RP5Y0vYBJrBWYbSI5E+j3UY69xuZEik+36egb1ccFBbF5u0gtYOobAqf61yG6pRIy2jjMrigukSttlMvSc60B2YIyDZXdWNioN/7YEdkrOuAt0rdvqLcg5kHo3/yT/Q91H8eD5wE44868RWXZl/7e2cPPW3YqwlXO32DZ4akuBV8C4WXnIowTNSsG+LPaGcHhBx/7fNLs/5kHNp80nu7vg+eZwthThuYEx52lecWjgIDkC/ZEvxv+5DQXSCZEpMnjIj3dKrfwL+Wvyv+MtIwTh+Lf5g5ahGUdyqGuKVodHV2s2I5IxS3Aevw3KjW/mZ1SJcf+isF3QoYV0yIOt1VPmpKJXsqoCeuuQbAidK6df5iKo+quVdm224Wr61bpD1kZweMBuGYA4likj/Vj3oTkrRGUiCy78PXwqUOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc91c05-933e-4640-f361-08de5733c7ef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:21:44.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/VrEJiwImyuf161IFG7AK7CrCohnPKeRB033yJUXhJ655bCOytRDc1XRvziPoS42oFomlPUsvoHMTZ2C6w1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190067
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696de9a0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=GkSC1NW5TMJE4nSqwrsA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:13654
X-Proofpoint-GUID: 2eP6wqqDhWyYaf4g1lmnA4LjWrbLZjKT
X-Proofpoint-ORIG-GUID: 2eP6wqqDhWyYaf4g1lmnA4LjWrbLZjKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2OCBTYWx0ZWRfXznLCVwpVyok2
 yFwR3V0hfINo9tAljY68XMCJcIN6vQFZ8rwUDRqVZ3y7Waey6TCLBXyJT+4y5A/pKfUUAbi7aBv
 BTINNUJCCUs5tjHfgKdfpVHD+l9imgmBIyw4UMocrjfNA15ri++dobuE2MVGGwPmNzx0UkFIFHn
 LsaOJ5mFEXchjG4VDxQ9WLyVWcKysZ4FAMVp3tujvoHi2ZfhpTxDGyzG5mRL7GmVapovPlF5VwL
 FZlDo149ywbrKWwc1nc6tIhPkFYmPzGD3IypDcsT76CeztOcua2kZP8pUF14FlkGyPdkLHrnBuw
 KDX+hJY7AVT1RpQSsn7IByUGGx57VZtxkkrLjg+dZe3G7WqHE31W0EF8R3wyxtYijYA7d/RKtP4
 WUhULcf3i8g14nfUDpv4yVxKXC3uGhh7yzde0jqih29pRwlYVuw5v9UeOdxSPhe2VA8GWuZo7Cj
 qdwgaTKnoigXgBPUfCrVhX445tQhqYn1WLyLomT0=

On Mon, Jan 19, 2026 at 08:58:45AM +0100, Vlastimil Babka wrote:
> On 1/19/26 04:07, Harry Yoo wrote:
> > On Mon, Jan 19, 2026 at 10:36:37AM +0900, Harry Yoo wrote:
> >> On Sat, Jan 17, 2026 at 09:23:02PM +0800, kernel test robot wrote:
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >> > head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> >> > commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
> >> > config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/config
> >> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
> >> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/reproduce
> >> > 
> >> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> > the same patch/commit), kindly add following tags
> >> > | Reported-by: kernel test robot <lkp@intel.com>
> >> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601172108.4M7RmCaj-lkp@intel.com/
> >> > 
> >> > All errors (new ones prefixed by >>):
> >> > 
> >> >    mm/slub.c:2154:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
> >> >     2154 |                 if (unlikely(is_codetag_empty(ext->ref))) {
> >> >          |                                               ^~~~~~~~
> >> >          |                                               &
> >> 
> >> Oh, what a silly mistake. This should definitely be &ext->ref.
> >> How it didn't break my build with CONFIG_MEM_ALLOC_PROFILING=y?
> 
> Probably lack of CONFIG_MEM_ALLOC_PROFILING_DEBUG which guards the function
> that does the is_codetag_empty() call above?

Uh, you are right!
After enabling it, it breaks the build.

> >> >    include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
> >> >       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
> >> >          |                                             ^
> >> >    include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
> >> >       52 | static inline bool is_codetag_empty(union codetag_ref *ref)
> >> >          |                                                        ^
> >> > >> mm/slub.c:2340:16: error: use of undeclared identifier 'MEMCG_DATA_OBJEXTS'
> >> >     2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
> >> >          |                                     ^
> >> >    2 errors generated.
> >> > 
> >> > 
> >> > vim +/MEMCG_DATA_OBJEXTS +2340 mm/slub.c
> >> > 
> >> >   2316	
> >> >   2317	/*
> >> >   2318	 * Try to allocate slabobj_ext array from unused space.
> >> >   2319	 * This function must be called on a freshly allocated slab to prevent
> >> >   2320	 * concurrency problems.
> >> >   2321	 */
> >> >   2322	static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
> >> >   2323	{
> >> >   2324		void *addr;
> >> >   2325		unsigned long obj_exts;
> >> >   2326	
> >> >   2327		if (!need_slab_obj_exts(s))
> >> >   2328			return;
> >> >   2329	
> >> >   2330		if (obj_exts_fit_within_slab_leftover(s, slab)) {
> >> >   2331			addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
> >> >   2332			addr = kasan_reset_tag(addr);
> >> >   2333			obj_exts = (unsigned long)addr;
> >> >   2334	
> >> >   2335			get_slab_obj_exts(obj_exts);
> >> >   2336			memset(addr, 0, obj_exts_size_in_slab(slab));
> >> >   2337			put_slab_obj_exts(obj_exts);
> >> >   2338	
> >> >   2339			if (IS_ENABLED(CONFIG_MEMCG))
> >> > > 2340				obj_exts |= MEMCG_DATA_OBJEXTS;
> >> 
> >> The config does not enable CONFIG_MEMCG.
> >> 
> >> Hmm, this is strange. It works when I change it to #ifdef CONFIG_MEMCG,
> >> but doesn't work with IS_ENABLED().
> > 
> > It appears to generate code that uses MEMCG_DATA_OBJEXTS and throws a
> > compile error before dead code elimination removes it. (Interestingly my
> > compiler didn't produce error, but MIPS Clang does...)
> 
> Hm that's weird, both recent gcc and clang here (x86_64) error. I've never
> seen dead code elimination to work at this level and would be surprised if
> it did (maybe it even can't). Did you really have disabled CONFIG_MEMCG
> properly (and not also disabled the whole objexts) when checking this?

Nah, I guess I disabled both mem alloc profiling and memcg when checking
this. It breaks build when CONFIG_MEM_ALLOC_PROFILING is set but
CONFIG_MEMCG isn't.

> > Anyway, this should fix the issue (confirmed that the compilation errors
> > are resolved with MIPS Clang, and locallty tested on my machine):
> 
> I've amended the individual commits, slab/for-next should be ok now.
> Thanks.

Thanks a lot!

> > diff --git a/mm/slub.c b/mm/slub.c
> > index 373ee58b8b9e..1d87134cef90 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2200,7 +2200,7 @@ static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
> >  		struct slabobj_ext *ext = slab_obj_ext(obj_exts_slab,
> >  						       slab_exts, offs);
> > 
> > -		if (unlikely(is_codetag_empty(ext->ref))) {
> > +		if (unlikely(is_codetag_empty(&ext->ref))) {
> >  			put_slab_obj_exts(slab_exts);
> >  			return;
> >  		}
> > @@ -2385,8 +2385,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
> >  		memset(addr, 0, obj_exts_size_in_slab(slab));
> >  		put_slab_obj_exts(obj_exts);
> > 
> > -		if (IS_ENABLED(CONFIG_MEMCG))
> > -			obj_exts |= MEMCG_DATA_OBJEXTS;
> > +#ifdef CONFIG_MEMCG
> > +		obj_exts |= MEMCG_DATA_OBJEXTS;
> > +#endif
> >  		slab->obj_exts = obj_exts;
> >  		slab_set_stride(slab, sizeof(struct slabobj_ext));
> >  	} else if (s->flags & SLAB_OBJ_EXT_IN_OBJ) {
> > @@ -2402,8 +2403,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
> >  			       sizeof(struct slabobj_ext));
> >  		put_slab_obj_exts(obj_exts);
> > 
> > -		if (IS_ENABLED(CONFIG_MEMCG))
> > -			obj_exts |= MEMCG_DATA_OBJEXTS;
> > +#ifdef CONFIG_MEMCG
> > +		obj_exts |= MEMCG_DATA_OBJEXTS;
> > +#endif
> >  		slab->obj_exts = obj_exts;
> >  		slab_set_stride(slab, s->size);
> >  	}
> > 
> 

-- 
Cheers,
Harry / Hyeonggon
