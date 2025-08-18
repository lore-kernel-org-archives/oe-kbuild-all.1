Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AD2226D14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513748; cv=fail; b=QuXC9sVzngbL0b6db4qbAV9bwPNNVLdhkHFe3H1tvXkpEWLoR7xugrUzYwMwXFJgkHWuW8mpIHSpwfW3CGE/DthMxRtqvBXOYWeRJr1lQfMXXFJXyuw6WNXi/N2vWdnxx3p7mrWh6a1HjMLCqPdnthxh5dRA2J8TxFKV3PwYU0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513748; c=relaxed/simple;
	bh=+SYRrd8WtCu73yOMeSPw45iKPyU48ooTn/yCgWYsrTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qMr1c1qHd2RrXxbC/JK1Uqq2cWP6Gex2z15AGptXfbS6FCSn7E9iElZ6m0oz5SCQLW91LHZOMvslSmSoRhxDMBjZu5YlQMEY9KFIx23BM4tDvDYR90YhkVvYDpkjnbGEvLl+zYUxL86PXzuu73kogTDq7aEfZeMa+LW3+MzvxF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YwhnQslK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dHWE0Ts9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YwhnQslK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dHWE0Ts9"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I9f4MN001522;
	Mon, 18 Aug 2025 10:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=m6fuI6u+UWRS8I+IaX
	ew9PF19/uCJfG+kI3aob6l/h8=; b=YwhnQslKO0U1w1p8ioFn1guDcGwi4tvRas
	5U77j1v8E0SpaSGxwvdwty0Euqmph3Rz0RCIYMTKWCTuHN4FAYuFdR6y+eFK8c5p
	fZuSH7I4MHecC1BRY9RFnjxDKwsel3a6nHRj44glBOYilVcmRbD8iZbx6XqwkwGS
	iuINTQxEs3+Rrv57n6mxkEV6dX9b3yc/3+xcBfMtjth/n8l6RVyoOPeAXNTaeyIP
	1044MRiPTOhsdi352ktLiM9PQ7kVWb4V98K7keqCy5Za/Jm2kttH9YUE91Tzuzse
	mwu4xrEdDaAW8DffIT7XhZMf2iWuukQ967dzF7fLmD9RBk/gApnA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgk4jr2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 10:42:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57I9WSxp036742;
	Mon, 18 Aug 2025 10:42:23 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge8jdmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 10:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcFAxl2FZ8ajNddZk8ZXzOFKSOEMGQqoq+Epe0IjC0l7jyanIuUc3uR40Q/xutdEMJlFjKiGZuW+5kTN9q1HAAxOCVkY+1BGkg54yz99STLHY0VcR8zTYuu6aQZX7P19eSHYtK4EYRSflnE3qZEvKsPu74JJ4RBq2t00hW2Hvwd3XKB1YEBpluv7U/T+ii0YYDsa0ejmTADMSJDaxGErEo6X7i0eWvw3MX79L7GZzUjmDMaZGjTaqEbMsa2lX9EnjPShS/nSS+hf3qAKHuX7oruFlkthw+CDp8/cSDnkPpy9sXPDMifIG8etJ4myiaqHNXuilBinX6b/fvRqQbsoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6fuI6u+UWRS8I+IaXew9PF19/uCJfG+kI3aob6l/h8=;
 b=QVyix72yGD4ZgaHuWa6tdadrKZBPBrYmqqKWs5F+PeJg/FodWqHUTcEUCMDdcYS+xoThgOuCz0wsXUggfq41mo/4XQ5vse3Qm71JXfpw5ALsuN39eL83KYXKET3h4HxBS30tTEFexJGyFCWRYn1g444UEAt80Gn3pn7U12HJsvP7PKWJmOBXKnPFc0i6oBW4AxQ6V/9QJ+hgXeBORfKUJ3BWHOmfuT58n/g/UbXvnTO41yHIxIXViUHoGYo2AnzR3UJ3Qi1YGM/QhYT52Hmt/oxJwfUymMLWrtWuR5wywFqlm2/jes/D0LFkZQmYTG2mFLFEBbRexFECZhUhYVrsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6fuI6u+UWRS8I+IaXew9PF19/uCJfG+kI3aob6l/h8=;
 b=dHWE0Ts9xUPlxCuB8llntiJ/je9eT0o0n/9dlpc06kBN8Yu8PjBkqX8GJBhQxuS+u4gbu9K3vLixs9UFIYH+A/+vopFT0RW1+OJ7LTNdXFUy2cMBlY6YRVr75A3jRRmAyOnrh19oxCyKVdiwa7Z3ximXGBJlBoHhRh5XELTiisI=
