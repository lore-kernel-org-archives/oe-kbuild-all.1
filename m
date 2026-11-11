Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371077;
	b=UCMw/ZMxlpPpH3gYGRllW+wC8xTyeHGyZ46psMOYzZTUsCa+yXDhd8g6Y7CdnYZtkd5B
	 uqnXErelD6tt49y6WbQ5zWrHkdE7qDsYFaYpSFcQBrzAN7LtSnYnFxSa0jz1z1hw+VBhv
	 8PExF14VCErLcoMrUhhLFAmiwbmQ6PT1hdNrJDsrVeHbfK5VMY1wjyatZyruME20fMob8
	 uRRqD6Z0VQqK3Z4NmqKEgymWdF4K0JQQkBaTESJOBCKOf61iV2KMQMgnTISsNKp3LgtKH
	 OLQOg3XcVUKgK4BNwh5gxIPWEQjVqiL1h8Tb6sCySO+2F/pduAa8p6hnxkOOgSSp8+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vWUrzMN8nC3qw9C+l9CmsKFKxbiwV/1FiCWDbdTG840=;
	b=D6axft/5QxYZpnqGdPnmReSq4mbNVGdZU85O8BiJK9/lKl/1t01AhBiToG/6uoje1wiD
	 sxSnK7i9U1CrwsebB1/MLcxjnazjeflmz3UyBJ9J4BMj/VRWc/R2c7b2QkKcAJLfzVkId
	 YlrR+Ay4ETWIfxCgRCOoolzw7ctzRsM0E1S0/5kK+SbXcUU3hYTCi4pTk+om9DEoKylQH
	 1EXu1I+fUz8Cg4KTczJgDkfcbmj0LUkVjcqvL91aSkkZjzIoqeTR0gR13WKpa34zWf+zP
	 8IfUxk+UcVhfZCQ0o5dTWgLPDEKNjF8zgRK1mQ1WGVa5yaQPcA1aTfupDUoApGUMwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PWrhjmw6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EG5PEIW9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C9606A32E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 04:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PWrhjmw6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EG5PEIW9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tTrX3515902
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 04:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWUrzMN8nC3qw9C+l9CmsKFKxbiwV/1FiCWDbdTG840=; b=PWrhjmw6cWiAIUOR
	nBxnNT8cuBsNpQspycxSw3FhkVArCWOtiHpP+9QEaHqPVqHRw70dmX8aqaQBfAU0
	iSZxnMb8TrjLC/4nDBbKGnK3AuWxMYxp/htIhqnJ0WPfiVKtiQmOeqdKPVdVIiG/
	xXFBynvSMycO/H+NV76X1knr0B/Z/bOoj5VbzxoDPswFl86HCta+EBWmnWRjdhFp
	5jbZ11CqvfgCOHpaScsXW1LiLxTyGMltVDkk0Z9uvbT3XvGaT2FhyhoroHACNgTP
	K19gk9CdvMLJ7fBQp7lQdwxkgTgoj1+MXoxYqPw8gxcaOxGxLbwI1+qxXcmwZoWF
	94PuSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b31stu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 04:24:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so2184695b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 20:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794371075; x=1794975875; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWUrzMN8nC3qw9C+l9CmsKFKxbiwV/1FiCWDbdTG840=;
        b=EG5PEIW9u+JqXvEQ426lCUhMFE4GJpWOGzJxZn23bd91OpDoZToqk5mxLPuDqRJAQs
         og3a5fYRrhKj2ABaqZE2H9MSeoq5LnCVUBp/0wFqkfRvsgcr/4I17k4XBi4Y+qW8Mzx5
         GrU3gNtnhVPjSso6pC1hTHkbA6hhp6IydoOQ6n1qLcSeiCfAHzOY4dQ4XLKwa6Djf9tu
         WFHYjnW9aGcKWvlW2xFYEE5BedUl1VJ6dzr/gFbH05kef+LBXhfJwolrdV7XM0CKxPSt
         Y4NbVfZZ8F3PG/23hcsHLQ85+5H8CFQV94tRlkzm94k1oldNDxA30OLrcVrYoWYIrrR4
         EWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371075; x=1794975875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWUrzMN8nC3qw9C+l9CmsKFKxbiwV/1FiCWDbdTG840=;
        b=Q2nYKJKmyvOaBaMFYjCgMb4SVcKqLCUMaywTAef+xSuT3bJmZ8VsrlBuYlZn1SN6Ez
         Tw0HckRYwMUBf6hWFd14m8skwiUi4hoqzR0eOyVH9NmaAQUd/c8LJr8dCfHQxHuXVpb0
         W7tR8ZCq4FApC/JsCwIZCpuyB7tsAtx/Cn+A1XLgFAetIObWzg/L8wi4xHMBzE/dwMLH
         CcHFxDdjX73A5I/ZDiF488IBLU0ouCQh7H94VHw6QKele5JSE1EWGVQx39KbD63PBzGl
         ehNb4ih6eORi5t9hBNx1BLLyJxyfMPvPr75geLXJnJpOjWhVJSfaqz2rbvJgquUAiWnS
         BCPg==
