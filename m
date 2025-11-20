Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D731E766E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642735; cv=fail; b=s7/pf1RUdM5GEeQhCoy3ZOj6lVdWwGTAm5ozAwMg9wqo8pow2vug5vPMeT4B/9iIIVygWmrTIoFDUlXmlLpSdU/oXlvvRixSEgECOlAwdzKxZUNlTQbrQfWodGprEzQPCYJSubzszmKXLDNrJnLVNvwZ/H3w7APWkwqbiv7uvQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642735; c=relaxed/simple;
	bh=1g/3QhjGY2ZVxz847sWql6lP7L7buhD2ZfxFIgyA/sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7DQfGoWen7Wtx4/OsL4LsAGVpAkZ0V5jqKo8dVPKmJdV5kqG2NRbCEcAbfU4rcaDPOcdmtCkviA30Kw/Yz37W7gvbHJQ3Hd6dRfcAl52DIEzL3TReL1cpOHTvHwehooqwccXpR+I/y/k3pqSsvWMo6GNSR9V75ZzmAwDxzNAXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pF9bhbSt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VdaUn9MZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pF9bhbSt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VdaUn9MZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609Va460858;
	Thu, 20 Nov 2025 06:45:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yqbmgjfcvUzV1Fd6Fz
	1yLYpmXXWakjqdYUefvhNrC28=; b=pF9bhbStCjxhEp76pM/W5zyV/JRYV03LTD
	HTDxRS3mH4O9x2zZZBRmUMV+A3N2nZn+VSAWBwXw8lfnZOCFwi++Yu2U8217QZdG
	7Snr9xPFR5amg3RLbGS2EQVfk6c0q4IUGxjqb5ZGrb4PqbM3gXxMmMVPyLcW301A
	LsBCqDmXpmiyAgWnBMO0PdbiLFLAhw0bNHdOxWzCjxw85o2jEkuar8yUfRTvSJFj
	79/v0KDM8uQ40CzPlxAYElvggnWxinG6voSKSu0CHaoT0qGD1XtIfrGvx+LNDstd
	pjc8lbFdyLZsgQgH7d/Vrvw7SrnfmTy0ki5iNvFcsxvBESp9vKrg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023097.outbound.protection.outlook.com [40.93.196.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1edu2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:45:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piNldvmvO9Ggb6HlvVuu4ooSECXSw6PqyqtrD4f3HZgBcib/uN+u1Ieu6gf3YtzCvNCIuW3kBQnkyuQaqqMwUqbRnKxpuo0ynvIhtT95ciD8V0O8kUw87rK1ZnDTWnESU3UJnuIxrj9BTzJDmuc2zZefDwy6lohdq9ytkF+76I7RloU+K+TN9A9fXb7l24B/rqt0a6b/EJ3a4pDBDijIB35v2l/q+xWq34KQMhvp7NGVMbS/gkzO9Ev4sd9ia6y7Pa74ANEQDLWg/ekCkx94SjkJ8JcaqJUn+gWxPveQPIBOEuUK+gmHtyA5QJxK1XBDcx48joeEy+swXh3SLSGRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqbmgjfcvUzV1Fd6Fz1yLYpmXXWakjqdYUefvhNrC28=;
 b=qnQPYqONZMFwAxGafVeEMOkTn01eN3QGAMGwx2o093b7wv98CI12xZJNFKcJjPcoIQ3cA/yBx5WDO2vmwtel60U8JfQQtkWae88ia+XPjXXVYGWlu5YpFTF3zWEqasPZL5zMKYqz/Em11bxKsoJyWt1EWBooMcuIidhtu+p/XQ6QfFVnpjoz0U4o5MBUnlDdI5Jj5dgY98MlvQ9+lWRLbr1wep7f07UUj5gOjSLFaP/wyrakQ+nnoTRb9or1b0fsa3DU9S5jKGy77OkE9TC61+Dm4/PuqHwN1Zu60BRIU4EScKZUa5fOx4yiPc+eWtIEYaJIZB/JqHkoSbH3/kCq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqbmgjfcvUzV1Fd6Fz1yLYpmXXWakjqdYUefvhNrC28=;
 b=VdaUn9MZ85NCGJmDEXy1MmZMgfcnyw30S4PBurNOVXQVQIj1As2E2HBRflfSFWX8NMQPZAfOI/q1z6JlhxGghXfuMMjBexr8s6CUomaCL6Wi3e1KhTMMv6UacUsuI2RktWPISXURD6jPswbrZLwuUXG6KdKrv4u1M+lAYP+4rUo=
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by CH2PR19MB3766.namprd19.prod.outlook.com (2603:10b6:610:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:45:26 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::bb) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 12:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 12:45:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5A29406547;
	Thu, 20 Nov 2025 12:45:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B8EF6820247;
	Thu, 20 Nov 2025 12:45:22 +0000 (UTC)
Date: Thu, 20 Nov 2025 12:45:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re: [broonie-ci:v3_20251106_ckeepax_add_sdca_class_driver 321/322]
 sound/soc/sdca/sdca_device.c:36:6: error: redefinition of 'sdca_lookup_swft'
Message-ID: <aR8NYUcl9P+GuMCr@opensource.cirrus.com>
References: <202511202007.Fn4sbBus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511202007.Fn4sbBus-lkp@intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CH2PR19MB3766:EE_
X-MS-Office365-Filtering-Correlation-Id: 72781d02-8c3f-4ced-cc32-08de2832acc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lrStCspC2DceOLPYaaeY41DKCSt9998zEaQjj0pWT+kYto252wceIlibhy31?=
 =?us-ascii?Q?DRz2spUQ4IKYuTBkDacMHFQHRqOQW7wEyutIikJawVM5JZlSnD85zF/3vzax?=
 =?us-ascii?Q?iiMnXyhwU5u1Sehc1hv6QQAsjblY6ZDBBgUXWN3WBnjjs3hPQjw84B+yXleQ?=
 =?us-ascii?Q?R79t7mLEJF/IgBmMm02kCoiJux30GCQHNMasIpBxTmqDgARwpKgo8eboF/W/?=
 =?us-ascii?Q?2niSwS6kZwUv9bvDrEi57uz9Po4ESGldSFs7m5Wk6SjX/VLoDgfP8EDKO6Ml?=
 =?us-ascii?Q?gajLj85KHqixKilFkdHaFog8GU+pohdVW7Kzsk6x5PODwzBclmS5S3yyPW5e?=
 =?us-ascii?Q?w1ywlvEnmioxYcFTi1+29EbWDOogDdLT1T7EDIVePobj3agCkWFgPJlBkxz6?=
 =?us-ascii?Q?t73q5z25mvPHJuY+siz8kkUe9HGimTPt45N33qYZ7NtJtOmTmD5bG7n9tsA8?=
 =?us-ascii?Q?J6d63N2ioNN1eT7NgtAoB6OYopJ7GcOH2c5Lcar4CJZ22dIR5x8ik2pjHJAP?=
 =?us-ascii?Q?BQT8VHPBKwhog5Dn6JuwO+Y7VR8P/3cxmvPaQI/7wFRl24M4+K0e9GdekiAv?=
 =?us-ascii?Q?1tu2BcBPMhG5Nb+rIAs4bBdTXu3WtmKrrikQafuKC2RY/sp1hmRxHFd3wd4q?=
 =?us-ascii?Q?PoPF3UqmwycvlgQkYFacr4C/md68a7VcV/fWXdecxuZ2TM041loUiwLnkZSL?=
 =?us-ascii?Q?AvjgOO/u2lXLxo2HGUpIw867vHTF7SaPn2zC+rK5O4Ml1yI+5om2IZ0EfSPy?=
 =?us-ascii?Q?feCcn5VZgaIpwC7G5eTcggZxgo/TD6HapcI6Rh36icok4l2XqkEQqVMjULis?=
 =?us-ascii?Q?orWkf2mXfGRcEGdErRmCnR09+ejghdl+d99Dh57PUXRQQcdrBdY2f1ZuMKrd?=
 =?us-ascii?Q?BckflAU1Ey8b7GhC2hvKqwbXxmpP0gPiRF6C6tw+vnAauiMhr35GbYNf9Wwy?=
 =?us-ascii?Q?pzDnVUsJ3ejs53tcWxFn1/M5jL3XDr+DbGoo+UnNvbNuh9tJp0pitflD1VQX?=
 =?us-ascii?Q?nTj2roZcap6LJPqTCan9W48ly/+gqpx3Q8x9IpPkEeJ41OCJf0TMMAdPVZ2v?=
 =?us-ascii?Q?TgmuLdpKYaZ51kJ0SqMd/GT/Btzic2xY00IlHuz2hha7SLoBbeRTgqtJ6sRU?=
 =?us-ascii?Q?3Ub+WELDChBF4O00DwpGV63En6aw8t8Tpydkd4rcpnO6RfbpQYscp3OyXCZT?=
 =?us-ascii?Q?gGVeu0lb2uLIgMXWfzAi+zL3eszScNCahLf+InzuOIwnxc2F2B0Qb4AN5Bsh?=
 =?us-ascii?Q?O/p2g29Hu6j2eLsLFwBXhgQPtLGMuOUv9ZMMp2tZyAQPFksDto0gVKK7qqHV?=
 =?us-ascii?Q?jkdk7GYg4+UI9oBfHbP0jS3d/vG6f9r/+8y7v1omMkC49QTiCvLjPpcOOULa?=
 =?us-ascii?Q?SJl6umQxyWKDq73Xu3PrCGkzhysVnrMht6vaQusNMJOWSOaRLArRYjH+WWuP?=
 =?us-ascii?Q?XmeAGnvIo8VEbw/qALUud7Ze4m9txJ69w8eoKS/HOyZqdIiI0O7ZowBO+Z94?=
 =?us-ascii?Q?DQPEBIKQ8XzCoPXSocCfYnOMq2rqt4VaD6Y9FiGU4YDOFIe4J/tGKjEgbRjl?=
 =?us-ascii?Q?yw+8a0JbndXnTGSr2ns=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:45:24.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72781d02-8c3f-4ced-cc32-08de2832acc3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3766
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f0d6a cx=c_pps
 a=QAHxjCOqNlPon7uSvhmcVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=43AVKsslBkRamlCSAisA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: 3F48uAUHdofEit8P75pKNHc6njZ-JXz3
X-Proofpoint-ORIG-GUID: 3F48uAUHdofEit8P75pKNHc6njZ-JXz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4MSBTYWx0ZWRfXymw6gM3v48tJ
 IjI4hTdHEWemgcDPZW0dn/OVw6JZzcv/AEGzrwCFDu3fSNGJ++fcoHAxq5p1wMW/7wX9VdpABbB
 lyH3Gep3TklQ6bCNXdOtqYp0WLRbqjfCRKaaxtVeG8CWROVNzY4JYIEhoCp1g4u6nF7L++Vtjl7
 DV1RlYELhd4w2WRXKpsadLVGo3Z7V0xDrzhbUf2HsSRcgIZL6m5hZd2I55H5BYdB4VA789z50co
 ISIfCFkWrB30MsynfdiVsL4z1iHuzc4AT2OxI80zrqgI5rBaH/tO8J3zBT8Emcjvm25rncJ0bZ8
 LJxZig4pCh7e6rE0SgAyYFL4XcZuaEyYKYMA9x6baXPovxqBDmcarnqx0QdimQ41WuMCRhijmso
 2pstx/Msbi9Ldfk3tkLG5vb8SbSHXQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 20, 2025 at 08:21:11PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251106_ckeepax_add_sdca_class_driver
> head:   782a3359140a882c5593256c7a8b1496ef50ec56
> commit: a9afd4638fa2ae315e93079521388fb7421a5781 [321/322] ASoC: SDCA: Add basic SDCA class driver
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251120/202511202007.Fn4sbBus-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202007.Fn4sbBus-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511202007.Fn4sbBus-lkp@intel.com/
> 

Yeah this and the other one are both caused by the class driver
selecting SND_SOC_SDCA, thus the dependency on ACPI gets ignored.

Thinking I will swap that to a depends but will do a little
testing hopefully get past my frequent blind spots for Kconfig.

Thanks,
Charles
