Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0511B29CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031175; cv=fail; b=ECMO69uc+VEGma//XqVr2UaAb/Bhkk0DJ3QdYQd4t86GHZPSyOPkYW57seqwN6dHz81OjzxYZSkIyDUcBxoi1lEq/TufB3Ot+KgJpbukqBOMTI+DkPLsfuCjP0g1VdEdpYsTiggVYNLDPwylQ485Xlp8vRFLj/ZLVwdW0UFte5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031175; c=relaxed/simple;
	bh=OGD8AXgQPF77upg0qysOF/eYxXlnB+dL1dOqJylZ4Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bXR1BxYTRLrT6iasMUnlzzLOf+EdgLqjpTnbA3+5oJmWOcXg5fpCYmliEsnEsfXsbaRdAUD0QbP4GUfvgfcT6nl9QH/RkNc22XTE4p0Z2ZYOe3YYVIj/RkJ89Hgsf5o9xnPlXwUz6sMYBl2a3b/8M2lnZzEvwGogHQp5i9XUeM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EBcSMcOg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=izRBTDAh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EBcSMcOg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="izRBTDAh"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFHqNO013585;
	Fri, 30 Aug 2024 15:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=BNYq1d4F1XiYY+v
	lNZhF7tCL6y2/T1aE+TNOouqbXWQ=; b=EBcSMcOgqlKQfwhihPZST6Uw0BvEGRk
	33w5VsLsFfj5fifTZ/KZxfay3HCNr3DlO9xNrWtKv1hRcoIv8YDTZGAyJJ1bYN89
	glUsh+Ev5tp9MY40uCag24lWxwEjn4sMBQKVMzwUHEyzsnN8Xwywd9F2GqvzfmLL
	jEYuhDzXp1rCaZTxWVkj7+v0yKtZa7aXDJySRwUBcS7AMSaLCjh5sDV0hlfYOb3x
	VbiP3tffYizW29S1dwnZ2RC6S6qF9TD7vXxLxrX070nrzcfBJbw2Vp2XB5cvP0XZ
	jDr3209DssC3BZg4LOzPxi+ZO3N+LA6hK7ejXU+sOj/31S3nSW10M9Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41bg14g2b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2024 15:19:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UEnKpH016854;
	Fri, 30 Aug 2024 15:19:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5wk6wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2024 15:19:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYD+TDZCHIormkG/F/r2ZPjLsyxTdzIVm7F+Cth/jrjDfDVYZtaxv/J5V9JA3xf1DbUrVbv+GlCoqqp+kI1NU7/67WMG3puA6ExhLJOenOjUFnW6TE2XB+BReXUow4HVCeZk42v0qmPtMIpAd7X9Qjgwrw060+Hn63MRS7iZyIw2VeedTtPywD7D9nQ90MTGN1gzRLrN4gAMK2BE7dWY0HYpR4wFIVlLsSGY+u9fyS/JPyZVjiiSUpvubCytvgOfewBSR9GmDFbfHLF/5IhgRGyCgIdb5/2TlmMBNekwtg0Z3tgCbES/PPBPCSWW+/bdui0nglZ+Tpb76Kg6lXDBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNYq1d4F1XiYY+vlNZhF7tCL6y2/T1aE+TNOouqbXWQ=;
 b=QccZhpk2ovcGsZBaCDswo2Hu4Wnua5V+PKJJicZxMisclBQLa0HBPZmeFjbI84/j1DofmO4TAi7FSIbUAWU7kp3tn2T3mynCA6aFeAWH3c3sPRBT6YA5Au/WdgtOJI2TWI2RRG4ZH+dwGZlMw3UFw0uGrL9B2OJmwdsdFTpE63EISA7Vx07OHprskksw2A8emo/Epqz4Jmn/+7ssg7rp4Dbo9akM5WkP81pmiro6azDGdDmznaXU/hvozSk5P/QoZaiBl5yJgrTBbV/AvW3ayZnq7WdvlRat9iYwzvgUywPQ2N/dVbP3DoSGZ5geXWhCAsYSUGWptBLHLBMYQbmtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNYq1d4F1XiYY+vlNZhF7tCL6y2/T1aE+TNOouqbXWQ=;
 b=izRBTDAhotpg/vKjA8LPNKrEMI6gyVakQq9Yh/M7qKErs0/Ok+Ols5mkEVMehvlAc344/tcA7ECKkXi9cTxisAPafpBNrdq2dsqvC+vN0WX4YhrAhxvxmaxc3fyI52ns+cpqQhtRylgLATXfEyM6cYfnbIHVSlOi+IWdifNXb3s=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 15:19:17 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 15:19:17 +0000
