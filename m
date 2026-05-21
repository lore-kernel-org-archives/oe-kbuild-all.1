Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47461EB9F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382751; cv=none; b=gQaAxXbtnHUW++q9hffLmLOO6eWrHn6blH2iRQV++3SlRaJjzZ8ik0RwDg5Hm9oLm10zEHShRAysawzzcOQCozj9jBU4zFUE35UOFbVPEiQc/HOQ8F88b1KhKZryeMCVne5ZpXltGJn5j308KT1Wgst+AUP3YEpLx+5JNXHvKb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382751; c=relaxed/simple;
	bh=r5as1pTWd+aduqQQfK4iANhX0H5ndTJhEMGBbiDRlOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4DIXVCG7w73Do8KosYlSjKShZpJ9g5jF/4OdhzPFimLN7wD45dJej88rdmlobaLPn9bNKX/Z4BsQuVg3nIIIemIFMGIJH6CMLQqZZUW17o+Rcn8Zd3HnT/wq1tIEPx0hJAwAopo3Z6TJbKzaMFIuE/KLh5ackwRED1HfGXjMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=oCHJB0/3; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="oCHJB0/3"
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9Ie703053199
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 09:59:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=CWXhqC6USMmHwbvXG4lRqC1MokHi8SLoSyLmZ/JVuu4=; b=oCHJB0/3RSag
	aDrrBU1FfDBNXZ0XXGsJmI+2GX6mQFdAd/ctraoEH7HFsLCBq0Eh9xEgEfMXuD2W
	whDZT0eeV88rgrkI9hvZ52D4er/h2hczzSj3Au9RXwxbq3ab0T0NzwQQjqfap40l
	zJcdvW6rseQw7cK60dt25hvJEI3595bsQM7lGb8HlRsHOlTXt82e028nXvDDRQDJ
	OAHm9Qi6q8vlWUvZftyGgZVIuw4YeElUTEXtcvNx1+KHtifewP284hiOr9Fas2dn
	8TNELe9LMcuIIqnAKaJcornOdKY5jxKOV2Fq+a8xesnJ60OfNJjAJHmqdNWUzr4r
	XYCXHy3EJw==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e8veq6r4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 09:59:08 -0700 (PDT)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48fe40b61a3so41889955e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 09:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779382747; x=1779987547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWXhqC6USMmHwbvXG4lRqC1MokHi8SLoSyLmZ/JVuu4=;
        b=qPH93cH4mXatzA1W0/cuYE+XYAknEr+Zqxzm3hAxdTxti66LNRnqbOPoCIS1HkfWCE
         haGjeSRRs+e0KekTyYMK5Cpy4ZONfZjaoM2Woz56YxvniOCqcmdKgvAWPkgvXCuh6nlW
         J0UcVKflNA/FDGhdXVSoWTTBy/ngN3K2EM94rgE0sQc1L+IdQ4wFTwH4xksisvAc3BsD
         XeXg97bX6uO62DrATTX8+aUAcJnrCD8NGV2wnXXoRTiMViGltv92+g7OdlotgmBudYcH
         DOKZX9YHfDDDpnhcbH7Jxv71wsmdR/8o/AJsquD4/DXAslSwCpsTBppjoZprDpL14Iwp
         8PZw==
X-Gm-Message-State: AOJu0YwrCixI2ck45pKeylMwPMRX7gW/NzekG+mL61OTmz7WV+e+e10T
	X5VarMOaGPfIULKQ4DmeNd5iCeIkxuaXAfHJW9TrrmMf7jx+FR4BA0epd5H4LFEnoiR+YMbzjUk
	P+CUImAbjUW67d/Uz/D3qM6MK9nPY4LFEPolSZRAhMqRUSwjxKxKd7AzLrMzbUkRe7g==
X-Gm-Gg: Acq92OFN5lzOlnr2SrFNd6miPpEqorY6YVpK/HTT04x4+N1d7Cli0mb4y3giuYD9DMn
	gxuT4yEz/fWLHulJ63Q+PEzVfT1oun17oXwtxVI7Xz06zWPEUDjzry3SjXJs+qrNfp+ig/p4Gxh
	joSc2lB9K99tE/k/VKk07FBaPbfDBQK83sBfhAXZAUiieSfBZ8+U61fNPzCzw8svXc2lqseYKO0
	iyKEJ2JNsf9CNtb7r30wJeXRgzwLeFhTuNe5TcmuDZB4lYb8CUDoZq9/Zlr/EH2nwSJV1gxP2Se
	QhS0MIDTGxdih0D3pBzpo0cugAT+5bQCBs1ksokcm7r2vcKO/hwCtQsxJCyPz3DZHR+5QK0MAF/
	gAdFrtf0qTWAPKkrhvH+dtV2CVge7gnxswdq5Zq3xQ3VArez4a/eoIpK02aGmKymgxuSVkd/rBB
	NF0Ue+ZGWfYcJc1vrXuqw4WL1Fi6u9Z7432lB71uE+gKi9vHW5J1kPedDjo2+YGGbvp4eFeRjek
	kO8ODqTU6vmrCCA8JU16KTVD4r9UfzUCg==
X-Received: by 2002:a05:600c:4448:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-4903f7a17cdmr15904585e9.16.1779382747118;
        Thu, 21 May 2026 09:59:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4448:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-4903f7a17cdmr15904285e9.16.1779382746639;
        Thu, 21 May 2026 09:59:06 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490417a3efasm389285e9.8.2026.05.21.09.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 09:59:04 -0700 (PDT)
