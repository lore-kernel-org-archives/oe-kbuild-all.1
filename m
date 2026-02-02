Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D565190462
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769998074; cv=none; b=Emwfeg9GQ1YgO4xpFCZgtka06URUwNH7+O56TdWUiyll5KQsQgCf+80g+lErWUNl5VdAFVip+Yym9/NV1VVP3TBjjmGvmy0duPS05eDBszWkubyWo2YyUNgFp1M+eRR8JBg+YmEv8qL89iFFlvBoO1Cq0TIU6JCGxH/JTDzSVxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769998074; c=relaxed/simple;
	bh=ROt5gD7XPQjhnIVF5XiuISWsGMVC+6w3Nv1xKT7Yz5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g17yu799eLiRTgSnYOh3CW1T+jK7Gt7j+25LpyQ74D5SBsQliXOThkKJQ7R3h0TkIwmVYBORXPhbjGorpitbN1IXTQTMErGz9HQhCaK9dWUfImMEPT/uuNt1LLieb1Xqcpfc+X9vNz1hCA3snMvNSczPaQeGg1O6O875wPkbJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIqSV/Ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0HEJ7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIqSV/Ya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0HEJ7r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NlnHe1814689
	for <oe-kbuild-all@lists.linux.dev>; Mon, 2 Feb 2026 02:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BxpL/CEFN6q71yIP6BqMQzTd
	ZY/IThsM+HhCgC/mv4I=; b=bIqSV/YalNkdPOlpP/muVM367H5bSW+xY0C9Z2/7
	kiekDgY4iLkOMExRoy7CltSTpgV2mT5iyhiCdhGwf9W0za8iUFs4UcRLoxYitBhj
	m8raXV1B872f5MOO+9OZFY/3Df98e+q3hrFk2QXD+iuj2xvBc+CIb64COU7pyih9
	nOW/5YbUdrcriZQckwnrgQ18uoT0Qaz6Ix6elOZPZy8R98iO9lXv0H5ZJTf+zB1j
	hI25lhmQpmIhbu05iynSQY5YieY0k3/xVh7kxbHmzAY71vdzTXugGTGpp9yARgKk
	q/u4TX8Ahwmm+y+yMO2RLR2HiLAchHYKLwn102TACyV18Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1h8q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Feb 2026 02:07:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89467edcd21so234981356d6.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Feb 2026 18:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769998071; x=1770602871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxpL/CEFN6q71yIP6BqMQzTdZY/IThsM+HhCgC/mv4I=;
        b=NO0HEJ7rxdFLKqyd4+XSbmspjGu41ZcurnJ5REXyCEqY1spYNWKnz2fNWAC4z9Djom
         iPtO7zSNkgOzi0h6QUr2wAGErCFVFRV/Ql443zOkcWKUrOD/MbLCHEOgtUmcz0dCR+J5
         B971fFp+QqbUJnMNvawE0T7ptDVlMIgFz7/T4kihLs1sZoOrd4Q94FcUf7bKMmAsvIbi
         PEEINoXlg0jxJEXyi6kzGHIuGiDmXp4yBds/H5viYlWURYuU02thfhfr7Wwl87wgYPuA
         sivIKzNFrns0Ht6tgjU07kKs2fJIVOV8AfYRZVS+iqMXkGq3RzzTZwGAgovu13ysE7kX
         LbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769998071; x=1770602871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxpL/CEFN6q71yIP6BqMQzTdZY/IThsM+HhCgC/mv4I=;
        b=vTgyv4h5czZ3WLfI+UonOX1sGsaUgHdPi3hzJP3pdAPTRSC38toRLj/3uSyuc7X4tU
         7iiqw2SntLwTaJIQQS/m/QVXRie99dtp0EOlmQKxUjTpEV4O+3lm52GpPW6NrVQtbyG+
         +tAyGRXXXrCWuAvYv+uL4odWU4pukMzb4Eus0rfpDe+niXR2JuNWx/+gNeXE8AaONzhW
         6upbgNejEVJ0b7Bh8ioEBf+i5LhpIpJ+ocGs6O3rZ6Jzhjlvz0/yML+J3UoEdWBcq8hU
         dfr7zw/3RLrncg5Mzsy9KJFQLyv351QJkHIwXpqRkpVp+IgTMKsqfoLqoyhdG/O/gj11
         KX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp3Jw0thzcVwV5yQpWlJ9VbYXysoj7bggrVWq8M1nlHYaAkM6v2b0tlC+ONCHYpD25LcTFSSrh7ux2YNyZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzC1iN5XX0sxXpuR5NjlY2PcXyO+x82ClBZZQb4W11gjJ6kf/tt
	sP6erYpM5j+Uu0Cpave5AbxTB3orDZa9EhugsjcZfXWyZMKZBp/MHLHnfQk2o6QWZ1L9Qg41skz
	c7DDONTFc0eKcqhw8HB7VQZmBY3sadWxKCAS3EYWN9Q5Bkg0Dc4t6OceuW30k6ulFzVqK
