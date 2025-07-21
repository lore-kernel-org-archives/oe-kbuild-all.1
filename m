Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0D291C07
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099895; cv=fail; b=ZhjLfzJX1LpGomfFitNheW9jiIfdSH7ETdC14q5J0iGBsexpHzcIxz8+STYA4PFmOiveLhoL1V4vHYLuT7bNqS5JiL79yPvGuo6J5nlQVNFVVetzAP0RQ7J6si6QKJvyovvglYKmwPgn1KeJIMczYt2HnlYz4KJcjnwBCpG6Ja4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099895; c=relaxed/simple;
	bh=99SvUfScWuexJeWwo3hPlCFP8f87IyiZleZKzTqS29I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jhLDKACfuZnQ7l5SFs1CZSvlzWrULwpXKm00/5nsTuYWOnWmmFMF3i35GHitBE/AOnaxBr77wX+mj5faumRBAEFeT/53L50yJlFuCxzyQ9w3ESxCgVKC8xaKiMxEBnVWdz2tofuANEVbxAKIT3igjS5l8ctyumiCqeyPVU6jX4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jawy4Da/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qYfZ0xJw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jawy4Da/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qYfZ0xJw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LBC5Wu005632;
	Mon, 21 Jul 2025 12:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dvu5zJNehODsyWvulK
	F50Ix2RJ35mjfWVmorCCqspUo=; b=jawy4Da/QjQGo8+IHo27xyva5MptltFe9u
	COytVKNepv/CgZix7tRIThUcovubT5+KfwYiotNvO6SXntLsbHkw+XEG1aXeQOsr
	MqZGis3ITIf+hdvFYScTYv80kKdKr5QFp7iFbIP9+DrJepGh23EW1xYzwtQPxroL
	sJdbtHB+JPuh/MW/SF/2gqbI0J4nbsyG2MuWte4ajyMovaZL+nET2zt7FUjLRaeB
	RsVsi3QM6UUmtRN3Ts8Vfg8J6hM+iz5qUm3r/KdZsa5y8C/GOvFvTK1jd2rG+vG2
	5qBlhW4u5F7nRXhBc8yk2IVTT2XUZHXT2uTTXD9/lDRDSULxbChg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpaer6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 12:11:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LB3bKb031544;
	Mon, 21 Jul 2025 12:11:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801te81ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 12:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa6ynpBVLfOqMJBkeshfrudbAuwqh7shDxYOtld30oeXpKt3v9kY6VRC5bbzqfVpvynwpYv1wnkSgQQu7FfwhSDjZF6WlD2zK5ZGb84N6dL8Gn6UEvPx/et3Zvx8YgCJEY0IqJL89cIsg6qmZAJ/pTfUDE6A6YfzxK2DCkYjSSdGjScZM9dPlF1nKpHwgHIq2VulzR0o0+zUfVNqCDTnGt9fe+j+7ybpUPH/erJlcdd3x4Ufu3/tHX0cGDFBVwDuOVEKQyDNFyP0w2C0ivAMoX8fNimp2mS+qRz+kH6zeP3OHKPF1lxWDEIjRa1FIN685JO7+Nls+EItJPHMEsI0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvu5zJNehODsyWvulKF50Ix2RJ35mjfWVmorCCqspUo=;
 b=QxpK3824Dfd24/A7KAjMGq61xej0AGnwdqfRe0ImTmxp6/d/ZjIRvPjiGiB3gmREfTu0Zlah3aL8VhMjb+acqyqxaFjzWZv4Gj9XCZQ/2kbqh63/Hmtns6bkJQ59aLaC3ncztYn9vG5LKCcFUx+vvAvCzIh7oPAjUkN0mYPFvolP1ml0NjQ/E5OxMZetVuctsajRVtE1TXztVdJSJvWpVbcbZ5ZQl27mlUUmAw0dWcqj3Pyy/dIaJW/mmJ7t1Nxng9XPj53uwp5KKd3QJspsgbA3TBYCuv6DH+lQWydrrgtOb8P56Y36QwW3qD51x/ccjj9qfkTdVC4MLOPpzepdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvu5zJNehODsyWvulKF50Ix2RJ35mjfWVmorCCqspUo=;
 b=qYfZ0xJw6QwBVhrY0STt+Lcp3Iy9BIZpHfVtJP3uGPE0JsFv44TdzD0YbtbRzMyn+mSv5cfI6kcb9fZZbbJsA+Xteb4jdz6JSWixY8bEtQ33KRTwozRkJizXVW0ATEPlmYGZ39k7hW4/R32Yeci9bWvabjHa5cGuwNfkI4uFVu4=