X-Gm-Message-State: APuU4Z/o8RAwiNZM4iTfZAELPaOZjfW+TzHYuSmjeqSDhai/MCsTsFWt
	9uIioSO5WW/kZavOJt3NXZ6pS0jFdiKl1eP+s/ljVVl/moWF+mHhtVYxXpq/n3akiuHAGd+TTcQ
	0DLrTRVL4kkUuZi1BpD3J7t78H0VQRTEHktkNU6UqFH6oOej+RV28OXeKBoOUzfcuPNMh
X-Gm-Gg: AYBFou1KHMuELt1NvQ+rLBtmh3iRtgTwIMi8NURTVa/m8pjSFXmXgEJWFKEpm/b94zj
	mw6gaxnJ7m4LRfNbi+DvlCVOnc80QKmNAODqHJMb0BGOLYatd1g1Ze2vrVN9Uy+NwNAoaSN7LeY
	6QqJUkZnH/PM11MAgrWy4X7g7713GYidcefRPSzu2BLjJgNNgrsUPdrtHGHNKCPwQefIQw/NDDA
	TH7BD5ZOtU4V8KYJP0HODDOtpFimjKk04yLcXHpYI0YRqzzhPoVIY6lceBAn/kTcl1UyZfZVU6F
	NjaEmaBVQwk4E8I5X7jBkGgwAk9cmkxk2ruoUj7xLJvpyYmSQUH2Xt92QIJb4IkO9oqJ/dJyOVr
	iO2H7+1UfivhkPmiGCynmB/kdamjX/ZXlj1xkVozt1EFC8ZPZikTLycwshb3pdtDtdSxjIRdqxk
	n5B2mL1/I0WknVQXmIl97dirZisaI0enHJ
X-Received: by 2002:a05:6a21:7010:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-3f2fda98bb2mr939332637.18.1794371074762;
        Tue, 10 Nov 2026 20:24:34 -0800 (PST)
X-Received: by 2002:a05:6a21:7010:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-3f2fda98bb2mr939310637.18.1794371074260;
        Tue, 10 Nov 2026 20:24:34 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaad41578sm1712051b3a.32.2026.11.10.20.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:24:33 -0800 (PST)
Message-ID: <cbd2aee7-95ae-4d30-8458-b7da2910867f@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:24:29 +0800
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
 drivers/platform/x86/acer-wmi-battery.c:292:16: error: implicit declaration
 of function 'devm_battery_hook_register'; did you mean
 'acpi_battery_hook_register'?
To: kernel test robot <lkp@intel.com>,
        "Rafael J. Wysocki"
 <rjw@rjwysocki.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
        jelle@vdwaa.nl,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <202611111027.YYwIlIDB-lkp@intel.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <202611111027.YYwIlIDB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3ee03 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=Q1K4HTE4AAAA:8 a=O2upucybYjXuBVFjdQwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=v8M4KpxsNpHYtUgu9mhN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfXwzmeDNdgCifO
 sYQcUx+tjhGgPWsi2FzunA5WhffkQq5GCBVk/PXIrbIKv4fqDkqRPk0W20PHutgTlRcVpwvmlkT
 cOFjeBYkJZo/Ictu8YVt187W1+ja3+V71KaAq8takxgoULuiB/1XWuLvB129qsZjTqVoqBGUkbk
 iAkJYide1O4Il90zQjNvh6NyHpPc3BTDh6H/iSOs1R+wWhtEFKq/GflGgTasZo60GAqr9BNMVc0
 u1G/Q69SiIkGgPZIPwj6zy7tQqIZPjhWebuCJw7PXfndpWvpKmpQBrfG2+EA6RBAcxX5jWfxhYX
 48MNzLDd0vxe/MquFst0OabVFBxctmg042Dl+cnG2HOQMfda3+YLcm80QREyGtMVnpN6Lw40PYk
 tX0HdJrHIfU9FqFrGkyqlXP+PbaoGGAaNcFJAoyerlH77liDebSbQJqV9sXx+TNnZryNcEx/k4b
 0fOL7v7SjHPZNYAiC3g==
X-Proofpoint-GUID: 3_xXWxWeFR68tw-tXTSSDsd0EFgmK9XY
X-Proofpoint-ORIG-GUID: 3_xXWxWeFR68tw-tXTSSDsd0EFgmK9XY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX3HR43IJ466M3
 0ERkvUDqFJgwiKmJ6n9e6Y8gTyvs6OF3aLRVu0REZEjeHE04faG0pO49XK50wifrBuCvTqmLQH4
 iXDxI1vpHj7NnTZJjJ+auCU0+RhusEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

