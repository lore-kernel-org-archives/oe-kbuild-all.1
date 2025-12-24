Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395641367
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595616; cv=none; b=DGEkkZ39ARvnD2QwwHvkNo/gx5IovlXfGWqQGYQTmOxiufe0oLlc78j52a/hmkbqkzR6BuR/K3iDkTNEAMMmRcZDknStm8pWnfaRsujUKc3hme3Q3ooTRSEGbCQX3Jkk+DCfU8OchXI4ApV3d4lw/e1x6L9ootK/Jz37ENbMpxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595616; c=relaxed/simple;
	bh=tFYdoUPQI/v4rHZu3mO28iDTFT2yEUIAvt67ke386Us=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bAORNOMSfiYyrjuVTIag7BAK7gE9JyYVYylljtLUBPeRi2I8LJXZW4q+Noo7ORKG7OtQmbfOboIRqRP3+/8n1MPJWPtCc+7WN1vurJeakAPp63UmcfrS0Y6V/62exGxL1BPYJHoXaZYdbAURv6QQkZ0MJ6bad88qkHppbd2yOCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IQDAqbEA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IQDAqbEA"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BOGQb7p001275;
	Wed, 24 Dec 2025 17:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LMqwli
	RTyLs7mB2exOXh15RpEV3eDVKH8PX5ODgQ8lM=; b=IQDAqbEA+nBQu4/csGQ8/7
	FGq85R0yHjLFpX2d0ZTp+feP+ZAx3NtRB+fLEpZlRxbw4UT19LBWhfYe5Bu9QzVW
	qb+3JN6LuIDzW7v8bWuRRCt40sV2dNdLHwb5C3TGWR1Y3L28/7iiNKD5ExdYN+YM
	S+ZESnvIIZjCbXhavASWE15TZrK2ioEtrI/gXTp2QHqkHFtiBjwpb4u0mLKqGHL+
	8WRBZDDEmBLjDsbEOLw0M/U2CgveZI22mFhYjHSaC0W+XjAn79CboTMaDOxpPBAv
	NtiZInSZYlyWLrmc2KvVk9a35rjeX0JkB1ziYHGNLZfBcvuInbMLNEuiZZpD5TRQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kfqa99h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 17:00:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BOH08OV018559;
	Wed, 24 Dec 2025 17:00:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kfqa99d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 17:00:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BOFcVxa030207;
	Wed, 24 Dec 2025 17:00:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b66gy1353-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 17:00:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BOH03sT37290404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Dec 2025 17:00:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BF42005A;
	Wed, 24 Dec 2025 17:00:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D20E20040;
	Wed, 24 Dec 2025 17:00:01 +0000 (GMT)
Received: from [9.39.24.94] (unknown [9.39.24.94])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Dec 2025 17:00:00 +0000 (GMT)
Message-ID: <42679785-1831-4657-8ab8-c2fc1070a785@linux.ibm.com>
Date: Wed, 24 Dec 2025 22:30:00 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type
 in assignment (different base types)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, Ben Collins <bcollins@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        shivang upadhyay <shivangu@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <202512221405.VHPKPjnp-lkp@intel.com>
 <fb309e19-9c2c-492c-abac-8aa6031f3124@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <fb309e19-9c2c-492c-abac-8aa6031f3124@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=carfb3DM c=1 sm=1 tr=0 ts=694c1c19 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=VnNF1IyMAAAA:8 a=hGzw-44bAAAA:8 a=wMNdZWldAAAA:8 a=eTuzvH426zKNHcTKJZgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
 a=HvKuF1_PTVFglORKqfwH:22 a=FUarYpL4UH3yWsho8X8J:22
X-Proofpoint-ORIG-GUID: dYfBXg6tXSDzkPY0HqQg37W7uRbdABbc
X-Proofpoint-GUID: ZsMHvcXv1oIqgp5ySNp-DYKA0-vzcwRI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDE0OSBTYWx0ZWRfX6eyx6vWj3dXL
 hOcvLimwP3qQj3yYw+VRgBy2rMs4UwCtxy7qpnSURYvwnD/hwtGryhJ7P0om8S5I7th9lZpraMe
 +4Sg7p+Dz/EmYnKXZqJDQePmaSxi8ZPrwW3TsJChiN/ylDH8Au03JyolgQGEZFGPhcopOjdzuAg
 VsnSkDmSjU67S0gLPH9/HVIRZGMIW5EROXTwH63SrbTmHzRVUChwLOc0amRCLp9GJKeICYc9ziN
 y/oZrF6Bx4l4pNSvaJDkiCVVhCEGo2/oxwcIB6DsqmoIGtmylRuCWn/43L9HAAjgxrYUMu1xuv2
 qvR29zq8D4AdDSjk8hbKu/9M9hGwxqSD+6KB5EAINjG8d/OJ4bx7o1omV26NRMI8TayuSCncse4
 U4HzvBJPTbNmLbAhLtdZVxHFAhswsw8fsm7M6uK7hnQkFVVw57vOHZjSV595q9hwAO1RQOj/EKU
 am5fBuhAwJw0sRixUlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512240149



