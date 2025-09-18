Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC530CB22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204652; cv=fail; b=LIFX3UrlzFryXvLZk46jbfpuA7gHLdMwuoaVrBsHSB7VbMDWSWPEZeJ1u57J/yAydij+NHhAi6x28/J1cjokd45/0H90CEQGOXkwZdF+MfMcOHsk1o5dz+rhMtJxt0Qk+YXOtePPtGaPOk5JZPxy2WN6nFF+faeKIeFL2kMVFac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204652; c=relaxed/simple;
	bh=r+dElOj5wZY732T2BIKgHh7HzCmwSG9VvFIi0APRlcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uQns2KE72KJnEg8zN/03X980wLXCskLai+LYJ3NMwy3/kDOBAVQIKICaAPzb7sFizlEKa9prmw2/0JuF38/FPBYpR9ooWQYP7Qrn1K21DdiK8GT9CbQyDTGOqH5KwDySbs6ViZ6HLpoFj6Wc6FqpphQHAEm6xe6/VBxV8sxTDWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LvJ6EjNz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W/WB5ARg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LvJ6EjNz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W/WB5ARg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7ftX9008957;
	Thu, 18 Sep 2025 14:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PPISvt6vV6huRhgMX8
	jWlyecrOxFHvfeDF6ieDR+Nsc=; b=LvJ6EjNzii+JE5NSQKMFS/FdTH+MCXGroe
	uZ0gRQPFSUajXycvGFpmegEEodzRhQz5YH6+2BbUjrNqkXoO1T3uUOZ8Am+m9Njm
	r5Ft5PJg8oqeTS48311iQYT55I7C+gnq7HeUSWSngqHcfiEa8OiNIk2JV4c7LW1K
	Y7flQDZIzsWMGqVph0mgFtGq87/Az4xRtxC55Hl7OE9r0eZjgOLJkyYCnrCMGbDW
	uLFk9KWiDeXXCo+5jYtKF55UQVibV/s+MPI0YXzxXAxngdqkdAIgAtnRIAne32UH
	fkiyI3msyu9Jj21N64eB1ne7jCkmOBWDR+l74nD4b/ePWq2BcZzw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxbuk69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 14:10:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IDcbAF033680;
	Thu, 18 Sep 2025 14:10:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2f586m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 14:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScEGU72tTm/GX/VaVKQjd5EQX+CvhywKx2eMvUXYyn9Z9mnY1bMBBW/tDpM5u1h6G/nZ/jKr0WpUTqKiom4KmgltEUyll3++EjS9HCV+3b3u5P6qH4ybR62I8uEPZnEMwI6ZsxDI4uMF7Vqa7uiwctvqnsH+IWnYJ8qrFVoMUOlfNKV2aIB8j+K9l5yraIbjb3C0CvI7rAx4ISJ+T/q2e/Ba0X9of2FTd1Quz9xrF3TWfTkU/irLrG5Lh648sDKXDeSC0yBy8dN4wcymPA5kL0f7W7CxJqk1UZYbFue/hToNphkTBXCP4gJTK06XzXoXtVzSBFwrg8nYpxS2XY+8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPISvt6vV6huRhgMX8jWlyecrOxFHvfeDF6ieDR+Nsc=;
 b=svUcjYdGjaXT1Iaq6tq2OogGbrswOuTbyQx+ezdWVW2L/B2yvHm+diNkYYotJGyP2TD2RUMzDJCMjCWVlPnYK22chlMIg4jJ5uFmtlxjUUwearjW4Q8NlELyBHaFaNPd9h6MOkxfienLrpQkLKcs1T37u/mzxMi24D7IoL0YOSjoYn8y62IYRSULbueoS9JgFXWgwoBjteb0+3zbPibKpb3I61WWvXZeSCOb8IPtvMnxFyTUDUlfiWKsg48Nags3j2wuITLyc6UWzFe3u65IrWQsS+F0M2E4Y3nzeAF0Ul+NJoFYjPMW25jo//sbHE2A98bYEV8S4cw7GewmziFeqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPISvt6vV6huRhgMX8jWlyecrOxFHvfeDF6ieDR+Nsc=;
 b=W/WB5ARgXMZxaQvt5qIqwARWpa20wl8F1WmDdldGkVjVNcaxgJF7g1KQNcqxvr6l3BBEogk2pac7l/d2UAqMfSl3mRfmIFaQslv1kA5hYfAogoVeydkEwq3P9qLmBL9wWQTtQ+x9+ZO94CZc073WOZvpe+2DLhhjIfQ5XjJHqi8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4714.namprd10.prod.outlook.com (2603:10b6:806:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 14:10:25 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%2]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:10:25 +0000