On 11/11/2026 10:33 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
> head:   51bafe2e7302403a43ba45415bf9a268a7fcaa05
> commit: fafe4f5166bc3d43e28967efb9ea82b1f456b798 [9/22] Merge branch 'acpi-battery' into bleeding-edge
> config: x86_64-randconfig-1011-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111027.YYwIlIDB-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111027.YYwIlIDB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611111027.YYwIlIDB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/platform/x86/acer-wmi-battery.c: In function 'acer_wmi_battery_probe':
>>> drivers/platform/x86/acer-wmi-battery.c:292:16: error: implicit declaration of function 'devm_battery_hook_register'; did you mean 'acpi_battery_hook_register'? [-Wimplicit-function-declaration]
>       292 |         return devm_battery_hook_register(&data->wdev->dev, &data->hook);
>           |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                acpi_battery_hook_register


I took a quick look at this merge-ordering problem:

devm_battery_hook_register() gained two new callers in v7.4-rc1 while
the rename was still pending:

Old API (devm_battery_hook_register) users:

   c72dd9994952 ("platform/x86: add Acer battery control driver")
     committed:  2026-09-18
     file:       drivers/platform/x86/acer-wmi-battery.c
     branch:     platform-drivers-x86 -> mainline v7.4-rc1

   929433336e0a ("platform/x86: hp-wmi: add charge_behaviour support for 
Spectre 8C15/8C17")
     committed:  2026-10-14
     file:       drivers/platform/x86/hp/hp-wmi.c
     branch:     platform-drivers-x86 -> mainline v7.4-rc1

New API (devm_acpi_battery_hook_register):

   c27a6fd6b403 ("ACPI: battery: add acpi_ prefix to the battery hook
API")
     committed:  2026-11-10
     branch:     linux-pm bleeding-edge (via the acpi-battery branch,
                 based on v7.3-rc2)

(Please note that the robot only reported acer-wmi-battery. The hp-wmi
should fail the same way when CONFIG_HP_WMI is enabled)


> 
> 
> vim +292 drivers/platform/x86/acer-wmi-battery.c
> 
> c72dd9994952eb Jelle van der Waa 2026-09-13  275
> c72dd9994952eb Jelle van der Waa 2026-09-13  276  static int acer_wmi_battery_probe(struct wmi_device *wdev, const void *context)
> c72dd9994952eb Jelle van der Waa 2026-09-13  277  {
> c72dd9994952eb Jelle van der Waa 2026-09-13  278  	struct acer_wmi_battery_data *data;
> c72dd9994952eb Jelle van der Waa 2026-09-13  279
> 4dd10fbbeb9c33 Kees Cook         2026-10-28  280  	data = devm_kzalloc_obj(&wdev->dev, *data);
> c72dd9994952eb Jelle van der Waa 2026-09-13  281  	if (!data)
> c72dd9994952eb Jelle van der Waa 2026-09-13  282  		return -ENOMEM;
> c72dd9994952eb Jelle van der Waa 2026-09-13  283
> c72dd9994952eb Jelle van der Waa 2026-09-13  284  	dev_set_drvdata(&wdev->dev, data);
> c72dd9994952eb Jelle van der Waa 2026-09-13  285  	data->wdev = wdev;
> c72dd9994952eb Jelle van der Waa 2026-09-13  286  	data->battery_ext = health_mode ? &acer_wmi_battery_extension_v2
> c72dd9994952eb Jelle van der Waa 2026-09-13  287  					: &acer_wmi_battery_extension_v1;
> c72dd9994952eb Jelle van der Waa 2026-09-13  288  	data->hook.name = "Acer Battery Extension";
> c72dd9994952eb Jelle van der Waa 2026-09-13  289  	data->hook.add_battery = acer_battery_add;
> c72dd9994952eb Jelle van der Waa 2026-09-13  290  	data->hook.remove_battery = acer_battery_remove;
> c72dd9994952eb Jelle van der Waa 2026-09-13  291
> c72dd9994952eb Jelle van der Waa 2026-09-13 @292  	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
> c72dd9994952eb Jelle van der Waa 2026-09-13  293  }
> c72dd9994952eb Jelle van der Waa 2026-09-13  294
> 
> :::::: The code at line 292 was first introduced by commit
> :::::: c72dd9994952eb09442827caecb945474ae3072b platform/x86: add Acer battery control driver
> 
> :::::: TO: Jelle van der Waa <jelle@vdwaa.nl>
> :::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 


-- 
Thx and BRs,
Zhongqiu Han
