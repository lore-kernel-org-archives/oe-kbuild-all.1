Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31F1DED40
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918912; cv=pass; b=nbmyM7vHDNkVi3YkCSTxiK1PST5II6YqkOX2jgZPEeFu5j4TYOya2KF0n/aDxhjR0ekCAN0xKo08d0HIwviYa+tFNbo0DYTYt6rDsga5DlQ5tfp18kwff7fFIOoFj9NImL4QiSsq4JPeBJKl5TF1NiaplWsxr6YAEH/0l/fmtrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918912; c=relaxed/simple;
	bh=Rn1IsS6PhbAFx2EmtUfd4zmz6NLavpe3mVaE+fLEULc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt1SLDgBoTsr7H30A4+X8vdHWCRHY81dTzP6HWEaT5wX58uGEGGJnM6sfXFevT3EC2qpb4zI4HwfRuU4ZDbVUXhH5phygfHHSBjW4J3Xt9EBWZnZ8g+KR7vX7mjGHwuHKFrPI9KoWzGXS1IcqFjUcm5kdMax1rVtmaSzqVx9vyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHEe3L3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4JmQ51P; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHEe3L3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4JmQ51P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AI2E258461
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 05:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgT9daQnKhz7mt8/V1NV+uJhUSx2RbkBcHHhtx/VZto=; b=NHEe3L3s/QPZzPT1
	4RhhXkhcqzUTvqIX/tU7HJhWZGDa6+ehRMf3xSBgraGdSvc2mHX2zON6Jri7OdSo
	m83iZUw4S7dC2liUt+u0LHb/+6Q2rrmo4TsjIwf6Byo5/U2A5meYt9mdmNpfDMJW
	XaWBOEHOWl3JDe6YJqo/SStUjTTbCHoGTEJ+EuFfRMQuBXte4KUzJ2zje/gDjxKY
	aKEVJuK2Iw9dj0Fkx2bbzNqcgDbpFGN5AaEXGxtcT6eYrUS4zItHHh0LFhOuzuQa
	IGptJuL/qZlcPJ//MRfrOQztDah5Kyw8PVzVxxIxDMPsgtEjaqpk6Lymeq78JHbd
	94q7RQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hmduq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 05:01:49 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e8a76a273so55964717b3.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 22:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783918904; cv=none;
        d=google.com; s=arc-20260327;
        b=f+++6Dh2RBvfst7CH2LpHiH/PLePHb6bT/ZzUs12uEvpnnWM6BXuUT+oQr2wIAaiDJ
         NhQTo8hRiDRPIMmTxy527Kmo3wm8pbf9dINAuqW00kUOpgzlqHP4gu+JOY0BMotljZGi
         UfkT5e9934JheGuiozhvaBGd5szMQmE2T/MVYt0OB9nzgyYMeBi0TQr1NVesTozgpXGX
         4RnxdjOPGRYoS8m94wVp5/wuhXq4ftGeGXcn72Jr/yH5sHOGau6vUTmzjTuJvwLpqmw4
         TQ8fXhd+AhDIm65NujaXKqw6yg6/MyaU+xkkaOxXCHKRy5ZbUAmZqlTiaCjbc/RFxR0c
         y02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgT9daQnKhz7mt8/V1NV+uJhUSx2RbkBcHHhtx/VZto=;
        fh=SfROUUFfWtxXctRDZh0tmh2ooLphYKO4U6SrJ+4dt2Q=;
        b=mswArWutjbHDs3ZQC/cFqwFJQFrwPMaCfzBKGULNCQ5HbHuv6aOi5ppvUt7Kt7fmaN
         Vv6YNJu5+xw/R9neBqJgZLulbzAcfFHqCNRevDq3ACcx40Gd8TFiX6Ya7bXG1Y3iLlFm
         qazrh92sqk4bo+3MNS6AUIbuIaQpo0TP/nwSrN+IW5jaCs6vFqfgfYACEbGe8ffC+7sY
         AjH9g1ZlETXu1tB+drR2ltyDYg9zu1q+vF0mS+WGhSAcVK5xqf/P4TAhAKntD2XizfB5
         6IRuMLy+wZu8GfOpcWADVARZJRGVTawu+Ep8KV6JBCvnD73RyZ6skKjKGesAPqruoTX+
         YckQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783918904; x=1784523704; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgT9daQnKhz7mt8/V1NV+uJhUSx2RbkBcHHhtx/VZto=;
        b=E4JmQ51PdKYE0CcasD55OuB03NgqNms3NWc/cIpBh76ZOEz91KGD8AUWBXwKpRM2i5
         kGZR96HOO6sCDSgFcml+1MHG4B+yaW392OcXagXszVhr5RNLfCiGEak/wq9bpfSn15+s
         S8Xs4KTiX0fy8smMR2C18EZ4GEU+kR5KYIV9QRsq2p94B4g8ElO/GKOFI4v+TI7xKaWG
         ais1hxlniNzdkx159CDebG+2Ls3OGboOs0Md/BRDlgsNwnroYYxxastazJlTfsVRcb0H
         VLWCLWZBvdLgn0Lm3znxTp8XAJILinbJZrZup6abjhjAfaeCUHEARerRThu085ZtZ4tl
         E+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783918904; x=1784523704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgT9daQnKhz7mt8/V1NV+uJhUSx2RbkBcHHhtx/VZto=;
        b=KEY8sAhhrtvDLdYe5ziTCUgYS2qe23jQOX2Iuf6dTMO1+9Cc1jSOktnjBebAyFH/Gg
         ag58FJ99568TpVxZN4iaGWc4/HASIXkG4ew5YS3qwGrimYBVBuGSPXNKIQpe6BQMUPH1
         b+QPj/FOVOGWGg253/jeqBzA+kxHbr9YECXJrKRt8aVrS1H9oKmp09Iup/eXaV0B9mln
         Mq8Fs6J8TncJ9o68KSJSzTF3qNEXkPSZpO0XXxN/26IilGslaHptdtC1Ssfc0WkC/UOq
         hmAkulN/lmd3NhCUWRVCJ6QmEnHH/X9KXk1TejWW0QHPvdqmdG9ihdlQh4NbxyQK1E+8
         XGwg==
