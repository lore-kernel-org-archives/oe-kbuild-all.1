Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CE18FC91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322286; cv=fail; b=UxNxU9l08dCnKurtCtTJZZQL4Tll9FR0k226G9GKx99VBXNpBYRLEDD8IVwiYcVAh6MCdBezC59ICGALDm/utMg0A4HAVIFwJH1+qAmvV+D6EpsJscAtcvYCaQXn8DC7JcKOcwIxQaunuMQwrv9VsvsiMwz/RYk4nQk9q8G1x44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322286; c=relaxed/simple;
	bh=B0NgxzVzMg3yXugqtgtD3cXPYO14IMRf3wb2wfYjogs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R92XEw+EMByxE1LhEQWH1Iv4F5i+x/hcdjAI9A4c9KwaOKpdZG7/sIy66+FH60bA7vXRiWo7LMJDvgPP/PIJqbbJiMaQC+AvdY+v3kV9M1BMsjsvq4Hm4B8rKNZBx348dQPArFcyS81D3Sos/p4scbpoitfrGVuarKz/7fAiARQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hv386G9s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cI5WIgfW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hv386G9s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cI5WIgfW"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1qPO022296;
	Thu, 15 May 2025 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=47Ik7jTqL7JdbcIREF
	t12GDmWxXlDMgLJllHtrnivwo=; b=hv386G9srKVc6qijm8lsgjsbUM9KwQ9Ns4
	4TPEYnZL0e97lFICFsa5x/DCfgGUC3CNpPYPtzvkQuzQxDaqGvnyp2Bvs4zWb6+W
	bJNYTISeSr88H0W1kCVEKNydtoj809MtIVIzcet8mKquR4/rhy3IkojtHOWowHqJ
	3pE6hsvj0VAPLUtTlEwNheLCchEuMMfBcGf0a/tpMs72CZpAJp9Rik7ciWh6LEPS
	23Xfd0Psk/shrvARDXJ9mzLVnRyfMnYmB6IKkSuRcoR/gp1aq0cf94BYrsW6XymQ
	XFd01meCGCknW7L5542AKAikj7g46b/zeBfJ3UKE/Rv1hQqWKQ6Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcm4d0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:17:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDtgwG026661;
	Thu, 15 May 2025 15:17:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9fe4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 15:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrIfD7FbF/+LBOUYFqEyOd20mVTB1BFryeE1KFDJUAo//svEpF8PToAHFIBChv1TRKJ6tpBejGr9IKSG/rA5fYlgw3uCSV9TYdwSq8ltBy6BLmqYZ0fpgkTlCHfFQKZggthfWGPon6tTHKHhZU3Ad7WOcOmkG5wIfoHLINNuvBuswoZgHNdM5BSxv4tNcCSlTxRWpQH5xuLO4wGasT0SQeVmIIxj9ZC4h+klVsmox1R/KvS2GCaklQQuUOplzuiKBXkPWJ8uYMVrMXJKd3SqKv6DBEfJvfTdu/kANvscbbvbznSqGCNPzqhLGhxwIiXxdZ/locLJjWMUPi9v56ADeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47Ik7jTqL7JdbcIREFt12GDmWxXlDMgLJllHtrnivwo=;
 b=ZMuNF405aJabwfQXE41Zm96KSOW9iwD3+k8z19AZUfrGdNQdjrPYFqYf7m73rRlQlHT1HqMCItiDguouMgnfdpDmySslQmVPkoTFuEb03U/k28YaA4j+zGywsWU/ZR+KGWKohcDHp34xK4JZIcDSIuYp5skb1vDijeb4B4d4RKjx+IiZjXY31yxALUvACb9asH9LmsK/jMeJw2WstCYtNf/LOZgFsgI6owIvPF1/JUrNoPrvX23dFJcKE00qx9YFhXuMFIEk0Cv3dlGFaZ6e8bPJPwAVJWCk1zB+jL0Rtdccc2nPQ96UCX2Sc0J5cr1IBexpXw1esZSHzaXIdz+JYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47Ik7jTqL7JdbcIREFt12GDmWxXlDMgLJllHtrnivwo=;
 b=cI5WIgfWZsEKOOoFzrl7UTXfSV7tSQZDdfP74OkiQgUWQI/saDmSBjQSwl3c1AjKZBGzeH8Ygrs8DBWLvW74KdRJviUMUfCGarAwC9n4726YstVLYsxUJEoF6xGwZ/XTI1VO6dwLmX7i+X5yCA6MfS77B5ohQzPHzrFLzZznUH8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4634.namprd10.prod.outlook.com (2603:10b6:806:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 15 May
 2025 15:17:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 15:17:49 +0000
Date: Thu, 15 May 2025 16:17:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
        oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [linux-next:master 10717/11408]
 include/uapi/asm-generic/mman-common.h:16:25: error: expected identifier
 before numeric constant
Message-ID: <499c469c-e6a0-455d-8bbf-6ba62e3b3745@lucifer.local>
References: <202505152329.ZRMQwmrx-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505152329.ZRMQwmrx-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7e3393-e353-45b7-0b71-08dd93c3a748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?88rcBljCEOcl2bst1vVZi2Fl9mpw5+iIl9eMA71+3GGLo0YFsFL6xabMLyC1?=
 =?us-ascii?Q?i85mAc/fJryuDqlr6EoIY++PiWz8nEEynARcOycUOSj9je1SjqIAMeJUhzuN?=
 =?us-ascii?Q?iiS0z3UWsOGvTv1ZhAnVXAjM5SjmpeSP8x8sk1RUymtQv6n4AkNEal/iFFim?=
 =?us-ascii?Q?SwIUMbtlw8qLQLIQKmPePPP5d80MTXy0NdkFdzwvac5+1puvjlPuLejZkW1h?=
 =?us-ascii?Q?HrCAZP+8jnE7q7+94KMegM/+jfJvBHarbQQO37cpFmVY9KXUq/YsoKGEbR9/?=
 =?us-ascii?Q?UUjulPRMZsQtfRta/N7CXDamj8Cx+OvFoHQUv12VXPEDuWhctCeUOFhrz+jM?=
 =?us-ascii?Q?q97xdyMhqJBdH8ejG8iE0rqAztin4A7DW/pCo5twaBjw1JUuZU9MoQb4u7Qa?=
 =?us-ascii?Q?1Jjt192xdtNj3LylYuCMfxeTIAdGQXBVfT2Vq7Mko1a1xm+t5PIok0aVbEes?=
 =?us-ascii?Q?JSD2bRyezqEkISmkUog3XE5Bp10WpcJAI5Le+ZSz4OCFd7dMyR6F/VR3R3FS?=
 =?us-ascii?Q?sT2lvwR/FnHpSMVFUTTdbQvTl6TdCFd4/n7AJDmYpna9UjWC6+91HgdHbHo1?=
 =?us-ascii?Q?c0Um7v/Zu+cOCSgjw9qK0YtD4UlEzHUhXeI9by1tmdAz1p6rfmJ5rq2B5z6v?=
 =?us-ascii?Q?eBomC3hX3trz9Jf11+xlXMVlNBaTxYVZY2f8RBjh60UainnHmvDvaAOWdGH3?=
 =?us-ascii?Q?FeR4SLoMoGpr8wWyOOgvOiTIJNQByC5Y4A8rA5H9FZDev6Wg96H0KOWLwnxs?=
 =?us-ascii?Q?0ofa8afz2LKCBGYvO6nP79mmGx0mynCy+0/S66DfUtg/MC2syBq5EVM8FC+m?=
 =?us-ascii?Q?6TaIyaztlQQHiCVEb1KIbXiXdKsDzauYhwFzNVtop73WOvraw9lSHQNzPcrB?=
 =?us-ascii?Q?JZXZLiDOSfQpfe0wPqTFyY3VpCw9+Oqpi7nB7zDrDbas5zvFkx8oOJhkJfCw?=
 =?us-ascii?Q?RhLKGBUAXKS0KsGxhmqFHR5h2uu6aOjhsouvGXyWFDvMt+hslohPCw523ugl?=
 =?us-ascii?Q?weNAfVWdpSF1/fxfulRUW57dlASgcu4ickH+vP+MyHJbAdM0Vv2HcEkPlUdL?=
 =?us-ascii?Q?3GxoZ1Yirutf6/IUitM0uIRmlZXhLBeSg0CKL1XZqtKMeqytYEHGDdp3grf7?=
 =?us-ascii?Q?EsW0Q6ULsctuL8g2Oa8nzh3G/vkQfvAc9LmnDH/7TzxMNAzmEa+2LB/ZsRhl?=
 =?us-ascii?Q?xPgx68eACLMWr+5K73/vP93sELI6TYYT0ZWtb22zV/E+8q8jz5BnWTemwpXy?=
 =?us-ascii?Q?6H8iObu1oUt/H7YtpxJ268Y4YLr6VoTEn+ggBg5Fl2VRhA7xm7IYIGN7ff/b?=
 =?us-ascii?Q?fo3G82yscfLde6m0SnHv6tPgVD2EQg7VP2alCuC3cEorJTVIhTkg0S9ucd78?=
 =?us-ascii?Q?fgFBYuAHhimBlnFUtQ/R9ezPQxlQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aYyD3pUjj289fDsROmRw6UkjQ+MgkIxx4ZsJqhFNh1kXf3vEjeGBSu7x2c27?=
 =?us-ascii?Q?FUw5rtx/hAXchQluMBoe8tnJGZ9gJwUXA674qMFsUtEKg1fyUbJvhHItyDxN?=
 =?us-ascii?Q?yfalI/iw88u+KXAhcPlW5o/cRu8KrwSB0wULCkJfXLqf67r9T0mFfC/JpXu/?=
 =?us-ascii?Q?hPskNDtPMgSUqkGWLWnq25JO/UxKHzYvbN2OI2b1NrYuh5HK7d6qw7JmvGAj?=
 =?us-ascii?Q?lNvrrtXZ8n3VcMeJyfOwxMFtd0U3lRMEuA7U4sym5xOXqTjuORq/jf4H0PN1?=
 =?us-ascii?Q?LiTHVIwkcVdjFlKomFeuUYUbvAvMJ5GDTCmyPG5wjqkkR5Ty5i6Z11uhd1Cj?=
 =?us-ascii?Q?blddy9lWrhmiWYZuGKlvF2YshXVvPRgMfQWrdMuDZMV37WN4rhA5SOaCsMQP?=
 =?us-ascii?Q?76A0CEwOKbUTGSZnvqz82LLmZUczO8I+HhUYYW2Ck33bQRDOhy5vBjGMW9gv?=
 =?us-ascii?Q?GZXumkvknfp/brA3bo6zMet/lLI6N6QGcrwiAKTeVtHUlJKAJy9xyl67w5bb?=
 =?us-ascii?Q?L8gh462gzyrEZd8i079mh9WEgJu4B/xe13QfdF91uHuWS1K71ipn0PfkWpRV?=
 =?us-ascii?Q?UxBPzIex4rjevwGDbnhRNztpkFnHmPLd+2sebVQNnTwkA+/Z7aJc8bKu73uW?=
 =?us-ascii?Q?EyNVkTQ/nRk6sX4D4FVtOJb1hf+2F0evCKgiCNI63dHZ/3RYB8xMu1anmg8w?=
 =?us-ascii?Q?h19F9NIsQrkstu/j9Zti2YxT1s0i9pvTqkb5b67GT9espH7CurVi8gtrhAyd?=
 =?us-ascii?Q?/Uqy7uzwNbp2PlOQnRArOXmfqjBjQnio+gx1itbdwinjUEAAtLZltTeS6TCm?=
 =?us-ascii?Q?Y7y5jZoYDg8MlXku2JWmHPDRf1IrA6CR9JdRHG2eaMWYhO2BTfJRic8ZlExa?=
 =?us-ascii?Q?shY4bpxMv4u3i/O2RXnmfkX2TAtUIvYY7f1GaU3LQmdQZd0ZGFXC9ZHIFH16?=
 =?us-ascii?Q?05XNUxiMPswLaT6Dj8iYXUStFdOtyhIoriszGMIVzLw1PAl7UU59uwlr2djM?=
 =?us-ascii?Q?9HSc2WaHFkxi+tDRqigFRqsJ8QXavLU+r/EPIAdQFhMA6Xk+q0XcYLCqirHQ?=
 =?us-ascii?Q?OIuXDLEkdbIeYNCtvETs2TcB2wO5KBPvV9xHnzx7V9rtI4S6kRQl7ZxKTwBf?=
 =?us-ascii?Q?DQW7vAkJRxEFT4RFynSiZz2H9BSOzCvfpjfoRftbur4wU3EPqvLeSN85QNvG?=
 =?us-ascii?Q?gXxyRIn67w5qASitp4Mir1QByst/eMu5RKo9R3wlEPNKD57v1OaPj2x1XkZ3?=
 =?us-ascii?Q?dChB0J8ntgpTRwK2lEzbaPZU5QSn3aRDLoKYx718hFWiNOIvNGHBFi+hO1x0?=
 =?us-ascii?Q?Cz3uB4vncuKaLOqL/9vA49Kku81GKOCUZd+OF0iQgeD2SErGZ7iUfs+JzaAZ?=
 =?us-ascii?Q?jcfK2EzHZf/30NM8b8aIiTwhKGi82XXeLPT0xZE9mjO2VE2b5RCNGgTaYMmo?=
 =?us-ascii?Q?jif9DEmkaolAgSlVy4Q+k1C60sm4HuFeQ5XKLPcKoSz3iEE9irf2uSp4gNw2?=
 =?us-ascii?Q?mdAwhkjkKgFqb1xQwzgihwYGoNeDKgKzm8ktZVxzoVF0XglN9uzACN8mODLC?=
 =?us-ascii?Q?sC90jrTrQAFYMHqwfQ3d39LnQmTTpV0Tx+c4i/+sA3C8hXBHifcPfWgO1Aux?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oAZQhMeqnaJ/fN9R6MbugTBq5/r2bu8CoiWkEYbMNfOfzD+bfsm02CPMUeCASYo3ujYjY1d2sADCm0cT6RSfTHc2XveOGAxrfyYOfY0NzdU3zHyjOFjs0DXey1E4gkMLI2BF/JQaHDi0vQv+h2oBc2blNBxBJifkMoxmYKYK5oxL8c4igXzwYRxKXdrHG2raXGWWm/DBD/CL1VTsQSZFGR3Z/KDBKItN58WAwW436kYDOl7UNM4TbAwIYUdOF2unyvl6sycQJhTLD2GS20M3C/3G+FCe40vfg/1nwdosXjYWWgDBUqdvJDfIdwdDP+ubcPGy8MlLO4RYgXW/fV6thnk+WrZRKXUFYu+Q/sBkLT4spCs+SkbvBmqz6bANXvTLjm5Jn8aGX64uViuQOqrLYAOdO3+l1/nZYn1TvRtr61O3Mrbi+HvZbgvGoFvOM1MwCjY0yU4tiqWMYVRRYy1BbysPoZNhnUL3fcPBIG/txE9N7ck6uTsxwaWZT3J5CxyEzk31qdbIHlqFsMdiRu3vjWfOrdfm7iBiPmXyzSZs7s3cLKSPfNb6Fi9WgZlC7I0eu0UVoDIL1LwcQMcjxbFjU6Jb6Bzw2ewXp54jrbVXH0o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7e3393-e353-45b7-0b71-08dd93c3a748
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:17:49.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NRhcI95A8h6h1sXsm4nFTT6Yz6wkZmCPAculf/Z3CI+U4ymzHhqiTji5UB2Rh6QobPJwueGMo3F/9vBneTXLH2sCQJScp1KPeHvNKn96Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150151
X-Authority-Analysis: v=2.4 cv=DZAXqutW c=1 sm=1 tr=0 ts=682605a2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=TAZUD9gdAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=dlI4R5ZWAAAA:8 a=Fp4n5dhLemYyilcCXIcA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22
 a=mmqRlSCDY2ywfjPLJ4af:22 a=_Et68LT86lDbNqPJMOLW:22 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1MSBTYWx0ZWRfX4dohNkK0YdrX S+k/Bgkl9526BFofcFBy9dfoFrhyzQ/o8y2OF+Hngdw7x02pvP5hmEZzDRxX/d4d71IBXqk1oGZ /nQ5nHEIP+WZaza4AGAwaNHzWCaKBr+4BzgjmMT3EBINk60/rc3TrXXgREnAeUl37TZw8wrfSoX
 TLu6S3caysB3RzR37l08cNxZc3h3IggUzyM0A44W2ZP8nPNe3LqH7Cjm8jHBS41aZniDajve0/v /ztzMyP2jt0csDQBG8s3oULmTSwc1HBOWvKMrtifU9FC8sOEPVNNb48y3U16p3Yljno5WEQ4CWA 07qPULgbnOC6n+BrMNqyrNYbcCa9976QxjUG7WaZK1WJtPsUIFx0jnFnw5tWeQl01cgB9BjwvMS
 cg1B/6YonD1sOIxzqKqOeAPCE6/UoitB2uiM/l9neGRhIm5TYLIQUyhOOj34KJ6/2J41D/Wi
X-Proofpoint-GUID: upCPxN3Z8Sm1xhIxr_3fIjBzP79QEM7D
X-Proofpoint-ORIG-GUID: upCPxN3Z8Sm1xhIxr_3fIjBzP79QEM7D

This is already addressed, the relevant patch has been dropped (see discussion in [0]) and should
disappear from -next shortly.

[0]: https://lore.kernel.org/all/<20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com/

We are putting together an alternative that won't break s390...

On Thu, May 15, 2025 at 11:13:14PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   484803582c77061b470ac64a634f25f89715be3f
> commit: e9fda188b61524e6426fee21fe939ebc13866fc5 [10717/11408] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
> config: s390-alldefconfig (https://download.01.org/0day-ci/archive/20250515/202505152329.ZRMQwmrx-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152329.ZRMQwmrx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505152329.ZRMQwmrx-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/uapi/asm-generic/mman.h:5,
>                     from ./arch/s390/include/generated/uapi/asm/mman.h:1,
>                     from include/linux/huge_mm.h:509,
>                     from include/linux/mm.h:1016,
>                     from include/linux/kvm_host.h:16,
>                     from arch/s390/kvm/kvm-s390.h:17,
>                     from arch/s390/kvm/gaccess.c:18:
> >> include/uapi/asm-generic/mman-common.h:16:25: error: expected identifier before numeric constant
>       16 | #define PROT_NONE       0x0             /* page can not be accessed */
>          |                         ^~~
>    arch/s390/kvm/gaccess.c:321:9: note: in expansion of macro 'PROT_NONE'
>      321 |         PROT_NONE,
>          |         ^~~~~~~~~
>    arch/s390/kvm/gaccess.c: In function 'trans_exc_ending':
> >> arch/s390/kvm/gaccess.c:344:17: error: duplicate case value
>      344 |                 case PROT_TYPE_LA:
>          |                 ^~~~
>    arch/s390/kvm/gaccess.c:337:17: note: previously used here
>      337 |                 case PROT_NONE:
>          |                 ^~~~
>    In file included from include/linux/compiler_types.h:89,
>                     from <command-line>:
>    include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough' not preceding a case label or default label
>      214 | # define fallthrough                    __attribute__((__fallthrough__))
>          |                                         ^~~~~~~~~~~~~
>    arch/s390/kvm/gaccess.c:343:25: note: in expansion of macro 'fallthrough'
>      343 |                         fallthrough;
>          |                         ^~~~~~~~~~~
>
>
> vim +16 include/uapi/asm-generic/mman-common.h
>
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15   9
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  10  #define PROT_READ	0x1		/* page can be read */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  11  #define PROT_WRITE	0x2		/* page can be written */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  12  #define PROT_EXEC	0x4		/* page can be executed */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  13  #define PROT_SEM	0x8		/* page may be used for atomic ops */
> d41938d2cbee92 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  14  /*			0x10		   reserved for arch-specific use */
> d41938d2cbee92 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  15  /*			0x20		   reserved for arch-specific use */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @16  #define PROT_NONE	0x0		/* page can not be accessed */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  17  #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  18  #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
> 5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  19
>
> :::::: The code at line 16 was first introduced by commit
> :::::: 5f6164f3092832e0d9b12eed52e09a76bf39c64a [PATCH] add asm-generic/mman.h
>
> :::::: TO: Michael S. Tsirkin <mst@mellanox.co.il>
> :::::: CC: Linus Torvalds <torvalds@g5.osdl.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