Received: from DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) by
 IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:10:59 +0000
Received: from DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935]) by DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 12:10:59 +0000
Date: Mon, 21 Jul 2025 21:10:36 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Juergen Gross <jgross@suse.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
        Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations
 to asm/pgalloc.h
Message-ID: <aH4uPI306ITiot7P@harry>
References: <20250720234203.9126-2-harry.yoo@oracle.com>
 <202507211129.Xbn2bAOg-lkp@intel.com>
 <50acb1ec-7b36-4073-8604-3132ef1e0447@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50acb1ec-7b36-4073-8604-3132ef1e0447@lucifer.local>
X-ClientProxiedBy: SE2P216CA0076.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::10) To IA1PR10MB7333.namprd10.prod.outlook.com
 (2603:10b6:208:3fa::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7341:EE_|IA1PR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa6e2f8-88b8-4689-5223-08ddc84fa683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f4TfCrci+PM8pIDG1WmgJdxqRx/ipz0NAlm4iq1uztblxYsVDSM+FoZRCKdH?=
 =?us-ascii?Q?zvaCWZnANSX4sgUG7o8MGFf2d3Bwgb0n1IfjEMT3jNlCoaD52rX007QoeDfg?=
 =?us-ascii?Q?RX9R63xGiwPyYsqMWaLUddU8/k+LFxgdYF27uZt44K+Qh4lsJs+YLbeo/Dq2?=
 =?us-ascii?Q?8b30aZGh0xTuTUJgGnWm3YdnKRAAOCV7J1inFovKg8/8LxWaw2sWEoI9U9K2?=
 =?us-ascii?Q?HrXj/8T12iMeDmUGPBxGPw9gOZIZAz5Cw8zzEJGpZbz8SKaEvD6rVv3rPu1U?=
 =?us-ascii?Q?CfbqgVsdTbDqL37rpzTdP35cyR8Kq+D27uEQkBYhMvwDPtMPJB5aSJu0YUud?=
 =?us-ascii?Q?R6o8+nUAZilZgasNRpD125gYcwsCHLFujg+Ewe4cHiZt5hbsOSSobjm2XpMV?=
 =?us-ascii?Q?gsM8Zi/PEiPLMiM6rS1lTDFVuR3bTZoeqAWu3UhuxAaA4BnQMiJeo091+uGj?=
 =?us-ascii?Q?8xNpokAUluwc5+mVPInHlR1n8oM5WExT6aIW95hd6A688PUmNWmMgpiS1LBh?=
 =?us-ascii?Q?uYeuPWLUdPjDT3AHaaxHCY/oITa/oE0KqN5UbqJEYjZXS3sswljN0jVVS0Cm?=
 =?us-ascii?Q?7NhYf5mQ78rAnij1YBGCkBJ/L9CgdEw8VoG4hBzsvThb7RpIQmMBlA1MvQn2?=
 =?us-ascii?Q?QjH4zPhCh8vXS1PVdJzijCle0OnzhNAPvu1idniv0l3TAqAWwKs63I+yNwl0?=
 =?us-ascii?Q?a84MhCELGorV/P6vYCw/p+wTQkZa80X2gxxcLcGR6nMSNoutUjSMLeso/DJ3?=
 =?us-ascii?Q?inBTnPCWSAK4uPNsLOma0KJ+RQXyN+pXSecKV/o/qA8y9dTaj8QfWOuKHmOQ?=
 =?us-ascii?Q?5MQgJuEfvkJskWBfldmZCz2bOtQw10gVNEWBSXVFUGOlHBCKjN3C+d5ajV8T?=
 =?us-ascii?Q?Qjeh0bzOlJvmFyEwgWfnZCOocymlyNmLOH64BUjh+7HAY5lH2WNJPWlK6Sg5?=
 =?us-ascii?Q?3DjmIno/0/l61Lb6zGL98nOQUpxJwwGIW4pyZOemgSOV2Pg+fXLmNaLHcpxd?=
 =?us-ascii?Q?l4B8rhiNhqHe8JVj4IqbIhedco7O2NphAWAQNSI2hevl5YjNEdPmx2V3SbDa?=
 =?us-ascii?Q?oHmIJBkNaGrzHc72l5Vrm3iSCcnnpu1nqG5SRQvlMgp/vniy0z4kQNmyjIC6?=
 =?us-ascii?Q?a8ieSigUf7Nhjyl0p9jUTlU1TaTnFv6katPsKCm57P59Ri2Tu1FroFHvBYfr?=
 =?us-ascii?Q?UIjChF0gSd3pK3NMbb6PVGp0nLKccmsOYazPCAsd8OEYx9oWpkikEIRLqjN2?=
 =?us-ascii?Q?gBfolUjjRLBqaWXSI5fc7mK3ezmEgYY1206c+kct+ECLbaFQe+yoeLXC2PLc?=
 =?us-ascii?Q?0E3hylZFQGbgGKGIYWSJPOt1MFqXLMh56nV/qa1ZhhF29Im+gr7CVjusoHV8?=
 =?us-ascii?Q?djj9D8Tt07ctge+GSlWd5/fkpWi2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7341.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9HjNl/3kJuaMV7djV7JUkkOtlyo0kd+3jsD5XpsWdHM9B6TG8E3/h05vLqMi?=
 =?us-ascii?Q?U6xago/L4Mm5rlB+LjcS/kQWTmZyfdiodtf6Rkpi1x60m4rriSRk6FucrH1F?=
 =?us-ascii?Q?Y5H1HDK3j4R2QvcAJQ2NLq5p8U+0tG3kJhKSP1l5U16yt8kuw0fu7bvfxil0?=
 =?us-ascii?Q?xo1jtpt5mex7F82YF424VYOgza7CWO8EnRNLOCzIXG+vTyAIX4A2vjc/XnYy?=
 =?us-ascii?Q?dRHnsoXQ3t5RnqQtZBglDhj/GxLH0Alw6uUzrEuxoSTgzfZR9STeMGVp8szX?=
 =?us-ascii?Q?TdiFJ4AwUO893dO87Pl8FnxGlPJTdwpqrF0S23qfadCqp2tA/e1qQ6REHR3u?=
 =?us-ascii?Q?6ppqvCiq8d+U3ddfkjkfV+z5OUixGGGtYgcL8BNfjVZIpJg4tk2FvVHCkjXp?=
 =?us-ascii?Q?bpxR88rM9sc3c063Zxr3UXs5KSgiMUA7VFXAOR06aPvE4mbMVopl+d6YdkKV?=
 =?us-ascii?Q?kpdcIKKfKGIcgoSx0Jc7FMzRIwpNJKiNLT0uYBOyfJkCTdqs5kSQmgEQsd5l?=
 =?us-ascii?Q?ZlFVZLmFroX9npUQQy+Lk8wx+Tmg5u9St/dXAdBWq0YdUzOSGDYmnineUHCe?=
 =?us-ascii?Q?kM4FSN9K8gUheI9HECcYNXMv24WuFXdeYO6jww77maes6/L0XHITEzJ80xje?=
 =?us-ascii?Q?ZeKcKcYMTjxYCGoRsxOulEmQuUnpL9/no6AvrsllhMF8aGiYE+S9Ksi3W61E?=
 =?us-ascii?Q?3lZTYxxcAJTUvlphwby5SoEHgIRLlnEfduX9q3t59thY0/j7QGf8W8UZGJQL?=
 =?us-ascii?Q?odX+vp8huFUIp/R6EjqNofk363q0zi61atgpZlZ45/RNzHOn3Dg2V67XdcKm?=
 =?us-ascii?Q?QTB2GWvJ+MUPQoFQwoj+p91gqUf3wn+8Tos1IFwlbq1GvuggNdmMo9Xt1jNw?=
 =?us-ascii?Q?PhAWOSZ3FzaTNOI+ltuJbVAPFZ+rpmVIoW8HEImlc3Go7Jli/bBRExbV9FaC?=
 =?us-ascii?Q?28sAMjb37NJ3reUOrRP4R0NFBf8eeNMvXVQ+zznpMwfGzYCEq0T+oJLMwkQp?=
 =?us-ascii?Q?9FiJnGHju3DErpc3HcpbiYSTJNn2Bq+rJUSgp0LM755fY0OAoDEVDh7q9Zjl?=
 =?us-ascii?Q?JCnU5HuqoqM0LwbO7uis8LV2KNRPYQaRUXMtAKGHXH6sKPRL8FcZRFNHhcmC?=
 =?us-ascii?Q?oiFhlvdGfWBoF9HjCX+kUzKUf7ERiMfWyKUl1THAF/eNBAXoxjVbZpkHDxHH?=
 =?us-ascii?Q?1sQU2qEn6iQLm5hXV3a2Ia5GAg8mu+8iZHT3oBvbDLdVNj0aW1EFHutgBml0?=
 =?us-ascii?Q?0yhh3/i2JNLisZR3gMB01SlvcBg5cz4ByfJHVLxs4qXJCXfvgL7fIbVAQo2m?=
 =?us-ascii?Q?mV8DV4gSvktqdHr8jUce9IOUJkW5MPfeDOj1KsviAnUisy46/TroPXgUyRPM?=
 =?us-ascii?Q?FpkHbLUIjuEhQFOtNRf4S/Vg1cuErAkazDklA/qM/9T3t7EuODzVH11BWv9E?=
 =?us-ascii?Q?fgOiXpR/xeiBFxKJSpEtPI34/1SYHGsBUJEUOswLHmlzcWvigppt2Q6K5Yys?=
 =?us-ascii?Q?JoqUlNmohf26jnuOzyXYR63bQQCRpI8IQOA3Yj2tahnBQHOwC/O9fyGvrY7A?=
 =?us-ascii?Q?sFvEGQtRTmu3IkB0czBcr2XaA6dC6LpnzDbr4Jf0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UyBqfq9BL2/qLlahOGoHxLm15W/gGDkvr4zSAE0AbRcytlHtFOPKNkeGCAGbLO4qeq/4m0CjEUBk+iZAp0+9jjzAoFcVG65HPVhYnB4MxRTJLwfjJKLFV72gSt4B6oqFkTCGigdMiVqJiWFA2GONa3UPIc6iU6jwCTU05J9LKoGhHiNzsvgvCJmyO51fqKUq8vHUdkPBJub/fB9ta877w/1k6MiSWOP2Z1C69c/nnBJiNxzW6K5IFCKxfOzXmk7TVQxN7UWgo5NHukmzwxCf0Ht54xkgbA5QubC8Le9EbeCSJas63zjp1movm+B8xReEO+Fcp4mhny8VJo23z6Af4zhfYn/9ih+OhD+hOf/3HDWA7LdSGyuWtkrYSbTA8/DgvDikZgS5w6201mMwjC53PSQzST+pB381gP8aap+FhAabKgyUuqyxxfpRh2RxAFvRsJmRI4ICG9hyRw+Bv9Cm4/cKoS6q0MzkdKdoZn54UqGdzBCMi/4kXQh5rFuZ5yR53WrrCybUtqeqo4dq+tnRIH61RshuVcdER442ef6MIjOSfbBtkBUqiSyNhkKfD26NV7UVGW3ewLB3JEbv8aPa2HreTbHQvOdDYJ0uL+tzDOI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa6e2f8-88b8-4689-5223-08ddc84fa683
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7333.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:10:59.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyHnHCAz9Lh+WVPsLMPgdLLmidlgdYiOgDBrqs3WenVo+44V/qFE8tMnL5f3JIefwR2lgJnZIErvhsum2kU/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210108
X-Proofpoint-ORIG-GUID: tgS5mAyfrp7xDC50ikIzLmMBeJICl3Wf
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687e2e57 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=ty8i9cGNfyTz4RMxukIA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:13600
X-Proofpoint-GUID: tgS5mAyfrp7xDC50ikIzLmMBeJICl3Wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEwOCBTYWx0ZWRfX3qkGYk6uOxE7
 BTE6DNGYYa2ode28Rj4FW9Ph2QnDgvS2oaEsB7UnHHOqcywkWocW6TTvEJlxr/nhqgXxtzgevKx
 sz2ppRRxFbK0RTf1GGoQnOFOpGK1dXwWVcCS4WrsvsNRBR8PzDaGCIQer82lnuUljbHQgnFWSMl
 N6dBIc57+HEL4L/w3WNg9ckCpLFVUSDx/jYgQGWa1sfOwuvQUDW9aH9k+pbTV+JtoJfJcpkwyqL
 OEPbkacLyv+KhjDn+KBJZU31RDFW9/QwDoGTx5Zq3Egh5DmgE2Yf+8q2Fyt2WAKPK3H5Kpzh+Lk
 whM+72K3D72HDSU8D9YtVNpnrks+KN4Q94aeyb9o7U+kvpVw5ODSQI9trMCp5pAORQ4mlZCq3AH
 Bq2rugCpgyZpIPKRpqgmJ+ZQXX4kd5FlndHfeM+1jLM0ZO8noaB0e5KZaDXxCtH6/CK1XEyn

On Mon, Jul 21, 2025 at 12:38:27PM +0100, Lorenzo Stoakes wrote:
> On Mon, Jul 21, 2025 at 11:40:10AM +0800, kernel test robot wrote:
> > Hi Harry,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on akpm-mm/mm-everything]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-asm-pgalloc-h/20250721-074448
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20250720234203.9126-2-harry.yoo%40oracle.com
> > patch subject: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations to asm/pgalloc.h
> > config: i386-buildonly-randconfig-003-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507211129.Xbn2bAOg-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arch/x86/mm/fault.c:265:6: warning: no previous prototype for 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
> >      265 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> Looks like arch/x86/mm/fault.c, which includes linux/vmalloc.h (such an odd
> place for this decl!) needs to:
> 
> #include <asm/pgalloc.h>