Received: from DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) by
 SN7PR10MB7047.namprd10.prod.outlook.com (2603:10b6:806:349::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.23; Mon, 18 Aug 2025 10:42:21 +0000
Received: from DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935]) by DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 10:42:21 +0000
Date: Mon, 18 Aug 2025 19:41:57 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V5 mm-hotfixes 2/3] mm: introduce and use
 {pgd,p4d}_populate_kernel()
Message-ID: <aKMDdR9K1V-cOeX5@harry>
References: <20250818020206.4517-3-harry.yoo@oracle.com>
 <202508181636.0Rtk0T7x-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508181636.0Rtk0T7x-lkp@intel.com>
X-ClientProxiedBy: SL2P216CA0143.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::22) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7341:EE_|SN7PR10MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: f93b13d1-df74-4b01-8e80-08ddde43df65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZAwbQ4AYf+FEp1LSir4haK/HEtCOsWpdmFEdf9i4FiHNN16LQStXpGjg8V/u?=
 =?us-ascii?Q?s260x5USJqLlydkN151as2lFhebnap8108jNjGY2mleM1YkFrt2DqooIP4G3?=
 =?us-ascii?Q?FtAlAujZeM15I3D1SHWQV5oo9ZgFessut9ESHckuidjOhQ4phpNdTElcwBoc?=
 =?us-ascii?Q?Wgn6CAODEfuTYL7iliwsDmX6/mPT+aew0gV0ju1/RIqbdNMQK+tN2H2XHcPl?=
 =?us-ascii?Q?r5UPgJ1+Q8EptBOFUTnBaFRvNFNVpmI07g5B9YWpuSr6ZHbpUkGA/TcqkZh+?=
 =?us-ascii?Q?CVfaxx6/DqMO9CGHmqPEhgbMZ0LEae82is/Q2xAsRYzOiFvFyY0pJKTNriCF?=
 =?us-ascii?Q?ll8aHL4exM2/kDPxK0FFO0Qddj03D8RISZMenHY3N2dy77tACcgyFYChayyA?=
 =?us-ascii?Q?+LK+GzNNvbddcSQNKSTZEXQRexRr+dLk0LbogvV0Tlv6zp6TT+AHDh2HlJmw?=
 =?us-ascii?Q?3/KdIY32YB3Du/ttxspsQmQ3vEODitwhOX/vvkWXKGzW2Q2DBCnWCfl/lzq1?=
 =?us-ascii?Q?dt7L4zu5zUiqSltH3p6LY1+ro5qIe7G/eF5eBUUAvyZuTs43e03XqKNCyuuL?=
 =?us-ascii?Q?Jn3+NV5gnNm/pYFW/av4CSWjt4bl2b2JStaZAAC445nlHX0eYjKZVA/m3avT?=
 =?us-ascii?Q?i5rC0dw8oEZiKk59eLWV1UnRGSxYmywYOpuC7o+YsitCkfIDsrM2fKeyUcCj?=
 =?us-ascii?Q?fld24jdyljmkCD4HwrF/6Sa+E76wNE2YVC7doCfO5q5kbqOAogd8t1nasq/G?=
 =?us-ascii?Q?28b0HQyy8Q2yC9riS9M0hddpTu7kPGtGBqbKMH2DnR8naO5vVnnSKXaSRjVy?=
 =?us-ascii?Q?C9eDvLQxRuQQ5HguLCtr8FjgLcBIujnN+DoR1pBAVxCNf4WjVck6cywD8rvB?=
 =?us-ascii?Q?O7t2pavQvh2Z9teUnUEVQE3bp7oPPrMqrN2Xm4nx7bQWihlcWcYO8FIuRe8f?=
 =?us-ascii?Q?YuLYH6jBIglQ7iiTQAgAl9JvBU/D03PIPfbriJEPHukeMdzBo1dNKL7hM4GI?=
 =?us-ascii?Q?90u8HfBlcix+soe3Z6140vTul9j3CgMdEZqYn6CMngOCQHha+58+nAgtiBWM?=
 =?us-ascii?Q?FwBzX9EViGW8tV9odv/9M2N8ocXeLHpA/fGs2hSjj34lc29yybxfZhWywtfk?=
 =?us-ascii?Q?5hG9lweeQC9VJakeyVhAEk8LMtaYIZRsrjQT5y6laytjSn6eyyuku9lql7QK?=
 =?us-ascii?Q?4umN/bbl/LE8eApRTuYcCc3AtbilvO2AAXUXs1yI/FDl/cXjdy7cP50q4qDG?=
 =?us-ascii?Q?VdW1IHduUdB0TLRhjm56ukDUX3UgxVquuBtUlj/TsYw8H9i3zFuzjF8ny906?=
 =?us-ascii?Q?JiKNqtykUTJfIeFLzRziXZHAskDnNVUOqoo5UIZFPFgHsotRXbMBjYVl8jzJ?=
 =?us-ascii?Q?4YWHpcsqE39cy3fwLxkbyn/+U1uc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7341.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qdIuKjhB3WTHck17SIvlZjE9X0czprDEAgZX+2dmdcVzwNsizirzqJOsgJYT?=
 =?us-ascii?Q?FSQAuh5TsWaCoB3cD8H2HDSz2FMju4hYZtLF9iIHRz7caScjgv6I/h0pnmTM?=
 =?us-ascii?Q?6KpOcf0Vh3GyLRWwYSNyAWbqZyxp2abiURDeOiNXHd2A+z2JaJL/zgYnTsnh?=
 =?us-ascii?Q?mFXd6O8J7Tkf994y7VvIDYa+24WGiXi0gHqk7+7LjhECESYJHOUK9lCvMWZh?=
 =?us-ascii?Q?VoifwacMjTPH6Y/ASFCyQEJORIGV1WkjzxgF8SAaaywrthYEMKYGR3YGQsBY?=
 =?us-ascii?Q?i2Yp4u6v0yT1iylBEsnpWeFVd2P4XRMN+r5iWukaHBxzXzVElHxciXFmvYcQ?=
 =?us-ascii?Q?KhearrDiJl9GGka7ABWD5uyp09RmWKXGqJkyWVk5Cj+3SQSQ7lvmW6dy/mCB?=
 =?us-ascii?Q?AnLET0d/cNu9NNM/3w3Ypj56eO6y9ZZYgsnsKT6VvCIltIsSDlsP71yTTzCx?=
 =?us-ascii?Q?L9R0Q+PshdqhhvqObXGIz7xbMemcirEa7dwTxt5eOjFMF1xiR2FNm+OUCDvN?=
 =?us-ascii?Q?cmxVsOB8YJ9CjrI5f17DsLh9n1c21jTjrsZ12SDsFzbzWUP8tM0Ig/zQ5qWf?=
 =?us-ascii?Q?DxeZq2xqGKeR7J12nWd9GoI/FJqLSj6SsQjPaOcvCs/ReoRgBDDXSeP6fy3L?=
 =?us-ascii?Q?FAZzYsm7n6XTgySKumchQSJBKPKDbAbQvG1YEK7sEMgkE86jg1NOo8J927YA?=
 =?us-ascii?Q?eAeuXzwTjxC8+ac90djEKC+Z1A+J8d1HhLVGxUZ9LhBHNpci1bwccD4dxsRk?=
 =?us-ascii?Q?sEB60rB8OkiHbIwo4IAjBLhzeL9aLfeax9QHq+9VZn7OjOrfYJVYMbj/yk3K?=
 =?us-ascii?Q?Gls0+4apRWNBg+mfuWv8uUyDZHiaMjD5jBpeHi0hJSiHPbGWyGbQgTMr1q7V?=
 =?us-ascii?Q?2Lk2tZQiMqUNnq1Z6GwBkvsyVIZr+uxUUv/LNCnKdzuwNY74qRR7754soVQH?=
 =?us-ascii?Q?Kq/D3PdJJURpl9hdqVGBw27MC9ERYtOnAMnNcGgOFt8W+Okc0S3cFZC3t6Ib?=
 =?us-ascii?Q?mnkx6t7Q1zZZV8dx7LhXtphlCkiqyJkkwTt0daFMjuv2bdDBAE4rI6+NsVhu?=
 =?us-ascii?Q?HqRd12WFUamHMXPhTkZ1XdwOvQLQtFX/irvClT0LL2qRzFOj6K1JV3nGO98s?=
 =?us-ascii?Q?aplJQrYcIGC5CNhRMtRrYXqjoKOlX0HuBMrV+fHOdgJFkN+xfreIQDd4aK/x?=
 =?us-ascii?Q?ZByzjOMLRlwbGz1XnGK01Hv5j8adLNWb+gI+sOBfFtn42T4jCM6f7s/4KUz2?=
 =?us-ascii?Q?vXEBlaTkQBJ4JpWx9/v9eSdTtygiPt4ylco0tSovNvNDKwgTyk7sT2ooOBX6?=
 =?us-ascii?Q?yGomlgvPPJl+245MrIK7V2f5KVO+PNYcX9iY3Vi0DwlaQRD38Ea4nfL88HYZ?=
 =?us-ascii?Q?RFP4ZEYeWDbaYyHvcnB0wvNy/CU4sxN/YPH2KCvAbsPeB0Su0ApT9pRkMHh6?=
 =?us-ascii?Q?70MGAPVGUn6/W8vU37u9L8Roy9hAVUt4QPfn3RHSQf8HArpcq34fi+zNwimL?=
 =?us-ascii?Q?uwBT/qGF6OxM0AGhKlm4a8IZVJq2d+jB+ma9gRYllWKUHTgZ5BoXy7pipzXE?=
 =?us-ascii?Q?ab4iHcnKej9MduB52AHyO1hQtgPLc0jZ7PJs9D7m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4mdxp+5jzsqpsYk7ulU9P9drA5JFakVay2RLFr3j7nqT1mh+iMZb9dI04TPYEggv9tRG2RVd3kGN7nVqKY0Wta8eyOpd60DGtxljQtkD+hMCI6ARftQzzQlqhj2Jft4FDF8ZZYZOZ9gjlDkdbA8vRA+2j5eyfydiqvRVGX5Te3Shs5Zs3PGCKKUMp2OSmsR+Rz+zJ/+SKjByjfHbg2DktkWPQZuhmzqfHfwLVhO1D082pqx2TvWUh4pH2J3jmYDT2NMUmH2W+fc98cbj1wOo+QfkrCdX9KWUavIhSnTYdWUy4a/rwhisca+mINlv1vGBAcnd9rhNbL3uG3RpqHdhFB4U5rQGdbu2YS0joeDuXlIiOaXMGsBuXLGH7Rk5eFRJvQiwV73cYdNiGRf+XoBdqAieX3CwiiIt+nTgj6ViK8sHtqbNu6+iO4onfSdYJIxtxmVPeHsVsunTn1egWccbjeZRFrKiyF9gBcKpUZ8CNP38lHHLuVyYumZhDduZE3K2zI+f7hxEGUVC7dtresRUVDlLQGq9BZWj9fg38UoTp3H9AjhrvhYM9B9I7o6Ok9GPiUcZcMXp0v0CHjm9vKEkBU96xnYZV4w2x2j3rmCkZNc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93b13d1-df74-4b01-8e80-08ddde43df65
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 10:42:20.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +weP/fOoe+0sMPMW4hEqAdI7CdC9K7PUDkvPaMPWbEkOQ7Lg9wsmbp76tvaucjwL0MJ4grZgze650/OxwhU9UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7047
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180102
X-Authority-Analysis: v=2.4 cv=FdI3xI+6 c=1 sm=1 tr=0 ts=68a30390 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=6CJhWS-RAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=ZkeI5DgueR4gyaqBEQUA:9 a=CjuIK1q_8ugA:10 a=BKGljsL4k2TY3PRAngmh:22
 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:12069