Date: Thu, 18 Sep 2025 15:10:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
        minchan@kernel.org, david@redhat.com, Liam.Howlett@oracle.com,
        rppt@kernel.org, pfalcato@suse.de, oe-kbuild-all@lists.linux.dev,
        kernel-team@android.com, android-mm@google.com,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>, Jann Horn <jannh@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] mm: introduce vma_count_remaining()
Message-ID: <350a5951-94a5-4f49-b0d1-acadd4fcb60f@lucifer.local>
References: <20250915163838.631445-4-kaleshsingh@google.com>
 <202509170238.NUURxWPI-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509170238.NUURxWPI-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 994edc5b-6089-4542-e17e-08ddf6bd1d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FZIn7XzCxfiDPVcT5BRjI0A3UjBio5OWHKLjDkVB/XIURNne/Y7ffjiBrCDy?=
 =?us-ascii?Q?fwxGKmOfu2S0RxKGFkvYF15por1BSWOFavBHCaw9ZYLQ9P3hN2+lzTJ4yOFT?=
 =?us-ascii?Q?Lfu5esOxtzlYrbnUwVF/OM988i6XkS0UEM8FwzHyvmfUSnNjB3MwUeEhUsEd?=
 =?us-ascii?Q?oNoMhJx96hV0ENmPE8gOEmBL13fI68fb0FDnwZHbmCsdNPdtBgeDxAC6toPe?=
 =?us-ascii?Q?dmQ/nEbU0m3jvckPUn4t8RBLV5vhMrLKwu8M7vgOfyIKojZm20KBTKH+wkLp?=
 =?us-ascii?Q?3gsNOgWkKcZ7WqB040tFucqHz1ihWPpwJ6qEQau9r6IsGeVnbgyZhJWNNQ7e?=
 =?us-ascii?Q?y5XOhUkuoNrMaS8EBsnbVL9/TmExfZGBh4/RTzvf29mO6rvzk+gOxGxrdIj1?=
 =?us-ascii?Q?sWZfMZbthhDu9Oq9/R6lLavsw8+b3xKSCIH6ss3TNRS9/xfSxMWwufCz3AUX?=
 =?us-ascii?Q?pZVotfMJ3pAMJFqRKHYjybrPwMkVJ2XletIytBOXKSLmsXwpjxAx89S/htw/?=
 =?us-ascii?Q?thJ+BqO+8OMDVaw4KcyohrZiMgo6va7xvXOGiueIntD8Ht/WzG2pzWgyX1Y3?=
 =?us-ascii?Q?SvZfvtQwnxV5DtnNobkQJK5dUkdXw/zjQ/P2FUUlqV+qoeTN07fph5Fwste9?=
 =?us-ascii?Q?Ij2SRfdxA1k5HowwtpYFD2co/yc0NL3hMjcZWaWaZ9XYSXpdExU1B37CL5hH?=
 =?us-ascii?Q?Z3k+RreYh2whk5cz5QPjTbZxIcHefDzMmZ/Qj3QNSG2WiAWlzpyoYubPN8me?=
 =?us-ascii?Q?5mnioziUcJYThlYZwvdg7Y0kxTxZYJ4Mg2u/sqqKDHn7VgpjNeY7l1rAeyms?=
 =?us-ascii?Q?PJUG+Rz53eNKAQ3ImCH3vepoaE2ikOJRKdlGnmLkzN2ZYHmDaiQQXmwcvvY8?=
 =?us-ascii?Q?U/+fM7F5CE4hfiip6j3pP0WSHFrqOvRw2zIad+cpPAe1/FBiTCAbERgC5rbb?=
 =?us-ascii?Q?Y3QagL1S66huu2twT/YORcglugJCZlnceLpdtn1CCs4Ea1drs33NRde3daty?=
 =?us-ascii?Q?tNMtJa1ZIIihhACUTb5rf6LIaFM3zVV1Dj2rT3g22EWpqBwRT7VP4oI5+ZvD?=
 =?us-ascii?Q?pvZq8wc5PfkcnzlpWX/Cv7e0KrDTJsCSTtFWigNcT0bncvmC6BrPEhl0ydfK?=
 =?us-ascii?Q?QQsjkW4i2ksJaN+Zj8K0sH/RJY/9O/mZXOX4TKR+dTltEL30lhChqgUboF3P?=
 =?us-ascii?Q?Po956y7LIrCar2GrOCENb8IDGZlGUDXmCFWeLMsq0NSwIUAwJEaallGQve6a?=
 =?us-ascii?Q?vjvk2PFOQWxvJ3UccFucMFGOJ4W/iLk+lZPQkTo/p0OeYNqSpBfZfduJVHM9?=
 =?us-ascii?Q?1zBXTlNABYK9JU2MlBwg3U3uR/dmvWJIyYVa0ruKIE4QcyKRendHHEYM76U4?=
 =?us-ascii?Q?kj/FRT47OvKJFtZRwdfda/EHFIs/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BG+71agEuVdcZSu21Zk9Hb/NdmBrZOrU2eaIpCgMM6SBDsfrhZA9xnVjrwkJ?=
 =?us-ascii?Q?1vEWbHSqSLCx5gE/oO2XPmR8y4EJY1EOzkKdrdbJsyP1ECzECG7ohJRFTS5H?=
 =?us-ascii?Q?9dCI1sWmX09SOffnup0S1iB7SoKFiQj7ieoT8MmQsZ+bX+QsvrDo3QgpDr9o?=
 =?us-ascii?Q?U51S9WXvBiQ+ilGsEBFkFviLs+wP3VA1xEhQVbHUqfDPd/Hwv/JfQeDjLRM2?=
 =?us-ascii?Q?YV4h/yIQ/JG7RxHs+/DAzze7iZVKg2ecKg+AhxUTL737k4FmEbHT/NJYwegB?=
 =?us-ascii?Q?0/llpsgFqPvs5BhfoYKkYMyuH+5NF/c/27qfoASeqSpFbzIgwH4jXgtXSAXa?=
 =?us-ascii?Q?K44at3ONx9u5w6J2BitSX/yUccHlljvJ6DziocHddMquXPFXmogHOYKqrMjM?=
 =?us-ascii?Q?6jPP+vcbh7zvNUXpvlXsn6Ip1lTYVuQbWzxGRLVoamogliXkithO22WOfSlU?=
 =?us-ascii?Q?xs6ntfrGyMrEOsoPcopgHiFK/kArS+7qFj2penpSMRjFAGHwmJnxpctO+Q0Q?=
 =?us-ascii?Q?3sQxovFHXlGu/vewh0thDl9hJ+eaGS7dHhFJcUVNGbt+gQqQT3QCdeKxHbCf?=
 =?us-ascii?Q?vRK4qzdqZWIj1HHpTuB0FozRsSph/orSCPOj7NPFdlev/COl5NfEuzPkN+PS?=
 =?us-ascii?Q?7Vo4d1pcEeFEdPd3XVw8CZ7JtkIy4cjZlbF3FcW2CE+COvjAl6OZ0c7biMeI?=
 =?us-ascii?Q?lwSVxlDnbMrnjsqmhWPbNBNnd2c7MTDvKn7jCc+mJenlJV7PgKUgEh35+NAs?=
 =?us-ascii?Q?8b/pzclzevCwS7CbSDH6cBLwYCanNtkJXIb88j4JWhGd8k0Fgl1/4AXvkr08?=
 =?us-ascii?Q?YEq/LLYH3rHwzI4rvlLMyVBtJCVQGdCW/dBLpE3FxSJApSZKktHQPXYfvizp?=
 =?us-ascii?Q?x1cqv5mIcLcALdNEpNsP0HxYN4sCOp6mdARJEecLDmHijZZYHkCUZx/QkAqU?=
 =?us-ascii?Q?URu3PqfRbSO/Dp/I5CoAgtA4wFLSgX+yRfyAv9WGQtDqxfoX+T9kI2c0hIj1?=
 =?us-ascii?Q?vVaFyMZzqQd3+q8f1biXjyQndbdntV2pY/IAct0diBX2kCVLO2vMeH0n/KFU?=
 =?us-ascii?Q?6pynZ+l7g4n6FLKH3ObjWWpotlGYsbf+w/U5BOSIW38Pn49lLa9HHAKdV0my?=
 =?us-ascii?Q?p2kzVrA7y0pzcr7/Z28hyLH6jtwYRSjh1RR2ytHl8rXEk8W+PQ5Nlp7Y9YfN?=
 =?us-ascii?Q?qChGZz/49SVGzyTOP0acajD5gK2r/uI4JuQLkLvIPYhJdUQFBW/3MiQ5mxAI?=
 =?us-ascii?Q?/MUP+SuJI42zcZiLLDNEOtmM98o/T5wntnfRnrbValxej3tVBE9HkzBpnJBH?=
 =?us-ascii?Q?sRM9yNvSzdR9mvaDRc4C4//iCMnBZqdc/OXA06jXLmi3INhoaKKvPhH0xxjz?=
 =?us-ascii?Q?LeAF8roG3ih0DzUtxwqSRuMiQM7Zs/ZR0hYQ9qlZ+WR2PSJCKgGnOWodYg6K?=
 =?us-ascii?Q?ia6GfXNmmzKsYVwudmcmmEUMmQObwiTMrOWL8vwBK1HCgMCxOU2KFz2o6Mv/?=
 =?us-ascii?Q?KF6TEIWUqZlEwhQlUceEyhSWoW+NSsNXlBjNK9UUga2cAfxfxpucvu3zGUSg?=
 =?us-ascii?Q?5oOWnRPAke4uCvd3s9JrvGvwwqwu3LQHWicxDnxuH+KKEicpxl8K7QQCn+xr?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4iSisa2VkiYba6deHZ7fPvDbs5Qal2ezuDnicQabGvII4IuE+obrD2BEuUki3W4Vqwjr1rEHyX2iAvaEVLJhZBBWn9ei3RS+hq2v4/P8fN17J9/Fj9rCSH2IFH7IhEnxwRTiJF2d1FUvPRSNr+EUiuspYxT5xtqidiQySlQMGAFwtD8AAfDeGkqun4xVbutpCQAeNbB67/PZvULKg8IOoDqEK1rydWl9p1JnqEfugnySiarARXTTPb/qwJP3l6lmM3KqJXT6M/iOHCYdYFSTNpcKFPwBCD3iFongIKPhPl5p9qawpnZfFQ5YUBdVLynAo1zXMe4jXbH/fLYR/+vK+4d2VsrNcoVY+I7VDPni73JR2iasN8WmqgxLX5KCRbH+EzM7vXMmcUrizMlO6ePyzfiRd6+EEtO0FO3l/I1ysWe2ty5pLpYCmqwnGWutvAJ3A8eqTGda0sAXwQRZ69Gon9Odroon1m3jtWPyixZHS6OlbRF9oAF1f8tlMipEmSxrVjMLFMJoxJ06IjahId/VTc23KC7q3UkcrC+VDWHsuh/p9hmVxylYlW/cSpzoH2ooyyI0LmR7P0ZJndRz9ylyAXmQj4fm8+K8vEdxHscRMV4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994edc5b-6089-4542-e17e-08ddf6bd1d1a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:10:25.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5I3W0hGrGFkX0uSuiFpJoj9KEI87Be/9a9gu4Hk3CRvB3dNkvhFjXzsMsfInoPF1W9klEaJrhsRQb3xnUQlevH0TpDuQ3Kw78lEYi7BjmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0Z0OaVLJoH2Z
 d2H83HPVNK9QXiEdhAj6IjDl4Jlt0b7q9TjpVksR41nqmsgLQRrDQFH/CCq7QrEgcxJMQ+N7N4V
 324od9mJD+U37l8ig/LANI2bdlQzj2LlfFasX1TmzY3M6ppyGx2RvH3WEvfa7jCg2kX8D5P9nOC
 P58dnL8gh5fsVBuDIjdiDgCEKMqoWC7t99gn+IaN2lY33S9xhxRf6hiwqvtdlwJujZRZT4zAZIF
 PfN4n9CwDfgjG7y+e0Z+6aclY7DqObmgQxODvHVsBj2t8TkCAzPGMLaKoQanNqjjVzp5n6bcaHT
 Oq4BPepx3+3jKY+1ZzGuh/ps0OsTbtRTemC2TEOwifrL8TQx21ZiiwkNOWde9QqatdvG6HpeTBl
 qh4hHZzr
