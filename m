Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C67FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 04:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714106363; cv=none; b=BrTWz3yhsCWrB6Z4rk7DwcLy3roVepAr4Mp9we2DsXHZqHWusAjRsQPw/GGRD+OXS7AnSXDHFrnftVcGh2JUe6VpFip+qWGm08ekhRBN4/LZR9fuCEqHGf/BbpHVAAB4LOKGuv/zSscMYnRnkumaXiCaF4dy1FTWsrSCWLtm+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714106363; c=relaxed/simple;
	bh=e5hVNjvqJpuGaqjTCj4mU9Zc74CbcnkGdDgi6tHATQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bK8hrFOX5oFaBcH7butxs5JmNPX2BQtSN5BaD1CojRwMqVSBd07W1ANISKDZqSagEJL6yTIZMX4lPWHypC/jwCQR/5w04rMcrjcVYZFq4vAqj9PnUHcZJGwaFCZd4IsGrnEPHKPMAr8CMVRJ8WXRx45Ykvh1aowA5/HDMUnnNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HpCOPiA+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HpCOPiA+"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q4c0aY011972;
	Fri, 26 Apr 2024 04:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aViMWIf6OQOgii17xv6pXgOTqgM9G+MDQzAPoG3IiTQ=;
 b=HpCOPiA+1+pAJr++vIUohAuym65T19q3bTkuQ9zHb8sx7fAFIJrb0zXdMnIZCUFDd5ok
 S0mtOLueTdEsHbsRWXO4vFfzDO71CeVktDVrEwv9tiCK5ilzkm9RRl//hSJfNflvKPJF
 vsyAPqYr1VAj3WXxiSyrIEa5Kg5xNQ5iWUkcbg3i4RGU14dmOpIozCPn2xrklYWxcv46
 APqxxt+TVXrBJ0qazZlHAZ2SpYc+Opt+vE8lF/RB3oCEJK4udmQ1vya2GbBelx1FXql2
 +RA5UT8pmo3L5MNRq0yqlBU6koJG8J8oArFKJvpusD3FacyB+5a+PCBFhIFFU++maAp7 kg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xr5dh8025-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 04:39:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q39b95005352;
	Fri, 26 Apr 2024 04:39:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3cvgac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 04:39:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43Q4d57o28246694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 04:39:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BCB920043;
	Fri, 26 Apr 2024 04:39:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17B1620040;
	Fri, 26 Apr 2024 04:39:04 +0000 (GMT)
Received: from [9.43.4.62] (unknown [9.43.4.62])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 04:39:03 +0000 (GMT)
Message-ID: <4b89fead-5d26-4aa1-b424-8ba4306a0905@linux.ibm.com>
Date: Fri, 26 Apr 2024 10:09:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7646/8170] arch/powerpc/kexec/crash.c:488:2-8:
 WARNING: NULL check before some freeing functions is not needed.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <202404261048.skfV5DDB-lkp@intel.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <202404261048.skfV5DDB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YHWvgYZdkJEfQwWIRPrXCxammuyqlEYW
X-Proofpoint-ORIG-GUID: YHWvgYZdkJEfQwWIRPrXCxammuyqlEYW
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_04,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260028



On 26/04/24 07:57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
> commit: 849599b702ef8977fcd5b2f27c61ef773c42bb88 [7646/8170] powerpc/crash: add crash memory hotplug support
> config: powerpc-randconfig-r061-20240426 (https://download.01.org/0day-ci/archive/20240426/202404261048.skfV5DDB-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404261048.skfV5DDB-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> arch/powerpc/kexec/crash.c:488:2-8: WARNING: NULL check before some freeing functions is not needed.
> vim +488 arch/powerpc/kexec/crash.c
>
>     418	
>     419	/**
>     420	 * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
>     421	 *			       elfcorehdr in the kexec segment array.
>     422	 * @image: the active struct kimage
>     423	 * @mn: struct memory_notify data handler
>     424	 */
>     425	static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
>     426	{
>     427		int ret;
>     428		struct crash_mem *cmem = NULL;
>     429		struct kexec_segment *ksegment;
>     430		void *ptr, *mem, *elfbuf = NULL;
>     431		unsigned long elfsz, memsz, base_addr, size;
>     432	
>     433		ksegment = &image->segment[image->elfcorehdr_index];
>     434		mem = (void *) ksegment->mem;
>     435		memsz = ksegment->memsz;
>     436	
>     437		ret = get_crash_memory_ranges(&cmem);
>     438		if (ret) {
>     439			pr_err("Failed to get crash mem range\n");
>     440			return;
>     441		}
>     442	
>     443		/*
>     444		 * The hot unplugged memory is part of crash memory ranges,
>     445		 * remove it here.
>     446		 */
>     447		if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>     448			base_addr = PFN_PHYS(mn->start_pfn);
>     449			size = mn->nr_pages * PAGE_SIZE;
>     450			ret = remove_mem_range(&cmem, base_addr, size);
>     451			if (ret) {
>     452				pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
>     453				goto out;
>     454			}
>     455		}
>     456	
>     457		ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
>     458		if (ret) {
>     459			pr_err("Failed to prepare elf header\n");
>     460			goto out;
>     461		}
>     462	
>     463		/*
>     464		 * It is unlikely that kernel hit this because elfcorehdr kexec
>     465		 * segment (memsz) is built with addition space to accommodate growing
>     466		 * number of crash memory ranges while loading the kdump kernel. It is
>     467		 * Just to avoid any unforeseen case.
>     468		 */
>     469		if (elfsz > memsz) {
>     470			pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
>     471			goto out;
>     472		}
>     473	
>     474		ptr = __va(mem);
>     475		if (ptr) {
>     476			/* Temporarily invalidate the crash image while it is replaced */
>     477			xchg(&kexec_crash_image, NULL);
>     478	
>     479			/* Replace the old elfcorehdr with newly prepared elfcorehdr */
>     480			memcpy((void *)ptr, elfbuf, elfsz);
>     481	
>     482			/* The crash image is now valid once again */
>     483			xchg(&kexec_crash_image, image);
>     484		}
>     485	out:
>     486		kvfree(cmem);
>     487		if (elfbuf)
>   > 488			kvfree(elfbuf);
>     489	}
>     490	
Thanks for the report.

I will fix this and send next version.

- Sourabh Jain