X-Proofpoint-GUID: MAFvv9DlARvyeo21mmPCe-mTd2gqcmOg
X-Proofpoint-ORIG-GUID: MAFvv9DlARvyeo21mmPCe-mTd2gqcmOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEwMyBTYWx0ZWRfXyIL7rVkwYRX2
 uH7TgijzjIV43Z0agKJQ28ByM3GC7r6GSQxaxC/0+VuLI0rpuz3VZAq+iaxoGAFsfXjUorkI1ot
 ErNjXNm1/exBdfdTmwySsReVhGK6duxyfHLD5RDlcxShdj/BbxP2i4Hd9SHY8fysBnPRuk5y+Yv
 xk+Ww0Pfhx7NRE4W+7BPgTGLdWi7vLDUR1R18X9JBM6eZC7vKOgEc579IsEHXQkooB/i7MvJtCF
 Ix5T9+UazRoYXMWLD1+jTgBeyH9PqDc4o8hr9pbLU6mWXyouq8om9oK8m1QWDBlm0gljJ8wHllO
 7b3ogNFY789LNOf9iGaRBRUi7vip2z2gkqaSo8Pi2mQz4bsfgr+hjHukfgMnCJjAPXn1Y8xf0Ay
 KNPIxWik1/CL+kb2Zt8+lJSHluTpaVyU4RrqbFTyBRAoD1Hr6gLH45W3nwEJKyVp6Tr2CfQr

