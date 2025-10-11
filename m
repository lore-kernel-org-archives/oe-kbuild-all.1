Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A5B800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760206556; cv=none; b=UPX8yNiiviAB5UGcp1aeaUGQoN9OSbJyKsYnIVJ+TcBpZfCwnm77Ga0wt8keZDDM4HJkHkFRpykH4jKGlcIO2bNDzlEg3MnrkdlJGKS9eOJgsZWps6dnRmy3Q6wXokTfFjJvBo+IjM7ofzUxd7njnXUM1VZIFyEVfDpbF+I6yDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760206556; c=relaxed/simple;
	bh=TX7cRtWMuDg6zUqF5l/AgCTzPSwbXr51IrjeoCjsPIA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCFUzQVgAamMMY4+VQ21katt3vtKdp3q/486FEx0FkxAjZLqIEAPOJAz9OwP7bEepxW4O3NPiF/yqROFiyx+qcCVmSkSwc5ETjb67kWGVSF6POV3y0JDqyHA/A0Ck8Kzvm6iiYbjjt896jAUv1ZIA3RaNZ9/jSN3I1TaXIO5foA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=LWCJ4YL8; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="LWCJ4YL8"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59B97qB21458941
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 11:15:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=L1C29Ctmx9qCKv+di4pj
	qiXnnC/V+sqZE21wYALDeSA=; b=LWCJ4YL8/bC2F3pgYQud75r9F31NoIeUVhrR
	flm9CRmfaMeL9D14HlRxqtEVZOAcGj9cb6Vck84A0ugIzlhuJYkhDgIxKyjLmL6K
	OyEmc17w7tBsLp+WuxzRJqU0TSiWV+ZGUKYSQpFOFBh3kHTKNIRXvHvXUzWIXOIJ
	rGyz8Uba9o2CvP8mfmScTGpJvYf9Ef9BGxX4O9Sd9uO/Z1RLsvGEVVAImcwNhTGY
	6ud4fj+K61bix2Q2Ihl68CRGG2lwQIHG073rB8ve0HB3mG7LaXiPm+3eN9/681k1
	9BAfWncitJNUdv/bls8Y4c3Z4c44XY66Qe35Aw12h1Vx3V8FxA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49qmb8ssp8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 11:15:53 -0700 (PDT)
Received: from twshared23637.05.prn5.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Sat, 11 Oct 2025 18:15:52 +0000
Received: by devgpu015.cco6.facebook.com (Postfix, from userid 199522)
	id 818C7F5FBD1; Sat, 11 Oct 2025 11:15:48 -0700 (PDT)
Date: Sat, 11 Oct 2025 11:15:48 -0700
From: Alex Mastro <amastro@fb.com>
To: kernel test robot <lkp@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>,
        <oe-kbuild-all@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
        Alejandro
 Jimenez <alejandro.j.jimenez@oracle.com>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] vfio/type1: handle DMA map/unmap up to the
 addressable limit
Message-ID: <aOqe1JMVG5bg/iwU@devgpu015.cco6.facebook.com>
References: <20251010-fix-unmap-v3-3-306c724d6998@fb.com>
 <202510111953.naYvy8XB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202510111953.naYvy8XB-lkp@intel.com>
X-FB-Internal: Safe
X-Proofpoint-GUID: 02J21UJB9egXNAg80HSCQDpR0TlqAIHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDEwMyBTYWx0ZWRfX9UHbKIaa0Cth
 1/af+bQ2YFpUvm+ub5tmZ049Hu0+T5s4fY4y3LK4leMcYixZMBgQcdLsZf6Yv8uk4I9mUiLdtHI
 QcsMOIm+UjmBEnxzyGpJxsQOkVJmGXTJoeY95iGXybQLgRCqgTJlEdkLceN4KDziut25nHLwBOS
 pxRKYMyBnbhCNcDRi8A7rxrcPBdkscbTynmgTQvIaT/oCEBUf+LhFavbL0TJvgdP8dnlmINRJm8
 FAC043qijzlWlff2IWINpoHnW69y3h+MDMyNMmITKmqlBfrdaYipgSU3OGEOWxO7+x/asF4zCUf
 31C7TKrbolPJHkzaVh7bDyvJ1bKes12SDlAlQfZ93+lvYo5XUUJWeTJ8fF97qso8OoJClL+g3tb
 PFCsW78WwaKYfriLnTqx2+trgnXWEQ==
X-Authority-Analysis: v=2.4 cv=M/NA6iws c=1 sm=1 tr=0 ts=68ea9ed9 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=yATVoKGFPd4u651EB8cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 02J21UJB9egXNAg80HSCQDpR0TlqAIHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01

On Sat, Oct 11, 2025 at 07:57:07PM +0800, kernel test robot wrote:
> >> include/linux/limits.h:25:25: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>       25 | #define U64_MAX         ((u64)~0ULL)
>          |                         ^
>    drivers/vfio/vfio_iommu_type1.c:1361:28: note: in expansion of macro 'U64_MAX'
>     1361 |                 iova_end = U64_MAX;
>          |                            ^~~~~~~

I see. I suppose it should be ~(dma_addr_t)0 . I don't see a DMA_ADDR_MAX.