X-Authority-Analysis: v=2.4 cv=X5RSKHTe c=1 sm=1 tr=0 ts=68cc12d8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=sxA8Ggr_i1lCkNF3pzgA:9
 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: 0rtmoHkCEzbAe21G5k3tUVw_lioJDjPA
X-Proofpoint-ORIG-GUID: 0rtmoHkCEzbAe21G5k3tUVw_lioJDjPA

On Wed, Sep 17, 2025 at 02:33:46AM +0800, kernel test robot wrote:
> Hi Kalesh,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on f83ec76bf285bea5727f478a68b894f5543ca76e]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-fix-off-by-one-error-in-VMA-count-limit-checks/20250916-005018
> base:   f83ec76bf285bea5727f478a68b894f5543ca76e
> patch link:    https://lore.kernel.org/r/20250915163838.631445-4-kaleshsingh%40google.com
> patch subject: [PATCH v2 3/7] mm: introduce vma_count_remaining()
> config: s390-randconfig-r122-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170238.NUURxWPI-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170238.NUURxWPI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509170238.NUURxWPI-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    s390-linux-ld: mm/mmap.o: in function `do_mmap':
> >> mm/mmap.c:377:(.text+0x6566): undefined reference to `vma_count_remaining'
>    s390-linux-ld: mm/mremap.o: in function `prep_move_vma':
> >> mm/mremap.c:1043:(.text+0x199a): undefined reference to `vma_count_remaining'
>    s390-linux-ld: mm/mremap.o: in function `check_mremap_params':
>    mm/mremap.c:1820:(.text+0x4044): undefined reference to `vma_count_remaining'
>    s390-linux-ld: mm/vma.o: in function `vms_gather_munmap_vmas':
> >> mm/vma.c:1348:(.text+0x8ebc): undefined reference to `vma_count_remaining'
>    s390-linux-ld: mm/vma.o: in function `split_vma':
>    mm/vma.c:595:(.text+0xa2a2): undefined reference to `vma_count_remaining'
>    s390-linux-ld: mm/vma.o:mm/vma.c:2775: more undefined references to `vma_count_remaining' follow

You've accidentally put vma_count_remaining() in an:

#ifdef CONFIG_SYSCTL

block, which this config doesn't have:

#ifdef CONFIG_SYSCTL
#if defined(HAVE_ARCH_PICK_MMAP_LAYOUT) || \
		defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
int sysctl_legacy_va_layout;
#endif

static int sysctl_max_map_count __read_mostly = DEFAULT_MAX_MAP_COUNT;

/**
 * vma_count_remaining - Determine available VMA slots
 * @mm: The memory descriptor for the process.
 *
 * Check how many more VMAs can be created for the given @mm
 * before hitting the sysctl_max_map_count limit.
 *
 * Return: The number of new VMAs the process can accommodate.
 */
int vma_count_remaining(const struct mm_struct *mm)
{
	const int map_count = mm->vma_count;
	const int max_count = sysctl_max_map_count;

	return (max_count > map_count) ? (max_count - map_count) : 0;
}

...
#endif /* CONFIG_SYSCTL */

So you should move it out of here and that should fix the kernelbot report.

Cheers, Lorenzo

>
>
> vim +377 mm/mmap.c
>
>    276
>    277	/**
>    278	 * do_mmap() - Perform a userland memory mapping into the current process
>    279	 * address space of length @len with protection bits @prot, mmap flags @flags
>    280	 * (from which VMA flags will be inferred), and any additional VMA flags to
>    281	 * apply @vm_flags. If this is a file-backed mapping then the file is specified
>    282	 * in @file and page offset into the file via @pgoff.
>    283	 *
>    284	 * This function does not perform security checks on the file and assumes, if
>    285	 * @uf is non-NULL, the caller has provided a list head to track unmap events
>    286	 * for userfaultfd @uf.
>    287	 *
>    288	 * It also simply indicates whether memory population is required by setting
>    289	 * @populate, which must be non-NULL, expecting the caller to actually perform
>    290	 * this task itself if appropriate.
>    291	 *
>    292	 * This function will invoke architecture-specific (and if provided and
>    293	 * relevant, file system-specific) logic to determine the most appropriate
>    294	 * unmapped area in which to place the mapping if not MAP_FIXED.
>    295	 *
>    296	 * Callers which require userland mmap() behaviour should invoke vm_mmap(),
>    297	 * which is also exported for module use.
>    298	 *
>    299	 * Those which require this behaviour less security checks, userfaultfd and
>    300	 * populate behaviour, and who handle the mmap write lock themselves, should
>    301	 * call this function.
>    302	 *
>    303	 * Note that the returned address may reside within a merged VMA if an
>    304	 * appropriate merge were to take place, so it doesn't necessarily specify the
>    305	 * start of a VMA, rather only the start of a valid mapped range of length
>    306	 * @len bytes, rounded down to the nearest page size.
>    307	 *
>    308	 * The caller must write-lock current->mm->mmap_lock.
>    309	 *
>    310	 * @file: An optional struct file pointer describing the file which is to be
>    311	 * mapped, if a file-backed mapping.
>    312	 * @addr: If non-zero, hints at (or if @flags has MAP_FIXED set, specifies) the
>    313	 * address at which to perform this mapping. See mmap (2) for details. Must be
>    314	 * page-aligned.
>    315	 * @len: The length of the mapping. Will be page-aligned and must be at least 1
>    316	 * page in size.
>    317	 * @prot: Protection bits describing access required to the mapping. See mmap
>    318	 * (2) for details.
>    319	 * @flags: Flags specifying how the mapping should be performed, see mmap (2)
>    320	 * for details.
>    321	 * @vm_flags: VMA flags which should be set by default, or 0 otherwise.
>    322	 * @pgoff: Page offset into the @file if file-backed, should be 0 otherwise.
>    323	 * @populate: A pointer to a value which will be set to 0 if no population of
>    324	 * the range is required, or the number of bytes to populate if it is. Must be
>    325	 * non-NULL. See mmap (2) for details as to under what circumstances population
>    326	 * of the range occurs.
>    327	 * @uf: An optional pointer to a list head to track userfaultfd unmap events
>    328	 * should unmapping events arise. If provided, it is up to the caller to manage
>    329	 * this.
>    330	 *
>    331	 * Returns: Either an error, or the address at which the requested mapping has
>    332	 * been performed.
>    333	 */
>    334	unsigned long do_mmap(struct file *file, unsigned long addr,
>    335				unsigned long len, unsigned long prot,
>    336				unsigned long flags, vm_flags_t vm_flags,
>    337				unsigned long pgoff, unsigned long *populate,
>    338				struct list_head *uf)
>    339	{
>    340		struct mm_struct *mm = current->mm;
>    341		int pkey = 0;
>    342
>    343		*populate = 0;
>    344
>    345		mmap_assert_write_locked(mm);
>    346
>    347		if (!len)
>    348			return -EINVAL;
>    349
>    350		/*
>    351		 * Does the application expect PROT_READ to imply PROT_EXEC?
>    352		 *
>    353		 * (the exception is when the underlying filesystem is noexec
>    354		 *  mounted, in which case we don't add PROT_EXEC.)
>    355		 */
>    356		if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
>    357			if (!(file && path_noexec(&file->f_path)))
>    358				prot |= PROT_EXEC;
>    359
>    360		/* force arch specific MAP_FIXED handling in get_unmapped_area */
>    361		if (flags & MAP_FIXED_NOREPLACE)
>    362			flags |= MAP_FIXED;
>    363
>    364		if (!(flags & MAP_FIXED))
>    365			addr = round_hint_to_min(addr);
>    366
>    367		/* Careful about overflows.. */
>    368		len = PAGE_ALIGN(len);
>    369		if (!len)
>    370			return -ENOMEM;
>    371
>    372		/* offset overflow? */
>    373		if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
>    374			return -EOVERFLOW;
>    375
>    376		/* Too many mappings? */
>  > 377		if (!vma_count_remaining(mm))
>    378			return -ENOMEM;
>    379
>    380		/*
>    381		 * addr is returned from get_unmapped_area,
>    382		 * There are two cases:
>    383		 * 1> MAP_FIXED == false
>    384		 *	unallocated memory, no need to check sealing.
>    385		 * 1> MAP_FIXED == true
>    386		 *	sealing is checked inside mmap_region when
>    387		 *	do_vmi_munmap is called.
>    388		 */
>    389
>    390		if (prot == PROT_EXEC) {
>    391			pkey = execute_only_pkey(mm);
>    392			if (pkey < 0)
>    393				pkey = 0;
>    394		}
>    395
>    396		/* Do simple checking here so the lower-level routines won't have
>    397		 * to. we assume access permissions have been handled by the open
>    398		 * of the memory object, so we don't do any here.
>    399		 */
>    400		vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(file, flags) |
>    401				mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
>    402
>    403		/* Obtain the address to map to. we verify (or select) it and ensure
>    404		 * that it represents a valid section of the address space.
>    405		 */
>    406		addr = __get_unmapped_area(file, addr, len, pgoff, flags, vm_flags);
>    407		if (IS_ERR_VALUE(addr))
>    408			return addr;
>    409
>    410		if (flags & MAP_FIXED_NOREPLACE) {
>    411			if (find_vma_intersection(mm, addr, addr + len))
>    412				return -EEXIST;
>    413		}
>    414
>    415		if (flags & MAP_LOCKED)
>    416			if (!can_do_mlock())
>    417				return -EPERM;
>    418
>    419		if (!mlock_future_ok(mm, vm_flags, len))
>    420			return -EAGAIN;
>    421
>    422		if (file) {
>    423			struct inode *inode = file_inode(file);
>    424			unsigned long flags_mask;
>    425			int err;
>    426
>    427			if (!file_mmap_ok(file, inode, pgoff, len))
>    428				return -EOVERFLOW;
>    429
>    430			flags_mask = LEGACY_MAP_MASK;
>    431			if (file->f_op->fop_flags & FOP_MMAP_SYNC)
>    432				flags_mask |= MAP_SYNC;
>    433
>    434			switch (flags & MAP_TYPE) {
>    435			case MAP_SHARED:
>    436				/*
>    437				 * Force use of MAP_SHARED_VALIDATE with non-legacy
>    438				 * flags. E.g. MAP_SYNC is dangerous to use with
>    439				 * MAP_SHARED as you don't know which consistency model
>    440				 * you will get. We silently ignore unsupported flags
>    441				 * with MAP_SHARED to preserve backward compatibility.
>    442				 */
>    443				flags &= LEGACY_MAP_MASK;
>    444				fallthrough;
>    445			case MAP_SHARED_VALIDATE:
>    446				if (flags & ~flags_mask)
>    447					return -EOPNOTSUPP;
>    448				if (prot & PROT_WRITE) {
>    449					if (!(file->f_mode & FMODE_WRITE))
>    450						return -EACCES;
>    451					if (IS_SWAPFILE(file->f_mapping->host))
>    452						return -ETXTBSY;
>    453				}
>    454
>    455				/*
>    456				 * Make sure we don't allow writing to an append-only
>    457				 * file..
>    458				 */
>    459				if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
>    460					return -EACCES;
>    461
>    462				vm_flags |= VM_SHARED | VM_MAYSHARE;
>    463				if (!(file->f_mode & FMODE_WRITE))
>    464					vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
>    465				fallthrough;
>    466			case MAP_PRIVATE:
>    467				if (!(file->f_mode & FMODE_READ))
>    468					return -EACCES;
>    469				if (path_noexec(&file->f_path)) {
>    470					if (vm_flags & VM_EXEC)
>    471						return -EPERM;
>    472					vm_flags &= ~VM_MAYEXEC;
>    473				}
>    474
>    475				if (!can_mmap_file(file))
>    476					return -ENODEV;
>    477				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
>    478					return -EINVAL;
>    479				break;
>    480
>    481			default:
>    482				return -EINVAL;
>    483			}
>    484
>    485			/*
>    486			 * Check to see if we are violating any seals and update VMA
>    487			 * flags if necessary to avoid future seal violations.
>    488			 */
>    489			err = memfd_check_seals_mmap(file, &vm_flags);
>    490			if (err)
>    491				return (unsigned long)err;
>    492		} else {
>    493			switch (flags & MAP_TYPE) {
>    494			case MAP_SHARED:
>    495				if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
>    496					return -EINVAL;
>    497				/*
>    498				 * Ignore pgoff.
>    499				 */
>    500				pgoff = 0;
>    501				vm_flags |= VM_SHARED | VM_MAYSHARE;
>    502				break;
>    503			case MAP_DROPPABLE:
>    504				if (VM_DROPPABLE == VM_NONE)
>    505					return -ENOTSUPP;
>    506				/*
>    507				 * A locked or stack area makes no sense to be droppable.
>    508				 *
>    509				 * Also, since droppable pages can just go away at any time
>    510				 * it makes no sense to copy them on fork or dump them.
>    511				 *
>    512				 * And don't attempt to combine with hugetlb for now.
>    513				 */
>    514				if (flags & (MAP_LOCKED | MAP_HUGETLB))
>    515				        return -EINVAL;
>    516				if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
>    517				        return -EINVAL;
>    518
>    519				vm_flags |= VM_DROPPABLE;
>    520
>    521				/*
>    522				 * If the pages can be dropped, then it doesn't make
>    523				 * sense to reserve them.
>    524				 */
>    525				vm_flags |= VM_NORESERVE;
>    526
>    527				/*
>    528				 * Likewise, they're volatile enough that they
>    529				 * shouldn't survive forks or coredumps.
>    530				 */
>    531				vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
>    532				fallthrough;
>    533			case MAP_PRIVATE:
>    534				/*
>    535				 * Set pgoff according to addr for anon_vma.
>    536				 */
>    537				pgoff = addr >> PAGE_SHIFT;
>    538				break;
>    539			default:
>    540				return -EINVAL;
>    541			}
>    542		}
>    543
>    544		/*
>    545		 * Set 'VM_NORESERVE' if we should not account for the
>    546		 * memory use of this mapping.
>    547		 */
>    548		if (flags & MAP_NORESERVE) {
>    549			/* We honor MAP_NORESERVE if allowed to overcommit */
>    550			if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
>    551				vm_flags |= VM_NORESERVE;
>    552
>    553			/* hugetlb applies strict overcommit unless MAP_NORESERVE */
>    554			if (file && is_file_hugepages(file))
>    555				vm_flags |= VM_NORESERVE;
>    556		}
>    557
>    558		addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
>    559		if (!IS_ERR_VALUE(addr) &&
>    560		    ((vm_flags & VM_LOCKED) ||
>    561		     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
>    562			*populate = len;
>    563		return addr;
>    564	}
>    565
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
