Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EC30E828
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780755; cv=none; b=CvVPop1L3g9iO4lPueEqxvKOwdMBN43U5mSTo8j7TztQyxjShEKogowWtH4A+Mi9JeGOT2fBbZkLQGWVMXTY1XEzQz1eTlPiNhk5qcakWErKOFJRkRidvVqHpjURdtN01+U2r+mJRBjvpFeoKupBe83Zr+QKtgiCltUcf1HJqZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780755; c=relaxed/simple;
	bh=a2g8T9YPVYARhdNelG7/izwn39OqgM1/XZdJ3lfqSR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euB9U4jzhOFFqJ3z8wdBFOObwZ1fhPNNXrk4Y8HDr2OgVjClir6QuHivsJ4oJEndaxaVD2XkNT8HBFwbKmAmaHOWJCYwoNUJcpxtbsEtl9llHlzdZYrBKIhfSNQId2G5uLO5E2HPR+XmuC3dVG57K5ImIrOmRd+KyTEFwNM1wV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=DetUVmfm; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="DetUVmfm"
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64EFZ0gI2223379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 10:45:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=QDzNi8ttoDhR7lPW7dh1etIO5/FdfLvWANoerePC104=; b=DetUVmfmoE8N
	WGLQmc2B59nkMnM1wHrtXE/QhfTjkTn9obMFosrpOARi2s0NA2+LFecCkkdiH8Na
	SexDGT0Y+Mb0jB069D5lXjSdvamW86/nJtLfwse1sHzuBYeDzgi9//vjwmCDfMLR
	lF1FU3ErBc6gFWYBnilaXnFP8yMQh9Q0HDSfzOKrTe6+GyIkS4vx50EpiEqh19Ya
	znEjUZnqIv6EyyLzwIaDGm3neRN/6b9LzPuFJ1JTQ3JT4lXgl7E1wgr+PE21A57b
	CHead5CQinl81jmXsxRumGZmPD+egpSVLRQPjV7PEvKoTLshNtA2UXvXudCMWply
	A9Ret/cU6Q==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by m0001303.ppops.net (PPS) with ESMTPS id 4e3t79vg7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 10:45:52 -0700 (PDT)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fd64c32e8so10007075e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 10:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780752; x=1779385552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDzNi8ttoDhR7lPW7dh1etIO5/FdfLvWANoerePC104=;
        b=QHWlO3H3YN6pehDbc8+E4T8dv4Ti9vTVs4Wq/jNjp0DkLCnbeJxLqt+26Hv+PYTdGP
         +ewLwvvRhcx+AlnUMIQA7OZtjA+17FuFZDVflVE/kuPpyufu0yMPtv5HxZCSNcbBwhQ7
         4LRW2fE4QYgekvU3s2ewgWyzSAWCJ6kssIXmAsyiSPRKbfFBnC6Kl/XABfCZEomM6Jsn
         YHPy8zIeKVsFta2SzGvN0c+YIL+rA+BmPNj5O9K2MKE9lmRw+ZCIhIddD+tREodOB+3F
         2IePr4gOAJU16NolSxbGLA81mLbCJc4ZhHLOTtHH7/ASysNJR7Eih6q75WdecuCgXCMM
         ks/g==
X-Forwarded-Encrypted: i=1; AFNElJ8srATE0fcum/ljylBSA+fli0y7vA2NOcQ1V/WQtjJs15atPSi+lV6Yc/UL39iOwHbZJ2YJN6uTx0wVHV24@lists.linux.dev
X-Gm-Message-State: AOJu0YzX1MDWskGq3xO3HG1lz+KwhFRYEG2B1zp0zKNXkk0oukbrwY3B
	di1YpyljXa720lls6D1Mvggm07Z7EVPwok/nxslqs20AbS1RQz5O9XpJjyZpdaXZRrgmx7TO5lc
	IKXDvKOkbbGDoVjaPgl9uiNlHOOMuhPNmRIIZGCvQO04cSko51Da1TuZWAEYJ/aOGgw==
