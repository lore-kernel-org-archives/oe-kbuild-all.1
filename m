Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049061EB5DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740238; cv=none; b=mODYIvXztwnkgmSSreYs5iX8iqIMynyAnbjlDuJclX0teAe3MSi9QHMnJp/7WKsW3d/Q+QDgDs6O7m4viRYsTYu51Ybxu+GkWMzqCGK24jJPHx6QIXIm0PMtP7aZ44C3dULhzbcBcXvfWFtbVtmMPGcgtLQPDUN75PKq3y0ACzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740238; c=relaxed/simple;
	bh=l28CrjT8W8nMvxTxb9wywmB78f7Hv+Y5MlnQEkhkqp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgNvnJRp//Q2y2S/sx25ODjTtDEzFqkD1ChuOR6ZnBv8E3qrF8EcY1EN2oNBWAVFMYVsRv1NQyFaRSu1ZFnehVVfmaA2wMwCJWHljPO21fCjoUJM+YKCFpffvb/wJdd6bvT2kgtQQiyn5CwS4TQ5hC3e/wVe1xPHxo3t2ep+2wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=h+9kjCbS; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h+9kjCbS"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6whjF013642;
	Tue, 20 May 2025 11:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=koTAUB
	HuIjFxgewDsKVHJkTcz2rxM3O6UQjUXJEErIo=; b=h+9kjCbSXHa46I7/l9pLbS
	bvaMIsLcwsaLcT8nA3EJf9iuRMf7J2sIvdTUTF92aunYG8TokhjgMg5UI7BPTN/B
	pJyC0WcoLfqAMIvgtNDuQmzmRjxDUanjeidl5gY96qi4PiK71APASd2L+//+kU2w
	FzwVsQaAkLimzn2HiWAgiGH08TvT5OKkadeaCTLUXkvh/rNWXURrwnc7tsbTGhgC
	YbWPHi0IOvnb0DOMhzL40AsL4RHpWNl4G/2VU0LgwyC+j//j+pV/dEnCd4PrxTYl
	Xe0dzXoA4DBQahjMXW//j4Sasna6P21VAPKQibsolyoB+6LqWv4wcy95SLP/GxBQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99ku6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 11:23:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54KApX33002449;
	Tue, 20 May 2025 11:23:50 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5snukcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 11:23:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54KBNn7x15532560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 11:23:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E288358043;
	Tue, 20 May 2025 11:23:49 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1259358059;
	Tue, 20 May 2025 11:23:48 +0000 (GMT)
Received: from [9.67.15.219] (unknown [9.67.15.219])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 May 2025 11:23:47 +0000 (GMT)
Message-ID: <28d2c52b-eb3a-428b-bf5d-0e4e8046d607@linux.ibm.com>
Date: Tue, 20 May 2025 16:53:46 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-nvme:nvme-6.16 40/42] drivers/nvme/host/multipath.c:13:6:
 sparse: sparse: symbol 'multipath_always_on' was not declared. Should it be
 static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
References: <202505200655.rD3it4Yp-lkp@intel.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <202505200655.rD3it4Yp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J/mq7BnS c=1 sm=1 tr=0 ts=682c6647 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=cSQVBmgJ2IXFjgu8kuQA:9 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5MSBTYWx0ZWRfX8zEUJnpfU2ai IbwSzGmAn4MBPvVXg7mlhWKkadcFzyNYsDGcrcbZ8M2oy87RR77g/3Cu2hqC0frFkrKTVKVgLtw xz7pvJl3c/JbMffFoLAhgq04Gju2suxZPzwKUdtdO2WhcESMF0bL3BtSxSxTeFYxq3AFpK83ZkE
 lLfz6Xjzj8tC9kUxElx6pxggzlMwUz6BOFjJs1915WNlUKR4G3WsKsGqwZcsaNcQdgCGSdzwtgu Ex2tHHnkwgGyh/lrQUdeeJH19J4V7nsnfJI1HL9C2EGXTK/njZUgRbvl9TwldSOt4fGW/7Q8mLI 9Jr74CPW/vnIeDCOWfwJ977xzH2nE6Lhgto0UTh7GwGWafbZ25mfc16Lqsn1vD0mUZ4ZGAWUpC/
 saIfAZsxmgKkPduR2LFo63WJiRWVdsbIeySXVt3HbuYaI+JQABfbNtj7UxoTIPQKHil9tCvt
X-Proofpoint-ORIG-GUID: sImIZwhRK81m8dJpD1nzdp9Iu8nRmox-
X-Proofpoint-GUID: sImIZwhRK81m8dJpD1nzdp9Iu8nRmox-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200091

On 5/20/25 4:17 AM, kernel test robot wrote:
> tree:   git://git.infradead.org/nvme.git nvme-6.16
> head:   fc9c5b746e651c57ea8b8d702659db8f2e9847b2
> commit: 01e5e7a813c4deafdb4b18ce6623bd693c4d0a57 [40/42] nvme: introduce multipath_always_on module param
> config: powerpc64-randconfig-r123-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200655.rD3it4Yp-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 10.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200655.rD3it4Yp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505200655.rD3it4Yp-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/nvme/host/multipath.c:13:6: sparse: sparse: symbol 'multipath_always_on' was not declared. Should it be static?
> 
> vim +/multipath_always_on +13 drivers/nvme/host/multipath.c
> 
>     11	
>     12	bool multipath = true;
>   > 13	bool multipath_always_on;	/* default is flase */
>     14	
> 
I just saw that this one is already fixed in the latest code.
Thanks Christoph!

--Nilay
