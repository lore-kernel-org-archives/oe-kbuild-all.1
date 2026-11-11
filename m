Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395935;
	b=K4nG4mvg7qWpV7Y+cm/hGQtEzs2hb+/1QrSgb3gpfK+vCLWewA2MMiZmnEVUZ+a8/VV7
	 5LxUbdjSTNdylxNDrbL546ij/99Y2dg8wOaercdavNp5GmQ4BWDdkGIhohR1bFdrjA1Mj
	 bM6sEL/Yslanpi74aYkORAfyN4laJURpglRl1qTs2eUaNw0WRbRsijNmaCXo4DaYiJFUr
	 149uYutYwJ9Vx/JJ2lfC5tb/x6NDgP3fGv9JiSIesZ1HfuQVg6gtTeISaUD00fmvBfTo/
	 wKUEbVdFRL0UqoSG/ZJ1fb3ImLaGCEMNKkXP24inx6O/aGQk2IPzBDfp/lDY91ljyAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TPBAimFTxSZd3Y5OeVj6SECMmnSpH4mL0Rms57DrSHM=;
	b=kLnazIVF9jV9dfGBlMOy7CAcH6XRur3hCggOd8qHx7RXAwBasijlJTdgOcRvtS3bbp7M
	 BL8AhreUdmbGkdC5M7CvmkaLlD22aJN9NgZe0xNtTXsBNYK2tN/pP0c1jwNKL7cWnIoZz
	 fWBXl6YPZgYYe/SmwxJW2Y50w8LZC1VB+ZzATSp3oR8gzE/oYvSRgiIKfOFz++dIxv6NP
	 bK715fURj44o4cb1m/EsO/BucugWQ3YnI5sxtMprBciSk8HFthjIoN56rI1mDRn7gk5ac
	 MgxAxMJj2JUPWtY+xC0xBQWWxnC0s2fk4F/VpcbEar/b+1JjcRjJ+nVV47AeTF8du4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJ+7Tr36;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIrx5FAA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481F606A88B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E481F606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJ+7Tr36;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIrx5FAA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAlUT31052608
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 11:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPBAimFTxSZd3Y5OeVj6SECMmnSpH4mL0Rms57DrSHM=; b=LJ+7Tr360xzcgazj
	DnFEggp3Cb+r85NfE1EkbRoNSOkShXoB5uwE0w9XJtBHd71O67NaElCK4UaQCMmE
	UaTjRRflWbTpZQXhBxtrpnQO7Xw3N3S7HR+5HEgNMqCnRBSjCsXK4O+y01dvHUNz
	r+IDB/8vlEm0O5d5JyJx5f5YwRLWSZTvLvj/kpc98cv7/+YfnSjlBOxh/OFoXfC4
	AIwQxiEbsbqzN8qZgShbxEB6ioL9JlZvu7dNjxjkSz1A4+u4ofVNdmnMqTEQRTWg
	Q+DrmHmbCrFBslaQHoHq0aTNJAm0D1ojCciOLoES87/nD/R44S8AIdcTLmFnWm4v
	RMg52A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2ae3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 11:18:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a073778890so2562700b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 03:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395933; x=1795000733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPBAimFTxSZd3Y5OeVj6SECMmnSpH4mL0Rms57DrSHM=;
        b=LIrx5FAA0h2PWCpaOSpG2rD7A/BVQP/55gPmBNByqv5oawhC6yQsSvdnU2jAqp+JTe
         7kwD37nTmL0gAyZRLwVsfgnWZvC7fQ9F7TZpYyba/BlqKHJ01xDyvVwFxEOP8jqz5gb+
         HcYLMrf13fw/SHJvyombVgo+DKUCcnct3nArwB/HZsVrgAOaOEz8eSPKlT8OnDP9Iw6t
         W5+EsfvkdZ2ldF5N2YOqAZe9usfLSngkGMMSi167sLzqGoAHbULCdTJvg9EJkt6VhKcp
         Rlz9QMq1p782r9a3jpffiSMb4ZZ5JnUyZzr/dbC4ByRyT0ODVP1QU0w8ojC8+xqaQq5s
         ZI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395933; x=1795000733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPBAimFTxSZd3Y5OeVj6SECMmnSpH4mL0Rms57DrSHM=;
        b=BogyZBhcc2sAQpkJUHVcVrR6gfTm7Jb4X7bmjDbUsmcUf4AmpFhIz8XpaI93pKnCRZ
         zqH8y5AMgBYFb/qh1i0QKG1XCGcImWrCH1fRqM73luCLxNtvapUe/77PIpPl1/BWzNZf
         bOvi8Gd1M0YPmt7qELySWtUulbYlzF3KYslMvaKywb5NmLJ/f3uevaghzRJ5BAV6uUOx
         NOVtqczT69S0ApZx6Euleunu8hkx8PSnM4uMT7qn0RShOiJC6/N5IcUahdPVuvAn1hrn
         5er5H+EqGoIo3EasRhsH+ziCU7coqSshB8+Z2FiPIiuuj1xhfjcNBJVF8j8WQ/+d1aLD
         ltgw==
