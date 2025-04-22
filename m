Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD91E9B39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318306; cv=none; b=Xmo4FwDSjzKqR6vggEt8WwpkNNxa0/jPU9rI2nTNV9aTGZFYaF1IpQU2UicejA5ajbR3sWogpsS9u0q2g+uiZs1Rtv2peLYmsgmfgC6orMcCPjvqr/FdRwjyNpfl42I8SnevxtI9RMZEQr2Xe8fjQvEf3pDAHO5Yl18iPmVYGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318306; c=relaxed/simple;
	bh=XEKQFOUz0r+lkB334Xmf1t8VJTOTjIeoesyqTdAc4Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Y1k9Vq+BG08Hr51ZXKgdBrxYBM5Xk2fkIhc0oc63WjUDj3vj3ieFtFjkBUmwjszioV6y31LFFcNEHwFNBpcYet0CfysqgGxtv7YCxxDU3vJ6TwTUZbonf+ZRTeeo+jhrHswNU+GwyV3OjCbk1MNWMRUj1T54Q4RGcHmm6ZlSkfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TUU6vf2G; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TUU6vf2G"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250422103821euoutp01d51f0f7788fce05c5041f10e115b516e~4nb_F9Uwu1233412334euoutp01c
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 10:38:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250422103821euoutp01d51f0f7788fce05c5041f10e115b516e~4nb_F9Uwu1233412334euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745318301;
	bh=z/ENEV4xPTu1maqH4EBsFU2gbhVHlIjIlV2rBjywmGs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TUU6vf2GZeAoS2jOiFlGle2LVoSMAbYMJXc4jzAcy6w6u8wr7CJzEdDFhzEc1e3t+
	 WXmM3HOZT9wb5mwyDUm1QIYXTMeEEchnseI08oXtfoAfxB5EItssvqDZXVGKGaq2bq
	 NDsT2xFNg9nRfujo3g1OPnyMXUSEpn0ersyc0yBg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250422103821eucas1p274fccfa610765c7b78e869b664062b97~4nb9_wRWQ1787417874eucas1p2k;
	Tue, 22 Apr 2025 10:38:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 25.FF.17807.D9177086; Tue, 22
	Apr 2025 11:38:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250422103821eucas1p1caae71903c23a53935297ff3e5b6d417~4nb9pjS4T1799617996eucas1p13;
	Tue, 22 Apr 2025 10:38:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250422103821eusmtrp2396ebf59b201ea80796c55d0dca5ab37~4nb9pFRnm1834618346eusmtrp2O;
	Tue, 22 Apr 2025 10:38:21 +0000 (GMT)
X-AuditID: cbfec7f4-1e9ff7000000458f-8d-6807719d8048
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 57.25.19654.C9177086; Tue, 22
	Apr 2025 11:38:20 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250422103820eusmtip289d759aefe873f9677689bff6ab8ba26~4nb9EPROB1249012490eusmtip2P;
	Tue, 22 Apr 2025 10:38:20 +0000 (GMT)
Message-ID: <007f34d4-9dba-48c9-bc63-fd13a3960ceb@samsung.com>
Date: Tue, 22 Apr 2025 12:38:19 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3573/4779] kernel/dma/mapping.c:922:
 warning: expecting prototype for dma_addressing_limited(). Prototype was for
 __dma_addressing_limited() instead
