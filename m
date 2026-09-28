Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4CA4BD79B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613506; cv=none; b=EpqBl9NJj4EcYCLuV1DZ44/bAbsiyzEkA82u0UuzvBytvlfZw2uYlWg4XgdF1rB8TI4oswrVd1U/4Srh9GrAW3wVjgvbQBfV50mcwHlVnz6YiE+C+oNSrCD0lrADnDGruBOUY5I4kP8fxfOK5sofdi5zkIAvXihU3Q6l5c/ymYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613506; c=relaxed/simple;
	bh=zNdfiG6a742J2vc5UTLGFrSGexs/heG6WK1qW+A/N1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjPHwJPUpt+kwBnrpWyrQQ3UlrzLQbTadjYU4Bi9nKFPNKgZAKiZsYZN+tSsFYJt8+L1BnEmwW/9IcMS4jECcAGySS5hCcgOL/k/uD2S5Zv+110sQnAXrtTYbpjr95RkEkz4AkGLnpEGP9wZeRifHqFqSDLbOwtM+EA/mhx04yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aip920Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXNquz6t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aip920Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXNquz6t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe2pI1498443
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 16:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=; b=aip920NbjcvZfGYs
	k9BPpsSRvChY2gfG7JYxnVq4IKugVQcQl2+9bCF4gce7K1B718V2NasdpOwsN0de
	63Y38NV0lwzJgTP1jm4Zj3vuJU87gsaRMt7bPAGUyVGriVBdaiyh+yZx/qXN7eB5
	gQ51Nc456k42TyXcuJy4I2tw4x8YAcsrZ1m7y71MWUmBnKjwwVz+2AVgvcwVbwjg
	fe5UwX+CLjvge5a5r9swQdAqWwK2el8iKqkP3HASBdQRnCG7c+Y23WKwfpacDHch
	h3vhF7cCKI+acEgOCZRe7FzM1YQ5lusr4PtQtdA9D5n57/L94RLv7ZJ+dlcBGye0
	YhWg7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtaeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 16:38:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-347536bd6fbso377458eec.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613502; x=1791218302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=;
        b=HXNquz6t1Wq06e5/V1JzbK2xdZGJfBbC3IgFWVxXlUOlW2WZFJZIW/+mxRR7NlktgK
         5NSInu2FGsBxnoQbOoSr1X72CxWJ2VIh1JOHntqB32jJEPFnBjFdbnxLICvDFOTwwQDw
         +OkbyhBy8mOq16O3bSfi9UKh3sCgQTJx0FIe67kzgoYPyCsAgAEJFsi0O5mSBy0gKjou
         UxpF/AT7AdfwLWocWKrUhOHmXQmss+amEPQDHSfRhZYtKi6UOgH4Hfny7Y8lquO656j+
         JF2R3bcxz64mjvbjBEVMGKyuYCrqpbvGvqI2irmsBbXqplZRAhI1RfBtZL+3LqYIezj0
         krXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613502; x=1791218302;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=;
        b=L6pQhrOtpB+lC0lZkaASzsiMFRQ/QQcUMy8vNB2lBDUB5LCviDcnqa1FA/A3/4J7IZ
         A1vWkndP0iqIEOhgYRi9WeHaNmg608e1JHSONuGPbZMS8s5K3b/3Jwx8zSCLPM6D7DLJ
         hT/zk8IaHfPJVwuN+ovwqBpmbaZVJ1Bph+RPZIXbcjx325LLRm/FI5n3NAqLCO643tjJ
         xxJjxuCbKrQhi4/NUDlK89eE8OAeB80Js/KHkWOKpFuNuCZXcb2V4X+DhjXOGjxJXzaU
         S2wrVeVSv/IBBzX76NvMWoYdD45WeZ5e3LCXSVTriXKvhgD35cYRTfuU4LEhuI+0aH5H
         ooBg==
X-Forwarded-Encrypted: i=1; AKwUvBw9v0K4bFu1Rac776H/D3lVdr9JLL8bOblrwQGDwR0hHkYT5Kq+BpXLRuaMDo4IXL0K49t0rvFeV/LUzoAM@lists.linux.dev
X-Gm-Message-State: AFq9FYKU8/E0YVebivCSakg9856nnyA9deM+CWgKszYws+5CAYMafZq/
	rnassuEiGDAf72edrz+dNDa41Dw9CJEf/xedphrYrIHPZOYxydmtArzrm9lJPot5RokfITjhw4Q
	UiasBRf8mAH1VTf5VRXLnEKR37yjE76C/5UxmO6Gc1ttdsAogHdpcNKMO97d2Y1G1I0kZ