On Mon, Aug 18, 2025 at 05:02:01PM +0800, kernel test robot wrote:
> Hi Harry,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/master]
> [also build test ERROR on linus/master v6.17-rc2 next-20250818]
> [cannot apply to akpm-mm/mm-everything tip/x86/core tip/x86/mm tip/auto-latest dennis-percpu/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

This is based on akpm-mm/mm-hotfixes-unstable:
 e4321cf73f53 mm/userfaultfd: fix kmap_local LIFO ordering for CONFIG_HIGHPTE

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch*_base_tree_information ]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-linux-pgtable-h/20250818-101531 
> base:   tip/master
> patch link:    https://lore.kernel.org/r/20250818020206.4517-3-harry.yoo*40oracle.com 
> patch subject: [PATCH V5 mm-hotfixes 2/3] mm: introduce and use {pgd,p4d}_populate_kernel()
> config: arm64-randconfig-001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181636.0Rtk0T7x-lkp@intel.com/config )
> compiler: aarch64-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181636.0Rtk0T7x-lkp@intel.com/reproduce )
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508181636.0Rtk0T7x-lkp@intel.com/ 
> 
> All errors (new ones prefixed by >>):
> 
>    aarch64-linux-ld: mm/kasan/init.o: in function `zero_p4d_populate':
> >> mm/kasan/init.c:195:(.ref.text+0x374): undefined reference to `kasan_early_shadow_pud'
> >> mm/kasan/init.c:195:(.ref.text+0x374): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_pud'
> >> aarch64-linux-ld: mm/kasan/init.c:195:(.ref.text+0x378): undefined reference to `kasan_early_shadow_pud'
>    aarch64-linux-ld: mm/kasan/init.o: in function `kasan_populate_early_shadow':
>    mm/kasan/init.c:258:(.ref.text+0x41c): undefined reference to `kasan_early_shadow_pud'
>    mm/kasan/init.c:258:(.ref.text+0x41c): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_pud'
>    aarch64-linux-ld: mm/kasan/init.c:258:(.ref.text+0x420): undefined reference to `kasan_early_shadow_pud'
> >> aarch64-linux-ld: mm/kasan/init.c:255:(.ref.text+0x42c): undefined reference to `kasan_early_shadow_p4d'
> >> mm/kasan/init.c:255:(.ref.text+0x42c): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `kasan_early_shadow_p4d'
>    aarch64-linux-ld: mm/kasan/init.c:255:(.ref.text+0x430): undefined reference to `kasan_early_shadow_p4d'

My patch series shouldn't be causing this.
Does this error trigger before applying my patch series?

-- 
Cheers,
Harry / Hyeonggon

> vim +195 mm/kasan/init.c
> 
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  181  
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  182  static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  183  				unsigned long end)
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  184  {
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  185  	p4d_t *p4d = p4d_offset(pgd, addr);
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  186  	unsigned long next;
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  187  
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  188  	do {
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  189  		next = p4d_addr_end(addr, end);
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  190  		if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE) {
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  191  			pud_t *pud;
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  192  			pmd_t *pmd;
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  193  
> a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  194  			p4d_populate_kernel(addr, p4d,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28 @195  					lm_alias(kasan_early_shadow_pud));
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  196  			pud = pud_offset(p4d, addr);
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  197  			pud_populate(&init_mm, pud,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  198  					lm_alias(kasan_early_shadow_pmd));
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  199  			pmd = pmd_offset(pud, addr);
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  200  			pmd_populate_kernel(&init_mm, pmd,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  201  					lm_alias(kasan_early_shadow_pte));
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  202  			continue;
> 458f7920f9b1e6 mm/kasan/kasan_init.c Joonsoo Kim        2017-07-10  203  		}
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  204  
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  205  		if (p4d_none(*p4d)) {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  206  			pud_t *p;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  207  
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  208  			if (slab_is_available()) {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  209  				p = pud_alloc(&init_mm, p4d, addr);
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  210  				if (!p)
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  211  					return -ENOMEM;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  212  			} else {
> fb6d5c1d99ab69 mm/kasan/init.c       Qing Zhang         2023-09-06  213  				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
> fb6d5c1d99ab69 mm/kasan/init.c       Qing Zhang         2023-09-06  214  				pud_init(p);
> a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  215  				p4d_populate_kernel(addr, p4d, p);
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  216  			}
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  217  		}
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  218  		zero_pud_populate(p4d, addr, next);
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  219  	} while (p4d++, addr = next, addr != end);
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  220  
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  221  	return 0;
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  222  }
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  223  
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  224  /**
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  225   * kasan_populate_early_shadow - populate shadow memory region with
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  226   *                               kasan_early_shadow_page
> 7b6889f54a3c8c mm/kasan/init.c       Yu Kuai            2021-06-04  227   * @shadow_start: start of the memory range to populate
> 7b6889f54a3c8c mm/kasan/init.c       Yu Kuai            2021-06-04  228   * @shadow_end: end of the memory range to populate
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  229   */
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  230  int __ref kasan_populate_early_shadow(const void *shadow_start,
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  231  					const void *shadow_end)
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  232  {
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  233  	unsigned long addr = (unsigned long)shadow_start;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  234  	unsigned long end = (unsigned long)shadow_end;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  235  	pgd_t *pgd = pgd_offset_k(addr);
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  236  	unsigned long next;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  237  
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  238  	do {
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  239  		next = pgd_addr_end(addr, end);
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  240  
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  241  		if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE) {
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  242  			p4d_t *p4d;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  243  			pud_t *pud;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  244  			pmd_t *pmd;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  245  
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  246  			/*
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  247  			 * kasan_early_shadow_pud should be populated with pmds
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  248  			 * at this moment.
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  249  			 * [pud,pmd]_populate*() below needed only for
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  250  			 * 3,2 - level page tables where we don't have
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  251  			 * puds,pmds, so pgd_populate(), pud_populate()
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  252  			 * is noops.
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  253  			 */
> a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  254  			pgd_populate_kernel(addr, pgd,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28 @255  					lm_alias(kasan_early_shadow_p4d));
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  256  			p4d = p4d_offset(pgd, addr);
> a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  257  			p4d_populate_kernel(addr, p4d,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  258  					lm_alias(kasan_early_shadow_pud));
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  259  			pud = pud_offset(p4d, addr);
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  260  			pud_populate(&init_mm, pud,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  261  					lm_alias(kasan_early_shadow_pmd));
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  262  			pmd = pmd_offset(pud, addr);
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  263  			pmd_populate_kernel(&init_mm, pmd,
> 9577dd74864877 mm/kasan/init.c       Andrey Konovalov   2018-12-28  264  					lm_alias(kasan_early_shadow_pte));
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  265  			continue;
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  266  		}
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  267  
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  268  		if (pgd_none(*pgd)) {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  269  			p4d_t *p;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  270  
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  271  			if (slab_is_available()) {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  272  				p = p4d_alloc(&init_mm, pgd, addr);
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  273  				if (!p)
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  274  					return -ENOMEM;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  275  			} else {
> a86b0f4e94542c mm/kasan/init.c       Harry Yoo          2025-08-18  276  				pgd_populate_kernel(addr, pgd,
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  277  					early_alloc(PAGE_SIZE, NUMA_NO_NODE));
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  278  			}
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  279  		}
> c2febafc67734a mm/kasan/kasan_init.c Kirill A. Shutemov 2017-03-09  280  		zero_p4d_populate(pgd, addr, next);
> 69786cdb379bbc mm/kasan/kasan_init.c Andrey Ryabinin    2015-08-13  281  	} while (pgd++, addr = next, addr != end);
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  282  
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  283  	return 0;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  284  }
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin    2018-08-17  285  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki 