To: Balbir Singh <balbirs@nvidia.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <3d81befa-2066-48f5-9e24-2b7ceb079429@nvidia.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduznOd25hewZBud3ilgsmXuc2WLl6qNM
	Fq+aH7FZHFp5hcmBxWPxnpdMHi82z2T02H2zgc2jt/kdWwBLFJdNSmpOZllqkb5dAlfGp+2f
	WAq2yFR8np3WwLhJrIuRk0NCwERi+8w5TCC2kMAKRokPB+W6GLmA7C+MErc/vmCCcD4zSjTN
	P8EG0zGr4xUjRMdyRon7K9khij4ySkyY9wFsFK+AncT8G+/AilgEVCUebfrEAhEXlDg58wmY
	LSogL3H/1gywZmGBHYwSj46uYAdJiAh4SLR/agNrZhZwlDhwbzkzhC0ucevJfLAFbAKGEl1v
	u8Au4gRa1vBiJgtEjbzE9rdzmEGGSggc4JB49hlis4SAi8SWm8vZIWxhiVfHt0DZMhL/d85n
	gmhoZ5RY8Ps+lDOBUaLh+S1GiCpriTvnfgGt4wBaoSmxfpc+iCkBdN3+1hIIk0/ixltBiBv4
	JCZtm84MEeaV6GgTgpihJjHr+Dq4rQcvXGKewKg0CylYZiH5chaSb2YhrF3AyLKKUTy1tDg3
	PbXYKC+1XK84Mbe4NC9dLzk/dxMjMLWc/nf8yw7G5a8+6h1iZOJgPMQowcGsJML7y409Q4g3
	JbGyKrUoP76oNCe1+BCjNAeLkjjvov2t6UIC6YklqdmpqQWpRTBZJg5OqQYmX02+pV9aA74X
	rozR97whxnmyR5VdVCrmq+n5kx3SO7XWujP+K78jf3BSV/yx8zVy1y5oTHm+ZFVl5JmTK1Yc
	YN948MPX26vk01gE1X6IBs46vzqsZBdTF8uj6uuZyWLdgpuU/s/YKftttZiV1cFV3t48Ks3i
	HzYzZS8+VVXQPKV6S4zB4aNG7lfKug/tbbfceeeRrJ70w4XNF8v1dG/3Ze7Y3l5UtctsSdyc
	x7JfL98xcPnOtq7iWdVRx7wVxcc/qfI6hbzkeidb3dzi5bFbq/rf++wzcjXHd3PxdDyM6t1g
	1vP9aHvFnLokY4Vq9WJp876fK2Q3nD6rbDyxa+bjw98fvzn94vSRpOTYqQfdlFiKMxINtZiL
	ihMBiJzNjJwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7pzCtkzDP7tsrJYMvc4s8XK1UeZ
	LF41P2KzOLTyCpMDi8fiPS+ZPF5snsnosftmA5tHb/M7tgCWKD2bovzSklSFjPziElulaEML
	Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MT9s/sRRskan4PDutgXGTWBcjJ4eE
	gInErI5XjF2MXBxCAksZJR7c3MAOkZCRODmtgRXCFpb4c62LDaLoPaPE/vVbmEESvAJ2EvNv
	vGMEsVkEVCUebfrEAhEXlDg58wmYLSogL3H/1gx2kGZhgR2MEoeaX4NtEBHwkGj/1AbWzCzg
	KHHg3nJmiA07GSVufjjKDpEQl7j1ZD4TiM0mYCjR9RbkDE4OTqDNDS9mskDUmEl0be2CGiQv
	sf3tHOYJjEKzkBwyC8moWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMworYd
	+7llB+PKVx/1DjEycTAeYpTgYFYS4f3lxp4hxJuSWFmVWpQfX1Sak1p8iNEUGBoTmaVEk/OB
	MZ1XEm9oZmBqaGJmaWBqaWasJM7LduV8mpBAemJJanZqakFqEUwfEwenVAOTV8fmCYmNru/X
	eCse6nv+YmPXH/4FV7fveJzz0iy2uVCVV7Tk/EWdz1mMV1WD3v+4GXgn9vxf+0TV3oTbOVpl
	yzRVDjyosImIZzxh68zzaZo/a+ntGwsn6d1ffPdi0rqK3a+ef3hUcitsw8qGiqT39j+vT44P
	yxT9qnQhcfu97b+kKh0/bJzxjE/yy757F47EsKVV2rrKNQY3rDJ6yGH1Jlf5omZ8zpXCh7IC
	xt9l9vCU3OUzkjuiJVC0o+jFLEeH5k/ml/+cetJcdC/3TVP5M7UNin9kOrlDPwUUN+3pe927
	QyDx9/cNOccPCYo+nf3g0fcPSxRZQz4sOKwRsv7rhq0PTv3cJXldZQ/HnxjhqUosxRmJhlrM
	RcWJANKZDI8xAwAA
