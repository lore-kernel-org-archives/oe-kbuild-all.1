Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07BA5DF04
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718176; cv=fail; b=vBI9h1tPeMfGC57ien6344t3xBJg5XVj+TyWMymu/lmxOwPkqokF6SRNKqctiHkj+BEzXTZnR3A4I6czkE2BfHjbw/XRb2EVbifiMhuRawl1OT3atjuuF42O4qJVbJAO18z/oysr83WrCS1YRNySmY5CrunzRYEB+Eg9eMP60Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718176; c=relaxed/simple;
	bh=SoEjDHsHGQostfX73KkShI+7v7fwHJmnKNDqXTTZQpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sCcG1ziUDOBLnSm15zIQHeiif+3kUxWN7hwKwdw5ms1cJ1yL5PPQbgpmoWXc7eMPCxOta3eOv5X3Bypx8Bvi1pMSipqM+zQvWANS9NlFwPJ95n7Vme9cy34P4TT96V5cKUxmitpJLPGuMjrEG51Ku7ndw3zfLzaZw/Tq4/4oymA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=naSrnkb7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PjG76lIo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="naSrnkb7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PjG76lIo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4261EKHq026759;
	Wed, 6 Mar 2024 09:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=lXi/4oNBTR0qiRBk/qX4j3uvFhLy3A2TEWDkNReO1T4=;
 b=naSrnkb7IaRR7bikkH/yjxSUWSjpWuKVDjmJm6/bZ8FHZv08WERg2sya3HHbX0s06hvn
 ojGn4c41eujrqtO4Jb88oh8RfbbYnC8n7SDUYGWY90eI3gfCAitUA+8G3FYEMxm109tU
 rfwbzOrIMCbR+sYuC/U7fW8z1YPO9nd2VmktepFfZO+swYfoX1aqX2NIz47aYZCKWaUE
 8ZW+u3ac2cH+XPphbn553O8WXAqQZGySH3xwnLSPZjnCZv90ApPh4Tyg9Oah8drr5IF/
 TOwQ1mzHMAyvYssIkbUm0K50mjiWq2IcB72NTKpGwPpHz2tH6rbMrQn82z4NrybI1xDD IQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3wkvnv0h72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Mar 2024 09:42:45 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4268tuSL013964;
	Wed, 6 Mar 2024 09:42:44 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3wktj90u2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Mar 2024 09:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLR3m82IDhKYkfTuJS7aNtgktGHox0qa+yfHkYhs0qJt12/yVFZlrAR+YfLoBtY86shsCij9a3MAaQ+9h2us2ao8KNcMYulHkJdqCZkpFVoyvdWCIm4jXhSlpvkoAxYoZSffQ6cyxrgX0tY5x2nZ5zmE4x95vQHXmRX1/aH932EAIgQTs9kyM7ZvSFZ1l/wJT9ar+D8zzxNoMLyGkVL5TuBP3FTsZgOe4B6E6AHmBpLl98FqGoCZJ7ZhafUk4x/R353+/X/wnr6m0hhFT0vO8vYzdhew3y6VTn/MwdkWB6uEW/4tTaXVwSzdsFTGbSeOLrxLEP+hqVTtwOS2LqgB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXi/4oNBTR0qiRBk/qX4j3uvFhLy3A2TEWDkNReO1T4=;
 b=IWVCW50q0Ads+7D+Aur9ReQNVP5KgpaVQheyDBYa+H/joKSm5r7tb+nev2BdibOUOCy9Wccucx5NYJ5K8+81ghSTPi9doBV46xSw5n+vPkZemRFHffGN2RjRS+EvGGKgQdmV3I6xjjVZ3wSD/gvFujqH2ieFC9TbGHjvETUUQZYSCjZ7AwNVM6+JB4GVhnfcI8/j0v5Tv5/mtgxISOtKcktrUnoyLIlJBRm4Fbecm6smg7bM/JqNpJ3kscoNAPAlwK78/n+UiRSB3UA+s1yXqZiyNaUydpbyMitrIbm7O5GHHSpSciVk3WPKtD1DeGaZm4smLycwypdAmNyhck/TSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXi/4oNBTR0qiRBk/qX4j3uvFhLy3A2TEWDkNReO1T4=;
 b=PjG76lIoanMTEjqrMFX3gIWk2MQCP/dnWnZcIABWvZ0soTSuu6FS8futLMmN1GcqpNPxNDVniojlTj+2nXdTDPjnkSlcFXJaDHxBFYSk/iKe0e+dNmMoYAkhtq2ebCjpAz8Qpen/MEulgkxRyb8IQSWz5P8xIm/R/pBJKGZ9P7k=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by BL3PR10MB6187.namprd10.prod.outlook.com (2603:10b6:208:3be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 09:42:42 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::789c:158:af34:a3a7]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::789c:158:af34:a3a7%5]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 09:42:42 +0000