X-Gm-Gg: Acq92OHZERmvVU43nr3gBkGBpX+sRR51RvN1LIZCq0ge6YqSqWYUsZIuSnQckXnl6u1
	JlOvM0OR8yf+RWO+e+zyFZz3HYgWbqvz36HQudhjbQ5Ag2ecUZcc1SE1HRkN7PFwI4VUD4uWatl
	3T0Mk0SIxh8GumdxoIgYh097DuE2vO8hnpA5/eia5rj+3OEX8Qr58/7cVjKiR/2558pGu+leU34
	zxHxNeTYbvuogpL4ywDJJrIcFX+7NBIa8ZuDINhiSy4n9ccdUwVXiBMxk0QxjARRPq734GuAvwm
	fvDCKoelT7IIikDAkAuMJm7Z7dUVDDinitpfDbOxanXctlY3J9OSHI4afPUz9UWxFGJgBAfCVxN
	HWAvcxkyUL8fzMrCmoQVTi9Z5cnEo8rqTCeDGv9Km43Wh155EScW+BvKACW9njEOg4aVnz8UCba
	Ui+O9SV8MHvs0YhraTad0P5h3O7vbFwJPUnjs0eJXWfhLVumRGYHWNwbNtYfldHLV4SSDDAdQeV
	quYipmGBGVTGzLhPzofOGU=
X-Received: by 2002:a05:600c:8b18:b0:48f:de5a:4a6 with SMTP id 5b1f17b1804b1-48fe6515806mr5476145e9.26.1778780751681;
        Thu, 14 May 2026 10:45:51 -0700 (PDT)
X-Received: by 2002:a05:600c:8b18:b0:48f:de5a:4a6 with SMTP id 5b1f17b1804b1-48fe6515806mr5475725e9.26.1778780751254;
        Thu, 14 May 2026 10:45:51 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd769141fsm22775085e9.32.2026.05.14.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 10:45:50 -0700 (PDT)
Message-ID: <923eed09-6637-425d-a8fc-123c9e010c33@meta.com>
Date: Thu, 14 May 2026 18:45:49 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [awilliam-vfio:for-linus 3/4]
 drivers/vfio/pci/vfio_pci_core.c:499:35: sparse: sparse: incorrect type in
 assignment (different address spaces)
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        kvm@vger.kernel.org
References: <202605150023.lXFibOM0-lkp@intel.com>
 <20260514111731.5ef8faa4@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260514111731.5ef8faa4@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6mbmkaDIrUarFHhUeOn7Vv3mk7atUZbz
X-Proofpoint-ORIG-GUID: 6mbmkaDIrUarFHhUeOn7Vv3mk7atUZbz
X-Authority-Analysis: v=2.4 cv=VNntWdPX c=1 sm=1 tr=0 ts=6a060a50 cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=NEAV23lmAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=dFtbKyHJh52wRT_GfbIA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE3NyBTYWx0ZWRfX19hZ+0UP+TVn
 uTGYXQmmPuOcVUEM4EHYp0Nn0Y6ylu6xpnaN7GiJVCFpX8K+gljIWgOK5rYrYOGZ40zul1y6cH7
 kMHc6hm1XXCwTNc65m5xlWdept9ZEGdqlI1eoiAi56y9IGeN4FakuBUF+N60lOMikfudoFKmpGv
 bkbN3tAc943faTH+oia34fyt3b+6bp8TU93CZXV9cIxwy/3XPIss/GapmO2uhhUpkIV8tDQm9Bh
 flFyRq9Jvm/cDWm567GUgDdjI1n8oOe2X2/H1Tptk71aoyFkR92dJdXR4fgoKRQcKAHx1UNxU0Z
 vd7MbcBry6DKZKK8+fbzYAaVOYWyoPUkYExM7eAGPjKkJHZLH+q/jO6xzru7TZ2F5zhbXJJOwLw
 DW7kF2ACUmBH4hpIZWPq3InLmlbefH3X+FqmFX0PnUFyIaJzrsi7NMOFkhKYMhKl53w4TndkI/R
 IkDOGOYenEHvhU9mvDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01

Hi Alex,