X-CMS-MailID: 20250422103821eucas1p1caae71903c23a53935297ff3e5b6d417
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250419012650eucas1p145a5f52fc668a3ae87e08a3e8395ef04
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250419012650eucas1p145a5f52fc668a3ae87e08a3e8395ef04
References: <202504190615.g9fANxHw-lkp@intel.com>
	<CGME20250419012650eucas1p145a5f52fc668a3ae87e08a3e8395ef04@eucas1p1.samsung.com>
	<3d81befa-2066-48f5-9e24-2b7ceb079429@nvidia.com>

On 19.04.2025 03:26, Balbir Singh wrote:
> On 4/19/25 08:07, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
>> commit: 2042c352e21d19eaf5f9e22fb6afce72293ef28c [3573/4779] dma/mapping.c: dev_dbg support for dma_addressing_limited
>> config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504190615.g9fANxHw-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> kernel/dma/mapping.c:922: warning: expecting prototype for dma_addressing_limited(). Prototype was for __dma_addressing_limited() instead
>>
>> vim +922 kernel/dma/mapping.c
>>
>> 8ddbe5943c0b12 Christoph Hellwig 2018-12-06  912
>> 8ae0e970319ac0 Jia He            2023-10-28  913  /**
>> 8ae0e970319ac0 Jia He            2023-10-28  914   * dma_addressing_limited - return if the device is addressing limited
>> 8ae0e970319ac0 Jia He            2023-10-28  915   * @dev:	device to check
>> 8ae0e970319ac0 Jia He            2023-10-28  916   *
>> 8ae0e970319ac0 Jia He            2023-10-28  917   * Return %true if the devices DMA mask is too small to address all memory in
>> 8ae0e970319ac0 Jia He            2023-10-28  918   * the system, else %false.  Lack of addressing bits is the prime reason for
>> 8ae0e970319ac0 Jia He            2023-10-28  919   * bounce buffering, but might not be the only one.
>> 8ae0e970319ac0 Jia He            2023-10-28  920   */
>> 2042c352e21d19 Balbir Singh      2025-04-14  921  static bool __dma_addressing_limited(struct device *dev)
>> 8ae0e970319ac0 Jia He            2023-10-28 @922  {
>> a409d9600959f3 Jia He            2023-10-28  923  	const struct dma_map_ops *ops = get_dma_ops(dev);
>> a409d9600959f3 Jia He            2023-10-28  924
>> a409d9600959f3 Jia He            2023-10-28  925  	if (min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
>> a409d9600959f3 Jia He            2023-10-28  926  			 dma_get_required_mask(dev))
>> a409d9600959f3 Jia He            2023-10-28  927  		return true;
>> a409d9600959f3 Jia He            2023-10-28  928
>> b348b6d17fd1d5 Leon Romanovsky   2024-09-22  929  	if (unlikely(ops) || use_dma_iommu(dev))
>> a409d9600959f3 Jia He            2023-10-28  930  		return false;
>> a409d9600959f3 Jia He            2023-10-28  931  	return !dma_direct_all_ram_mapped(dev);
>> 8ae0e970319ac0 Jia He            2023-10-28  932  }
>> 2042c352e21d19 Balbir Singh      2025-04-14  933
>>
>> :::::: The code at line 922 was first introduced by commit
>> :::::: 8ae0e970319ac0b516d285650a744bab4ed3dd37 dma-mapping: move dma_addressing_limited() out of line
>>
>> :::::: TO: Jia He <justin.he@arm.com>
>> :::::: CC: Christoph Hellwig <hch@lst.de>
>>
>
> I can't reproduce this warning with gcc 14.2.1 on my system with W=1. Assuming that the warning is for the
> kerneldoc, I can send a patch out to move it to the right function

Well, the warnings might depend on the installed plugins. Please move 
the kerneldoc to the right function.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

