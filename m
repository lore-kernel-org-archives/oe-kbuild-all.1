Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1632F618B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762524884; cv=none; b=NQe6f2j2bTQ39Imp22nfHQ7g6ava+7I/CWOa5IjKBcNprbNntPMCWs4ylCOk87gF1dBo4koACl1ycXIqqnecwgZo/RNyS1xa0hPrJ2s0KIfZdstt4/WtDob8DBWiGxb44ObAJgmkSjpA8fElIugClKUI2LXW6yTIaCsXF/oP5r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762524884; c=relaxed/simple;
	bh=RvPQxgIgtwop9B2He8NTdcqhJ7VIGmyJd05aqc1U+Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQc8iE/nGjvGiMyLhQDrcpap4yzQ1lLLfCOLH+bLFXcWRrikIojuvSzIiE6Qz+hScr8YJZNQP0ZWcs3RtVwtUkerqAIWYl2jDv5vf624qEIy8SpEt6fzdLBHmZJrGhwIdquZCklfIYzd1CZ5A0Ih+w8R2WPnSgnk8YDmrKscDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bjh5494M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdBg6jWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bjh5494M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdBg6jWP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7CTwZs2280821
	for <oe-kbuild-all@lists.linux.dev>; Fri, 7 Nov 2025 14:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SmS3Q7L4A3dg/6fm+d7u4/uz
	7vXGdzANJKFOfiokV5I=; b=Bjh5494MsS6Sk0DJGfkDLCDoysY3bFCW5F2R/eRK
	Iyu39AzYTmWDp6Key2rEag9eNZYJSm/zVM1W7uOxcHJMzmYRgflBckSSsvPOyqcD
	i0vgzH8Y3diCVQzO6X03IorfVO6LQK5sTqLNLcUl3CSWLYqT0Zsb2Fq9VkiehWDv
	qBrXyfMtwGfNeXj+AW2xvGiefDPGczF5axJCS/oiXxahnUlmWcVU/A+GlClU3I5F
	sk3HGkvbc49koe0zSIGarEpycMHqtQ7OTrKDVHrjaAY6yJFkVqqPmh0oJkp/lG43
	6c+rw5CBEEfGTEvZ3fUkO/NLBM5sBU+O80YkFCJ2f8Lprg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9shfu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Nov 2025 14:14:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so22833361cf.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Nov 2025 06:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762524881; x=1763129681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmS3Q7L4A3dg/6fm+d7u4/uz7vXGdzANJKFOfiokV5I=;
        b=cdBg6jWPuAVst1lIE6yhyBbXJD7uoeZvV23n8XJskCnLwVYkfsA+6QSXJSfLcU77xO
         i5tM2bkjKfB8tpQ4wXvbToE671TqnLomCwx2QMj3iDpoN/t5RmtRNvg1SOx4u5DfqnAS
         FH19IbeRvNFOaH5DCgeo1D6PlD7XhJCCdYHVHVMejpcDGkv0x7zTXNzhKSxPKcmuVhb+
         W7vGi19fWCtpwJ86bZikJU3gE/iCtyISNuutYomEeyAl7gYX/YN/J77mLVxDhhu5vFMA
         Ojg/gmY1AuVRDLeaRQ0086mTs66uAlQPx0AIEhgZxRxFS9FVudiEO4I7mO6s4IICtnZZ
         BKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762524881; x=1763129681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmS3Q7L4A3dg/6fm+d7u4/uz7vXGdzANJKFOfiokV5I=;
        b=orsdATydMCEWa3XzjRrYuCN4Ckq9IgZ7lD3zzWzlTZ2XXM8fXND/UdqKcfiwEydQp/
         brCdy7VYB0cEWvbU1oje3oMgg8uDRala9G74JKgkhph1Qu8lh570y1dEa6/+G5PoTtfh
         /pK9d67NlBogcqSkmRk+0lJZhADG3/vxQvSLK0sk2KfaozNrt1fHy+5cTEFArXVi4zeg
         k5z1YlBwH6tIyyUm6mT7rOqiZoqJf8fNWge8tB+Oj8m/9t3htRBz9A/kjf/bnILEXHmP
         BVZINo58mcdzmjVwRiZZTxr+RzearvBc23FiXmoGbK6YpjhSPGa94YnVlRcJO1FvzsH0
         1XOw==
X-Forwarded-Encrypted: i=1; AJvYcCUX9TKdex/deOQvMbh6XeBp7amj5BqRlN5rCGUijA0HWdJ6Q3Esy3td9M0fbDa1Ew9jllYDPmLKraRJVf9L@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/88xgKh9nifGvgiUKneexHIZ4JcsNgNn7/knMTBwee30M+Lb
	/oR8S0trXM5+3FmAcalOPSa3+aoBvb9jfmFtOTdeWf5JAcxGWjLP5XxdLEFjKSp05f2C8nY/V6V
	lUof0WtAyILqUYhHxHJxJo5qIu698+A1SuvkCW1XRfs++iha3BNgcjjLBGznj0n7B+Y3+
