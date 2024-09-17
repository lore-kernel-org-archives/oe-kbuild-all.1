Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FA2905
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579911; cv=none; b=nK6LrKRif+KoEUYQNym4TTWDCXmqeKcQQNBlo+HhjbBBxdl5ZkhZAdFdrK7Df6599EK0d8H1gP7PCC3/q1MlLj1mR+T9K4LOoiCURC81cI2CXjhb24iFK0JO9dWzMpD5nKlo+wTM7ScrZGyv2UyD2eoxCBwWFIeyyo3PUNLbJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579911; c=relaxed/simple;
	bh=NWFk9NHie12hcPfjJj4nE+gfKggU0+otIkF5fnVFvp8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BVoj7fyouj0nlfjpYdsHVaQnLFqjAjqFqVPsk9oCfYXFwbmu/MAazAunOnIu+/xFy9NT+J/JgGREBSYx07Pddr6AOOM+CJLB4lf7hHXBuuavfX20shRHmjcgn9dUC61JjtpPshAckMasq/w5oOMK/hqct0fKUssT8JHunhCp2fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Kd495+iX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Kd495+iX"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HATi78031838;
	Tue, 17 Sep 2024 13:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	7IWxwt8KwlEw5iqAgD+/NF7LVw8Gi72/5MfOvIcE8fc=; b=Kd495+iXB40qBttd
	3ChmLv2XWyK8L+y/AcVzmeKw5Mzw2B8MIJB4HX1rIzMd6g3ezgjCyVADwClEz/S4
	IYI7LFHVBX1O3mvwVm41jlVefOINKnogDguVpwSWduzeZlB8/9LENDuxZF78Xl2g
	1H31GLCM+2RcIKzMCt/3fyX4DZ55/x6UGllPQBKC4ryxZFQd+466PqWmMKpEtnR2
	R/kt3cCOcwM0AJMsj+5g5ZTjtELTWghEWmkp4pKQFECf1EG6kT64LCycwYZqW3Pl
	lsGu6Z222hwx4Md3DowwDgARnxwPzH+ByTfKlp/RbBMPA5jTEY6I/5GesbEV46qJ
	FkWT6g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uj8d39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 13:31:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48HAv25W001871;
	Tue, 17 Sep 2024 13:31:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nqh3n37q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 13:31:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48HDVavH19792224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Sep 2024 13:31:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 423602004B;
	Tue, 17 Sep 2024 13:31:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE4CC20040;
	Tue, 17 Sep 2024 13:31:33 +0000 (GMT)
Received: from [9.61.253.65] (unknown [9.61.253.65])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Sep 2024 13:31:33 +0000 (GMT)
Message-ID: <6f2158e4-f648-4d51-90e0-0816a6cc321e@linux.ibm.com>
Date: Tue, 17 Sep 2024 19:01:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10289/12187] eeh_pseries.c:undefined reference
 to `eeh_pe_inject_mmio_error'
To: Michael Ellerman <mpe@ellerman.id.au>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <202409170509.VWC6jadC-lkp@intel.com> <87ed5jqdqp.fsf@mail.lhotse>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.ibm.com>
In-Reply-To: <87ed5jqdqp.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FuzCBdnTtylxpS5rp3pE1voDvkHZVOWG
X-Proofpoint-GUID: FuzCBdnTtylxpS5rp3pE1voDvkHZVOWG
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_05,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170094


On 17/09/24 6:48 AM, Michael Ellerman wrote:
> kernel test robot <lkp@intel.com> writes:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   7083504315d64199a329de322fce989e1e10f4f7
>> commit: b0e2b828dfca645a228f8c89d12fbc2baecfb7ea [10289/12187] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
>> config: powerpc64-randconfig-003-20231031 (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/config)
>> compiler: powerpc64-linux-gcc (GCC) 13.3.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     powerpc64-linux-ld: arch/powerpc/platforms/pseries/eeh_pseries.o: in function `pseries_eeh_err_inject':
>>>> eeh_pseries.c:(.text+0x9d0): undefined reference to `eeh_pe_inject_mmio_error'
> Cause by CONFIG_DEBUG_FS=n.
>
> Looks like eeh_debugfs_break_device() needs to be moved out of the
> #ifdef CONFIG_DEBUG_FS block, and renamed.
>
> cheers

yes Michael Ellerman, it is fixed by new patch 
https://lore.kernel.org/all/20240917132445.3868016-1-nnmlinux@linux.ibm.com/ 
.

regards,

Narayana Murty