But in x86-32, ARCH_PAGE_TABLE_SYNC_MASK is defined in
arch/x86/include/asm/pgtable-2,3level_types.h, which can be included
via <asm/pgtable.h> or <linux/pgtable.h>.

I think it was a mistake to move the declarations to
<asm-generic/pgalloc.h> because if a file includes <asm/pgalloc.h> but
forgets to include <linux/vmalloc.h> or <linux/pgtable.h>, then
arch_sync_kernel_mappings() will be optimized out even when it's needed.

I'll move them to <linux/pgtable.h> and let architectures
override ARCH_PAGE_TABLE_SYNC_MASK by defining their own in <asm/pgtable.h>.

> This seems to be a 32-bit build thing, as your series builds locally on my
> x86-64 machine.

Yeah, I only tested it on x86-64 (with 4 & 5 level paging)..
I was unware that I was breaking x86-32.

Thanks!

-- 
Cheers,
Harry / Hyeonggon

> > vim +/arch_sync_kernel_mappings +265 arch/x86/mm/fault.c
> >
> > 4819e15f740ec88 Joerg Roedel        2020-09-02  264
> > 1e15d374bb1cb95 Alexander Potapenko 2023-01-11 @265  void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> > f2f13a8535174db Ingo Molnar         2009-02-20  266  {
> > 86cf69f1d893d48 Joerg Roedel        2020-06-01  267  	unsigned long addr;
> > f2f13a8535174db Ingo Molnar         2009-02-20  268
> > 86cf69f1d893d48 Joerg Roedel        2020-06-01  269  	for (addr = start & PMD_MASK;
> > 86cf69f1d893d48 Joerg Roedel        2020-06-01  270  	     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
> > 86cf69f1d893d48 Joerg Roedel        2020-06-01  271  	     addr += PMD_SIZE) {
> > f2f13a8535174db Ingo Molnar         2009-02-20  272  		struct page *page;
> > f2f13a8535174db Ingo Molnar         2009-02-20  273
> > a79e53d85683c6d Andrea Arcangeli    2011-02-16  274  		spin_lock(&pgd_lock);
> > f2f13a8535174db Ingo Molnar         2009-02-20  275  		list_for_each_entry(page, &pgd_list, lru) {
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  276  			spinlock_t *pgt_lock;
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  277
> > a79e53d85683c6d Andrea Arcangeli    2011-02-16  278  			/* the pgt_lock only for Xen */
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  279  			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  280
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  281  			spin_lock(pgt_lock);
> > 86cf69f1d893d48 Joerg Roedel        2020-06-01  282  			vmalloc_sync_one(page_address(page), addr);
> > 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  283  			spin_unlock(pgt_lock);
> > f2f13a8535174db Ingo Molnar         2009-02-20  284  		}
> > a79e53d85683c6d Andrea Arcangeli    2011-02-16  285  		spin_unlock(&pgd_lock);
> > f2f13a8535174db Ingo Molnar         2009-02-20  286  	}
> > f2f13a8535174db Ingo Molnar         2009-02-20  287  }
> > f2f13a8535174db Ingo Molnar         2009-02-20  288
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