On 14/05/2026 18:17, Alex Williamson wrote:
> 
> On Fri, 15 May 2026 00:39:50 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://github.com/awilliam/linux-vfio.git  for-linus
>> head:   a8a3ce989a94db08f77968a4e75b34eaa6d40c9a
>> commit: a975fd177726e110f30b561dd0707b78f21ffe66 [3/4] vfio/pci: Set up BAR resources and maps in vfio_pci_core_enable()
>> config: parisc-randconfig-r134-20260514 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260515/202605150023.lXFibOM0-lkp@intel.com/config__;!!Bt8RZUm9aw!4Ml3rrJPR5hgJ8qM0OCxOwEdJwF-k0mYiuEeBClnnKNLCVzue2QGcVDL6uji9tVJzQBE381sJg$ )
>> compiler: hppa-linux-gcc (GCC) 8.5.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build): (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20260515/202605150023.lXFibOM0-lkp@intel.com/reproduce__;!!Bt8RZUm9aw!4Ml3rrJPR5hgJ8qM0OCxOwEdJwF-k0mYiuEeBClnnKNLCVzue2QGcVDL6uji9tVJzQDT2Jsk6w$ )
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605150023.lXFibOM0-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>     drivers/vfio/pci/vfio_pci_core.c:274:33: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:274:41: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:278:25: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:278:43: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:278:56: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:278:65: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:283:25: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:283:44: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:283:57: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:283:66: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:291:39: sparse: sparse: restricted pci_power_t degrades to integer
>>     drivers/vfio/pci/vfio_pci_core.c:291:58: sparse: sparse: restricted pci_power_t degrades to integer
>>>> drivers/vfio/pci/vfio_pci_core.c:499:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>>     drivers/vfio/pci/vfio_pci_core.c:499:35: sparse:     expected void [noderef] __iomem *
>>     drivers/vfio/pci/vfio_pci_core.c:499:35: sparse:     got void *
>>     drivers/vfio/pci/vfio_pci_core.c:506:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>>     drivers/vfio/pci/vfio_pci_core.c:506:43: sparse:     expected void [noderef] __iomem *
>>     drivers/vfio/pci/vfio_pci_core.c:506:43: sparse:     got void *
>>     drivers/vfio/pci/vfio_pci_core.c:514:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
>>     drivers/vfio/pci/vfio_pci_core.c:514:43: sparse:     expected void [noderef] __iomem *
>>     drivers/vfio/pci/vfio_pci_core.c:514:43: sparse:     got void *
>>     drivers/vfio/pci/vfio_pci_core.c:1736:9: sparse: sparse: cast from restricted vm_fault_t
>>
>> vim +499 drivers/vfio/pci/vfio_pci_core.c
>>
>>     484	
>>     485	/*
>>     486	 * Eager-request BAR resources, and iomap them.  Soft failures are
>>     487	 * allowed, and consumers must check the barmap before use in order to
>>     488	 * give compatible user-visible behaviour with the previous on-demand
>>     489	 * allocation method.
>>     490	 */
>>     491	static void vfio_pci_core_map_bars(struct vfio_pci_core_device *vdev)
>>     492	{
>>     493		struct pci_dev *pdev = vdev->pdev;
>>     494		int i;
>>     495	
>>     496		for (i = 0; i < PCI_STD_NUM_BARS; i++) {
>>     497			int bar = i + PCI_STD_RESOURCES;
>>     498	
>>   > 499			vdev->barmap[bar] = ERR_PTR(-ENODEV);
> 
> I think we just need to convert these three ERR_PTR()s to
> IOMEM_ERR_PTR().  Agree?  I can fix it in the branch.  Thanks,

Oops, sorry about that!  Yes agree, that would be great, thank you.

Matt

> 
> Alex
> 
>>     500	
>>     501			if (!pci_resource_len(pdev, i))
>>     502				continue;
>>     503	
>>     504			if (pci_request_selected_regions(pdev, 1 << bar, "vfio")) {
>>     505				pci_dbg(pdev, "Failed to reserve region %d\n", bar);
>>     506				vdev->barmap[bar] = ERR_PTR(-EBUSY);
>>     507				continue;
>>     508			}
>>     509	
>>     510			vdev->barmap[bar] = pci_iomap(pdev, bar, 0);
>>     511			if (!vdev->barmap[bar]) {
>>     512				pci_dbg(pdev, "Failed to iomap region %d\n", bar);
>>     513				pci_release_selected_regions(pdev, 1 << bar);
>>     514				vdev->barmap[bar] = ERR_PTR(-ENOMEM);
>>     515			}
>>     516		}
>>     517	}
>>     518	
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 

