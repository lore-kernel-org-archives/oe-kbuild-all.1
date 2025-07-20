Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FE12E7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753002058; cv=fail; b=EfdZs44GkHByj/YFW+oCYuYTLRCeKRvWIUBeo9RMMblOG52ISWttboc8FqEnwdMbRVZtclfRHjuSgQf0FxQNWDxpYlYneQ/pMuycMgzfFEs42jqV3LUpn5YX+bC/7WcHK5Uh7TIDgGYQtENSIFMiwAkEbWzW9ehE1+STwyT/+do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753002058; c=relaxed/simple;
	bh=eubKE73z8TUrCQco3Pu0DPEWAiv6u2QMCVmdVeLPvpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VV4wRHHVMAWdrR/AmdbXT0UFF2NQ7bU9P7YnHxwS/5Mb/20Sgtnzk+c71I1SsPy+doBZUi5tcTnjWQsg8DGZdu9uE9nRSm4Befs1FUjAQ02LkwWhopplNH/2oRbe9+Z23c1hVByzQOmiIE0hrQJwD/19xtWlD4sgAaA+MXBAGSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n6AIJzta; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ybi/l8rB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n6AIJzta";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ybi/l8rB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K4NUoB026832;
	Sun, 20 Jul 2025 09:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dAeJUH99yEu+ElicTx
	1XFxrzXM/oSm3E0LMnDPNCd4k=; b=n6AIJztayws/GQwudfGegSwE8u8TsbLi/X
	SOX4Pi4r9GZzCMU+j0wfkF2ztB+EcvlXRIYAfHe1rtPtholTZnjsiExNW0Nq3PjV
	BJaEPp6L3MfQb8Bx6yeN6piwNTmH/Lf9Vq5z3mYIynVUhm6DxA5xRHGMkQTuh4am
	E8avlx479LYv1JIl/t4SRlvNmfJJCokT2czuVtoBDpzQlZZlwCDmEeVkU8hboLFL
	rE0L35s0WXKBY7OkfbMzNMFfZk0JhfLhNgOsX51oCgIbjAvFM766ri6Z6lTvHVUU
	GAR/9K/281CRgXIkrxI6nFjsMfifYS9dC2fS9hWMpKLCYQQ3vBwg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hp940m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Jul 2025 09:00:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5UEbo006053;
	Sun, 20 Jul 2025 09:00:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t738ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Jul 2025 09:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxhkowOZJqgOobL4fOv8NLbGKqiWMX1ROpuZZ8wYEXZ9WfoprDzfGlnMsYTgj0C1Nr4AfehtQgZygD2abXLTOjbRqWk/KPfuljFlJg+3aaoEwtQ45CmyK+l8yVrmEkTgo5ds5h/0yo50Tpufb9Fe7xNebZNW2Z1Y+gxE7CXJHzgo7+8W1QGkmwsCYgvPCyWM9FAGCu2ZZSX9ntCKgwVXYtUFKeXNFrLoZaxnMBLEskeB9Fb8BgDRMx1u/d7RiXUe9gom2GbWrHP0oR08UqWRvV1jN+cVTGhG+n1M/3y2gAn3pnETPCLgkUyXCfjDTCzeS+OOQAKSqZNkCvZv9M2SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAeJUH99yEu+ElicTx1XFxrzXM/oSm3E0LMnDPNCd4k=;
 b=rt2R/hyA6gWfq5rYXstbhmVwND8IhLXT7TqaY20FxF3pL8rq8rEHd5tl928DQv3MplwaPT4v+s6CQTRHozt2kFSLfrXToBvICweeGFXZk6YFIgDin1zAsLGPkzW6L5RjRTBuzn1LUHWBAgNw/ewfgJnHCDBsiDAWn568QQqqJND1p1cjGZh8EtL1lelEbyELu0eg63dFo0s55rlSC39O0BC9xL1LChOAPeVHHxKkMZxO6Wf/0t2s0IMxaWy1wCRxGsFAvcVLmuRlGhvE9f9yfLM6E906D45NRalFx1ZPrgtQR6fRMjMVliAiufTza/lXdENQE0U187mxdrWC0nURkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAeJUH99yEu+ElicTx1XFxrzXM/oSm3E0LMnDPNCd4k=;
 b=ybi/l8rBN4DEQV/lHgBJpihxcRbw5EJbsfhR3Ulsb++Xiqd03CwuhrDyfLU2Pn0eRGYWDS7fdmVS5tvP9kMJL9SCnwBr65phlzQWAsIgSt5HC3Svl2NtFF8LopSVSKcnxYlcBDM3/kz1zHCJN9ZBCw17aaHd3tlySKbsWy2cXRA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4698.namprd10.prod.outlook.com (2603:10b6:806:113::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 09:00:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8943.028; Sun, 20 Jul 2025
 09:00:00 +0000
Date: Sun, 20 Jul 2025 09:59:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Ye Liu <ye.liu@linux.dev>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ye Liu <liuye@kylinos.cn>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for
 pages<->MB conversion
Message-ID: <3d459085-3b7f-4ba3-8197-832f7931bcc2@lucifer.local>
References: <20250718024134.1304745-1-ye.liu@linux.dev>
 <202507190319.0rqhQw5l-lkp@intel.com>
 <87dff86f-94b8-47aa-b2e1-7560a9f60818@lucifer.local>
 <20250719163807.068d4cb349c6a3395183167b@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719163807.068d4cb349c6a3395183167b@linux-foundation.org>
X-ClientProxiedBy: LO4P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 912ba6f8-059c-4810-a0cc-08ddc76bcedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PipkFZ1d/UXty2jk8/sPKI7iwTRqDJ5fvl4oAyX8qS9blUoWFKhfj+FcmqPd?=
 =?us-ascii?Q?AHJsVErjRXnsWng0H/QvvIi/l7p4D+8TsvxR7Uww1C1WQBYVCgSIVdrcJQhS?=
 =?us-ascii?Q?oGt87frOM6k4Qe5QfU8G4hySjwMzhGZqol+XI4KJkxw6p9bV6Db3toFYhS2a?=
 =?us-ascii?Q?zQwhBSbLrNSrcYIyAp4hreRm80sCO8BM/qoMPd08llJ3tVd7HV4EroNW549T?=
 =?us-ascii?Q?xkH+MiOr9p0Gd+gWthWlMJr6QgCQVbDrqjef6ANV8WXuj2Xy49pjHCAty6mu?=
 =?us-ascii?Q?0Q3HW181fnmQgdv1HZuvcnBK5hJlvZ14Lqexe+Sw6oy9FWpX40BRAxUTbt7W?=
 =?us-ascii?Q?gAEcRJqIhAI/EGgNdzEiAZH3IRGkQGdReFZlLy/05OWJ0qixF+V92RTX+gHd?=
 =?us-ascii?Q?RrRMhM00zwn7L9PO0QsbpC4+X53KIcsCxWmp6o784IuFbRNpr2veCZWWkS3P?=
 =?us-ascii?Q?kCWNJeLq1J3PUuRpRBNNX5iphh1oUYSy5vGmgCUr0vwU+qU0S1NiWK1ER7eo?=
 =?us-ascii?Q?tr6vDFkuPQMJT049xfC1NbK+ntIE2mj2A96mMiS4WJ0kfwoIkYZfCFKMBRk7?=
 =?us-ascii?Q?Hf1DGik1mEaMPBPluIJl5gv6o9wGFI5Nx7ZcHpei8m3dLI5hCOCPfNsbke/m?=
 =?us-ascii?Q?lWew3Ovjcok8iBhUHiKmgRtJgeJTOsT9qIRqgTkBvcWC6ypzWq4dlKg63g9B?=
 =?us-ascii?Q?YDEctoOx9pwYgnBDqWEADQNbe86nB3Op79BAzmDM5V4mbO/Zzz7oqib0HIwY?=
 =?us-ascii?Q?m/H+oXVs6b3t8Lwx5ypImlKRf1Igc4LtkLvxM2ki+JGj7t9ywinbWq4DCQt1?=
 =?us-ascii?Q?yk6ku2dafpZyY98YjuOrC1aLNtEXc86GD9/ZmSifqKmyOYr7hi3G39Cl2d8I?=
 =?us-ascii?Q?WM6W1CchWCXK9hLO3yLahAdQjY5FTU6UkMCorh1FHM8zGxOUuORQeoKU+yyO?=
 =?us-ascii?Q?z0HtP5tM/ONvArRZ2Rvb93PjY7oLce4XAinynALVCzB5eYk8q5N2UAyGFVPu?=
 =?us-ascii?Q?Gikg89cJjRqGRb16C1pO6a7WbQ5VlLpIrotKJ+a2xSqgU9r4yX2gGVToYfF2?=
 =?us-ascii?Q?OPvbhfxGkMoA8pYkxROx6Cxol9HqJuWn8GABG4/R9c1ay26CkC/5LyYTL0L3?=
 =?us-ascii?Q?6nFLeWsfvAQMkhgx9bYkzGCPl7vT/DKsiLe9X+XQXHC9PCpzTmsRfjGzF1aW?=
 =?us-ascii?Q?q8kzCICskVNNydn2VKMEvRw10hzh74ctGNvx0UsPu02ZleSgcLZ/IYiEWGj6?=
 =?us-ascii?Q?ToGL4M0ENFWkFZgakQ9vUyQlgx2oGIu/7/xgDeZYKTD7INRP0kVAEkXckCoF?=
 =?us-ascii?Q?Cq7W6mH8hiifYpgLndsuWRBMP2kNVI7cCyDiqNj/Ww8WjHRWJ/dr1p574ab3?=
 =?us-ascii?Q?/m6OPH7o1f5iNe00rd5di5u3nolzJDjdHarz7K3S24viylMYlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PntDAvlJl49Eqet2RYiixg/4drrGF1mDVQmpyqw/0Td9i+yVEFhMn0aZ56dv?=
 =?us-ascii?Q?Aycice5tw6rW/RNRLIiFbuwPIcmG+ziLrIXUDeCArERlRXMxfgqk+XxjAUNp?=
 =?us-ascii?Q?Ibr8PT42CT7LqULGWQp47euYWBYeB+L9PSSzDgi5Cu+moRb19p9ECmc9OUwp?=
 =?us-ascii?Q?dQiCwVWLD3rMo6q3KF169ScYtpR7f42M6D/r3wtL+fozgKpG8jjRjFSj7wcE?=
 =?us-ascii?Q?60ahShbriAW3Pcw8WvE5i5w3HF6ry+K/EcnSjS0XEDwbXbp6ZODe7YkqPACb?=
 =?us-ascii?Q?5bDS+aJAIcnHnxA1QfhqbHs1Aly1hh+N7+uy7Cu/pJD/HWVX6FtjCQEgAqRC?=
 =?us-ascii?Q?M6pQUgZju0hKLyuD0XV8QRYPtmt91+tSl9RWtZ0E/kKFnBQ2B91BFCpfWJEE?=
 =?us-ascii?Q?YWVmWGh7SuKuMqTN21DNB5hP2hX/0quz9FUW/xEA2w9dVXy9CTCLzrWFubs4?=
 =?us-ascii?Q?l6aqE+Ya4eL5IB410sJ7SGkUIgcqIQnrCqpYp4I5SPIIOVKQCCEF7UF+IUMC?=
 =?us-ascii?Q?5P5iZTC7d4oiTWWMbHWT+wmJFcd4xvU37B/ne54K/fDz0UmO+0xNS4pdQQrP?=
 =?us-ascii?Q?aNyGHa7uTFVHDzSxpLXpsJ30NTM/4RmReVKcMJ+BFhOyEOEP/5sYniHbT7gu?=
 =?us-ascii?Q?2vSMwW6OE+DNgpWcD+M8TvlLk8wlzTTzeSiCdGRoKAb9K4UwPq5OwwAkIe46?=
 =?us-ascii?Q?85peVLDHLGBPLFVyREeTtcaqU5go/Ku+Otu/Rea1QAGaHXPDSUXmGPYak2TB?=
 =?us-ascii?Q?fDjr9V8t2LLArZzIJpfC7v7wx+0q5metWqvXUrcAWD3GHIdBaAFKM0VrvLOh?=
 =?us-ascii?Q?xsXCVjmmQbM6NDTHuqnqQKkJB2hPIKpr6Ab1oyIHBJX9FOPxZp2NnI9t2+sT?=
 =?us-ascii?Q?2joOQdWweb79svO7HElXLAoCSsi+QEnQX8X3LuIp9BiX/YeKm5je4oC0JFEp?=
 =?us-ascii?Q?zTgvb7vyei4q3it+c2K7Ad2BpKtkQ1nIPKq+HuqVZgX2GKuSZG9R8P1u9jKd?=
 =?us-ascii?Q?anzFTm9IC1V15zrCHcGPz4E52pveN95INmWnTDilC5iDfljKs4Qeba2WwTLR?=
 =?us-ascii?Q?abpZTq1yDJRuoQq5tri8DSbPfDdnvTAiN2FG3iqie//ebpFUQoqy3fRXTqQ0?=
 =?us-ascii?Q?UrrhjxtSXjo+x/fR1kGi7XyOtfrh3doYreOrtaIYAHbFHtdN5pGLmykVyMBB?=
 =?us-ascii?Q?e/z0I/6+aMBnJx04GCQdWDgSRxOgmlEmVlar1F9qcnlAnNqHPCJuIqa+s2xg?=
 =?us-ascii?Q?kS0fKuKtU2ZzEAbTnoKJ88cTI5C3rCveK+cfZCGNqCY46gomag6dK1LEn2ow?=
 =?us-ascii?Q?A9+Glmm/6Bquk/WRvMDIrWFJ8QZAWT2QcDjRGiTxlF196x6/WaSZWUVgCcXO?=
 =?us-ascii?Q?7E81LzM4NjzJr1A/vsD2KVN/oDYa/bKmtFFKh88x5+Pka0XD2TKZEDSN6Plm?=
 =?us-ascii?Q?1JE5XuPhlcKzLgnIMubyP5ocTGnsa1w73HKsYmpFZY0hMR1PMiX+BLKr52wq?=
 =?us-ascii?Q?mURa3zR+GmDm5ySm3yhkPHkA3kVSwBOqaSQG7OgJm5o6v5Y2Vp2IBcALmKUZ?=
 =?us-ascii?Q?VhAcnwM9UcAM7/BdKFNrfZf497dcxlKbsLR/8bEJHwRpNUA3uRVP30kXooT3?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C+tI0Sf3mCu8krHNMcn68djzksyawG8pTS00e4ej/Wd8Tms6lbWPuC3o8gHQ021SQh9G/PgJseoJuhVR9drUy0KEUg1gr7xvSzmf3p4/gAObq7ZnG+/ID+qfgYEGf5glZDRsU5phk1rT+s+3F/RRQw3cz9w9xrhQb20ErJQMI18OVpfJBScdWjkAwYlYM5SznXLcn4HWjOWBbgxafr/3QjmsA31AE6k3YboH9S8w3nEmhRo1JPZXub46wm76YXgUZQICE57izs2ZyfU3u+5mb4zaWIeO5R/Xo8XTSsW+CSFJmpLCFUVWJ32qtrRH0hbjJJ99ihW59CXD/JH9a87b+NX1cnOKQQBbbKLrPgyILx32jUsq4vPO4S0lPVr77jD2qM02GQXlwF6Bxb9uYmRyZn+6PxAO2StZG5VTY+gcHTfZ8jq0kcBTs8slfNp7gFuXC/QOiJbwCNNC2DilUwwiW8ujI9XzJg5dI4leHrXGJUtK7CzWHAtWPPTtBwJ+FsyyUAIUxex8W82VxJf3mbMkPUuuaf5DEZ+37KgG8WFPpvfwScf+CgPtnDoQYdaaIQ9hlS1J1KgUDCVRxPVOte36sJEaoB0J3JPcTnmZM9zvp5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912ba6f8-059c-4810-a0cc-08ddc76bcedc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 09:00:00.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pon9uUrebl6cZo8JtwCL2OiFmo0Tzpj+AypX5tZfyCsOu63eNCDpCaDATq/iRWMLxw3d+8F+8lePKsvr1pgslh/IyWVbH6+iugTxQZ3Oppo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4698
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507200085
X-Proofpoint-ORIG-GUID: ypzfbNMhIb34KriwbvkJ63ihRtw25ESu
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687cb014 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=9apd0d7CRBJfwYFBlU8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ypzfbNMhIb34KriwbvkJ63ihRtw25ESu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDA4NSBTYWx0ZWRfX7PXFmnlicpbb
 TXRFOsb+ICW/wZC0VygFn6DDQZanodXSNpVneGXNTuFOqXsayf0CJZaooZv9zcUMpbloIwfeNHr
 CUgqrTreW87rYTWgghxvKBIop2YDCpN7r1rUq14TOVYAbhY0nGUJvonWau3RM2bufnEbKnZQciH
 SFQy/rpB5R1cLjEjhisENr1WIOU96bdANNtcBXlLj7xb5XCAB41HkiCHvyazUTU7qIfS24wOB3D
 F18/ZdQH46tmWM37e/jntnb8KzogFkBduHJA5wIhyuihqPYqoLUiw/JcpjVfbpbEj3aq5o4TyyC
 Xpq947p4wTomvAZS7hwlvvV6j+YvBWLHRzTQCZyboqeMSRtZnqE09B6TyDvGiuAXlTaSOOVl8CF
 ALAHI+jAEGHJSW7e1ijLqzMJhYM8R2RAz7uDXky/Cl/cx7+6/Icoxay64x8FiLkrd593FXvD

On Sat, Jul 19, 2025 at 04:38:07PM -0700, Andrew Morton wrote:
> On Sat, 19 Jul 2025 07:56:16 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > Ah yeah looks like this is already defined for arc only (!) in
> > arch/arc/include/asm/arcregs.h.
> >
> > Maybe pop in a #ifndef PAGES_TO_MB ? It seems to be equivalent.
>
> Well, those arc helpers
>
> /* Helpers */
> #define TO_KB(bytes)		((bytes) >> 10)
> #define TO_MB(bytes)		(TO_KB(bytes) >> 10)
> #define PAGES_TO_KB(n_pages)	((n_pages) << (PAGE_SHIFT - 10))
> #define PAGES_TO_MB(n_pages)	(PAGES_TO_KB(n_pages) >> 10)
>
> are simply in the wrong place.
>
> I was thinking move all four into mm.h (for the lack of a better
> place).  Then someone can make a career out of hunting down all the code
> sites which can use them.
>
> eg,
>
> hp2:/usr/src/linux-6.16-rc5> fgrep -r ">> 10" . | wc -l
> 886

Yeah I agree for sure, this is misplaced, but maybe one for a follow up
patch?

There's more work to be done here, I already have an idea for a patch to
fix another similar case...