X-Gm-Message-State: APuU4Z89LmrudB/YR8yZSuu24uzwcTu0UPtR/jZB6iODaDYSNw32qiA+
	pa7QDtFMuSGP7ODglSRUdpiIRlAPgRg7n1PCFg+egbtvTmpONregvihyQ0aKSLfKYfaWPiysXxV
	s1Mxj5fSS8IRG1aFyGMxyObZuL5t7TFvKZBtEWNuyE0Hi5zD+DNAoMaPutmEBE7lVhZqt
X-Gm-Gg: AYBFou3pcuPEtg5Q2DWGKyFzjFBgZr/3W36lx4Dqpdw6Ulr0ZfKFzRd08VdmqcnI3VA
	8abUl7loP+d4kXM6qK+otKX5EzAh02C/RLiYwiiCh0zFoY7Xb5BeYxhAyfDSmviAlPEHq4V90IB
	JDb5Mi2IPZjd5qpi4tm2fy9kVT+F1dtdJQvp5P8p4C4yrtJv7RJ9Ew9QePhj1rMWprvmK+ENwYi
	oJSLEl3LAP+1OAo4alPZSurPLoxqFOeowytf6bJM+25qozq7lZWChFIAPk1g2PUrohSUTh9fNUN
	s0SsA5gL94czTFaf9/HXuvGaaNxxVEjdKEMFC08HUH7XFSI8iBfbM9OGSMzlmPRiRVfr/l6WqUj
	2c2NWuhaDY09QpsIXxOphVwgjnLsEn5q5eqTdr+Zd/nyOWOS61XPvqqkLdk0MUFyfIDBvmjiHPy
	5znAP+lpi7SPWjGzpOvlwdgSkZtlIhtVo4
X-Received: by 2002:a05:6a00:98b:b0:886:18b2:361c with SMTP id d2e1a72fcca58-8bc19dce039mr2367194b3a.7.1794395932708;
        Wed, 11 Nov 2026 03:18:52 -0800 (PST)
X-Received: by 2002:a05:6a00:98b:b0:886:18b2:361c with SMTP id d2e1a72fcca58-8bc19dce039mr2367170b3a.7.1794395932192;
        Wed, 11 Nov 2026 03:18:52 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bcc3d61dd1sm282366b3a.18.2026.11.11.03.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:18:51 -0800 (PST)
Message-ID: <32021bd4-e144-4674-a5ed-ef8b38950b7a@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:18:47 +0800
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rafael-pm:bleeding-edge 9/22]
 drivers/platform/x86/hp/hp-wmi.c:1057:16: error: implicit declaration of
 function 'devm_battery_hook_register'; did you mean
 'acpi_battery_hook_register'?
To: kernel test robot <lkp@intel.com>,
        "Rafael J. Wysocki"
 <rjw@rjwysocki.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <202611111143.CWKE7ewK-lkp@intel.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <202611111143.CWKE7ewK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX69ZZknJV4qY6
 +OY6P8i1yGklpPCY62oD+Y66um2tFeCkqK1PGk5NhmXKwE3+alJvCAyeSysW+0ints5qAZIv9kn
 LZRXeD8Y6yFp5HqY+iygRPZo9s4ZGTM=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af44f1d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=pblzrQVLAAAA:8 a=txJK9vjdTDeU5cjP6X4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=mmqRlSCDY2ywfjPLJ4af:22
 a=zigF7KAJN4Oc2YRatsUt:22
X-Proofpoint-GUID: 8K-eJg82BbuJjFi6tO1VIiZ9Gckp9yqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfXx7HEzXbO0o4N
 FXnkeuXTJsd0hc6QUBejBv4LTYJ7RJoB0dBig7jjVlXReIi76i1bs3tPlfrfOM3+4X1QDRZvWp1
 l7WRUK95CVfBlLQbZS61YczAA8Fu+OrurbKoRXqB6UjssVq/bVAvZqGP8vG1VHYgsPaGt0tx5ft
 VWz4KzHIqlSY5dP3Kk9y/z0kaxXPtsqov/lFVDUJOcGvbNzO8VBp0DANR+/By15RmS22dZUMgd0
 Bd7FVnXW7JqCr/lzYN34Qn3X4YxPt/iaWukHOy4fXyQK9KRvPc7Z+TCF5ede1zJNQAOyLHrQUmM
 VWupfNgFm0MNikXFlG5veImE0MCMet1La70gCnLZREPoxZiD+zYXOFAclKYG2abUETdIlx35ssM
 4jjLURhTav7+JQKhnogdXn7aFvHnoDd/bGi1SHh+JVZw54fI/NY7fhkEDUK92T/wqZq9sRDV9ZK
 J6tvznhAcJiZNZaeGTQ==
