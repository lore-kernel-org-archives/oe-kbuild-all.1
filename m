Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE72E888A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748180; cv=none; b=mTy92toBB9qKCuQykqer7rg+LQrYch7HFp3WSabcpTn8Mw1oHrJtRGpYrinpkJ5f2NDGEmPvcceHPObeBM8nVig3Vx0VlJK6XtoS/uBeoV6M1+H6mhz6B8FsGH2J120BkQrxELoksG+8u7uYITXfLbVn1XG/QP/Vz9bJyh4aTqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748180; c=relaxed/simple;
	bh=f1XL6yBPHPbsHOV0Q8ReSmSg4fw3U0OEEloKVQ68jz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGkbXeMFfCU84NjZAbjXyA9FQ4xZXs/95rnZ38yGGwJdFunMhHEBu5WmZgmKWw5vGmB86aBOGdGJALOQTjM4SqiG88Sd65eWG6KtuunAYO3qZpDDBM0YvxYTh8YMuW6yoU+1XMmeTdLwSbEMZkR8kollbJsiAjDRC7gcT9u00j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oQ/+MhcH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oQ/+MhcH"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNa49n1352129;
	Wed, 30 Sep 2026 06:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i4hkut
	cTXY1W9RrODJCEZ35du9uEPNMQx8YuQQMTYoU=; b=oQ/+MhcHnPEb/ykPdyP3ho
	m+1j2bwIQQoZWtKK0Y9oAPnmbj7fM/mzIh368hT2QiKui80PTopc8mTrTDKFKQ0Q
	pslD9YCDdMvbUuLcFofGBwQjMIT7z3ctE5bRM1gthqxO2SJxwrT2ItAPFPB09dQc
	WpDDg154qMUkFQNOUDwJunGCys/4eQIWIzFT4HRmxBxCqzf0GNKUOJf4h9kTWscz
	OY6fMzp8rai1JsHP+gsy9wSRoZ+7Y55DcbU+mUpRrZJvUnBRvXtmwGk6dclIwcy9
	ZB8EIH7qPZGxFHgiF6UvuYatPp3qlYOZwhz03yyv0ivHfUe8/tcb1qlyywaKh4sg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5pta9b5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:02:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68U4raSZ2549180;
	Wed, 30 Sep 2026 06:02:48 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxrrwd7kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:02:48 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68U62lTr31850892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 06:02:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 125E35805A;
	Wed, 30 Sep 2026 06:02:47 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DACF58054;
	Wed, 30 Sep 2026 06:02:45 +0000 (GMT)
Received: from [9.123.8.83] (unknown [9.123.8.83])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 06:02:45 +0000 (GMT)
Message-ID: <ad1591f8-2719-4636-a041-1fb433c1293f@linux.ibm.com>
Date: Wed, 30 Sep 2026 11:32:43 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linuxppc:next-test 3/37] arch/powerpc/kernel/irq.c:116:undefined
 reference to `irq_proc_emit_counts'
To: kernel test robot <lkp@intel.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <202609300040.mopAJGuz-lkp@intel.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <202609300040.mopAJGuz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BU7_Ig7jRtAITal9ZtqRZMOuMCvpB74s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfX9uOCqqkPA6Nz
 POpeJGL2Fii2Rs+b4BJWv9hixys+xZxGcNkoDvGNkGKkBQPIYWLdmimJ1MMql9PndWHWgLvWLAe
 PbN2RKb5ptni8soEVubCVUJOIsxNXWkBMy+VODYuiD9qvQ1cz3q0pbRe6EM3/M40EQX7Nz+GMn7
 l0A72tffrW7Wrzp9CHdC6Zz2VBBJaEKquHd68GXCLmKFIql65VA43h3WZ2iZZK97GJFU3Nly7vq
 1xoIytoE2UUmaEDcnbZ4LhM2W3YZI1yeANPDlahj82dFEVYfam49NERjUwCDhnJUtacr5J9HeL5
 4Z6lgrZ+dLaOFcYECSl3gcSA6T7gxsgvZ7yZAmHIOWF50IBpAcziY4H+nLmCGrmt2bm7IaatpMf
 RffZJQj5Fq6BCTUqrWJAZob9A4uHH2yhkNNKtU/PrpPQALBN8o/XuXiTYW/GfxmKnR31MpHn+5m
 T5fyODmOZ7AKa7XmCZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfX3GPUB0+iCO/W
 Z3XNewnlQfjhuW60wdMsWUIvgwL2LRKOCs5CKsqmuNd+XXP4JWZ+GxJW/tbN3EnmwjkxKdmaGSm
 lAuIvQknB/DbCZ/nzuvk86rfUk+11hc=
X-Authority-Analysis: v=2.4 cv=EY5d0/mC c=1 sm=1 tr=0 ts=6abca608 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=6s8td7R6yRoNjyqh45sA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: BU7_Ig7jRtAITal9ZtqRZMOuMCvpB74s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300022


On 9/30/26 3:35 AM, kernel test robot wrote:
> tree:   https://github.com/linuxppc/linux next-test
> head:   0b8b0c17a8998709ecb2852d56442ea981102941
> commit: fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904 [3/37] powerpc/irq: Make irqstats array based
> config: powerpc64-randconfig-r2100-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609300040.mopAJGuz-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     powerpc64-linux-ld: warning: discarding dynamic section .glink
>     powerpc64-linux-ld: warning: discarding dynamic section .plt
>     powerpc64-linux-ld: linkage table error against `irq_proc_emit_counts'
>     powerpc64-linux-ld: stubs don't match calculated size
>     powerpc64-linux-ld: can not build stubs: bad value
>     powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
>>> arch/powerpc/kernel/irq.c:116:(.text+0x49f8): undefined reference to `irq_proc_emit_counts'
CONFIG_PROC_FS is not enabled in the shared config which
is why we are seeing this

Maddy
>
> vim +116 arch/powerpc/kernel/irq.c
>
>     109	
>     110	int arch_show_interrupts(struct seq_file *p, int prec)
>     111	{
>     112		const struct irq_stat_info *info = irq_stat_info;
>     113	
>     114		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
>     115			seq_printf(p, "%*s:", prec, info->symbol);
>   > 116			irq_proc_emit_counts(p, &irq_stat.counts[i]);
>     117			seq_puts(p, info->text);
>     118		}
>     119	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