X-Gm-Gg: AZuq6aIH9SCVaRkjv2JD8eGrgrwOOeCr34psPwuaa2yp8X1iaFiIEySSND8m4ur9C62
	hjHsC8lTmjys9eM/VEBB8AYQsnICmoeyPneEmR9yBpA3j3UknDwTAmQRZ72A7QBDrJ9LL93YhU0
	D1kNriCIYjWWANFSd40yWx1OrLqWWWUCe7OC0drtnNw8VqkgdEnPtC/Xy2IJFfJgUNMrGuIH7Sw
	qM88T+fLFw6Kl3icgWHBg79eAS0QvAg3uvuvcJZWdDKM73TRYvuVT7HL4S5CT8uDI+W2GhAamAh
	fSE+jOBKm4FX8c6KVLC5QYTUll2DvgD8aI9w05b5Gb4+LwGSd4Q3Bjj3v8s1GiDwDSzRzHwO9Bv
	kfyUsE+DGFd9LHDwQVnztlVziBqU0UbdVnvKlRjBrYtqKQCuxhOaeBTgL7QW1bixoPnqtY/I=
X-Received: by 2002:ad4:5dc8:0:b0:880:4054:7edd with SMTP id 6a1803df08f44-894e9fe6b46mr152935696d6.20.1769998071566;
        Sun, 01 Feb 2026 18:07:51 -0800 (PST)
X-Received: by 2002:ad4:5dc8:0:b0:880:4054:7edd with SMTP id 6a1803df08f44-894e9fe6b46mr152935476d6.20.1769998071139;
        Sun, 01 Feb 2026 18:07:51 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1148516085a.31.2026.02.01.18.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 18:07:50 -0800 (PST)
Date: Mon, 2 Feb 2026 10:07:45 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Dmitry Baryshkov <lumag@kernel.org>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [linux-next:master 7732/9539]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161
 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check
 'ctx' (see line 159)
Message-ID: <aYAG8R8nkSNqdR6b@yuanjiey.ap.qualcomm.com>
References: <202601252214.oEaY3UZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601252214.oEaY3UZM-lkp@intel.com>
X-Proofpoint-GUID: YJR3B81fXuFckk9PACFFUVHRs6LM5QvG
X-Proofpoint-ORIG-GUID: YJR3B81fXuFckk9PACFFUVHRs6LM5QvG
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=698006f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=wTWSiibFJaJYqoySWbQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAxNSBTYWx0ZWRfX74Etx58Jp7jB
 KfHwnvXEsGsYq87ivHcboC40PCTRpNhWEWveNT2XBOeXfwiDu87zH1rF5ZmYSU8UR+7AArC96Vj
 THY3OyM1kHTXO8daoyT3ITk22aG08J7fefmEBBVWQe/Jw5XORuVS+wEbkq14haP+v71/pyhaBh5
 00VGb+n3/LDcmQCsCwL1j2DHezz+OI6iGswxsq0B4yzHAfh69nssqrDXtlgXzktHB9TH/xnsMpD
 iSRwjsaDOtgige7DhKquzsSXFqkl8GvF+V8TBs+oXCJQyjBPpUHzADdr1Wu0pIPi+Dcl/AZNMZC
 ak61f2rpxKlOm4LpZzlF/LUmuvU7hong4zDgtD4dTGY3PeYNmKeleLfNBNI7BCg168KufSXg4qc
 UQMGlC4DOY9IFdGezt/jfVRksZchJhKN0tjeU3Ql1zs1bRaNOizNKpqZQJmotMoL9QwOPilVh+7
 EepxFSe1PzxwXwa7gQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_08,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020015

On Wed, Jan 28, 2026 at 01:04:39PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> commit: 688c7734002a1ee6f50a28ba9bd7aa380edbe12d [7732/9539] drm/msm/dpu: Add Kaanapali SSPP sub-block support
> config: mips-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252214.oEaY3UZM-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 15.2.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check 'ctx' (see line 159)
> 
> vim +/ctx +161 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 
> 688c7734002a1e Yuanjie Yang 2026-01-15  152  static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
> 688c7734002a1e Yuanjie Yang 2026-01-15  153  					    struct dpu_hw_pixel_ext *pe_ext)
> 688c7734002a1e Yuanjie Yang 2026-01-15  154  {
> 688c7734002a1e Yuanjie Yang 2026-01-15  155  	struct dpu_hw_blk_reg_map *c;
> 688c7734002a1e Yuanjie Yang 2026-01-15  156  	u8 color;
> 688c7734002a1e Yuanjie Yang 2026-01-15  157  	u32 lr_pe[4], tb_pe[4];
> 688c7734002a1e Yuanjie Yang 2026-01-15  158  	const u32 bytemask = 0xff;
> 688c7734002a1e Yuanjie Yang 2026-01-15 @159  	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
>                                                              ^^^^^
> Dereference
> 
> 688c7734002a1e Yuanjie Yang 2026-01-15  160  
> 688c7734002a1e Yuanjie Yang 2026-01-15 @161  	if (!ctx || !pe_ext)
>                                                      ^^^
> NULL check is too late.

Ok, will fix it in a new patch.

Thanks,
Yuanjie

> 688c7734002a1e Yuanjie Yang 2026-01-15  162  		return;
> 688c7734002a1e Yuanjie Yang 2026-01-15  163  
> 688c7734002a1e Yuanjie Yang 2026-01-15  164  	c = &ctx->hw;
> 688c7734002a1e Yuanjie Yang 2026-01-15  165  	/* program SW pixel extension override for all pipes*/
> 688c7734002a1e Yuanjie Yang 2026-01-15  166  	for (color = 0; color < DPU_MAX_PLANES; color++) {
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