Date: Wed, 6 Mar 2024 10:42:36 +0100
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Chandan Babu R <chandanbabu@kernel.org>, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        alexandre.chartre@oracle.com
Subject: Re: [linux-next:master 8491/8619] fs/xfs/xfs.o: warning: objtool:
 xfs_da_grow_inode_int+0x6c1: stack state mismatch: reg1[12]=-2-48
 reg2[12]=-1+0
Message-ID: <Zeg6jCoQXSPlxvg0@laptop-dell-latitude7430.home>
References: <202402220435.MGN0EV6l-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402220435.MGN0EV6l-lkp@intel.com>
X-ClientProxiedBy: PR0P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::17) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|BL3PR10MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cfc530-a2a4-42cc-882e-08dc3dc1c3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QgoUvavxooVD+tH3TSVj9vErwi9LhTo1nzzApK4R1AwgAweptgXRD1vOY+cX/72yj2imSYCEpgiRqU7IcRRaJj+6qmTRw4rEht+Xnk1dYbCatE88k9gb5QLILOa0fGBfQKIcT17HFmVpahdXkGCiCIzyky0rQsrTtG8f/REiB/6k4dfwqt0JMXjVvbQgosQgz5YlfrBMu7N018y1QpTMmdx6rJX5A5N8vM3RT8gWeziQakJdf8tzQflZN8WweFp/neStE0RdEcZ/PN/ZNMo2PTu43ql5ExlQTzIvwRkzfvOZgGefQO3lVPyPcuaMu+VMIqLa1+tdhkTvyEsJecpY1r9BE9P2jjFeHDbDiH1x8dgrDg4e8yGV92qoEYtO3yDINjfc5LxTobrNEXgx2bgaWxV88kFZutRkeApuwP4mnZIL7kDPKDj5+36mwXiFbc+sN5/q2OBH15BEjLthbG8pq9KsP/GudZnd7V+5kNxtz1HeBpNML2zXW8MVy7/neIhhImJiCkQzVueEV/iOJf69eYVUPUZR2z3eU1NgYUvOVh3LbutegkFf2mErq7caAWblGhtJH0rpxObr3LoXkGP2P5ahYFkQ5isxxvdQkc+RaaY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?irvC+nK5dV+l0/3xJWOOOmkbb9UsvTH4IU7dxvj2LV1RFBQM8EJb3GeBJckk?=
 =?us-ascii?Q?+L5z9onPxisivnobol6olNFAz5TS8P81Dsxz97ckJjfoAfwxAzBDpyAOdhfi?=
 =?us-ascii?Q?BGR4bDVTWFwdSqMzVoGz1LnFbpDrng0HRTyU7aTg84jcakMI7iKSRIuS7kWT?=
 =?us-ascii?Q?BRE3EVWnmnJtylnv6fyVd3wrADthyKPQJtK3W0ynS4XCxMm7Nc2bXVBvTkGz?=
 =?us-ascii?Q?TdIpw+xT+LD9UN0t8UDygk7CnTdzOrRP3YUWh/GERcgCduGSjibn0dTqmsv3?=
 =?us-ascii?Q?I3jdKC2dGjKptioaQBHmHqAgCtVokOHAgkwFXJ014cmpl3MS70zAV5/kPwZr?=
 =?us-ascii?Q?cGrfdBg7T1A37M5A0U7xiARcA7o76EG9s4HQ6Sg87c4FnJ/55V4YiIYgC4So?=
 =?us-ascii?Q?KMdDGNaD0+HdY/9svKCN/hMn60n/rg656F8FXxuxsPqOTjW+k8WHnvJq4XKB?=
 =?us-ascii?Q?V+bARGL3TdL11VcmERKTA2wznRt1+KQ0VryiG6r9tnBZ40eOFCzlcgd+LimS?=
 =?us-ascii?Q?y6eHMBanHPttnu0Iz5iAtSRhNCVMHZrtBpcfjK3wpdLht8DwI5xxy4AAEoG2?=
 =?us-ascii?Q?rhoAhr8P6N0ZH4D/8pAB928HvWiVxhE9JOhCi6qgH2v/FY2ZmlulN8wVKGzD?=
 =?us-ascii?Q?rW7+gp6RI2xN5dBOZNHbCpHusQ5hvWyNqM68z87FsDYfl+fps3zAF3oqaBQz?=
 =?us-ascii?Q?RbxqWXPjEvf+4gIgWCGtq88StEvo6+EtX/YjJDFwrzZHHJJ0td/YH1EG2o+T?=
 =?us-ascii?Q?0iVt3K1tFcVvL64TV4y+m504NjHChDpBC5dfmiUMLpKSBYdse0zOLxofzEY5?=
 =?us-ascii?Q?h/Cv2BeAfo0vs32L5OCEy6RBcQ5v+Cr30hgni4z5z1te5CJTO1CSgdiDAcr+?=
 =?us-ascii?Q?r6aRIXxYoCvRVIRDTjzGmGksXc+0FNN+0vD69o6bjjjwyKv2DTrRFoLXAVUd?=
 =?us-ascii?Q?8d9HnVdeBitA8bGlVbB76mfz+T9G4yjgh8HEV7mMJtWUhF8b7omTfr5Cy8zp?=
 =?us-ascii?Q?cWD8rW2QPZg14CL3fr5xW3H3UHi+5T7DcW9QBwKknBU6fGcMz37mnByZV3I6?=
 =?us-ascii?Q?Ce4vI1ZMaST5mA6SyxtG23k0yp18LwF3iFNpn6zK+sKzycOx4msKXbUPBHUJ?=
 =?us-ascii?Q?iV3pnQa67omtF5ugieXEC0C4pQS/dotBHs2OlTrXQcKhY9CmGAkNuSIg5+no?=
 =?us-ascii?Q?t8VHkHUv7mXo1daoBD4QNzOgE+0JVybpjm7d+ciQKJCmhtZSI1u4z2ugYurn?=
 =?us-ascii?Q?pjSqd9O2wVhVPuEgmseoUAHuqGPsWDmhC2OYSUf0oiZqDsRgtaTtpYmSLv6g?=
 =?us-ascii?Q?uKBaFf/ieOdryX1AhOzI5NLlPjf4OK7vsZTVmsEaocp74XoikFMGVYOaFqm9?=
 =?us-ascii?Q?vMsGnycz6l6q8vAvDvb8hcuVL2OoTweXHAmzmDNdE5LDaOqTbCvzgSccsF8W?=
 =?us-ascii?Q?VlrNjbb9C3FZkSrygbK6crTToTViVQEa3Cd3pX0lq2YptKZUxLoHUFzfmhOU?=
 =?us-ascii?Q?phIt6Bq+1Rs90lZ7iZryhRMtczPNhySDFCzJcr2e1JSqShHwKySEiPEL1zOb?=
 =?us-ascii?Q?9jxeLZAfhKnSJwmWLmqIXWnGSo2d+Gdga0tC7Q72VRtpyrwcmWutnQa56v9B?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KLBS/V0ru+PuJ8BL4bqZa5qAF7P0xVCeDzwU1T5kWkpW+NZUNjXtwWWAth4h6yORh4kgcm/Iv0Jlz/63KMOns6uyASRXPgRLD2hpK3LuZUbsqT8RboEULofcrwzEnZoBRt1J+chBIO6RtjrN18lbY3E28iWbD6I+SscbHt1i1pdOUbuc4s4Mc9leN9CnsQMJ4qKdJgjxW65f8YLVqs10NxDKzTvEu5TjNJfPxtCIRTBRF9ypfPHxGxLVtHlHwN3vhmx5jTX+AKc/tqQXonEB7/OZt5OP+zzciXyeX0ES1AwNuAnQKuO+1wmCArkKgMIRKAZEgdJUGcwipH25N/mM6QVjdldwJejsZ1YCcBMEiVKwTqJh0FyuN22XwKp+stPtGT8AtVND6jsC9N8kEiPthDaYszmMK5uiaTLors4HZIyC2n7fnlCpd5JSQA1w4LdIBYv3kCcGdGGLe33rPPr3PEQH0K0YEahwxeECEdb4PSbkeVNGv611VkYjko+gOYK7tCZ2g3k75ZUMv+f+5dXGq49nsWpvZzOS8bFbTYqpLOFpT/ghNvOY6B0TQs7dIex/mqsEqv6VocfUXQ50RXxZHxEntKHsVqdWtUhP2jKTSBU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cfc530-a2a4-42cc-882e-08dc3dc1c3cd
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 09:42:42.1954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LNnqQ8TenNjRjC9oSJOzuEw5vz8DexawEQAjnAwIdjf01hCczXFMA728Xrt1BV0XHsQpuPEIG0Awua8LUL+nMgzgOXaAlba8g/J7qBlLsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403060076
X-Proofpoint-ORIG-GUID: 56mCNlgLWfUw7DjxSlS8Dw3WHsDfnli5
X-Proofpoint-GUID: 56mCNlgLWfUw7DjxSlS8Dw3WHsDfnli5

On Thu, Feb 22, 2024 at 04:30:01AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4893c639cc3659cefaa675bf1e59f4e7571afb5c
> commit: 5954d6aa1b01ac362d88df2f34073cd23e819c89 [8491/8619] Merge branch 'for-next' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
> config: x86_64-randconfig-a016-20220509 (https://download.01.org/0day-ci/archive/20240222/202402220435.MGN0EV6l-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220435.MGN0EV6l-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402220435.MGN0EV6l-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/xfs/xfs.o: warning: objtool: xfs_da_grow_inode_int+0x6c1: stack state mismatch: reg1[12]=-2-48 reg2[12]=-1+0
> 

This is a problem with objtool which is confusing some addressing mode
and incorrectly thinks that a saved register has been restored. I am
working on a fix and I will submit an objtool patch (shortly hopefully).

Rgds,

alex.