Date: Fri, 30 Aug 2024 11:19:15 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [linux-next:master 7320/8126] mm/vma.h:173:22: error: implicit
 declaration of function 'vma_iter_store_gfp'; did you mean
 'vma_iter_clear_gfp'?
Message-ID: <vorrn6vqndclg2mxiqxdxyomxy7kspxkw56nbr3x44ydgqzxzt@r6e43aqqnbe4>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <202408302337.xJn0kaJN-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408302337.xJn0kaJN-lkp@intel.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::9) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 584856ac-9949-434e-4a04-08dcc9071d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VIbq8uBuBzheJvHMsLaAXp6oYh4MJ49EgjH9IM+faVjC4dnhznLxPxDHz+zl?=
 =?us-ascii?Q?TmtiCZ3YXOcwtFRm8BFlNm1WUC4kNgGkg4xfHm61u9T02FHDMLAD65WdejbW?=
 =?us-ascii?Q?bns1C2vyNRBqq2/ZWbaSrBsJQSRg9k1Q62SYhhfmI+Cvb4UvCuQovHVbUZQv?=
 =?us-ascii?Q?iz3QE8qNP07ZIGOL3B6vgm6cDhVTauVNMIMFmSSvVRpiBD26bN3UZKEsv4A/?=
 =?us-ascii?Q?TcL903Dht5FEdFUTUXy4+e+TlqYTurzD3ozDfvirv5mtvXLhMowD3BixE5q4?=
 =?us-ascii?Q?C6erWL3Pklwo2E72IOYMSE+axw0fj2wV3/t5LXaLdqRsdWGBHrLW/vzQYgFA?=
 =?us-ascii?Q?R8Sfaru9j0iRsrG3AjjE14Tpe9raAw2gxBt+Vm/Z7e/xTlA4X4/NFnMTHSZE?=
 =?us-ascii?Q?vdFul6zDVL5EN0eASa5o2il9Q6MreNu1bjR8FHcIe0KjPMpg0KS2Z813Fzik?=
 =?us-ascii?Q?dhWOpaVcH65KnJlrK5c0FYT+c3ytkAfKjexBdt+3e82eChH8GskRqRYMW8Ak?=
 =?us-ascii?Q?c9PDbs08//o+0RhGIkBqPLqZjvD46vxiMX0dfYDbF0T6B5uyjBL8XNkYOzYy?=
 =?us-ascii?Q?1pC58fIMvO271EMDf1p5Z/EhilUTfmANBPXgGsiruBqG9RrjssxV5scP0j7A?=
 =?us-ascii?Q?7mt0Tlj9A2d5NjZx+RK7friz0Zh5jdfzUhq0CzyXb+Em+e0MQkW2+8DStggy?=
 =?us-ascii?Q?xs1UN1NFDwJEy9+LZFsJPvQyB12c/qzpsdgJffg3Zi76ZftEc/VbkSfwRkIh?=
 =?us-ascii?Q?s+VdaL3MX4vHKiMeBR6VNItjcGzP0T/w8SOlcqf9J775zmIrdePtY6vxRpK5?=
 =?us-ascii?Q?VgxLe4uQl+FV0muK9zAuLDDF20HiGuxBEfaWMyShbprGO2m9iE/HROS8DOAx?=
 =?us-ascii?Q?vWlC5o20vRYLBTmQI9Gwbfe9uCqMy8BvaaY4OP6W6ktwARS9LYRdzkFic4Pe?=
 =?us-ascii?Q?Q0vNRItQ+Q08IPdCZP13O6yHFdJaCJ9J3MJrTbBMxSUzbFwpDhRaIMsyamaO?=
 =?us-ascii?Q?sfJaBD0skMqlT/3r46NW5wKdYS6wsxMwEnx0FTKkHFbwfbLVcHG44VQ0YWox?=
 =?us-ascii?Q?XrstZTuFGcjgR8QqOkvuUqxuS3wixW5kKomtXGJ/H994ZB/4MZlgSrZBUfM4?=
 =?us-ascii?Q?metudcvrgR39m/sLNzLYcpZgRuJrL96dbOdM/GKpUgAUaNSfqvbk9AoFDX2B?=
 =?us-ascii?Q?IFXWJ326d5frVhLkUUnyBwReHoYMxAEPQW1HOMqR/Fj5V5/iFjBzSITS3fD1?=
 =?us-ascii?Q?xIC0iHceehkEw18FAxi8KUP2CovQ2qu0e6ZY2c3lkrWg5BdyiWHXCagUUZRG?=
 =?us-ascii?Q?5JwZ7znOk6nY/an39N3RIhhk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0+N73jmkRPfqTtZz7/KQvcqKXrCpZKKQT0lPG17ZQVKSjQD+YYGWHmVXh2/?=
 =?us-ascii?Q?hlvWn4NR3YEIgNAcwI5K9JWrF5m0KWzQM4MPMeMvF1A2Z+COgRkL0qO7r7SW?=
 =?us-ascii?Q?OXINw7qrT0F1GQEvyUzydYBdzrgAewKLN/LBB5XwDWgLgBJhMFyhaEo7xjhO?=
 =?us-ascii?Q?YyWGEDoK724NAwj2qus84LAXULSMvrbB7JP4WaRrhuCSQfcOpFe/Im6Wxo1n?=
 =?us-ascii?Q?KPo32YVY1PNjtZM147BroIClkq3+Vxhq52dtzMY+yANY0tmvgPPkLbqiOKsw?=
 =?us-ascii?Q?A5pp0g8Zus4r6hxye77Qj5+Mlsl8fCnLPh6m+6PnkqHODAlrxjBcINChrEZ1?=
 =?us-ascii?Q?oC6Vbg8MZNBAwhpx6q1G3TNhBsNEmqxqI0Nf7WnF+uwJx81uYdLDqTTS2q4z?=
 =?us-ascii?Q?3zHB3NRBvimHGqAobbDNyHO9zX/+TXqZlzTmGkNrt5iYtkRdlG/ohjYz7XSv?=
 =?us-ascii?Q?z4l8SMG82pU6e+BlmVY+BRYQTpNN5zFvpUrzyzWZZyV/i/G3t1I1cROMxoPC?=
 =?us-ascii?Q?/3t2PnmkjLFSLgH3B1Zv7NAnkDwumJYT7wsEOTii1jipz4ZEL6re/Wcg0eBM?=
 =?us-ascii?Q?WSy5rnvNWP4Tua/YrTtw27wL6mToTX9VLr7joQporbQdtkdsG2fAoM9A8Tzp?=
 =?us-ascii?Q?dXKVFp2d6UyQe/KD0GWYl/dwG9V3zCg6lAM625KS4VyhJ0dxZMxNlxE4NCDa?=
 =?us-ascii?Q?G88HtFMfHo58MVVLzXGB3HZ3fMwIR/DCUUPLi1iA3RG9jZaX7KIAH/XQKaEC?=
 =?us-ascii?Q?YxP1OSsgfZSk71ZOMG5tln3v5GGoJ86vN8DSYDS4yKNvpvXpUlx7MFD7mTtR?=
 =?us-ascii?Q?DIAF/0E6/12he+TSVnvhXrTFRzamKDk4ha1p80/6gm3dtPZTEe7mq0TVc6v8?=
 =?us-ascii?Q?30jad6KH8LkNO78oKEmczC2CrxXy39YEtsidzsiIuKJ27xheReVgeGB0hoqk?=
 =?us-ascii?Q?Un8FRCctEPPy8W/RPcEKSfCcTSvj6w5d8DB8h1WgYhzrXF0kv33JFJ5eJ1t1?=
 =?us-ascii?Q?8tilmh7/uXPWrVmy1JU7egz6Gaw+vL/LW3Oak2zyQNI8MYw40huwhrxcId6o?=
 =?us-ascii?Q?GoJcYtPjCxwxeDiQ8j126cVN4qxDBmG2OBM7Hg9b02vnluVMIHgRi9H+imAY?=
 =?us-ascii?Q?gp6n3Bk45+G+oQQMcWQ/etY9zifv4LCTNzVfGOD9HI7NJfF4RxBeR56Sal3C?=
 =?us-ascii?Q?Z6tuNR+Z/czduhCPMDQ4nSN69aRDEcwvCbg73NpK7K9DGUI0sV7ObeR9Itl8?=
 =?us-ascii?Q?DFmy9mp5bd6st49qo3gvqPFSA4dcCH16kpX613f+puKT2ecWhzrnRPOGReKs?=
 =?us-ascii?Q?itgn/aQV/RkcHgVHvxr6RzrzXTRN4/K6kGzITpQo3KVqAfdRBV262O3TC1yR?=
 =?us-ascii?Q?qy/vWbtD2P4DiC1XQ3qKtzUgC7EClBzAb1EPiEUHkti7+wJ8MvLQj8davfze?=
 =?us-ascii?Q?G1wP5J1T/WMcM+3ZyI4xIN/j2v0UeQ304aPaT0KIE6IdHMGuA6SZR7msCGm9?=
 =?us-ascii?Q?PC3fcsSeVbP5Lx7OgV6Pu3Ceh+K+8kf/cTKG+diVE2xt6F55TmEh/n1AY8Xh?=
 =?us-ascii?Q?b6OimOfVxWjw8wjdJfLGgSSrJBv/MCGTv+LjEk1R5Bn6sUqJ+e++FXdoOpW0?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1jMIzJ61oLhCE+ie2DPNDUxjn7pA+oO6va/SRvZvds8lsilsJzHhyCbyyDiCo44w/vhfulI3Xg1KYxo9U18LKMpUifflvnLzK6DeztnO9WvYKfbvw/PoQC47DmLBMgGD+zwc36tBBHg+1wyVvyXX6L42+LJkSQ9Sdb5EtEyxFyoCAaoXvvRpvtoQ0smRmk1m5Gqn0RvXZiJ/jUR7xvq7jzRIUri+vQx4PwbFHI1T/tl8tfoJszqf8NWvvqByZWCF8GQq7aZ8/Wu/iEIf3psPvYuStDoZmvNEBJeClaQQ7zBz5e3XiBFRsrx1GR0W+g/cytFMj6hvxcAl5tM+PcSyVg1h/jpNsynzYJoquOZ9hnv4z9zp1M/O0P5s0AYp8yPFVo2GXL3mheLBxf5eYpZiajYjGdkSpJb5pH1HgUXnuhtjAa95SQUJjO7UDDaWCmdOtzQPGOZB3QLoO3g0RkOVTlTOTblruyoRUNvL161E4uh9qqyZrBPElP49WX+c3aTAPvfWTjcOMV59FkwrMh9Hw8Zbahy4JAnwf37dP1wye/qa1tygxN6pDET27eDhRULgBZ0t7HXSAb79mYfWlTk77cARMXeaa8U0ubDgza5LNfo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584856ac-9949-434e-4a04-08dcc9071d70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 15:19:17.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jufTSTzytD76hWS3/rl7Lnoo5NadETmGaqli8WQ1lgAyoHlX3bgIzacsY16HOnrjgNUk87PaNE6ln0uNucL/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300117