X-Gm-Message-State: AOJu0YyvcANcIJOPHa54YpI9rtQRfJZaoRoPip2iOr4NPFk8zJio9V+I
	8odQcWYFEedfbINTBcckrWdQB8IpwRM3ahMDDaFalrrzDhsM+3G06aV7/BJOQX/SvMklDF6Mq9n
	Id0jgKOyfW1NaGNl0dV2Qd9t7gcxW9h9PKy5PLA+kcZz3Uk/D4p/4j0VwzNhlCzL7BHLaTCi14x
	6oyWJYt2zlLgN3kfq7eWW/EXjY87GUO8zUtjx02ntOe3Q=
X-Gm-Gg: AfdE7ck8SLCtJFKMk1A9s3h5eYVZmEDfqrBgKghGotVrlm1NPSzCkk5nqf71ItZ5wpS
	kGw55LR4v6YfZA+qqqbRgRgyPWhm65yLJzPFTZEXVOYEaoBoBD/87RVmVNI0vmntebEmZWD8EwY
	pFib322Stt3fo2sBHv8hI9AUzcaRphNvd5qwVLTldLEGj07FhhzlnNv0Mnwzy23Z1KDqMi
X-Received: by 2002:a05:690c:7347:b0:80c:3848:bdf4 with SMTP id 00721157ae682-81e9013e2f3mr61970667b3.41.1783918904117;
        Sun, 12 Jul 2026 22:01:44 -0700 (PDT)
X-Received: by 2002:a05:690c:7347:b0:80c:3848:bdf4 with SMTP id
 00721157ae682-81e9013e2f3mr61970527b3.41.1783918903749; Sun, 12 Jul 2026
 22:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607122327.3zkZCUaB-lkp@intel.com>
In-Reply-To: <202607122327.3zkZCUaB-lkp@intel.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:31:32 +0530
X-Gm-Features: AVVi8CcmlN7uHHQ01ErxPERNLPgc7RshLIRKmzODUHgD6MGnF9q9qrZQP0M5lJw
Message-ID: <CAGptzHN9zs=88vzJQ6XVzUo6+V2njRO+43FYVxdTkH3hXkXEoA@mail.gmail.com>
Subject: Re: [linux-next:master 4886/5655] depmod: ERROR: Cycle detected:
 qcom_scm -> qcom_tzmem -> qcom_scm
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zb6-xnlfLG3xQta0k5_zT1XaQnupFfsb
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a54713d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=NEAV23lmAAAA:8 a=eSJdgPLWwJjyhhYJrE8A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: zb6-xnlfLG3xQta0k5_zT1XaQnupFfsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA0OCBTYWx0ZWRfX6Q0pEx9Lkuwn
 GyhdrTUvKB9Z4nM+rNJ0cYJ1hJENC9kucAQx6F781QpExxvVAikQJbp9pyE2V0sh8U1P7dYNOPx
 zo0x+6rTXB+LoXJIZzDPf/B4RXC6VFnQfJB8sVf7s+t5bw4xwfiq/Hd2f+Q78CSqho4VPddq5Mp
 e1rH4SGuBWfkw+qwBCSMkinhi/MpFoQL41Oa4YFPwbygh0GnZoIKfTLvPFOeOKPhJXesbXit+j7
 d1q5MZPA+nk6SzL7JNubV2D1xWIqu5qEU95g8kYGNqAAo8NjaGzyQiyZM1SLahcapnSJG9mUxLd
 L4ukjrn9ae7xPHxMHrAdP90jqOsr2iss2FFx89O9Py+Hs3x6SBPj5oEbQI+GRSsbD0fbKxNdRk+
 CpcqlaFgiuob8YlLD5UXGssKWsQzfwTizDzwjrwGQ9iTZ3HDZY3ELYwXJbeBZsKjZTO6GZd5AdX
 4W34JztgngcTx/R72Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA0OCBTYWx0ZWRfX54GHCAz+zHne
 IH80J2MXvAhnFaUu8iJMiXh4VcK3CQCyjAxMkwk2WdK4YmHMcT9ubar/FckAZ/V4Gz4EwBR3t0g
 48WhQV0L1Fi9dhjEUxpkXoNbwdC/3PA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130048

On Sun, Jul 12, 2026 at 9:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
> commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020 [4886/5655] firmware: qc=
om_scm: Migrate to generic PAS service
> config: i386-randconfig-003-20260712 (https://download.01.org/0day-ci/arc=
hive/20260712/202607122327.3zkZCUaB-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260712/202607122327.3zkZCUaB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
> >> depmod: ERROR: Found 2 modules in dependency cycles!
>    make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=3D=
4014285631
>    make[3]: Target '__modinst' not remade because of errors.
>    make[2]: *** [Makefile:2090: modules_install] Error 2 shuffle=3D401428=
5631
>    make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D4014285631
>    make[1]: Target 'modules_install' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D4014285631
>    make: Target 'modules_install' not remade because of errors.
>

It looks like the circular dependency was already there prior to my
patch-set but it only surfaced once my patch-set got merged. Here is
the fix [1] though.

[1] https://lore.kernel.org/all/20260713045811.484554-1-sumit.garg@kernel.o=
rg/

-Sumit

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