X-Gm-Gg: AYBFou2ORIi39mvO3h7GPMDfUBO5XrHvBqGkApyryvvxeZAt5SnocUwBSpHWVI7pgp/
	HKUVby0iCr7re5xppmG+UTp2uSf3SizHGfoGVa2Z5MWEzd/hzp8cP0MgD3ES75cWAp0GOZ2ApJj
	5mJ2FBiu1q23Vfd9APVbMiM4W41fgrhX9aPbCNOkop0cH8koEBJcWgIDbYisR9WwtbHpi4dzDOX
	OJ8fyssln0IrIlGTUPtAFK4E70hsM2yxoEgRhLwRivs5C9XC9AHyY1unuEgHXrWVojaXRRWEUfb
	a+YCL1IBFXWfuzzzuDfqBMWGpsTBVM57k5OBP0pvZZGBofrvjQNQpXKVcQFiF4yLyUZmTJLzLdw
	s+UsNQF2V0/ewhRRJm0K7zBaI3z8NmPncb//i1j5Q3zZe/zGNz2KMQQ==
X-Received: by 2002:a05:7300:dd06:b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-342727564a2mr10015281eec.27.1790613502385;
        Mon, 28 Sep 2026 09:38:22 -0700 (PDT)
X-Received: by 2002:a05:7300:dd06:b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-342727564a2mr10015249eec.27.1790613501733;
        Mon, 28 Sep 2026 09:38:21 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm31019134eec.25.2026.09.28.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:38:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:38:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
        Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev,
        Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,
        Joshua Crofts <joshua.crofts1@gmail.com>
Subject: Re: [jic23-iio:testing 66/82] drivers/iio/magnetometer/ak8975.c:627
 ak8975_setup() warn: passing zero to 'dev_err_probe'
Message-ID: <20260928093816.00002894@oss.qualcomm.com>
In-Reply-To: <202609270219.cCECv2b8-lkp@intel.com>
References: <202609270219.cCECv2b8-lkp@intel.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Ks8hu-157mC2JdLTdgCHE2brfgXetQ4
X-Proofpoint-GUID: 6Ks8hu-157mC2JdLTdgCHE2brfgXetQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX7Y1eRLhMzRs0
 gHn/8j8CUAeorpXhW8yw0bjqAVSvxCNiy16R94KdqPkrCE+lLrfuEPhWX2D/KlaqvZrrglZSMum
 ODnnq3DepZXlbHTfjWjIuQCBIhizvfZtwqqM1llo1hsvW4N9QuMYKXWHxnyjFNLQACWuxsQfozG
 tFP4o3zlwf0OoLCnnwSPbzDHdFz5en+nkEAbJFai6QtbRumDzj0HpKjG2yaqvTNk4z9hezEOBCW
 cYETDn0pGeGh2Lq5TJ9kixyl0QFmwPkpfy3QhvdgE3VScyWM1QerJz/xuBzFe1BYfYYrTffuPEE
 L4qAyzdDkcctwl6FIxaEM1qJBaOyVzzKrDy0K3lurj5+/2be+WzJLa1vj36Z0jSKpKHUf1d5bps
 Iza6WKPohfuCo3zf33hosRA6oUZbBoKHX/nJQI2LzDOUANNfwbl9eR5429cIYL06datnRnf1PiN
 ymgNNR9m0IQyn5mzN0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX6GGONVS6ZzDs
 tOe9/n4l7UVi/w4WUb7SNPq9RiyiEGw6CniXsx1OopcNS3XMlv6IueHzpdC1jCwuCnhuZwyUOMv
 mDUaxLNz4Q6K+yJVnrFEZA3jqbg+zVU=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba97ff cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=Olj5whoAGE1gubjfgVsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On Sun, 27 Sep 2026 17:49:30 +0300
Dan Carpenter <error27@gmail.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   e5b9e42a20392b669097c8c4aa09c3aed82ba10c
> commit: 4f8ee49c28b1a537a23e64cfee6ff2e5ec616f7f [66/82] iio: magnetometer: ak8975: use temporary variable for struct device
> config: x86_64-randconfig-2200-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270219.cCECv2b8-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609270219.cCECv2b8-lkp@intel.com/
> 
> smatch warnings:
> drivers/iio/magnetometer/ak8975.c:627 ak8975_setup() warn: passing zero to 'dev_err_probe'
Fixed up and pushed out.

Thanks,

Jonathan