X-Proofpoint-ORIG-GUID: 8K-eJg82BbuJjFi6tO1VIiZ9Gckp9yqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110044

On 11/11/2026 6:46 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
> head:   51bafe2e7302403a43ba45415bf9a268a7fcaa05
> commit: fafe4f5166bc3d43e28967efb9ea82b1f456b798 [9/22] Merge branch 'acpi-battery' into bleeding-edge
> config: x86_64-randconfig-2003-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111143.CWKE7ewK-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111143.CWKE7ewK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611111143.CWKE7ewK-lkp@intel.com/
> 

Addressed the same issue on 
https://lore.kernel.org/all/cbd2aee7-95ae-4d30-8458-b7da2910867f@oss.qualcomm.com/


> All errors (new ones prefixed by >>):
> 
>     drivers/platform/x86/hp/hp-wmi.c: In function 'hp_wmi_charge_control_setup':
>>> drivers/platform/x86/hp/hp-wmi.c:1057:16: error: implicit declaration of function 'devm_battery_hook_register'; did you mean 'acpi_battery_hook_register'? [-Wimplicit-function-declaration]
>      1057 |         return devm_battery_hook_register(dev, &hp_wmi_charge_battery_hook);
>           |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                acpi_battery_hook_register
> 
> 
> vim +1057 drivers/platform/x86/hp/hp-wmi.c
> 
> 929433336e0a6e Shang En Sim 2026-09-30  1033
> 929433336e0a6e Shang En Sim 2026-09-30  1034  static int __init hp_wmi_charge_control_setup(struct device *dev)
> 929433336e0a6e Shang En Sim 2026-09-30  1035  {
> 929433336e0a6e Shang En Sim 2026-09-30  1036  	enum power_supply_charge_behaviour behaviour;
> 929433336e0a6e Shang En Sim 2026-09-30  1037  	int ret;
> 929433336e0a6e Shang En Sim 2026-09-30  1038
> 929433336e0a6e Shang En Sim 2026-09-30  1039  	if (!dmi_check_system(hp_wmi_charge_control_quirks))
> 929433336e0a6e Shang En Sim 2026-09-30  1040  		return 0;
> 929433336e0a6e Shang En Sim 2026-09-30  1041
> 929433336e0a6e Shang En Sim 2026-09-30  1042  	/*
> 929433336e0a6e Shang En Sim 2026-09-30  1043  	 * Firmware retains inhibit across reboot, so seed from GBCO rather
> 929433336e0a6e Shang En Sim 2026-09-30  1044  	 * than assuming auto.
> 929433336e0a6e Shang En Sim 2026-09-30  1045  	 */
> 929433336e0a6e Shang En Sim 2026-09-30  1046  	ret = hp_wmi_charge_mode_read();
> 929433336e0a6e Shang En Sim 2026-09-30  1047  	if (ret < 0)
> 929433336e0a6e Shang En Sim 2026-09-30  1048  		return 0;
> 929433336e0a6e Shang En Sim 2026-09-30  1049
> 929433336e0a6e Shang En Sim 2026-09-30  1050  	ret = hp_wmi_charge_mode_to_behaviour(ret, &behaviour);
> 929433336e0a6e Shang En Sim 2026-09-30  1051  	if (ret)
> 929433336e0a6e Shang En Sim 2026-09-30  1052  		return 0;
> 929433336e0a6e Shang En Sim 2026-09-30  1053
> 929433336e0a6e Shang En Sim 2026-09-30  1054  	scoped_guard(mutex, &hp_wmi_charge_lock)
> 929433336e0a6e Shang En Sim 2026-09-30  1055  		hp_wmi_charge_behaviour = behaviour;
> 929433336e0a6e Shang En Sim 2026-09-30  1056
> 929433336e0a6e Shang En Sim 2026-09-30 @1057  	return devm_battery_hook_register(dev, &hp_wmi_charge_battery_hook);
> 929433336e0a6e Shang En Sim 2026-09-30  1058  }
> 929433336e0a6e Shang En Sim 2026-09-30  1059  #else
> 929433336e0a6e Shang En Sim 2026-09-30  1060  static int __init hp_wmi_charge_control_setup(struct device *dev)
> 929433336e0a6e Shang En Sim 2026-09-30  1061  {
> 929433336e0a6e Shang En Sim 2026-09-30  1062  	return 0;
> 929433336e0a6e Shang En Sim 2026-09-30  1063  }
> 929433336e0a6e Shang En Sim 2026-09-30  1064  #endif
> 929433336e0a6e Shang En Sim 2026-09-30  1065
> 
> :::::: The code at line 1057 was first introduced by commit
> :::::: 929433336e0a6e5014af7b8849f369712d2c8964 platform/x86: hp-wmi: add charge_behaviour support for Spectre 8C15/8C17
> 
> :::::: TO: Shang En Sim <sim@shangen.org>
> :::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 


-- 
Thx and BRs,
Zhongqiu Han