X-Gm-Gg: ASbGncvliJgCKBbn/Kbn+QDzGkCIl5XgIu2RJBKhe5SZdEBxf8zrs/5W+CdzTRsKPbw
	nwRVaALaspRmE/FlP7z/n8FgTUFClbm4RGpmwQ+yKBF9wBMFAWY/nGwnSU5UeoD6GsEg0iv+Vdj
	wzeYqPt1F4m4b8vw5O/Nne7RUfOW/18WNqXbT2jlQAnUaPpN9bjNMD4SR70M0yfIKAtOm4r5cBd
	CDf92dHnW3E7IA/QOCkiNgjgevhio9r3H/WIqqlsQfzk3DzoTF5PHt7nOdmzgA3/K287sHnE7YJ
	XUhgCLLgEJ9vcjvTfMBDAX5/R1How6LrJG55VnmNPMga7vA0jhH9cnNmD/OOckVFpfyu8cTYtJz
	phJWyss1kQDskgK9LE5peHVwRBGnalrvU1IgbZfIoXFPIapZFXendrFnWwB6WDKYCTt8qhbj4X5
	si3eDo6beDx390
X-Received: by 2002:a05:622a:206:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-4ed94963e22mr44318251cf.29.1762524880473;
        Fri, 07 Nov 2025 06:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBnY5MD4wdoLvWeRk7iLw84FFclEfzHbsf58yd7Jn6ByFyHQib5KMoXl14FvsPrPr2Dh2gbA==
X-Received: by 2002:a05:622a:206:b0:4ed:66bd:95ea with SMTP id d75a77b69052e-4ed94963e22mr44317521cf.29.1762524879844;
        Fri, 07 Nov 2025 06:14:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013cf3sm1484499e87.12.2025.11.07.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:14:39 -0800 (PST)
Date: Fri, 7 Nov 2025 16:14:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>, stable@vger.kernel.org,
        oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] Bluetooth: btusb: add new custom firmwares
Message-ID: <66bjkpos6ul2gnh4ezmtidjguv3qx6bedhlihbg4vtdkmnvsrb@jmojegj6ijf3>
References: <20251107125405.1632663-2-quic_shuaz@quicinc.com>
 <aQ3sbHDGL4DQAE8J@4b976af397a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ3sbHDGL4DQAE8J@4b976af397a4>
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690dfed1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zWZEkmIZHcL_vKng5HoA:9 a=CjuIK1q_8ugA:10
 a=1R1Xb7_w0-cA:10 a=OREKyDgYLcYA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExNyBTYWx0ZWRfX7ZIjC3sbH+c8
 oJMcZGKB2TWCApvGwOljmDCX0VXJukAd23AknxqZdUqy9CQ1MPA8+Js/nO1D3QFVurFvgdcZIj5
 bUT33Q9yCQsh7Eyx0gGt7gtnXG6gDAv+W4u5+OGm7w2qNxSwym51NBZn0WLNekCnzibgjMMBdKy
 81cKU+nN10zqoJ4YJUhblIGcJp8GZrDRjYcnXNUNVPAsQ3qj7Q7SyBPs+JIYNV7vuD09HIAwCVt
 M5Da961cysRLzCQ9/Kkcu4CLsgT0d3WdXgiZvqCNB9NpUakBMt87vXdJtXiDYKovuNy8AjsyC8z
 4Cmkosn2+mLQ/IuHC4+mkm5pT7ehUTlBErUk96s9DaNkThVdJjOcVZLwytXse8UXro6kX1kjM26
 2mDn0+qXYa12KemFctx0pDFh8+3yzw==
X-Proofpoint-ORIG-GUID: 4PEe2wlWIX7vqmOTjguwTBqdPqmpX6jI
X-Proofpoint-GUID: 4PEe2wlWIX7vqmOTjguwTBqdPqmpX6jI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070117

On Fri, Nov 07, 2025 at 08:56:12PM +0800, kernel test robot wrote:
> Hi,
> 
> Thanks for your patch.
> 
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
> 
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> Subject: [PATCH v2 1/1] Bluetooth: btusb: add new custom firmwares
> Link: https://lore.kernel.org/stable/20251107125405.1632663-2-quic_shuaz%40quicinc.com

Shuai, why are you sending a patch which is not a fix for inclusion into
the stable tree? Why do you cc:stable in your headers? Do you understand
what stable kernels are for?

-- 
With best wishes
Dmitry