X-Proofpoint-ORIG-GUID: 0cGje8h5gv16fIEyqkviOILLS9fLyIsS
X-Proofpoint-GUID: 0cGje8h5gv16fIEyqkviOILLS9fLyIsS

* kernel test robot <lkp@intel.com> [240830 11:05]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
> commit: 59f8f23d91921f023428e34c061e8ee88b7670c7 [7320/8126] mm: change failure of MAP_FIXED to restoring the gap on failure
> config: x86_64-randconfig-x005-20230818 (https://download.01.org/0day-ci/archive/20240830/202408302337.xJn0kaJN-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302337.xJn0kaJN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408302337.xJn0kaJN-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 985bf40edf4343dcb04c33f58b40b4a85c1776d4 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/export.h:5,
>                     from mm/filemap.c:13:
>    mm/vma.h: In function 'vms_abort_munmap_vmas':
> >> mm/vma.h:173:22: error: implicit declaration of function 'vma_iter_store_gfp'; did you mean 'vma_iter_clear_gfp'? [-Werror=implicit-function-declaration]
>      173 |         if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) {
>          |                      ^~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    In file included from mm/internal.h:22,
>                     from mm/filemap.c:52:
>    mm/vma.h: At top level:
> >> mm/vma.h:336:19: error: static declaration of 'vma_iter_store_gfp' follows non-static declaration
>      336 | static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
>          |                   ^~~~~~~~~~~~~~~~~~
>    mm/vma.h:173:22: note: previous implicit declaration of 'vma_iter_store_gfp' with type 'int()'
>      173 |         if (unlikely(vma_iter_store_gfp(vms->vmi, NULL, GFP_KERNEL))) {
>          |                      ^~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    cc1: some warnings being treated as errors

next-20240830 has a newer version of this code.

The fix should have relocated the vma_iter_store_gfp() function above
this function, maybe a merge resolution issue?  All of this is based on
v7 vs the newer v8 version, which doesn't use the vma_iter_store_gfp()
call here anyways.
