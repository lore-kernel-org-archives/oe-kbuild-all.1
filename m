Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19981F30BB;
	Thu, 18 Jun 2026 05:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759970; cv=none; b=t91/G2V3JgIKndGc2daaWTHP+gPgpqkPSCIW06AiG1t4zzlMm3lrRxl03wtYDctVzwVzJ+WfvI6fR7M19m1l/QSOSE9xnc8smMiJo4cUCCxDpkFysHQRW+iKsOUNuQ1tQFNEnF3SqbTiyy2ecFlnIgIVttbSntQ3iGb6JVUjmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759970; c=relaxed/simple;
	bh=ZIQIRtqTzxK/88S8Qux/nzjQGyhslhUpTF6jL/YPAQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/zZSX4gg0GyDT5YWaXwkzVKG/nv8bgz8obZ6gN6B7QbQLWH1j3JioauKeVVAyTNY6RMjJAusbc3JV1TXKMNkq1laNyJeZ0ZQgp+OYDbTQki0ypCixUuB0xoKoybr05HDK0gvLUlHiWB1LPHQrQVg5YEP/DCyp1yMyE0yQEvvn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HcVhjinM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HcVhjinM"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHmN3I1106806;
	Thu, 18 Jun 2026 05:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IsgJfS
	g9ArKD3VcToruwIgyIj/6yysRSjr388UCZIeo=; b=HcVhjinMhg/b1Ulmkrw7AB
	cmXtAN171I8n76eoaeoox1ZoNLTv/ueoJ4uH9OrSEu4mmKtiqVTJY2YmDADF+VPk
	/p1eanc6ryO60UNDzwxD03nHrV2VWFMXVxQ0/a2xFYBAQVvbDOi0DspF8Ps6sxbG
	+7r7+UXmsFDfT2RM4xbaev5Ffmx6sYh3TApsjcpWRIPdtYavDcrfTiPNjkKirTIi
	mIuggEtYcCrRg2C2TCJ2Lur1ssb5/C39nE77p6k3GDZWZIqgKPALFKbWdDM35k2Z
	m/PT98VDNJ/wMe+21otMr2cmi6vsfF8VahlOh42t8QVabvLiXalfo85NW9MPBsRw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqtpfb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 05:19:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65I54cGD005106;
	Thu, 18 Jun 2026 05:19:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ev172a45n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 05:19:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65I5JOiX14483796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jun 2026 05:19:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53E422004B;
	Thu, 18 Jun 2026 05:19:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C16D20043;
	Thu, 18 Jun 2026 05:19:23 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jun 2026 05:19:23 +0000 (GMT)
Message-ID: <f1a4c4c7-9ad8-40f5-b1a9-ba631977dac6@linux.ibm.com>
Date: Thu, 18 Jun 2026 10:49:22 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Documentation/scheduler/sched-arch.rst:108: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202606180717.yNM0yb41-lkp@intel.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <202606180717.yNM0yb41-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bJ2QUBy91YPdl5tGQZhvkHQuaOQgp2je
X-Proofpoint-GUID: bJ2QUBy91YPdl5tGQZhvkHQuaOQgp2je
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0NSBTYWx0ZWRfX3FNvIrdIOXQs
 R7MpAtrFIOSjQ8Bmctpyfzb1awEBRVCgWPiQvygy7ihz9OWASYGVNfemQ6cUitv2iNdSG0fn9DT
 T6KUzoLsaheZzJ/pfLBEn2SQOI7NqxMQK89mk4hFzRgkSGU8gZ+vQat3I3unfcN8/mIoSmP8BMc
 Kz5Ptk3MFol/g/DvXbPElD/B9iLVufPkpADbXxwZ72d5nWtqJ/LqVgnixloNCNw+C8vS9cpXLDT
 0VWJQaI5V/sOob806lVtupgqsTibvYTyxH4ZVGH4d9JDhIOWUG9XuMGPUsMu3pGU+eo66A7n3VW
 3OfkSclh51B6p1jfHYPS9cCuWxmLx3zOYzx7k7TOuYwCv1UmNgRkIAGfQGCe6wYJms6BnSL7z6S
 +SZgz48dVhM2kNQVvJOIHsoWHTq78jaVoizFAB90CjH3kx5XKEliqXeMJHAj8lJy7c/OfQ53yAb
 NZsYrP4GoTIgPktXCag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0NSBTYWx0ZWRfXwO2oS2FF2J2L
 6/OqI0shuhaQAI0kb01VEZdlZA12/uxVsyDrhDpkcFmUQGVxWf/Tx+u19YOYO8S4eqM76Plv0HM
 NTNUQXKkCCFfYOpKwUFVpF6k4IVmDaE=
X-Authority-Analysis: v=2.4 cv=B4KJFutM c=1 sm=1 tr=0 ts=6a337fdf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=4PYDLAMntfhPxY290xAA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180045



On 6/18/26 10:40 AM, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
> head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
> commit: 4c29e4f3ba22adc04fc456620f2c6abf539d76df sched/docs: Document cpu_preferred_mask and Preferred CPU concept
> date:   10 hours ago
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180717.yNM0yb41-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     Checksumming on output with GSO
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>     MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>     Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>     Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
> 
> 
> vim +108 Documentation/scheduler/sched-arch.rst
> 
>     102	
>     103	Notes:
>     104	1. This feature is available under CONFIG_PREFERRED_CPU
>     105	2. This feature works for FAIR class only.
>     106	3. A task pinned, which can't be moved to preferred CPUs will continue
>     107	   to run based on its affinity. But no load balancing happens

is it flagging here due to missing . ?

>   > 108	4. If needed, steal time based governors/arch dependent method
>     109	   could be used to cater to different types of cpu numbers.
>     110	   Arch can do so by implementing its own hooks.
>     111	5. Decision to use/not use is driven by kernel. Hence it shouldn't
>     112	   break user affinities. One of the main reason why CPU hotplug
>     113	   or Isolated cpuset partitions was not a solution.
>     114	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

