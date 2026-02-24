Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020075.outbound.protection.outlook.com [52.101.193.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133426AC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955111; cv=fail; b=KAtRZkYsLbLOGdfDY2eXDdqxMiwQrT3m2Un6dBcvkgn3URt+oBSZvQjThNVApNbjj71r72z3XjzrbI07XNP8muOm5HWoobRkLt/n4gGBDQwiQeivMqtdaFk9zhxnJu8zFkLL+NB0zVdnpu1cM23rW9w3zEQSffhBhdc8JlAgcHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955111; c=relaxed/simple;
	bh=PJf+TFqhteuOu8MHzs3/ncVMIObobFGbt5ZmYLlxjYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V9K9q8frfNjXOh+UuqW9FeJZj+ElqNAy2HArp6B0YIWm9rWqndhhYOau+D5P6tfLaCTZoqij1HBQC3U724RRlEyBjVGBX89g61YEpYNCRs0NYeIQWdWsfCJ7jmbgZlaT5lliYXmTOhdFSXslTzxvR3bzKMI5dvab/o1Xu9+Rws4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=Yu66/8AG; arc=fail smtp.client-ip=52.101.193.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="Yu66/8AG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y57FJ4ib9Q05Pt7F5Yy3yWZaxLInO5Omy9+ewhKJJIxjcBfQtlmMGtR1NqqfLZRrGRWdYxcU9zAJ4HWVhMWe5WEOVc4ni8+c7RPlXtnFaZZdiqZu9KYcxP2aSGONpgzS02r9LYhxvymUkD6jpQLusJEdsXngEbmWdDEe/gWAGRqup+FQtqMmmeQumXyTUPopFSvhaYpoidEKiLIk3+fYFUah9ljkUo3CpclwE8M+lZZQx6LMIoAe/j4bbChrDhyhY85Aj97G68CL7z18B8goTHPopw5afsNYPNsOSCeEfMOVnnzR/mv9fOsVKyLJwvrUklRr8BxnnFERVZ/dz44sIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIjfD1Zx09g4kbc2nREDz1z4Tw2LVzxG84w/Pn1akoI=;
 b=k76GHKjdpyzqLlZiQLmbX9u0an8IDIBq8OmomjckiFo7xs9PHSLm7YWNlbG/LT63lSkvHkjrMYWOKU3KlXjAidclQrrYLAg+FsvuwNG5Qa9GRkHQILFdzPTBtVFvcm1gVGEdenX52DNXi14T1OMmNv3NV9jJuGqr6XhgyBr+DDWBZtXcitxb1WOkU/dkKImBPLA7wd+0C/3eYwF6kYCimurjU0TVvksK0gfk7jC+eVA+0cwBwS8LdkiiNll4XhS3MzRd4k+MhmtHC4Kt0PQJWaTE/xCbAPRp29mAod769PZBJ7uMHiWj+w213kV3SaM2so4iz5v0AxHgDn4aYTp0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIjfD1Zx09g4kbc2nREDz1z4Tw2LVzxG84w/Pn1akoI=;
 b=Yu66/8AGC88+js8omj5JKx+EZ7Q62S2FPId/VzflIaGFn2Vqs9OvdMg13mM822HterYZcp20v8Hq36KcHkNXHm61HMVSOR27tW4ffTWwchhktCqmRrtG892EPi2azn5UyhpXAiMrrYNBoLBLAjoZrj07edrqb+Y0lGwzMsmwxVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hammerspace.com;
Received: from DM8PR13MB5239.namprd13.prod.outlook.com (2603:10b6:5:314::5) by
 SA1PR13MB6593.namprd13.prod.outlook.com (2603:10b6:806:3eb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 17:45:06 +0000
Received: from DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3]) by DM8PR13MB5239.namprd13.prod.outlook.com
 ([fe80::fa6e:7b5:d1ec:92f3%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:45:06 +0000
From: Benjamin Coddington <bcodding@hammerspace.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: Re: [cel:nfsd-testing 29/69] ERROR: modpost: "__crypto_memneq"
 [fs/nfsd/nfsd.ko] undefined!
Date: Tue, 24 Feb 2026 12:45:03 -0500
X-Mailer: MailMate (2.0r6272)
Message-ID: <2BB51201-EF40-4334-8D8E-30112099043E@hammerspace.com>
In-Reply-To: <E960A26C-F3A8-438E-BD28-AB5C29FA4EC2@hammerspace.com>
References: <202602250104.IwFsHK6w-lkp@intel.com>
 <E960A26C-F3A8-438E-BD28-AB5C29FA4EC2@hammerspace.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To DM8PR13MB5239.namprd13.prod.outlook.com
 (2603:10b6:5:314::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR13MB5239:EE_|SA1PR13MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b476d99-c988-4fa2-b9e8-08de73cc726c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fqQyYiJJg63JTtHt55bNJF63fRiSakA5XB5kqnU3uCWvPs6W3EM2ngGdGFK?=
 =?us-ascii?Q?Q0q+Yhvw2XoG/wFj3sBtWPD7IohpOhoFZMIM3dzKdt6tlD0SZRIIIF7BwmQ+?=
 =?us-ascii?Q?9d8J+tSjLtl88fnfu183ZuC/RGww2RSdkbxU4Gi6f/JImED4h/O96Sd1uRTg?=
 =?us-ascii?Q?4NihndENgepdPAM025tOp0zt52DMxgwRIaSgb+AFROrwboEtTQoe5U+yQgwo?=
 =?us-ascii?Q?THu5gRcuyOVrXjMQEQ1shWIMzI+YNf7mYQOAnv9JNACr7YneS+3b+zK0fnVA?=
 =?us-ascii?Q?fY5rc5xq6vMOlVsxPtLhRMQaLSyniAm4aEGqc5aN4yEjlO5vWuzGyMwxqGFW?=
 =?us-ascii?Q?164M3+ZZa3EwV82OWtkliYCRZqNUuTzGFbppWioDGtACyNbGgxUrGR7ELSeM?=
 =?us-ascii?Q?7Li1jjZG66I6m0FfJKsY8VJ7byhQvuQAkgcgqi5NI08pHvXTvoLYExug0l+C?=
 =?us-ascii?Q?JZM3iGHzoZiRvYfgv2Dg0hTocXrEOVrWuZIhyL5YnHlLfozDDIwXjUtKhXJL?=
 =?us-ascii?Q?ZwtFo0zzcJbPEeCrvfDlbp32ZW8VLN161fgQ2qRzuZMwudIEG6I0ff2MTpu6?=
 =?us-ascii?Q?qMXLZGsGTiJPzpbfJKZLxNMDTk2egkAbgfRqCr+Vy6pAJqV0ofDgoWHHC1Ft?=
 =?us-ascii?Q?9pH1Kl5LIVi+QEJaCU7vp2bplyVLDLZJEcg+CIDQNaO8kiIxFd1m11Q5tjOL?=
 =?us-ascii?Q?pF1eqQBHHii9iU2WoltwvBeHfVZGK/UwXxOOEXl9xKVgrEf6hXJZd+ul+zGw?=
 =?us-ascii?Q?M0oavYgjVF0FXTZcYI0Ou4Zy1PNkgLnkmyzyStcLoSwz2XJpcqjQFwV2l5Sg?=
 =?us-ascii?Q?c8vAOy8kCUm/ipmA2JkAlEGt2J7vjlq+dW+U2A4gyE8QQVomp/uri6bLCTUY?=
 =?us-ascii?Q?9oIsuxplhQCunP186jUAYAJ7C9Ec7fncAA1IDN3XJo9VpxWxY53fy6wqiwlm?=
 =?us-ascii?Q?KuP90TLQ3nXBDs5RldYUKR3w72g3HSCjj6eATXmOC2Kl0gVHwPZMB7b+lYt8?=
 =?us-ascii?Q?0BbJsFEUUVF9s2dNwuufZPCw+DKryG7yFByNDNx3hTig/Y2UHP21yGYYBKxn?=
 =?us-ascii?Q?pMh0SRvCRNoIh40Tr9glvFBgp6/mcHLqKx9tCtobbnEpy9bj7c9//LbGUveU?=
 =?us-ascii?Q?NJ1Q85CZjKxuj0AEd3VqLLKgVNnSiMWMMu/RwoJ+GiHiJh0CSXqFb/No0lRf?=
 =?us-ascii?Q?kn+ZpCx0VNCgwAKOLUnJC3zdi+rx+t05QxewgFvtCEBmI66Hc5et9f2SQF8Y?=
 =?us-ascii?Q?Y6yWTt8Uue81ktN2dNCWGGv+dVVF9nud1TomsMWCAcEZFH3E72BLzaFL4GHq?=
 =?us-ascii?Q?FSqv7j/mOmmnc145RfoJR6GEOTn5Batjd0sPkXZAySIk4jGSsk0NdXtXxUrb?=
 =?us-ascii?Q?tSa+8tq11xS9/Fjx3KFXHKJUgwSDTU+r0uF/IUKXctyak9TuS+guMCb4TWlU?=
 =?us-ascii?Q?yzo54mQJXjUIVCtzPkonXrroCKbIcvj0puEZxyGz+nX4rmCdlTdg561lbNGB?=
 =?us-ascii?Q?MAMfKwUr/xOSA1PM4hrJdxQXFUGh+8EICoWYPxAWxi2bcRe8ekp6Hzkgv8tL?=
 =?us-ascii?Q?llI2tM9wNWDlLBsTbuA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR13MB5239.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?79pan9kvS+Z4S6s54U9cu3fZt43x2/rw4BfOz7glGhjPYj3aQvwM5Cy+Ae7r?=
 =?us-ascii?Q?drtQ9oJZNrh2uAMErwVqD6E8sy4uNiTV47dxp8OK8UO2Wca6xczq5ZkOfK5y?=
 =?us-ascii?Q?v7IM5eF1pBBTko0qKA9U+Jlz0WxesM0WYd3pfAvrG9EPDxr1PuDY9HR2BTVr?=
 =?us-ascii?Q?dIhZ8sMy5TS1WyS5Io4tXkkDLQ6/IvMDqlJCyd/Hdv84E0EX4o2CNa15JnmJ?=
 =?us-ascii?Q?mfDHTBjGS/V9CGJthP0W8Wv820e1gpcMSc8BJFK3yUndQyjiqihjT2za90FL?=
 =?us-ascii?Q?UDs9V105frhtZtlgJy1ujO/ogkpfn9SKM12opRxYL6sS8ude4zfJEBpDtKSg?=
 =?us-ascii?Q?zANeQ9c12UTWd6FW44ZbUecB+FmkjwzD7FPMG/MCzfu6BEQfJY6swF2ITFaC?=
 =?us-ascii?Q?Zu/R9zUjqYe1pbco8QA3grBr33keziLcNkdJEYQiNWErxgRIA1LXUg2s2Gd3?=
 =?us-ascii?Q?0bTvnHAwOlHPRpMKQyDTRpvikWK1fANH8WDGnrqGw/X6sFRGYX28udDm9gNH?=
 =?us-ascii?Q?WhCxkXrMQOOJtv5rNIsqM0rDxcxzigdCltq+RQaK4Icj3zoLoCoC9/j06bwu?=
 =?us-ascii?Q?Pp189Jtj5TjxnCeFAbuVTbxbupOamtIgR3xLKqoMUUVWwAr/NFnOL21Fr6uD?=
 =?us-ascii?Q?l7mAJpkHaOXzhL2dgAq/rRB5YVQPh0i5Yope130+AfyB+QK3Feg3kF7HqSK5?=
 =?us-ascii?Q?JpfPLDEYd622sWGUgaNc+df5mRmVlovsK8GUrTLWW/8S50091PVXXXvxS4YG?=
 =?us-ascii?Q?MBHQzOxAO4LVsTXwIdHs5t3US5eiGj6y4HtRb/wTlyuVhJPwGZ0JarNmYGeM?=
 =?us-ascii?Q?GD76YPth4EQYiMcbBCU7jFeqasAQefYiEAraFXm3hw5uzB3xqQb3Zi6c9h1e?=
 =?us-ascii?Q?i3X/4SWA/PXcvTcqjD8HXB7uO6WJ58Uu2odR7rJ0ePxelyBQNKcObJNDIkfB?=
 =?us-ascii?Q?Z0Oh+mq8P0FA5yQJUnIP2eoq2VkD4g5SEGcZREunNu/QULpanjAfFAQhmZFx?=
 =?us-ascii?Q?CRrW2limNqIaibew10LFxatUjmKVdS6ajeNT/GtRAHPYnltdaAjaFSawpMaa?=
 =?us-ascii?Q?3IzrL8FTJ7r+6kONQT1Reh7qE4jQIQC1qdUrvEQj8OczRYOX7TZgTktNxNSo?=
 =?us-ascii?Q?0pXBsfnXrcnTMMoH5F5CyrhXjnYdxLUmuiAmvuhPB0e9g1wF2X0owvTwyAsJ?=
 =?us-ascii?Q?ZLXcSD6ouJf1uEk8Dc/7vKPlPtALNusPD0qY1gv3a5utOCoOSN9QLz8z0Ajs?=
 =?us-ascii?Q?UnjfGnwj8L/GSFlwwD4QupKeUjGUmrowe3AHIsewT21PizBAUeUgoaakO24B?=
 =?us-ascii?Q?xTJNx+jQnnaBmdbE3bRwkWjQTakyh0tRKvelphn/Xj8ZTTf+h8WbRx5YzLS6?=
 =?us-ascii?Q?T/ulZVK3UNtgbDcTq1aMSjbnuAfqNVaR9oydfRUmu5ER+TR0p0WkN0pUSajC?=
 =?us-ascii?Q?3mIR+dBo+nB6hdGFFsbT5/0orK8AS1aomhXbKBRd//x8ufGLDfhbmr3S/BXA?=
 =?us-ascii?Q?w1yprV02O9vbN0TFajNiS46nMuGgfjXkmk087QxK7ePYkAZeVEGA9hp1qspj?=
 =?us-ascii?Q?KjX/W4/R4UtaiTonqMKNTQsrsx+k5CiM9oSsZF4w6zY+c8R9GaFg09xwhvWx?=
 =?us-ascii?Q?U0+Pca+9a0HBrPZjpvkiaNEBkzt3GJ8p67XHIGOAQItg1Ary4AsObPJqqpKa?=
 =?us-ascii?Q?dls6zlnO63KUu4Ii3RaNOZzIsRBPbsk/7wL2f1jOpwuFGMUx9Edby3iOU2kP?=
 =?us-ascii?Q?dzi+z2IrMshVpDVAB+HIZv9dMUbFEqE=3D?=
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b476d99-c988-4fa2-b9e8-08de73cc726c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR13MB5239.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:45:06.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYR2Z/OGOHEE7yWB8MggqbxCzLlj8xUa1Z+YWN6uZGEUvK1wpf3N45w0lykFHJ14vb3vjqdNGumkRQ1p4hSWiGtEe5kUcKHFzaW0r0GJNxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6593

On 24 Feb 2026, at 12:35, Benjamin Coddington wrote:

> On 24 Feb 2026, at 12:20, kernel test robot wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd=
-testing
>> head:   70a2007855af80c48aa0cc86ad2a1c50b907e37b
>> commit: 35a0423a2954050da493296010d5c57e0d76f8bb [29/69] NFSD: Sign fi=
lehandles
>> config: sh-landisk_defconfig (https://download.01.org/0day-ci/archive/=
20260225/202602250104.IwFsHK6w-lkp@intel.com/config)
>> compiler: sh4-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260225/202602250104.IwFsHK6w-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250104.IwFsHK6w-=
lkp@intel.com/
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "__crypto_memneq" [fs/nfsd/nfsd.ko] undefined!
>>
>> -- =

>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>
> Probably because:
> # CONFIG_CRYPTO is not set
>
> .. which means CRYPTO_LIB_UTILS is not set, which would compile __crypt=
o_memneq.
>
> Several parts of NFS won't work without crypto - should we just set up =
the Kconfig dependencies?
>
> Ben

This fixes it:


diff --git a/fs/nfsd/Kconfig b/fs/nfsd/Kconfig
index fc0e87eaa257..ffb76761d6a8 100644
--- a/fs/nfsd/Kconfig
+++ b/fs/nfsd/Kconfig
@@ -7,6 +7,7 @@ config NFSD
        select CRC32
        select CRYPTO_LIB_MD5 if NFSD_LEGACY_CLIENT_TRACKING
        select CRYPTO_LIB_SHA256 if NFSD_V4
+       select CRYPTO # required by RPCSEC_GSS_KRB5 and signed filehandle=
s
        select LOCKD
        select SUNRPC
        select EXPORTFS
@@ -78,7 +79,6 @@ config NFSD_V4
        depends on NFSD && PROC_FS
        select FS_POSIX_ACL
        select RPCSEC_GSS_KRB5
-       select CRYPTO # required by RPCSEC_GSS_KRB5
        select GRACE_PERIOD
        select NFS_V4_2_SSC_HELPER if NFS_V4_2
        help


Chuck would you prefer to fold that in or take a new patch?

Ben