On 23/12/25 18:27, Sourabh Jain wrote:
> +Cc: PowerPC mailing list.
>
> and added some comments below.
>
> On 22/12/25 12:14, kernel test robot wrote:
>> tree: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> master
>> head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
>> commit: 38c64dfe0af12778953846df5f259e913275cfe5 kexec: Include 
>> kernel-end even without crashkernel
>> date:   6 weeks ago
>> config: powerpc-randconfig-r111-20251222 
>> (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/config)
>> compiler: clang version 22.0.0git 
>> (https://github.com/llvm/llvm-project 
>> 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202512221405.VHPKPjnp-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type in 
>>>> assignment (different base types) @@     expected unsigned int 
>>>> static [addressable] [toplevel] [usertype] kernel_end @@     got 
>>>> restricted __be32 [usertype] @@
>>     arch/powerpc/kexec/core.c:217:20: sparse:     expected unsigned 
>> int static [addressable] [toplevel] [usertype] kernel_end
>>     arch/powerpc/kexec/core.c:217:20: sparse:     got restricted 
>> __be32 [usertype]
>
> If CONFIG_CRASH_DUMP is enabled (which is not done in config shared by 
> kernel test robot) sparse warn
> about other assignments in the same file. And these warnings are not 
> limited to 32-bit.
>
> ../arch/powerpc/kexec/core.c:181:29: sparse: warning: incorrect type 
> in assignment (different base types)
> ../arch/powerpc/kexec/core.c:181:29: sparse:    expected unsigned int 
> static [addressable] [toplevel] [usertype] crashk_base
> ../arch/powerpc/kexec/core.c:181:29: sparse:    got restricted __be32 
> [usertype]
> ../arch/powerpc/kexec/core.c:183:29: sparse: warning: incorrect type 
> in assignment (different base types)
> ../arch/powerpc/kexec/core.c:183:29: sparse:    expected unsigned int 
> static [addressable] [toplevel] [usertype] crashk_size
> ../arch/powerpc/kexec/core.c:183:29: sparse:    got restricted __be32 
> [usertype]
> ../arch/powerpc/kexec/core.c:191:19: sparse: warning: incorrect type 
> in assignment (different base types)
> ../arch/powerpc/kexec/core.c:191:19: sparse:    expected unsigned long 
> long static [addressable] [toplevel] mem_limit
> ../arch/powerpc/kexec/core.c:191:19: sparse:    got restricted __be32 
> [usertype]
> ../arch/powerpc/kexec/core.c:217:20: sparse: warning: incorrect type 
> in assignment (different base types)
> ../arch/powerpc/kexec/core.c:217:20: sparse:    expected unsigned int 
> static [addressable] [toplevel] [usertype] kernel_end
> ../arch/powerpc/kexec/core.c:217:20: sparse:    got restricted __be32 
> [usertype]
>   CHECK   ../arch/powerpc/kexec/core_32.c
>
> To resolve these warnings:
>
> Should we use __force tpyecast and silence the warnings?
> for example:
> kernel_end = (__force phys_addr_t) cpu_to_be_ulong(__pa(_end));
>
> Or
>
> Use proper data types __be<32|64> and duplicated the definition and 
> assignment? seems like bit too much.

Found a better way to define variables as __be<32|64> without duplication,
so I have posted a fix:
https://lore.kernel.org/all/20251224151257.28672-1-sourabhjain@linux.ibm.com/

- Sourabh Jain


>
> Or
>
> Do we have better way to handle these warnings? If yes, please share.
>
> - Sourabh Jain
>
>>
>> vim +217 arch/powerpc/kexec/core.c
>>
>> 6f29c3298b1821 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-17  203
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  204  static int __init kexec_setup(void)
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  205  {
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  206      struct device_node *node;
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  207
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  208      node = of_find_node_by_path("/chosen");
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  209      if (!node)
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  210          return -ENOENT;
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  211
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  212      /* remove any stale properties so ours can be 
>> found */
>> 38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     
>> 2025-04-21  213      of_remove_property(node, of_find_property(node, 
>> kernel_end_prop.name,
>> 38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     
>> 2025-04-21  214                            NULL));
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  215
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  216      /* information needed by userspace when using 
>> default_machine_kexec */
>> ea961a828fe725 arch/powerpc/kernel/machine_kexec.c Anton Blanchard 
>> 2014-01-22 @217      kernel_end = cpu_to_be_ulong(__pa(_end));
>> 79d1c712958f94 arch/powerpc/kernel/machine_kexec.c Nathan Fontenot 
>> 2012-10-02  218      of_add_property(node, &kernel_end_prop);
>> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 
>> 2008-12-16  219
>>
>> :::::: The code at line 217 was first introduced by commit
>> :::::: ea961a828fe7250e954f086d74d9323c3d44c3e4 powerpc: Fix endian 
>> issues in kexec and crash dump code
>>
>> :::::: TO: Anton Blanchard <anton@samba.org>
>> :::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>
>
>