Message-ID: <ef311ad6-3563-4251-85d0-0f8f03aa55a9@meta.com>
Date: Thu, 21 May 2026 17:59:03 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [awilliam-vfio:next 11/13] include/linux/vfio_pci_core.h:247:31:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <202605211601.U1OvmuqY-lkp@intel.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <202605211601.U1OvmuqY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYQnWwXL c=1 sm=1 tr=0 ts=6a0f39dc cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=NEAV23lmAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=2wJ86P-fu1irUxtt42EA:9 a=QEXdDO2ut3YA:10
 a=Ng9YvVcppn9CIdWre3nD:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: I5vUbdD64LPMMPAWjdPb7AOVzhRQaO4q
X-Proofpoint-ORIG-GUID: I5vUbdD64LPMMPAWjdPb7AOVzhRQaO4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE3MSBTYWx0ZWRfX9EkuUFGW+fx8
 2TzTDDsyyW6dzRwa8qHEToeiBoB3If+HPa8ryjiHuhIUy+DKFkMWhccyco5uizlzTYzbSHeu9gt
 h6ClTAnZdOrawhCqA8pGf2fepEYjKdV539WJ4nv/QS4qSCoyeGQfCZVtpWLujh6HB282vwnK5U4
 5SU+5OA4IgZFVCmjaKsBVrF5SjgUQjsIz2Qx/l5U+CUTehEaq0P4YMD+vQpY6cs/NYCdaYH8s5B
 mYLqejHJLwg4pxQ7GjmIsgb/ncWizA9vBpR3WhfbVTErLd8ZyDbEzKBNqPE1CSBF/8hjmRQ175a
 MZ4dSvJq9MD351vsk1cFVrfjWzhmnQ/qiLDqvaxAF39OrTqfpwPh1Ra3nAm9NH6KXKVW2qmFQFn
 RS8PFx7xpgsS4v+93ZR4KLmNhX+fezkL4PwY3LfF9C/STRfnqCoxB2g5V8Ld6OozZ2q999Kki85
 zCZ4YXe+oWNc6E3cpkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01

Hi Alex,

On 21/05/2026 09:07, kernel test robot wrote:
> 
> tree:   https://github.com/awilliam/linux-vfio.git  next
> head:   b9285405c5f6144f4444f97bf3048d865e11cc1d
> commit: 859dc0f6253b0d65fd4d79e29aa29b3d939c51a9 [11/13] vfio/pci: Replace vfio_pci_core_setup_barmap() with vfio_pci_core_get_iomap()
> config: alpha-randconfig-r132-20260521 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260521/202605211601.U1OvmuqY-lkp@intel.com/config__;!!Bt8RZUm9aw!-MeA4YCZqVD1LgfRaoW0lgRz_bEdlvVRk8RWaDsMsFVUXAfMxQ3YFOteZOcWJ88tWRlbPA$ )
> compiler: alpha-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260521/202605211601.U1OvmuqY-lkp@intel.com/reproduce__;!!Bt8RZUm9aw!-MeA4YCZqVD1LgfRaoW0lgRz_bEdlvVRk8RWaDsMsFVUXAfMxQ3YFOteZOcWJ8-nGduJOw$ )
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605211601.U1OvmuqY-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>     drivers/vfio/pci/vfio_pci_core.c:274:33: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:274:41: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:278:25: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:278:43: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:278:56: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:278:65: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:283:25: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:283:44: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:283:57: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:283:66: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:291:39: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:291:58: sparse: sparse: restricted pci_power_t degrades to integer
>     drivers/vfio/pci/vfio_pci_core.c:1736:9: sparse: sparse: cast from restricted vm_fault_t
>     drivers/vfio/pci/vfio_pci_core.c: note: in included file (through drivers/vfio/pci/vfio_pci_priv.h):
>>> include/linux/vfio_pci_core.h:247:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>     include/linux/vfio_pci_core.h:247:31: sparse:     expected void [noderef] __iomem *
>     include/linux/vfio_pci_core.h:247:31: sparse:     got void *
>     include/linux/vfio_pci_core.h:250:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>     include/linux/vfio_pci_core.h:250:31: sparse:     expected void [noderef] __iomem *
>     include/linux/vfio_pci_core.h:250:31: sparse:     got void *
> 
> vim +247 include/linux/vfio_pci_core.h
> 
>     235	
>     236	/*
>     237	 * Returns a BAR's iomap base or an ERR_PTR() if, for example, the
>     238	 * BAR isn't valid, its resource wasn't acquired, or its iomap
>     239	 * failed.  This shall only be used after vfio_pci_core_enable()
>     240	 * has set up the BAR maps and before vfio_pci_core_disable()
>     241	 * tears them down.
>     242	 */
>     243	static inline void __iomem __must_check *
>     244	vfio_pci_core_get_iomap(struct vfio_pci_core_device *vdev, unsigned int bar)
>     245	{
>     246		if (WARN_ON_ONCE(bar >= PCI_STD_NUM_BARS))
>   > 247			return ERR_PTR(-EINVAL);
>     248	
>     249		if (WARN_ON_ONCE(!vdev->barmap[bar]))
>     250			return ERR_PTR(-ENODEV);

:(  Yep, these need to be IOMEM_ERR_PTR() also.  What's easiest for you 
given this is in your `next`?  Should I repost a new version of the 
whole series (even though the 1/3, 2/3 went in via the 7.1 RC?), or a 
one-off repost of this patch, or..?  Sorry for the silly Q, IDK what's 
best practice here.


Thanks,


Matt

>     251	
>     252		return vdev->barmap[bar];
>     253	}
>     254	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

