Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5915E80D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674715; cv=none; b=I+F02ix4758BbFLdF9+ZeZn1Rs2H0onYDXclqYxH8tBWXldCPiHFXQCs3wsGn3EH6CWOkHlWGNmXH1l5vl5EeTFRHxVjzbXw8tGbZGL08aUHuFaCK/GFCLiHpthtTaj6vrpQoUp0l+q4851wetcBUSvLqyNF9Yc3DzthWYdVD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674715; c=relaxed/simple;
	bh=lI4qPQIoad0Ah9XwKmXsml3itVLiyRUUGhnO0GntaxY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dYw+5jpmvOqH4/q2jaKpzEq5B58MQJW7tjCzhibnlU6hbl5TwtDiVeB3KjV30eBBsmD1tOsvxA7scskQvWmS+vEcyq7KIu16UTYCz3ZrraCo375MYk9PXxBh7skJB3oqu5PP97n2lIWpQnUOSgtQUEIo+IZA0LS5CjYFkd1Tyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P3uRb6iL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P3uRb6iL"
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 442IUsYG002107;
	Thu, 2 May 2024 18:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lI4qPQIoad0Ah9XwKmXsml3itVLiyRUUGhnO0GntaxY=;
 b=P3uRb6iLCYJZD+y77Zp2n2Zqnqo/GEsfd10awnc9C97ckQ0t2/0Pi6xFFHPgQ8cebGZJ
 0rroq8IM3Pm8wW004W2h7Jhj9miMb3ABXoPKPhDy461nJsDBRTqdNnUj72N1sobu/mVs
 OXpp2jxp4EjlFs9WgNv1MZdVF1m9XQY4SS6j2YOie+UvkBiYTdYN5uKM/+H3VkzTNH3B
 foFJkofYosxUb1hEBllXv0nVHDKj7X9+1q7SR9ZOh/MfBeXNGSt5MYPLw5NQ9L+VpzPr
 DVhUm8T94/0UbqjWa/K82bqa8lJGnBIckYdaSwUWk/TC/nqfi+/0Xyd78tDpLOx45C2D Lg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xvg1xr0gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 18:31:42 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 442Fl9iK022229;
	Thu, 2 May 2024 18:31:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsd6n1c6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 18:31:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 442IVbhQ43974956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2024 18:31:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E8AC20040;
	Thu,  2 May 2024 18:31:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0078920043;
	Thu,  2 May 2024 18:31:35 +0000 (GMT)
Received: from [9.43.80.154] (unknown [9.43.80.154])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 May 2024 18:31:34 +0000 (GMT)
Message-ID: <dbc992da-ffa3-4d62-9e0c-734e9d180fec@linux.ibm.com>
Date: Fri, 3 May 2024 00:01:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7646/8170] arch/powerpc/kexec/crash.c:488:2-8:
 WARNING: NULL check before some freeing functions is not needed.
To: Michael Ellerman <mpe@ellerman.id.au>, kernel test robot <lkp@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202404261048.skfV5DDB-lkp@intel.com>
 <9c14d5bc-ffb2-4ddd-a5f1-5d419e88b187@linux.ibm.com>
 <87o79o2vqc.fsf@mail.lhotse>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87o79o2vqc.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rCetYAM2qJx9wal5eEjs5b7p4_yURvZk
X-Proofpoint-ORIG-GUID: rCetYAM2qJx9wal5eEjs5b7p4_yURvZk
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
 definitions=2024-05-02_10,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405020123

Hello Michael and Stephen,

On 02/05/24 18:53, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> Hello Michael and Stephen,
>>
>> I fixed the below build warning in v19:
>>
>> v19 patch series link:
>> https://lore.kernel.org/all/20240426060728.559753-1-sourabhjain@linux.ibm.com/
>>
>> Only 6/6 patch has been adjusted; all other patches remain unchanged.
> I don't want to rebase the branch just for that tiny change.
>
> If you want to fix it, send an incremental patch on top of v18.

The below patch:
https://lore.kernel.org/all/20240502182040.774759-1-sourabhjain@linux.ibm.com/

fixes the following build warning:
https://lore.kernel.org/oe-kbuild-all/202404261048.skfV5DDB-lkp@intel.com/

The fix patch is rebased on the linux-next/master branch.

Thanks,
Sourabh Jain
